Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A83D41C13
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 08:09:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.6914.1731485383648351754
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 00:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GF0p4fQP;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314c452180so2389165e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 00:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731485382; x=1732090182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyBTNLwcHpNWBN37Q/eFMHUs9zAXTRw6Ajctx8XikWs=;
        b=GF0p4fQPGG+TQuekaGpQ2ijqrV/65l/rPFEabMY7qbB3OSNwID0q2oiKpNKEMG5hPO
         FcgXFHLT1FLm4Iu7SqPwFtJh1qQL5vN7PEGJU4623vuaJ9A7DsEiQxm79nRKcHNpNUPO
         QCPAjFiXkIh8KSnO4FuvUEqff1sBQ/zD2yxKVzS9k7Za+KurDLPiHDTovxIq9eQIc0l/
         No2ADh098MToxVbFrfTQ3mpGWCX8qz59tf65cls8SeNsN+94Ee16yxz37fLqQjf7A3ip
         f6qfYvYayYbM0CNSdN7fs+2jswqdI8x6CN1RVejqru1xkCtUDS57fq0ibSAirTafqPxz
         99xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731485382; x=1732090182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyBTNLwcHpNWBN37Q/eFMHUs9zAXTRw6Ajctx8XikWs=;
        b=fmW+3jM5gbhIuPQLZDaIttrrpAAXFOY0sn+M1UDmTYchZ3cwSlCpQ+8/wZTRlkAZYn
         BKOwKYU4xKYU1KfW6sFheZ+dlcOBQJ2BM2dYRR60JF/fWshCe2VLJLNHm9EOcR6Hhikw
         OykNA9hK2Cwc6MnUUsP7GdCxMOt9HSJqZXYcIdGr+9gItLuGGPiy+QxxUo7sxFdqySsq
         iCeLhVniIgy1LVMuOWJWFa8wjLUa+FJu5U3Eb2pq3JS8mGMcf8u81Lt3tXy6ShHd0kVZ
         9OWCpCB4QvC5lkyJf5VmSPINZzJPQU/YcOkxSkUSULy3d6w65/mLNcDqvxsmJo6j4WzV
         A6AQ==
X-Gm-Message-State: AOJu0Yz72y2MDYOXiSJhwwOoc0BZyFEGK9YIcfPvW2iub4mbJJijYQDk
	Bj1DNuPObv/OYvbYagMYM/6UuWPkJqB4fjVahQgUF7LQjQnjHdXaugy3RQ==
X-Google-Smtp-Source: AGHT+IHqMXZHT25/iU/2zIcbLETwhtbO5DCdqWmZftEv7h2lOxPoBQNUn/1bpL0/KRp9X7HAwZi2Sw==
X-Received: by 2002:a05:6000:4006:b0:37d:3baa:9f34 with SMTP id ffacd0b85a97d-381f1a6665cmr17239296f8f.1.1731485381399;
        Wed, 13 Nov 2024 00:09:41 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda137dbsm17340972f8f.110.2024.11.13.00.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:09:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] poco: use main instead of master branch
Date: Wed, 13 Nov 2024 09:09:34 +0100
Message-ID: <20241113080934.3741097-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 08:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113802

Branches used in langdale, mickledore, nanbield were re-written in upstream :(, fixes were sent to meta-oe:
langdale: https://lists.openembedded.org/g/openembedded-devel/message/107533
mickledore: https://lists.openembedded.org/g/openembedded-devel/message/107531
merged in:
https://git.openembedded.org/meta-openembedded/commit/?h=mickledore&id=b0d67900ae9e8911f734c25c0674fe55df8cd188
nanbield: https://lists.openembedded.org/g/openembedded-devel/message/107532
merged in:
https://git.openembedded.org/meta-openembedded/commit/?h=nanbield&id=2da6e1b0e43a8993fd422fee3f83940100b59f4c

fix for langdale wasn't ever fixed because it was sent after langdale
was already EOL, but looks like the version used in kirkstone got
broken recently as well, because master branch was removed:

poco/1.11.2-r0/git $ git branch -a --contains 9d1c428c861f2e5ccf09149bbe8d2149720c5896
* master
...
  remotes/origin/dev-task-test-diag
  remotes/origin/devel
  remotes/origin/feat/acceptor-service-handler-args
  remotes/origin/fix/posix-sleep
  remotes/origin/issue-templates
  remotes/origin/master
  remotes/origin/poco-1.12.0
  remotes/origin/poco-1.12.1
  remotes/origin/poco-1.12.2
  remotes/origin/poco-1.12.3
  remotes/origin/poco-1.12.4
  remotes/origin/poco-1.12.5
  remotes/origin/poco-1.12.6
  remotes/origin/poco-1.9.5-not-released
  remotes/origin/poll-closed-server-test
  remotes/origin/upgrade-ci-actions-to-v3

poco/1.11.2-r0/git $ git remote prune origin
Pruning origin
URL: https://github.com/pocoproject/poco.git
...
 * [pruned] origin/android-ndk-action
 * [pruned] origin/develop
 * [pruned] origin/feat/wepoll
 * [pruned] origin/fix/PollSet-race
 * [pruned] origin/fix/swap-noexcept
 * [pruned] origin/master
 * [pruned] origin/poco-1.10.2
 * [pruned] origin/poco-1.9.5
 refs/remotes/origin/HEAD has become dangling!

poco/1.11.2-r0/git $ git branch -a --contains 9d1c428c861f2e5ccf09149bbe8d2149720c5896
* master
...
  remotes/origin/dev-task-test-diag
  remotes/origin/devel
  remotes/origin/discourage-using-configure-and-make
  remotes/origin/feat/acceptor-service-handler-args
  remotes/origin/feat/json-logging
  remotes/origin/fix/posix-sleep
  remotes/origin/issue-templates
  remotes/origin/main
  remotes/origin/master-pre-1.13.0
  remotes/origin/master-unused
  remotes/origin/openssl_fix
  remotes/origin/poco-1.12.0
  remotes/origin/poco-1.12.1
  remotes/origin/poco-1.12.2
  remotes/origin/poco-1.12.3
  remotes/origin/poco-1.12.4
  remotes/origin/poco-1.12.5
  remotes/origin/poco-1.12.6
  remotes/origin/poco-1.13.0
  remotes/origin/poco-1.13.1
  remotes/origin/poco-1.13.2
  remotes/origin/poco-1.13.3
  remotes/origin/poco-1.13.4
  remotes/origin/poco-1.9.5-not-released
  remotes/origin/poll-closed-server-test
  remotes/origin/release-1.14-changelog-authors
  remotes/origin/search-support
  remotes/origin/upgrade-ci-actions-to-v3

switch to main branch which is the most common and the least surprising.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.11.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.11.2.bb b/meta-oe/recipes-support/poco/poco_1.11.2.bb
index 8694983e7c..ae8bbf87e4 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 DEPENDS = "libpcre zlib"
 
 SRC_URI = " \
-    git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+    git://github.com/pocoproject/poco.git;branch=main;protocol=https \
     file://run-ptest \
    "
 SRCREV = "9d1c428c861f2e5ccf09149bbe8d2149720c5896"
-- 
2.47.0


