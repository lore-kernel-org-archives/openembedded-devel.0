Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBF3CCF2EC
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33752.1792414588187941986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TFLCtOXQ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1699479f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414586; x=1793019386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEVeIsAzs+UGi7kY71Y0dB9Ov0Y+YuRjxlbvPD3TRB4=;
        b=TFLCtOXQrvnJnF2Z82cvwl5TfE2zu7kBKDxvdw1Qq62nzLrZs6wgRc1IBIFFYIsWPV
         cXEj58+ZlQ7Nb5VVmJ9kufGT6gRnuUcYk0E79ajlnnsCU6E7k9ReP9wgxpoyj0iS5Q65
         lFTwt31o+lXS3CIFfoSe0kq2ttfmaHC/EQIuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414586; x=1793019386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEVeIsAzs+UGi7kY71Y0dB9Ov0Y+YuRjxlbvPD3TRB4=;
        b=aSK2WGHRHHy2Qi5j/PEDbVUOS/b4GIeOoepd2U+alZTDbzn8G4L1ALjGJ0//9unNVV
         I0b51Cej0N9YyvEoBsAnE4ZGdQAVx89Aec810+ucjwxZIps25SlaimK40dOPecLyT5vM
         u/YMNRR67MqRg/8/LsdZ1ypYGxQmMK+vG7fddqCNxcoUX4mRXxkn97t9wWgF3VmNlRkn
         K3iN1D5O2oYZ4rwX+jW+kXF5i3ZqibDvp7GhtHo+AxelSB/S3b7hNhDPDazDZ9u9yGAE
         1asX5PuQQVefX+bb/1MxLEBnaY9TUYfNR6hrtUYk1Sxwe2uF5+vnVwo2GRJ9lDtGgZ0I
         +kQA==
X-Gm-Message-State: AFq9FYIbCfgeVYLmHfcv2UHdKhOtStG1V0PS4H0ZzhQmVnilQazCY2xr
	Z8OKFnffDwGjRsUvRxAC8LHJ5cuFIW0PSVAh+lKLb3s2kgvjXakLNTmXxcV8KgM+eIeW5gEwr0b
	k07ln
X-Gm-Gg: AYBFou3zrdwEhlBhVtP3XStaMxrazXyikQOj0RMRtVeunvW9Asrfp4LWQ+nZFBe9bZL
	MrEs7FP50BKKsBJaNHS0Gc17vX4eti2K0VzqaB1HjOy8xhp/W+iAbM/Qyi+8RJiTYqz7/B6wuZB
	lMv8Q1RoMqRTn8827whrF6oq2N3ot6eBpuR2/6CzHZYeTypFMUvcu47SWjxU0i88xukfZKKM7wd
	koOB7WreMX8F0ZNtUHptrYpdbQnSjFueDxjaT35bgQg1IT0Tw/9fVH2PVPSUJdMeq+noromgoPM
	Ri1ziGoGyyyaA23vP4aS7iWpe4AKYl0szCZmmmZxt3ieiazJffuIwdaQ8YnY1jrLHdbeFc+0erX
	6uR+ldLyycbDqdAyKzQgr7dA6sdL/i5Y0IyOX/KeRtNAJ45HBLlNlY2d++U1twmL7z9poyvQju5
	ewRNx3FByQn/rPwGtOu2fYkRQXg0Hutq4kCCpJyIiRe/0bxqCQIV93a9Gevoz15ZhIV8ahelW2Y
	8dGW14RlSGSA6fLLz755fmHx7IztBD/gBgChxHeqKgnNMX2ORLX3ylXh4iDtNIiwkR11C37HDIo
	q4WAAVSRAu27xL4rDscHo5o=
X-Received: by 2002:adf:fdc9:0:b0:48d:fd53:828d with SMTP id ffacd0b85a97d-48e07bc4039mr11712341f8f.30.1792414586380;
        Mon, 19 Oct 2026 05:56:26 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-cantools: Upgrade 41.0.2 -> 45.0.0
Date: Mon, 19 Oct 2026 15:56:13 +0300
Message-ID: <20261019125616.3888504-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019125616.3888504-1-leon.anavi@konsulko.com>
References: <20261019125616.3888504-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131122

Upgrade to release 45.0.0:

- deprecate the diagnostic functionality
- lint: keep the linter green with ruff 0.17
- plot: read the candump lines that logreader reads
- kcd: declare senders and receivers that are not in the node list
- sym: write line breaks in comments as spaces

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cantools_41.0.2.bb => python3-cantools_45.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_41.0.2.bb => python3-cantools_45.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb b/meta-python/recipes-devtools/python/python3-cantools_45.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
rename to meta-python/recipes-devtools/python/python3-cantools_45.0.0.bb
index 8ca363a044..231a6ae35a 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_45.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "5c91a66e5e03a4ac5727f20207df1da5681748a154c2bc85ef532fef9e0109d1"
+SRC_URI[sha256sum] = "e04a91cb000282af2a39aaba23fc1ca1bbf1940b6ab0d604cea358d0500a62af"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3


