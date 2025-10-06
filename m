Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20999CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 20:29:08 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.2672.1759782545995633195
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 13:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N07y8sB3;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6395172532fso7036620a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 13:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759782544; x=1760387344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7N45C8DKyyOPICZ/Y1GwI/AYodAptBhF/otLA5MtxOQ=;
        b=N07y8sB3RiWzQ5ttGisMec9qaWi0GRzoNFrRw/xqvQG6ObJYFnnoPi0+dS9b09GPwb
         2nHsn242LH40WzIw7dy+UasJrsuz+lqBdVG+Bl8VB0S0lgP+r94AyaWqzBBhMQDxptHj
         CyQoiANGsCLVJbFZ7USjsM8q7JQUpyWXgDo2E//Dba3r7TfSrMpsiJu3Or5XyJLqMStE
         0WZ1A6/lN44aI8Ym5TVN/yMjmXFdzrWFbmSGc5yKGLGOxE6m4s7IvaB4OHxfbGSZSVFo
         n2lxt/N2a9wgvhdDOvhkxq1ScRpQYsPnhitiz9NLPmwVnR47Ed76/EOPec5hjeQ+XPvu
         5gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759782544; x=1760387344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7N45C8DKyyOPICZ/Y1GwI/AYodAptBhF/otLA5MtxOQ=;
        b=BSTY1AJIrMgT+t5BwXdKcNbW9BKE6rS8CsbWwuVKSha/wjvfHrXK17q1sutfosCRjt
         DvGQQs6lKuXJwzgMuQK5GJVr45A38GwY/0PYH7uVf5WstU645+VkRUHD/abMkhPFCR1h
         dwtJVp6Fw2hs69XjitRE1MF3LXJG16TUYZ8COatY9WukTap8A7RiC7SDuArDlm2JrpI8
         aQatazS7cPkvAwtftyPOeuFmB8OOKTBcchFF99rm0dIR/gzmBPWMtxcIfAgCiierbjZn
         j8AS82xQRUZ395e2N6NRJVWqiPh3gN8n+QuiMWYRctPZ1U3addttZZP6z4ATDnUm9xaB
         Pwog==
X-Gm-Message-State: AOJu0YyRubheJKUXjC3/RdlaBlOxepzpuJ62WnE2iFukUrkf2ZA/LPrI
	oeAG9lQmfDVRnVXZhMZXXWJf0LxPnp6XfvzSQXAVyXN2NE5S/7d5jYy0e6a5Hg==
X-Gm-Gg: ASbGnctb0mgkgsR6Je1r38va52H/G6QVIzCZZ38i7s4OLMz3Qys8pGFYirmYFWfi0kR
	XXseBqnH046Zldj0WgbYjZPxtrl96SeWJJBEx9NV+2UnhX1kEBhDz+UMTS1BcHfqp2Re+2SL/zQ
	q9PUaJb2KT5n1Exqi4Fl/Zph5GcsTpgnx6Z1x46bsA1ZhQrgzWACUg2Zgu8qoCXQnU0pF9ImYWR
	Dupfh4O7MAjfK9WMYNl6rCSIGnTKc3FlSGHR3OqaFy6N4PJ9x38omkYY3tyJwX0/N5M/kHM+aQL
	B3mISeUEwBF5VVHQOVdLmIv4qQHPPHHd7l5f34xxDQkpSjj3YEfdfUP/R3LQFEyL27dAqysV5on
	6XzlXBl+4BRa+S5kwIghChLj0LqPVGsvKTn+Xj1+7+YFf
X-Google-Smtp-Source: AGHT+IFQazyF1P7FLa/KZvUV8vOZegy+MdQctVc3moS4mNwxzkcqC9VFK0ZNEmWkokUruEH70HeTew==
X-Received: by 2002:a05:6402:786:b0:634:c4b4:e627 with SMTP id 4fb4d7f45d1cf-63939c26104mr11071346a12.29.1759782544048;
        Mon, 06 Oct 2025 13:29:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881000e8sm10953838a12.32.2025.10.06.13.29.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 13:29:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: upgrade 6.2.18 -> 6.2.20
Date: Mon,  6 Oct 2025 22:29:02 +0200
Message-ID: <20251006202902.2137866-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 20:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120315

Changelog:

6.2.19:
(CVE-2025-32023) Fix out-of-bounds write in HyperLogLog commands
(CVE-2025-48367) Retry accepting other connections even if the accepted connection reports an error

6.2.20:
(CVE-2025-49844) A Lua script may lead to remote code execution
(CVE-2025-46817) A Lua script may lead to integer overflow and potential RCE
(CVE-2025-46818) A Lua script can be executed in the context of another user
(CVE-2025-46819) LUA out-of-bound read

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.18.bb => redis_6.2.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.18.bb => redis_6.2.20.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.18.bb b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.18.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.20.bb
index 171c6640f2..f2e6175462 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.18.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
 
-SRC_URI[sha256sum] = "470c75bac73d7390be4dd66479c6f29e86371c5d380ce0c7efb4ba2bbda3612d"
+SRC_URI[sha256sum] = "7f8b8a7aed53c445a877adf9e3743cdd323518524170135a58c0702f2dba6ef4"
 
 inherit update-rc.d systemd useradd
 

