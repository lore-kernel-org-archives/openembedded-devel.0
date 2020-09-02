Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.1283.1599086335750454421
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 15:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QHTXcAcH;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id b16so503367pjp.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 15:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uTcT4aFP2hhEGs90DBbyDDdO9Nmtai8atcI3WG4l38c=;
        b=QHTXcAcHZhackIvil2/oJGLA0Ai2hNGJwBO9T9+rByVonaeShYKSIRsoIN5Yv+rICO
         LO1MHxd6LemKauQd085HldccPYWRKkiULyse5JsNOvkGKywRF+yPwbPxT+nJkT4CtkJs
         r1P/3WgeBTWZdu/A9k3QIOf/W1BecXeR83a1AZw6bNfK9wYaJcS/blflxKDbwhnCkRFX
         Hd3nKXNL5ICLz4dZmpoIp34ONERhRxpXS5nNEWNoIxHe60SG5STlkxt4+58iQe/s4W96
         X5HJfYTr7L5yYUteCC+kNp04Ya1TXxhkk/bucHdIrpts7ZGsu11+x+MqB/vgHP/7ZVXP
         Og6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uTcT4aFP2hhEGs90DBbyDDdO9Nmtai8atcI3WG4l38c=;
        b=O0figSckduE9FCiTjRO5bumFQaHMbYhLe8aayuIbfKLcVftcZQf3np5nnvqDky1BOG
         RFnAiA2fGSxZZH7FnRaa+5X9nOqP3eDbosU52S2KGHLLRqri882BG0jwBpxe1znpBwG+
         5GQ8j+7exhVgdbXF0M/oKAtWKdDo4AR2dgYyh/3JMQWQriri7tK7SKLbR0fv0VxBlbnF
         2qojiUpTvrMeUQgnBKtT4/v3i3s+WvDkoAlXxb3jtyAX4+e7NImnYg2x+2mWiGUpWWQT
         MWkkAjYuIBueXQ7TseL/DoRx6OD0u9Jf/OuEqJyn7Cl/sJs2id12JrPluYAMzOjQGxay
         21fA==
X-Gm-Message-State: AOAM5325nrltPcQea4QTAxfTCLNTFpoUekjUpTQMYF7yPSxq9pTr1h/w
	HT9hfykmoAhNvQI328v0yyyeHYwAHd09qA==
X-Google-Smtp-Source: ABdhPJwH4rYfkWk2Gj+nNL/y6V7jVEZQeJnocgpv8b02m41Aj78liH2qigGF5y+M5wi+seVhVDji9w==
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr4193494pjb.87.1599086334528;
        Wed, 02 Sep 2020 15:38:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id r123sm552256pfc.187.2020.09.02.15.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 15:38:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 1/5] packagegroup-meta-perl: Update to represent latest recipes
Date: Wed,  2 Sep 2020 15:38:48 -0700
Message-Id: <20200902223852.3467735-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add packagegroup-meta-perl-ptest to PROVIDES

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-perl.bb   | 102 +++++++++++++-----
 1 file changed, 76 insertions(+), 26 deletions(-)

diff --git a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
index 9b2406ba61..3fa56d4390 100644
--- a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
+++ b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
@@ -3,40 +3,87 @@ SUMMARY = "Meta-perl packagegroup"
 inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
