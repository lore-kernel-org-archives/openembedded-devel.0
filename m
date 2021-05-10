Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1430.1620671049706532576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 11:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xt0Bz+G4;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id r11so4998835edt.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 11:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8+wcLUMXTpWh+9UMEKBThjJjizU+0AelcJ3AapNBigw=;
        b=Xt0Bz+G4ns6Zfj38riCs+Fz/GZ4o7XDIPA6Io9DiAPIKqlo8gsWNfFovEQlSAVCT83
         KVaGA8ix3ziFE7yglyrw5cr2ue9Gri2m1+yCDsJiU+4DKJGtz3R+XLpG9OLz8IzJPwOx
         hzK4OnR5242tnmdl2W8q8n8UuM7o2je84f+CTuimNQs35/TWYk/qRzY59DHLdHLtRa+6
         EVZ67bTxKd+u2A3F0XZCqHRD0+JgOZNK+W9w4vfuPPIbzGmrcTHpKDxa/xzglSIlZhIT
         dJssVTbfrF8blT3y6X0dQK4hYMyDOP1BDZrSOWyi45MS2hPrHwcL3azq6+PiPPOx3jlv
         cB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8+wcLUMXTpWh+9UMEKBThjJjizU+0AelcJ3AapNBigw=;
        b=PMkgx3SB+YtjceBjWW/ak74XOYtBSPrNV4Y56u1wOVuh16LboI3arr3Jcyd1/WCsha
         EQtBt2/jnHZJ904WfHe9sMU2A9GF+MgDR18h/YDtwy/8phk7tEfu30Uza4T8ZlLtnw1X
         wJRR1fH90kR0HYYaWK0xgAh+gv/r2dWFBS/vXw4rMosTNSykWtEZvr1nR/b1oplU4MhT
         zT2b7J3Fkiha6xUzRDZqhbdHOKSJA+dwdbzbMtOgVvt3q0MKVrS/J0NnLPHuh7fP1zU+
         jkpohB2XW/MQff6SH/+O/iqoTRPJ/BQDGM+xHlmRNil+Fcp9W+BeC7reGIqYLlLZJcA0
         /tUg==
X-Gm-Message-State: AOAM532GtpQYPKbtGxbfXIHwJyDqg3oqLyhsK2z7Hs9/nLvZGoAB9xlq
	SQzRN6vbKaQTD8h2olWOkCF/ZVSsOmg=
X-Google-Smtp-Source: ABdhPJzZqzsaYuQG4/yMqjwponV/m72HZJo2ONQ84NABQYMRgb51erayk+XMMVr3i2mzl3D3IpfB+A==
X-Received: by 2002:aa7:d594:: with SMTP id r20mr30532830edq.242.1620671047925;
        Mon, 10 May 2021 11:24:07 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f4fac346ac282ef7d435921.dip0.t-ipconnect.de. [2003:f0:7f4f:ac34:6ac2:82ef:7d43:5921])
        by smtp.gmail.com with ESMTPSA id da25sm12459325edb.38.2021.05.10.11.24.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 11:24:07 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] evolution-data-server: Backport upstream patch to fix configure on latest CMake
Date: Mon, 10 May 2021 20:23:59 +0200
Message-Id: <20210510182359.2753647-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server.bb                  |  1 +
 ....cmake-Correct-variable-name-compari.patch | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-PrintableOptions.cmake-Correct-variable-name-compari.patch

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index 7f267b497..e2d7f502b 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
     file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
     file://0004-call-native-helpers.patch \
     file://iconv-detect.h \
+    file://0005-PrintableOptions.cmake-Correct-variable-name-compari.patch \
 "
 
 LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-PrintableOptions.cmake-Correct-variable-name-compari.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-PrintableOptions.cmake-Correct-variable-name-compari.patch
new file mode 100644
index 000000000..d84b41d00
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-PrintableOptions.cmake-Correct-variable-name-compari.patch
@@ -0,0 +1,67 @@
+From c95a70bfeae25ba11fbe50fe759a6cdb29388e44 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Wed, 14 Apr 2021 16:58:08 +0200
+Subject: [PATCH] PrintableOptions.cmake: Correct variable name comparison
+
+CMake 3.20.1 errors out with:
+
+CMake Error at cmake/modules/PrintableOptions.cmake:38 (message):
+   variable name cannot be empty
+ Call Stack (most recent call first):
+   CMakeLists.txt:152 (add_printable_variable)
+
+Change how the parameter value is compared, to fix it.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/evolution-data-server/-/commit/c95a70bfeae25ba11fbe50fe759a6cdb29388e44]
+---
+ cmake/modules/PrintableOptions.cmake | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/cmake/modules/PrintableOptions.cmake b/cmake/modules/PrintableOptions.cmake
+index a79419a..c74531a 100644
+--- a/cmake/modules/PrintableOptions.cmake
++++ b/cmake/modules/PrintableOptions.cmake
+@@ -19,32 +19,32 @@
+ #    prints all the build options previously added with the above functions
+ 
+ macro(add_printable_variable_bare _name)
+-	if(_name STREQUAL "")
++	if("${_name}" STREQUAL "")
+ 		message(FATAL_ERROR "variable name cannot be empty")
+-	endif(_name STREQUAL "")
++	endif("${_name}" STREQUAL "")
+ 	list(APPEND _printable_options ${_name})
+ endmacro()
+ 
+ macro(add_printable_option _name _description _default_value)
+-	if(_name STREQUAL "")
++	if("${_name}" STREQUAL "")
+ 		message(FATAL_ERROR "option name cannot be empty")
+-	endif(_name STREQUAL "")
++	endif("${_name}" STREQUAL "")
+ 	option(${_name} ${_description} ${_default_value})
+ 	add_printable_variable_bare(${_name})
+ endmacro()
+ 
+ macro(add_printable_variable _name _description _default_value)
+-	if(_name STREQUAL "")
++	if("${_name}" STREQUAL "")
+ 		message(FATAL_ERROR "variable name cannot be empty")
+-	endif(_name STREQUAL "")
++	endif("${_name}" STREQUAL "")
+ 	set(${_name} ${_default_value} CACHE STRING ${_description})
+ 	add_printable_variable_bare(${_name})
+ endmacro()
+ 
+ macro(add_printable_variable_path _name _description _default_value)
+-	if(_name STREQUAL "")
++	if("${_name}" STREQUAL "")
+ 		message(FATAL_ERROR "path variable name cannot be empty")
+-	endif(_name STREQUAL "")
++	endif("${_name}" STREQUAL "")
+ 	set(${_name} ${_default_value} CACHE PATH ${_description})
+ 	add_printable_variable_bare(${_name})
+ endmacro()
+-- 
+2.30.2
+
-- 
2.30.2

