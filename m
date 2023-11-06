Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5282C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 13:46:30 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.54092.1699278389952555376
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 05:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d1CSbK+/;
 spf=pass (domain: konsulko.com, ip: 209.85.208.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso7652524a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 05:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699278388; x=1699883188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0J4QK2BOWRJhTzPRqrkhAMjvXzS2eKDifehSV6Xx7kM=;
        b=d1CSbK+/Lo7ihWr9DiZQIF0rxD6B2QeAhb6Zy3k2nFiXsEKkCxWu6ZrOV4xL1CkuDr
         mtQu1jKzasGRyxhT28gZAG7e4eWjo6hSARFdtmYBBH/Qqyh5RGULDa+Ja5GUn2cpWr6m
         H4Yz5gxAdG7iO34FIW9TwI4G+Txk7UZbQPqCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699278388; x=1699883188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0J4QK2BOWRJhTzPRqrkhAMjvXzS2eKDifehSV6Xx7kM=;
        b=dc8xTs7C0YMfWeyXtZyr7hf99MOwkbpCvHh1UHHoCy7qocPDG75NHVai4QRZt9kEET
         tgUImqG957P435dPjXI7jFTkoiZgA9xbjiwV4EcUIN+4Q9qIcEuO9EXypUL27d3xnMTp
         OPQveCCNCBk8QdrWCDSgs6aIx5+VcByD53qOMBlQyh6dz87ZoMd9J9TuuB1zI9c/q4Y7
         7Xhm4Wq8M/gLGTdq5UhtE/DuzTTLck4oSXvpPEDSE6heTLwJop7WoYx+DAJTmk2MxxkE
         Cc4Lc238IDpCOTYKWPYcmcZv8AhpM+N0+8Q374D9OyLaa5r/UPZcBsYyYzs1yO0EhlV7
         bvgQ==
X-Gm-Message-State: AOJu0YzCG9rsWsXOMaYE7d8nkuIiX3B/CADXekjgA3+Mj4rZo4fuleTq
	yF8kI25q0MxPwHNi5RGXFzi91aRGYDGBOBafDXQ=
X-Google-Smtp-Source: AGHT+IG1EUp3j93UkKWI5LREM748/aGnaGUQUx67c78nrT6h6Fj3Dz5r669vK455LeGcbTd4cvnFIw==
X-Received: by 2002:aa7:c54f:0:b0:53e:1b:15f5 with SMTP id s15-20020aa7c54f000000b0053e001b15f5mr22652147edr.39.1699278388350;
        Mon, 06 Nov 2023 05:46:28 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ba26-20020a0564021ada00b00533dad8a9c5sm4324013edb.38.2023.11.06.05.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 05:46:27 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-py7zr: add recipe
Date: Mon,  6 Nov 2023 15:46:23 +0200
Message-Id: <20231106134623.11522-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106134623.11522-1-leon.anavi@konsulko.com>
References: <20231106134623.11522-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 13:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106414

Add py7zr, a pure python 7-zip library. Version 0.20.7 with Python
3.12 support.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-py7zr_0.20.7.bb            | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-py7zr_0.20.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_0.20.7.bb b/meta-python/recipes-devtools/python/python3-py7zr_0.20.7.bb
new file mode 100644
index 000000000..d919c4a0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-py7zr_0.20.7.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Pure Python 7-zip library"
+HOMEPAGE = "https://py7zr.readthedocs.io/en/latest/"
+LICENSE = "LGPL-2.1-or-later"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[sha256sum] = "55aa587fb4586c920437f5d6e6595f228beddb321bfee3f5146bb15c2e8e74d5"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native \
+    ${PYTHON_PN}-toml-native \
+    ${PYTHON_PN}-wheel-native \
+"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-pycryptodomex \
+    ${PYTHON_PN}-multivolumefile \
+    ${PYTHON_PN}-pybcj \
+    ${PYTHON_PN}-inflate64 \
+    ${PYTHON_PN}-pyppmd \
+    ${PYTHON_PN}-pyzstd \
+    ${PYTHON_PN}-brotli \
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-threading \
+"
-- 
2.39.2


