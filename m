Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7F5E7491E
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 07:49:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.116515.1766562584211209027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 23:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Setpa2f4;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so7059104b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 23:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766562583; x=1767167383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+cCn7Eg628Z73NWX24oNSUCwZxTqR/Aa4W4wePMh+s=;
        b=Setpa2f4MJ03nim5hZEWCMFXE0c4FHJm6BwqJKiqPhI35q/ztwJ5wWy6nimz5eYCIU
         08QHCBOKgFo7JaTYC1tzpy105HuibFClRcbVPJwRHfmQBNnsR8TDk02m+PwJmL8UBbED
         icZaGDxLjRLxRZ8zimvTUSx9YC3VH448gY2rkS9cJmi48s3rItHx2kJuIveBPCjuSuwB
         3LOuCUwNUyb22x3SDbk1GyWAvFyvM4qsqkS6i2NQ8JNV4qA/ybNwtTJFAnMf6WPUDrWz
         uDvj/+zky91EMWGDd4GaGTLP0RQSKK/qT21KRUIu7CV81z7j+I9Nd6QOfwVISWG1TYZQ
         jYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766562583; x=1767167383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g+cCn7Eg628Z73NWX24oNSUCwZxTqR/Aa4W4wePMh+s=;
        b=qRAtNfGnwAHAJ8Cpc32N50jNRAOL9dAmToWwgiz2/aUHjQKoE8VC0+fgMveA1lNL1C
         /gIY4rkCZKBC8FmlnyTFYTXiGrQdn8Y35RR+tYyuEtUrKrgFe9mflve+Q4OjKZANGfwo
         5uxSx2Wkj6Ry34g4XPJDijfoGAVrsN/DuZYPjyZ4NCnR7Adx30ERUgsbLezxvCtP6G0b
         u2+DH13idoTEzoeIE2LeKBYlgS0fPiO/TOs77jiZ14/Vzl/OwnNb0Ipi64567hdHYGbk
         uAhufnci4OamgFsUvRGayLLYUzJAi0p5foF+x3GmZuA5WPAc2JPpft+bylpiFkiiIkjj
         ieXA==
X-Gm-Message-State: AOJu0YzTI37JHfQW8xbnLGb7Fp9hac1Qwthx7ecNantD2NUy1zcffivP
	0KjRJeGM2noE4ABvnmGqIFiLBT4NnOLK4yaeuaExipcniN9D+TzmrmrIx6MvDw==
X-Gm-Gg: AY/fxX5Vdg7o4z6AmoNl60nOt97IeHXttEypkTV0XjxuHGIhLfUYkUJLFI2TGyQ7KBR
	/F9Egf7pxJsSEc96VBrI/aObqlEHqU/7LkkqNnzY4UW753ERQ5b4lp1Ai92JUzSGHT/XKSX8Hw2
	jznVTNqEIUqQQrCGLKUuhPqBxsJqJjS1/SlGPPdFLKJlhzl0NShofkp1zPN5K25ai2W6UaKC7Oe
	xCPP4Yaciw81pEzIOpa1CSNvguFoau/gRzHZ+Jtvh/PRnLVHAVNdQuxXTpiTWfSDvjWA2YDuGx+
	fuwcj0/Z0/iFB5STNjeSE39xVxPS0ZA7GQQhCnzNUPb+5hf8miunH1kPFJqKHaaeHnEm0eCmf2y
	DvDuafd/nJodGXR5nV8UrCjZPEkLkIb+tWjdoqUIH4NoT6YaOLKRiXUf1Y08X4eYYhEOzeGUwPk
	OMNKrB9y52Yj0Gm5KIqs9nx0fM
X-Google-Smtp-Source: AGHT+IGE1MSlDXbmabO1WcTchpGj1pyND4ZHzYd6jUlWdElqCXDylp655PIH3ac9FEVzHw14DbJNNg==
X-Received: by 2002:a05:6a20:918b:b0:366:14ac:e1e0 with SMTP id adf61e73a8af0-376ab1ea654mr16950176637.70.1766562583296;
        Tue, 23 Dec 2025 23:49:43 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0b587sm13847084a12.33.2025.12.23.23.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:49:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 3/6] libmemcached: ignore CVE-2023-27478
Date: Wed, 24 Dec 2025 13:19:29 +0530
Message-ID: <20251224074932.1379914-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
References: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 07:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122846

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed by [2].
The commit message says that it is reverting feature added in:

$ git tag --no-contains d7a0084 | grep 1.0.18
1.0.18

This recipe is for the original memcached which is unmaintained now.
Hence the ignore instead of upgrade.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-27478
[2] https://github.com/awesomized/libmemcached/commit/48dcc61a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 607a44649189a29e6f547ce89b41ba332a45946a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/libmemcached/libmemcached_1.0.18.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
index 56778c0483..e4646d79ef 100644
--- a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
+++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
@@ -8,3 +8,5 @@ SRC_URI += "\
            "
 SRC_URI[md5sum] = "b3958716b4e53ddc5992e6c49d97e819"
 SRC_URI[sha256sum] = "e22c0bb032fde08f53de9ffbc5a128233041d9f33b5de022c0978a2149885f82"
+
+CVE_STATUS[CVE-2023-27478] = "fixed-version: this problem was not yet introduced in 1.0.18"

