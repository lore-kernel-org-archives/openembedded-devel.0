Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ABCEB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 19:44:39 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.3993.1690227868909336858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 12:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=kVBGUXOP;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-76714d3c3a7so475238785a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 12:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690227867; x=1690832667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CfxDxQFITU3yrv25BajF9MiJSbA0CE+yvhZzO2pX3xk=;
        b=kVBGUXOPTr6GF14VrR4TmUnR6uObqNECsMW3kTR94SwefZnpZSaFnHfq8h4g699jk1
         KFIjIJ1917qvjKSg/wYTHKXkKp7FIFi9bc/LViZHh8JVyUkMdf8Dt4Uh/DNlkdcfbvzb
         7xyV//+6eLVraCZOSZ8l7T86xq4wSSPEqC0Kk8b04Ow2bayUJNkOG7Msfs75dTkqTSXa
         KH0S/29MFTI2VGcafg2ZPb+BnFMovQE/rJJyXKvkSxNX+iA3joZe47XOBrx5lIYNDYEq
         ibfJSb9/rcpTbY6qtNfUCg49lDOLMYRPVj7x6H3jdbQYk9gHx2G+PHft5GJiMKICzCGb
         lzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690227867; x=1690832667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfxDxQFITU3yrv25BajF9MiJSbA0CE+yvhZzO2pX3xk=;
        b=VX1gzG8H0Zp5BiwC/vXXs/CzurUr+g+EQ1hZ2wwe5UJGG2Z8HPWcYeWRM7NVZgZTYY
         T/z3H/goqhDV/3XJDecvzWs7nWiINCaGaeQ5T5P/sOBXtr9PMtSCc1TdBjqT4763b6Tn
         dQPVmtR57r8WAKpPXNsgbEXIa7aUMM2XTrA9WXLjfMkkF9fw4OO4HVcIURDH/2iDn7b8
         baXWG6t+hcWvJfgSkIceJDxlGOHD5OFUWvQOMZlEICoAcXAz1nct+Sf77nm/UEhzTqZC
         xrJjYl6zFNNF9XaHcS1Q+zMVUtaW2eHvAj5tpgxfN9KuDlAeG+EF4u7FzkCKiRMAx6yI
         Ja4Q==
X-Gm-Message-State: ABy/qLYouqzPpmwolu2Q4yD551+gBoDvQvAvNCPULZU6nKsthLOSfZab
	cGxo5QrCmncgweDtUStijovEwFCS0gI1cJWY4Lc=
X-Google-Smtp-Source: APBJJlHg1ISKQinslhXQBehGS1jthDYXsA1Bm3UayuGmcU/s3bDK6GYTI5GjVsA8ZtE2UibfwbCdyQ==
X-Received: by 2002:a05:620a:2698:b0:767:2833:7130 with SMTP id c24-20020a05620a269800b0076728337130mr895892qkp.68.1690227867480;
        Mon, 24 Jul 2023 12:44:27 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id x13-20020a05620a14ad00b00767c8fe810bsm3204152qkj.5.2023.07.24.12.44.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 12:44:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-pandas: upgrade 1.5.3 -> 2.0.3
Date: Mon, 24 Jul 2023 15:44:26 -0400
Message-ID: <20230724194426.246455-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 19:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104002

pandas now requires versioneer, so add that to the DEPENDS list. The
LICENSE checksum changed but this was due to line endings and not a
difference in content.

Changelog: https://github.com/pandas-dev/pandas/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 fixes the recipe name in the subject line and clarifies why the
LICENSE checksum changed.

 .../{python3-pandas_1.5.3.bb => python3-pandas_2.0.3.bb}  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.5.3.bb => python3-pandas_2.0.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
index 129c3147cf..87a173c8a2 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
@@ -4,14 +4,16 @@ high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language."
 HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c1cc9ab35a8b2aabf933cd6d245b5db3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
 
-SRC_URI[sha256sum] = "74a3fd7e5a7ec052f183273dc7b0acd3a863edf7520f5d3a1765c04ffdb3b0b1"
+SRC_URI[sha256sum] = "c02f372a88e0d17f36d3093a644c73cfc1788e876a7c4bcb4020a77512e2043c"
 
 inherit pypi setuptools3
 
 DEPENDS += " \
-    ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
+    ${PYTHON_PN}-cython-native \
+    ${PYTHON_PN}-numpy-native \
+    ${PYTHON_PN}-versioneer-native \
 "
 
 PACKAGESPLITFUNCS =+ "fix_cythonized_sources"
-- 
2.41.0


