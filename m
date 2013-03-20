Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UIF90-00018r-1d
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 10:17:15 +0100
Received: by mail-da0-f45.google.com with SMTP id v40so868708dad.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=fKkJeRt8kpxjrfbQ7+Wf4dMTSeywXXo1DIWtIaaEbGw=;
	b=gmn7P+jU7JSiKARotu3huWQXYSz0m9XI1rVERXK6mLPKUdzLYajPnjizqH/vePXoLG
	FAqltpRXARRe17DscMhnnbqM7HY8BlTCc+WMsfiI7R47vYvVEt9BRG/UNwpDbwYfev/M
	8f911aPUgYhg9ibK2aaBWUKFOvAnQCWfy+2yzGRstZ/kSXUqYEBb5NOo5LwN2ySABb91
	eZGjE4xlt4jC84RiMJGVR7m7cIGRCMgXhtFcyvo+w82IKKBanbm/E0YgVggZKcOktww0
	wIaA/KGx+9THSn6f34dtMGG/4Nva8h4uLij0p0RyZ6Hpb38fix1Mn15/D+RKvr5T/jBq
	QQFA==
X-Received: by 10.66.49.229 with SMTP id x5mr7976367pan.185.1363770017541;
	Wed, 20 Mar 2013 02:00:17 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id t1sm1476139pab.12.2013.03.20.02.00.16
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 02:00:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Mar 2013 01:59:56 -0700
Message-Id: <1363769996-20782-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-opie][PATCH] recipes: Turn ALLOW_EMPTY to be package specific
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
X-List-Received-Date: Wed, 20 Mar 2013 09:17:16 -0000

Fixes QA warnings during parse

ERROR: QA Issue:
/b/kraj/angstrom/sources/meta-opie/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb:
Variable ALLOW_EMPTY is set as not being package specific, please fix
this.
ERROR: QA Issue:
/b/kraj/angstrom/sources/meta-opie/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb:
Variable ALLOW_EMPTY is set as not being package specific, please fix
this.
ERROR: QA Issue:
/b/kraj/angstrom/sources/meta-opie/recipes-opie/opie-mediaplayer1/opie-mediaplayer1_git.bb:
Variable ALLOW_EMPTY is set as not being package specific, please fix
this.
ERROR: QA Issue:
/b/kraj/angstrom/sources/meta-opie/recipes-opie/opie-mediaplayer1/opie-mediaplayer1_1.2.5.bb:
Variable ALLOW_EMPTY is set as not being package specific, please fix
this.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-opie/opie-help-en/opie-help-en.inc         |    2 +-
 .../opie-mediaplayer1/opie-mediaplayer1.inc        |    2 +-
 .../nativesdk-packagegroup-opie-toolchain-host.bb  |    2 +-
 .../packagegroup-opie-toolchain-target.bb          |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-opie/opie-help-en/opie-help-en.inc b/recipes-opie/opie-help-en/opie-help-en.inc
index 30295f3..6c0ae6c 100644
--- a/recipes-opie/opie-help-en/opie-help-en.inc
+++ b/recipes-opie/opie-help-en/opie-help-en.inc
@@ -3,7 +3,7 @@ SECTION = "opie/help"
 LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
-ALLOW_EMPTY = "1"
+ALLOW_EMPTY_${PN} = "1"
 PACKAGE_ARCH = "all"
 
 PACKAGES += "${PN}"
diff --git a/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc b/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc
index 22b1069..df35e37 100644
--- a/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc
+++ b/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "The classic Opie media player (core+plugins)."
 LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
-ALLOW_EMPTY = "1"
+ALLOW_EMPTY_${PN} = "1"
 PACKAGE_ARCH = "all"
 RDEPENDS_${PN} = "opie-mediaplayer1-core"
 RRECOMMENDS_${PN} = "opie-mediaplayer1-libmadplugin opie-mediaplayer1-libwavplugin \
diff --git a/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb b/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb
index 52693ba..c97f84a 100644
--- a/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb
+++ b/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb
@@ -3,6 +3,6 @@ require recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
 DESCRIPTION = "Host packages for Opie SDK"
 PR = "r3"
 LICENSE = "MIT"
-ALLOW_EMPTY = "1"
+ALLOW_EMPTY_${PN} = "1"
 
 RDEPENDS_${PN} += "nativesdk-qmake nativesdk-uicmoc"
diff --git a/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb b/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb
index ca42e0d..04fa21d 100644
--- a/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb
+++ b/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Target packages for Opie SDK"
 PR = "r7"
 LICENSE = "MIT"
-ALLOW_EMPTY = "1"
+ALLOW_EMPTY_${PN} = "1"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-- 
1.7.9.5



