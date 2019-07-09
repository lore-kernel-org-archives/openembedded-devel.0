Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2737DAD9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 17:26:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45jq441QNQz56
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 19:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562693188;
	bh=kr83uvycwGE1IY78f2FPBQFyI6W9vWPTFV9Mt1xsio4=;
	h=From:To:Subject:Date:From;
	b=bOKWabDqr0IrZS8i4USfP/++55gcgXyhya7Ql5Yh435KETKIAlA0wl4UVCEfKvXqX
	ocRcP9cgoPbH/A2v3Gy+JtPTvf0/9zQ6ro5mJhUZ9qf7EDLdCQyUfxSkDi7eR24Heh
	bfHCFqLpkmGCzYdlFnszSEBztS5OnUSTBQRGddUk5xciV7qsi2nOT9HKILMjdRIRGE
	k+H3yt5sCb/elc/Nc9qfuajr4PhZ5FYcSrPKrILkt5I1ow6NVe5R1050T8NIK/F5mI
	LDJS8Edzvr1apPUP3iwUm8y+WNkRGTwid8GgDwQqpubU8QGYmwdI9J2gpkxfOaqOT5
	i90bdXKMY0MQyUMwAA1EgMQzYAS7S2NieUGay+z8FD27e/UtH33pkRtXHUKETqKTdt
	dB/E60UCpYueAoC9jqclHi175fp/Ft4v+aBiOgmXcupJ5rVdjmg6kw+7hKHkeDgxlD
	jH+B6S5ITc5CfMhJDBm9hpyCNp5JbCu7SDnfUDRnhOgRWnkQu0VoaRvQXM0u2iFsn7
	9B6aJfbqC6yyfpPtTSPXtGLABd5cK8HCgl51nUrBWsnUB/ZSB+O7bxHb2rMo9A/BWg
	rRuJZqr2WXtZKDT7se2ZaqXvDyxX8SFWisJgmU63pgZoEV6P1gwtZNO4aNwwE9gH0+
	EvDdESscYh4mq9Fmj4adN8d0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jul 2019 20:26:23 +0300
Message-Id: <20190709172623.26073-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Don't build without optimization
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
X-List-Received-Date: Tue, 09 Jul 2019 17:26:27 -0000

The upstream build system adds -O0 when debug is enabled.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
index 6716f402a..43bf25a93 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
@@ -36,8 +36,8 @@ PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
     libQgpsmm='false' \
-    debug='true' \
-    strip='false' \
+    debug='false' \
+    nostrip='true' \
     chrpath='yes' \
     systemd='${SYSTEMD_OESCONS}' \
     libdir='${libdir}' \
-- 
2.17.1


