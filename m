Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0789C41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 17:58:38 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.1114.1690221510345225729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 10:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Ww5GxOE0;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7656652da3cso354844485a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690221509; x=1690826309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWs1xyspCcMkzOIWPkWSXGTSM/SDMRe6MUoHWSAA6g4=;
        b=Ww5GxOE0kYiu+XdCzN7OMutZPbphCvlMpyw6A9rhvmK5OFdSkX8GoJe8lUBSbaQYw+
         ytPqsH8XYKQP09gCl/bTe6QPxTfzWJ6YpYNcK/sXMSLk+/QRiQ6Gfv8umpTPrNiXLSNm
         V3RhQPNnnZoHxsSKnPlYdh0sjLcKmmNOne1IMnRIbOqHzoWlIZsB60hcLrRkEG2OJ9r+
         GFZrx5BoG3oTKfDWzz+AhB7Cjxe3IoRDoMwmXg4xIED5r5z91MXnpbMkwMksPSOJ6Iv1
         +odyViPDPMkrXNpCqcFp5Oq5E4cNOYe3j+3AQzHrXiyVxIQG+QraMkvJ3bYvyIEYXodJ
         EDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690221509; x=1690826309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWs1xyspCcMkzOIWPkWSXGTSM/SDMRe6MUoHWSAA6g4=;
        b=X5GBWeLvSGI8Q1NcKMY0aJpoxfoMhICQl1smAp27kbcPkyU7avFZQpo8F4BS2EJN6A
         Zoge+WAKdsrSehdvfX0xuyRwDNuP9HO6Epx8AN5kRKxp2DvnF9rRX/jmpnoI0GeRHZem
         TawJQ50GTQCGCEGplSRPZQ1E9R7Hry5Q+vHub/qMFK0ZA4r7fsyoiNRV5YQeKwgLEAul
         h1DnWmcG+/2FFv6rXa3m1qyy5RLNdJ3EglvoGrWyQOsNen0U9ory0zK8H7sDGcleRk0U
         9mKLaL7AB/ZnlwIKoooJcHZYbCemkyXfRx+mYfk6N7pTPbpKd1TXqg9ThLuI1pr52pbq
         42+g==
X-Gm-Message-State: ABy/qLZU31KQqazkdXcx1lu/OD41GyXHUHDieTsF+IolnBi48JQ3D5ZH
	RJvZ0ElC7KZ/eCr+S7IdId9regbX9cr4Iadf71o=
X-Google-Smtp-Source: APBJJlEEwngBX8qe/68KBN/wEluPfZ2aNXj0wkoPN0kh8Hbj78gNuumG8yjwM+1TQ4JquGdiXIVRog==
X-Received: by 2002:a05:620a:e08:b0:75b:23a1:830a with SMTP id y8-20020a05620a0e0800b0075b23a1830amr476442qkm.5.1690221508914;
        Mon, 24 Jul 2023 10:58:28 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id j2-20020a05620a000200b0076aeeb69cb1sm1646065qki.4.2023.07.24.10.58.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 10:58:28 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python-pandas: upgrade 1.5.3 -> 2.0.3
Date: Mon, 24 Jul 2023 13:58:26 -0400
Message-ID: <20230724175826.80617-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724175826.80617-1-tgamblin@baylibre.com>
References: <20230724175826.80617-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 17:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103998

pandas now requires versioneer, so add that to the DEPENDS list.

Changelog: https://github.com/pandas-dev/pandas/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
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


