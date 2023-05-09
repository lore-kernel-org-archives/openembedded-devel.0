Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1B3C7EE2C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.25845.1683616022244716497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Zsmtu+W+;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f4000ec71dso36346495e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616020; x=1686208020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IECsR9cAQuk6pxEokrdSw6lYNylI+3bj7mTK7GlwO6Y=;
        b=Zsmtu+W+X+5btCuaQcMHnW1QiKvR4vvbnNtUBIzYRkhMJXw2jHMi8BxsaVD49C0+ji
         ffx7J0xIOqGSGld+iHY3QDAt8YuG80D3aUZ4dSTHf0X3HvcLeWT1IzD/PPwwxAQ0ju/G
         UQOKzOIQjX9mfGPURULzcc3QCms7knJYs56gwkb4I5+sQ2xOR174mOqPZ6T3XGMI15Oz
         VLzFwsxH78PnjU+EjBc5ZwJ0R+8oRu9KPjDmh7djnMJOvQyhbC99rgdus+aw9UBOi4p/
         2ZTAINzypskOsWj6q7Kor9O3Hs0VCPP0zZfe+dNr42CdHApt1cd58JJr4U9NJIyQMUPu
         A5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616020; x=1686208020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IECsR9cAQuk6pxEokrdSw6lYNylI+3bj7mTK7GlwO6Y=;
        b=fOWqlwbKplbyu+eIST9MESj/6E4dnq9yf4tXZlg8wDdNT75gZcwPXzs/MZ2x5qpUWn
         CSnH86zG+/twjpU0o4QcA0c9Vg6Twvu92MYpqYSoEj26UiZIMJ54cBEbGpiRnnwfzPGl
         mXYSEwZTg0upv+DmqiCsgVhP7RZmRtCBs+wEQZQDNslTKO4LYsK+ArHhCYXGJqVkrp4W
         LR7JWwDb1iZJMj5nGQzP6iQonDXgGADqfbKqdday3R2yXiRmRK+e2Y0JnsWPc7Erv6hj
         wCshiUUSXOtGPC8ndmQALEAh/qRyxPdlY+dKE6f+K+iO8iKmwY1ve714Z1TlLUJLEB8b
         Uv3w==
X-Gm-Message-State: AC+VfDz3r2bA/DTq9kxDicn0gyrlTrDPbK8A8ZPeBz85Svr80kf1tAvw
	eAmEhMgJ7M5jkY+ZoWFTyJZ3h35ExYY=
X-Google-Smtp-Source: ACHHUZ56U5GbbId+P/LLjpveU/B+5Z/QNRjr4cU//cAbLqpb8LVfIyt2tnrK13z7C/uRHlL1rqEh2A==
X-Received: by 2002:adf:ee84:0:b0:306:3261:809 with SMTP id b4-20020adfee84000000b0030632610809mr9041446wro.50.1683616020757;
        Tue, 09 May 2023 00:07:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r12-20020a5d494c000000b003077f3dfcc8sm12639639wrs.32.2023.05.09.00.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 02/16] dleyna-{server,renderer}: fix dev-so QA issue with multilib
Date: Tue,  9 May 2023 09:06:41 +0200
Message-Id: <20230509070655.70784-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102470

* the libdir is arch specific, but the subdirectory is always BPN
* fixes:
  lib32-dleyna-server-0.6.0+gitAUTOINC+eb895ae827: non -dev/-dbg/nativesdk- package lib32-dleyna-server contains symlink .so '/usr/lib/dleyna-server/libdleyna-server-1.0.so' [dev-so]
  lib32-dleyna-renderer-0.6.0: non -dev/-dbg/nativesdk- package lib32-dleyna-renderer contains symlink .so '/usr/lib/dleyna-renderer/libdleyna-renderer-1.0.so' [dev-so]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb          | 2 +-
 .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
index 3e43c0d2a7..e7f918333a 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
@@ -22,4 +22,4 @@ inherit autotools pkgconfig
 CFLAGS += " -I${S}"
 
 FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${PN}/*.so"
+FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index b25e446c41..071379758c 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -19,4 +19,4 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${PN}/*.so"
+FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
-- 
2.40.1


