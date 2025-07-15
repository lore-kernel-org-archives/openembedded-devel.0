Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F190C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 11:07:47 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.5569.1752577664137408506
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 04:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Nm9QVRhj;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so1036858666b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752577662; x=1753182462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HA44CzVQClX69ZvvM/GZXzIbEf2sgN7EFBKrFeORHY=;
        b=Nm9QVRhj2MIsalxZAddjb0W1ALKkbWuIrJnUwvgBn9hYvtKi4+4Z5gInsWxQbXsWKq
         CthFh74VGy7ZKVPWrFfPBfTCRLb3J18+j8oh62QNd5L02yJuI3XL+pJKDpdpEhT5Aq0Y
         xH/ay6Qt1MBoL4ilSRwvv++KXBm0idlCFmFxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577662; x=1753182462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HA44CzVQClX69ZvvM/GZXzIbEf2sgN7EFBKrFeORHY=;
        b=DgnNWqF4WmsukgwVLbNBYDkrvyxlq44ZeSYKqEi68Lqo9/KTRub1C21YOuGdaC46zS
         rtOvwHU0nNlNzwzCqOxdi5a5xhclMJf+qviYcFIbajIaWFyleFyZTADNYxN8EvwJJTuT
         78Ri7epCvG3/hdPd1YQSXD8CTsBSy9WI9z/mlwlspkAIrghtEsKK7gpwl6GXnbTVZx/C
         /X2eYhW7RAy5hSlMzgA+PgBYVXdiuMHOara2RzqEKy17FSlfOktNyJFROL2hX+vTMaPY
         z1OzacxBQa9aRvfGTAa7872MoFdhLcxuiB1lCPBLnDnSi+xNiHmn9LV78ziODXDp+213
         Qh6A==
X-Gm-Message-State: AOJu0Yzc5Oja5PWykQRgA7GPx+9BAe8wlqfq9iJmBIiKfXQchVI805SX
	NnNxFTPiA3dhYYRQWAjjwns/pktAXl6gdBQyocLqWHfd5+MgEkPZcCJ6bi6SFKQUtXUpTI3sMEm
	369Ut
X-Gm-Gg: ASbGncv69ht2op4Sl34tXouPWt6DruDvLLNz0PUJ6nplLPE2MYHJyOubWEoJTfHjWiH
	8spzjoQme+UMfgwKHEx34yO7xBYD1Mx4ZbPb2OLCVPMNoDiZomZHWM2TiUnLI3JNwNo3e4/0pwe
	OqNzEPHL23++WAOws2rTuJJ0vwIg6Sqwbvsh3W8M7/ZhAnS0xVUdf9hTyRe6MgnEG0ylqWF1Ih3
	n4QVCnmKXKN4Un/pBsK94AUimkyZpcviyVguSapiFxNtOd8w1p3bPnfctRKrs53rmJeEV8QEDU7
	jjKQSqCz+7rsRb9rGPYN08R/XAHut4Yi8fbFm1u6/oHPklWPyuJDbIntyGg9geuWwNdsBPsdJAP
	r+L1ycnyz5nW+IEbGnhYSgTRLP0d7UtjGc4XX
X-Google-Smtp-Source: AGHT+IEu8M1olOE6KNsAi7SFVSzQPhV7JFM5QaY8eCZ4MlmYDB5lgGAbOA5sIYIa/M8MjOPKPNZcmg==
X-Received: by 2002:a17:906:7311:b0:ad8:9844:1424 with SMTP id a640c23a62f3a-ae6fc23d9d5mr1506951066b.61.1752577662035;
        Tue, 15 Jul 2025 04:07:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee46cdsm1000843066b.60.2025.07.15.04.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:07:41 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-eth-account: Upgrade 0.12.1 -> 0.13.7
Date: Tue, 15 Jul 2025 14:07:37 +0300
Message-Id: <20250715110738.1033272-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715110738.1033272-1-leon.anavi@konsulko.com>
References: <20250715110738.1033272-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 11:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118560

Upgrade to release 0.13.7:

- Fix issues with the json schema generation for Pydantic models
  (SignedSetCodeAuthorization) and simplify the serialization by
  moving a misplaced @field_validator decorator above @classmethod
  (not below it).
- Update and clarify documentation for authorization signing.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...eth-account_0.12.1.bb => python3-eth-account_0.13.7.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-account_0.12.1.bb => python3-eth-account_0.13.7.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
index 867aaaf025..a3ae8a7802 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
@@ -2,9 +2,11 @@ SUMMARY = "Assign Ethereum transactions and messages with local private keys."
 HOMEPAGE = "https://github.com/ethereum/eth-account"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a26e64020156e806cf0054a6d504b301"
 
-SRC_URI[sha256sum] = "0374c5886f35780e1f23e50ce6b0482f3387646eceda544e97d69f17f6c216ee"
+SRC_URI[sha256sum] = "5853ecbcbb22e65411176f121f5f24b8afeeaf13492359d254b16d8b18c77a46"
+
+PYPI_PACKAGE = "eth_account"
 
 inherit pypi setuptools3
 
@@ -17,4 +19,5 @@ RDEPENDS:${PN} += " \
     python3-eth-utils \
     python3-hexbytes \
     python3-rlp \
+    python3-ckzg \
 "
-- 
2.39.5


