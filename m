Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20234C5DF6E
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:10 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27812.1786651807535084615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=guqz9rU5;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbf0dc8c871so3959a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651807; x=1787256607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBLiqz9MQTGELuCe3fi2UnTLAYML+QTxZl1S0j7Mu+Y=;
        b=guqz9rU5hxEhZp/CjpnB7+HjQWszPd9+3nshuww3GIfdHMSlp3/AVHVXXkAHHlS8m/
         d76D7so8rSOYq8UAQ7RHf/S4B7Z3D8tkJxDiSf2Xl6qaGR46g8uVo0ero3bF/syNr4bW
         B7epWG4Y0Ig4JSiTOWr7NBe3Co7u6cbdxQjNvCBbbQxPMbTEJZzrYRdtgfXTwX9MyRN6
         dSLteM5i/JuDfnOb+vjcnhoUF8j0dyuhGrmXHekmUJ9RvTAqRezkF+aNHEVmGQnffOFa
         7YFpVNysDlUnAdqVCsghIyT5wIACsBI0KosZ0ne71/XrCKLf98MgyA0iTYCQhkTCB/co
         9FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651807; x=1787256607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBLiqz9MQTGELuCe3fi2UnTLAYML+QTxZl1S0j7Mu+Y=;
        b=YA+0ktWQuaOmiT5u6yG5z8scBiMpYKmMb+c6uSgdF2CtbasiHFN1EWnMRkk/tI4kGh
         uYWA0I4TW32Rl8R8m8zSXA1OpbptOAknYWKUFpv66s6bsaCWD9o7eWpT2Xyz1SVLr18c
         ZuRRqEANu3K7+3gorbpjj8EbgvoGstdCSBkO8UsQnCDZJhmc3xDykXhMOTIb9JfhypYO
         UTrBnaDB9QS4DpQDQekkBfUsnIHrbwQ57tXwOS3NEnn5w+nHvRZqvOaBK/t2fPHnHEyv
         r7hgAY33/fkNxbb7/20nxowwJCjNwKGy5AJ0ufHg+cMwtEaQ7JNGi1CESeWyudPLtHgZ
         jgUQ==
X-Gm-Message-State: AOJu0YyfN//Xop+kIzorFYv0X+MKKxwlqFjCUSlsvcUFe6rGUx9+kk65
	wRCyF89UoCoKlKNBTi9JWuy9FB3tyhiK4BNn9EDXvxGQxGP85V4ZEgEulvFXYSc5
X-Gm-Gg: AR+sD12g2JIZgamBFQ373LcoH40CzGVtibdT5Qlw97aP54zwLVIKBLmJVdljNRwK/6t
	iSyxHhsl38uC7Msr5q3otoDJbaTVzO9BBRDaKHWTgqD5hrncQGDrQj11gBxI+r8sd/xBfuWJ5nr
	nccxCMjsKfAHBjC42KpD7loLusp1ZmiO9GpxvfhrslPBjU0zgK0Fs8/KnnJebdmlNGhlXNNKUPY
	a/u46fg3X7v+aMyrdSILqkW30tHmnKxn1044vcbj0t6o9GWkc+9GqtlcMNCjpeqJvKUdUmZy71p
	JmPQ9znw3CONaHDoFQSZDHJRl9EelUHbDgdjz8z6uqB6Fq7yPNizvWL8mOOrjT0a9Sd345cFbpx
	7cq9hNncxoIxpQtHdpTR6gN6GjL6bcE/SfUXxT1b0DxY5/+9Giy1UnBeO82abywBrKMIP5MX2Bh
	j+yEjUHZEVe/cG4JyQzoqf4EVaiEf18eQ9nhA0um9ZdzwUzakTxoOiojybVueeUcWYb9RYAQr9B
	LoiKQktsZRpHebCZaWXjm0vqzx/c5O0R73pC2rNYvDbgvKs6w7ljiT4ZrpTFGhL0CdyntEnnZlN
	DtNsNm4hKtyyzbwIogKVhsJdLzdri3jv5aOecsAQ0mv59C3cZzIsCe7guhrthLRGGk/2hM8V/aw
	oWybZn+OIyMJsb2ZzWJwSUgZy0IM6Cc8/8hPh2LiA/lnCEoSoq1IfpGhz
X-Received: by 2002:a05:6a21:4508:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3cc71a59053mr458413637.14.1786651806931;
        Thu, 13 Aug 2026 13:10:06 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 49/80] python3-pyais: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:03 -0700
Message-ID: <20260813200834.1302829-49-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128993

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb
index 38083c0189..a5c5dc1fd5 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb
@@ -9,6 +9,8 @@ SRCREV = "293bc44c1e8740dd60f489205cc9edd72fd672f9"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 PYPI_PACKAGE = "pyais"
 
 do_install_ptest:append() {

