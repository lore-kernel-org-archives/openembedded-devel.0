Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5131.1793782725855966596
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 00:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wIhPxSPf;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so225004a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 00:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782725; x=1794387525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJE9+Tm2KQ3aXQWBYP6o9BO+bZM4qzqKnZR5fljxIuU=;
        b=wIhPxSPfOdosrjwPBvf9zmQzwL1bkDeIyq+uhEfOyRHSZoD+6VmqMgekcFscJ9/SQx
         nlp5JCp+dU3VxRp5CXPEbNHBlGQucMjYC276J4Eqg6g02EaA/xU1K262QJurDs+bbkrz
         r+rafIT3wo/hs+qSKfbd4dSMO/js8opEJ0uhOJG/f6/hi9uF6bk9ZAOk+0oFWepX8DjO
         9eXMO9iPCI0x9THKLefBXJZtMvRSvDjceQgd2fXcpjJGIbkCKlb/oP3WfMezRuhaG3sZ
         ZUVxkylZufy9qI/c1ooNm+XxXO3M2C/QrHljn75p/ydfXPsVnLUZLUJAwY6RkJ6oMF8p
         YJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782725; x=1794387525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJE9+Tm2KQ3aXQWBYP6o9BO+bZM4qzqKnZR5fljxIuU=;
        b=tsVZQIyOancOYGISvDSg3uExvhcADsWd6bV2sAI81evRywOKyZVomiExrSf3qVOS0i
         1VN63UwS0aKLReGULYhLn3M+nHepVg3/wwb5i+wFpi1/pvoHSFe4ELzcrMRmpuNiV2uE
         fBRBmZ3KNDd8XjBL6xVJE8zxBYXy6BuTKidzbElNSttRE+MmHZglABk1rRsZYYHsX0g0
         Vl5TqweOt/rLWhO2ces7DRGruJc0mqz6pGnDDkWKWxoVmiagGErjh/4cVnaKXH+4vKoD
         Pr7bzzK1GUBGU8NnplCys1vepF0JhHCMLUGq/FSFOikqWWMl6+e6qFRy7IkXaESR6izA
         tHHw==
X-Gm-Message-State: APuU4Z+wMNjsJR0708JWA6woKjZRyl5ORbEjdi+U/X9ePhysTBI28CTq
	49uPmKmIK99ArD7+Ds2pxitZpNAArSWmyB9ew9WhX6I8UaFdHuo0vPszIKu0pA==
X-Gm-Gg: AYBFou3tdQCQVwa8B1ghr8kaP7AQvMVO4GJwDAs5/xra3FtwBijvQr6aSfn1KCNfm4I
	RHyniQ2Vmnvhf52DvmPpDYBJMQJ/2G2CE4z4ntLiOwJ5wmU3EPcqFhmwalbGwMBS9a51nvO2Pd9
	dJQSlPi+L0DWboh1ECM3dw53bP+0723VCbQ8yH8KQmjNeVmXEKCUWFNLO0L0I0iJ41CARtb0e0M
	/0oxXZ7hHeiDPiN+Mm4yR+NN002HVe0XEYnP50PJPsove/snt32JiCFs2w7IaU7QALxFa4emQDy
	QquQl9arUby2ZSEKIIcO730Sn5CH7tSOlDlEHZ1KV12t+Yof1Gkn4uD6nzac8pJKcZ07TbNKb1F
	/SQofgAj4dow38XuoM6AorWGfnS8nbEIQd+5mz++uAYJhgWBItp9NAqVNDR7evBwtaXXSBqLIVI
	wT80SqfLdME9ySBNuiqjNnldVYRNsYrdGB8Tzh6dgt1EOsC2YhcX7Zadrbk2hIJLT4WOO47MiRY
	G9Uxg2RxdT3O8p4FeeceUfRhFJlw3rDLAsz+AvsXjPNkhbCaMM2yJ4YCa1xiZUKBK6FO5j20gOw
	/2Ahfn72LpBSdxMElLKyN0zrNi83wBdVIECoKAI+Xpoc+Yd+CO6fgmh/T9wfvA==
X-Received: by 2002:a17:90b:4c52:b0:3b0:a4d1:6d7a with SMTP id 98e67ed59e1d1-3b0a4d1700dmr88420a91.31.1793782725207;
        Wed, 04 Nov 2026 00:58:45 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3139981a91.1.2026.11.04.00.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:58:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 2/4] flatcc: patch CVE-2026-116733
Date: Wed,  4 Nov 2026 21:58:32 +1300
Message-ID: <20261104085834.1877643-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104085834.1877643-1-ankur.tyagi85@gmail.com>
References: <20261104085834.1877643-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 08:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131836
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116733

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatcc/flatcc/CVE-2026-116733.patch       | 30 +++++++++++++++++++
 .../recipes-devtools/flatcc/flatcc_0.6.4.bb   |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch
new file mode 100644
index 0000000000..86272984f7
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch
@@ -0,0 +1,30 @@
+From 8fcc19366aa081068d2c845084a3ffd907c88129 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mikkel=20Fahn=C3=B8e=20J=C3=B8rgensen?= <mikkel@dvide.com>
+Date: Thu, 22 Oct 2026 18:59:04 +0200
+Subject: [PATCH] Guard against adversarial buffer overrun in JSON parser
+
+(cherry picked from commit 356792dc155a9e685acdfe0ec1e209bdadcb4ab9)
+
+CVE: CVE-2026-116733
+Upstream-Status: Backport [https://github.com/dvidelabs/flatcc/commit/356792dc155a9e685acdfe0ec1e209bdadcb4ab9]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/runtime/json_parser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/runtime/json_parser.c b/src/runtime/json_parser.c
+index 4472af2..f9bc9fa 100644
+--- a/src/runtime/json_parser.c
++++ b/src/runtime/json_parser.c
+@@ -538,7 +538,7 @@ static const char *__flatcc_json_parser_number(flatcc_json_parser_t *ctx, const
+     if (buf != end) {
+         if (*buf == '.') {
+             ++buf;
+-            if (*buf < '0' || *buf > '9') {
++            if (buf == end || *buf < '0' || *buf > '9') {
+                 return flatcc_json_parser_set_error(ctx, buf, end, flatcc_json_parser_error_invalid_numeric);
+             }
+             ++buf;
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
index 059f888eed..9defbfac04 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
@@ -6,7 +6,9 @@ SECTION = "devel/lib"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3d8fb7158bf7e2600ba3191428dc4ef"
 
-SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV} \
+           file://CVE-2026-116733.patch \
+"
 SRCREV = "fec0275c0d0c5b6f495ab48d51fcde521d72b5fc"
 
 inherit cmake
