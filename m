Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D4CC47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 12:41:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10428.1705581700768348377
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 04:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PdqcX0Hc;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-337d5aa5ef6so270510f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705581698; x=1706186498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jif5yaVwejbV1xaWoviP/ADwOYjYvJumXqf/YYGlCUE=;
        b=PdqcX0HcPUiQqGrnMrg5XUBcXQD1lga+JV5oGztAtmqVpZf5qhQbrtV8D5smBAhPzQ
         /BM5ArHaxWRkZeYhqKi5mnKwL1u8Ho7/0QDv788V/Jq/1sVHXJuEkR+ITuedjH1yZITD
         kKECcUVg1pN4wIWmN9ycJ3ia+kHSvrAT1l1zdqFVw3hn9v3jJufgll8DgeJnc091FkEL
         S/Wp4Ku8hp7DKxrByZqFKbY6OJ1nqL5NEcEc66LjoqO/tn9YIthRB6ZgWCgREJ5Xzs6C
         W9WzN212zprxDVs6XxCkNjVVRJILuAmfJAIPmGJk6uFF02i/+SLU5OhMIi2wszKG8QAM
         WpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705581698; x=1706186498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jif5yaVwejbV1xaWoviP/ADwOYjYvJumXqf/YYGlCUE=;
        b=lz4JbwdQauw4YJXCtWZqFS0JgUrfpm5q0EdfWqAEpfLBKb2GRmoKAqPzzu2MOIvirj
         joZ+VqrGVFuqtY58WRAQs9IQ5iQU+PBq2uehtiwPC/c39FZ+xx/UqRi7ACx0BSArD50q
         39u7m9gv+NBz7FVKFKbJDz3I2Mj3Flcw2mDIVc5G+lEi/ca55djuAyS6A2HxpF5Bhj0D
         hwU5GUuJMQHZu5jDPKynTzb++S9BhRO44YF2fKXFhj0SHdapuSwd46FMx+D5oej02lao
         1pR5JjBAz6M4flSCffkG7i1KgotL+QFVbgGhr19hB0mEBIwC0E8YaJgfhBqofmomCm+I
         fpZA==
X-Gm-Message-State: AOJu0Yz2FD+QgVHIu3pxMNXhQT4hABTktz2dYHB14IqyvgmICqjYlEr6
	EY+9xYrI7TBhHn3QPJ2nFv89Q26qIfNF50DSOfRuBZu5TyOQDM6HZOmv1gTq
X-Google-Smtp-Source: AGHT+IGmnuwebUOhdovdPbFMkLSZF5zpbQXcDPCvgHBAI7b7Qir4BGvIe1tM9L2XUTpTLuayx6wbjQ==
X-Received: by 2002:a05:6000:1086:b0:337:b3a9:7c2c with SMTP id y6-20020a056000108600b00337b3a97c2cmr483418wrw.19.1705581697948;
        Thu, 18 Jan 2024 04:41:37 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id a12-20020a5d508c000000b0033763a9ea2dsm3975361wrt.63.2024.01.18.04.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 04:41:37 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] abseil-cpp: rename recipe to follow the version
Date: Thu, 18 Jan 2024 13:41:34 +0100
Message-ID: <20240118124134.60777-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 12:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108342

We are not on a detached version, there is no reason to not use
the real version in the filename

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../abseil-cpp/{abseil-cpp_git.bb => abseil-cpp_20230802.1.bb}   | 1 -
 1 file changed, 1 deletion(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_git.bb => abseil-cpp_20230802.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
index ee62d4b59..1ce6ff3fc 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
@@ -7,7 +7,6 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20230802.1"
 SRCREV = "fb3621f4f897824c0dbe0615fa94543df6192f30"
 BRANCH = "lts_2023_08_02"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
-- 
2.43.0


