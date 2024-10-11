Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B83AD0D789
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 13:05:20 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.11014.1728651916961105642
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 06:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W86z+glk;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a994cd82a3bso282492566b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 06:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728651915; x=1729256715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K95d7EApJaO2pFZ1xwS0g+K684Wv6hLzzwM19q3OFdA=;
        b=W86z+glkNAl1T7y/EzkwXLFndj2jsq75k1FqcuJDK7TBAfULISxBH/kiD7k27a/3jn
         QvghYkg+ZE/cjsfn81NZYlW/Qu12mRGk27R+QnIdlCNHTAHz6m4mFAxznXyYyuEqMg1G
         u2518gMcwZ9A1F2QRArriusknxx3Q7RIoEcYxvsV3kjW3AeJzKTh3mZZcbhaO67LdZWb
         pS7moTMqFuoU+YtCqJgiPd7unJS0qnekVWB7pEB3WGti8rciJwCrTIl7/C/zXmBVelv7
         +n4ESV8R6hfDdg6aObxSp9A01I8ELvkvBj7+8Ss4GDTdLeYTT9Y6K/Xu/NGLOC+H70hi
         mR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728651915; x=1729256715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K95d7EApJaO2pFZ1xwS0g+K684Wv6hLzzwM19q3OFdA=;
        b=iRcMPV2Zd/RhMAQF/iMx18GGu4LdD5MfBrv+vqAt44Qr+Xx+5i1+phc3vtAAdAAx11
         x8lgDrz7iWE7rDmkd2dmCxrhb+QSUPHMOm9/2YYyliOQ6sswm0cgTT7tRu+hfVyXms+k
         pbcBCiRzcaU7tqaCydDbBxLhUix0lTxUNHKR8O+RwgRPqmBJV+7f89n0LRewgiRNlicB
         KCLhOuUwlwvLy0BJj61AzYMFuGQ7o6F1aIypLLvbG3VxiRpR0oMBzcs9pMhyOpfmDetx
         BU6GhnukyZDDfjC/7fXKAsAlx634ySO+nnFUljZAyE+Fiidm779pbz/QA/JhWMXouIrp
         BLDw==
X-Gm-Message-State: AOJu0YzzOf2x7qKML6nJ6+gtpRhmeYeBNTmc/FK9TLuGmNZIFwa9b+VF
	+1beiReU46i5fdeSKV3g/qtqPJrYbDpijqpxFHdtVYkXtlFhYK769t1mK3e+
X-Google-Smtp-Source: AGHT+IGdnJjXAo7PkINVvN4G5kqMXHzbRbcEEdTd4RaUSeDCjn2T0A+3UTQMU31mqQ1QjsgPVsIyZw==
X-Received: by 2002:a17:907:c08:b0:a99:3abc:52eb with SMTP id a640c23a62f3a-a99b942e697mr234013666b.30.1728651914564;
        Fri, 11 Oct 2024 06:05:14 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec56eesm210466066b.31.2024.10.11.06.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:05:13 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-propcache: enable ptest
Date: Fri, 11 Oct 2024 16:04:37 +0300
Message-Id: <20241011130441.2919272-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 13:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112797

- Tested on qemux86-64 and qemuarm64

- Added ptest to PTESTS_FAST_META_PYTHON

Ptest result:
=============

qemux86-64:

Testsuite summary
TOTAL: 37
PASS: 37
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 7
END: /usr/lib/python3-propcache/ptest
2024-10-11T08:21
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 37
PASS: 37
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 6
END: /usr/lib/python3-propcache/ptest
2024-10-11T08:16
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-propcache/run-ptest        |  3 +++
 .../python/python3-propcache_0.2.0.bb         | 21 ++++++++++++++++---
 3 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-propcache/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index da6206c6b..25d71a2b6 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -49,6 +49,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-portalocker \
     python3-precise-runner \
     python3-prettytable \
+    python3-propcache \
     python3-pydantic \
     python3-pydantic-core \
     python3-pylint \
diff --git a/meta-python/recipes-devtools/python/python3-propcache/run-ptest b/meta-python/recipes-devtools/python/python3-propcache/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-propcache/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
index 874c9fd8e..5f9fbda5f 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
@@ -5,9 +5,24 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a4f29a020bc985e70"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
 
 DEPENDS += " \
-    python3-expandvars-native \
-    python3-cython-native \
+	python3-expandvars-native \
+	python3-cython-native \
 "
+
+RDEPENDS:${PN}-ptest = " \
+	python3-pytest \
+	python3-pytest-xdist \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


