Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A9DC61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:53:43 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28007.1787799215383280536
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gF4TzV97;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso1755476b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799215; x=1788404015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KMDvIPreRRnD14IkD/P0ddFGSQUoF3AKAIlMnNscAw=;
        b=gF4TzV97wYePO44YPe8hoEd0xUhYZVw52dJzBTh7LuYOLmQhix+7PqHyUR+KM5ZsBZ
         mrh5ee7sQQCjAkoMVQclr3fZ9XSkWGjkaghEyyJKvs6fk6e5vDrAU78ugCDG5uGWfLxJ
         6b0RnsABwpVUZ1QZdy+glJfw9eExnQIJhbZRIX/CLy3UK1Ya2x9OY/DHVw2bP+hGrVdG
         Mu4Bm73VbhxN4HXl7eUMINpVgyTZYNqyXIePbdwVN1jyLar7mTq5S+Za1V+cLnMdud1v
         X26OBEwLh25DJt6PtBDLHRsVe+jBLhMpKUjPJJau7glyVeyPRuz4hbw3+1Q4aaNxHcYV
         3dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799215; x=1788404015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KMDvIPreRRnD14IkD/P0ddFGSQUoF3AKAIlMnNscAw=;
        b=N3wMUiwhcVUSXkt0arXCG3xDyR0L8sNTEamEuO0r3kUfUmYUOOYc7W7By3WyPzW++n
         sCDlHx822DDnHChI1iVYYGQYaJBOHalPGHjHQd5Z8a8lfXzAiM+k0feeDjvd2o27zBcY
         0Mx5KNxjgUEYjiQB2QiG0vPI7t6c61/LrJ2Dbng9yGeUT7TPjurXhGogyEDj9+K9VtHc
         KYSwAc0y+rR+NeTS3olNqIXRjdH6OqVNU5K1A8R44GV6e6CuyR6476aSmWArMG4nRt4a
         RE0sCCR1T5hj46mSL7izTvcOiKIzjNMjMBnNTp7rKzRuKzjZrcy8kbaJnPFWYdXokUXH
         89jw==
X-Gm-Message-State: AFuF++klYeQ1jS9bD/wO9nMzWrIOnWZNSjK7R0hE5IEzo5XcLoYdSqgQ
	6r7YECcReGLMATDlu37RcrgXwWPlaoDzC0aN7Zf4FabKOPt3l5EKR6bdB1bESg==
X-Gm-Gg: AR+sD13to4OrS4M8Nsh7bZ0vXOosZSwC1QrYiRGCiCqy4QAHOkUqOzPP/mkv9z1JR8T
	miZqe2AH82JphLqgdl4eP+HbgyjDD9xhFyocffma/75oqVzoKhQAZJSyzlgnu/RvhOtBKDz6bDs
	F8QVn4PTPrNwNZwROccfqSpQDqbGVyVH5WoyBOkpqhbAqHztB912MECwf8bgf9ELAtklFwacVJR
	IEc/OWf+ADuvg+FeLPtKpqgAb+kg2pAh6Blb94WRsZ7dC++bs33B7f4e/qYBVR4BEdsnV52A7UW
	5LB41T+BAKk8BqNJkAy5JW0eJRYG94WLt5bhplfYgBYFQWp51FY7uFiP0JQp61Ljz5UWDS+C8lx
	g3QpCtjhrb3E7rEEtiZm9jo+tgQ3jFdkmR+BCvz0qbP/7AjklwswJYpZj6mR9stP8LlPe5TFAP5
	AIbsiIRJSOEWsxyHL5LDN8CLj6OsFMngIzEwgVynqCQ87ZAHmeTPIysZI2+LZhMZjmY6UkBCgz
X-Received: by 2002:a05:6a00:bd03:b0:847:77e9:acbb with SMTP id d2e1a72fcca58-85374ab4b70mr20319333b3a.13.1787799214669;
        Wed, 26 Aug 2026 19:53:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 1/11] libheif: upgrade 1.23.1 -> 1.23.2
Date: Thu, 27 Aug 2026 14:53:13 +1200
Message-ID: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129521

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/strukturag/libheif/releases/tag/v1.23.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/{libheif_1.23.1.bb => libheif_1.23.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.23.1.bb => libheif_1.23.2.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.1.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.2.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.23.1.bb
rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.23.2.bb
index ee86fd3bc5..05d1b8f63a 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.1.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.2.bb
@@ -8,7 +8,7 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
 
 SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "2c4bbb54c2738d4a5efbbe3e5fa1d5d76bb88eb0"
+SRCREV = "ac1cb05c39008f01525c991ff8b88f84ddf70fd2"
 
 inherit cmake pkgconfig
 

