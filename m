Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52647CA6009
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:09 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31564.1768811287774719097
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gdMcmG+X;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f1bc40b35so41535625ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811287; x=1769416087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0LUPdvrXHcs7k/GebjASdr0XdFvLisrwSCumT1DxF4=;
        b=gdMcmG+XWVmnroZFGvdHIAsQoQ34OU4nPy3rLk3RcvMr+0hTE6XhfoY74UjeaM4rdE
         apEXhtEXFW5pBNFeeGI8cg+8MCk9jtuJM/np3f6Cq0nMQGimtIL0++g6uSLsvor87RLj
         n5v49DD13qQgBmu3OKdgnNkuwGfmY0ys2LY7jGTlVhyOU1ojHhqCytU8suyotCftCxeX
         ek+OnjhVEOuNqnLFK1uvbsyem6G9P5V9ZliBwZYHQyabufynyMlaqRHGB9Kcj4D7s6yB
         jmd4Hja70sd5N2QF8VL2bye77ccY4/H0FSNker+8BtCMHpUcT3qyZe9gLLYL9gFO8/DO
         7woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811287; x=1769416087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0LUPdvrXHcs7k/GebjASdr0XdFvLisrwSCumT1DxF4=;
        b=cYXyufgG5QNYApkFLOvk6ALtQWah8OfDPWr/vtrj7uy4X+pXhO7xEdcM+qjRgeKaCf
         apO4yw/17679Jdl8/211lZLnVKLU4LWa/l9mOCA5omp9gNSjFZD6AnyskRmDRFTgNX73
         J/vFSwpt7OqwFUxOXpisAbrfh3nxavF6rSf3dexoS61U29m8r95KlrcBmB3iHxSRwcKd
         GfRjGIQ6pAjFXID+aZLu/XONxZeY6/B2x3ZjZTvznAzQOrHOJ870YHadbce1uyYmmA4I
         eyDnYhYSImSLexl5RVBAUq1Njgq/qMJSd902TUqz9RBolrYdyfm48oLRhqK+G3wzHXzL
         pCkA==
X-Gm-Message-State: AOJu0Yw4hvbO1FMFPKPoNEib09bkCszR+wlkF60d4H98hbIGaAbQE7mr
	M22pACcf4AMUjPt+CPhsRe6M884WyEIU9GgKglqZ8R5jrjgTArZOdweUBsP+SA==
X-Gm-Gg: AZuq6aIXIqvyq5mtTxz3rW9uHctSThb/9yrk06Td5v2UTCDYVNWBA8OB8/fQCf9U5qO
	oZHEjVrs71eu4GLn6UBlBtF27tbQVj+kW0Y4aC8At6xWaBuj6ukuqabl6A2sY/UT16v0dcP4Isb
	Fb71rWmX8GIXX5z+x6sEIfE9rQ29cbHvBjze6Ag3FCM8ay8nxByOojifwfbM9LKl55wzMYSDfD9
	H685gln9aWLSWXqX8aRoPPGdvoxOC5fXuh/ZGkPREkIBlWMOfW8l8cCw2jnwJKNZfuV8DSOJT+0
	szZi50lGRguGYURPN+HGCssZ80QgWsZBEUDbS502Z3lfsCkfMqj5Amwky5QjeRjHswDuWwovtep
	yV2x+M8GAKMz2SHq6e2xdTNiMIb47lMaqCP9NqiLwuDmkvqLKJPQuItPysQhT1ecBO+KuQhTRI7
	dcYi3Ul4UJUttHyOHsZFBFZ49+H6lG2i5miw==
X-Received: by 2002:a17:902:f685:b0:295:96bc:8699 with SMTP id d9443c01a7336-2a7175408damr104714555ad.20.1768811286938;
        Mon, 19 Jan 2026 00:28:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 03/28] liblognorm: upgrade 2.0.7 -> 2.0.8
Date: Mon, 19 Jan 2026 21:27:25 +1300
Message-ID: <20260119082752.4120991-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123597

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Change log
==========
Version 2.0.8, 2025-12-04
- fix potential segfault on some platforms
  Thanks to Julian Thomas for a fix
- fix memory leak when a custom type in rules does not match
  Thanks to Meric Sentunali for the fix and Julian Thomas for alerting
  me of the missing merge.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c627784366f53c880719994e09f393265d894d35)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../liblognorm/{liblognorm_2.0.7.bb => liblognorm_2.0.8.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/liblognorm/{liblognorm_2.0.7.bb => liblognorm_2.0.8.bb} (95%)

diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.7.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.8.bb
similarity index 95%
rename from meta-oe/recipes-extended/liblognorm/liblognorm_2.0.7.bb
rename to meta-oe/recipes-extended/liblognorm/liblognorm_2.0.8.bb
index 6de22d392f..6c68b515e9 100644
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.7.bb
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.8.bb
@@ -11,8 +11,7 @@ DEPENDS = "libfastjson libestr"
 SRC_URI = "git://github.com/rsyslog/liblognorm;branch=stable;protocol=https;tag=v${PV} \
            file://0001-Add-asprintf-to-autoconf-function-check-macro.patch \
            "
-SRCREV = "3761794fc0d3b0a9fbfe4daa14a545063f48ce6e"
-
+SRCREV = "33ec4b061ad0a6e5508e679e150ce6422ef6be30"
 
 inherit autotools pkgconfig
 

