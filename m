Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 713DC7FCEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:21:01 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 2so27164296pfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LiWJLKqi9pFegSoVEfTeD4wh9oClWOTDZXocYAp3wXU=;
	b=JtmYHxbVpZJJLdytyaEvix63tVZ24HtEI9+3P8HrnPY/jllpx6uhTH/nQ4yXa6DLKo
	bH4qk62U1l/lJP7LoWZLMjI/jo6g9ZIUAEjE0hDxAVJj6gTtjmq2+KMSXADAgGwPhNDF
	I6XXhXy8+ptPpIFge0yC5pSNGorXVFWevppQUaccYYYhRfFqwConVldPw92ULBWHsv3O
	4GvwdeCZ5+taLHdr+1IMPbLDqzxmMLt6ZRlykLXMSUyECItbSh1iyy1lIc6es8FMzJET
	B4NUGjhlQdfdTX/Uy7loCdfSq8sI8/JQcIxpznjx+O4H5d82bw1KcGh/LmjuObwMcaKd
	wQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LiWJLKqi9pFegSoVEfTeD4wh9oClWOTDZXocYAp3wXU=;
	b=DSIrW4sKrezCJcP7BfmqJkSW8EwBB7TyeNjYqKohBBTJWfqdFHfxhRJHqizaTNfhZ3
	wLxMwNEcNUpVDqWOEqPpCNfR47u8kH5XfCCHsjUJogO+4wcQprz4P05amjedr/snDv+7
	GDT8HJLSmfe0Pa28NQYcr2s0dTKyUNEEoZZJUgDRsOPvuT1L40NMXG71u0F9GrWbfKyh
	SgPFLvijhKtmvBPOZIwsnow8i21YxAJj3iGRoE7k1zxQG6rChWwDzgLSCBg9SDM8+6Xr
	a03SEb2BKdqrNcq5VquO9VPl4aAUja3PW6JFCS/oCZSO4KP+ecaJfCAW++5tsl2fzaEf
	GsZQ==
X-Gm-Message-State: APjAAAVoCkJv5HdDfZrS74Ss19di/ouI/5b0l4Z1k4OsnT3acee1kCfi
	bEZlY1LxZtyI6dMRKLGhqjAsrkVu
X-Google-Smtp-Source: APXvYqwqsIf1Iq5RqxSak2M768BXrZayKggwyN0zHUUQdMZrwWv5/vFq0LcWz1fOUSrlHBzZ5lrmag==
X-Received: by 2002:a65:42c2:: with SMTP id l2mr108576427pgp.172.1578327662239;
	Mon, 06 Jan 2020 08:21:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.21.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:21:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:33 -0800
Message-Id: <46969195492708a705390896c9dea515f158954c.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 25/25] cache: Lower debug level for wold build messages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2020 16:21:02 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These messages spam the logs for no good reason, they were useful for debugging
a particular problem long ago but are distracting noise now. Disable them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a9247c468cf09da60e5d396ccb81e950841c99e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 lib/bb/cache.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/bb/cache.py b/lib/bb/cache.py
index b6f7da59..ead8abc5 100644
--- a/lib/bb/cache.py
+++ b/lib/bb/cache.py
@@ -208,10 +208,10 @@ class CoreRecipeInfo(RecipeInfoCommon):
 
         # Collect files we may need for possible world-dep
         # calculations
-        if self.not_world:
-            logger.debug(1, "EXCLUDE FROM WORLD: %s", fn)
-        else:
+        if not self.not_world:
             cachedata.possible_world.append(fn)
+        #else:
+        #    logger.debug(2, "EXCLUDE FROM WORLD: %s", fn)
 
         # create a collection of all targets for sanity checking
         # tasks, such as upstream versions, license, and tools for
-- 
2.17.1


