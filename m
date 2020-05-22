Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.11620.1590149626151433270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 05:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=iuah2xfE;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.193, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f193.google.com with SMTP id v79so345896qkb.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 05:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G0M+H17xojDM39D4D3dfh+h18xgQ64BLL6tRfF3Z/jM=;
        b=iuah2xfE8fdUFaU7bnbyPIH3UyoP7fYMZtoYhFzjC6uDxmc6MyhytD6HFdjLB3El8t
         bvlY8P51FPVXnXExiVDPPdT5VBFISLeVbhKcn2do7sVfTQvGNj7LKcvrYky/U/QUVPfO
         yadNFbQ6ajkUuvxt6iQaxirFXLZBUGxKTUxEuxRg/I3HgQ6+joVLDedQVEjgojiep09/
         yDTBp7MLseaDh1AR6/9L95PiQBY/PssxYzlNaFeNTbmNL+srgqVHTiGyhC7fvj3k0m8s
         S19CWanyqLejytO/YrR3iXrmsP/xTiRpFQDVd99LKhLs05RGzlrNw1G6gH8g7KdsdMy4
         n4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G0M+H17xojDM39D4D3dfh+h18xgQ64BLL6tRfF3Z/jM=;
        b=C6NrGUVlKMEKKdd2ZZyYKAXCUaGOF8tv3Dx1hjOIM1WFyTvgRusTtRkw50DfZVDWSg
         g+DWLK4QCqTYRKEU2+afeOJEASuNHX5zob7WoDJDlZNlecvEQAewQkXRQmCMRNO6Qo9J
         rox5zKcn27EIoiCmfqy1ji2nChSLq9ZpXiq032sWbjnARyAM8ioD7KEUEgKU46E+kW0E
         QmbIhBkvxBLI5xxjp9nS7sQyl3g2veMfD/0Tjos5zcYA6s1obBcRBxe4gZ5toOT2EJyX
         GjUItK/s3SJdgO8bY/1cWVOgmxkA+F7xRFq0KyY8s5mBY7LAwrKiYr4w0g/TCGoHlzVy
         INGQ==
X-Gm-Message-State: AOAM530V5RDnEevqNY7ZYiBUymTUCk2og8nDdyAQMpPBX7JiDJeMsCKl
	vPb54zp6V7GByHlhPAaS94SRhQvXfYU=
X-Google-Smtp-Source: ABdhPJzl7xwu86ukM2a1D4o2dLxDdd1G6tJUqUVLX0e20B/u16O1ruFzssOihKwK1iA6arfupEuPaQ==
X-Received: by 2002:a05:620a:12dc:: with SMTP id e28mr15171298qkl.38.1590149625185;
        Fri, 22 May 2020 05:13:45 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:24d8:1ecb:250c:14de])
        by smtp.gmail.com with ESMTPSA id g7sm6309813qkk.44.2020.05.22.05.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:13:44 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 3/3] python3-pyyaml: Update 5.3 -> 5.3.1
Date: Fri, 22 May 2020 09:13:33 -0300
Message-Id: <20200522121333.25045-3-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-pyyaml_5.3.1.bb             | 18 ++++++++++++++++++
 .../python/python3-pyyaml_5.3.bb               | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
new file mode 100644
index 000000000..5efc2aa9e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python support for YAML"
+DEPENDS = "libyaml ${PYTHON_PN}-cython-native"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d"
+
+SRC_URI[sha256sum] = "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
+
+PYPI_PACKAGE = "PyYAML"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-misc \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
deleted file mode 100644
index b5425b8c9..000000000
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Python support for YAML"
-HOMEPAGE = "http://www.pyyaml.org"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
-DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
-
-PYPI_PACKAGE = "PyYAML"
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "adbb0d336b509d6472d3b095a0f1cf30"
-SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

