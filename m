Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF746E9DE6B
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 08:36:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127520.1775723808837232413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 01:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=elptDf9i;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso347091f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775723807; x=1776328607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ffRZ8X+djChWozPiRgQl9nogUFbnN7jMb1cNli4CTs=;
        b=elptDf9iclIOkvtXIHfDNdX8ELJiMBRc0LqXldbqmhnlrCC2v+Nh1wHaueJAp8rg2a
         S9eb4p/gYsBlNax8YqOZXgc7i4ReYHKuH6ZPYjTSuCk+sVl9vKvbqsE7pBQNO3BCcBUu
         O0m7d9VHunYFkl3GbIb9liDtxdDzOkwo5G7CwI2z1mQECpUpVefIqvjPfFAGH0uQTHCQ
         6VDrzLx4Hl4CtYRd4L02BvwG0kVaaEPZ+nm379dyi2zQm26Tga8GV0HsJRRWyAePz6QQ
         aR+ucdxdAFLVNQkWjLR1kd98oFKYEcXC6bXp9+oVQCI1d1r/XznduSNYCRiUKA1b0m+U
         Zktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723807; x=1776328607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ffRZ8X+djChWozPiRgQl9nogUFbnN7jMb1cNli4CTs=;
        b=d9mgthsp3hKCivLWYD38YRnkk4AB2sDP28PoKMY+6OJw5fj7lH1MsEP7ZLxTnR3Ac3
         EM2E1en0WhTvOw05hmKmp+nwM6yCEEKR7TfNQqywAfYHbpDwvh9SaJlMTkM/iXr4SYua
         Kqy7mIsH4uTkb0zP8VUegLageBiOCCa0rbrA+xWnJ8DmKgCey6CMyiiHV4trl8gCBQIT
         ADxXbaHifj9jhYeFJRJD3f+eJFQx0dQ2j/MftZuUneGbhFvlLpozBU8CsvyrMmS1BSEr
         BaMsxlk0dYYyrg4TzWg3+VOcIUM8oKBCK/h8WWRi9H+qTyJIbG2jezkFiq2Qq2UdgiSI
         J2+Q==
X-Gm-Message-State: AOJu0YxXBndPSgnW/IpOkI9t5jDF6zfPP8FrMPRUx3WsktiVu0p5MHdX
	1yJBHiscot2MV/L6k5dxRaVsgOW2muXEZkB3wi+gvkTQbub3R2gqIUyDrx1DCQ==
X-Gm-Gg: AeBDietuZN5DOKIv7NvS2slErtn40pQEjXB+0IPgqab1+ydw/N5S+5eL5dZdMG5xjsx
	xYK9Z8RTPEMCTc523IDUPuyPpudQbaAxEbQiCqX3PPgKfxylu5eLuNNb/e2uOx9LsuWdlQEUYo6
	P12tRXwwFgv3DBVU/fhOZUsHppdWhutVPshzVoBDvWGqtPXJRih0L1F/UGH6DZl+JqrPSO4TFZ+
	7y2RDyl74050zp0r818SqZI5h3y2xONNVKcvz0UG01ogFStJJ9i/qdPoZcfxejgXnzuaeCHAO99
	rWU5ESwoAZKs2mG25XNCk4CTT76Qcs049dKCg/YmlIo2FMkDEfsYI0FrOQY7TOee2TIOs7dfUQz
	aajbVUic8Vx+xRah2iAhl3QHLa5lkZpFkV8Uump3z6ev7MnvrhZBZZPRXx8flYleQET5pmJbkLx
	Kogn/d89Wk45vPTNQugPwNW8qYVF7G2fs=
X-Received: by 2002:a05:6000:3111:b0:43d:307b:386 with SMTP id ffacd0b85a97d-43d5a126758mr3417320f8f.4.1775723806728;
        Thu, 09 Apr 2026 01:36:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm69875969f8f.33.2026.04.09.01.36.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:36:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH v2] giflib: patch CVE-2025-31344
Date: Thu,  9 Apr 2026 10:36:45 +0200
Message-ID: <20260409083645.577288-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 08:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126147

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-31344

Backport the commit that mentions this CVE ID explicitly
in its message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix typo in subject

 .../giflib/giflib/CVE-2025-31344.patch        | 28 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch

diff --git a/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch b/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
new file mode 100644
index 0000000000..8f52154955
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
@@ -0,0 +1,28 @@
+From 949bf7ded2c23449439e2c3e1f63368cf7985800 Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Wed, 18 Feb 2026 18:06:50 -0500
+Subject: [PATCH] Resolve SourceForge bug #187: CVE-2025-31344
+
+CVE: CVE-2025-31344
+Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/7bbe8ea1a595bb7509ffa0a86b076e9b720e85af]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gif2rgb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index d51226d..4ce2104 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -329,6 +329,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
+ 			GifRow = ScreenBuffer[i];
+ 			GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
+ 			for (j = 0; j < ScreenWidth; j++) {
++				/* Check if color is within color palete */
++				if (GifRow[j] >= ColorMap->ColorCount) {
++					GIF_EXIT(GifErrorString(
++					    D_GIF_ERR_IMAGE_DEFECT));
++				}
+ 				ColorMapEntry = &ColorMap->Colors[GifRow[j]];
+ 				Buffers[0][j] = ColorMapEntry->Red;
+ 				Buffers[1][j] = ColorMapEntry->Green;
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
index 8226e9b6c7..c26f3cf160 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
@@ -11,7 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
            https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=raw;subdir=${BP}/doc;name=logo;downloadfilename=giflib-logo.gif \
            file://0001-Makefile-fix-typo-in-soname-argument.patch \
            file://CVE-2026-23868.patch \
-"
+           file://CVE-2025-31344.patch \
+           "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
 SRC_URI[sha256sum] = "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb"

