Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AA9C61DA0
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.44969.1674653491218567072
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PNCH/7a9;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id t14-20020a4ad0ae000000b004f51f61de9fso3133778oor.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylpIWFTkRJiRifIvsK6B158v6rg7M2ABserz7lUifM8=;
        b=PNCH/7a9QKjY9H3gfQVHRPVsj1g/2/5aY/Mh9X8QemWj2UpbwMgbNCwxdN6D3JgPJ2
         WLYh0OOjuM8DG8fRIn/Ot3Euwg0sK/1q0AoAeNC8k2OnTV3Gj4bhnz1S9jUEff/7E2F3
         7xnvdZZUPFiE8ozadjkP4DOZPbY/ySy72V16U1LeZPAePvOjNhwIjkwQTutRh9wsvIHJ
         sS6ARm0xk2Dps+RxHnoW/Y8l0j1pwBPfIy5AcDwC0eK/neQxyBGOX4lKixoM+0Azc/8v
         Ck9X5AC+4ArMAFtBi9Oxx+4KvO2KaEkAywu0PMqbWtvusMEMkl6g88Ume2mw7CqBdq8o
         Dr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylpIWFTkRJiRifIvsK6B158v6rg7M2ABserz7lUifM8=;
        b=N43+p2EoAlu0HN9teDJJlXnDHjLGK/f8LZSyRYKxCgvmyWU64aDy9/c6PHW8PuOic4
         JUeR1aEbcEdch1iPtj+WnrvIyKuHh8iVnnDzj2QA3SgH2B49qO3AXqcKzZ8+bkLEqo0z
         N5b7ZuDWhZrtWniMridxr/QODoQ1O0lBm3BGi0aVopl0p42F1i160I/PQ3R6JxWIu+lk
         s3e/Ji+R3wakOO/N3g18p9VoPytN5CQmiXtReQWCQrpVGAKHENSBrmOpXQsbCbYe8mBu
         8nGkVNVuFKJc9SyOu5tbJJMi1q1ROIeZxuD/D9/UhcvDSMsZP62VcgOPep0/D2L3ldGc
         cQIA==
X-Gm-Message-State: AFqh2kpfqvxJYOnsfak5YuFRRgt+HMa2+j3PXTgZwrZzWHpdlbk20fiv
	9+Vhy5nZQC2NpnNn7HzRB2k5fNMI1uM=
X-Google-Smtp-Source: AMrXdXsvtnljLN/D8iR2HjITowfW0bFa2NrNzrGwITTohVRcWNObZk3HSZHDRtQB0L0wbssag3KDzg==
X-Received: by 2002:a4a:da44:0:b0:4f2:b017:4c50 with SMTP id f4-20020a4ada44000000b004f2b0174c50mr14648825oou.3.1674653518314;
        Wed, 25 Jan 2023 05:31:58 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 32/41] redis: Upgrade to 6.2.9
Date: Wed, 25 Jan 2023 08:31:14 -0500
Message-Id: <947058e21b9c6e0a6359e7a902928880a7bc4095.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100767

From: Chee Yang Lee <chee.yang.lee@intel.com>

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:

(CVE-2022-35977) Integer overflow in the Redis SETRANGE and SORT/SORT_RO
commands can drive Redis to OOM panic
(CVE-2023-22458) Integer overflow in the Redis HRANDFIELD and
ZRANDMEMBER
commands can lead to denial-of-service

Bug Fixes:

Avoid possible hang when client issues long KEYS, SRANDMEMBER,
HRANDFIELD,
and ZRANDMEMBER commands and gets disconnected by client output buffer
limit (#11676)
Fix sentinel issue if replica changes IP (#11590)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.8.bb => redis_6.2.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.8.bb => redis_6.2.9.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.8.bb b/meta-oe/recipes-extended/redis/redis_6.2.9.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.8.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.9.bb
index 02ee19fb7d..100c2a2a5d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.9.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "f91ab24bcb42673cb853292eb5d43c2017d11d659854808ed6a529c97297fdfe"
+SRC_URI[sha256sum] = "9661b2c6b1cc9bf2999471b37a4d759fa5e747d408142c18af8792ebd8384a2a"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


