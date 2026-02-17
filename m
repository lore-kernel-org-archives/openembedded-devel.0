Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3F2E909C1
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:41:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14898.1771342908903397649
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=P8UOkyVs;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.215.178, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c65c87f73e3so233622a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771342908; x=1771947708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tVZTzfiKpvOk5VEJGH9sSSyRkmOYXHLDWxSIHa5Qbqs=;
        b=P8UOkyVs0wnAPzDaJnS/8/o9Do2VequHV9LOZP7H/TxFXgZ6c05EwZMAx9y7lUhjGL
         4MBOsuCfwzE4swyjCg4Wei/XtQV8VI2R0JDddiC5QuhBxx7g9IHXGanZ9Duv/l51JO3c
         3v0zU48AV/n8rDSXm/AiOYIducVwD0+nnYW7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342908; x=1771947708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVZTzfiKpvOk5VEJGH9sSSyRkmOYXHLDWxSIHa5Qbqs=;
        b=v9KVNCO61jClsDfWTUbiTEBNRzHs8UUion4RDChyA2qxm01as46Bo5nOM8B+ArIbtv
         a72yI8VTIKM5KEKiOJryCKgnXgx81OI9YZfthoYOkTuFSoYjzY+N8oFkQC43vtWsNYtQ
         ZQOqdRVoWUSGQGojfKvjGoz80XjRjf3xK7rZJIVQW+S/l6n/Pu44+JojmhTunZhglTmo
         JkernkGe4fbkwgyyfZ11g586sSGp5sEMa7W7yBOKFbGqZl4ekqRYFm16pVq7PX5CTrB8
         nFuPLcEsWcE5yj6LXpMCWvpvSXcmR5pLzYQL7V+lTbgRUNxVCdP1ZLJU7plzehuLsWi9
         jzSg==
X-Gm-Message-State: AOJu0YzznqPMZ3/gGWbRy9uoeDZqBONagNWyaCng+MH7sYGoWCNMu1nE
	4DENxottc/mXZXupea42IY5Gnb+PrJ+NAboNHxIn8iciG4v2WWbTyNwztmRWnr6BsDsbarQqted
	QA9KV
X-Gm-Gg: AZuq6aLLNLXU+uJfoJ+BFKTkX7y6mr7q47DaAJj9lSHbfg5YmSDmkJTopftZj3P/GTk
	H4rI8zDJeZfFdWMyOHJFeuQfKTyyaVVzvy3lnG6P1KRP8glsecDBzWGN425TWM8iCe9UQ5ytkIo
	mtD8aq3UH9tJcY24r77VATc+vwMKr9f8jRCQPHhYsHoheF6eOPoEZmZr9gcljfDeeDv82r7fPV4
	Pl16FcZ0UICsqCTcQvvjJwrXkvfY/fyHbR9/dULUIG3xsZ7ApA6Sl7nXYlSPorCIH7wN/kTXj/T
	tGnLiB6j46BsKGKZMYSCbOnF63daeJEh3W1pEbxsPHYXiC79LpwbdP8xU614xbXyfNA5kcUrRmy
	zURksg6n4Lsy4RL4g7W3v5ekavGelpCrHSZA5/9m8FsjlOCxfQe0KGFVUjJH8XI+l6ebek1wq/8
	aFIqqACsvS0wkR9IccmnkljghQtQWM1MMxcMZ7BEG8dzksFiEtVeA=
X-Received: by 2002:a05:6a21:3391:b0:38b:d93f:bbf5 with SMTP id adf61e73a8af0-39466eb3506mr11221387637.0.1771342908176;
        Tue, 17 Feb 2026 07:41:48 -0800 (PST)
Received: from adam.ht.home ([66.164.55.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fcff01sm10415519a12.2.2026.02.17.07.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:41:47 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/8] libtoml11/files/run-ptest: cleanup
Date: Tue, 17 Feb 2026 16:41:37 +0100
Message-ID: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124461

Shellcheck -oall warnings fixed:
  - exit 1 if `cd tests` failes (SC2164)

  - Double quote `./${atest}` to prevent globbing and word splitting. (SC2086)

  - Check the test exit code directly intead of using $? (SC2181)

Other fixes:
  - The shebang sould traditionally be /usr/bin/env sh in case
    sh is not located in /bin.

  - Do not remove tests.log for every test.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-oe/recipes-devtools/libtoml11/files/run-ptest | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/libtoml11/files/run-ptest b/meta-oe/recipes-devtools/libtoml11/files/run-ptest
index 9bc480aa7f..4da9e68cc5 100755
--- a/meta-oe/recipes-devtools/libtoml11/files/run-ptest
+++ b/meta-oe/recipes-devtools/libtoml11/files/run-ptest
@@ -1,10 +1,11 @@
-#!/bin/sh
+#!/usr/bin/env sh
+
+cd tests || exit 1
+
+rm -rf tests.log
 
-cd tests
 for atest in test_* ; do
-    rm -rf tests.log
-    ./${atest} > tests.log 2>&1
-    if [ $? = 0 ] ; then
+    if ./"${atest}" >> tests.log 2>&1; then
         echo "PASS: ${atest}"
     else
         echo "FAIL: ${atest}"
-- 
2.53.0


