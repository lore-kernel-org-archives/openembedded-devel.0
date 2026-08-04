Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63F9C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 15:12:47 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18830.1785856360762134287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 08:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QRlfE9B5;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f7872abb6so2764053f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 08:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785856359; x=1786461159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nWy6Rq2Gey/Q9829tq6aCTuNYGJ6zv1ii0p44L1/Jk=;
        b=QRlfE9B5l1ghYNeIiFvtdHW4kZxVo6PPhSq3lsIJBVPcnsmSh6w9R7xd8ADn1UfgjM
         rAJDZjI1M/GgWdbrL8KSQ9odmWJAf671Y+upEutR/bVMkyz4TfhgULXPN9pWT3enmHw6
         cgBJX3u2Knh7lSYxe7ED0kOG1MqIQ+UoMMmcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856359; x=1786461159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nWy6Rq2Gey/Q9829tq6aCTuNYGJ6zv1ii0p44L1/Jk=;
        b=m9nVWea7LOY9gX3e9wZErzpUVeQ4R6HPLD1iyHOz1UwzkBSFrgRzeKAXL1Fivm+M8h
         alWvQARWSf/04yhXUBQ4UXg/opaj4zwMzGPxx7LCwOKNX34k6I8SAJ0c1isgE9Nyamdd
         /ZdkFt7nnJEegtDu8v9jCnHw5WdE4MQ63iHkCjxVpphCP93dQEWjqpNjq3QJTvNbBvOj
         phN3rpGsYIe1tb+2bliREIaSTGGVTGp8CVIVwj8mmNK/2f7JbId7TW7u17rn1cM4aKaQ
         zwkoUGX2r5w3GHlbv2ozgFsTVQjmh5/Cf348cyTCh74B0WwYj9wmEtLnCPjl1J/YvMWw
         p8Zw==
X-Gm-Message-State: AOJu0YzURwJqhONPlr6ZJI9Ysak9F9OTMzM/dnLKZ3IogH8UVH8/zXVx
	tY130/ZNUvmZwkgtpiGz8a5buEUO1GQBRBLvBGmSLIDjS1aGoUCxBuz8JKEq7Xr91iVRfYyetA8
	gG/5D
X-Gm-Gg: AR+sD13WUl5g3R1GuAOCJERJwkv/cM6W0Nd9fUBn1X5VLXpqvyzX1NMrmOsWbhBS8/j
	QCWKeTultUIaHYaOw4+++cFX9eu82vMoQeC/u97F3aA9dfeIGi+/x4hS0iPqr32dkVcgj+dBzxn
	UI0UVditmaph3CWXi5//1Qfu87KLBoce91ZIlGYoAHnPweFk9npIkWB79Y+q4sTeSXmiVVDm8MR
	CiNCbfKfRzMwFYp9KmQUWkNXM9B/mpS1K5FNXDBCkUlqeeHhMl6y3za7m3tC2WAEhEC9MuuSaEg
	cf+ZC5mwWT8fcO/OPwPyCgXGCOqiFvd/ESdc4Oc5SayfqHQotonoCW22oO/d4O0kaChPHA/lyKc
	/pObO7Xcn7SpWapFAjP8bp50HLRXDm2ps7B4RkjBO5nxtsKRavTRjBZGSCvBg2eDxKpHfd9sEMl
	WHFvkuQHgXjkK/2iyw56pKoBg5HeJWrqkvA9mI+mLN9+msWK8at3XZDK9ZyrAzuykkZER/zkKQ5
	aEWRR8cZPpozfQOb8dfvMA4JuOqOQ4Y9qr0RDzw+l96TzRk2O/S40HnVxvcID1isq2+H3NX8Bug
	YG/+W/KiJ28joA==
X-Received: by 2002:a5d:5e8c:0:b0:47f:773f:2d68 with SMTP id ffacd0b85a97d-47fd72b48bamr39599942f8f.16.1785856358010;
        Tue, 04 Aug 2026 08:12:38 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec232d17sm320029f8f.22.2026.08.04.08.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:12:37 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pika: Enable tests
Date: Tue,  4 Aug 2026 18:12:31 +0300
Message-ID: <20260804151231.3046238-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260804151231.3046238-1-leon.anavi@konsulko.com>
References: <20260804151231.3046238-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 15:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128747

Inherit ptest-python-pytest and include tests for Pika. Run the
tests that don't require the docker container with RabbitMQ. The
PyPI package omits some files for testing like tests/__init__.py
use the GitHub source for SRC_URI instead.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pika/run-ptest             |  3 ++
 .../python/python3-pika_1.4.2.bb              | 29 +++++++++++++++----
 2 files changed, 26 insertions(+), 6 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pika/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pika/run-ptest b/meta-python/recipes-devtools/python/python3-pika/run-ptest
new file mode 100644
index 0000000000..786883c877
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pika/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake tests/unit/ tests/misc/ tests/stubs/
diff --git a/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb b/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
index beb32240c5..b64a4a508a 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
@@ -10,17 +10,34 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
 SRC_URI[sha256sum] = "48d1f50297e76be4fc798fd5232d4d532d7a4758e51f7c0ae6c4004b9808a26b"
 
-inherit pypi python_setuptools_build_meta
+# The PyPI package omits some files for testing like tests/__init__.py
+# so use the GitHub source instead.
+SRCREV = "3c9b50d4167e436c73cecae8127e3c5b266b2fce"
+SRC_URI = "\
+    git://github.com/pika/pika;branch=1.4.x;protocol=https \
+    file://run-ptest \
+"
+
+inherit python_setuptools_build_meta ptest-python-pytest
 
 PYPI_PACKAGE = "pika"
 
 DEPENDS += " \
-	python3-setuptools-scm-native \
-	python3-toml-native \
+    python3-setuptools-scm-native \
+    python3-toml-native \
 "
 
 RDEPENDS:${PN} += " \
-	python3-logging \
-	python3-tornado \
-	python3-twisted \
+    python3-logging \
+    python3-tornado \
+    python3-twisted \
+    python3-gevent \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest-timeout \
+"
+
+do_install_ptest:append() {
+    install -m 0644 ${S}/pyproject.toml ${D}${PTEST_PATH}/
+}
-- 
2.47.3


