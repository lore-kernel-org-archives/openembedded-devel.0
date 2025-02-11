Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B8DC021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 12:57:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.11600.1739278655081678108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 04:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DZvDNu+J;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43937cf2131so19084905e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739278653; x=1739883453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WskYQkfuwgxQOdTNTpyAaIn57XzapsmL5vF0juv5A0E=;
        b=DZvDNu+JyCbqMuxGaR41uRZ74WcJOS3X0ZiRWyUeloBuEgNqPJqpoZCSLzQpoHkpWt
         xVcA1M4uAhsxBg8zUZH4gYpIS0HlTKoBREA256gA1R3jU8K0dDOIldL5SIm/7uEXdh0u
         jWsv8Zgvw93npV4/FNz/EnIf00wanD5+b1TQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278653; x=1739883453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WskYQkfuwgxQOdTNTpyAaIn57XzapsmL5vF0juv5A0E=;
        b=u+rg9BFzblXjCFbFxyWX5UwJ7wmmdOlxQXVvFd5Tgqwhvo3bHN7Qe/q8kGf3KVdOEI
         YkShKaleUM5kbfiDsuSI6afbNJoFLeWkQqYRjOyF44s3E0wCtkIlv7ZhC2N5kAY2/bXW
         OVV+mhj7qdVXA8w1/nKSLTNfnDNSeApgZ3SR6sgKoJnPm8q5OFWLmskbTHUHTXs04R/v
         UH7LschYUOnDa6gorZXUslyddAmuH8499GO7F8RSHyNuY9DPax6zrkcG+ZTXRk0VWphy
         RW0+2ZNc/zmQb8mpuTtP+0CkaJLJAPMhUFZk4r0NMqdORKroho1a3AW96Ef3C8EFdcoQ
         VYvA==
X-Gm-Message-State: AOJu0YwluChVI1dhCf8V9XkZMpd8g6Wl6WoRM8SB+CfLkiodDW0gK4XM
	JxpDs1bTeMdRRtsLY68uMic/pSEsCEoWqcxXqV+z51MAGNjU7ED15lnSuKGz5cjumJ+G7YEf1wv
	v
X-Gm-Gg: ASbGncsNOcnOTUudLQkXNtgTUvgYZtVCcfj834hSEi/zTWXsj83BrXUURC/vozyibdy
	mAEYIrVn49reMpOwpJqrnWA0AlBi4DM12QdYBggGAq25z35gll0l48iuucFev0Kgoo0wbPbt31f
	318KZfhsuBYabEb3RUH3vACpslXXmh4Kc7MGKnmewTr4qHme0tc34Y+RPk06PIuGwbm+1E5iu3o
	jjau6qEUizOjGAnRZL9oChRMXcUrGrgsgo3eiGAugF+kDbG+YrboHRoHQZi/wMBrGbr3cCZNgz1
	ZnuQm1M39vvWE8U8JJAgkee87p7Cgg==
X-Google-Smtp-Source: AGHT+IEx0wwyJClAoB8AsOGWx1PPJ3YL9vur0Ubr8Fvf/393DoDP7LfqR3CiD7AfNcsuH9BmEOdNtQ==
X-Received: by 2002:a7b:cd17:0:b0:439:5664:cedf with SMTP id 5b1f17b1804b1-4395664d093mr9521405e9.6.1739278653182;
        Tue, 11 Feb 2025 04:57:33 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm13929843f8f.6.2025.02.11.04.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:57:32 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pymodbus: Upgrade 3.8.3 -> 3.8.6
Date: Tue, 11 Feb 2025 14:57:28 +0200
Message-Id: <20250211125730.3477099-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 12:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115424

Upgrade to release 3.8.6:

- Allow id=0 and check if response.id == request.id.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymodbus_3.8.3.bb => python3-pymodbus_3.8.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.8.3.bb => python3-pymodbus_3.8.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.3.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.8.3.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb
index b26a943d52..200e75748d 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "d886186bf7c3cc140f17e830919c23e4cc88334fbb91d6e5e1d7dd05860fe2c8"
+SRC_URI[sha256sum] = "7689b56cc3ad05a594e1486e772abb9d9646c01737935df492db04455680baf6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


