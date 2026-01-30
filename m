Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAA9E63C8C
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:06:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5534.1769756785534464536
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Du3kJqj/;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso13240555e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 23:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769756784; x=1770361584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3Jn/uAJlZzS8Kx0emSa1VtCqcnxBkML4HRadlwerQI=;
        b=Du3kJqj/Q+o5fw20QnMSVAm98KCxthmlLy03yBwEugEOFxQMGu5bCrTeSmX8v92sst
         pvFg4Dd1j+mOaL02vYi9XUnGVprQupDnmU42ZxrpHHhoreU7TZMIVckC6Ff/RoBK73UA
         oCrLV9sNCXZdD4m2z/KiPyBMh9kmK2INgx0cyC8HKBKZ30Qml0Q9rrJKuDC0LbBIO5GS
         8soIEIAmJl7zpJqBHpsO3jZJgyE8bg32KPInkauQEroe+7dluRqwTaBIFAREr47bkusW
         6ua4QzYuB2LSFC0PgFgER++pY0X0TMOm/PSwDNoNwp6ekT+xbFRfIsSXv0aqAbX5720F
         yBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756784; x=1770361584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x3Jn/uAJlZzS8Kx0emSa1VtCqcnxBkML4HRadlwerQI=;
        b=AsSgYBhOja0PVSkUfJlL73FyQiUhjNQEa4/iZb+CSngQOfkrHKFK9Fth13cYWWXUGe
         MM+v0Y3ix2iBrVJwTUFrh42sSJy3f5bg/hosnKVfF1/GFJMyX6M/ryAHRuyJvemHEvTl
         8u2RwWWoPvCxBcmEaHfhli0mPNl+Xt4M8wMIen8EfZKZhTT3TldmaTrFbB8MISaIl/P1
         PXGtS2APZ4yH9zHkaIAfUlCiAFI6cBPpcwMZbYLL0Lt8CLjQHTnMyMkzqrOv9G3dDRKe
         +2HS0ddRCYAY/glbhM621bUEve9LeZ20g+8wuKu30HKHhTNjw25lUPDt/aGDs4URK9lo
         FqNA==
X-Gm-Message-State: AOJu0Ywo1q1vNUS1B7cQzCasciSRir4ZbVd9P290GJs0xGeZG4DhWxpW
	cIQrtxsEXM6t9HCmNk7n/sARjnwomO5zY4LJBFdGLLMN4CoOd4iTnJoIdsachg==
X-Gm-Gg: AZuq6aLvfObTeIGXx+HBwjJDhofR2hs6aYJ6FV0/ja2YsEOnbwCtiE2BHrUZYXEeRDV
	lSC9iSEadsqxIHqEsWLWtXu3VPLQL5fzf0oZwOgSmpYjRQsmuQTTTIZ08b6xHg0lIOep8KCRq13
	6ZZ6mi3JiR1kv+7x+JZZFJFj4hBlgLKzgz+aBY74R8cbBhrHNp19w2LtamHtXjj2Wy4LK+mMeCG
	FLmJQwmz1USdooRnhkPdoOjEOsYQID3RgvYX/QzObyaB72Put/A6m2XrN4uN/szN6vo5l2OeRS+
	6qHery++eJZZwJBmcFrx34VAxRNdXZzrbmQFYAReLL4y0VbSe+dRKVJ3fkPJ1TVLlI6sbrusFu0
	dach64HTceApO5qFEh2kYTQWJ1lzlY+DZpc6jF0oCV2kR41cGBdf/EGVR2t4qLjMdEJg06dfZz7
	P8Bu6eQ3It10V+fdRrU3A=
X-Received: by 2002:a05:600c:628d:b0:480:1c75:407c with SMTP id 5b1f17b1804b1-482db4577f3mr20264365e9.2.1769756783812;
        Thu, 29 Jan 2026 23:06:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm280057445e9.1.2026.01.29.23.06.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 23:06:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/5] python3-pymongo: patch CVE-2024-5629
Date: Fri, 30 Jan 2026 08:06:18 +0100
Message-ID: <20260130070621.3171877-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130070621.3171877-1-skandigraun@gmail.com>
References: <20260130070621.3171877-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 07:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123998

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-5629

Backport the patch that is indicated to solve the issue based on the
upstream project's Jira ticket[1] (which comes from the NVD report).

[1]: https://jira.mongodb.org/browse/PYTHON-4305

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-pymongo/CVE-2024-5629.patch       | 49 +++++++++++++++++++
 .../python/python3-pymongo_4.1.1.bb           |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/CVE-2024-5629.patch

diff --git a/meta-python/recipes-devtools/python/python3-pymongo/CVE-2024-5629.patch b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2024-5629.patch
new file mode 100644
index 0000000000..0b0822a756
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2024-5629.patch
@@ -0,0 +1,49 @@
+From a9454ae060fffa609cc02b129441679b7d248d8f Mon Sep 17 00:00:00 2001
+From: Shane Harvey <shnhrv@gmail.com>
+Date: Wed, 27 Mar 2024 16:51:23 -0700
+Subject: [PATCH] PYTHON-4305 Fix bson size check (#1564)
+
+CVE: CVE-2024-5629
+Upstream-Status: Backport [https://github.com/mongodb/mongo-python-driver/commit/372b5d68d5a57ccc43b33407cd23f0bc79d99283]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ bson/_cbsonmodule.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/bson/_cbsonmodule.c b/bson/_cbsonmodule.c
+index 1a296db..73370e2 100644
+--- a/bson/_cbsonmodule.c
++++ b/bson/_cbsonmodule.c
+@@ -2052,6 +2052,7 @@ static PyObject* get_value(PyObject* self, PyObject* name, const char* buffer,
+             uint32_t c_w_s_size;
+             uint32_t code_size;
+             uint32_t scope_size;
++            uint32_t len;
+             PyObject* code;
+             PyObject* scope;
+             PyObject* code_type;
+@@ -2071,7 +2072,8 @@ static PyObject* get_value(PyObject* self, PyObject* name, const char* buffer,
+             memcpy(&code_size, buffer + *position, 4);
+             code_size = BSON_UINT32_FROM_LE(code_size);
+             /* code_w_scope length + code length + code + scope length */
+-            if (!code_size || max < code_size || max < 4 + 4 + code_size + 4) {
++            len = 4 + 4 + code_size + 4;
++            if (!code_size || max < code_size || max < len || len < code_size) {
+                 goto invalid;
+             }
+             *position += 4;
+@@ -2089,12 +2091,9 @@ static PyObject* get_value(PyObject* self, PyObject* name, const char* buffer,
+ 
+             memcpy(&scope_size, buffer + *position, 4);
+             scope_size = BSON_UINT32_FROM_LE(scope_size);
+-            if (scope_size < BSON_MIN_SIZE) {
+-                Py_DECREF(code);
+-                goto invalid;
+-            }
+             /* code length + code + scope length + scope */
+-            if ((4 + code_size + 4 + scope_size) != c_w_s_size) {
++            len = 4 + 4 + code_size + scope_size;
++            if (scope_size < BSON_MIN_SIZE || len != c_w_s_size || len < scope_size) {
+                 Py_DECREF(code);
+                 goto invalid;
+             }
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb
index 7bde4ff681..d26ea5d2e8 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb
@@ -8,6 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
+SRC_URI += "file://CVE-2024-5629.patch"
 SRC_URI[sha256sum] = "d7b8f25c9b0043cbaf77b8b895814e33e7a3c807a097377c07e1bd49946030d5"
 
 inherit pypi setuptools3

