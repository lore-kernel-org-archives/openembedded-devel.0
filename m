Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEA0C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:22 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24994.1785872478155154800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mFCPxKKq;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce98cb8165so3166615ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872477; x=1786477277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSmb2sweWSnDdUYMFIaRawnny5PQgX9bF/EaFCgLG+c=;
        b=mFCPxKKqxffzV8C+GGoLtbV/S5i3q+0xJ0v6Ysrjh0YUxSWMzA75dtTJBbXRHTrsB9
         +UFG8kX/DSRrZDGFPfqsLpQ8ZW3nsQU9+2aD351AshzdqPJFix4aM/w18uQQAHw9NZMS
         fvCZmAzqdRy08soyyLsba/yoTKeJjBejdxHO0rQmlx5xhtv0RmIKiSHM6ehxkrZaTf+5
         1f7JowdyYfzCJyLeSaoz/0D2auy87dIOBq53uncgGqTwrWL5vNiwz6XPbQxuuhQ7uwS1
         b6iY1XUGKnTapkv9dEyZUNFSJybVrUsa9BKNlj9ZzXvuRqvB4HNSOoiELW39/OaGe0py
         J+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872477; x=1786477277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSmb2sweWSnDdUYMFIaRawnny5PQgX9bF/EaFCgLG+c=;
        b=VNFjVji3CS0nDF8+qu/gnlcPCbiaMh7+YDzzm5Ri+y3MkRO5KyVQB165fDr+XYmt2K
         YL8bovlGhQmrDXUfNTG+q1Q+4SGTfbY/fPEN9V1evyL4DZ7kIVXkTmypLJR/Jo2G1sJK
         Ba8ctM6NVM7XOwFtyBnTF9uS7VzARJm/1xlsEXuMPzT/JPeIdsdOOYIGXyyPKVUVagy6
         6/CKQi4poy4Nma3+8C+LeJFKsFoEf1+wLZJjndG0TXP9dHfDIR/pAuslWJW5GqPNzcsM
         scVtv1wYOSTDA2o/W0RaQX9NUEGWo0Amz9QDdvE/yDRo2XajXjdY/3k+xC/Sc60VC140
         rt9Q==
X-Gm-Message-State: AOJu0YzsEvE8ECeJfgINApAtWcmQnrbRFVFiLMArgiaK53hXqhEh9BoR
	D5ActRuZkseGyHbsB2Q77N8MRtoPP9fOQzJspzhEWldt3VTDtAw2jBhjdfsp0FJK
X-Gm-Gg: AR+sD12YVKu/LI5MnTJZvZpVzdudcMttOUsXVyaiqdPLDL0CsGSjLZVrBWlu1BTfQ22
	Av/5QFssrfG8giGz8mE6OlqCSdxymJnwsr6+XScsBmxenPj4B9LcGX4YCevUQ3zT9xxrR9F35gN
	KXwt8hN/OGh36Mqp+u6R12jt3ntwWPPflYT6jKP6dIN3YcZV9fSzAuiAEWkMsjYpvkVk3gUM+it
	thNLVyhe0jas6I6WW7I+ecHAqsWejChUX9LVa8Vit/CNMyn/IpgzHdY1RdDgAlcL/+yUrtJQdih
	iTyvCNf0eLkxtHuVYzvmrSwJC8n/oVwCLzEurX4CpQt+tkwWua12sYFzKQM2FFJ0zrWsSQNRGQv
	YweSpczrgDWEGArulmJxy7WPuSrQ8JSFxEFqzx5SeA5YMdpHkdfKVlcL3z8cwSQfRThWJNLWl4F
	auIzJVTnzSxRihhM+0htfz5uWigpepoy/FNzemFZlNH/B0rb7wfqDbAXmUdY5MSyrdElq/xG9k/
	JLSIyx6TD9c
X-Received: by 2002:a17:903:1208:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d08aa64448mr52632715ad.8.1785872477436;
        Tue, 04 Aug 2026 12:41:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 27/36] libupnp: upgrade 1.14.25 -> 1.14.31
Date: Wed,  5 Aug 2026 07:39:54 +1200
Message-ID: <20260804194003.3158916-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128774

From: Khem Raj <khem.raj@oss.qualcomm.com>

Upstream changes (ChangeLog):
 * 1.14.31: fix for CVE-2026-41682.
 * 1.14.30: revert an inadvertent API change (25d4bd0b).
 * 1.14.29: CMake builds from the release tarball now work.
 * 1.14.26-28: SONAME/CMake build fixes and assorted portability fixes
   (e.g. OmniOS POSIX asctime_r).

Version-only bump (git tag release-1.14.31); recipe unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit d98bc9596101d3eae2921cd93f1a35b72869edf6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libupnp/{libupnp_1.14.25.bb => libupnp_1.14.31.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.25.bb => libupnp_1.14.31.bb} (94%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
similarity index 94%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
index bcecfd3b8e..6ba21971d0 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-SRCREV = "da7cf950f22357545061961b7e5610e08690b0cf"
+SRCREV = "79ff958ed1012e60faba84981481f76cea43c7f2"
 SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x;tag=release-${PV} \
           "
 

