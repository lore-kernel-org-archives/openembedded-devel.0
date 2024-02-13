Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4687C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 06:47:22 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.6288.1707806837791550934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 22:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZoUGyzfk;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a3cb228b90bso160302366b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 22:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707806836; x=1708411636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AJGVN2l+SgzzvTvFrfqXRyWxbBEr8p4/MKdIxKiJ54E=;
        b=ZoUGyzfkeRnOW4oO2Nu6bcU5gy2XzkdnzopsrKMpifyVP3w+Uu159foAGzR5+oJ8eA
         v1a9Qu+0S/ZbcENoGgcpsw8OSz8iifFWIasBKTxQxvLj0SgA0J/JMF2KGkuta9HWTBj+
         oCw3oh8Jk2iZgOw26eeAGC1TkkfOYKXAN/ddsAevWYd5Gu4O+ngC6WVDIhexyEoVZ17o
         g0s3UgdZKMaxPRemmfCBj0whGxrma6haPrydg9dOhV2De0FnT6RXNB/Cobo8ytpEqARn
         hnXsAcUzTac2vG+bc+CoKKCIeaOK6F9DGIGfF9pS4mw4U7OjWBC83omw9SgX3h1TfWB5
         hq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707806836; x=1708411636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJGVN2l+SgzzvTvFrfqXRyWxbBEr8p4/MKdIxKiJ54E=;
        b=k+0d1L3uUbQPVbxjU8dJWFGzYPyu60oD8ZZLVrkcuNTdcHys+uWvtGcStjKIkExreR
         2XlChvlgtUgWjw49115FDr7hY8SRDD/VKz2PKKjCpKup5QUBHBJp3xA3CdBZKHllFdJn
         gGBsnpcjDQosU9tQxfBJKvHThcGZ3DUoUuMtubFfDIbwg0TIXaeM4cDgFSFivaR6R/iD
         fJSDajfWnMPn41cM2F+Iyco7bEVVTscXw5+JItcDOySyoC6VeY+aOjM2RcnmRppIQB/O
         i8fL+s/HANz397F9RzEaWSGI02Nmhtvdme8ciXJaFuzaP2QPKjVvoAiEaW3TVno3OAkO
         TEKg==
X-Gm-Message-State: AOJu0YyUWaWvjWjrc+9ENh1IMbvuQ03uW7MIcWlZo3u77j/IxbzljDVL
	zCxt6CgLid2g3b0f+ortMoUq5CrnAp4qLGMlSY6k1ie03kNG32hSRN/yHApk6bw=
X-Google-Smtp-Source: AGHT+IEvgRygSbtJp1EHfuRh1oSpgp8xKURIBnA17fZbSAhbcuco2HS+8WY8Ryug1Z6kj4sOXtpduQ==
X-Received: by 2002:a17:906:46d2:b0:a3c:bf99:123c with SMTP id k18-20020a17090646d200b00a3cbf99123cmr2792680ejs.23.1707806835628;
        Mon, 12 Feb 2024 22:47:15 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id ce24-20020a170906b25800b00a360239f006sm968524ejb.37.2024.02.12.22.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 22:47:14 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-sqlalchemy: upgrade 2.0.25 -> 2.0.26
Date: Tue, 13 Feb 2024 09:47:09 +0300
Message-Id: <20240213064709.102285-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 06:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108722

Upstream provides a pyproject.toml which declares the "python_setuptools_build_meta" backend for PEP-517 packaging and requires cython

Changelog:

https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.26

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-sqlalchemy_2.0.25.bb       | 25 ------------------
 .../python/python3-sqlalchemy_2.0.26.bb       | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
deleted file mode 100644
index 35011553c..000000000
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
-application developers the full power and flexibility of SQL"
-HOMEPAGE = "http://www.sqlalchemy.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
-
-SRC_URI[sha256sum] = "a2c69a7664fb2d54b8682dd774c3b54f67f84fa123cf84dda2a5f40dcaa04e08"
-
-PYPI_PACKAGE = "SQLAlchemy"
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-asyncio \
-    python3-compression \
-    python3-json \
-    python3-logging \
-    python3-netclient \
-    python3-numbers \
-    python3-pickle \
-    python3-profile \
-    python3-threading \
-    python3-typing-extensions \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb
new file mode 100644
index 000000000..4aaaa1f22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
+application developers the full power and flexibility of SQL"
+HOMEPAGE = "http://www.sqlalchemy.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
+
+SRC_URI[sha256sum] = "e1bcd8fcb30305e27355d553608c2c229d3e589fb7ff406da7d7e5d50fa14d0d"
+
+PYPI_PACKAGE = "SQLAlchemy"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS = "${PYTHON_PN}-cython-native"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-typing-extensions \
+    ${PYTHON_PN}-greenlet \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-profile \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-sqlite3 \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


