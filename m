Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPWHm-0007oF-Qh
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 11:55:50 +0200
Received: by wibhj13 with SMTP id hj13so348602wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=uOQ23T5HAXuUN/I9Xq+SAaXVn3gnAIGi2fLNLngEIsQ=;
	b=ggtTT+89xNynX4QKoUrW7CmD/umXRLtfDhaYIopK7XTCrq8qS3HLdMW4xL7VQ32wBg
	LQBbJXqerXSgd1A5JsVSB4933cVqr5a6JwDPFL+qdJeZiZbCkN1Zuf2RnIDd+fkn5dku
	JqI2gOU03h1TeEFaMQI7F9r8jkIJzHJsOhHNEdKuWRkuZ7d7tZgHbTL3gTEx3MbOVjW2
	16Y5yiB2bh3AieVCfArh7qUj/kFSMIzr95MUfhpkQkJajp9bixOLiB7v1HqLK08RkDYI
	ye7vk6U0gMwxB+fAhPpN0n9jow9cDr/nBbAftM+A3um9ldH7Jn4hAVAQpJ7MDllJwZ6H
	a8Eg==
Received: by 10.180.101.136 with SMTP id fg8mr12580298wib.4.1335951966926;
	Wed, 02 May 2012 02:46:06 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ea6sm43146192wib.5.2012.05.02.02.46.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 02:46:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2012 11:45:32 +0200
Message-Id: <1335951932-6143-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk1mbOYvMlTJad4F7Xni8TJyEmpTXJKumX8cOtmWpl+2jIQiIAPIIE3wMNMEodSVcgJluwB
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe/denzil][PATCH 6/6] libgcc-4.5: Fix nativesdk build problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 09:55:51 -0000

From: Khem Raj <raj.khem@gmail.com>

We need to use BPN instead of PN so we
access libgcc and not libgcc-nativesdk

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Tested-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb |   32 +++++++++++---------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
index ecef5e7..3f63931 100644
--- a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
+++ b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
@@ -4,11 +4,14 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+
 PACKAGES = "\
   ${PN} \
   ${PN}-dev \
   ${PN}-dbg \
-  libgcov-dev \
+  libgcov${PKGSUFFIX}-dev \
   "
 
 FILES_${PN} = "${base_libdir}/libgcc*.so.*"
@@ -16,31 +19,31 @@ FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
-FILES_libgcov-dev = " \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a"
-
+FILES_libgcov${PKGSUFFIX}-dev = " \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
+  "
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
 do_configure () {
 	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
 	install -d ${D}${base_libdir} ${D}${libdir}
 	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
-	mkdir -p ${B}/${PN}
-	cd ${B}/${PN}
-	chmod a+x ${S}/${PN}/configure
-	${S}/${PN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+	mkdir -p ${B}/${BPN}
+	cd ${B}/${BPN}
+	chmod a+x ${S}/${BPN}/configure
+	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 }
 
 do_compile () {
 	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
-	cd ${B}/${PN}
-	oe_runmake MULTIBUILDTOP=${B}/$target/${PN}/
+	cd ${B}/${BPN}
+	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/
 }
 
 do_install () {
 	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
-	cd ${B}/${PN}
-	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${PN}/ install
+	cd ${B}/${BPN}
+	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
 
 	# Move libgcc_s into /lib
 	mkdir -p ${D}${base_libdir}
@@ -63,5 +66,6 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
 
 BBCLASSEXTEND = "nativesdk"
 
-INSANE_SKIP_libgcc-dev = "staticdev"
-INSANE_SKIP_libgcov-dev = "staticdev"
+INSANE_SKIP_${PN}-dev = "staticdev"
+INSANE_SKIP_libgcov${PKGSUFFIX}-dev = "staticdev"
+
-- 
1.7.10



