Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92C8C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:42 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11295.1784590774230162867
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IfGHAFBX;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbb85186d43so27690a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590773; x=1785195573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4BSbmHT8RM7iNt4E4hsbVFlNNQ06M0hA9vLkCudeBU=;
        b=IfGHAFBXyxwnehOIt/sBiaKGDQYfrqc3e2w7PzTglTy/OTx7pipibaNVpiSetpWTdN
         NDD7J26LkY+H/L89AQLJGO8BXgHQpruHAY/87pGbfAQX4hzje4MBmNjZMqS6G1kXsJfV
         0vGNEtSfdSD3Wl0qFWtbNKoesbR2Xs1VMTl7mp92b38l3VI6g2h9KyvY5+7yTBos2vkd
         +cfep/L0/WP/+75DE/UEvhsxDmnU0jpylux16T2YIVeUX38dMcY4YNg9Tq0VgTz2lR/Z
         dMqQZ0iaRcRhfikeGHP5nb5XUXAY5/lt63Qz9F6qZDH/Gqj/hkVlYPWbr7gA/d3fq7/j
         GXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590773; x=1785195573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4BSbmHT8RM7iNt4E4hsbVFlNNQ06M0hA9vLkCudeBU=;
        b=RYHOHvCPR9RtngdnBjBzd8ABqiyjmkN+o6Xm9GCuVXx0dHQp6NBFKbzg5tQXxPGHSr
         WEK0c5x+GjkLzLv0oowrwq4HgDEzNDHi5LRDzXyEcXs0vWnFx696HEQ1ySCNDBkb2nVx
         Ff2bVjXvG+Jxj5L6o4xx5mGX6Q1EjJRH7S7bvUtiXfsgZXddN/0grYLSS5nicIHX0PG/
         QfzE7ebnJmiIlAddes+f/7pYBMQXZoxWALjvuwYyXl2ob68oR3/yMOzOEFItvjvimJ4E
         IUT0oY8+CjXgGNtHGvj6H89A/BNjc2RHWtEHCipBWZmp6GxjCLUCjJQ+KJFYgcf03R9g
         bFBg==
X-Gm-Message-State: AOJu0YyBCwr+squ4vHaMMKn+8veSKQBq6cdjMuKNgAYRvia92d06zSy1
	rva3yRo1vCK7Mb0WB+u1A8X1eTrsuZ6TLas6B/CzPoUdmzFb+uQDbSuqoL8pow==
X-Gm-Gg: AfdE7clOU7um55OeH+QInnBs63hYzAxXk27pjNOsbb3vyfrgU+CCdl6KTEEw1mCY9lo
	rY864NbZHTZAQAf6rUiCrX5G715u0QqrSBp3ytXoFtXHUfPDU2oqV0dt/gJNy4+ofn75GH3SsF5
	Q6U2kzVeJQVRJouy+kaU/yy2wubvqXur/oGlQyFF5vIQ0UwXC/lOuqbp7bqdUr96UMy4rMEzKFS
	Tp74yP54vlFdQCSJnG3J6cTGcXIxuCqBgT522U/RY+7BzyTwR/6SQwfnmTXhk+VnUplb7UTcpxZ
	n1oShn9ybdq614HVVvZsRNJe2VVARFM/RyVo4gvadeYp39GTUmgD55BYhqpDwnmcB+a7ldzx1jU
	4eF3nWSiVMJT0a131h/Vsci18FpBFcxMlwXbEBjIFnFqdBjwdo2vU1nZsy/EUoPqxGhzmKl0Alu
	mu4vuUq5yEtOKW0hs=
X-Received: by 2002:a05:6a20:c407:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3c3b5dbce25mr11673637637.13.1784590773536;
        Mon, 20 Jul 2026 16:39:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 27/30] haveged: upgrade 1.9.22 -> 1.9.23
Date: Tue, 21 Jul 2026 11:38:08 +1200
Message-ID: <20260720233811.2324493-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128328

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/jirka-h/haveged/releases/tag/v1.9.23

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../haveged/{haveged_1.9.22.bb => haveged_1.9.23.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.22.bb => haveged_1.9.23.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.23.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.23.bb
index 281fe1c2c9..9dd5f4d378 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.23.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "21bad00a09233855fbea14ac062bc72b5eabc9a6"
+SRCREV = "99d5b8de8339ba7725e3cff005e2f77ccf699582"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https;tag=v${PV} \
 "
 

