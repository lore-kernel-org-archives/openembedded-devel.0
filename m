Received: from [209.85.220.213] (helo=mail-fx0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsg4-0000ej-44
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:56 +0200
Received: by mail-fx0-f213.google.com with SMTP id 9so74430fxm.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=AVD/TqUvMbMuAOL5+naMAF66QTtP644/gM0LF/k6pCE=;
	b=fOZHv69J2UGwbIA/KSoOOm8ck/dUYEj8sgPSVKtI93iE0WU81aNlcmRuCnWaqbUos3
	XkJk+UNkvmWcbibOhjMb2v7fbYL4eXWVidMR0utz648PVsyYlYsmY40UR7pSCn9UdNUC
	ypOjj7097J2L0FUZuouvlbfJnHiMFLSVIsbVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nXsf/AwWMF5zzSr7xb+N3j9IorKWytfB2zcGojA879FZW+Zc4FDN3Q/L5YoTaea2cI
	pgPSmNsIpEONBULNinBDbi249sdbzuafSZy657GUH7/g4tBdcAnd/bF77UDKIk6rVqth
	rd9ISQJe0rXaqoCC6m7nndBbv76Z1u3AvrtqU=
Received: by 10.103.217.7 with SMTP id u7mr697573muq.121.1244043479089;
	Wed, 03 Jun 2009 08:37:59 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id u26sm1150731mug.52.2009.06.03.08.37.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:37:58 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:18 +0300
Message-Id: <1244043442-3868-9-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-8-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-8-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 08/12] qt4: package all installed files
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
X-List-Received-Date: Wed, 03 Jun 2009 15:46:56 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4.inc |   29 +++++++++++++++++++++++------
 1 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index 629f5c5..a6a2bfc 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -31,7 +31,7 @@ python __anonymous () {
     dev_packages = []
     dbg_packages = []
     for name in bb.data.getVar("QT_LIB_NAMES", d, 1).split():
-        pkg = "${QT_BASE_LIB}"+ name.lower().replace("qt", "") + "4"
+        pkg = "${QT_BASE_LIB}" + name.lower().replace("qt", "") + "4"
         # NOTE: the headers for QtAssistantClient are different
         incname = name.replace("QtAssistantClient", "QtAssistant")
         bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
@@ -45,6 +45,9 @@ python __anonymous () {
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
         dbg_packages.append("%s-dbg" % pkg)
+    for name in bb.data.getVar("OTHER_PACKAGES", d, 1).split():
+        dbg_packages.append("%s-dbg" % name)
+
     bb.data.setVar("LIB_PACKAGES", " ".join(lib_packages), d)
     bb.data.setVar("DEV_PACKAGES", " ".join(dev_packages), d)
     bb.data.setVar("DBG_PACKAGES", " ".join(dbg_packages), d)
@@ -59,7 +62,9 @@ OTHER_PACKAGES = "\
              ${QT_BASE_NAME}-examples \
              ${QT_BASE_NAME}-fonts \
              ${QT_BASE_NAME}-linguist \
-             ${QT_BASE_NAME}-pixeltool"
+             ${QT_BASE_NAME}-makeqpf \
+             ${QT_BASE_NAME}-pixeltool \
+             ${QT_BASE_NAME}-qt3to4"
 
 PACKAGES += "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_PACKAGES}"
 PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-*  ${QT_BASE_NAME}-translation-*"
@@ -67,20 +72,32 @@ PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-*  ${QT_BASE_NAME}-translation-*"
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}     = ""
 FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
-FILES_${PN}-dbg = "${bindir}/*/.debug"
+FILES_${PN}-dbg = ""
 RRECOMMENDS_${PN} = "${LIB_PACKAGES} ${OTHER_PACKAGES}"
 RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
 RRECOMMENDS_${PN}-dbg = "${DBG_PACKAGES}"
 
-FILES_${QT_BASE_NAME}-assistant            = "${bindir}/*assistant*"
+FILES_${QT_BASE_NAME}-assistant            = "${bindir}/*assistant* ${bindir}/qcollectiongenerator ${bindir}/qhelpconverter ${bindir}/qhelpgenerator"
+FILES_${QT_BASE_NAME}-assistant-dbg        = "${bindir}/.debug/*assistant* ${bindir}/.debug/qcollectiongenerator ${bindir}/.debug/qhelpconverter ${bindir}/.debug/qhelpgenerator"
 FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
+FILES_${QT_BASE_NAME}-common-dbg           = "${bindir}/.debug/qtconfig"
 FILES_${QT_BASE_NAME}-dbus                 = "${bindir}/qdbus ${bindir}/qdbusxml2cpp ${bindir}/qdbuscpp2xml ${bindir}/qdbusviewer"
+FILES_${QT_BASE_NAME}-dbus-dbg             = "${bindir}/.debug/qdbus ${bindir}/.debug/qdbusxml2cpp ${bindir}/.debug/qdbuscpp2xml ${bindir}/.debug/qdbusviewer"
 FILES_${QT_BASE_NAME}-demos                = "${bindir}/qtdemo ${bindir}/${QT_DIR_NAME}/demos/*"
+FILES_${QT_BASE_NAME}-demos-dbg            = "${bindir}/.debug/qtdemo ${bindir}/${QT_DIR_NAME}/demos/.debug/*"
 FILES_${QT_BASE_NAME}-designer             = "${bindir}/*designer*"
+FILES_${QT_BASE_NAME}-designer-dbg         = "${bindir}/.debug/*designer*"
 FILES_${QT_BASE_NAME}-examples             = "${bindir}/${QT_DIR_NAME}/examples/*"
+FILES_${QT_BASE_NAME}-examples-dbg         = "${bindir}/${QT_DIR_NAME}/examples/.debug/*"
 FILES_${QT_BASE_NAME}-fonts                = "${libdir}/fonts"
-FILES_${QT_BASE_NAME}-linguist             = "${bindir}/*linguist* ${bindir}/lrelease ${bindir}/lupdate ${bindir}/qm2ts"
+FILES_${QT_BASE_NAME}-linguist             = "${bindir}/*linguist* ${bindir}/lrelease ${bindir}/lupdate ${bindir}/lconvert ${bindir}/qm2ts"
+FILES_${QT_BASE_NAME}-linguist-dbg         = "${bindir}/.debug/*linguist* ${bindir}/.debug/lrelease ${bindir}/.debug/lupdate ${bindir}/.debug/lconvert ${bindir}/.debug/qm2ts"
 FILES_${QT_BASE_NAME}-pixeltool            = "${bindir}/pixeltool"
+FILES_${QT_BASE_NAME}-pixeltool-dbg        = "${bindir}/.debug/pixeltool"
+FILES_${QT_BASE_NAME}-qt3to4               = "${bindir}/qt3to4 ${datadir}/${QT_DIR_NAME}/q3porting.xml"
+FILES_${QT_BASE_NAME}-qt3to4-dbg           = "${bindir}/.debug/qt3to4"
+FILES_${QT_BASE_NAME}-makeqpf              = "${bindir}/makeqpf"
+FILES_${QT_BASE_NAME}-makeqpf-dbg          = "${bindir}/.debug/makeqpf"
 
 
 do_configure() {
@@ -136,7 +153,7 @@ do_compile() {
 python populate_packages_prepend() {
         translation_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/translations/', d)
         translation_name = bb.data.expand('${QT_BASE_NAME}-translation-%s', d)
-        do_split_packages(d, translation_dir, '^qt_(.*)\.qm$', translation_name, '${PN} translation for %s', extra_depends='' )
+        do_split_packages(d, translation_dir, '^(assistant|designer|linguist|qt|qtconfig|qvfb)_(.*)\.qm$', translation_name, '${PN} translation for %s', extra_depends='' )
  
         phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
         phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
-- 
1.6.3.1



