Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 21D086177C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:44:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNk34sxqz4n
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582317883;
	bh=UbLm3dsWRLOlRoEJxa/Qd4e5RgI+IwA2xF/9YjOLkb8=;
	h=From:To:Subject:Date:From;
	b=juWJqvAPW3aEHbhfL+uU+TbLsEfP6x0D/hnZubnzITdLC6ZkZT8sMD3qSH7tr8DIJ
	Edl3TXIrJRSdWU3D0vB0pI6qWrUB1dlHz3ALOfiWsfYDR10tS3we87EbDoHsjoAtQs
	Asnr4cnwF6R5tGwGZGuSQPB0Y6atSR+daM+jfu2opjivijv0CUupLiaJvB/rQkAAC/
	XoWCq/9suV1tSJD0kZpWZaysguahO7MkTBdmcMg0KWmUC55j0fXTdEKNXJM1OOa2QM
	OGPKpYNrWtx/S1wdf5nf+oLIZZXLxxMLTVt+IVfFVlJYX4V5jfefvG7uvEBiTfiLu3
	lzMBkLbs6P4E9IOsZpRZ6n/7++N0k5LGRBRZbd2Gb+IXTwne6rFdppbx9ckKDWyCrw
	YDw2ZQo0vhGtg34V5Vyah17Vtse8ez/LUB+SoIKekFcUCgHdTqzGEydfYZFMcD+YiG
	tkBXEsSZHkE2EHMKINwo4Er+lHRVOtVAEDOXaZ3+Pu6LqCLWkvHjxOdwlq3ztC27vs
	ljPqlBzhSqcF9mhwFli/g8MCOsj2SVguDA/WZAuqnOBezcbDtFj1GlFADKkGfdbhI7
	Ud8WwCjNdoMXLWiAJ5vrltSYUT9LlbkMDBJEBrDasJBH6NLEROFCsrKM4D3fDPrqBo
	r2EwgKS/GqgngXwDm8g9k6WI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:44:40 +0200
Message-Id: <20200221204440.16807-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][warrior][PATCH] libqmi: Upgrade 1.22.2 -> 1.22.6
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
X-List-Received-Date: Fri, 21 Feb 2020 20:44:43 -0000

Upgrade on the 1.22 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libqmi/{libqmi_1.22.2.bb => libqmi_1.22.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.22.2.bb => libqmi_1.22.6.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.6.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.22.6.bb
index da13286b4..af56061fa 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.6.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-Detect-clang.patch \
            "
-SRC_URI[md5sum] = "3fd831c1b0de4a4432be628432a960ff"
-SRC_URI[sha256sum] = "f1f1e514a89b1dcba05cf7274895e7301a2da4c947b7c2f17acb84fc74038227"
+SRC_URI[md5sum] = "bea205242b438d3540b523fed245746f"
+SRC_URI[sha256sum] = "755bbea2a330ac16d56678fbcdd09201ddb14779059ecc895edfac388551d5de"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1


