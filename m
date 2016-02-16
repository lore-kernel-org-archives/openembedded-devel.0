Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id D44407318D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 11:41:07 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u1GBf6bv024553
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 12:41:07 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.41]
	(may be forged))
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u1GBevMC022560;
	Tue, 16 Feb 2016 12:41:06 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Feb 2016 12:40:44 +0100
Message-Id: <1455622845-14510-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455622845-14510-1-git-send-email-pascal.bach@siemens.com>
References: <1455622845-14510-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-webserver][PATCH 1/2] nginx: split parts out of the recipe into nginx.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Feb 2016 11:41:08 -0000

nginx has two maintained branches.
- stable: is the long term maintained branch where only bugfixes occur
- mainline: is the branch where new features get added

This change is in preparation to support these two branches.
---
 meta-webserver/recipes-httpd/nginx/nginx.inc       | 136 +++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb | 136 +--------------------
 2 files changed, 137 insertions(+), 135 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx.inc

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
new file mode 100644
index 0000000..a785e7b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -0,0 +1,136 @@
+SUMMARY = "HTTP and reverse proxy server"
+
+DESCRIPTION = "Nginx is a web server and a reverse proxy server for \
+HTTP, SMTP, POP3 and IMAP protocols, with a strong focus on high  \
+concurrency, performance and low memory usage."
+
+HOMEPAGE = "http://nginx.org/"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
+SECTION = "net"
+
+DEPENDS = "libpcre gzip openssl"
+
+SRC_URI = " \
+	http://nginx.org/download/nginx-${PV}.tar.gz \
+	file://nginx-cross.patch \
+	file://nginx.conf \
+	file://nginx.init \
+	file://nginx-volatile.conf \
+	file://nginx.service \
+"
+
+inherit update-rc.d useradd
+
+CFLAGS_append = " -fPIE -pie"
+CXXFLAGS_append = " -fPIE -pie"
+
+NGINX_WWWDIR ?= "${localstatedir}/www/localhost"
+NGINX_USER   ?= "www"
+
+EXTRA_OECONF = ""
+
+do_configure () {
+	if [ "${SITEINFO_BITS}" = "64" ]; then
+		PTRSIZE=8
+	else
+		PTRSIZE=4
+	fi
+
+	echo $CFLAGS
+	echo $LDFLAGS
+
+	./configure \
+	--crossbuild=Linux:${TUNE_ARCH} \
+	--with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+	--with-int=4 \
+	--with-long=${PTRSIZE} \
+	--with-long-long=8 \
+	--with-ptr-size=${PTRSIZE} \
+	--with-sig-atomic-t=${PTRSIZE} \
+	--with-size-t=${PTRSIZE} \
+	--with-off-t=${PTRSIZE} \
+	--with-time-t=${PTRSIZE} \
+	--with-sys-nerr=132 \
+	--conf-path=${sysconfdir}/nginx/nginx.conf \
+	--http-log-path=${localstatedir}/log/nginx/access.log \
+	--error-log-path=${localstatedir}/log/nginx/error.log \
+	--pid-path=/run/nginx/nginx.pid \
+	--prefix=${prefix} \
+	--with-http_ssl_module \
+	--with-http_gzip_static_module \
+	${EXTRA_OECONF}
+}
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+	rm -fr ${D}${localstatedir}/run ${D}/run
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /run/${BPN} - - - -" \
+		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+	fi
+	install -d ${D}${sysconfdir}/${BPN}
+	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
+	install -d ${D}${NGINX_WWWDIR}
+	mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
+	chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
+
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
+	sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${sysconfdir}/init.d/nginx
+	sed -i 's,/etc/,${sysconfdir}/,g'  ${D}${sysconfdir}/init.d/nginx
+
+	install -d ${D}${sysconfdir}/nginx
+	install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
+	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
+	install -d ${D}${sysconfdir}/nginx/sites-enabled
+
+	install -d ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/default/volatiles/99_nginx
+	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatiles/99_nginx
+
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
+            install -d ${D}${systemd_unitdir}/system
+            install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir}/system/
+            sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+                    -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+                    -e 's,@BASEBINDIR@,${base_bindir},g' \
+                    ${D}${systemd_unitdir}/system/nginx.service
+        fi
+}
+
+pkg_postinst_${PN} () {
+	if [ -z "$D" ]; then
+		if type systemd-tmpfiles >/dev/null; then
+			systemd-tmpfiles --create
+		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+			${sysconfdir}/init.d/populate-volatile.sh update
+		fi
+	fi
+}
+
+FILES_${PN} += "${localstatedir}/ \
+                ${systemd_unitdir}/system/nginx.service \
+                "
+
+CONFFILES_${PN} = "${sysconfdir}/nginx/nginx.conf \
+		${sysconfdir}/nginx/fastcgi.conf\
+		${sysconfdir}/nginx/fastcgi_params \
+		${sysconfdir}/nginx/koi-utf \
+		${sysconfdir}/nginx/koi-win \
+		${sysconfdir}/nginx/mime.types \
+		${sysconfdir}/nginx/scgi_params \
+		${sysconfdir}/nginx/uwsgi_params \
+		${sysconfdir}/nginx/win-utf \
+"
+
+INITSCRIPT_NAME = "nginx"
+INITSCRIPT_PARAMS = "defaults 92 20"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = " \
+    --system --no-create-home \
+    --home ${NGINX_WWWDIR} \
+    --groups www-data \
+    --user-group ${NGINX_USER}"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb
index 5d63d41..287aa97 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb
@@ -1,138 +1,4 @@
-SUMMARY = "HTTP and reverse proxy server"
+require nginx.inc
 
