Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.1253.1591987044750504055
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id e2so4816885qvw.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=nhxWmg4t8klkrhuGNWYLl2OGHCa1fP+w81AILdMM/Qw=;
        b=rTsNze/8umKkwTYgZLkF4Kq7upJ1gipjy0qdXQhOYJmgDsFtk25sX5HhQjHfmQOcyg
         zDrHdWlavSenoPcyVI6qYFh6aaY4CDHDVVBwc4vHV19ZSuCph4lLsc8xa7Ub8/Zh7EYE
         8YSPw3kjgh1ioGiJVzQe2pfWLsVPQi96iAVj8pKdHBjj7QkkCdvEapB/LPBlnRw4L9eU
         kBEYLQtrftTnY+bRNvK9f0GYCBks6mcay16JaTLpWgFqPW2HQjlRibep1dKx0k5JlVhp
         0rApbalknFPXuMaQX3XLjA0rYgEb0C8g2lD7NQUOWAeCDUwlcuTdNgw2uPpCjyGPMUav
         MJbQ==
X-Gm-Message-State: AOAM531kI3K7KKed/XtvAYMFXLVCVwGbpJ0hji6zwABn+dakxPKl9Qe3
	1E0H9+MDSdpI2vIDrgxsHv6tsIekCX0=
X-Google-Smtp-Source: ABdhPJwBwRD4EpLeDTt/vpz3gP/IhvTPZhqvfkCCJ+XGdRtZwMwtKNdja/+vjSjWgi9FGfVaUoLmUw==
X-Received: by 2002:a0c:aed6:: with SMTP id n22mr13988560qvd.70.1591987043733;
        Fri, 12 Jun 2020 11:37:23 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id q24sm5149708qkj.103.2020.06.12.11.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:23 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 20/22] python3-pytest-html: Update 1.6 -> 2.1.1
Date: Fri, 12 Jun 2020 15:36:05 -0300
Message-Id: <20200612183607.108989-20-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
(cherry picked from commit fac673dc825eac87e77fd89c5d1dc58b76979c00)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...html_1.6.bb => python3-pytest-html_2.1.1.bb} | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-html_1.6.bb => python3-pytest-html_2.1.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
rename to meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
index 8ace29ed1..27b768155 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
@@ -1,19 +1,24 @@
 DESCRIPTION = "pytest plugin for generating html reports from test results"
-HOMEPAGE = "https://github.com/pytest-dev/pytest-html"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 # Per README.rst the license statement is fetched from
 # https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE
 SRC_URI += "https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE"
+SRC_URI[license.md5sum] = "5d425c8f3157dbf212db2ec53d9e5132"
+SRC_URI[license.sha256sum] = "2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e"
+
+SRC_URI[sha256sum] = "6a4ac391e105e391208e3eb9bd294a60dd336447fd8e1acddff3a6de7f4e57c5"
+
 
 PYPI_PACKAGE = "pytest-html"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "ac956864a9b3392203dacd287ae450f0"
-SRC_URI[sha256sum] = "a359de04273239587bd1a15b29b2266daeaf56b7a13f8224bc4fb3ae0ba72c3f"
-SRC_URI[license.md5sum] = "5d425c8f3157dbf212db2ec53d9e5132"
-SRC_URI[license.sha256sum] = "2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pytest \
+"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pytest"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

