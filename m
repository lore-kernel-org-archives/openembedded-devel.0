Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.1231.1591987015897429562
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id f18so9992012qkh.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=1ykeIq1xJ4rAPyEW7wr41umIdXaxNzMkNLlSZjnENJQ=;
        b=Hy1RGrgyN+YTzAoUSi7Cxw9H1Jr/VPRWRfaseGQMXpsxJkWkJ2UhlBEvF4VMA3zLhP
         B6n0ui8OLhrU0p8KzGiOKxYgZ3iXkAEazjypjbJyzuf08SgNGyb64MBJNzbrngdELMXs
         SohYUVj27CHgyyUM6q4MKgos9Y71O/OovlozbOlxxSQ2Sz3SJwBbASPP4Mi0fa/FxNRs
         Io6nra15sE8kPo9DDoyjJw1yXBkr4ktoUd5Z1oJq0bMm5K/XTnhyYHfkRR2n3gfmnU6i
         BMc9YlnXiNnfZcbbzgpwoYfxdPkzdzNyicoQ5T6Uk6u6WTGdR8151AXxh98aTmbE9uc8
         GoMQ==
X-Gm-Message-State: AOAM531LdWXcW8dqHLhVwsi+RkENXaJwEn8e3Ws5IT3S8oBhP4yLU/HY
	9LMupx9MICCDE7tXx0kC6tbcqUBt+1I=
X-Google-Smtp-Source: ABdhPJwxiCJbbqmIjy/PcjVQ8k75zOI+BMjQFo/iKNtqQW8TmeUbDO8i+heDEeAwtgwZgdlWsBRknQ==
X-Received: by 2002:a37:ef12:: with SMTP id j18mr4219468qkk.306.1591987014850;
        Fri, 12 Jun 2020 11:36:54 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id u7sm4704514qku.119.2020.06.12.11.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:54 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 11/22] python3-lz4: Add recipe version 3.0.2
Date: Fri, 12 Jun 2020 15:35:56 -0300
Message-Id: <20200612183607.108989-11-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a011a5fc045aba99378c54e6d2a58f2f7c22b416)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../recipes-devtools/python/python3-lz4_3.0.2.bb   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb b/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
new file mode 100644
index 000000000..e39ca8f3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "python bindings for the lz4 compression library by Yann Collet"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6231efa4dd4811e62407314d90a57573"
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native \
+    ${PYTHON_PN}-pkgconfig-native \
+"
+SRC_URI[sha256sum] = "9c9f6a8b71c18c24bd83537a4d616f0301623a5e98db7c7ca956d608e1bcd4c7"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

