Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDFBD0C84D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:34:31 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56232.1768300468524422846
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=atWKQXhN;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43246af170aso3545129f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768300467; x=1768905267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKKbAjmsEkbtrcG4JT8QCA7SCzO4j/WXH9YsU5FAUgM=;
        b=atWKQXhNuhLrYZHFJuox0PiKnDRPaB6js2eQ+EK4rinO+uNb+57gZ7LUcjR2rfp5e6
         Rs15ng/ERIzFBad/uIY/ddAE99iJGiOkN5SXlIRKXMh5pjtvP3tffN2Mulv2E0wU8Hby
         SDsd4uNCzMhYygIU9mooARrmOck104huAWrGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300467; x=1768905267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OKKbAjmsEkbtrcG4JT8QCA7SCzO4j/WXH9YsU5FAUgM=;
        b=PrEXU64icl5WKF4i77f8K+A6rmD5pTzv7BKZn6U7TmMW0wNtiGIlvOG0TXM8urjQJY
         PE8KaVXU4Ho7yOJbDLOkJj1TayBo//1qFp140dWp10CTNFs1Nn8KejqNFEW+tRPiKPNi
         I/OS3ihcpwwnDdStC9hBg4GQXTpmjgs4Rv6ZJDEQ1XrD/2/pyDnQ2nrBLoWR7Fh010Ro
         LtP0WNIFiL9d1CnuALkEvFU81n5Kfbnpsi4VCMNCSS46WT0oKE+Zrc5O8uehYL0yDBKc
         Jo+EUEPNKtsjNmuUG4Z1hQ3evIjRnsUVMQSdTwW2tyYwK/KPucqsY2tq457Y+nUdv+6j
         yy1g==
X-Gm-Message-State: AOJu0Yxt+cN+YyK9qvmzRvd5mkfCbCpfMr5HU2Em7Vd5BA9Uf3CknY1K
	WmsLtP1cwSXphSfbowQzkWVq5XB02pUrh+AlSB8ELmtODJjKE4pRTq8SwIBtqIN/EZMNCHTQr60
	eC3X0
X-Gm-Gg: AY/fxX4zrNEdrVAyKdS11m+ZLLGvWPH5CjZVL9QAeklbAgoyVnT+CP19kM/4uHs0o8h
	zPfz6uBDONnfKjayAp7E4pjOi0ORMR6M0stGkgLim73E/LoMF8f7wwn/+v3xLA9hj3OlDGPKOfJ
	sCECPdhjOtoTAbsBQNB06okIRK3M7KlfMQ1w2XsuTvVoqICms26SN6E29QAe6kD/s9nE+ScGKQP
	VAweVQO2E43Prcts2Tce8sYg/bUnvamlBt9gquXdKgBjwvvWiXTBS2RGrcziCYuL07GX3Hz7yui
	qt8FiJqcStTPi9uhSAsbVXU3WvaTHOfERAbPMls7pJVs5F0ga5XHb/mz9sVBqnOCO07/wS0C2ot
	riAl5uWQXzJLe4VUlTiUNXCXtgjeW8teVLrokIRo3gI9C56yyqlYYRhsTzXG7fPILVu7kGQ0FE1
	Owl/vFm421EK3M5i2k7CqB0iQT
X-Google-Smtp-Source: AGHT+IE5TZovek5Y+PjYP5nJsHCbO1axNAw1fIXp/RgJN7ki9aABs3KS/E6EXbZIaq2KL2SmFqTKDQ==
X-Received: by 2002:a05:6000:2dc9:b0:432:d9ef:3bef with SMTP id ffacd0b85a97d-43423e77eacmr3199957f8f.2.1768300465800;
        Tue, 13 Jan 2026 02:34:25 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa84sm43341971f8f.2.2026.01.13.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:34:25 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-filelock: Upgrade 3.20.2 -> 3.20.3
Date: Tue, 13 Jan 2026 12:34:19 +0200
Message-ID: <20260113103421.3568307-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113103421.3568307-1-leon.anavi@konsulko.com>
References: <20260113103421.3568307-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123431

Upgrade to release 3.20.3:

- Fix TOCTOU symlink vulnerability in SoftFileLock

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_3.20.2.bb => python3-filelock_3.20.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.20.2.bb => python3-filelock_3.20.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
index 2a0af552b6..4499b220bd 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
@@ -6,7 +6,7 @@ LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64"
+SRC_URI[sha256sum] = "18c57ee915c7ec61cff0ecf7f0f869936c7c30191bb0cf406f1341778d0834e1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


