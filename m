Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE147C38A05
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.21320.1649623400077156844
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=4uHJMLG8;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id t25so23363330lfg.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSNyzEiWUEVCJL/FIXl3CCIWk67kNCNNcneZrRtyaso=;
        b=4uHJMLG8H8idmskY06fvPGee4p85SH8lg1prKQ4aXzGQj7yedNR/hHZ8iMq+89w26H
         vruLmpDp+vMeYnKk83svs2CjsYA5HbQHbXDrMhKR4cpOAFToLVOdxJC4SI544KXgoYEy
         gDgcksgsYG/XL361ZEyHzuSBFwm76Xu6R5dN6h1Gjux5NddVf9DVafJF0N9SVbKQcF3o
         b0J0Oy4UBDxZMk5QNQOYikHvKVZEkQ63xm5U02Fgfq6hbMqBv5YjLiNAlB/apydfszYk
         0+A3uVw38iwuTktm8zhDW+j0vaooVhiOeBi3BijNf2NQiuVgHXy4Z1+ynLTPvieUTItT
         rfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSNyzEiWUEVCJL/FIXl3CCIWk67kNCNNcneZrRtyaso=;
        b=nmLp08lAekBqy7cLrweW0L/gkBYH4jrF6QDZ8jwvWZYWcPlugsVBrDofOtHuh7pr4t
         mhwWTw8a/v722mE7ZjA56JF56rbxmG7WMcZHYpdLV0bXrPjhdPd5UmRtivuzZG0regMv
         3P1Y6QhSjXoZQr4kyTs14rOj+jSujlHCeCBdzWc48oBsR77MiXntvtJVvwgWBFTf5wbU
         ugOcfhzmy+6Vd+s/oLQCEdsj3DEGrIEq6TK1pMRU+QaSK9b4ViRSdVSA39o52RR7d0PT
         1UhU9H1w1i6gpUfbpPOIWVtS97hNlYhgO1k10P7c96bMJo4cbjH3At6AciKXgvbyiTWg
         +YZg==
X-Gm-Message-State: AOAM532bemMZR73+cxGN5fqya1F/X73yZBURQVcgOa1aMlG4n49mzA/w
	nQlJBe+qzyKhMFoI2ZeQGS+XNTq99Q8STsmX
X-Google-Smtp-Source: 
 ABdhPJzOFQe1NGuFrlKza/lryjBPQfIwslQGY81AHuM+6l9ZTNohSflUlrjBijqP/nO9mbJD99zMWA==
X-Received: by 2002:a05:6512:1091:b0:46b:8def:177d with SMTP id
 j17-20020a056512109100b0046b8def177dmr6908918lfg.477.1649623398050;
        Sun, 10 Apr 2022 13:43:18 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 m13-20020ac2424d000000b0044859fdd0b7sm3111450lfl.301.2022.04.10.13.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:43:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-imgtool: update to 1.9.0
Date: Sun, 10 Apr 2022 22:43:16 +0200
Message-Id: <20220410204316.4046326-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96524

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-imgtool_1.8.0.bb => python3-imgtool_1.9.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imgtool_1.8.0.bb => python3-imgtool_1.9.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
index c957fce3a..3dc171252 100644
--- a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
@@ -3,9 +3,9 @@ SUMMARY = "MCUboot's image signing and key management tool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=9965f09ae52c04886a1f04e13ccdce57"
 
-SRC_URI += "file://cbor2.patch;striplevel=2"
+SRC_URI += "${PYPI_SRC_URI}"
 
-SRC_URI[sha256sum] = "4858f5c5f48cfa4a0bb99e60d00aa291172a7ecc2afe4fb77ed96121f59b6e2f"
+SRC_URI[sha256sum] = "7fa7f6bd6bf069b5ffa07ea47478e16b6206bd2fc5b7607def999de0e9134a43"
 
 inherit pypi setuptools3
 
-- 
2.25.1


