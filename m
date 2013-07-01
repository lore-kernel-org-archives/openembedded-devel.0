Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id D4AC76AF22
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2013 07:23:40 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y10so2399305pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2013 00:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=zfSVtjDCBYqOJxbGkjK6cFqn8ZAYwVa4I5dbZBO+Kyo=;
	b=KmEmZPhLkyy1czwTcyo4zBf1vBBLUHfhh+J8Suvj3OPEUWZp67Ejs9jGCs5KnlvLb0
	JzQTEcWP8pPloMSlHguUVGGfB3dw76OspCVJT/oXN5HOicBA9di7MokR337g3VRLSb5k
	S5VL34ZTm3H3bjGyZSLjdrNJ5O2MaS4TuJR8Ot7hWXpj2gVuYk7KI9xnF0uRGVp+nWya
	I/lhjaTprOWk+lFqJjzmOcJGMIVWMMpoBNaYLbmvDV0oZl6BV2AF1wPexTWTN6qxrDmC
	afgX45dHtDYQGCf/31qeHcTMAEdxfozlC2pQOXG3cFhWvso+64ifGiRWbFpYlRftMlQg
	8NaA==
X-Received: by 10.68.218.199 with SMTP id pi7mr22578195pbc.19.1372663421898;
	Mon, 01 Jul 2013 00:23:41 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ix3sm20850544pbc.37.2013.07.01.00.23.40 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 00:23:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2013 00:23:21 -0700
Message-Id: <1372663401-12751-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] uhd: Fix compile errors
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
X-List-Received-Date: Mon, 01 Jul 2013 07:23:41 -0000

uhd would fail with wrong scope for uint8_t type
errors.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC: Philip Balister <philip@balister.org>
---
 .../0001-use-uint8_t-from-boost-namespace.patch    |   29 ++++++++++++++++++++
 meta-oe/recipes-connectivity/uhd/uhd_git.bb        |    3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch

diff --git a/meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch b/meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch
new file mode 100644
index 0000000..8978ddc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch
@@ -0,0 +1,29 @@
+From 317f6f08cedf005ce1f2d6f0d04cfb2659863423 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 30 Jun 2013 22:10:50 -0700
+Subject: [PATCH] use uint8_t from boost namespace
+
+Fixes errors like
+codec_ctrl.cpp:113:10: error: 'uint8_t' was not declared in this scope
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ host/lib/usrp/e100/codec_ctrl.cpp |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/lib/usrp/e100/codec_ctrl.cpp b/host/lib/usrp/e100/codec_ctrl.cpp
+index 13b3bc9..2c13176 100644
+--- a/host/lib/usrp/e100/codec_ctrl.cpp
++++ b/host/lib/usrp/e100/codec_ctrl.cpp
+@@ -110,7 +110,7 @@ e100_codec_ctrl_impl::e100_codec_ctrl_impl(spi_iface::sptr iface){
+     //_ad9862_regs.dis2 = ad9862_regs_t::DIS2_DIS; needed for transmit
+ 
+     //write the register settings to the codec
+-    for (uint8_t addr = 0; addr <= 25; addr++){
++    for (boost::uint8_t addr = 0; addr <= 25; addr++){
+         this->send_reg(addr);
+     }
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-connectivity/uhd/uhd_git.bb b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
index 06d5eff..180fd27 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd_git.bb
+++ b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
@@ -4,7 +4,8 @@ PV = "3.5.3"
 PR = "${INC_PR}.0"
 
 SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;branch=maint;protocol=git \
-"
+           file://0001-use-uint8_t-from-boost-namespace.patch;striplevel=2 \
+          "
 S = "${WORKDIR}/git/host"
 
 SRCREV = "f4c58120dc1e3674ee0228213f0f0011a0f80dcf"
-- 
1.7.9.5


