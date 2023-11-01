Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39417C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:32:47 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.8738.1698849166673564172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UIdy/f/C;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9d242846194so571044766b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698849165; x=1699453965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RP8qiX0AQizpmH2grwkO1dJKYUrPf53AdQCKlq5DpqU=;
        b=UIdy/f/Ce5NQfOftU+zmH/Cmehem/oUwJYavH0pxI1fi6AIHV9HTEGaA/ysYgjxnYB
         gtpmBLDY66kWBibcxlNA9nTEtRGemP+WzFAVqLj4xTgCuLqye9YHTbsnpHXzfgtS9+fp
         x9m38rf6eOrBxcch0dR2o2sTwQ6iqBKWlF92w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698849165; x=1699453965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RP8qiX0AQizpmH2grwkO1dJKYUrPf53AdQCKlq5DpqU=;
        b=RQPkqrJbUbUanhOI+AgwhGxCxBl0zK3rvY1mgEyFdLRlTclCiNcpMnW+xvRSvCEaVA
         alC3dml0Ev7k4erNHLCNKdPnzBJWRDSjiaaXZrCFDmc12W+xU9RcpvJh45+QThnwEKyT
         z4vLP5OW5AXPj9Oad4OV4kMWiEZkDo9BpTVIDlbRybjPEX5SIUn1na5FjsU4y+qoQ+wY
         JqysLDxpWlCPXHKMt1/HB+6EbzMRAR0nB1bVxAhbQCB2bUOEyQ2g6sltlkv62dqLNKz2
         X3VKxy7i5cKuhoWbw4MMBNhWEb6HbfCXBJyle7Rx2CdeQDGDD+usWDjDRrHE7diuwiQZ
         7OHw==
X-Gm-Message-State: AOJu0Yy0ADgpPN32sF28nkfRTh32XALUyoekHmx6Bx6gsvc1vpMwGPUb
	Q3K0pCVWkUqvGZH6JrBFzfzB/lVgh8Vc4k9tZZo=
X-Google-Smtp-Source: AGHT+IEe+ZkwTkj9YeLxmMU4eBpQaAJX5Txxa60ahL3aRSmSZUlXbG2GXZVwOGqq/Hnt63MfMtE6zw==
X-Received: by 2002:a17:907:c15:b0:9be:7de2:927f with SMTP id ga21-20020a1709070c1500b009be7de2927fmr2554029ejc.66.1698849164828;
        Wed, 01 Nov 2023 07:32:44 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id lx27-20020a170906af1b00b009ad7fc17b2asm2449392ejb.224.2023.11.01.07.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:32:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-colorclass: add recipe
Date: Wed,  1 Nov 2023 16:32:37 +0200
Message-Id: <20231101143240.3171827-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 14:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105819

Add colorclass version 2.2.2, a colorful worry-free console
applications for Linux, Mac OS X, and Windows.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-colorclass_2.2.2.bb          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
new file mode 100644
index 000000000..00c2c4e92
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Colorful worry-free console applications for Linux, Mac OS X, and Windows."
+HOMEPAGE = "https://github.com/matthewdeanmartin/colorclass"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1b2a533055839e54558a727657c1c73e"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "6d4fe287766166a98ca7bc6f6312daf04a0481b1eda43e7173484051c0ab4366"
+
+PYPI_PACKAGE="colorclass"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-ctypes \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


