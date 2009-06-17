Received: from [74.125.78.149] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MGsxT-0000cR-JY
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 13:05:35 +0200
Received: by ey-out-1920.google.com with SMTP id 3so96595eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=UHzir/8VST2ZxZjFvnhXg1ltWo+dl9YYtCT5Pxm7LxU=;
	b=PJCpBgPVAwvhpjsyryiYiXU9tXvy4UH1QA/mU8LheakBBGNwnKRJ7h2OAL668kCY7m
	uGaYEoTiXLljB30rbrCHYTqcLgHJyMt8pph4H20Gf+xzFT/Vj/BNkBI6vy/uoFvUSjpv
	sjpXmhOMGN8b7CUGT5ES7BNLP82L6kR+MfxqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eiF+CYmoYo5F4+ox63y7NuEar7cuaHbkdeoDhDpbClItQDEyzec5kuoikPbsnh7ehs
	UbElxoKUaqv+wRnvCJe1B5lPs4vw6QhU9JxlgJLV6nHKLvYYENmu6Na4f6nbM72dmxec
	F7Ldv9bnUNL57/Zpoo+ZJaMcCSRIONgUAS38k=
Received: by 10.210.29.17 with SMTP id c17mr2625305ebc.88.1245236109797;
	Wed, 17 Jun 2009 03:55:09 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 28sm53311eye.6.2009.06.17.03.55.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Jun 2009 03:55:05 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 12:54:58 +0200
Message-Id: <1245236098-21019-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] xf86-video-omapfb: bump SRCREV and use overlay 2 instead of overlay 1
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
X-List-Received-Date: Wed, 17 Jun 2009 11:05:35 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/xorg-driver/xf86-video-omapfb_git.bb |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/recipes/xorg-driver/xf86-video-omapfb_git.bb b/recipes/xorg-driver/xf86-video-omapfb_git.bb
index f718e76..30a86cf 100644
--- a/recipes/xorg-driver/xf86-video-omapfb_git.bb
+++ b/recipes/xorg-driver/xf86-video-omapfb_git.bb
@@ -2,17 +2,22 @@ require xorg-driver-video.inc
 
 DESCRIPTION = "X.Org X server -- OMAP display driver"
 
-PR ="r20"
+PR ="r0"
 
-SRCREV = "ef0b41c332a710fb33f996df77bd4a96b56878da"
-PV = "0.0.1+${PR}+gitr${SRCREV}"
+SRCREV = "5317aae587a2bf48f07a8c06bfaf7bcbfd23bafc"
+PV = "0.1.1+${PR}+gitr${SRCREV}"
 PE = "1"
 
 SRC_URI = "git://git.pingu.fi/xf86-video-omapfb.git;protocol=http \
           "
 
-SRC_URI_append_armv7a = " file://omapfb-neon.diff;patch=1"
-
 S = "${WORKDIR}/git"
 
+EXTRA_OECONF_armv7a = " --enable-neon "
 CFLAGS += " -I${STAGING_INCDIR}/xorg "
+
+# Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
+do_compile_prepend_armv7a () {
+	sed -i -e s:fb1:fb2:g ${S}/src/omapfb-xv.c
+}
+
-- 
1.6.1



