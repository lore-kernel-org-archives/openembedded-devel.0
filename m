Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3121E7FDE0
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:09 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1563.1770066845523347224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hUiwJ9Da;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so54621615e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066844; x=1770671644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6va1rboWH4+X1QryBgzcABuBQQWFs8MyebgD1ky7v24=;
        b=hUiwJ9DaITJ2Mzw8RQ+nTNKKP/F88EPyLQxTSPV+PLxEUnbEnjcDd/h9XovnbFk4wy
         3jGo3QUn9OC2eU+V92secdq/7YJZxwURVDr9phMFQV7hmHWjEeUrn8IELv/FW5S3gAE1
         twVENHVmwAiEOo1EQc+fty/8FlX/AMG516PXWW5vJusH46n6nl9+AVtCAPxw2gA2eCLp
         D3Seig40a3nmUrEw/uhKW9wHpM0+8Oqz/LnuDp47icWRajlCbc4PjdbWLu4x+uhtFFj0
         ZoAYAYan8fc6n/1qdsyqXQ+KA9bFRqAFGJ8F5ha7UbOdttjycv0hPwBCDRQtGEJ5cHMg
         4xTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066844; x=1770671644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6va1rboWH4+X1QryBgzcABuBQQWFs8MyebgD1ky7v24=;
        b=TXsMiYMAS8u9eApr4Bar44J0fOVygZyRS4YdD/qa4pwtNZK4BTh20PPH33BlqO+rrC
         peQazJdC/ROanz8wQbFMvpaRfpdnK56UtUCQ03TJpMz5oGGjjsnl3Q2UUHVBvY3gpteI
         SEJ395EzhJEzbtut2gxKAm3P/bPRhbrr6kRQ326NWWaRR9VFROLQ34l9RrStQpj+p/bv
         WEn5drZ+zWA9NYA8/q7lu/5nBOfKG/Ru6MC3iTwpTN09+R0yGXUDZQYv1DPmrPT1H89G
         ggK5Fx6WokWs4aV5HZs4S9CoIH58lO0QMfJHHz4Yx4X/HwfWOf5c6reHCFIgfSad1v9M
         49MA==
X-Gm-Message-State: AOJu0Yxu4I2k9l9rWpoXWB3VK3AZR1gMQFClsKhjKDPQ7h5fU6TZD3Ln
	5OozPEWxu0oKoBFTM3wl9SFdSTDUBH7eOohDHsLTGnVsSecMpiYk582zBj2/Og==
X-Gm-Gg: AZuq6aLjubjv6RtDAJsGai6oIKJjIzE91pH9ahrb0hX471Jy5b5dTXjKEbdb0LOeofB
	vflwp9hCq8TzNoWeCR4KcvM5pjEoOfKDqFC8o5vpUFOznzP9HOiH4sb8euwArEJFjXfdV94Ttq7
	X8Zn7FIdGbb64C7b9Pp/JA8F70wJzkMa6Q8mJ0RwVNJPS4C2HRlipYrsbo/1ivn5x0bJA2UvYoi
	lQJG2bWKv2/AWqIexdbYuvAwd7Eij+BgKo5gCrLCKjnbxwM8Ya/j6IFU8xHI2BgC1+XDO2UKWKv
	/t1g0IPetKwb/DwHdhGZ/J3HStC7zFNp6cLpj6AJHPw/cdfuPWfbV+AuRen1Hl2E8FaWGfrCJmY
	/JEX/bO8K1yVFtGT123JHmTQ2PykMPWvEESLBzbfpm9DheRPJRUJbFW3EU/tcGEg0mU0jjiLNwP
	Zuy0OQeE/P
X-Received: by 2002:a05:6000:1786:b0:430:f301:3e6c with SMTP id ffacd0b85a97d-435f3aa7a0emr18607243f8f.34.1770066843750;
        Mon, 02 Feb 2026 13:14:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 02/15] fontforge: patch CVE-2025-15275
Date: Mon,  2 Feb 2026 22:13:48 +0100
Message-ID: <20260202211401.1287664-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124075

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15275

Pick the patch that mentions this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15275.patch  | 33 +++++++++++++++++++
 .../fontforge/fontforge_20230101.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
new file mode 100644
index 0000000000..3574b8ee19
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
@@ -0,0 +1,33 @@
+From 4c0658f56faf6d64382721a230ee57038035110a Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Fri, 9 Jan 2026 16:58:23 +0100
+Subject: [PATCH] Fix CVE-2025-15275: Heap buffer overflow in SFD image parsing
+ (#5721)
+
+Fixes: CVE-2025-15275 | ZDI-25-1189 | ZDI-CAN-28543
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15275
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/7195402701ace7783753ef9424153eff48c9af44]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index cd661584b..4db9feebb 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -3724,6 +3724,10 @@ static ImageList *SFDGetImage(FILE *sfd) {
+     getint(sfd,&image_type);
+     getint(sfd,&bpl);
+     getint(sfd,&clutlen);
++    if ( clutlen < 0 || clutlen > 256 ) {
++        LogError(_("Invalid clut length %d in sfd file, must be between 0 and 256"), clutlen);
++        return NULL;
++    }
+     gethex(sfd,&trans);
+     image = GImageCreate(image_type,width,height);
+     base = image->list_len==0?image->u.image:image->u.images[0];
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index 901b289f11..1680c7b2e0 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2024-25081_CVE-2024-25082.patch \
            file://CVE-2025-15279-1.patch \
            file://CVE-2025-15279-2.patch \
+           file://CVE-2025-15275.patch \
            "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"

