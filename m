Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E91F588F0
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:27 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22982.1776700161115832978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UUCWQUEs;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so20350795e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700159; x=1777304959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEvohqHU+t3kVcAV8Z3lQU6wP40qdmtAe6P+OzDF5pY=;
        b=UUCWQUEs5wLJwOXN80nH5FsvHfVuvFlIy4ekilPsu0YN30KnKfLb+lTcLDZTCpDIKh
         ZywtTgdV5a642yFJPjNiO5jKGbq3CuG/yIdvIw+rX9QLKL3Oz5NOiOEzrSuDVjHPfADZ
         ut2tT+jgVcW3BlOlQr4ISSDgPZlIavZOQmHAIUen/4Rs2v8aT47xcqunWmcFTcGFEiWl
         X1UfnAO9dNqqtX0p1nu5sIfSVXZaHBFxjJ1pJFo62rm1co7Rg0ypxq+mklIAjOKAhMW5
         PNIhNMg9mzCdMRg8eMQV5DM9G0/CVfK8xCF1kmnryaXpHQKyAAgvwpDR7XJr93jH98Bh
         sH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700159; x=1777304959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oEvohqHU+t3kVcAV8Z3lQU6wP40qdmtAe6P+OzDF5pY=;
        b=UsENTD9pZOTLVXpwFsKugEHUv1xk9818e4feGvJ3xf1DMqQfndcKXbrT9VuFv4Weby
         6aAtumUIJ0EqUJVwnr5k54jWNuYAxg9MaYWmfpu7wMvJNvi/HrwXxJAh4Ug+8RZCWmvB
         DnwsxB6QPZZt/yx+S9jNL7iGI53F1cvx0W7h5MKXhFkwLaH2JqzWP96RLCSyDbdIQguS
         z3GIWr5OcM8TT8W+AHiIueQkZKiD/K1dvfa4UJUjf7EaOgm5IsQ4WbCxkrGssRpRJg46
         5Gr1bdJMmKSTVLUH6Q+U2UqKTa3aGwSR+hlJe7EbxE30WRjgIni5x021ZP6RC9+pDlwi
         JMbw==
X-Gm-Message-State: AOJu0YxZXzC13P03nQZko/xUAlSFG/PG3mqVCDctBoBrrH9DysqdG4kN
	heMhPan9gl2nn0sGTFgWsoCAUoFfsFNBW9KaC7J6D8Q7YVQJp//vAChHyGy9Ig==
X-Gm-Gg: AeBDieuF2x5J1UhsPCrmd2X2LhcFY6iG882iNNUZZO7dFEAf2g7QFNRoPIo129J7f0g
	t5Eku22jzjzysCS33Jw5gtIuKE3TNbjknku2cqVOONcGHw9axIO8E6rNlfyizd7qsD8pmg7fna2
	f/b7pYFEgYGAn8xPT+n3jrOdgTybN5Wd2DgfBaSBtRNa7L6ufC6bM6Akt7C/0/Z3Biz7WeiQCxL
	oAuQBxtZpjsJUS1sWjsd7+1JiVY8PixR/LZDCqj6gHVfsFajWwA6puKcbyQ0Vg6A0ztmfkPUUgg
	+kTz6bQIe5Od1hbOuAb/kvo6SSmg+yjpb5x5I5eLAKLjE+xJx9PDCsx26E2aRw6IM01Gg1bR7Yf
	2dpOI284EXs4NpB2oa90WjwZW2mPuUQECNItrpHPsaLbiLQ2sCYCDNf1k0pvHnZd7veoeg/6w6H
	a3vRkguJbeuLBCw8QVrab1z2T+ukZuIZuLNIWeeKK5cA==
X-Received: by 2002:a05:600c:5297:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-488fb74a431mr234270135e9.8.1776700159356;
        Mon, 20 Apr 2026 08:49:19 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 04/12] ipc-run: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:07 +0200
Message-ID: <20260420154915.952359-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126507

The source branch was renamed from master to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb b/meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb
index 34f3136de9..00bbba0e2b 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb
@@ -9,7 +9,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ebd37caf53781e8b7223e6b99b63f4e"
 DEPENDS = "perl"
 
-SRC_URI = "git://github.com/toddr/IPC-Run.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/toddr/IPC-Run.git;branch=main;protocol=https"
 SRCREV = "af435a1635ef9e48a84adc3230099e7ecf20c79d"
 
 S = "${WORKDIR}/git"