-PACKAGES = ' \
+PACKAGES = "\
     packagegroup-meta-perl \
     packagegroup-meta-perl-extended \
-'
+    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-perl-ptest-packages", "", d)} \
+"
 
 RDEPENDS_packagegroup-meta-perl = "\
-    libproc-waitstat-perl libmoo-perl libterm-readkey-perl \
-    libunicode-linebreak-perl libcurses-perl libmime-types-perl \
-    libmime-charset-perl libio-socket-ssl-perl libio-stringy-perl \
-    libtext-iconv-perl libtext-charwidth-perl libtext-diff-perl \
-    libtext-wrapi18n-perl liblocale-gettext-perl libdata-hexdump-perl \
-    libextutils-installpaths-perl libextutils-helpers-perl libextutils-parsexs-perl \
-    libextutils-config-perl libextutils-cppguess-perl libimport-into-perl \
-    libcrypt-openssl-rsa-perl libcrypt-openssl-guess-perl libcrypt-openssl-random-perl \
-    libxml-sax-writer-perl libxml-libxml-perl libxml-filter-buffertext-perl \
     adduser \
-    libauthen-sasl-perl libnet-ldap-perl libnet-dns-perl \
-    libnet-dns-sec-perl libnet-libidn-perl libnet-ssleay-perl \
-    libnet-telnet-perl libdevel-globaldestruction-perl libipc-signal-perl \
-    librole-tiny-perl libencode-perl libencode-locale-perl \
-    libfile-slurp-perl libcapture-tiny-perl \
+    libalgorithm-diff-perl \
+    libauthen-sasl-perl \
+    libauthen-radius-perl \
+    libcapture-tiny-perl \
+    libcgi-perl \
+    libdbd-sqlite-perl \
+    libclass-method-modifiers-perl \
+    libdigest-hmac-perl \
+    libdigest-sha1-perl \
+    libconfig-autoconf-perl \
+    libcrypt-openssl-guess-perl \
+    libcrypt-openssl-random-perl \
+    libcrypt-openssl-rsa-perl \
+    libhtml-parser-perl \
+    libhtml-tree-perl \
+    libhtml-tagset-perl \
+    libimport-into-perl \
+    libio-socket-ssl-perl \
+    libio-stringy-perl \
+    libipc-signal-perl \
+    libcurses-perl \
+    libmime-charset-perl \
+    libmime-types-perl \
+    libmodule-pluggable-perl \
+    libmodule-runtime-perl \
+    libmodule-build-tiny-perl \
+    libdata-hexdump-perl \
+    libnet-dns-perl \
+    libnet-libidn-perl \
+    libnet-dns-sec-perl \
+    libnet-ldap-perl \
+    libnet-ssleay-perl \
+    libnet-telnet-perl \
+    libproc-waitstat-perl \
+    libdevel-globaldestruction-perl \
+    libenv-perl \
+    libfile-slurp-perl \
+    libfile-slurper-perl \
+    libtext-iconv-perl \
+    libtext-diff-perl \
+    libtext-charwidth-perl \
+    libtext-wrapi18n-perl \
+    libxml-libxml-perl \
+    libxml-filter-buffertext-perl \
+    libxml-sax-writer-perl \
+    libextutils-config-perl \
+    libextutils-cppguess-perl \
+    libextutils-helpers-perl \
+    libextutils-installpaths-perl \
+    libextutils-parsexs-perl \
+    liblocale-gettext-perl \
+    libmoo-perl \
+    librole-tiny-perl \
+    libunix-statgrab \
+    libstrictures-perl \
+    libsub-exporter-progressive-perl \
+    libsub-uplevel-perl \
+    libterm-readkey-perl \
+    libtest-deep-perl \
+    libtest-harness-perl \
+    libtest-nowarnings-perl \
+    libtest-warn-perl \
+    libtest-warnings-perl \
+    libunicode-linebreak-perl \
     po4a \
-    libstrictures-perl libtest-harness-perl libsub-exporter-progressive-perl \
-    libclass-method-modifiers-perl libhtml-parser-perl libhtml-tree-perl \
-    libmodule-pluggable-perl libmodule-build-perl libmodule-runtime-perl \
-    libmodule-build-tiny-perl libcgi-perl libalgorithm-diff-perl \
-    libdbd-sqlite-perl libdigest-sha1-perl libdigest-hmac-perl \
-    " 
+"
 
 RDEPENDS_packagegroup-meta-perl-extended = "\
-    logcheck mime-construct \
-    "
+    logcheck \
+    mime-construct \
+"
 
-RDEPENDS_packagegroup-meta-perl-ptest = "\
+RDEPENDS_packagegroup-meta-perl-ptest-packages = "\
     libmime-types-perl-ptest \
     libio-socket-ssl-perl-ptest \
     libdata-hexdump-perl-ptest \
@@ -47,6 +94,9 @@ RDEPENDS_packagegroup-meta-perl-ptest = "\
     libtest-harness-perl-ptest \
     libdigest-sha1-perl-ptest \
     libdigest-hmac-perl-ptest \
-    "
+"
 
 EXCLUDE_FROM_WORLD = "1"
+
+# perl-module-encode is preferred over libencode-perl
+# libencode-locale-perl depends on libencode-perl
-- 
2.28.0

