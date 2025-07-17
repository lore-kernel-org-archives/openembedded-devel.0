Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C65AC83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 13:56:35 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.49419.1752760590270179827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 06:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RcCqnLRi;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a582e09144so580768f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752760588; x=1753365388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnAuRSknHY4HwX48hkCZoX3X0ZLp9LRBcmJ8NpjeNu8=;
        b=RcCqnLRiAsivyUqnpWQMcCiwwmZLYP22Y8JKR7jV5kTOVzuqRDSPkSgOobOlBnGOml
         G4rtK28RJnygNmF7v2Ru7QkcFWN1+YfGgskb9IxDGKlMiz2czsbgHa9HBs9g+0FELJ6P
         UnNjdUyDDKSr0T+m4QfIP6we2ZeVL+zUVKb/5v9vI5MUADooWBbtL/KRnF0vMDOF2vQ7
         WnzBxZr1JUXYD+7cmt27oLC1cx9onhAH62frGng3QXWnaRBCmnhI0bKwoAfnXUU71HuN
         tuBcr9AjPDX2eEmJagRj6J+piHlKi6E3okwsduCWYzH3fvxf+X2C24Z64pCptKf00+JY
         GkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752760588; x=1753365388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnAuRSknHY4HwX48hkCZoX3X0ZLp9LRBcmJ8NpjeNu8=;
        b=P2P5ai0By0OK1WfYf1gF3skZSFo/fQnDPGvfUMCi0TfC95NcpEkvdOJ33pkySsfabj
         VCQpBVf5i9KN0Cg7YjMhEZ5fyji8042lig1KaZyPz2vmueMA7ya2KzJykl25I0NDXLyK
         HJvi0HZXPNn0duVEG3VulRa9XdYCNIFXCw6GLxoJhdiV5P++tEOhKaIc3qXArpBM1j+l
         MWj0Nnbk2079U+42yW0h/DqrBSXXDlr9UkD3RqE8p+bg1zHi6Ks9gnfI2Tdsw0AQCeQQ
         QW82ELVI7ts9IeDxzqDKCRwcaEDXfJDPsUCuwVzlfv2pt6yPx2kird7wVTJmCLyDqEY1
         5Sng==
X-Gm-Message-State: AOJu0YyVOosMPTKzSeBASFoJm7fBpgRegqX7zsWeVjGu3KYa6/o0/Oh/
	8P9iWzDZKTdi1eLlQG7I7qSv0bN9cCXb2w45koG1dRFLNurUOgFOrGfW2mBFY6iY
X-Gm-Gg: ASbGncupRRJ9lP4i+J9GiW24QaAigyn0ZeOT5FVt4gKA+mCU8kDUirZcBTs7KkT7Jfp
	cEzDoKlRjUO6TP2/gX4zjnvFY0d5ybltSIOBShYzc23JlIIRB3lluJVOb6jBagau3NGBHEkn1LG
	cMNNJO5voV4DseZH4zV9aF06YwZ9ChVLeXSm41Pf19XnEEcpN2GV38rBevS2uvRuxYrvEBxt2eX
	XJVPBq0SNQlZ9+YLmBxUF4U7LwqJ9rNlfVMWnssgly8EU3CAI9c+b9dqYVMA5CJdRjURfQJG95p
	cYX3Nrh5l+aSKTSytXWXmMX0aL2htEplG0sXxl8ZL0Jyy/ovdttPRgWi7GJeF/csJxWLwUAZA2F
	9C5ZoH6NaLERZG4XrEtv/KJIDxKkDuxoTTxhFVFNQ15LyxQ8=
X-Google-Smtp-Source: AGHT+IHFZHqakb9DTowBK/8GaUyi2OcbIr5+j/wmCCNYxhQZht8I8gsrANj88wXPyyRu2SZK9e27fg==
X-Received: by 2002:a05:6000:41f4:b0:3a4:f35b:d016 with SMTP id ffacd0b85a97d-3b60e4d1bb5mr5530961f8f.11.1752760588275;
        Thu, 17 Jul 2025 06:56:28 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e57200csm52764725e9.0.2025.07.17.06.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:56:27 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][scarthgap][PATCH 2/2] mbedtls: upgrade 3.6.3.1 -> 3.6.4
Date: Thu, 17 Jul 2025 13:56:18 +0000
Message-ID: <20250717135618.3956-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717135618.3956-1-gudni.m.g@gmail.com>
References: <20250717135618.3956-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 13:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118611

Fixes several security vulnerabilities:
CVE-2025-49601, CVE-2025-49600, CVE-2025-52496,
CVE-2025-47917, CVE-2025-48965, CVE-2025-52497,
and CVE-2025-49087

The framework directory has been changed into a git submodule.[1][2]
The recipe now uses Git Submodule Fetcher (gitsm)

Changelog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4

[1] https://github.com/Mbed-TLS/mbedtls/commit/8cf5666a174237998a7965e284d7ba8c1655d16d
[2] https://github.com/Mbed-TLS/mbedtls/commit/c90c6d8ff787ab8787d9373b0e662a95ed1f4dae

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.3.1.bb => mbedtls_3.6.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.1.bb => mbedtls_3.6.4.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 679a05e5c2..88b50a406b 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -23,11 +23,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=main;tag=v${PV} \
+SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
            file://run-ptest \
            "
 
-SRCREV = "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
+SRCREV = "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


