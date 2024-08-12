Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699ECC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 14:50:25 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.48250.1723474220500955137
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 07:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OTmwcJFw;
 spf=pass (domain: konsulko.com, ip: 209.85.208.172, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f15790b472so55612081fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723474217; x=1724079017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpBEOP4n+49Ygt2Wo1mcYrsV7AeY6O7oweeBFRY6AKw=;
        b=OTmwcJFwxQEYYm+alrqO546fYNw7YWeY3vAcfmAjmGC9SyHUFz0KfQaQaCFVmQQ9t8
         Yl1K3wWpnJ9gU2Cr6Bm+HXsiss+6JnYq7MBDCc7sy4NKHEYgx+FpkTc8AYAx1pFAGs68
         TPSbPLaTxYzkzvM4//0+8vMJbyoVEFKWD9+Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723474217; x=1724079017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpBEOP4n+49Ygt2Wo1mcYrsV7AeY6O7oweeBFRY6AKw=;
        b=kOL3KrFI6O3yrJYRnZEvtQ5AdvfoZDrbN+Q64Pf/yYc8sTiraH51hghO6f06iU06Hs
         su4ajPjJGCUj9/gDN0l5/a9c8qCG7jBbRB8s0WQrXy7bhh74/pD9TeolR9XTW87+/l+P
         KFmKr86Rsf7AKewqBAdB0VqMl3Fwf90hIwIC1Syuw3nQGb4+jkjGoi+84roFidOLg3GE
         lhzS8znNGIOVkWWLoRT8h3svXRxROklqUe+7cyFmAJZRSlicNHB1Li8v8PSvmkFaBkHP
         YAqJy/eCeI0hXZ+tXUBFH9s5a1RQqPJS4VbYvrGuee6VqqmzvQu/svrDAlBV786Iq02e
         1nbg==
X-Gm-Message-State: AOJu0Yw+wjNIcutEvyLtsw8T1mDRFtdW2WEKEWZLeIk4okudmirI+/+v
	a0ENI0sjVgltYqN10vzpqjMWmg2V7eHFggCZL7JexDkFgCIAVTBZrfxG69+V0uxPqK1E0V1B5Pk
	K
X-Google-Smtp-Source: AGHT+IF2e3hYISn8Sb5i34gKZ1ji2QCzeLc74y4pQ+4W8R8jTf4sv20rjToZiqbahN/ka5lPVbgFwg==
X-Received: by 2002:a05:6512:15a5:b0:52c:e402:4dc1 with SMTP id 2adb3069b0e04-532136a2f23mr289994e87.55.1723474212388;
        Mon, 12 Aug 2024 07:50:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd187f29d0sm2176676a12.2.2024.08.12.07.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 07:50:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-apispec: Upgrade 6.4.0 -> 6.6.1
Date: Mon, 12 Aug 2024 17:50:08 +0300
Message-Id: <20240812145008.3210575-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240812145008.3210575-1-leon.anavi@konsulko.com>
References: <20240812145008.3210575-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 14:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111772

Upgrade to release 6.6.1:

- Add IP fields to DEFAULT_FIELD_MAPPING (:pr:`892) to document
  format
- MarshmallowPlugin: Fix handling of Nested fields with
  allow_none=True

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-apispec-6.6.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
flit_core.buildapi, use the correct class [pep517-backend]

License-Update: Remove years from LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-apispec_6.4.0.bb => python3-apispec_6.6.1.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.4.0.bb => python3-apispec_6.6.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.4.0.bb b/meta-python/recipes-devtools/python/python3-apispec_6.6.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-apispec_6.4.0.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.6.1.bb
index a48e1cfae..90d7ee271 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.6.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "A pluggable API specification generator. Currently supports the OpenAPI Specification (f.k.a. the Swagger specification)."
 HOMEPAGE = "https://github.com/marshmallow-code/apispec"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3d9c303644a2e62578f0347748a80358"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "42b8a6833cf154c9dbd22d006b56bf9c49c972d32d24fe716fd734e0f6b739b8"
+SRC_URI[sha256sum] = "f5caa47cee75fe03b9c50b5594048b4c052eeca2c212e0dac12dbb6175d9a659"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.39.2


