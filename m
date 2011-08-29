Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <seba.dos1@gmail.com>) id 1Qy1q1-0001P5-5G
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 15:25:17 +0200
Received: by fxg11 with SMTP id 11so4563500fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2011 06:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=7wp8snOQjzd2dOZQQhtopGyWsPh09emooE3Detm+KJU=;
	b=Fx/8+2d272LlOfVEqINpGTl8LT6rESIpa/elmke9MlZUwFAkb5Y+Eu0/UzGe3/gear
	0PkHMJ1VnlltaqJ8LcWf7+86iFqg74laXE0Y4e0SpwLjMU+fjvn01UMlze1TWZAHiQJw
	uNJxu+29J3b+xHyLByPW8RxVpcnfNpCDe6ePA=
Received: by 10.223.97.210 with SMTP id m18mr1706435fan.127.1314624025328;
	Mon, 29 Aug 2011 06:20:25 -0700 (PDT)
Received: from localhost.localdomain (esq70.neoplus.adsl.tpnet.pl
	[83.20.136.70])
	by mx.google.com with ESMTPS id b14sm3756189fak.29.2011.08.29.06.20.23
	(version=SSLv3 cipher=OTHER); Mon, 29 Aug 2011 06:20:24 -0700 (PDT)
Sender: Sebastian Krzyszkowiak <seba.dos1@gmail.com>
From: Sebastian Krzyszkowiak <dos@dosowisko.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 15:20:17 +0200
Message-Id: <1314624017-17974-1-git-send-email-dos@dosowisko.net>
X-Mailer: git-send-email 1.7.5.4
Cc: Sebastian Krzyszkowiak <dos@dosowisko.net>
Subject: [PATCH][meta-oe] ltrace: upgrade Debian patchset from -2 to -2.1
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
X-List-Received-Date: Mon, 29 Aug 2011 13:25:17 -0000

* because -2 is not fetchable anymore

Signed-off-by: Sebastian Krzyszkowiak <dos@dosowisko.net>
---
 meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
index 7625dd8..9555c48 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
@@ -5,14 +5,14 @@ DEPENDS = "elfutils binutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-PR = "r3"
+PR = "r4"
 
 # ltrace is not ported to sh3/sh4 targets at this time
 COMPATIBLE_TARGET_SYS = (?!sh[34])
 
 SRC_URI = "\
   ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
-  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.diff.gz;name=patch \
+  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.1.diff.gz;name=patch \
   file://add-sysdep.patch \
   file://ltrace-compile.patch \
   file://ltrace-mips-remove-CP.patch \
@@ -77,5 +77,5 @@ do_install() {
 
 SRC_URI[archive.md5sum] = "3fa7fe715ab879db08bd06d1d59fd90f"
 SRC_URI[archive.sha256sum] = "5c6627d6d5a98a92ca4661cfc16378b182cc46a9ec479ebf7e6121ee3fe2be32"
-SRC_URI[patch.md5sum] = "969baa0900646c0262b2d505b9fef154"
-SRC_URI[patch.sha256sum] = "f647d7c2f2b0d1dbddd632f3a17fef670aed3ebf5fbe6c1633337acac1eba8e3"
+SRC_URI[patch.md5sum] = "38bc944c53ab602a7854aa4fa71c1f46"
+SRC_URI[patch.sha256sum] = "4c57df94020f2bed90d948f757ca7786796ca9218274764b24f61c502d9ef4f6"
-- 
1.7.5.4



