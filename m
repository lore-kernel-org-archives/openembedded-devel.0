Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777A2CFD2EC
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15745.1763839894736162467
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=faFeKyIe;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso1816205f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839893; x=1764444693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0Pu9rP0W4auWshZGLb7CeKNKH76B1lCELNC8fRCtwU=;
        b=faFeKyIe/CndOTM3ERgczl3NWuOGCw2yNGOUYsSHYP8RFzem9qSzvvQqJA0VTzr26t
         ucNDXbBl0eOFVJB4p2bxjUkgrKbEfz3wlx0BUXinCIQeq1WdECweezyWKhjFzcxoWQ+V
         oy91WsurQ95MBAqSjXyR9HKcNPv4UmSqXI/z4bF3iApCxcUZ8RJ7CJNheg+Idmz1dSzN
         cwfml+YTFuYOJcB6YDwyr0WZLPafSsLBY2u2aOkWVvRDMX54N4hMmpy7qCGu/jcLofUx
         JcEFCW4+4KVfEn4CP1f0/yEsCTOzc5Bre7TcsxCruh8DxcaSKEyRntxvZWHS4oPMSv1n
         HVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839893; x=1764444693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C0Pu9rP0W4auWshZGLb7CeKNKH76B1lCELNC8fRCtwU=;
        b=QTfikj0gmteqcmh76RFgRisSqNOPc9Us7eJnO3yRT0w0Qujz7GMeRasEo2598/tsP7
         0a2D5gm2+Kf3VuImKxZ4/F20ZxBYQ7lpjYi3auhKfjA9GTBKY6l7VJqjzYHuqG2ukb3P
         GuBz9yz5do27B0otIO61Md2R5eCrI/2B5rwyeh+m7dHoESrlmeLlqUWfm4nfFSApFPPi
         yjT3bHUjxhNG34F+legXvYDQmi+y4rKAEncxT53IuBeLY8TZh/yG7vkZZCjlm6JSmTA0
         vUPY/vHahk6XMZW5BkMfH3f5POBVC+EvK0vfHG9YC+ISqC4hu6v/NsC2QVkVJHyiqdA+
         ZyxQ==
X-Gm-Message-State: AOJu0YxhZ8mEw5ryWBd02WbkW+zwyYvGYiyerNn8PvASd5llciAUDCJC
	0wuD4cR9y/nHN3hlUD11P54OjSoEEaPU15d4RNg79n+a4IYJN/9JmIMdWyvcAVri
X-Gm-Gg: ASbGncsI70lMZGpg/H4qIgYINr379b+nAsJaKcJZIDLKKorkdAatv2QpAY9a8/AqZvW
	2Sq+uNfR5G7SYwo+/IcnMRocml0qVKJQKH1UMwOXFoX8Ue46ubCwKNWMOZCZ8fMIp1KCwp+2O7c
	04qFurRlAULLPB5YoK6YNwkOiNr+PDCwcL0sHpXoouHTjVMgc9QmOscLcluDItLa8mS3uieAC/N
	0Z0kTCcyPd3UOLJnwqIATiJRlDWsSqw0sDeXGSSWJF7axTIP4UXkLLnlLq+D1MkpUlWH4Z2MVQA
	WMSbM6PYwGDOJrmosi0Sr7M0FqjuzqH7BlwGGOSdQvogUVqN46hnyma+nBWMKPjrWfvgBFgmM/C
	sufLLrIXi7TqpyHcAmqwcMCAw6r7dScHLG4752BDj6D/PutLGUcsVZPwRah4c2nSgyDDwQ3Y1cE
	JgKn/6QBBL
X-Google-Smtp-Source: AGHT+IEbF93WnAOoscHNW0+if56h3psajUl57h8fJtqjHDrppvtQoAusqFHVrB9RqcWgR0Xyb3mBCA==
X-Received: by 2002:a5d:64a6:0:b0:42b:3878:beb7 with SMTP id ffacd0b85a97d-42cc1d18c40mr5527333f8f.43.1763839893069;
        Sat, 22 Nov 2025 11:31:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 06/10] exiv2: add missing CVE tag to patch
Date: Sat, 22 Nov 2025 20:31:24 +0100
Message-ID: <20251122193128.1703871-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122193128.1703871-1-skandigraun@gmail.com>
References: <20251122193128.1703871-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121984

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-29458
https://nvd.nist.gov/vuln/detail/CVE-2021-31292

The patch is already present, but it was missing the CVE tag, which
is added in this change.

The same patch fixes both CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
index 285f6fe4ce..e7fb887844 100644
--- a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
@@ -2,6 +2,9 @@ From 9b7a19f957af53304655ed1efe32253a1b11a8d0 Mon Sep 17 00:00:00 2001
 From: Kevin Backhouse <kevinbackhouse@github.com>
 Date: Fri, 9 Apr 2021 13:37:48 +0100
 Subject: [PATCH] Fix integer overflow.
+
+CVE: CVE-2021-29458 CVE-2021-31292
+
 ---
  src/crwimage_int.cpp | 8 ++++++--
  1 file changed, 6 insertions(+), 2 deletions(-)

