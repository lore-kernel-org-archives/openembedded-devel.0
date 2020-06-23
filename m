Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.5661.1592915039726533842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 05:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M1ufJsKa;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id f139so1578796wmf.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2020 05:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x9P0ARZQUhh8qaVhxMVo4IrurvxIp6GGJ19YxV7H/2A=;
        b=M1ufJsKaRK0Y+Tv2o2hlAIseikUMMt2wXIRMOZ/YORFiA9md5n66evVLqtQzUBDFBf
         TuwIUhAu2xrIqG/juGfxYx86GTQv/WhC5ExKHM7N31aRf4BfYtJTf/r0tIM9SCegmL+c
         0I8KInpLB738XUwtprE7sdfYrSJYa2RwXF3xoTPKfIuZqzfsNdkabvEGjzlgOVKuujz5
         h1Lv5k5CzRwuEtnxQ3eNdTTjZyvsXR+NtBeCt0bY5eJYgbR7Abd3WA725hb8cEwHDYa3
         UtLp6qcfLPLZjcSsRt+/ZVhxKvSUEh9pt1sCVnTZnYzjYoEI83kU0S2QPpmrsuG0wOZ4
         r/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x9P0ARZQUhh8qaVhxMVo4IrurvxIp6GGJ19YxV7H/2A=;
        b=UbUBTw44JtDSfdWs6LbIZ/2ChK1hMpoIwWSRO6ygeY8mJ675+bfD9KJFHZxVfrdCTS
         yRyy7jmUIFeSJ6vR1djyWJJZ2H5dDePtfSawpWF+o7iiw+W8I3exoKpFPXhlPoVfSgVH
         jbig+WD6RjwgSgugp9koCvVPirmUphhBFVTPkF+zYd75NI9o0MphUcgQA8fEk81FeODC
         g0eU3vBNbYccShrt4iW1zGtxAIiu8ubDpiBSY32GhyyixEQkw8NGTg4ZnX6knY79zkwc
         47A1cq68+R9Y3yRUoii0FB7HhOMgELHHtt7+vETBld5l41Lsh3qea3Zn4qn+cm55TFYT
         0quA==
X-Gm-Message-State: AOAM531VxBNOLBnEuNWXiAbVpDLyJvm7Qx3Dtq0NkOBoY0Aw825N7D8e
	smMnsVt+dZUX2JS/FqBr25cazAeut+0=
X-Google-Smtp-Source: ABdhPJzLKmmZeu/NeaSayeATSWUrgPWjK0wC6u3QwnnyuK/vN+sPhp6q+R7Lv3r2uY1E/B766SeQzA==
X-Received: by 2002:a1c:9802:: with SMTP id a2mr22864198wme.64.1592915037745;
        Tue, 23 Jun 2020 05:23:57 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from localhost.localdomain (dslb-002-205-007-033.002.205.pools.vodafone-ip.de. [2.205.7.33])
        by smtp.gmail.com with ESMTPSA id x14sm22334490wrt.60.2020.06.23.05.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 05:23:57 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-java][PATCH] icedtea7-native: set unique download file names
Date: Tue, 23 Jun 2020 14:23:41 +0200
Message-Id: <20200623122341.34613-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 recipes-core/icedtea/icedtea7-native.inc      | 14 +++----
 .../icedtea/openjdk-7-release-03b147.inc      | 40 +++++++++++--------
 2 files changed, 31 insertions(+), 23 deletions(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index b0b9419..70738e7 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -83,13 +83,13 @@ EXTRA_OECONF = "\
 	--with-javac=${STAGING_BINDIR_NATIVE}/javac \
 	--with-rhino=${STAGING_DATADIR_NATIVE}/java/rhino.jar \
 	\
-	--with-openjdk-src-zip=${DL_DIR}/${OPENJDK_FILE} \
-        --with-hotspot-src-zip=${DL_DIR}/${HOTSPOT_FILE} \
-        --with-corba-src-zip=${DL_DIR}/${CORBA_FILE} \
-        --with-jaxp-src-zip=${DL_DIR}/${JAXP_FILE} \
-        --with-jaxws-src-zip=${DL_DIR}/${JAXWS_FILE} \
-        --with-jdk-src-zip=${DL_DIR}/${JDK_FILE} \
-        --with-langtools-src-zip=${DL_DIR}/${LANGTOOLS_FILE} \
+	--with-openjdk-src-zip=${DL_DIR}/${OPENJDK_FILE_DOWNLOAD} \
+        --with-hotspot-src-zip=${DL_DIR}/${HOTSPOT_FILE_DOWNLOAD} \
+        --with-corba-src-zip=${DL_DIR}/${CORBA_FILE_DOWNLOAD} \
+        --with-jaxp-src-zip=${DL_DIR}/${JAXP_FILE_DOWNLOAD} \
+        --with-jaxws-src-zip=${DL_DIR}/${JAXWS_FILE_DOWNLOAD} \
+        --with-jdk-src-zip=${DL_DIR}/${JDK_FILE_DOWNLOAD} \
+        --with-langtools-src-zip=${DL_DIR}/${LANGTOOLS_FILE_DOWNLOAD} \
         ac_cv_path_UNZIP_BIN="${STAGING_BINDIR_NATIVE}/unzip" \
   "
 
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 9816c0c..b504667 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -13,50 +13,58 @@ ICEDTEA_PREFIX = "icedtea7-forest-2.1"
 ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
 
 OPENJDK_CHANGESET = "22cc03983e20"
-OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
-OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
+OPENJDK_FILE_UPSTREAM = "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_FILE_DOWNLOAD = "openjdk-${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE_UPSTREAM};name=openjdk;unpack=false;downloadfilename=${OPENJDK_FILE_DOWNLOAD}"
 SRC_URI[openjdk.md5sum] = "f98b0f7a69f9427a5b3775dddddc89cb"
 SRC_URI[openjdk.sha256sum] = "758227833982371e3a94def84226a947f8dbbd176517f313b8cb96840bdea41e"
 
 HOTSPOT_CHANGESET = "8b7c4c5f6ba9"
-HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.gz"
-HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+HOTSPOT_FILE_UPSTREAM = "${HOTSPOT_CHANGESET}.tar.gz"
+HOTSPOT_FILE_DOWNLOAD = "hotspot-${HOTSPOT_CHANGESET}.tar.gz"
+HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE_UPSTREAM};name=hotspot;unpack=false;downloadfilename=${HOTSPOT_FILE_DOWNLOAD}"
 SRC_URI[hotspot.md5sum] = "cb45a8f19d77acc1f4f48e75e36a27fe"
 SRC_URI[hotspot.sha256sum] = "22866990d143e76ced94b76defa3051e5e5d9a51fd272d63daa0df272d6406a2"
 
 CORBA_CHANGESET = "5617f6c5cc94"
