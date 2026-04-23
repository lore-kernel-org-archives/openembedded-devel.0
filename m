Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ECDF589C2
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18680.1776948586951755689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pI4lFIlr;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b24fede2acso42844415ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948586; x=1777553386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biX2uJrrHn9o2AuZ2J7A8YvWEM1YaV1BS6R3+xNhovE=;
        b=pI4lFIlruDCvw/YYClN363n378Ipqq8jJi2oupNq64jz3xdaHCkLLKcfeAL64e+2AC
         vtanRXXOEgVxU7d/4WysKREJ/9vyzJO7GRofxIVI572jzMPB62Zil1T9Yn/iexjCNKfM
         ui22kSct/6Ckht7rv/zQUTQ3EXXMWj2s7jlBt8EXRvkZd7CF4ZY70hos/b3Pi9Y5+XSB
         U9so6RsOuI8R97Ous+O6+EOTWGm7QINaiQ+ZWeBr2pOnVqy3si5Tw2zMFVfRzPaxUtic
         8ajHqlIRl6oRzPKataYSkuIfazF0ordd/nWriZYTGW7rgqJaa8Rzwfq/y/JWx65iTkjw
         8A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948586; x=1777553386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biX2uJrrHn9o2AuZ2J7A8YvWEM1YaV1BS6R3+xNhovE=;
        b=joIAvzQNkANw6IexRPusBVDC/xLHzX30MCGnEdbx2/MfaqVDV+isiP5zmxkvJsZQy3
         bBZPDHbUHrs/eqbD4YqbLi+FCM8Rr66YY5qvoarYAU/ChOe5oLBZSV0zcJJLFwIjwhWT
         3zfmlrxnz2CW0p9v9ZJ+TBi6ZHCFHGukJUbfo+J5Ze3WBUpc0IVaXRnIVc5Bc8jM5sIV
         eSt9M1c1OsHXKaytr41EUt028zETewrDHgzJ0zi1iAOwiTU9p3oYeiYyH2QV9iMfFXdK
         mY6I9QmAbbRMEVS1DI6GM2B21bw0FDCCyb6v4HEl5o03s9bJjtktAPYmPBCBvoC4VMir
         HRTA==
X-Gm-Message-State: AOJu0YzeEFucfNec6h8l2DlIsYFshp7SyLser2uv5sxZGoTjP4Yv25r5
	/6cgMAD7q6ogyvReTGrfIhqUXI4qn2jyPPPRxyKNzmhJ65gtLSmRohAl6C5zHb+3
X-Gm-Gg: AeBDiestPN+/EhLTCpD2BZuz4KyIHNmoqPLuQqnHnYpq2JyI29Dvs/fTKQ2KE1AK2wb
	g1BDd2BKSQwIzspQr8sFC5zb++bjYMqhH/hhNU/Xmo3KjrAwyESreeafz8LQHVmJ2Za9OAsEi8f
	OZM/hfhj6fVdHHoy4OaBa6kk3QwKbx5Mhnc7+S/5piRmKGXB6Vway3G2zY3HmHMdeCRjMA5D+wv
	C/FGjOjqawCeX+96w6c0B+gcxHIuslYl9Njcb++yorsI1qbgLjUD/U/eIU2IdIsuLMennzyLGF4
	FwGOSlmewgh2+EcGBrRBL3XqDxYR0S8keFjzfuKsT0x+Y7b33lqDnYVI1OTKp+NbJzMLglVJzFN
	SluGcrDK0sORrDVkKRGwUaunzWd6jCleQur+ghRBM83wO6WN1DPpLnANUb2bJvebREMhvykuVAD
	IATZQVDAJwmAfPq6dol8ZM8g99D91KQyKHob/+RHZF4Hq/db8=
X-Received: by 2002:a17:902:ea83:b0:2b0:624f:8edc with SMTP id d9443c01a7336-2b5f9eb06e2mr226444865ad.12.1776948586058;
        Thu, 23 Apr 2026 05:49:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 15/19] libgphoto2: patch CVE-2026-40341
Date: Fri, 24 Apr 2026 00:48:13 +1200
Message-ID: <20260423124823.1983261-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126591

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40341

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit de5f93f95d420447043cedbedf798560925c44e1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40341.patch   | 69 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch
new file mode 100644
index 0000000000..b71792c185
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch
@@ -0,0 +1,69 @@
+From 3674dbeafa5157a264ca5e562ffdbef159a2185f Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 15:28:52 +0200
+Subject: [PATCH] Fixed OOB read in ptp_unpack_EOS_FocusInfoEx
+
+Do not read out values before checking there is sufficient size
+
+CVE-2026-40341
+
+CVE: CVE-2026-40341
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/c385b34af260595dfbb5f9329526be5158985987]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 34 +++++++++++++++++++++++++---------
+ 1 file changed, 25 insertions(+), 9 deletions(-)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 9eba06f..11428ab 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -1629,23 +1629,39 @@ ptp_pack_EOS_ImageFormat (PTPParams* params, unsigned char* data, uint16_t value
+ static inline char*
+ ptp_unpack_EOS_FocusInfoEx (PTPParams* params, const unsigned char** data, uint32_t datasize)
+ {
+-	uint32_t size 			= dtoh32a( *data );
+-	uint32_t halfsize		= dtoh16a( (*data) + 4);
+-	uint32_t version		= dtoh16a( (*data) + 6);
+-	uint32_t focus_points_in_struct	= dtoh16a( (*data) + 8);
+-	uint32_t focus_points_in_use	= dtoh16a( (*data) + 10);
+-	uint32_t sizeX			= dtoh16a( (*data) + 12);
+-	uint32_t sizeY			= dtoh16a( (*data) + 14);
+-	uint32_t size2X			= dtoh16a( (*data) + 16);
+-	uint32_t size2Y			= dtoh16a( (*data) + 18);
++	uint32_t size;
++	uint32_t halfsize;
++	uint32_t version;
++	uint32_t focus_points_in_struct;
++	uint32_t focus_points_in_use;
++	uint32_t sizeX;
++	uint32_t sizeY;
++	uint32_t size2X;
++	uint32_t size2Y;
+ 	uint32_t i;
+ 	uint32_t maxlen;
+ 	char	*str, *p;
+ 
++	if (datasize<4) {
++		ptp_error(params, "FocusInfoEx has invalid size (%d)", datasize);
++		return strdup("bad size 0");
++	}
++
++	size 			= dtoh32a( *data );
+ 	if ((size > datasize) || (size < 20)) {
+ 		ptp_error(params, "FocusInfoEx has invalid size (%d) vs datasize (%d)", size, datasize);
+ 		return strdup("bad size 1");
+ 	}
++
++	halfsize		= dtoh16a( (*data) + 4);
++	version			= dtoh16a( (*data) + 6);
++	focus_points_in_struct	= dtoh16a( (*data) + 8);
++	focus_points_in_use	= dtoh16a( (*data) + 10);
++	sizeX			= dtoh16a( (*data) + 12);
++	sizeY			= dtoh16a( (*data) + 14);
++	size2X			= dtoh16a( (*data) + 16);
++	size2Y			= dtoh16a( (*data) + 18);
++
+ 	/* If data is zero-filled, then it is just a placeholder, so nothing
+ 	   useful, but also not an error */
+ 	if (!focus_points_in_struct || !focus_points_in_use) {
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 40ada8dd20..4ef9bf4272 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40338.patch \
            file://CVE-2026-40339.patch \
            file://CVE-2026-40340.patch \
+           file://CVE-2026-40341.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

