Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB1EC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:01 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.910.1787117813732989789
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hawMlY27;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383cb94f742so806481a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117813; x=1787722613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLREREIUWGVIyJq/2rucUrubA0MSa+UuYbzUcmaWEQE=;
        b=hawMlY271p4JUFYraWMo+fpB40bhlnZlwdW62UxIUxJHiJaphJYWr2xKsXjc45nkIh
         pokT6KijhMLp4DeVnmXohwH9wgFWndVTFbNBlby8EwGDO2X5pILB9/OkgqRUSbFJegCn
         xsq8OJ82K5nyIF//b7c0qfD9SghQxlmJ6zYHYTdl9Oce1s/DrR442SXVKeGqye5bAGgg
         Ez5q5+cZM6mo8Ve5Lbu3D5BwO9UQ17hxvEyA5e6yP8knfRTV5I7YrYDhZomGEharXaWZ
         LoWAyRZa18wlymGZUeHSnpKFyb0Kq5/tf9/DQA/yAQMjB7C1w8nr9pq9sBJcjFCJo54I
         cH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117813; x=1787722613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLREREIUWGVIyJq/2rucUrubA0MSa+UuYbzUcmaWEQE=;
        b=OG0B5B6oXmhMYX14+oTtSEBv5yzJpYh0edqfVTDO1V5iAyIREJH73fraI9/mE41lhi
         9IjxRL6LK7gA1ay8VdbNyJHGiPTb1+kqv8ObH3nWAiYtJdWawOoKhNTDl3IWx1VBcRd5
         K7xAtIkwgV4pujClvd4bxq6m7sTDXbhMX2T/P7PNbNU8/FbEWj2M99i9GC5DCitibiB/
         CRbDp1zO06edK6yX9bZetNjv/p8v5AtJmgczhZgpQdRDVYn9PzQkio9j/leAXdfduQuG
         tKm9M+q9WTtkPyeGPzj9oZpY9qqPIGBxt0+pyVgQ6w7kEpKdL8orcu/FSnGXnDTIEqfO
         RPkw==
X-Gm-Message-State: AOJu0Yz2f79Z4DrhrLCb12o9WSA9aAN+SiC1LEduwtft9vfNz9c5Ni6r
	jZlWKUBZF+BEurSU+jjXv56Vr4azemRVndWgjVA1rhUSVGXeR9eyiPzAOmvhFR6V
X-Gm-Gg: AR+sD1227PSwUtmPweXF5W6iYKEuhQ0rhpHT2mS2WwhT6RX21hx5y29XZ/eGQLgGamP
	LTPhMgjSDl+d/scQtIJmb4PXEPCynVMSAV3zZZAcAeChKOfBc7/bn+LiWxpTqupmFh0n/kKHT+H
	EQE0NbG6btju2x0QbAaprL06yVgyA+y4uWze9wndtXUoR33ExJ6scJSC2TSQoz1v2BBUH2qNvTN
	OIZ8GZiAnCO2P/yRXWZoVnZUlZupVWpsw9G/MViKXjMkHwd+hAJIRGe9UbCu3k8SBRH8m4Jh/RY
	5ADGbqQCwK9J7ZRTeapwvrmGlZreVU9qm+GQeMrlyv4oCdPKt4/u2xvAufhdwmhYZs3jXcSbiCE
	KEhhTpi6XHjPoxOu+UO2CwDJdDE6cw7LhD8HFGgm4DZfwTwEA2yF83NJ9auYN9aMGY0KdyLXTRI
	Ttmbb7EWIGvWyw+3Jth6h3UMp460rh6FC43Raft2ZmaoJ1k75dDA3CN/f5DprIaiUpKcDMeScpQ
	A==
X-Received: by 2002:a17:90b:2b8e:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-39580f03c97mr4228211a91.7.1787117813045;
        Tue, 18 Aug 2026 22:36:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:36:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/25] cyclictest: add UPSTREAM_CHECK_COMMITS
Date: Wed, 19 Aug 2026 17:36:11 +1200
Message-ID: <20260819053629.391864-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129251

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version cyclictest
...
INFO: Current version: git
INFO: Latest version: 2.10
INFO: Latest version's commit: 40b14a2aac9449dfb07d4f9b4bd873fc3ea62f28

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb b/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb
index c31dd1cfca..d3fbcf6394 100644
--- a/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb
+++ b/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;protocol=https;branch=main"
 SRCREV = "7aca81171ea05a03d0e8698af4ae53c5177f5f83"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 DEPENDS = "numactl"
 
 # Filter out unsupported compiler flags

