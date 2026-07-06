Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B74CC44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:46:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146582.1783331193580026081
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PsvFfave;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476d8e647e9so2376759f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 02:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783331191; x=1783935991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4AxHM8kk3UCRe2BVkIDHU8ZenBpSR28qDqIv2SVqA0=;
        b=PsvFfavesVHYiO1raP0owGs4pZKRfjlMGndFUfFLbA9dhxfhB7nBinUhpd9yrLAXqp
         jLzUWlMdhU+E2TKf0QooenRWFPZjhfuZ0Iy1GY/WtifX76NE81xVk6NbZGj0X4TgX453
         Pvfo19Mxbnbt4hr78kJHCm5EiYyANW8TENQIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331191; x=1783935991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4AxHM8kk3UCRe2BVkIDHU8ZenBpSR28qDqIv2SVqA0=;
        b=Z2Rv3zNKyGkJbH89JODrlPKF6xbjFLn2nOIR6+vd+5tmAhxug1uAonx/NPio9T8S32
         rvPbMXbPikwXGwlDo3Vl1VQjZ3ZxKrKcn0V+2HPd2Xyn0or8gwAQ6bbM6lH5t+qbtwYJ
         OfRsTzjJl+NRoJj/uv6dqiyOZo2J6tmWImn+8+Ru0xg+orrHJuXFCb5RIZpZLUrR7CEE
         kCn+Fdic6UqFBVyg8WHgzMoI3o9EvlIYhJS63vmbM4J0LE8VLsWvJjT6aTqCIjM3dC8s
         yuSI1cO3Gwl0KxfGOQxTHb4UW/6vIEAMF3sP5kOUs9uG9gAk21rOZODilAlmNmQ4lsBx
         Ur1A==
X-Gm-Message-State: AOJu0Yzpn5gJ+tIi7efDzhglOMGjz/Q9tIOqzWoPzyS/nHkSOkGIcs6E
	eNsuXarGl+hu9+TKCJaPeN6rK/vDQq891cTAuAjElnbXqJo/gmfGOTcFYmKE6ABaMHAn7bfp8Ul
	xu/Hc
X-Gm-Gg: AfdE7cnQrMo+VevnJH9nZQv0dbMO7eXlNq1C3c9pFxGizsZS2JNR+W9YIG8/L5J9rbO
	ukQoXbepqJB2k22yXImbmauvUgIqgbpQFAT0vhLSV7pgWVSlOkvs+MCjC65hOUzK7L5inqe3tLj
	5tkuevvNUrlnEFNo6q1q/O/Y6EcsC5N9tc8ncsEaIZgp/QE3N2Sxfq7sCmMC3oeb7LlKIkZwqlu
	Nogj8VNY1sK+A3Ink4T1/XFZGcyAJ5hSHfYlGEraZfqPp1gUuwSmnawU8jNXFK+ZW/ehQkVhxBn
	SJ0cuUFFeuafJohHIH+8hxt6hMwbcpk6gOnHhwL6scVYeYK4zWHxNuwbW5eImp1pqGfr5VHUT9v
	YpUcP1/jEDp6XpT0Y7XaIJhaRb7wQRJBm9HY0VlheT3ih9KYZF+/cchgL8/zWDMX+8l3pykc+Si
	IsW49tDSNYBU7Y8dojxdBXdBMFS7a0Tup6oDICR+cjboz80myWCjDR4N254qQObDdAmhIp
X-Received: by 2002:a05:6000:184a:b0:475:f0d1:eb68 with SMTP id ffacd0b85a97d-47aae69e180mr12698514f8f.53.1783331191585;
        Mon, 06 Jul 2026 02:46:31 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm22638978f8f.14.2026.07.06.02.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:46:31 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-stevedore: Upgrade 5.8.0 -> 5.9.0
Date: Mon,  6 Jul 2026 12:46:25 +0300
Message-ID: <20260706094627.1254799-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706094627.1254799-1-leon.anavi@konsulko.com>
References: <20260706094627.1254799-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128039

Upgrade to release 5.9.0:

- zuul: Use openstack-python3-next-jobs template
- Do not install code to build release notes
- Drop support for Python 3.10

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-stevedore_5.8.0.bb => python3-stevedore_5.9.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.8.0.bb => python3-stevedore_5.9.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.8.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.8.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb
index 58add335b5..6549551ae0 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "b49867b32ca3016e94100e68dbf26e72aa7b8708d0a3f73c08aeb220370ac715"
+SRC_URI[sha256sum] = "abbd0af7a38a8bbb1d6adea2e35b17609cf004eaac323e88a8d8963640dd2b3c"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.47.3


