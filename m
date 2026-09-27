Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DC9C9833E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:24 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34526.1790506282617488438
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F5onmC/v;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804b59404aso885532b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506282; x=1791111082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvA4aQGsa25BCjcat4wzqhgGVmvuUHq4OXS9irWM49M=;
        b=F5onmC/vEVu5oOtLLuZR5jLiLL04ZxRnT1GFuiOFiWXtd+b24i+6K0hWPin4BeS/rD
         H928yM6YQWeGSRwDSE8JC3tvvpvGxhRq1Yj9JJyLRkGnFe+m6q6lmQxZKDVj2XmcLSeC
         kB3N0zl8mWX+/R8hByOEaWzKZ9f7FaDjuw7QyTj17Qn16WEKr8ikLIuYZrisFZ3Z8HVN
         VLbrmH9dAeD7lVLBrJTLT+DSUX3a5FSfxIWcYYhnJFvebxpBj6WCG2uACaVrTZYGl+g/
         47iEOQ+AWECB0ZH1rvZ31veMXhFp3SeLqoD1FOWE3XTi448ZFSEWfAip4H+vgRc+GdCZ
         kGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506282; x=1791111082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvA4aQGsa25BCjcat4wzqhgGVmvuUHq4OXS9irWM49M=;
        b=iYOqBydtzx/U46MvSaX1IQSLbT59U7O09pksS3MW1rjGDkzTxIBzXVK/vL6dn2yUCz
         EpAenBIfKBDXrx2Sd/gbbBp6fhMf4Yk2iBinwnm7eCGMo97vjwaKkjox/UqKmhz8jv5g
         Bvnui6ui9RJ98KjQaiI3lpydlVKJdEf3st1Quqnm7jbdbV9EGPgozNEl19whskHHlhdL
         BBspNFtz47Bp6scCFqErAvUxDxeZLgqhzagkdeSmP9nhsmOZk+lulY98D5HDtTO4RGT5
         Bkd5M802Fm+RXFxRFeBfieC3E/O0mF+xt2LDqP+e3qC12V1i/N4kiRqe3iPEh7YLfNgM
         CPyA==
X-Gm-Message-State: AFuF++nfmF0I9zchUo33ZvX1/Hvhk/Tk3nnPZTZ/JZhyM00kWbv7nfNC
	GipLNVLObPJPosl/iHRjmbn2iiGYUP8InHQhNL0AZPxIud9qeIJ22SAbbK4/ng==
X-Gm-Gg: AYBFou3YDP9kBGxw0Z3O4nQq88+LpAFPSOdg+Q1eNfKdsow1/W0Xg97Nz980FC8Q00I
	R32R4J022sdWDPl1lPP3ND0rRWvwIl6Traol/08/cTU8IaRMMcBZgNAcOMh01DLJpoG3De/F8qv
	SCFpp8jid5X5w18V2/ijf+AxMjfDF627CkA9XCKo96ZxmlkiDjmw2VSt8zEKZdxn5M43dH97Kd+
	scujlvXGdbEXVYzeeMlUTEKrAryzQE0Z3H4sje9ZSlXgyaC7b4PTXBi/0fSM02u0u7JYIudO8V1
	ntjUrUP1ZsnRdTO7GDP5NOZkjpjFY1lXyXiFTD9IYbKOVNzWrPjpaBn7xHxHmsVKRwWM7eZWTyZ
	OkaIJ7ImqDPLjRJiIkwB3tUmaG/3miPptoOW/yOgvdWVBgJWakA39QA6Yt/MM+ZjvPWdFaFsuaf
	9ExBU2eWSZqewoMM7ftc/rvl/tpEN+2wOh+WbxTNHlqaXZDa2yoTmz3GD5VBMeURBANH3Q0wRBM
	/B+yydLgufE9MijcX5DoSdGjS7eCgUaqNZ5RM5OKHqU
X-Received: by 2002:a05:6a00:2e22:b0:882:89bf:b009 with SMTP id d2e1a72fcca58-88289bfb3dbmr1172987b3a.23.1790506282030;
        Sun, 27 Sep 2026 03:51:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 26/35] grpc: upgrade 1.83.1 -> 1.84.0
Date: Sun, 27 Sep 2026 23:49:53 +1300
Message-ID: <20260927105002.1832451-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130360

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/grpc/grpc/releases/tag/v1.84.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/grpc/{grpc_1.83.1.bb => grpc_1.84.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.83.1.bb => grpc_1.84.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.83.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.84.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.83.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.84.0.bb
index 75b2ea5a18..e38fbb292b 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.83.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.84.0.bb
@@ -23,8 +23,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-SRCREV = "aae267021b1ac256f8b9038d0ef528c3798cc137"
-BRANCH = "v1.83.x"
+SRCREV = "3252a89f10d8e92997862167ca7d095ecda85973"
+BRANCH = "v1.84.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            file://0001-credentials-Fix-OpenSSL-3.0-4.0-compatibility.patch \

