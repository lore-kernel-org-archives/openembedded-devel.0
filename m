Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CAEC5DF98
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:48 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12925.1787485961278942571
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SJmFu8jc;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1812922a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485961; x=1788090761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4Cmb+yZRM+y7uOiZM2yNlW2CRUjuJN/tFiWyHz+wU4=;
        b=SJmFu8jcO/ML3UYvEU+rB5qOcs59/cr14vHdB2Dcw7LAPr9PPh5VGpvoVxEPD0/heD
         GwdphV/5Sc6rwexYks7nD5oQdZcvvEZbOUJ1TTrkFVVhhCd5RxvaDYhOxhXclGzYVbne
         JS59BGg5zObcysR0vDQoVng9xhv+HNH0CunkFuPUzPxHlwSVQk2AeZE2DUKVOnPt6WS3
         HiuCVU/Amf+SJGk+uajFnnr9Qc9XFLrC+hNkIA32guUNTzD0S5vQButs0E8hO3g1+egB
         a8JNrOjHzOevvHLJFIiZ1r/30oGzHcuA3oTIIzDq2SAwS+/UmfpNU+R3eBHMX424r84M
         2zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485961; x=1788090761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4Cmb+yZRM+y7uOiZM2yNlW2CRUjuJN/tFiWyHz+wU4=;
        b=sDguZJcxEeDU+fJTyqC/UZg0hNIrzmV3FCp6Gl21OvFydHjdAF9TN6MdBdC+quB/2m
         1D7t62PZ+sj89ctm4Qak0zi8OYi7CtPSms4ayyjuJ5l2rUsKivjRw5/Ct6XMmuLSOzNP
         X7xMDOfihy/xgl+76NEOa8hCPclsK+aTRGLX21DzO9FpQ8Jxk4sUU8ae+Hdi8U1zw+Ah
         G7c0FrGjBwr4XL/S6iiabhY7QeKc9zKgMz62cx+nx02gKLhj5ciYKKBni8v/vz2Myg50
         MHmVQhrhdHb+kGKcFaJOaaJgNkXQh8gDR2hQ+d8ccxuRAJrMRaWe1FsNlDC+8W5EFbA3
         W4YA==
X-Gm-Message-State: AFuF++mOTQaADJrqc2BWUn7QFn021z1rPAMHXOiYOKWXCtLxj0U79RAY
	zMk3RGlgBSOWhaTQzp+XNuaexgD25hnNTrI7FrR5Xywk+Vb2tLr6HWumv/V/EA==
X-Gm-Gg: AR+sD12gX95WC7mXP8wS8ZNsK6VxNaF1x9DexE6v6ClLgljUrjHVakg0iX6pqikOkRk
	wOjV9Xdi1HB3UPQklJvWl1TsQGqg+gGIbP/xZkPC2XJzQFS2JzztShF1H+N8E2dz5d+Lpc5P50o
	DsVlt38TAQ/L3bOnQNbrj8CdPKsdHKZuYWOyl8AMmTsjoIriV5HAMHv4MGvehAPc2n1GXD6Q6kI
	clcLHjueDwsz9WfCBsmO40uZH0tkjn3Gi9hIsPADIJqpD/e6X2aBwrO1BSKBDa/4iOtLmHT7F6E
	ADpm8q7+YJuENcN1Fi5iSCYuVBT4W1oOFUImw0HtYvdCNT4wKtKDO57+S5BB3QsuUiCPrU0HP41
	S3AaUP16QDcLbsI1c424Emu8ixmlEQa4O+5TGwRn+8OjmJFWwlH3fHNeYTSfb0yk7h6/HdnnNv0
	/qKxJLe4eKsGcUUAzfjP/wgZf7lZTdor/dPunqr6Jb7lQuMAG74GL3NMrX3ELv6iLigERt/6hQM
	3FX/1o9KAew
X-Received: by 2002:a17:90b:2e4b:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-395c514b5cbmr17528010a91.10.1787485960597;
        Sun, 23 Aug 2026 04:52:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 13/20] python3-web3: add CVE_PRODUCT mapping
Date: Sun, 23 Aug 2026 23:51:51 +1200
Message-ID: <20260823115158.1582363-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129447

From: Devansh Patel <devanshp@cisco.com>

The current inherited "python:web3" mapping does not match the web3.py identities used by NVD and CVE List V5, so its source-aligned CVE is missed.

Use "ethereum:web3.py" for the CNA affected-data identity and "apeworx:web3.py" for the NVD dictionary CPE and configuration identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 19ecb40f50cb5c93eb2830b10c4a5b02e367e4e7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-web3_7.12.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.12.1.bb b/meta-python/recipes-devtools/python/python3-web3_7.12.1.bb
index fe5886692d..18fa1d8d1c 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.12.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
 SRC_URI[sha256sum] = "97f6a116ccaeb5907bb4cb6c771cc23bc942bf09528a840189e9b509b7b8347c"
 
+CVE_PRODUCT = "ethereum:web3.py apeworx:web3.py"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \

