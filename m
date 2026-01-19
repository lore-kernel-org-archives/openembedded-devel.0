Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EC9CCF2D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:05:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32279.1768817156533059084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jGVN2fwy;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0c20ee83dso37782665ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 02:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817156; x=1769421956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WuleyqQ0SxngUUsbRNBa/nKBEnBYQHfiLlF2N6Mzsk=;
        b=jGVN2fwy+YQMejCYHBxpveySxa79oDabPlxiYUmABKgff42+M4g/5t/Iqymjx9YQib
         kIz1z/4+oMdYTRcxn0omWjZ6761RZFmVEADiz4iboxZrc3DZj6V5jQoJFouVc4vUqlqJ
         9HCae3bSZMHky6FuDPe08WeJcHAlSEnbKp341S+UEsxVcKGYry8jjkMAjpzmeEMyAqDh
         LMKgxGW7rGFr/7c1kvjW+iQn3FWlxeX4Dl3aQ+vofmJuJTTovOwzsExO/4Ah8tOmje5s
         hY6Xt1ELXP0DHKl3lz0p0p/e+THs98Co4j32iVSVMjdIzZgDQwhkBXr6OG78bp8o9qHt
         CbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817156; x=1769421956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2WuleyqQ0SxngUUsbRNBa/nKBEnBYQHfiLlF2N6Mzsk=;
        b=jCWBVtGlW+vMNlxUF8l1pBBv7AdPRWL3ibZIx7CgfLct0pX4X2nD67ZybScAM10dTr
         udQgKKTVD2IGzuKGESn4PPBfn+LaSontVlq/OE7NidppJpvbYcGMLek1TagbObWUrvAk
         +BiBi6Gfal2ckZabDABupSvJA+UY1xpRdVAwMr408/3eFmVtSewAFL8Fz8OJuG1kus/e
         bMEjKDNmH2i2eVLv9ZDFvX3n3u3ds6i5aYmYJ3eX3oE5TAD+g6ypw8+L+OGlJseTJQnp
         z7boY2vrR7+3WNF07oASHIl557O2nyDHzd/UA5K2z/6x2vMVjAsKMhqIxx8kFeB/mEED
         KJ2Q==
X-Gm-Message-State: AOJu0Yx1RYjNv8+23UNp464bBxQYWRrvys/rlBf9bLBPhFCWrmwt1z5O
	LcrMTKO1lgP076xD3cNcq25lCm8aoR1XAMs2LLyMZpYvIG3HSnpsUmnVyUrrbg==
X-Gm-Gg: AZuq6aJsCFGcuEQInp0/UEVYYulerUqBRhOh6B0YuKIbrJioMnr2PFlCNSyQHbH+paZ
	mXsy3TNeAzdhwq+XM23V9Zsou2Gam4jAVNitKGHy4leCEtOFqjpHRGdFgd7Kj4dbCJ4JvBLmCNn
	+ZXNViCKBhpvgIIJTd84P1ifjIoZJTsndDBWx48fxgc0xTQWKNkVb1zkkGseprcgIed1M6xlV+A
	o+6Mg+7CXaV905hHm3Duw+hrG1ImksmK0OptVPyloOdRCKw1jQGia4XLg/sdl+kjS6JJggJzHqs
	6U0IGT6NeOh/XobFqsyZPLFER4fOouhzBA6GoQdjcvpFvHGcq6I0l/I6/2K3VZyfomYzyTpozcM
	hQzW05ygeMTvwnWcdA38p6YMcINQk1GBQiFvMhDAhNXt8ka8RaVdBckFTbWeiEQ51f2lqzXxgJC
	IAGCl+hnDV5mKqyDT+x2Sxpfc=
X-Received: by 2002:a17:902:f545:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a7175bc56emr108961455ad.44.1768817155648;
        Mon, 19 Jan 2026 02:05:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a718f79f40sm90109935ad.0.2026.01.19.02.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:05:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 5/5] python3-scapy: set CVE_PRODUCT
Date: Mon, 19 Jan 2026 23:05:15 +1300
Message-ID: <20260119100515.95275-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119100515.95275-1-ankur.tyagi85@gmail.com>
References: <20260119100515.95275-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123629

From: Gyorgy Sarvari <skandigraun@gmail.com>

The default ${PN} (python3-scapy) CVE fails to match relevant CVEs,
because they are tracked under the scapy:scapy CPE.

Set CVE_PRODUCT to the correct value.

See CVE db query:
sqlite> select * from products where product like '%scapy%';
CVE-2019-1010142|scapy|scapy|2.4.0|=||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6f68f5fce766096b9d086093ca0435bc5904b8e7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
index faafeecfaf..678aec0135 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
@@ -23,6 +23,8 @@ SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https;tag=v$
 
 UPSTREAM_CHECK_COMMITS = "1"
 
+CVE_PRODUCT = "scapy"
+
 inherit python_setuptools_build_meta ptest
 
 do_install:append() {

