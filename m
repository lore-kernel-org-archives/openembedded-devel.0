Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B65CA0FFF
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 18:43:27 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.15751.1756579402816820457
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Aug 2025 11:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CioLnI/F;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32326e67c95so3500571a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579402; x=1757184202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pk7i5TERi0mYbhheQNG+vFc58q9kqbRPtmG3NEc5hIU=;
        b=CioLnI/FXP8UjKsSka/ZTBm+bSTmpvQfzZRHWTsMJSe2wayU797gO0M1DV2xjx+t26
         j4+A1qmhwa42E2Wof2+7otkMrc5pvV7iw9UF6VIuyP5E21hLyQWYvhgrCKiio1CotYZB
         HEtQMnBJ7POiutwLXDi1MpANY88jBIXyXrjK6YagRD2DL2hqpXwo59nHcgd/D1InN81X
         X7kfR9PDbhfBEhX28OVl79Y0ci+Jd3tPJzdVTLWHU4AG+1n+8VZRrdlLv59y8mOh0ILK
         opDWk56A31WZlZ1tYi+VMu3g/n/zgcNp1JfAGUzYKohumx2WTMXqJiVIeRM0R4oB7GhW
         AFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579402; x=1757184202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pk7i5TERi0mYbhheQNG+vFc58q9kqbRPtmG3NEc5hIU=;
        b=oeNK+M3D9/3OMgDbntwPTUj7zvi34TaUCbPxssgCzdRs3xzEH5731zpq75vOn6nr71
         uBXmqmB2+IYYnC6oSQDf1HPbfu9BPdHH3Twdrh6GaE/bmoasqsAdBz25ei0pJLTcfmDf
         ggBWVBWeE9U8WLjbklL7qgO8XuBu90mOJSPH+nAb/fYgug0HVaYDsqincO6efPRJ9mEx
         JBTxtz3aSNQyByPuC9x/oFgxgoVXRf2+WUJps8iJNpf6/t32byHZ2oqcpHGO0s498bhk
         6bhqghp+kZ11RBxz74UkmSknm2arWb7PhshYx+WLllNgDmoSgnB3agQTcDH7rj+tr79G
         KulQ==
X-Gm-Message-State: AOJu0Yy+MRgqpoP9dlgS53pqA0iYMV4Dkl4qSTZyixRI2mOCNZo8Vzut
	mPrN6ZYknS16xQZC8IO/nKvmYHuZu8nHMocm5Nu9A3SGxRhniHGfKQR8OGbZ59i8
X-Gm-Gg: ASbGncuQ5HhcmgmYgZrNuGqgMuZqIdzjKG7Tq7i77i7nfPuxH0i47GDeSVVahe5zVnt
	jijYbDaknANZ5Vk99aCZ+ed7QgOj8KfB0l2+a5W3gZ8j+9pNLWQBTC6Zv6CNVM9Yk0vhTrPDxM+
	Zv1uJakslwku6SsKR+pEM5aC3viv4Zd3N/fGz28AIooWgwzDItiUIMqDA6zk/RGuCm0sqU48aJD
	LPB84vADh9Hm9o1IFDSrBOxNQpGtbRq8HzaUncLWONW5fyDQoEmvKkdp5n07oOVJSXLzRehJSVl
	23ddomZd7EkrjCUUpbmJr5zCysmTAekdk/AI5Ppns/RtZP7g/0SlxCJToFli4sPRhD2jS9utbNG
	X5DXxCq4bXLykirGDKU9UbfCU+2BShtJeAb10gKc2ov9wvHmahYZX9Hsw+7xEUlUeFC1b/CdxPk
	RKi4+GuQ54VZzFJNHA50ugM0HkT24VFZCIrVV9UQyF
X-Google-Smtp-Source: AGHT+IE/p8UYagX3U3d+bp1l81ha5ieOKIt7m86PcrBuhvCNjcQ17hE7KuImT4IvBWaOzG8hqZlZsw==
X-Received: by 2002:a17:90b:48c1:b0:325:42ad:29d2 with SMTP id 98e67ed59e1d1-328156e3815mr3359871a91.31.1756579401883;
        Sat, 30 Aug 2025 11:43:21 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d9330b73sm6462091a91.4.2025.08.30.11.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/8] include-what-you-use: Upgrade to 0.24
Date: Sat, 30 Aug 2025 11:43:09 -0700
Message-ID: <20250830184311.1018374-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830184311.1018374-1-raj.khem@gmail.com>
References: <20250830184311.1018374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 18:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119149

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude-what-you-use_0.23.bb => include-what-you-use_0.24.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/include-what-you-use/{include-what-you-use_0.23.bb => include-what-you-use_0.24.bb} (94%)

diff --git a/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.23.bb b/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.24.bb
similarity index 94%
rename from meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.23.bb
rename to meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.24.bb
index 7c4392fdd1..6ae8eaa6ee 100644
--- a/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.23.bb
+++ b/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.24.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=3bb66a14534286912cd6f26649b5c60a \
 
 DEPENDS = "clang"
 
-SRC_URI = "git://github.com/include-what-you-use/include-what-you-use.git;protocol=https;branch=master"
-SRCREV = "fa1094c0b3848f82244778bc6153cc84f8a890f6"
-
 PV .= "+git"
+SRCREV = "27e91c0ffd035c82706da3d3d07e4a036c6b5876"
+SRC_URI = "git://github.com/include-what-you-use/include-what-you-use.git;protocol=https;branch=master"
 
 inherit cmake python3native
 

