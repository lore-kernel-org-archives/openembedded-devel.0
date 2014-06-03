Return-Path: <chmorgan@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC27660F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jun 2014 19:30:32 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id c1so127446igq.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 12:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=9xK+Iu0KGuKmyLudIyzJAG6l392QhKrtourDMEeSgkU=;
	b=aG0M49hul0dUllgRMaqQNtstlClK6pgeo+T2WOLaleGwhNIvbplVYJcqM7PO3givyU
	qy96iEMB+/A63eoNLcnWLZMZisu87GSYLRP93lQtAn52O5u7cY+G/i16tc7TUJsap3J0
	V6e+nQ38KyQw7CNHm2j6oJmoz9deW3OuCFn8i6TVdmtCT3cl722775kmCX0Sogxulz1u
	TW1Dk3fIQLJUVDBRFdfxY3xMDLGgt3H4D6/vlLX5SjCPNZGN+sU4EJjIrxPT3YuMVe0u
	vf494CXrac+hsRhwrt0Xq313X38SsUgTR1nJ/3qPwudSikUobDXNWG8rju/kwtVpYIea
	cIsA==
X-Received: by 10.43.96.74 with SMTP id cf10mr16592631icc.40.1401823833477;
	Tue, 03 Jun 2014 12:30:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Tue, 3 Jun 2014 12:30:13 -0700 (PDT)
From: Chris Morgan <chmorgan@gmail.com>
Date: Tue, 3 Jun 2014 15:30:13 -0400
Message-ID: <CAAPegz2cKDB-xCHercOEBexnLyEVa18h4t+gW7hZVa7HOSfhuQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] Remove dfu-util svn recipes, these point at deprecated svn repositories, dfu-util uses git now
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jun 2014 19:30:39 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Chris Morgan <chmorgan@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb | 16 ----------------
 meta-oe/recipes-support/dfu-util/dfu-util_svn.bb        | 16 ----------------
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_svn.bb

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb
b/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb
deleted file mode 100644
index 4bed46a..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require dfu-util_${PV}.bb
-
-inherit native deploy
-do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
-
-DEPENDS = "libusb-compat usbpath-native"
-
-do_deploy() {
-    install -d ${DEPLOY_DIR_TOOLS}
-    install -m 0755 src/dfu-util_static ${DEPLOY_DIR_TOOLS}/dfu-util-${PV}
-    rm -f ${DEPLOY_DIR_TOOLS}/dfu-util
-    ln -sf ./dfu-util-${PV} ${DEPLOY_DIR_TOOLS}/dfu-util
-
-}
-
-addtask deploy before do_package after do_install
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
b/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
deleted file mode 100644
index 026a904..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "USB Device Firmware Upgrade utility"
-SECTION = "devel"
-AUTHOR = "Harald Welte <laforge@openmoko.org>"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-SRCREV = "4160"
-PV = "0.1+svnr${SRCPV}"
-PR = "r2"
-
-DEPENDS = "virtual/libusb0 usbpath"
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=dfu-util;protocol=http"
-S = "${WORKDIR}/dfu-util"
-
-inherit autotools
-
-- 
1.9.3

