Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9DDC3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 01:58:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.40747.1744595837416258026
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 18:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ks+2DqFz;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so3961828b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 18:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744595836; x=1745200636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWI3UACWtneFT/CSgh/bj6pqFMjbwvR/j+Z0U83au/w=;
        b=Ks+2DqFzarlMCgpObSz0Pgj4TBBr+1Zi3OIwk4GU1me60fVTmkF59Gyn3Nrz/eyXr4
         cajc8g5XziIQaZlVKHRFay44qT8RhGydHSafDDbeec74Oz+t8O4/2JBeQjfTV1SfaQ/h
         tTpqHdjx3yqV6C69G/XsnsuZ7puojujztSaohOayVlUf1VLHJpfhcpnG4JdAU1IPMdYG
         d5LrJiMBsuQr99t7giH1nwCHbgcPKSp5NpSsrT39hoQv5N704W+dYgOLW6PuD6ojYs9M
         BDc044dhe6vNBEiIt9eZ7JGCsLWdQGQuPwdoGXJjpxuF5TM44QIHSm8pmqyB0m6pAOgj
         GaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744595836; x=1745200636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWI3UACWtneFT/CSgh/bj6pqFMjbwvR/j+Z0U83au/w=;
        b=XHr/lPHuBHHEb7exzcJ7eQJs7J3nUHBky1e2yM1maAQJHEHX9L5i2PIXaYuFiMuXIE
         lA2UnhzxXYXQxcnJTPexeUVy7oqWCMAS2eTds8gO3zHCYlQh8uiY4d3WtnsFS+vWaSL1
         3tfpJei7cnQ5O4nyazuakZ4j6fgrGTeumaO112/tVIpVcyGHlyWDo3OigaJBc18OA8ns
         fV0pwXg9LobQV/8qCYlmDxIknNkOCQYF40eyg0Y4I4rD3rF6g9wGhqd601maoSXeAzfT
         Nh67n95gXoJcK2gwuvbtZ873Nssvvg1kaRBAuaKH6V+nhHM7jG8bP5qunbd+JpK3j3Wr
         IWrg==
X-Gm-Message-State: AOJu0YzMtY9jAC5z/XokDqYPv5wuyJNWuDPy9F8bz7g+EpN93LaSpRxO
	+M0ButhgZtHaisD5jFVxlzHFSYKV4DA6VAS1GHp48qVudzALXgm7noGgz1CuLty2tA==
X-Gm-Gg: ASbGnctAkCOXgj0j4ZyjQQvdu1ron8CIL+alS1TH4LCt9ivDsxO9AdJmdgkLIj0NkCK
	Zk0QAVpAzS9wsVNNi2erFKMj4rwFiNUCTN2Rl3J5FviC1IVle9GCLka03Vvw+NfFqWoGno+FvQE
	Oq2M9uTeg92hKcCKYVhRak9AsKFqXcCXlzbrnxzwMdB9nJyx5EPdpOyRsN33Fr/JOcqQ1r0R7UK
	rulbRWkBajveQpjyBqTLurTB3mJAkoPdKio8NrrumT4uYW1FXobHE2q67sChV1dOx+rczaOc6Bx
	guo87SwGN+9h1sEwSHw9z/f7g8uar8NPvk5NxLWq49aN7jo+6r6J5etqI6MA4b4XevRg
X-Google-Smtp-Source: AGHT+IGUzGCgXowhMS1oejTcaRvYPNsYdsENFUC/Ct7sGUX1r0ejdn6loconalcyIzXAfLiFiyp5fQ==
X-Received: by 2002:a05:6a00:230d:b0:736:476b:fccc with SMTP id d2e1a72fcca58-73bd0cd9cafmr15693320b3a.8.1744595835953;
        Sun, 13 Apr 2025 18:57:15 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90d4:ea0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e00e8sm5560446b3a.80.2025.04.13.18.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 18:57:15 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] 1. Thank for Khem Raj's advice about cleaning unnecessary data.
Date: Mon, 14 Apr 2025 08:56:58 +0700
Message-ID: <20250414015658.5684-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 01:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116838

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../recipes-libsimplelog/libsimplelog/libsimplelog_git.bb    | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
index 7a27fd302..0415bf485 100644
--- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -1,9 +1,4 @@
-# Recipe created by recipetool
-# This is the basis of a recipe and may need further editing in order to be fully functional.
-# (Feel free to remove these comments when editing.)
 
-# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
-# your responsibility to verify that the values are complete and correct.
 SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
 DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
 HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
-- 
2.47.1


