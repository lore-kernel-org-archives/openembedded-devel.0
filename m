Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294D6C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:07 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.17543.1635592566791638302
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JDzMJ/il;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id f5so12383176pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1Zk3e+23Pis+1l8S+qBIgtY4vHN3QZDb3R0jBfG/b3U=;
        b=JDzMJ/ilqCkOqnVDI7p1usCa6MZz0GnRojZeVQjvctD9XpJsPs2fLWWAxatJ9r1j7F
         J8Hqv6MPfZm21N8ZusbAfIzYrtJlSmjlESdz3sMi359BsNbcypMn/V35gkP8iGc/v8k4
         1A1oDuSSws5PSk8uHOkwItFeXSKxFDpe7CZrR5Nyso8zViVmmQcwCdt619u4BGU0k2BN
         PiRF2MLgkK8ZHgWF0h2j4IPT43MXzx9sV2uHO2JdgUCPsT0d+igHeITuJ83i2LkxFGLM
         bJ9/FKXp7NnyUGUVl8ITJs3EnR5XxuCF2ezGBs+jho/P5pRvoEF3pTKnit9N8pyk5My8
         lY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Zk3e+23Pis+1l8S+qBIgtY4vHN3QZDb3R0jBfG/b3U=;
        b=vpFF50mclsRuGmIKe/RKJowJfSEjHV2AizcCfPGRAfk7gyqJJHdpCsfembIYytu30A
         jQs6pfNAPrOXCIT5pH1vO0fU+Kijehy9zKqWUPVmNM3372XJfn1imNmFjIkabRh5jMg0
         oSSMQxo94SKOE2As/7SZjGrcnFnQENXALER1VoteBB/9YV20vubW3lwL61qry85AIoPD
         eu7X42cM2g+r1tEJOrQDbB9kik2S6RYUypf8hXAbw09z54tWsyqPbo1icY07vxFYKxmg
         e/qbGd4NysPZGDQ8ngGVR1f7HQ9zHI5wyvR2D9p8CHy023asCES7sLDLX5izWmcBq5qP
         zaow==
X-Gm-Message-State: AOAM533vQJmWrQ8PVXRvDgqtun4aXFsENOYCVamkTfEiTRg8+WrfAE3o
	6d32J4nuyrBwGWXHFht8XlOrCqItFH8=
X-Google-Smtp-Source: 
 ABdhPJwApFtShwGoGYyEFvr+W7pIM6BqlTSQAaROs3j4SroDxBmVrFjATxx7TMMYobfJeT0lQLw8Ow==
X-Received: by 2002:a05:6a00:8cd:b0:47b:b9e8:7c2e with SMTP id
 s13-20020a056a0008cd00b0047bb9e87c2emr16314467pfu.61.1635592566089;
        Sat, 30 Oct 2021 04:16:06 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 08/14] redis: upgrade 6.2.5 -> 6.2.6
Date: Sat, 30 Oct 2021 04:15:45 -0700
Message-Id: 
 <feb4ef9fe883ed703cf51c23de9a453ddb88bba6.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93665

From: wangmy <wangmy@fujitsu.com>

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:

(CVE-2021-41099) Integer to heap buffer overflow handling certain string
commands and network payloads, when proto-max-bulk-len is manually configured
to a non-default, very large value [reported by yiyuaner].
(CVE-2021-32762) Integer to heap buffer overflow issue in redis-cli and
redis-sentinel parsing large multi-bulk replies on some older and less common
platforms [reported by Microsoft Vulnerability Research].
(CVE-2021-32687) Integer to heap buffer overflow with intsets, when
set-max-intset-entries is manually configured to a non-default, very large
value [reported by Pawel Wieczorkiewicz, AWS].
(CVE-2021-32675) Denial Of Service when processing RESP request payloads with
a large number of elements on many connections.
(CVE-2021-32672) Random heap reading issue with Lua Debugger [reported by
Meir Shpilraien].
(CVE-2021-32628) Integer to heap buffer overflow handling ziplist-encoded
data types, when configuring a large, non-default value for
hash-max-ziplist-entries, hash-max-ziplist-value, zset-max-ziplist-entries
or zset-max-ziplist-value [reported by sundb].
(CVE-2021-32627) Integer to heap buffer overflow issue with streams, when
configuring a non-default, large value for proto-max-bulk-len and
client-query-buffer-limit [reported by sundb].
(CVE-2021-32626) Specially crafted Lua scripts may result with Heap buffer
overflow [reported by Meir Shpilraien].
Bug fixes that involve behavior changes:

GEO* STORE with empty source key deletes the destination key and return 0 (#9271)
Previously it would have returned an empty array like the non-STORE variant.
PUBSUB NUMPAT replies with number of patterns rather than number of subscriptions (#9209)
This actually changed in 6.2.0 but was overlooked and omitted from the release notes.
Bug fixes that are only applicable to previous releases of Redis 6.2:

Fix CLIENT PAUSE, used an old timeout from previous PAUSE (#9477)
Fix CLIENT PAUSE in a replica would mess the replication offset (#9448)
Add some missing error statistics in INFO errorstats (#9328)
Other bug fixes:

Fix incorrect reply of COMMAND command key positions for MIGRATE command (#9455)
Fix appendfsync to always guarantee fsync before reply, on MacOS and FreeBSD (kqueue) (#9416)
Fix the wrong mis-detection of sync_file_range system call, affecting performance (#9371)
CLI tools:

When redis-cli received ASK response, it didn't handle it (#8930)
Improvements:

Add latency monitor sample when key is deleted via lazy expire (#9317)
Sanitize corrupt payload improvements (#9321, #9399)
Delete empty keys when loading RDB file or handling a RESTORE command (#9297, #9349)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c48feb5f184738e88e9dac4e4f9d8598743f7109)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.5.bb => redis_6.2.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.5.bb => redis_6.2.6.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.5.bb b/meta-oe/recipes-extended/redis/redis_6.2.6.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.5.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.6.bb
index 58d759b59d..87fade7e04 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "4b9a75709a1b74b3785e20a6c158cab94cf52298aa381eea947a678a60d551ae"
+SRC_URI[sha256sum] = "5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


