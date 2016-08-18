Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A5D73769F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:09:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so252379wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WuWMMBU4/20ws6OjlPhEaf2YMBy8lpXd8mc2O0D56IE=;
	b=s0wqLIZK70RtGYR6LLS1oSNzb+Lxln8KIttkK2DBeT2xgLr54jKV8Z7LgGeHc7rd1G
	4r3zERXyKyIDG+XPFc1OZwsVkPan7uQfHTz1FGntMQkJSM/vrT0C08IBvrposrHz8c/Q
	ZRack75eJGhaO4eGGDIKR5Lf+W7J3hIBo6H/FkUGi3F68vLQ2CTxOGQMhixx7X4OTwAW
	BgEHPzAA+ynI/Kq1NRLXO7Hl/w2bc/GqlPJhNltnia7LfDVkWjaJIIF4JYOiW3dTrWBT
	9/Mf4x8h7p+LCTtrM7z0y8Xcy0fTLfsW7A4VewwfRZDChZ4zf4itZQRhELOdGjbcOxjU
	EmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WuWMMBU4/20ws6OjlPhEaf2YMBy8lpXd8mc2O0D56IE=;
	b=iKw8QNZxPQxDQ4H2TuI2Q5nv37G7qTOgl0PB0I8utT8mgz2vXSEZRgV5FJOj1CAUkO
	LgWGeuQn80gGksJEsH0lPMIv0rKKzmJkqCU4b0MCgthnIGxxrJCU9U1Ep2blPxkS1en5
	iZ3+GEINPObxahmZE6BJcduINqoDobOTqRfdY+s9W3THKOdSPVUFy2rSPaGP8gujNiT8
	lUzk4kjMxuG3+R4TyjzIfrrYmbopJHXx7C54nOQHYwSNyQ/bi7PvEC4KzI2E3ZBeaDgP
	bAFdcIBHr4cQ7b4RRZPNdYH8fJA99ia50rklgQeG4ZxxaFcih/m4fdCWBCI7PtLEBLvC
	asLg==
X-Gm-Message-State: AEkoouvoOzR8KCeDgURkLLSXcS0kdzVbM1A0bx5CuNiZyH82mGt9VD3cM4WCXNkkAiFUJQ==
X-Received: by 10.194.97.17 with SMTP id dw17mr2809224wjb.8.1471536587048;
	Thu, 18 Aug 2016 09:09:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id x6sm2886829wjk.26.2016.08.18.09.09.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 09:09:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 18:09:39 +0200
Message-Id: <20160818160939.4390-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160818160939.4390-1-Martin.Jansa@gmail.com>
References: <20160818160002.ydacjrbdyknjmcwa@jama>
	<20160818160939.4390-1-Martin.Jansa@gmail.com>
Subject: [meta-webserver][PATCHv2 2/2] nginx.inc: use 4 spaces for indentation
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
X-List-Received-Date: Thu, 18 Aug 2016 16:09:47 -0000

* like any other sane recipes do

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 190 ++++++++++++++-------------
 1 file changed, 96 insertions(+), 94 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 334a6d8..39ca771 100644
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
@@ -34,102 +34,104 @@ DISABLE_STATIC = ""
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
-		echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
-			>> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
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
-                    -e 's,@BASEBINDIR@,${base_bindir},g' \
-                    ${D}${systemd_unitdir}/system/nginx.service
-        fi
+    oe_runmake 'DESTDIR=${D}' install
+    rm -fr ${D}${localstatedir}/run ${D}/run
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
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
+            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+            -e 's,@BASEBINDIR@,${base_bindir},g' \
+            ${D}${systemd_unitdir}/system/nginx.service
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
2.9.2


