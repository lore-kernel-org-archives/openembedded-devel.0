Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E884C004D4
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.2071.1674324099363399348
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDMHZXOf;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so11049474pjq.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqqHqOOIzlY3UpaQlFCXlJYsY4A6cIJx3l1zspQKVLU=;
        b=DDMHZXOf8GUb/3asDNg/yHKQc8ghHKbgXduwA4NGGkHHF+Y8E+big/TtOhig9Gqu3M
         VPZPOjY1W6xEcoY/9+kzOxZ0zOFdp6vYtEPp+AP6MCNbXeN5hkg1yQwgfL0eFkqOdj4M
         YR+3zAeSqBEc+IN19E0FtHPAFT3AsU7ZWr0lStLJdqgrPHMIP/bewLjpIG99MHL1FgpI
         uEnfbGZYMYVT0h5WBtmOfoQ///P2oc7Yix8mcAGB1mDzmkmgI8fwR0DZJxZrKWJapzzp
         47/0dGf/a7HJPOj2um2r/VeCJlncCjBP3t64dJ8q6snAtZ01+44cH0rhTXCLZNyb9z5h
         ffOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqqHqOOIzlY3UpaQlFCXlJYsY4A6cIJx3l1zspQKVLU=;
        b=rmH7TNuP8Gd2r7U7sRsFkFc5mu7EPIN+MpGzJRfYNr108BZiwX9p1goywe9lD/iPWm
         TMrtL2k+7+hzZOmEkF2jnZNXs1II7mpx7oN24KX/GlOUgeZO5KszFyF6CvAlQz8yTW9H
         6o3oQndbroJIjiTYEIkyT+Ay5k+Ib6PKx72kbYl7TZc6A1Y5lQYDdsMYcDLWiMu/ySLG
         ny3Rt+zC7h2v88iMeCz8UzFdnDmiWX9T9Yw6vggORcY0gkusXKrpBqmhCJQ2wtl2nYHL
         CTPhHzllsgU2uCLT1Fz5VctwPn5/mpuB694ZqKClFwWvdkPOqFjADm5rVEzGMgeJr1mH
         T2jQ==
X-Gm-Message-State: AFqh2kpzOoI20pOeSsc0lxdbuseU4qc0oLjy3VgR6ApY8FILwPCKerTy
	ll59r6dyuFkVlsY0+ilEkh+6jMie+dsl6A==
X-Google-Smtp-Source: AMrXdXsQyR3Wo+/S41nwBsO3SPHqFXZMhG5z0npr2u4e9UAf8nZ2g3Hg1JaHU4+T7FR+VdrLPz0ppg==
X-Received: by 2002:a17:90a:d344:b0:229:4b4f:99e7 with SMTP id i4-20020a17090ad34400b002294b4f99e7mr20543987pjx.16.1674324105004;
        Sat, 21 Jan 2023 10:01:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 26/30] packagegroup-meta-oe: Remove mongodb for upsupported arches
Date: Sat, 21 Jan 2023 10:01:17 -0800
Message-Id: <20230121180121.1229895-26-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100693

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index 43afad7515..51197c27f3 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -3,6 +3,10 @@ RDEPENDS:packagegroup-meta-oe-devtools += "\
     rwmem \
     mongodb \
 "
+packagegroup-meta-oe-devtools:remove:riscv64 = "mongodb"
+packagegroup-meta-oe-devtools:remove:riscv32 = "mongodb"
+packagegroup-meta-oe-devtools:remove:mipsarch = "mongodb"
+packagegroup-meta-oe-devtools:remove:powerpc = "mongodb"
 
 RDEPENDS:packagegroup-meta-oe-connectivity += "\
     lirc \
-- 
2.39.1


