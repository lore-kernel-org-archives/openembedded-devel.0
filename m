Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6FFC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 05:55:33 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.15808.1707198926627608727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 21:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8ZcWwEa;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a26fa294e56so56789166b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 21:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707198924; x=1707803724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DiEsIe9UgE9E3c6QDUv1WSoY1OYAsTVrTk1cRcI9IhU=;
        b=J8ZcWwEaiPB/EOqTom+G4dOusw8FXkgPnxpbXiq0ju/gVZRadZ7TpLn7AWHhZi9H5k
         GXLyHA6YkwleAtKwTp3w1k+kl9hsL0H1q9YWTIlFvBmD+vvKPnnUqxV2QCDiCv/jbVtX
         MWwyXcBLsSds5oShmsOxdKeiCY7o9cFgdeF1uPnpqWFj9xgAtrRzVW3TZCXsZ9ZN0l3g
         54yv61XR9MkTdIm82CXjcgfCBgII/xAi7Stf0Dr64k+nkIOpvuE5Y77EIclzpuOfdAzQ
         tH3KLNgHsGnfVFJKNTCdyz455NrLjeSxfjAltKB5TwumBMgpjoGQQCWN1po/jqyZXXW3
         2mNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707198924; x=1707803724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiEsIe9UgE9E3c6QDUv1WSoY1OYAsTVrTk1cRcI9IhU=;
        b=YTL5uGaceSy0cUv3OBO8yEC48xwZ1y3Ih3INr43bC5bYura20ebJd6f59aWfO9UNNC
         gsRpFjTkS44NuuY23JqKfwKwgvNV3R3+NLdeTfKZk/jmacJ9VqOcCeJqtxbnmwW6qYEP
         Tkm42cEq3lj70ioIFqYaXi7N1oYHt31T2GhVRSrxuzOfpGE3uiTwhhy1udD9E6rjp2At
         T86VFo7i4L2siRLyVZK8F1sC+pclrRhKu/0eAILCobtLJS18VW0TzSN9eUDHlh5/hUx2
         rfgc7TsM+e5gvoYCD2CYCku7zs/MmfoZzjObZ27o2XNU1rzsNrVbNLmfo0UcAEdn2pSU
         y/ig==
X-Gm-Message-State: AOJu0Yyb+v7QSy4VYjzSwzQI9uZ3D/VKSkMY7qoaF+ZKV6Nih2S8pLQv
	FN1EzzCM+TK1mN3WY6fQ1gyBkfK1+p+m2Ni3yicAI/iQ7FepG2NET0k9gjrvifc=
X-Google-Smtp-Source: AGHT+IHxEpINqDWfzGFpy6PMomf44kR0gw1uhuJehBXCvtivAqmFpyFinoWuMKypZFf/PUOdUpSj2Q==
X-Received: by 2002:a17:906:f911:b0:a35:7192:1f with SMTP id lc17-20020a170906f91100b00a357192001fmr1155330ejb.49.1707198924370;
        Mon, 05 Feb 2024 21:55:24 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id ll5-20020a170907190500b00a358b6242fcsm700819ejc.114.2024.02.05.21.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 21:55:23 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-eth-account: upgrade 0.10.0 -> 0.11.0
Date: Tue,  6 Feb 2024 08:55:19 +0300
Message-Id: <20240206055519.22317-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 05:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108585

Changelog:

Breaking Changes

    Drop support for python 3.7

Internal Changes - for eth-account Contributors

    Change older % and .format strings to use f-strings
    Merge template updates, notably use pre-commit for linting and change the name of the master branch to main

Removals

    Remove deprecated signTransaction, it has been replaced by sign_transaction

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-eth-account_0.10.0.bb      | 18 -----------------
 .../python/python3-eth-account_0.11.0.bb      | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-eth-account_0.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.10.0.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.10.0.bb
deleted file mode 100644
index 1854e3bca..000000000
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.10.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Assign Ethereum transactions and messages with local private keys."
-HOMEPAGE = "https://github.com/ethereum/eth-account"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
-
-SRC_URI[sha256sum] = "474a2fccf7286230cf66502565f03b536921d7e1fdfceba198e42160e5ac4bc1"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-bitarray \
-    python3-cytoolz \
-    python3-eth-abi \
-    python3-eth-keyfile \
-    python3-eth-rlp \
-    python3-hexbytes \
-"
diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb
new file mode 100644
index 000000000..84c270df6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Assign Ethereum transactions and messages with local private keys."
+HOMEPAGE = "https://github.com/ethereum/eth-account"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
+
+SRC_URI[sha256sum] = "2ffc7a0c7538053a06a7d11495c16c7ad9897dd42be0f64ca7551e9f6e0738c3"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-bitarray \
+    ${PYTHON_PN}-eth-abi \
+    ${PYTHON_PN}-eth-keyfile \
+    ${PYTHON_PN}-eth-keys \
+    ${PYTHON_PN}-eth-rlp \
+    ${PYTHON_PN}-eth-utils \
+    ${PYTHON_PN}-hexbytes \
+    ${PYTHON_PN}-rlp \
+"
-- 
2.25.1


