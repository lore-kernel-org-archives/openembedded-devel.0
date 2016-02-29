Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 12D607715E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:43:25 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u1T8hNDv017275
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 09:43:23 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.79.50])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u1T8hNMX030019;
	Mon, 29 Feb 2016 09:43:23 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Feb 2016 09:43:09 +0100
Message-Id: <1456735391-9764-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH v2 1/3] nginx: split parts out of the recipe into nginx.inc
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
X-List-Received-Date: Mon, 29 Feb 2016 08:43:26 -0000

nginx has two maintained branches.
- stable: is the long term maintained branch where only bugfixes occur
- mainline: is the branch where new features get added

This change is in preparation to support these two branches.
---
 meta-webserver/recipes-httpd/nginx/nginx.inc       | 137 +++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb | 137 +--------------------
 2 files changed, 139 insertions(+), 135 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx.inc

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
new file mode 100644
index 0000000..53e3235
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -0,0 +1,137 @@
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
+DISABLE_STATIC = ""
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
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
index 8b60e53..d76bd9e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
@@ -1,139 +1,6 @@
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
 SRC_URI[md5sum] = "76eb5853a1190e0cfc691aa21c545de3"
 SRC_URI[sha256sum] = "6a5c72f4afaf57a6db064bba0965d72335f127481c5d4e64ee8714e7b368a51f"
 
-inherit update-rc.d useradd
-
-CFLAGS_append = " -fPIE -pie"
-CXXFLAGS_append = " -fPIE -pie"
-
-NGINX_WWWDIR ?= "${localstatedir}/www/localhost"
-NGINX_USER   ?= "www"
-
-EXTRA_OECONF = ""
-DISABLE_STATIC = ""
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
+DISABLE_STATIC = ""
\ No newline at end of file
-- 
2.1.4


