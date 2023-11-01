Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43211C4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:32:57 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.8740.1698849170782459929
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xaaps5EH;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9c41e95efcbso965676166b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698849169; x=1699453969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEWHEGTaYrquUGgp5S3ydX0eHsUqVHqk/ELfoI0dLng=;
        b=Xaaps5EHIpkHs2D4u6525jKLoC2yvPoiFD/2YITZkuEk8j5dgkLOYsL6T0qm5Pc8l8
         3THNoExprQEve/k03UhTy6/0Ho8iSOm4Wkjj6aS7wHGIKCd1SjG9DCNTpSwcpM1oYyrV
         gx2KKVtx5GMWI71+QRtmQWFegUNoMLQe+jyJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698849169; x=1699453969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEWHEGTaYrquUGgp5S3ydX0eHsUqVHqk/ELfoI0dLng=;
        b=uxCMkCk7hA0mYKaSG0p6sGagQEz9TtDSC1EKYUiqU9WdS8LberJ1ee2iLzoD0bt71y
         PMUK4HM5GNyVFb7b6g7IsXLBYTVvHPqXzep7iLBesLrD9tb3ar6vzQTpSX6F+k3yRoO1
         vJrRFOMVLnTIx7Is2oysNN2W85kc9LRvlQ1UVN86Pe88G/iLqgvaZV+kdbLXsOuqR24b
         Gkr5a19DOCMjje1Ec+ohl5vn+n3qCRJbITmsh2tzRx+TQVMFB4k9xsCkU01sYC6SdNHZ
         gkA7EMumU73O2RHNI47QK28eb3sBvA6KOCj4IwGz2yBfxO4Jnz9/Q0QFIN317rKgY9z2
         ws/A==
X-Gm-Message-State: AOJu0YxvGgCFLVoCLmoiHajzXv7W4A+fsiuM9kuriAiWSNc8YSG7fERA
	lfaNjLKiq755VPZ12Fn1j6LJkC7mBlewQ8c+Ze8=
X-Google-Smtp-Source: AGHT+IF2Mxu6bqCTzErmFKja6VHM0SeHVba0As7AdTxCCdA7NR60ihgvgU4aRqaV+EvJlL17URkhhQ==
X-Received: by 2002:a17:906:fe4b:b0:9b2:8c37:eb2b with SMTP id wz11-20020a170906fe4b00b009b28c37eb2bmr1913305ejb.58.1698849169043;
        Wed, 01 Nov 2023 07:32:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id lx27-20020a170906af1b00b009ad7fc17b2asm2449392ejb.224.2023.11.01.07.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:32:48 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-jsbeautifier: add recipe
Date: Wed,  1 Nov 2023 16:32:39 +0200
Message-Id: <20231101143240.3171827-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231101143240.3171827-1-leon.anavi@konsulko.com>
References: <20231101143240.3171827-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 14:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105821

Add a new recipe for jsbeautifier version 1.14.9, JavaScript
unobfuscator and beautifier.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-jsbeautifier_1.14.9.bb     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.9.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.9.bb
new file mode 100644
index 000000000..ac3c4319c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.9.bb
@@ -0,0 +1,19 @@
+SUMMARY = "JavaScript unobfuscator and beautifier."
+HOMEPAGE = "https://beautifier.io/"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "c738ebc36b47bd94e4ca6dd17a9004c3cc74edad582ca1d60e0e5d5945a63cb9"
+
+PYPI_PACKAGE="jsbeautifier"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


