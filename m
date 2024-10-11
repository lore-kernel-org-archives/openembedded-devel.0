Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D22CFD2EF
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:55:19 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.7080.1728636914428899404
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YR21Y1Gg;
 spf=pass (domain: konsulko.com, ip: 209.85.208.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c94b0b466cso471530a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728636912; x=1729241712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8zaZS6W9fo3K3GOkZ8bpg/9mrjsndnIhPpSYeu1Cww=;
        b=YR21Y1GgV548a5Odq75GX2WD/ykLQ1cowR9jtH/Hs/x2cCZtApwnju8JlVuQjx5SZe
         +7gI8UCBQ8hf+iYvvpP9IA0q+sv8WUnrEIdRmivJdoa62S2u3QxmAoYUILUwjdKWT4h7
         jchPsRJ02yCFcrjvZLALUEy4n77YoIQfROI0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636912; x=1729241712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8zaZS6W9fo3K3GOkZ8bpg/9mrjsndnIhPpSYeu1Cww=;
        b=LWnxOXyvjwCUKQ543gq4wUFG+fF0qJzf/OA+1AhmaSQ1Xa3DfLYnJLAowPVMXuOodj
         NIhF0A1eXK1yZNJVwh9SD3uXp5nElbw83ggBQFU4Um3au7Ia92RjSaVa+H/HlrPV06PR
         VquUyivEC8Slla0JX13yXpTH3isTtv6tR9O8tjKQZojT/yAswG8ZmPnGCyEHLpZMm8oa
         p3xh5Rs9PyeMJCc6c0E1910swtKE7uM6Am1mJDuxpvH6CNdeG83keU9gs1qYacCjFG8j
         AAus2YegJtdCPlk+brydP1FfCclj/kdRFo1D15pHGN7Ipez4mA6nkMPhiKs0OK9PnZbY
         Smqw==
X-Gm-Message-State: AOJu0Yxw6IktWQNEvJ9VP1N0QNdYiSfWEr4b0bG4Ah48JVLVwcjzd3YR
	CSewIn/C+TsVupjWjcofreIR563uLj7lTurEEw5kAq19V69i899ePOwhT9udEzob+flkS/Tuyqo
	m
X-Google-Smtp-Source: AGHT+IEugIeTso/YBpCd7HbVgSjub8uafqH5LlE1LAQfl9rpG1J5WTpX0tQU9JDYFxr7vMUqxqYnJg==
X-Received: by 2002:a05:6402:348b:b0:5c8:9f6d:8b2f with SMTP id 4fb4d7f45d1cf-5c948d67e8cmr1253528a12.29.1728636912128;
        Fri, 11 Oct 2024 01:55:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153939sm1713866a12.47.2024.10.11.01.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 01:55:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-redis: Upgrade 5.0.8 -> 5.1.1
Date: Fri, 11 Oct 2024 11:55:04 +0300
Message-Id: <20241011085507.3722721-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112791

- Fixed return type for Redis Set commands to be Set instead of List
- Fixed bug with partial Hiredis availability
- Fixed bug with async pipeline and cluster fails with some commands

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-redis_5.1.0.bb => python3-redis_5.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.1.0.bb => python3-redis_5.1.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.1.0.bb b/meta-python/recipes-devtools/python/python3-redis_5.1.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.1.1.bb
index d9ae98ddc..a7ccc9558 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.1.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX="pypi-"
 
-SRC_URI[sha256sum] = "b756df1e4a3858fcc0ef861f3fc53623a96c41e2b1f5304e09e0fe758d333d40"
+SRC_URI[sha256sum] = "f6c997521fedbae53387307c5d0bf784d9acc28d9f1d058abeac566ec4dbed72"
 
 inherit pypi setuptools3
 
-- 
2.39.5


