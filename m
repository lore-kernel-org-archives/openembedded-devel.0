Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7615C43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:54 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14724.1782634312801807481
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VZ1hlAi8;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so6037297eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634312; x=1783239112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcubXwwpe6VIWJTlAckHr2zr1oB1r5hY4zeDaLQdi10=;
        b=VZ1hlAi8R9U+UJwO+gPjTp/HMzu+SOoEPRWj1/f7ynDBqtPn+fZ7GCx5RoldwAn/n2
         bkYPsx9qaVfHWm57PPcB5eoyXtvTWsBBqoYRIX2wkco9r8LU4QDhENZU2dFM0ThTkSsJ
         q2VCQE7uNmKARkqW39p75NwSoMVMCzzC+BH9IbkTjgUS5oR3sn91C0B9CJVZnw9bIIX3
         amlBW2zKwDpk2AzuckaWOn47C0HZTxnTa4lMX7dvtRzEQR93hDB4Bxcm2qcZmXcID2WX
         QMEOZOtgl384nugc+Wnjzzkrqnct+WQqSkL7NcA3q/Y4V8lnsyadM8/QPBsIEY704CFr
         4pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634312; x=1783239112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZcubXwwpe6VIWJTlAckHr2zr1oB1r5hY4zeDaLQdi10=;
        b=Kzl2oBcBof4QQ+lnC06rHyM63NBOFDetvTXzEOYm64vovb71PwqIywmMMq0hDfRMax
         KQMqkkzv5HpibXS57GOVy2v7gVJOvhm58Twq+XHg0OlHLyJuL8523jKt+ZhlZMiihZ68
         7QpK1SXChpN134Px8iEAXnzZcrXVQmSQUm93d5YxNpkOG1a6Jjqb4LWEAfBFj6rI9cki
         BSvIAU7SVFQge+K1qR8lmE77lO4AwROKJqwrlaZ3LrX6ozVo7nRMcx1suc9NUB8x+c7D
         CS6p7t6naFqIWDjGcMbgJhksyt2ImbQhpXBok3TbJpWkuO/ILv9hLcup996XpLAomM0W
         IFJA==
X-Gm-Message-State: AOJu0YwZ9hHyLewmTZmKdbw+Qmcell5HomGH/joEsoKMjSy0VtuAHrCF
	5CM5qE66SCHm2585pt3tyYXDPYk6o8zsPOhMB+7QUAXv4YU1bpiICppbMIjr9RSmjCS97g==
X-Gm-Gg: AfdE7cklCPmYN0BHG9QmaryAKGYVpus7iVrSUiocPF78vbRzthnCMuZItMh0eeyBfMS
	sQY4fr5R2qdJOM8HusftaOf10yAC7RVeZMoVLvtvtaOhQOUydlru0wCImT8WBTXhsL8sCY8uNmW
	NY1gwITS9EREfPc/HWNQ1WNDzmRgf8WK7qvTjIepBTWDsWkD9VCJIoY5Imp+pcn4rmsoM4y4IES
	PQISUdR8rj1cJ3C0wzuvHKXWhnHu1u/Khxm/wAwAz5jWmPmarOhkn2ET8iDm8jsrJQkLlU8ZhfJ
	cHUhtUrtovQwfGQNcYARA6aIQE5OeVeqcmaQYoCuRwhVseuj0e83/AZ6FyC7qdAnEViD3dkVHfi
	jKBZTZLxZHRIuwv/v4gthAQvvr9xMfgEbMntsL04Zge/qVzQ34x3xDFCsTNBc2/GZjq1/fBr0E/
	m2NxDUD7xRwqA4GtCGoZTNe4deLGnm1+ItcU16WgQtkS34TiAHy9Vmo3jvAe/4o53kabMFhQWJr
	XJB3OWr4wX+OB7jnKq7bK6DEiAPuVK+vIRbC7FLtGdLoqdM8yGPB/ZCCTxnfjh4e9k2kFZrL1kG
	Y1KFXnJy4Pfa97cEkhg1aY6OGFzyJ66vv0iL55wa
X-Received: by 2002:a05:693c:62cc:b0:30c:6690:53a1 with SMTP id 5a478bee46e88-30c84d10a64mr8803525eec.16.1782634312178;
        Sun, 28 Jun 2026 01:11:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 029/128] restinio: upgrade 0.6.13 -> 0.6.19
Date: Sun, 28 Jun 2026 01:09:40 -0700
Message-ID: <20260628081122.178348-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127839

License-Update: copyright year range updated; still BSD-3-Clause

Update LIC_FILES_CHKSUM: the LICENSE text changed only in its copyright
year range, it is still BSD-3-Clause.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../restinio/{restinio_0.6.13.bb => restinio_0.6.19.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/restinio/{restinio_0.6.13.bb => restinio_0.6.19.bb} (81%)

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.19.bb
similarity index 81%
rename from meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
rename to meta-networking/recipes-connectivity/restinio/restinio_0.6.19.bb
index 841f7d5cf8..22dd4ada13 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.19.bb
@@ -5,12 +5,11 @@ DESCRIPTION = "Cross-platform, efficient, customizable, and robust \
 HOMEPAGE = "https://stiffstream.com/en/products/restinio.html"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=f399b62ce0a152525d1589a5a40c0ff6"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=bfe2747443b7875eaaaa94b55b611f49"
 DEPENDS = "asio fmt http-parser"
 
 SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "37a4310e98912030a74bdd4ed789f33c"
-SRC_URI[sha256sum] = "b35d696e6fafd4563ca708fcecf9d0cf6705c846d417b5000f5252e0188848e7"
+SRC_URI[sha256sum] = "7f21eebeb966e170d6ab54e9b198ac927d439090121739e037c0fa3bb367b240"
 
 S = "${UNPACKDIR}/${BP}/dev"
 

