Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C50CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 07:02:57 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.40116.1757574174948243333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 00:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ikh9TwsD;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aff0775410eso279159566b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757574173; x=1758178973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Phhh58DEnybkLIujlZWh5WW5+tqfZSal4nHrB3Iu1s0=;
        b=ikh9TwsD6t6LYJc7h6XmiIfbtRzkKX4dM1bebQs3bODnqmMXeCFaxMihyMSx9EIVDO
         BoEKCTM9cAHKc/YW0RWb/MDKf9Qsvtr47y42ieCaAtyBPJn+5Va/6NZHLZJHa8Yf7wDx
         eI4G0ky/blUfyZS2BlCq6it4ckgRkN1N4e0Bqbyee2IMJmwGKvaQIx4MQ3eAnE9gYLv/
         oQ63erjlytNnX9J90cAx0+2q/+fhAHRLcDiepIu1Nm8Pvx3bTdSbwBOnpwE/u5LU4a4C
         yFNfUuJsp/yqZwZqPl8O6EQCK20SUgDixEo4NKk7nYAkoXEjZC3Zy9vctuzo2LkYJ9hQ
         0VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757574173; x=1758178973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Phhh58DEnybkLIujlZWh5WW5+tqfZSal4nHrB3Iu1s0=;
        b=aawe0L4LEHuctd4317XzthS4dL41QcxrVwQkntKjeC6TwlMemK0ivXwihViCOoWTAY
         M4K1Zvsb3nhkqFJe2FeGDhQU+HT3OMyJcOKtAbqE/CusmteIbvHvGPbs6zQwu8QABjiy
         5bjcdFAN17nJ05K+iOO3dP0AE4hnTGjGhAZuQLYVetZd7bEfmr811ZceRl8NEco3/EAL
         kyeWWKHOwVR98wACPn+UnJ+xiwsph/rR1fwzezbNvTmsSDEKxbNqhYw87D6ufF8Fxwla
         6Qd09RpYtgKK/bTe8fxq7pTkyLUn0Q5y/t0XMCIJEuuYezLHIh1+lFacxIHqZnzVRyWE
         7lMw==
X-Gm-Message-State: AOJu0YyFC/eJBOXC2CDfv1FDZe96mMTyWOc1ckKHu+6pFK38kAAmJn64
	fpkqG6NMNQj/mqcDxOq+dD8fCri4D+rIGtgCfOOuo7gSclYrVrS9JUmy5El0lg==
X-Gm-Gg: ASbGnctuja732Q/6M3Rqr/mnTkkFHBTuA8BW+HLgRduyU5gBHX/57eDyPPqqLl0yinA
	Pnu5vG0TwdA90YQuD5e0vL1AtJfaaA2N3qho08hVj8nDq0M1rQM5Dg6w6oNRQddbF8IVUgw3PcZ
	CsDJ/cSth99N4EGrovBpMPqf03501EQWIk7ZreGV/XNlPSmcm8OmaC8RBBFPsTtz5OB1y3kVEXN
	9AwF/EGBBYDua8K46uUdRUSi6bEpgKsWnHWLTKPJnJp4XKDlDvPKbhJgqYwQVH0OkNBKVMnz8X2
	LNQ/CGL0jbGDBbn3NBuVDta4cMIADd7fSOtq0zSNvWQtg65LOd2b01bfYjs/k0pMeN4gN1Iyp/Z
	Asy/h3mtM+OFO73sG8ERG
X-Google-Smtp-Source: AGHT+IE2JQ29Z/qJVo5aPPgI/u5i9VDbMudNAhaxQmA/PdQas7QemVKQ6cghmVaMwBBkDtsFy1qS0g==
X-Received: by 2002:a17:907:86a7:b0:afe:8420:1152 with SMTP id a640c23a62f3a-b07a6490897mr218833466b.18.1757574172970;
        Thu, 11 Sep 2025 00:02:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334ed29sm64547766b.107.2025.09.11.00.02.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 00:02:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][walnascar][PATCH 2/2] libnwck/libnwck3: use time_t to avoid build failure
Date: Thu, 11 Sep 2025 09:02:51 +0200
Message-ID: <20250911070251.1112836-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911070251.1112836-1-skandigraun@gmail.com>
References: <20250911070251.1112836-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 07:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119354

From: Chen Qi <Qi.Chen@windriver.com>

The time_t type varies for 64bit and 32bit. So instead of using
long long, we should just use time_t. In this way, things build
for both 64bit and 32bit targets.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...Fix-build-issue-caused-by-OE-core-changes-to-startup.patch | 4 ++--
 ...001-tasklist.c-fix-Wincompatible-pointer-types-error.patch | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
index 0328202f1b..f16f3e1d97 100644
--- a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
@@ -23,7 +23,7 @@ Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 Refresh the patch
-Don't use explicit type cast to avoid truncation, use long long for tv_sec.
+Don't use explicit type cast to avoid truncation, use time_t for tv_sec.
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
@@ -40,7 +40,7 @@ index 7418f89..f0f30b2 100644
    GList *tmp;
    gint64 now;
 -  long tv_sec, tv_usec;
-+  long long tv_sec;
++  time_t tv_sec;
 +  long tv_usec;
    double elapsed;
  
diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
index 4e23f613aa..d9ca1f0cd9 100644
--- a/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
@@ -32,7 +32,7 @@ index 4f0c6c4..758fc5f 100644
    GList *tmp;
    GTimeVal now;
 -  long tv_sec, tv_usec;
-+  long long tv_sec;
++  time_t tv_sec;
 +  long tv_usec;
    double elapsed;
  

