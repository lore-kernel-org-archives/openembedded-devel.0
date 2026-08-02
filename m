Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325E1C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 08:15:22 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19962.1785658514445999134
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 01:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZC5FXPQs;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caea3f742bso24866825ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785658514; x=1786263314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kInyztHecE1/kQlECpYSFI16qDRtbEeLwRn3AWj6V9E=;
        b=ZC5FXPQsgqYjky0Pa92lWKlFcxnmjcjLMNssXurEjb1O8mUXaGGHTriR9PD4nJuZ9c
         CULZGUU3j0FVvzN4nBxVQa/dcRqwyjOQDDNSe8qC7nnBHiF7x1bILPY92ZithyOp1JXQ
         feznahYo56Mgg7WepuYtQ1a6e/jQA//3OOxgVAQBTfF19WXfId7kpLchut7XLTAqNoOt
         bViz+sHQ3+7PGeTwUs4EYj+A+KOQef2bELgUwl3wJiwjx+HDwnnwjqSZhF2LuIrbl0BE
         Sr0l4FF6dXreM2Fg+CPQHXBrgurN1Pnp5P/8eg9nlYGAgw3LR3YsRG7TcZQlkd3cZhWG
         dwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785658514; x=1786263314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kInyztHecE1/kQlECpYSFI16qDRtbEeLwRn3AWj6V9E=;
        b=lBWldbc8H/hP5YWloFrihEwuidIcQh3hFv+6IIycYWJzV4fLQbLmLizFPHVP5FNWp8
         vPSLGWeRhtdrvwNk5Wblg+VL6jNJNRWEXcRM6C3bmankl1fXoOiZbzMqqBBwATXB2mWI
         v57ddDCLnvY7rnUh1SbN0ASzM7d2nkHkBUTxILKWg6Bv+F6KzSwrAsQV9JYE+waVhNJg
         +N0ufgHwiZozSoxAVpeWfMxdw9gnokTbg8RAxPDaI8LasJmusdqdxQuWE9Sr4T6a9Sw+
         X6Rnh6ozZtujLPxWX+w7exjLlfm3m4qD7LFKnPJ+VOFZfXhdFo8vSK2p9uY1vniqut7m
         RLKw==
X-Gm-Message-State: AOJu0YwqZ968kM7bB00gZQkHA/9zniZDzKQT+HgwJfSbLCgLHRWcmZ78
	xa+o36iD/KpbesqSLWSKChzCfzEYuFedIX3rXMRczrPWgY0x8c9Z2R7CS+DZrw==
X-Gm-Gg: AR+sD13vQx8jWsJAyXSVRSaL4hIP/m72/fFQfrfF+GdWrHDs4k2zrGWQcvvvaafIdok
	roiTwDxbgYX5mhVnNEIDo9SICq72Sh6S4Kb95QQcWT8p9HPCMoqSL1fAkBlsmLrNJS7bKjoYLA0
	mfMfS6nSU7ZDvj7O+Gp3NXSkZYyy03wYpDc4+oHWWMXrvJCyvo6x2bE7cApiI7olYkXG01YDg9h
	LTtr2j+vqmzBTsPIdKlSnXFs5pKFoQyiTUySRwZHp+F5QoHEGvbJxYUuZavtKxHRvTnqXp3eyYp
	UOriy6tfmotnX887Bl8m9WNWuzwKnAuIh+XCqxclNclKgs/qXT/WHAXnD1TC+TSVm+IFKTJniWt
	fDeNGlargiVqIUlcit6XAbfJDzdn5Q46oPM87Or4d6cekb6b3qIylVTrfd0GvK6NLOE7tnQrQkM
	nKtkGqXQiDGPHUDYHR6PI1GG1t9Vw/u2a/0Q3a2PvOGAp/DhetmHRUHXUv8XKhoxzi5rs3OlkXP
	o5941KzfdVzIg==
X-Received: by 2002:a17:902:ccc4:b0:2c9:ff29:3f73 with SMTP id d9443c01a7336-2d0523f92f8mr56587755ad.28.1785658513877;
        Sun, 02 Aug 2026 01:15:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19fb5sm24371085ad.9.2026.08.02.01.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:15:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][master-next][PATCH 4/4] libmodule: update branch in the SRC_URI
Date: Sun,  2 Aug 2026 20:14:58 +1200
Message-ID: <20260802081458.525763-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802081458.525763-1-ankur.tyagi85@gmail.com>
References: <20260802081458.525763-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 08:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128655

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Otherwise do_fetch() fails with error:
ERROR: libmodule-5.0.2-r0 do_fetch: Fetcher failure: Unable to find revision b373482a43482459b37bcf601e21846e9c9563d1 in branch master even from upstream
ERROR: libmodule-5.0.2-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'git://github.com/FedeDP/libmodule;protocol=https;branch=master;tag=5.0.2')

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb b/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb
index 1124e972b8..8d57a12367 100644
--- a/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4f3c068505fd5a09e90662bfca90ad04"
 
 SRCREV = "b373482a43482459b37bcf601e21846e9c9563d1"
-SRC_URI = "git://github.com/FedeDP/${BPN};protocol=https;branch=master;tag=${PV}"
+SRC_URI = "git://github.com/FedeDP/${BPN};protocol=https;branch=release/5.0.x;tag=${PV}"
 
 inherit cmake pkgconfig
 