-DESCRIPTION = "Nginx is a web server and a reverse proxy server for \
-HTTP, SMTP, POP3 and IMAP protocols, with a strong focus on high  \
-concurrency, performance and low memory usage."
-
-HOMEPAGE = "http://nginx.org/"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
-SECTION = "net"
-
-DEPENDS = "libpcre gzip openssl"
-
-SRC_URI = " \
-	http://nginx.org/download/nginx-${PV}.tar.gz \
-	file://nginx-cross.patch \
-	file://nginx.conf \
-	file://nginx.init \
-	file://nginx-volatile.conf \
-	file://nginx.service \
-"
 SRC_URI[md5sum] = "64cc970988356a5e0fc4fcd1ab84fe57"
 SRC_URI[sha256sum] = "fb14d76844cab0a5a0880768be28965e74f9956790f618c454ef6098e26631d9"
-
-inherit update-rc.d useradd
-
-CFLAGS_append = " -fPIE -pie"
-CXXFLAGS_append = " -fPIE -pie"
-
-NGINX_WWWDIR ?= "${localstatedir}/www/localhost"
-NGINX_USER   ?= "www"
-
-EXTRA_OECONF = ""
-
-do_configure () {
-	if [ "${SITEINFO_BITS}" = "64" ]; then
-		PTRSIZE=8
-	else
-		PTRSIZE=4
-	fi
-
-	echo $CFLAGS
-	echo $LDFLAGS
-
-	./configure \
-	--crossbuild=Linux:${TUNE_ARCH} \
-	--with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
-	--with-int=4 \
-	--with-long=${PTRSIZE} \
-	--with-long-long=8 \
-	--with-ptr-size=${PTRSIZE} \
-	--with-sig-atomic-t=${PTRSIZE} \
-	--with-size-t=${PTRSIZE} \
-	--with-off-t=${PTRSIZE} \
-	--with-time-t=${PTRSIZE} \
-	--with-sys-nerr=132 \
-	--conf-path=${sysconfdir}/nginx/nginx.conf \
-	--http-log-path=${localstatedir}/log/nginx/access.log \
-	--error-log-path=${localstatedir}/log/nginx/error.log \
-	--pid-path=/run/nginx/nginx.pid \
-	--prefix=${prefix} \
-	--with-http_ssl_module \
-	--with-http_gzip_static_module \
-	${EXTRA_OECONF}
-}
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-	rm -fr ${D}${localstatedir}/run ${D}/run
-	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		install -d ${D}${sysconfdir}/tmpfiles.d
-		echo "d /run/${BPN} - - - -" \
-		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
-	fi
-	install -d ${D}${sysconfdir}/${BPN}
-	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
-	install -d ${D}${NGINX_WWWDIR}
-	mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
-	chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
-
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
-	sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${sysconfdir}/init.d/nginx
-	sed -i 's,/etc/,${sysconfdir}/,g'  ${D}${sysconfdir}/init.d/nginx
-
-	install -d ${D}${sysconfdir}/nginx
-	install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
-	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
-	install -d ${D}${sysconfdir}/nginx/sites-enabled
-
-	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/default/volatiles/99_nginx
-	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatiles/99_nginx
-
-        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
-            install -d ${D}${systemd_unitdir}/system
-            install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir}/system/
-            sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-                    -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
-                    -e 's,@BASEBINDIR@,${base_bindir},g' \
-                    ${D}${systemd_unitdir}/system/nginx.service
-        fi
-}
-
-pkg_postinst_${PN} () {
-	if [ -z "$D" ]; then
-		if type systemd-tmpfiles >/dev/null; then
-			systemd-tmpfiles --create
-		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
-			${sysconfdir}/init.d/populate-volatile.sh update
-		fi
-	fi
-}
-
-FILES_${PN} += "${localstatedir}/ \
-                ${systemd_unitdir}/system/nginx.service \
-                "
-
-CONFFILES_${PN} = "${sysconfdir}/nginx/nginx.conf \
-		${sysconfdir}/nginx/fastcgi.conf\
-		${sysconfdir}/nginx/fastcgi_params \
-		${sysconfdir}/nginx/koi-utf \
-		${sysconfdir}/nginx/koi-win \
-		${sysconfdir}/nginx/mime.types \
-		${sysconfdir}/nginx/scgi_params \
-		${sysconfdir}/nginx/uwsgi_params \
-		${sysconfdir}/nginx/win-utf \
-"
-
-INITSCRIPT_NAME = "nginx"
-INITSCRIPT_PARAMS = "defaults 92 20"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = " \
-    --system --no-create-home \
-    --home ${NGINX_WWWDIR} \
-    --groups www-data \
-    --user-group ${NGINX_USER}"
-- 
2.1.4


