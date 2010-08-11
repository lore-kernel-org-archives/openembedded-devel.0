Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OjFm4-0001Bd-V1
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 20:11:38 +0200
Received: by gwb15 with SMTP id 15so137215gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 11:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=4v5O0as4Hq7Rf/f6UqcpuCv78278b90xMT6ScbteZas=;
	b=MHxYbUNVkbmcFiHw/K9isNBcg28SXwiJByKqcsoxx/BdVIk4WJLMpnJLXhYDvX+l0F
	4MUoXX6454vaLuCpx/9lRtQ/dY3PkaqINE0q2ID9noEp7H9s5GlwOwlROyI59/QxOrMN
	UtYUcSJ57CH5fuZC0jY2TQHToy3nVKE/S7vgg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FzCTDspXHmG8aCc2cgeGrYs4lc037zuiXR43MCYhsPyG8PvHjP//P/DR4QYUgfaNnY
	D/Ss1khny5FLsv/Z2+zmbe9jVmx7cRRnKED7Cn77KWJShoYlxqOcHXL2PpFOCiDPAaI6
	3U/Ys5zL39MSpDBiklqRPNV0Qjl4KXZ6ej3tA=
Received: by 10.100.209.15 with SMTP id h15mr21955631ang.232.1281550283739;
	Wed, 11 Aug 2010 11:11:23 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i30sm529188anh.9.2010.08.11.11.11.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 11 Aug 2010 11:11:22 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Aug 2010 13:05:44 -0500
Message-Id: <1281549944-13721-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Brijesh Singh <bksingh@ti.com>
Subject: [PATCH] libgles-omap3: use es5 version for 37x machines
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
X-List-Received-Date: Wed, 11 Aug 2010 18:11:38 -0000

* Set BINLOCATION to use es5.x version for am37x-evm and
  dm37x-evm machine types.
* Bump PR

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Brijesh Singh <bksingh@ti.com>
---
 recipes/powervr-drivers/libgles-omap3.inc          |    2 +-
 .../powervr-drivers/libgles-omap3_3.01.00.06.bb    |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-drivers/libgles-omap3.inc
index d183486..12839e6 100644
--- a/recipes/powervr-drivers/libgles-omap3.inc
+++ b/recipes/powervr-drivers/libgles-omap3.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "libGLES for the omap3"
 LICENSE = "proprietary-binary"
 
-PR = "r6"
+PR = "r7"
 
 COMPATIBLE_MACHINE = "(dm37x-evm|am37x-evm|am3517-evm|beagleboard|cm-t35|igep0020|omap3-pandora|omap3-touchbook|omap3evm|omapzoom|omapzoom2|overo|palmpre)"
 
diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb b/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
index bb7994f..b3611a3 100644
--- a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
+++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
@@ -1,4 +1,6 @@
-BINLOCATION = "${S}/gfx_rel_es3.x"
+BINLOCATION_dm37x-evm = "${S}/gfx_rel_es5.x"
+BINLOCATION_am37x-evm = "${S}/gfx_rel_es5.x"
+BINLOCATION ?= "${S}/gfx_rel_es3.x"
 
 ES2LOCATION = "${S}/gfx_rel_es2.x"
 ES3LOCATION = "${S}/gfx_rel_es3.x"
-- 
1.7.0.4



