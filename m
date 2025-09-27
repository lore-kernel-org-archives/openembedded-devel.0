Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212BDCAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:56 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.6900.1758954765997621046
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UzQjj9nn;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-42593858280so13495755ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954765; x=1759559565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74yGdL7JVMSwhC3tvsTrGbs4yaOSGZKdXhvfn+6rDgQ=;
        b=UzQjj9nnN9PqigcYedJ9Z3ST7hiIqP1QDGBan2B2HM5j9IdmpogX5oqgZ88yx62bZL
         TRkYKXnh2gEHUnPbC8Pyobofc0WZqmqbhq2L90t8yQhe3W8U27y03QYDTV35Vx2UYYaK
         BO29vF3A4mk10Cb6kwdY2YKvnE/szE5cFlRxdWwDUTbrGlh+XlxjU6hYddcn7xbCZEbs
         0MtURaBrER778hZ8mxUf9oZgPuIH1XU7JmyShdIo3dyN8zxIzR5ZkNrGjAtsDDy4RVsP
         s+8pvJNdaH9fS1VfKW8MMi2EaNk6vz4EKhqWI+DIfxZ+qW25nERBEHrK80zoH7D3Jfih
         1eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954765; x=1759559565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74yGdL7JVMSwhC3tvsTrGbs4yaOSGZKdXhvfn+6rDgQ=;
        b=amDJX0wX5UWxqVaeaZktctDQczGlz8LEg6ESd6D0altPuX6ej9HgBbSLN3sB2C2QNl
         K9aSf9PqYBPxcXhftK8OF6kMAmDTc9aeXqZLpZDlnNRPMAflcbMGy36LM8XETx6XbQjV
         z4CNX77OYG0A5vX68/hmVEdfjYpT4vBN81S+nij//HY0zxeruiR2v7rRTSQLVmrnvoVf
         ouurpv+ve3dhZalfhFXrO7cuTrSEdueWwwWsNb9HdmpsZzOxGhEHHSgVLPuYsf+XCXEK
         tWHebXLT4A8Gz/4HjgDFs/eAi90DdW4a2WUXKiw4jJ5JhwFV/D+VombXoniXGZBCZ/sV
         l2eg==
X-Gm-Message-State: AOJu0YwrFmKtDgJaPnAR8GkKXNANQDShca0frE6cxdBN0j5qw5x0dSDW
	FyMd+Z2JnzArLWM4ghZnS6PrQhn247PL4eKHQd0RDYXW8z1Qqhf1wJsydU33Tw==
X-Gm-Gg: ASbGncuUxasWTQ2igj8jxvEZ5CZaz2+/SBcTmJH0GAzxmZpIgwsclO9x2Elxlmoq7nq
	y4h09PH5Df480mtYZ9qkAoYw41fWRiCLPcnBeEmZUz+MdlcpZL8NU8+HjvZZmZxf2lY5tPPSsYP
	h+G3rsNfK9wUSUGHhOjD1WHZ4LX1wgnibHiZ8F+zaD2vqJsDEn8CRqWq9xeqxQvDS5kGmeaTeX3
	eDY0lqz8k0HJDT1IpJIMbqRvQ3jC3aKuZ29KUhKfrzhOtdSINPJgt+ghDlDU3jZU4jCR95dNPyo
	iCm7czHQ24/bQBW/iDGaSj7c1zyi+aZKWXJCti96O0d+fAB3tR1hfCVGMjTMHGSkdazhmiUDaej
	4HaJE0b6LIpqG3um8IxFO+CFqcCzqwlJxVtrQHhv0QvJWpaD3M1g=
X-Google-Smtp-Source: AGHT+IEWDagBA3zMpxT18tkE8V66DI0zJiu8N5CztvgBe7dTZJdL4mzYz1mZAEOJQmyHYTDVAJgRyA==
X-Received: by 2002:a05:6e02:154f:b0:426:39a:90f1 with SMTP id e9e14a558f8ab-426039a934fmr119377325ab.18.1758954765012;
        Fri, 26 Sep 2025 23:32:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:44 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 08/21] valijson: upgrade 1.0.4 -> 1.0.5
Date: Sat, 27 Sep 2025 18:32:03 +1200
Message-ID: <20250927063216.1865627-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119962

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dd018dabf869cc7d2fc661e6bb62948c914226c2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../valijson/{valijson_1.0.4.bb => valijson_1.0.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.4.bb => valijson_1.0.5.bb} (90%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.4.bb b/meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
similarity index 90%
rename from meta-oe/recipes-devtools/valijson/valijson_1.0.4.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
index f061c391b8..9661d57e2f 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.4.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/tristanpenman/valijson"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
-SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https"
-SRCREV = "7d59abf50cff4ee53e6584e6d6aa201a19fb5b51"
+SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "8b320f25676030ba13fb90c1bf06133df2628086"
 
 S = "${WORKDIR}/git"
 

