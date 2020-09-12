Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.15759.1599908126633267591
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 03:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iVqiwHp1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id r7so16761907ejs.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qeC+RwXwxwVDmc+fR7PhtWiOVjeZ+lOt9FtB8JP4mGU=;
        b=iVqiwHp1KbgRnKJAYohmIHq2eDqfJ23Jm0HJMfpNL4YPrVSNp2f2uak1XiDwnF/Ttx
         QmseHQGCzX4dflvwJ2c70tSX2LskEuiAxgt6M/wVtQDqjRmHvTOBNjbN16/2NzmqfoVf
         fu5XXRbVwk5jutUnXID5jq7vdWvm92ehCBZ52vkBqoE2Sejjxbu/ojnORJpxBX2zxmlT
         if05zKR9NgkNR5psIhO7q7D2uOtO7SiUn9R+mA+toRF35BjdRKp4KEK2wN7/8EOt2nj2
         rfgLbbPqa4aDGh5vjjc3b9CB1t4v55uAmi9WsVo4Zz04/tkMlFRaLeZdvmzkJuMta7TV
         80+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qeC+RwXwxwVDmc+fR7PhtWiOVjeZ+lOt9FtB8JP4mGU=;
        b=V+ZjrXmw6LsxccV8HkXSqvamlaSf95wT9FnFH74w1LkAgcv8CTnbCxlczhjauWwSdD
         u6r086tKuh44NaCYJjtylMRxxWAHq7KMmmz6eifCXRbIahg08op8IusPrxVtpFVEaUH/
         yvdZSNik7JO6lQsgXiLTEH0vb/ZlmUlzwibeUBappeKPEExI5cVjaowyFLxiw9+kK+Cj
         QREW0MR4YrIn7E1lNvGwweloez4CuKJFRRmanyZ4d1Eo39dk/OtG7KtuSH/XhSKrg9Qt
         dGjs8WqO4BoAtdTja5qF6aBUksjMze0aN4OnKAKf6ob+A6ZgvoYm9bp22GwLN1wb3MAx
         i9xQ==
X-Gm-Message-State: AOAM532x6vpmAuDyy1H5YEFUzGnLzgi/cjZCrcXwwUX7Vbi7WNCB5WiF
	w9teTmQYRyrb+uWfjBRHXvOmag+s/5Y=
X-Google-Smtp-Source: ABdhPJy54fciZkcVXZsiJvIlZ2nLFrEpSYecWv5m8lWyMxhL1DfFWxPXPbjLBVm5qFPufX6Ow2AS0w==
X-Received: by 2002:a17:906:9712:: with SMTP id k18mr5545954ejx.76.1599908124450;
        Sat, 12 Sep 2020 03:55:24 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d547e003a5d689f02ebc.dip0.t-ipconnect.de. [2003:f0:7f09:d547:e003:a5d6:89f0:2ebc])
        by smtp.gmail.com with ESMTPSA id n4sm2984650ejj.19.2020.09.12.03.55.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 03:55:23 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] Initial add source-code-pro-fonts 2.030_1.050
Date: Sat, 12 Sep 2020 12:55:13 +0200
Message-Id: <20200912105515.72222-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/conf/layer.conf                       |  1 +
 .../44-source-code-pro-fonts-fontconfig.conf  | 17 +++++++++++
 .../source-code-pro-fonts_2.030_1.050.bb      | 29 +++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts/44-source-code-pro-fonts-fontconfig.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 5178678da2..5b79b59b71 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -92,6 +92,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   source-han-sans-jp-fonts->fontconfig \
   source-han-sans-kr-fonts->fontconfig \
   source-han-sans-tw-fonts->fontconfig \
+  source-code-pro-fonts->fontconfig \
 "
 
 DEFAULT_TEST_SUITES_pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts/44-source-code-pro-fonts-fontconfig.conf b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts/44-source-code-pro-fonts-fontconfig.conf
new file mode 100644
index 0000000000..badb1b0115
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts/44-source-code-pro-fonts-fontconfig.conf
@@ -0,0 +1,17 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
+<fontconfig>
+  <alias>
+    <family>monospace</family>
+    <prefer>
+      <family>Source Code Pro</family>
+    </prefer>
+  </alias>
+  <alias>
+    <family>Source Code Pro</family>
+    <default>
+      <family>monospace</family>
+    </default>
+  </alias>
+</fontconfig>
+
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
new file mode 100644
index 0000000000..5d10195f73
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
@@ -0,0 +1,29 @@
+require ttf.inc
+
+SUMMARY = "Adobe Source Code Pro"
+HOMEPAGE = "https://github.com/adobe-fonts/source-code-pro"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c7c16bdc2c96af797293d68503e5c65c"
+
+inherit allarch fontcache
+
+SRC_URI = " \
+    https://github.com/adobe-fonts/source-code-pro/releases/download/2.030R-ro/1.050R-it/source-code-pro-2.030R-ro-1.050R-it.zip \
+    file://44-source-code-pro-fonts-fontconfig.conf \
+"
+SRC_URI[sha256sum] = "da2ac159497d31b0c6d9daa8fc390fb8252e75b4a9805ace6a2c9cccaed4932e"
+S = "${WORKDIR}/source-code-pro-2.030R-ro-1.050R-it"
+
+do_install() {
+    install -d ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${WORKDIR}/44-source-code-pro-fonts-fontconfig.conf ${D}${sysconfdir}/fonts/conf.d/
+
+    install -d ${D}${datadir}/fonts/truetype/
+    find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
+}
+
+FILES_${PN} = " \
+    ${sysconfdir}/fonts \
+    ${datadir}/fonts \
+"
+
-- 
2.26.2

