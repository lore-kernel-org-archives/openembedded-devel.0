Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A24EC5DF98
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:18 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12910.1787485929982133772
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PWZmn2n7;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3659929a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485929; x=1788090729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ecf1GFGWoXqkkZ3pVSP1N594isUQQ1Jc1dEJCCh6A4=;
        b=PWZmn2n7ONnXG3mjRcjSIodtONxFUaCWVJdHJFrazd7nPoAMuqFvAmSkrclUyLWDgQ
         6U3dAX/F4IQu5kuweBDJSN9UojVcM9ADZhHtOKVU6mZkQiHI/u3pPuiTZglQaF3qUfkh
         ZAfQg9QjS5tmI5RLwNY1OzzjDwG93puv3HD0HI7reVAu2cmOYQjDfSgkaajn/GoTCX4K
         uBg4d23p+txemqg6kKjoHkDreOet0HFpdJ7icNRArXXQ+FQYbyRUG/SIiafbMBFuzW6e
         0sZZQebMud7tJodn+mITxObGruJ8h1ddcBeUQYDXCuZMcWBDkagPu4K71ha4m6JsPbHW
         spcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485929; x=1788090729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ecf1GFGWoXqkkZ3pVSP1N594isUQQ1Jc1dEJCCh6A4=;
        b=HgCnnbMv2xaaSBWyqtLrpB7caaIpeGiAA9dsPY1xwEwt6UMPNpc94TXyxZslFf0Iql
         lo/3og0EygMGFEr2b3sVA1KjjP9y6eFg3gTc9QjQ1+eGKcVevdc0adz5rZ8tJ3LSZR8C
         c0PiezflRhBhLZcAJmdmfWMNlXA53SyJYMSeUDY/6Vh+qu9WmZGq7HQp0FArg9GwvMfb
         mjVfazE+X4HLEyNVyalZP0IpG/iCx7RW2BSiynWEfm4Sy4xQ+fQSvFe6eWoqhc7MXqmb
         lTXY2L7g/13t0dRXMkPCqZhjZ5zn1BMrf+As/uWjJMvFGossfT9U+gOuJft+U1J/kphN
         ZgJw==
X-Gm-Message-State: AFuF++kPHpr/XXzGXl8kEiX9NwQ1pkpKwx3C/zyLmvU1AXZdQUIsErc3
	BzCNJS5fZoTboMF2UvnObK+rz3DNCsK+hBAokEkqdmo6xdcd6MHiq4S5S9HlnQ==
X-Gm-Gg: AR+sD12c25k6AVyitJcjMg5OllCA5+MmLwEQNtviljf4fh5ITH83lhLfYAANrJXKcXa
	bYy10PNsq0pwtJteR/xURw0IapkigLByIN8npiRVgHnYKKwdRr4XUdPrqXSu0Kd8YwaObKALamI
	eA8/ZgPk761bR+TsBvlK7hsoRfWFxOuekJrd3IfBA85Zx+T6pqMb6CaL3QtSudAprrABqgMr/a8
	QRxiBZ9l3nQFH2k7q1md+1ctwws2GU0GikI8jBzkEwvrUcLaI9nhQ84rqy/LKUJvENZrC1w1BY9
	FjWxD+VJ9WahZ13TmOnUiy1Q9FKoFZLEAI8nx5t8NtNHe+7KdHEtJnMVf3J03g7R43vmMpqcJsM
	qfPW+MpoMkgKmoefu9Yh1a539X0iS2nfVoj+eDACGzDhGLLsY0xnY3CnwYn8927JVIKgP7UJ+Uu
	jtKsk2LAcRg41hCNrgoMY5B1CAzocOq4PQbSmg1zBvrTRVDmxGD+yDeH2JsLtffXWoPJaC4HpUa
	67LZhu9kHzF
X-Received: by 2002:a17:90b:50c3:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-395c39e6433mr36908244a91.11.1787485929346;
        Sun, 23 Aug 2026 04:52:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/20] hiredis: upgrade 1.3.0 -> 1.3.1
Date: Sun, 23 Aug 2026 23:51:40 +1200
Message-ID: <20260823115158.1582363-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129436

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also update branch and include tag in the SRC_URI

Changelog:
https://github.com/redis/hiredis/releases/tag/v1.3.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hiredis/{hiredis_1.3.0.bb => hiredis_1.3.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/hiredis/{hiredis_1.3.0.bb => hiredis_1.3.1.bb} (91%)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.3.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.3.1.bb
similarity index 91%
rename from meta-oe/recipes-extended/hiredis/hiredis_1.3.0.bb
rename to meta-oe/recipes-extended/hiredis/hiredis_1.3.1.bb
index 0cf03bfcda..ed3eff6615 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.3.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.3.1.bb
@@ -5,10 +5,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
 
 SRC_URI = " \
-    git://github.com/redis/hiredis;protocol=https;branch=master \
+    git://github.com/redis/hiredis;protocol=https;branch=release/v1.3.X;tag=v${PV} \
     file://run-ptest \
     "
-SRCREV = "ccad7ebaf99310957004661d1c5f82d2a33ebd10"
+SRCREV = "bad0c4dbde7d8b9bb116002fe10235c663949730"
 
 inherit cmake ptest
 

