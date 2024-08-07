Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F496C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 13:00:49 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.32861.1723035639061810016
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 06:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+k5JkAI;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso19376411fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723035637; x=1723640437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YjIG1KCJmsqFdOqlkDhIVcI2+mwrxajn7Aoc4jDiJ54=;
        b=C+k5JkAIAd7Ud+fChlS9K0vGDJbPv5JxF75qyYmTWl5PPzbYYmcEOB+bmHqx9g7p1M
         AQ1i7vPC32KVpt5ReatJCCbpAk1hsfxn8P0EGRiL3otA0uTR7wSgl7snxWXx5GyJF2D9
         uVOUIXJTpBD2t+aloOVNPqBvkqIUT3gSoS8M2PZOYjOqBqjSDtQ7zgsj7UsC93XF1zrF
         O+ZI0sWAhUloxt6uqQfMyQAvOyFWVGKnOj7cGrYpoZa85VryRxKZB5GKF5WMQ0666CZD
         lWwOwOBTgtWWODM+ZRozfzTUg6Ak3CJ9dQ8jeeuvGdOzVItPrhBFx9SU1QwNmJRi934K
         tZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723035637; x=1723640437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjIG1KCJmsqFdOqlkDhIVcI2+mwrxajn7Aoc4jDiJ54=;
        b=jNQKDq90y25L8KmAl4b7lZk03Vo3xoYCeOFGnxxgZJ6ZwmLoHH9m6Yu1+bzvDIPjf8
         LjhnREB4vl7xx9gcPkV7fq9IglKttng9HaE5Lc8lTYt2llwfyQ1gPki6oIXbUsaRlRWF
         w4VjlncsrM8VfmQxpTIUXQOLyZdwf9ajavC5NWJg+o3lqAtSQyFETtLFng0ijFBW8gLk
         X6GhDfAnov+9DkFvIxrxS13wji8q7TtBXkPOX+ORpDdC7SNxJaCLsVu1EBXeT1jOLyTd
         tggN1jUebHbbV5sP+Ie5E0crxnPyT0vzRq4z2HL/cg9IBWmHFWjs4sdrZ6BeStgoEauM
         PleA==
X-Gm-Message-State: AOJu0Yx3zjRndqsCHIsmIku5jYR6Cqe7TIMzfA/HEXxs5CFgggQltEXA
	W0xd45rnVOPEfbIdqc5RjrjlGkALjELqAGGOPfCckgVGGuATX2PAcv8KTmC0
X-Google-Smtp-Source: AGHT+IGclqjp+BO58qB3/hKeT3AdX6reD6u+Ax73vL+j0aWY4itr2ohEBAgL6PBKtkqjWUjZEuTVPw==
X-Received: by 2002:a2e:9b17:0:b0:2ec:5364:c791 with SMTP id 38308e7fff4ca-2f15aa8756dmr120100651fa.17.1723035636305;
        Wed, 07 Aug 2024 06:00:36 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290580c970sm28147135e9.46.2024.08.07.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:00:35 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-portion: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 16:00:33 +0300
Message-Id: <20240807130033.141474-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 13:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111632

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-portion-2.4.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-portion_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
index 3af94b48f..a5e26f302 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "5289b40d98959b16b3f6927781678935d3df1b7c14947f5d7778e5e04dd9a065"
 
-- 
2.25.1


