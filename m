Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23FBCCFA1A
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 19:32:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12358.1762630333667385522
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 11:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1Kcmac1;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477770019e4so4746705e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 11:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630332; x=1763235132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4/tBBdfirzQAHi6f0fV/lq4+U3WTUQRObcZjzOEZ44=;
        b=d1Kcmac1MzRhS88Uem3240h6FGReqZx2fx5S3Uo9FShhnf5T/zvKMRLxOqdYVm2DBZ
         CM+rPdPzXJ90sluZuY6aLM7YH1hPlWJYdzDGrGdOxWW8F7du+icNB+nm8FMBH2c07Y//
         BgGC2/bLVh3WQ0F28QRbD3KWonF3n2TItH4z/ZXQAG8kd6a6rBOhYGVEiwJNPrSYiRui
         3YRo8tNvAlNBVJ153kVs6H2CvfTOI5pnlgKnfe+910cO2buxUeq8+qZSZ9bZ4CwIQ65A
         tOW63YmV9VaPMxx6/KweyUvdq0KkNqdFKzLNyLvK8RuXguXSyuJwroALp5eYcbolHPeA
         85kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630332; x=1763235132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4/tBBdfirzQAHi6f0fV/lq4+U3WTUQRObcZjzOEZ44=;
        b=ayDmccQSYpkszyFCUfOANJusmw1XqVaEMviG4hOYY6j/bro43iNxquWpSpWdtZMHl2
         Jjn5j3QSGwFWlYP3uPDn2cleA8PBaSE151GPy3cAXq07icrfEKI5ABc6sCjXqdvNKvhW
         aGdhts/SNMrgg5+Zzr2jTO0JCi9vNhArYuFYuTnSQm4HOmfquPpIiko/GGImmB9dg59c
         R1i2AP5TZDImfJQNZuVjUhRnQRQKewMJB/Bu+hyYG0hIoWhnziys4rf8rtgUXl3G9shh
         xI7qT3ag8We0lIVea/RrSVWUFatUj59k5S1JYH08LIjUQ9yKgSvLbF0221BJE7yuJUtd
         YK/w==
X-Gm-Message-State: AOJu0YzuCzq/0Yk0olBEk05WXp8ssNYRtqus6N1ChXOTi9g150/Y38jL
	dScsUb6Yb8j9iLX/ilpt8bizD2psF+uVahd4q/7h0HZmIt5uNVmQco1ZbfEBVNb9
X-Gm-Gg: ASbGnctl/EiEi4Ar8b3L4KhX5Vwcf0CDBlM+Pd/5S/NkCrXIgym/q4Fx42mdKIi7xvT
	6Q/fTs0oyI+VG8Z2TzCB5mvg5Ii2JZftyQR+E9AMJqrKWoKjvfkvslO8Co/aiBPtbr5L9bESfvA
	7w4cT1tdQRlGCjaplEoICB1judw/BVqfGr9BTnLofIZrMJqddgXWCyCzRwLV5IM637nDN1Kc2S6
	RiZkL7TI00FRFEEpgj1KpGdUY30PrHvvBNTmWzenVYWirU4uubHYxKoivFbW0fPMog4TAVYzS1v
	CVuThZ2V9PYYDpSM21rcXPu8uRUo8NBLWK1vWBHmYA+TMERlSimqRflHR1cIit1rQK1MspF9mU9
	YLc66rFqSbeneL+KebOz2eY/ej4RHKf0mASXAD1ndmo6pwb/oJ5e2eVw/oyG63XJS1aSQIVdj9w
	==
X-Google-Smtp-Source: AGHT+IE1UdFoMM3lLYwnFAMs03kdeOSddTFkOANq2IHDXl1dzZ6lFQwo46i2I03HJk+CjXl5YISshw==
X-Received: by 2002:a05:600c:3110:b0:477:6e02:54b4 with SMTP id 5b1f17b1804b1-4777327b228mr30708895e9.31.1762630331916;
        Sat, 08 Nov 2025 11:32:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcfd021sm150455725e9.11.2025.11.08.11.32.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:32:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] id3lib: update remote patch SRC_URI
Date: Sat,  8 Nov 2025 20:32:07 +0100
Message-ID: <20251108193208.3465135-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108193208.3465135-1-skandigraun@gmail.com>
References: <20251108193208.3465135-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 19:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121404

The URL of the patch archive from Debian got out of date - update it.

While touching it, also drop the old md5 hashes from the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 7ae262345b..2d47116cf0 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -6,13 +6,11 @@ DEPENDS = "zlib"
 
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-16.2.debian.tar.xz;name=patch;subdir=${BP} \
+           ${DEBIAN_MIRROR}/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-16.3.debian.tar.xz;name=patch;subdir=${BP} \
            file://acdefine.patch \
 "
-SRC_URI[archive.md5sum] = "19f27ddd2dda4b2d26a559a4f0f402a7"
 SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b68702230e26c7d079"
-SRC_URI[patch.md5sum] = "997c764d3be11c9a51779d93facf1118"
-SRC_URI[patch.sha256sum] = "ac2ee23ec89ba2af51d2c6dd5b1b6bf9f8a9f813de251bc182941439a4053176"
+SRC_URI[patch.sha256sum] = "6170f085972fdeb5fd69e346860100416707bb0b9f3a73a17a64945dc8b7cfe1"
 
 CVE_STATUS[CVE-2007-4460] = "patched: fix is included in debian patch"
 

