Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCFAC5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:59 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2357.1787029375656633729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DGopTiLr;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9aea40d799so2388238a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029375; x=1787634175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/tMOkI0VVUSlq8/A9hSVvsKd86ArwlmK/BKLlxZlpQ=;
        b=DGopTiLrI+fKjU0j5pireC4YWiSlOJm27fi0uMqqZaReAJmU5aKgLxxnuGZHr//Xvc
         MxaStqdMf87eyIlxbx77VQCKIrAKpjS+V+R5ShV93fnV/eMhLRqT447AP5dP0mACUR3q
         EQ04d0U/8mMdEkzbdQnT2pDosCtw8ohtNdcUIFSrpwlhOSRF5E/Npt6fw/N9Znp87Fgo
         NgATawO72/liVytfdEgPa7whLWn4Y4MJy/p9Eh6aW/KV38um/tC46sN2JSYTwS5BXNLk
         4R7MRLNCwdLbGMR1WgnmnPdLgv0lroUonJvvX2RoHBUCBJwa9bBbAUrRhKOKUQnVtp6O
         Z1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029375; x=1787634175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/tMOkI0VVUSlq8/A9hSVvsKd86ArwlmK/BKLlxZlpQ=;
        b=cBTWY/Ae0hvQ8LCB4i5n5XEKArLcjKVe2BKBQec1uwK1Z9cbIYEO6BGkXRWKD4gEvo
         2B9nb+ThWY3LrRoxa3C0uMQC5Jid/alzHjpXkeLloQtzej87pJ2IjETMoIQinEfRzGUN
         CFsS+MyaljcUpEQH8kGzmOUX9VD9z+PyuFGJkr4VQAPO/cHTLpfPGy+931HomJZOIPzc
         Cqr6NvKwz0R4//pUrZB1oGNinzomxRE7rpve6Ql/fFBmkzQ9AqFNW8d1ESDZVKfuq8Cc
         H1cNOaviS+NpiLPe17RfNehx2fgSgDbul/zuC7RdSFvh1+e1ANmwpPBqX9Tqu92wY9qT
         HUqw==
X-Gm-Message-State: AOJu0YwD5qgqvxl/Y1WtKb5/eqF7xNKpas762P3+Ny3WeFAPJISUzlUo
	PZeFIjBLnPanQZMP0ms392DL5EziV3jjALb6lo/3BUaFZyzUgRfIoP0uHAYZxLhM
X-Gm-Gg: AR+sD12HHTVA6xnNcb7StWlgJWnUQFa49buWG6IBfGX7e5tT/VwfnNkS11saAPFymfR
	Mz4YP4J3ZilsNYt63BPqxCfGfrxYewMNes5WT9K7QqsKBvDGnCf4DX93+UkeTIKb7u6WVTkn1ZV
	f+rYrWNVIVsbF2uodWus1cLlDfKCfn/PAlfqHeN9Z7ySnMCbZrHVQ2ZSE93djqqYwF6+1ZbFJ4n
	Fim/KvHWPq2Hyc3nEQ3iBRWjR3N8OHFiKIypEI34HBz94BDsAJfoFGA42RrXaZTrivioQ+r0/gE
	PzHMeClTgA0qIW+iUYxiOtrWSJJ58lSDuV8s+1adgmQ2Dut5KDQthNPGbsaj+brlWzABIraRrro
	OMRQyy6sqzgYAQSQuo3BL6EKuaYCljsrZXUBa15XdtR0Id4MgPESA5J0lA3EP8PSWKqal172FHu
	RZdI6xkWXUmEF2CHFPVAVK6Byyc9Gc2EhKs0lzBy0p0TIKSNtTh+MzHuqvrSDbRM5dpBuzX1lkw
	w==
X-Received: by 2002:a05:6a20:d48e:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3cc7196e77amr34404791637.1.1787029374863;
        Mon, 17 Aug 2026 22:02:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 27/27] tcpreplay: upgrade 4.6.0 -> 4.6.1
Date: Tue, 18 Aug 2026 17:01:22 +1200
Message-ID: <20260818050123.2901739-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129226

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/appneta/tcpreplay/releases/tag/v4.6.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tcpreplay/{tcpreplay_4.6.0.bb => tcpreplay_4.6.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.6.0.bb => tcpreplay_4.6.1.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.0.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.0.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb
index 368308408f..8259c4ef1f 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.0.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
 "
 
-SRC_URI[sha256sum] = "30f73b901e74b6ffc36c0f82afccc9d5740e70ba214a15763631a59dd2cc3564"
+SRC_URI[sha256sum] = "cc3642816073fb1d96b3af36df4fb66c11f523da427f95b7b0c4c99deaa53afb"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"

