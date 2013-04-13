Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nj-0007Wb-VW
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:43 +0200
Received: by mail-ea0-f173.google.com with SMTP id k11so1555318eaj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=mchgZFrHduEPh9RPNXU1Y+7WOtZ8C208qE8eQCvq7qI=;
	b=R0hLyTOBdwBz7fG+2YCUf+VVZGxXV2LaTw7jUhrR8N+Uffn0knuJypHOxw95Pk8xI0
	o1TeADJ55/OmPuk/p3/vVeiyaoXto4KEWaqD4POQU3/mp6PXGbfT0qmMdc4IaHuIrTgP
	dZmViKItePKZiysaGFT0x5eHvtVJ6ffOFf7S68FRUAlRL44GQ0aHSsi1ETLB00z4suV3
	vuCFF9Sssuk/EvqByX4SfIKoQKUFSlAJtSUEGDqaqoWSRLdguVwFJS2Nx/26iQvanAu8
	Hzcv1J/v1i8iaWn/NfJ5KjjbJZ8lWivcm9PYZ6KYxu+Hq/awCKhHERtNRQTeWAebCxlP
	NN1A==
X-Received: by 10.14.223.137 with SMTP id v9mr10137666eep.4.1365859806307;
	Sat, 13 Apr 2013 06:30:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d47sm16435516eem.9.2013.04.13.06.30.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:30 +0200
Message-Id: <1365859790-20947-13-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 13/33] cloud9: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:48:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/cloud9/cloud9/cloud9.service    |  0
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb        | 13 ++++++++++++-
 .../recipes-devtools/cloud9/cloud9_0.6.bbappend      | 20 --------------------
 3 files changed, 12 insertions(+), 21 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-devtools/cloud9/cloud9/cloud9.service (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend

diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
rename to meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 0c07b12..9ae25bb 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -3,11 +3,13 @@ HOMEPAGE = "http://c9.io"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
-PR = "r2"
+PR = "r4"
 
 # Nodejs-native for node-waf, nodejs4-native for the headers
 DEPENDS = "libxml2 nodejs-native nodejs4-native"
 
+inherit systemd
+
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
            git://github.com/ajaxorg/ace.git;destsuffix=git/support/ace;name=ace \
@@ -33,6 +35,7 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/UglifyJS.git;destsuffix=git/support/uglify-js;name=uglify-js \
            file://index.js \
            file://cloud9-avahi.service \
+           file://cloud9.service \
            file://0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch \
           "
 
@@ -97,6 +100,9 @@ do_install () {
 
   install -m 0755 -d ${D}${sysconfdir}/avahi/services/
   install -m 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/
+  
+  install -d ${D}${systemd_unitdir}/system
+  install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system
 }
 
 FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/.debug \
@@ -104,3 +110,8 @@ FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o
                    "
 
 RDEPENDS_${PN} = "nodejs4 nodejs gzip"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "cloud9.service"
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
deleted file mode 100644
index 50c6886..0000000
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 3}"
-
-inherit systemd
-
-SRC_URI += "file://cloud9.service"
-
-inherit systemd
-
-NATIVE_SYSTEMD_SUPPORT = "1"
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "cloud9.service"
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.8.1.5



