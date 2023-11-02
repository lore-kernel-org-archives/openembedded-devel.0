Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B51DC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 14:05:38 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.32023.1698933928272377095
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 07:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fCHo39Je;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so1611513a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 07:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698933926; x=1699538726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pkiJPKCKWkcZD3o7uyuUfixRFooYOe7rOldgRdi1EHU=;
        b=fCHo39Jet7il/QTMC2nZ6k1jIQ5BBZ5m3Nz/JjYvDrxo/urUt8xgxJDCT2FjxWVK51
         DxVVEoBqpFnB+wjFeY4yTSYRDjkY6tVQakC4lsMkM/nrOfdXYJ+xaWIgGH/u9NCknrcD
         r7T1ROdVMmQOuBTHRrytwCoxVCw5gLN/aYWpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933926; x=1699538726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkiJPKCKWkcZD3o7uyuUfixRFooYOe7rOldgRdi1EHU=;
        b=qoZis9aq3Xxd4K72Lr5WdWvPdVwVZ8lC0tjtzHnkUr3hQ3EPGunl0xhwr3oNdMIEnr
         PIAfqdildXBSRKTKcDcJh2fcoi/TtEHmws3wKR/BDC61eWiRwZUS88KE7z9nygb4+FeQ
         rcsO0OJmFwqDlhju46k9aMjz5Ym9YyNsJZwtrIMgumWUT74BVDVm8zxnwJcv+dmGWufI
         9BEc9C6WMb2OsTTigPAYQafp61mFgGBvp6g3G7Pi/T+KiaF2S9I4dyY2/QB1cQXbU5iC
         SCVHJAWGOoTM5tVC/n7PxWmXcilDFPnbl5g7bH1Xpp3qlZePNffQeySvGKVmMkKfLmUE
         tLVg==
X-Gm-Message-State: AOJu0YygIv40DnNfPWCTJX6WHu+e53sIWBGeNx/0FUvc9y16VRnN0rtL
	3w2QI8uJNeddP8bSQT3MAQJyEoh+/9NMLpV1EGA=
X-Google-Smtp-Source: AGHT+IHe4CAWdwAU/rJ2W+Ww+EcMTGL8+Tzezlf4HF4rufGti7D4ouyD+ZMaEzc/mi0AzcSDHItVAg==
X-Received: by 2002:a05:6402:22a9:b0:53f:25c4:357b with SMTP id cx9-20020a05640222a900b0053f25c4357bmr15109990edb.4.1698933926300;
        Thu, 02 Nov 2023 07:05:26 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d5-20020a50f685000000b005401a4184ddsm2401763edn.27.2023.11.02.07.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 07:05:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-multivolumefile: add recipe
Date: Thu,  2 Nov 2023 16:05:20 +0200
Message-Id: <20231102140523.3337713-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 14:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105838

Add multivolumefile, a multi volume file wrapper library.
Version 0.2.3 changelog:

- implement readall()
- lint with black

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-multivolumefile_0.2.3.bb   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-multivolumefile_0.2.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-multivolumefile_0.2.3.bb b/meta-python/recipes-devtools/python/python3-multivolumefile_0.2.3.bb
new file mode 100644
index 000000000..c82113101
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-multivolumefile_0.2.3.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Multi volume file wrapper library"
+HOMEPAGE = "https://codeberg.org/miurahr/multivolume"
+LICENSE = "LGPL-2.1-or-later"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[sha256sum] = "a0648d0aafbc96e59198d5c17e9acad7eb531abea51035d08ce8060dcad709d6"
+
+inherit python_setuptools_build_meta pypi
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native \
+    ${PYTHON_PN}-toml-native \
+    ${PYTHON_PN}-wheel-native \
+"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-mmap \
+"
-- 
2.39.2


