Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.6373.1585117689340967246
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 23:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LxjiySq0;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: nick83ola@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id 31so1440108wrs.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2020 23:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y2N7u+mibnc55Is8OOY4Gth/6LEImmTNhs3CsGvzrIw=;
        b=LxjiySq0+0hiB9qfA3ba5nugSOUzpzSUe5u81LjTBWHfddsgDqz4BSXk2Bhs6Wln7L
         CwU6H/HbhMrw8f+0X8F/rI4/ndzmDEmqyp07v5R2NNuB5Cpf70CpECw3E6LiIPWtQ8Cd
         hllGN85ZSir5jCtsyrfjM48NVMdAaQcuivuI2aRGiqW7Tvs6eGBegDLnzX+4S5UUqBug
         fXcxeSe2KPTSfYR8q8AAhqff+39AQ49b0Lig7+V89C8w4Ciei0y+eX7karKkqwOOUYHl
         Xl+wcHisixckg0G+qEJga+JlLJb5eV8yz3sd6WuzokuEXaZeMZv4KyB7Vpy5amADV/6D
         IU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y2N7u+mibnc55Is8OOY4Gth/6LEImmTNhs3CsGvzrIw=;
        b=Uy2L6u/Xvj3Nldid34Rbvkv7Z7YiZobTrQilftmItDG5wjOuCa5FNnm9OOx6Dyrhzj
         iWpTFMaKs6UlSX427nHIodjZ8DUeDkG6dG/cLiok7Lujoe5cCQmbGSlMWI49xKk4Pe5d
         nLqU4XLKgrtgTiInTe19ZHRWuG61PETpF84eN1fvkShAzZj7Bcthq07uYClW1lSQ5pJJ
         wlE5J1lwiYVKnjvL4n0gnOxHIFczZSWwNsIi4aozojLqzf149FvYXPuD4tecVVyMeCz7
         RAgaLh7LUzkfvBKG1yck3+JFo7peg3JhKgSeXKlbjU2r+E3R+d1JEbslQvqaoFqwhRne
         lCfw==
X-Gm-Message-State: ANhLgQ2lxPDLWPPJnsdPwyDmPVs/kudZBEURIaM9/0XmLNxpZDaHkAKq
	WQgr97UeKqtaSBMaOUgbJRRpq/eDwek=
X-Google-Smtp-Source: ADFU+vuTrlfp7kPY4xYJDEz3RGt57aAbQoCbwjzRRfLnCxPpyKBAytcJOkvKHfgpvRec/T8rNcBJIw==
X-Received: by 2002:adf:efcd:: with SMTP id i13mr1541680wrp.355.1585117687390;
        Tue, 24 Mar 2020 23:28:07 -0700 (PDT)
Return-Path: <nick83ola@gmail.com>
Received: from nick-beastie.garage.tyco.com ([79.97.95.10])
        by smtp.gmail.com with ESMTPSA id l64sm7781477wmf.30.2020.03.24.23.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 23:28:06 -0700 (PDT)
From: "Nicola Lunghi" <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Parthiban Nallathambi <parthitce@gmail.com>,
	Nicola Lunghi <nick83ola@gmail.com>
Subject: [meta-python][PATCH v3 1/2] python3-matplotlib: multiple changes
Date: Wed, 25 Mar 2020 06:22:07 +0000
Message-Id: <20200325062207.15318-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* The license indicated in the setup.py is PSF not the BSD. Update LICENSE
* added kiwisolver and cycler to the dependencies
* add missing pkgconfig class
* added native for the python dependencies to DEPENDS: the setuptools need to
  launch the required libraries to check if they are there
* remove redundant PYPI_PACKAGE
* add SECTION = "devel/python"
* apply oe-stylize

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python3-matplotlib_3.1.1.bb        | 32 +++++++++++++++----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
index 824680c24..c638e27b1 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
@@ -4,16 +4,34 @@ Matplotlib is a Python 2D plotting library which produces \
 publication-quality figures in a variety of hardcopy formats \
 and interactive environments across platforms."
 HOMEPAGE = "https://github.com/matplotlib/matplotlib"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
-
-DEPENDS = "python3-numpy-native python3-numpy freetype libpng python3-dateutil python3-pytz"
-RDEPENDS_${PN} = "python3-numpy freetype libpng python3-dateutil python3-pytz"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "\
+    file://setup.py;beginline=275;endline=275;md5=2a114620e4e6843aa7568d5902501753 \
+    file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
+"
+DEPENDS = "\
+    freetype \
+    libpng \
+    python3-numpy-native \
+    python3-dateutil-native \
+    python3-pytz-native \
+"
 
 SRC_URI[md5sum] = "f894af5564a588e880644123237251b7"
 SRC_URI[sha256sum] = "1febd22afe1489b13c6749ea059d392c03261b2950d1d45c17e3aed812080c93"
 
-PYPI_PACKAGE = "matplotlib"
-inherit pypi setuptools3
+inherit pypi setuptools3 pkgconfig
+
+RDEPENDS_${PN} = "\
+    freetype \
+    libpng \
+    python3-numpy \
+    python3-pyparsing \
+    python3-cycler \
+    python3-dateutil \
+    python3-kiwisolver \
+    python3-pytz \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.20.1

