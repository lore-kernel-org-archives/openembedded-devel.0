Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B95B274E29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 08:49:39 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a8-v6so46265803wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hB/vye8b5Wg3lt7GTQncAKCK4AEGwqcKMglP+8eiHQw=;
	b=JAEwlDoI+hvafGOORzJuZD8VvcKleKTL55YkJA+iDyF2ti1+qur9cZZxUwFyr1GrvG
	1hsJeRC+bPnuFO8QCHx2Hs7rX0X01bgvT+5XFcIbdoIMpIA7MpQXThF3QkRB7CQDSZ/x
	nySLkwjROB0Yp2allV0MHwUmCPjl4MmDuaBQK6nMJKmIaprDOjEml4VRqp0TBIcYdBX5
	i1aKQpiuYVU1NadfV1AcpUsAqgCROxCMNNLCW77T9mitsDx53nos2Gv7UzzXhj4i1zqB
	KKc8ROWoJw7Quq0PnIQDKjtvGJnhOxrtBIyqTF4hCqMkIHlZ3ocn0jKYAEHm8HtrTDx0
	gpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hB/vye8b5Wg3lt7GTQncAKCK4AEGwqcKMglP+8eiHQw=;
	b=NaYmOf1ckx4W2SBdNN4ZclaOkPPZM70pNz1ujnXoUEaNmCdSxHtbGTgUIXv5m9UXiI
	gxIOq9G7tgaE41jM9rdbqvYtF0O9LpbvPBVjC1gaH+q+jEGC654gX4nr1xda7H7FoBdJ
	CWpzTh96sWfoqt3suJxS6ETLIY2VZawFMWL/bBYVcG1sxpLiqLR8h/fandUO6X4YHzcp
	wP03JGl5FDNm9COYwivbsYalIHkuOPVjTmPgsFbNtEWqPbgQPE2svpXYowKte8BkTvKG
	zsmaLxsVFWpX7NM4zD/CleTrKVQQDdN5dmblvXf6w8duhTawOQNORX4xfF8dE0CQ4+eH
	vQwg==
X-Gm-Message-State: ALKqPweXpTSp3y6z1H66A6m3vAwbzgwhpge6loP0fFqy1QZLRwl6BY/h
	nP7lTAPnwANCxkoJ8iYhZJi6cBuv
X-Google-Smtp-Source: ADUXVKLoefBWxGaEXz22gpMWTEt+2ENlTAr6/mPLMSnzSTnt+MVfSpZsa5Hu8Y6Fkmx+F5qq0l3+aA==
X-Received: by 2002:a50:b081:: with SMTP id
	j1-v6mr2489203edd.215.1527670179859; 
	Wed, 30 May 2018 01:49:39 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	r15-v6sm18602421edq.40.2018.05.30.01.49.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 May 2018 01:49:38 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed, 30 May 2018 10:49:37 +0200
Message-Id: <20180530084937.19662-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-clang][PATCH] clang: Fix sigsegv of llvm-config on the target
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
X-List-Received-Date: Wed, 30 May 2018 08:49:40 -0000

llvm-config is, by default, broken by the SSTATE_SCAN_CMD. This patch
removes llvm-config from SSTATE_SCAN_FILES.
---
 recipes-devtools/clang/clang_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index 5730b9b..3e2d2c7 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -158,3 +158,6 @@ FILES_${PN}-dev += "\
 
 INSANE_SKIP_${PN} += "already-stripped"
 INSANE_SKIP_${PN}-dev += "dev-elf"
+
+#Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
+SSTATE_SCAN_FILES_remove = "*-config"
-- 
2.17.0


