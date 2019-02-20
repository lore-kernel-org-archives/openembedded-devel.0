Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 021EA7C9C7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:52:04 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJrZ-0007uu-PX; Wed, 20 Feb 2019 05:52:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IPSP23X5ir376tOcl8/WSRRoF2wBO+ZbtxamD0O0SYw=;
	b=WIVWamDerr/jClxjbXUgKOqj6E
	cMu8NYalLwavp9ivAjQcwLoN5sr+dj+tJWp8GZz2HlyFi3RnG+Ys/I9WAXjrCqm1bp/GhMMOlknh6
	lXpGDca+BdYEvb9P8XsiLuq2i1kZVeVX5QZQexhiaURTa4Jcna09hrIAhG1KQH//jGjrmg3/ZB8WE
	XuePU9Fd/xC5UQSbxkRGOkDLMrQdCSNK3q78CWm8g2R+0WyBn3x8CiMjDKtynYeMMoSI1ePVJta8d
	7Cc4olGRQmPODAZ6ByOfUUDIapxwwX7kjsyelTKmiIYWGP4bykIJLf9xWOcmLxBLXoJV6P5Gg6X36
	ocll2REA==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJrV-0001Ai-UL; Wed, 20 Feb 2019 05:52:03 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2019 05:51:53 +0100
Message-Id: <20190220045156.28372-2-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220045156.28372-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190220045156.28372-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 520b7d319569d55d657de1c7ae64b270
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190220045203Z
Subject: [meta-oe][PATCH 1/4] plymouth: Use a new DISTRO_FEATURE to enable plymouth-initrd
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
X-List-Received-Date: Wed, 20 Feb 2019 04:52:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new DISTRO_FEATURES knob is "plymouth_initrd".

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index a5b16c979..b7be9f04b 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -36,7 +36,6 @@ PACKAGECONFIG_append_x86-64 = " drm"
 PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
 PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-PACKAGECONFIG[initrd] = ",,,"
 
 LOGO ??= "${datadir}/plymouth/bizcom.png"
 
@@ -46,12 +45,12 @@ do_install_append() {
     # Remove /var/run from package as plymouth will populate it on startup
     rm -fr "${D}${localstatedir}/run"
 
-    if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false', d)}; then
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'plymouth_initrd', 'true', 'false', d)}; then
         rm -rf "${D}${libexecdir}"
     fi
 }
 
-PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'initrd', '${PN}-initrd ', '', d)}"
+PACKAGES =. "${@bb.utils.contains('DISTRO_FEATURES', 'plymouth_initrd', '${PN}-initrd ', '', d)}"
 PACKAGES =+ "${PN}-set-default-theme"
 
 FILES_${PN}-initrd = "${libexecdir}/plymouth/*"
-- 
2.20.1