-CORBA_FILE = "${CORBA_CHANGESET}.tar.gz"
-CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
+CORBA_FILE_UPSTREAM = "${CORBA_CHANGESET}.tar.gz"
+CORBA_FILE_DOWNLOAD = "corba-${CORBA_CHANGESET}.tar.gz"
+CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE_UPSTREAM};name=corba;unpack=false;downloadfilename=${CORBA_FILE_DOWNLOAD}"
 SRC_URI[corba.md5sum] = "920f1a788a7fdef29a5cd70892331251"
 SRC_URI[corba.sha256sum] = "963915483530f311ff313635f79ed11ea7ce5a1c0dbee5d1acb1994132857fa3"
 
 JAXP_CHANGESET = "7a8825b15df6"
-JAXP_FILE = "${JAXP_CHANGESET}.tar.gz"
-JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
+JAXP_FILE_UPSTREAM = "${JAXP_CHANGESET}.tar.gz"
+JAXP_FILE_DOWNLOAD = "jaxp-${JAXP_CHANGESET}.tar.gz"
+JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE_UPSTREAM};name=jaxp;unpack=false;downloadfilename=${JAXP_FILE_DOWNLOAD}"
 SRC_URI[jaxp.md5sum] = "a0982b6df79739127871e355a40ca5a6"
 SRC_URI[jaxp.sha256sum] = "297c8dbeed5afa5395b6be06b17282d53f8a888c2909074dfc1605afc0daf1c2"
 
 JAXWS_CHANGESET = "7edfbfe974f2"
-JAXWS_FILE = "${JAXWS_CHANGESET}.tar.gz"
-JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
+JAXWS_FILE_UPSTREAM = "${JAXWS_CHANGESET}.tar.gz"
+JAXWS_FILE_DOWNLOAD = "jaxws-${JAXWS_CHANGESET}.tar.gz"
+JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE_UPSTREAM};name=jaxws;unpack=false;downloadfilename=${JAXWS_FILE_DOWNLOAD}"
 SRC_URI[jaxws.md5sum] = "2deecec809ea8e38835678889c2bc3ac"
 SRC_URI[jaxws.sha256sum] = "823ca6b8fd780bf1b1565a90cfc8ec6f0ee422a5d25ffb20b1ce0272dc4955aa"
 
 JDK_CHANGESET = "d5ddeffc4651"
-JDK_FILE = "${JDK_CHANGESET}.tar.gz"
-JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
+JDK_FILE_UPSTREAM = "${JDK_CHANGESET}.tar.gz"
+JDK_FILE_DOWNLOAD = "jdk-${JDK_CHANGESET}.tar.gz"
+JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE_UPSTREAM};name=jdk;unpack=false;downloadfilename=${JDK_FILE_DOWNLOAD}"
 SRC_URI[jdk.md5sum] = "27c28d6be213df818490e69f12efe475"
 SRC_URI[jdk.sha256sum] = "e83e6234842376147a4c32451f23d629ba107e908ebdb0f367657f9cc6c1be98"
 
 LANGTOOLS_CHANGESET = "b534c4c6cd9b"
-LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.gz"
-LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
+LANGTOOLS_FILE_UPSTREAM = "${LANGTOOLS_CHANGESET}.tar.gz"
+LANGTOOLS_FILE_DOWNLOAD = "langtools-${LANGTOOLS_CHANGESET}.tar.gz"
+LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE_UPSTREAM};name=langtools;unpack=false;downloadfilename=${LANGTOOLS_FILE_DOWNLOAD}"
 SRC_URI[langtools.md5sum] = "16b72f3fea8ac4e5b50de693e87f9c53"
 SRC_URI[langtools.sha256sum] = "c77dd42d83f06d18fa8aa65c93d137608a2e02cf24b68fc10d7b1c0bcc12a93c"
 
 CACAO_VERSION = "a567bcb7f589"
-CACAO_FILE = "${CACAO_VERSION}.tar.gz"
-CACAO_URI = "http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_FILE};name=cacao;unpack=false"
+CACAO_FILE_UPSTREAM = "${CACAO_VERSION}.tar.gz"
+CACAO_FILE_DOWNLOAD = "cacao-${CACAO_VERSION}.tar.gz"
+CACAO_URI = "http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_FILE_UPSTREAM};name=cacao;unpack=false;downloadfilename=${CACAO_FILE_DOWNLOAD}"
 SRC_URI[cacao.md5sum] = "ec1def7f0d3d25e9e7da47c480f26a73"
 SRC_URI[cacao.sha256sum] = "d49f79debc131a5694cae6ab3ba2864e7f3249ee8d9dc09aae8afdd4dc6b09f9"
 
-- 
2.25.1

