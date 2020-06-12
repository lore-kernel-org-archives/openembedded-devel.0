Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.1228.1591987012741466354
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id c185so9946870qke.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=N9JKDNtYB9YRf4Hpn3cDC4W22K8DBd76p5eCqS3jArU=;
        b=GHZozgNGGVh2DN6dO2oM3GFCUwBWJ/8StCKXjVUO4Z2cbuF0JBHjGybv9JWgO2ZJXj
         VD5b09BpuoEfpqQPzilKNOxo6PhLe0v84IiyfAOgYwLTvz+tNoG/PTE1jw37chkfQjUs
         S9GZ1pMQ8Y5ycsQd2IRzQTkEERjtm8clWevStOwfemaHUR6pNw2koEpnVbD2OsxDpuR0
         6KF8SBh/gJko2BjZ+Qt8C62zJUTzVZEi8c7za2byGez8hWwNZ4FJb7HAno9hd7Mqq74E
         1vd9xn9yyzE4jd6rOy5fqN/N6H7/iwYFVm+B3PasXhIGzYCDb9rQGX8CRCLsx6I7CT8v
         hUGg==
X-Gm-Message-State: AOAM530of3gcgxhlhM9Cj2wE7e4eteJGQeTb/5BXetQAPApt2HtCzqSY
	3/l3fEXTWYuObNDunprWmbaTjrugAw4=
X-Google-Smtp-Source: ABdhPJzYYxSlnUCxiS6IsO080iZIIS9I6rUj4RUpLgvb37TLD+Jdzwwmc+lKWDsHD6IuyAhWMVYIOQ==
X-Received: by 2002:a37:a194:: with SMTP id k142mr4414021qke.14.1591987011704;
        Fri, 12 Jun 2020 11:36:51 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id m26sm3185723qtm.73.2020.06.12.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:51 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 10/22] python3-multidict: Update 4.7.4 -> 4.7.5
Date: Fri, 12 Jun 2020 15:35:55 -0300
Message-Id: <20200612183607.108989-10-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3491b0dee95898c7c6895a86e97e8c1d02362206)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...hon3-multidict_4.7.4.bb => python3-multidict_4.7.5.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_4.7.4.bb => python3-multidict_4.7.5.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb b/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb
rename to meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
index 0636972ec..30e10c251 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args etc."
 HOMEPAGE = "https://github.com/aio-libs/multidict/"
+
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
 
-inherit pypi setuptools3 ptest
+SRC_URI[sha256sum] = "aee283c49601fa4c13adc64c09c978838a7e812f85377ae130a24d7198c0331e"
 
-SRC_URI[md5sum] = "22b46f759cf2cc3ca1d2c9f82cc9bb79"
-SRC_URI[sha256sum] = "d7d428488c67b09b26928950a395e41cc72bb9c3d5abfe9f0521940ee4f796d4"
+inherit pypi setuptools3 ptest
 
 SRC_URI += " \
 	file://run-ptest \
@@ -20,3 +20,5 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

