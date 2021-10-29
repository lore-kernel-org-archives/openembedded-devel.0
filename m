Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678E1C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 15:30:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.6998.1635521455114044963
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 08:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YTaqnk/E;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id j1so569092plx.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 08:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lx1BPvHAZ1rmpBaRcWpLnOa0WgvYFc0ISvI4Z8QhAPI=;
        b=YTaqnk/EecbqggPTstLtDgu5FtdCJUmZmMYxk98+y19Zs2c7TqgEtGNwBXiUz0peYO
         /qe2BLRGq+KtpcapYTNsNpVWDEvJ44MmJfkGSoRTwYYWPESZYUIRp/r8P0abOE1sApuF
         fFvO0E6AOv++6JTT7ZBi9kaINh9B6NMT+lxvCtgMwYLLIPRCKmMIr8AJEl9t4k5gnZu4
         1+s6IMqU/EMrwuI5/eUHiYfJs56r2MfCMevSJVl+0XurNDfiG/wTjjUiFD10/8qFLhE3
         D2vCGe3SUNlHpLUhp9d7d+NNSpmF/0U5oiA2m8FvOJOGosKa8AbK5Mdmw648Ielitld0
         c8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lx1BPvHAZ1rmpBaRcWpLnOa0WgvYFc0ISvI4Z8QhAPI=;
        b=c+SPf0xIff/wOECXbE2f7G12TqSXt0t8HgA0iv32w1Xqg/pe9SiM8Ump4FPR3eLyQP
         oMftoMqbpSUSMHWHnxvmUadK05FVmzG/IOWDBU8mD+24SmZ9fIDwBpHBONMnCal4BL4k
         HAq/ccEJriB3F4PQvN3c3jt4KiQgeYMRmAgB94S+0+sN7SAcO4h0QFGutHv9eOF1ieM8
         EqgWEu1wGqLT23sLtGNgi84lv8Ru5ryskROq5YNah172zwC0GIVTeFuPK7SHwFIbbOOi
         0/Ho3halmHsg9UXespiNm/qLP+G7Hgv/fQt3PgcFbQk8O3pDB+ijcSiF7ZcXx8AjOKYN
         2wsw==
X-Gm-Message-State: AOAM530/2E4eKsPCFzEQeF2Jv4t4eYz0otZFOUHQ120vDyPLu4ixD+RR
	DQuZYkR2bgExiJtuiU3AiZun042XhJQ=
X-Google-Smtp-Source: 
 ABdhPJweoxxznD053d2zAKJ9rNkHirVSO3n9To7+HnIXYbePnPqoLR5QIT0v1BL70auokSpn82cS0g==
X-Received: by 2002:a17:90b:30c6:: with SMTP id
 hi6mr1315087pjb.201.1635521454155;
        Fri, 29 Oct 2021 08:30:54 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:19e5:407f:da45:beb1])
        by smtp.gmail.com with ESMTPSA id
 p17sm7133770pfn.191.2021.10.29.08.30.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 08:30:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] redis: update to 5.0.14
Date: Fri, 29 Oct 2021 08:30:52 -0700
Message-Id: <20211029153052.27473-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 15:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93653

Bug fix only updates. see: https://raw.githubusercontent.com/antirez/redis/5.0/00-RELEASENOTES

Including these cves:

5.0.14
Security Fixes:
* (CVE-2021-41099) Integer to heap buffer overflow handling certain string
commands and network payloads, when proto-max-bulk-len is manually configured
to a non-default, very large value [reported by yiyuaner].
* (CVE-2021-32762) Integer to heap buffer overflow issue in redis-cli and
redis-sentinel parsing large multi-bulk replies on some older and less common
platforms [reported by Microsoft Vulnerability Research].
* (CVE-2021-32687) Integer to heap buffer overflow with intsets, when
set-max-intset-entries is manually configured to a non-default, very large
value [reported by Pawel Wieczorkiewicz, AWS].
* (CVE-2021-32675) Denial Of Service when processing RESP request payloads with
a large number of elements on many connections.
* (CVE-2021-32672) Random heap reading issue with Lua Debugger [reported by
Meir Shpilraien].
* (CVE-2021-32628) Integer to heap buffer overflow handling ziplist-encoded
data types, when configuring a large, non-default value for
hash-max-ziplist-entries, hash-max-ziplist-value, zset-max-ziplist-entries
or zset-max-ziplist-value [reported by sundb].
* (CVE-2021-32627) Integer to heap buffer overflow issue with streams, when
configuring a non-default, large value for proto-max-bulk-len and
client-query-buffer-limit [reported by sundb].
* (CVE-2021-32626) Specially crafted Lua scripts may result with Heap buffer
overflow [reported by Meir Shpilraien].

5.0.11
Integer overflow on 32-bit systems (CVE-2021-21309):
Redis 4.0 or newer uses a configurable limit for the maximum supported bulk
input size. By default, it is 512MB which is a safe value for all platforms.
If the limit is significantly increased, receiving a large request from a client
may trigger several integer overflow scenarios, which would result with buffer
overflow and heap corruption.

5.0.10
This release fixes a potential heap overflow when using a heap allocator other
than jemalloc or glibc's malloc. See:
https://github.com/redis/redis/pull/7963

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/redis/{redis_5.0.9.bb => redis_5.0.14.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_5.0.9.bb => redis_5.0.14.bb} (93%)

diff --git a/meta-oe/recipes-extended/redis/redis_5.0.9.bb b/meta-oe/recipes-extended/redis/redis_5.0.14.bb
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis_5.0.9.bb
rename to meta-oe/recipes-extended/redis/redis_5.0.14.bb
index d04293369a..3d849ec8c3 100644
--- a/meta-oe/recipes-extended/redis/redis_5.0.9.bb
+++ b/meta-oe/recipes-extended/redis/redis_5.0.14.bb
@@ -17,8 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            "
 
-SRC_URI[md5sum] = "c94523c9f4ee662027ddf90575d0e058"
-SRC_URI[sha256sum] = "53d0ae164cd33536c3d4b720ae9a128ea6166ebf04ff1add3b85f1242090cb85"
+SRC_URI[sha256sum] = "3ea5024766d983249e80d4aa9457c897a9f079957d0fb1f35682df233f997f32"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


