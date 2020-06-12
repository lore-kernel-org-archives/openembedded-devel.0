Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.1292.1591987048136323723
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id b27so9927392qka.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=UubmwzwnBoktbxQHPPMw9dLp9dmSgUX0bXhobGdVRQA=;
        b=QHWV1MFjDXvxD6BElFVwSM6R7ZNWT3S9kQp6Q53FIeeBRz37jOhKkm6QBMFI9Ni7pE
         YBlH31s23JrLeD71btNarl/Ns+QE4ulUTEf74o3i6rWHeaQ2GG7g1mmiPCdJGsEVKb7p
         Z4SLu6PRmD5j4s1kHwMkEnaq++0UhkRiQUNdXyAt00fA9eLuQJBP3bsnK0Lv0NDKXIUD
         OpYVW2HpjpOP5nXI/7OLj8cO+FOKQWeEOnCQ78OHgPEQDVFZVMHp4mGyjvTviRQIq8Ma
         +bB2h4ZNueGriytN9nIZM3GVTKXr1XdNSYb4qcg8Zuv6417JScnyN2kzNTqbvb62lsYU
         Ix0g==
X-Gm-Message-State: AOAM532OFXC/GlnOAGH2Iu1FgGGTPaiVk63QTUZVQCdWeMKuFsg1AueL
	z4Isyd+GJINv73GUufh5MQVa975A8GQ=
X-Google-Smtp-Source: ABdhPJzMfXTMt4Mfh+gEjuHYWPBiBVG5djO/4x1O77svVkaowzmCjYVZBakOA8r3V07CsFboJGnGAQ==
X-Received: by 2002:a05:620a:a8a:: with SMTP id v10mr4265671qkg.488.1591987047107;
        Fri, 12 Jun 2020 11:37:27 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id p11sm4879388qtq.75.2020.06.12.11.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:26 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 21/22] python3-pytest-metadata: Update 1.8.0 -> 1.9.0
Date: Fri, 12 Jun 2020 15:36:06 -0300
Message-Id: <20200612183607.108989-21-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
(cherry picked from commit 08b633b4f352ac9dcc4da13a8a967c87803c6c14)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...a_1.8.0.bb => python3-pytest-metadata_1.9.0.bb} | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.8.0.bb => python3-pytest-metadata_1.9.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
index 807b0cedb..4a77af3cf 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
@@ -1,15 +1,17 @@
 DESCRIPTION = "pytest-metadata is a plugin that allowed for accessing pytest metadata"
-HOMEPAGE = "https://github.com/pytest-dev/pytest-metadata"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
+SRC_URI[sha256sum] = "168d203abba8cabb65cf1b5fa675b0ba60dccbf1825d147960876a7e6f7c219c"
+
 PYPI_PACKAGE = "pytest-metadata"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "95674c2390b58e0138cabac5101d1908"
-SRC_URI[sha256sum] = "2071a59285de40d7541fde1eb9f1ddea1c9db165882df82781367471238b66ba"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-pytest \
+"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pytest"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

