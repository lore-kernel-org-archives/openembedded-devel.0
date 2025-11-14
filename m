Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E9DCEACDC
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 20:26:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7803.1763151991173978437
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 12:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mzivqP++;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47118259fd8so18489235e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763151989; x=1763756789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbSbIV7kjQhmmXQ93Lz60nOL3UZCe0IuOx2uiyNsLBc=;
        b=mzivqP++DYd7KsRckVNuYLObc3m7UAIF0gi7D+nWEp6696EERHAbjVAwqpZsL6oS2i
         K2V1KCW6jANEWzt8cAdjEGtplNIOIxnHo08qhNrz+wpnrSJEtGbnRo6C+uZf+22wd9ek
         c72GTss48dL6hcFbQphn5cgT1ZGUZP2SRE+/px1qCYawOc+gWw74jbP9ePKnkzdpx5+o
         7y83XMRZYZbk+TaS3Bz8lr5y2PhnXMyX2qyMxP/VMLYDDDaijK6k/dD7GcLRopW8HLMu
         Gl5Lk28qYFjkOKjWgMVn/KFk9P4xHTkW678oSJ703iYJ7vZVIysq/4Zsae23mHYH3S3p
         M6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763151989; x=1763756789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DbSbIV7kjQhmmXQ93Lz60nOL3UZCe0IuOx2uiyNsLBc=;
        b=A9YaDmzGFHGru4V7JyUTNpQswp3grbDtxmBg+KLte8/guvFFqdA0q0Vu9OOtsYqBrG
         akPGbCycuqGSnElKbqnRo4L0Ok4Q3ILvdiRj+MPUZFE8wEpBQluS58m8N3zXJv0BV+N6
         BDKQj0rznQQZRBJ64VQOrjyl+2TTjfb3iYTxzVBckGeqRalr3CYfsin7zY5hPkL3VlOV
         3moFD5oza5sFyllMG6UuglmlJC4ux+eHSmvbED72rtGjNRojkBYNSw4x9J2Sef48GlT9
         U0qL65Diq2oRu4sbRHz32NCJEpIdXl2mednvnt+WBdSrpkz4MfrQ56FH9c7tSu230DU5
         rtYQ==
X-Gm-Message-State: AOJu0Yw2/tZp0PbrLQ4ct7Lpu/Rln8ngPNTFJ4eJf7ZHVTE7zPdGB/rK
	yvc6HgnwVdb61EYVykE8DmH0hvUV+jdCnEmnxSu13sDuziZF9JOnU1qwqWP6Rt5D
X-Gm-Gg: ASbGncsajXnhtNzBSb87MP1ZPAilGHtN+X+M7y1cQ6EXkzrDPVDHJkgt5xaKofKYfmt
	dKHZufZxQIjH8+KEUxrMwI/RB9ylZIk1mrF48F9Z/uyQRkIwjWJOzE+7iO+564s1X8laSPj7tD5
	6v4vH4E3iLp1p2HsmSYvYvX3tuvqzguV7Bb7tVap4GkDmSF/Tysm/UvSCnXTVUimjYfBThWN9YN
	R+K1LfRz70wgVHTMNFqPFK5zxIzzkwTplxq4ndDCPuriEiwXJMRj9EieGi+es48nATZu1fNmoWP
	Yqhs9whBHi+/5NNduiL5WqQohotDk2kkQpurdjuysMHIZPbsYVrRje5dozH68+zfDC+CjT4pngV
	41FIWeijolp5bot/xUMCxkXhy4qBiRwSM71a1KQ9WBvltdeEG7aDwgOyn9k0I7XgjU5rSVXa5ZQ
	8ha5enZkNA
X-Google-Smtp-Source: AGHT+IFQyGAUNQHCGZtmJUfPckicz12L3+TAOAuwDsB407Li8Jehse6QumX93BDatCdfjgrDn2D/kw==
X-Received: by 2002:a05:600c:4753:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4778fe5ff23mr43179895e9.1.1763151989394;
        Fri, 14 Nov 2025 12:26:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779527a656sm23617845e9.10.2025.11.14.12.26.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 12:26:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/6] libwmf: add missing CVE tag to patch
Date: Fri, 14 Nov 2025 21:26:23 +0100
Message-ID: <20251114202627.656631-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114202627.656631-1-skandigraun@gmail.com>
References: <20251114202627.656631-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 20:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121717

CVE-2006-3376 is already patched, but the patch is missing
the required CVE tag, so the cve-checker misses it.

This patch adds the tag.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
index 50d915c010..d92758b394 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
+++ b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
@@ -2,6 +2,8 @@ http://cvs.fedoraproject.org/viewvc/devel/libwmf/libwmf-0.2.8.4-intoverflow.patc
 
 CVE-2006-3376 libwmf integer overflow
 
+CVE: CVE-2006-3376
+
 --- libwmf-0.2.8.4.orig/src/player.c	2002-12-10 19:30:26.000000000 +0000
 +++ libwmf-0.2.8.4/src/player.c	2006-07-12 15:12:52.000000000 +0100
 @@ -42,6 +42,7 @@

