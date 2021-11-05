Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C62C4332F
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:05 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.5267.1636118163984234234
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=meSNtJbQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id g19so2819200pfb.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lx1BPvHAZ1rmpBaRcWpLnOa0WgvYFc0ISvI4Z8QhAPI=;
        b=meSNtJbQGCvIp6lYFNj+mcC/EsEzIFRxIkDMxwBn92GAEkoowUDA3lvn6dLmMAr1KM
         QZAMXIVeXas7P77J5DTOEdvKtJHr02oVFaNTBm4NXgtwSivUw7r0enVesqk05Xn58onW
         fRalHnVikUREHMKCOF6cy+/4ApJa+rw7KwuFgrbfHIg44I6KnQaHC2qkNg7VnPawR/sn
         SxpBRoSkmRGfWqhzPiGZJcbDy32x5e0EoPAUaXa8iLzU4V70tm2scpxFmLvchr8jipqo
         zzGLpzYqcbWfFM2NwFFxx8D2/bEcgBG3c06/Pllj1ATFb+RAJS77/hpUVZBClBE33HL/
         cEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lx1BPvHAZ1rmpBaRcWpLnOa0WgvYFc0ISvI4Z8QhAPI=;
        b=vlM2rM50XA2KI3BeUQpghlcgYlHnnEfsOAu4JjHz515UVxAS3HY3+2NWbkfdKg+Jke
         KBaJiASOgsQuk8Iy7oAI0zor9w2gGBGK9/wHzXxpOlIk+6IgpDUL9tOLXELMVpIvFTeR
         MNfu/12NqcpXhSK9GJHusvbrp9BsQjtwAliU3m4w9vJd4mcU2CDPSLFOFB2V8EDE67DZ
         fUZc/j4mHvxP/luvjQtFzShzfMEdX/4BGAgKYagAnxQGxKjUwm7W7aOYhujXFCHTABX7
         J4+SziYBvDFMPwd4SAsLaBxeAhvfg5pn8CszZhvAuO9CsY6OQMbbeM2QffYQjnO369c0
         brfw==
X-Gm-Message-State: AOAM531irwCmnTiRik+XxqD3ImkfEO4zzKk06wyyJmIdXjWZkZhvIGJe
	hfEbIfVizTS58KTxpUAAKS2xofhhXEs=
X-Google-Smtp-Source: 
 ABdhPJxjT9pHpPAtrRjaH4am1pYaC3NChHwjUxVDBoDE3EjOiCAtnzGKurhpOhzxNrldO0zhzOy7tw==
X-Received: by 2002:a63:c042:: with SMTP id z2mr8131883pgi.273.1636118163265;
        Fri, 05 Nov 2021 06:16:03 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:1036:3e93:cc4e:1fe7])
        by smtp.gmail.com with ESMTPSA id
 c85sm7899124pfc.146.2021.11.05.06.16.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:16:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/10] redis: update to 5.0.14
Date: Fri,  5 Nov 2021 06:15:49 -0700
Message-Id: 
 <6be10fe608c09653416ae8c85377056ccaa9f1b9.1636118048.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636118048.git.akuster808@gmail.com>
References: <cover.1636118048.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 13:16:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93834

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


