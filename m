Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1205C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:53:08 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12932.1787485981248949199
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ob/WoCrT;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1851019a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485981; x=1788090781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ForOsCj82Ct/4MSB0rKBKRw2XBj1cMXMkNnX7//MiQ=;
        b=ob/WoCrTHVwTDDRQBhn51LqpJMY5X7tlR0E/ZVcmfN7EHoMQkGcTgt7BOQz24klGAw
         ViVAyJLdRLq8wuOWNVJ+c4OTANgwNC6dVNvRQW4Or5ND9l1ONEsJY1KSw+iJyp/pwOJg
         nfHCDaoWek0s4jeJH16sblX5twD8Ii/UxmXpg7ByfI8GWmY8sYF8IvBktNzJ7pkIlTgy
         2W5hBFnPDnoWvKqxqps2fRC+FtmntyFU0ht3ER787IQSz6lUVBoIO7FnOlGuQB+3kZb1
         nabLTKmfo9aLzZJG5qGSrPm5rRbRSGhrMpr6ed/9SH1MA92tkD2bU6QARmcM851macTw
         yW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485981; x=1788090781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ForOsCj82Ct/4MSB0rKBKRw2XBj1cMXMkNnX7//MiQ=;
        b=WAIFXxhVwSKRPlfpRp534ISXzVkJCO1jPw2q6P4OB78YCmw5nsZG3XgVtYdEDaLVSi
         bgPLLVbzg9I/da/Wml7kzMx8i1dO860zaS+JY/2SHoD8DXxh9Fm5fvFMSvwwpw7ZSPWy
         JD0eZplKxpPnWFGc8x86HBirKLdufUrZxDWxWSTRxkYrhEaPp4fi9EJB2RHhBwGrEbTr
         wnwMu3KCjpQTzeYg/EvaH0yu8THzL/rupL0lvBQk2Ddzw1tdibl1l+3nd6ejFl/fhjtZ
         oCTK1zMZxs9Gl4bTmSQrPcaUT+6t+2DpzuwXmLLMsf+JqZ77N6XBJn0P/4h9xsPcDqwF
         209Q==
X-Gm-Message-State: AFuF++n0QgMGuvEZqxk0877QfoWE7NfI8cTVKxd+KX8Ma2SI8LpUePJG
	yd6qzP5r9UYFGjDxWb1QPVS0GF0hUuKWNtzQ9OevBe2ll7bi8sW9yXNapK5TsA==
X-Gm-Gg: AR+sD13dOSOiu+0+iwbvH5VTaIZxa+WGul2lkfcGdBtQ1RKbucQRHUnOLoY25CBxB37
	RS0B64sTEkb7yRSOD6W35/rbb+Nhi7JNyH7E+usWJRY0cEj3RrWnsGy3gcGZuVMN52FRNKDLpDm
	jyOtY2VotxmF3J+xTYkCVBjwckeBwDHih9pV+vHQ40u1KjmPMScOm4o9wYxrnqn3OnyiUw1rrlk
	btUAAlsmnlkyMFI5Ne3kiOjOP1lqnj4BbAKlb58sEfdbfvEzA5AuRoIxQlW7eRKYfSjgBa/8uSr
	G1zRX0g7ZkSfdEcp210bgZBrW3njxvo5jylYNfgSyfoRDUgouGx7WMJNN125kQ8nU3k5JFJAqaU
	GDKvWx2zsrhXWfKXvkQvqMrAjbLGCrCrR7yAMWHMsatU2yvLy0V54qNHKDV7ZwFyBvHFFtN9c2v
	bjzC6ahG2MejCZDqQZanrI3N6LA1ipWwww1LlLimkys+RbjZ45TdW46Aww5V1LRMuOfUhLcB2/I
	A==
X-Received: by 2002:a17:90b:1dc4:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-395c31f194emr35702570a91.0.1787485980576;
        Sun, 23 Aug 2026 04:53:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 20/20] swagger-ui: upgrade 5.32.13 -> 5.32.14
Date: Sun, 23 Aug 2026 23:51:58 +1200
Message-ID: <20260823115158.1582363-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129454

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.14

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.13.bb => swagger-ui_5.32.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.13.bb => swagger-ui_5.32.14.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
index 8916b7788e..5bb5a66021 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "2a33d7805eb5fff693952cebb9203ee113ab4663"
+SRCREV = "6e8ce248db64190e4113676aba996943c56f2491"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

