Return-Path: <gyurco@freemail.hu>
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id E18BC760B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 21:01:00 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id 21874800E6;
	Fri, 19 Aug 2016 23:00:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JOUpc93hF1i1; Fri, 19 Aug 2016 23:00:57 +0200 (CEST)
Received: from gyurco.lan (unknown [10.8.0.14])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id 3D0A1800CA;
	Fri, 19 Aug 2016 23:00:57 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2016 23:00:36 +0200
Message-Id: <1471640436-11211-1-git-send-email-gyurco@freemail.hu>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCHv3 2/2] nginx.inc: use 4 spaces for indentation
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
X-List-Received-Date: Fri, 19 Aug 2016 21:01:01 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* like any other sane recipes do

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 194 ++++++++++++++-------------
 1 file changed, 98 insertions(+), 96 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 7698c90..f3660af 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -12,12 +12,12 @@ SECTION = "net"
 DEPENDS = "libpcre gzip openssl"
 
 SRC_URI = " \
-	http://nginx.org/download/nginx-${PV}.tar.gz \
-	file://nginx-cross.patch \
-	file://nginx.conf \
-	file://nginx.init \
-	file://nginx-volatile.conf \
-	file://nginx.service \
+    http://nginx.org/download/nginx-${PV}.tar.gz \
+    file://nginx-cross.patch \
+    file://nginx.conf \
+    file://nginx.init \
+    file://nginx-volatile.conf \
+    file://nginx.service \
 "
 
 inherit update-rc.d useradd
@@ -34,104 +34,106 @@ DISABLE_STATIC = ""
 PACKAGECONFIG[http2] = "--with-http_v2_module,,"
 
 do_configure () {
-	if [ "${SITEINFO_BITS}" = "64" ]; then
-		PTRSIZE=8
-	else
-		PTRSIZE=4
-	fi
-
-	echo $CFLAGS
-	echo $LDFLAGS
-
-	# Add the LDFLAGS to the main nginx link to avoid issues with missing GNU_HASH
-	echo "MAIN_LINK=\"\${MAIN_LINK} ${LDFLAGS}\"" >> auto/cc/conf
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
+    if [ "${SITEINFO_BITS}" = "64" ]; then
+        PTRSIZE=8
+    else
+        PTRSIZE=4
+    fi
+
+    echo $CFLAGS
+    echo $LDFLAGS
+
+    # Add the LDFLAGS to the main nginx link to avoid issues with missing GNU_HASH
+    echo "MAIN_LINK=\"\${MAIN_LINK} ${LDFLAGS}\"" >> auto/cc/conf
+
+    ./configure \
+    --crossbuild=Linux:${TUNE_ARCH} \
+    --with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+    --with-int=4 \
+    --with-long=${PTRSIZE} \
+    --with-long-long=8 \
+    --with-ptr-size=${PTRSIZE} \
+    --with-sig-atomic-t=${PTRSIZE} \
+    --with-size-t=${PTRSIZE} \
+    --with-off-t=${PTRSIZE} \
+    --with-time-t=${PTRSIZE} \
+    --with-sys-nerr=132 \
+    --conf-path=${sysconfdir}/nginx/nginx.conf \
+    --http-log-path=${localstatedir}/log/nginx/access.log \
+    --error-log-path=${localstatedir}/log/nginx/error.log \
+    --pid-path=/run/nginx/nginx.pid \
+    --prefix=${prefix} \
+    --with-http_ssl_module \
+    --with-http_gzip_static_module \
+    ${EXTRA_OECONF}
 }
 
 do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-	rm -fr ${D}${localstatedir}/run ${D}/run
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		install -d ${D}${sysconfdir}/tmpfiles.d
-		echo "d /run/${BPN} - - - -" \
-		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
-                echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
-                     >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
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
-	sed -i 's/^user.*/user ${NGINX_USER};/g' ${D}${sysconfdir}/nginx/nginx.conf
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
-                    -e 's,@SBINDIR@,${sbindir},g' \
-                    ${D}${systemd_unitdir}/system/nginx.service
-        fi
+    oe_runmake 'DESTDIR=${D}' install
+    rm -fr ${D}${localstatedir}/run ${D}/run
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /run/${BPN} - - - -" \
+            > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+        echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
+            >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+    fi
+    install -d ${D}${sysconfdir}/${BPN}
+    ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
+    install -d ${D}${NGINX_WWWDIR}
+    mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
+    chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
+
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
+    sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${sysconfdir}/init.d/nginx
+    sed -i 's,/etc/,${sysconfdir}/,g'  ${D}${sysconfdir}/init.d/nginx
+
+    install -d ${D}${sysconfdir}/nginx
+    install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
+    sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
+    sed -i 's/^user.*/user ${NGINX_USER};/g' ${D}${sysconfdir}/nginx/nginx.conf
+    install -d ${D}${sysconfdir}/nginx/sites-enabled
+
+    install -d ${D}${sysconfdir}/default/volatiles
+    install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/default/volatiles/99_nginx
+    sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatiles/99_nginx
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir}/system/
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+                -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+                -e 's,@SBINDIR@,${sbindir},g' \
+                ${D}${systemd_unitdir}/system/nginx.service
+    fi
 }
 
 pkg_postinst_${PN} () {
-	if [ -z "$D" ]; then
-		if type systemd-tmpfiles >/dev/null; then
-			systemd-tmpfiles --create
-		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
-			${sysconfdir}/init.d/populate-volatile.sh update
-		fi
-	fi
+    if [ -z "$D" ]; then
+        if type systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
+    fi
 }
 
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
+FILES_${PN} += " \
+    ${localstatedir}/ \
+    ${systemd_unitdir}/system/nginx.service \
+"
+
+CONFFILES_${PN} = " \
+    ${sysconfdir}/nginx/nginx.conf \
+    ${sysconfdir}/nginx/fastcgi.conf \
+    ${sysconfdir}/nginx/fastcgi_params \
+    ${sysconfdir}/nginx/koi-utf \
+    ${sysconfdir}/nginx/koi-win \
+    ${sysconfdir}/nginx/mime.types \
+    ${sysconfdir}/nginx/scgi_params \
+    ${sysconfdir}/nginx/uwsgi_params \
+    ${sysconfdir}/nginx/win-utf \
 "
 
 INITSCRIPT_NAME = "nginx"
-- 
2.7.4


