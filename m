Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21F9C5472C
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 22:45:58 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.22629.1724539549388920002
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Aug 2024 15:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBweGEzq;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71434174201so2633709b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 15:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724539548; x=1725144348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5DiUY7hP5h3OlZzphYwZYLfpmBIBdCkLoaE8qL8Fbo=;
        b=MBweGEzqpbZ+MkqekfoyNtmMrPgPQkGk9CYXIoaJvIijMs7IHEVYdYnxF6hiz78jGQ
         9la26a27SthTVaWd0K1I7tucedY3MAK9in0sadIurszj7FrSFTBpWDaoTeJyXBHczmuC
         56+VVPXDVpXSja+EEixZVCVvSqzN6XXPmjlD7pKE2C0v4Dz2M5RagC8yLNPdFGs7o0Zb
         oifwr8wS7VRSlmvheZSgNsMaNu02b8rrqPdVamHOArPySEgRe7O5eDbusp0nqI+kGiZA
         hdjnqGoHO/7cp4vYsvCdSXmdTMD8BV0XaTBa1I5csucb3yixmkJzTcVGIdmNjy0r2hNE
         mZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724539548; x=1725144348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5DiUY7hP5h3OlZzphYwZYLfpmBIBdCkLoaE8qL8Fbo=;
        b=Klt50twYuAJrZQkBFXkrQQ+zJNJyDa8pVd9NyrhtGDhU+GyI6f3WXk7ePdfFvYbRaV
         Aq/sQ1IrUGsn5Zo5lDV8PpZBDA7FHAaFrGF2uit01WfV2TYW8OUbBJIHQhfxDmLI6GXt
         TEykWxhDQkXeC2JwTwtgJ/s+k9iHLQQ/Sov8wI2YudXw4IXIFjAs1f+tsawCNOlLp1kn
         ZoGiJVtWB0YVYhFWzJoi0uZd1wynGn0z/QM8J1YpI3508Q4G4XcTvRiP6LB1kESsf0UP
         rJTNULV2M9F0Tv+Vwtj8gTkmtEyCAcEtAOjJrifRIVZZye7HPdvWNvLdU66/28K8cyNW
         hECA==
X-Gm-Message-State: AOJu0YwU+BejEGtyWqhzuixx7jJtzm48vg1BR9xRm8dF2/wXOoPxbE3t
	z406p8dakss3jeOelPcTQ/zcVq/nPj/K9KTAelvJFeiysXjjrNrcaLW3sQ==
X-Google-Smtp-Source: AGHT+IEUWdPMAU4siqiOLK75WT5Rwkg38Q2SgFf+k/BhKsslZ+tJEerV4J523k3tSaSl55ems8q5TQ==
X-Received: by 2002:a05:6a00:1794:b0:70d:2a5d:867f with SMTP id d2e1a72fcca58-7144584edc7mr8434573b3a.21.1724539548269;
        Sat, 24 Aug 2024 15:45:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343388a1sm4914817b3a.184.2024.08.24.15.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 15:45:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] raptor2: Do not use curl-config to detect curl
Date: Sat, 24 Aug 2024 15:45:42 -0700
Message-ID: <20240824224545.1944956-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 22:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111922

it fails in cross build environment, use pkg-config instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../raptor-2.0.16-dont_use_curl-config.patch  | 73 +++++++++++++++++++
 .../recipes-support/raptor2/raptor2_2.0.16.bb |  6 +-
 2 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/raptor-2.0.16-dont_use_curl-config.patch

diff --git a/meta-oe/recipes-support/raptor2/raptor2/raptor-2.0.16-dont_use_curl-config.patch b/meta-oe/recipes-support/raptor2/raptor2/raptor-2.0.16-dont_use_curl-config.patch
new file mode 100644
index 0000000000..b12beff6cb
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/raptor2/raptor-2.0.16-dont_use_curl-config.patch
@@ -0,0 +1,73 @@
+Do not use curl-config
+
+Sourced from
+https://bugs.gentoo.org/552474
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/configure.ac
++++ b/configure.ac
+@@ -596,49 +596,12 @@ else
+   PKG_CHECK_MODULES([XSLT], [libxslt > $libxslt_min_version], [have_libxslt=1], [have_libxslt=0])
+ fi
+ 
+-dnl curl
+-AC_ARG_WITH(curl-config, [  --with-curl-config=PATH   Location of libcurl curl-config []], curl_config="$withval", curl_config="")
+-
+-if test "X$curl_config" != "Xno" ; then
+-  if test "X$curl_config" != "X" ; then
+-    AC_MSG_CHECKING(for $curl_config)
+-
+-    if test -f $curl_config ; then
+-      CURL_CONFIG=$curl_config
+-      AC_MSG_RESULT(yes)
+-    else
+-      AC_MSG_RESULT(no - searching PATH)
+-    fi
+-  fi
+-  if test "X$CURL_CONFIG" = "X" ; then
+-    AC_CHECK_PROGS(CURL_CONFIG, curl-config)
+-  fi
+-fi
+-
+ libcurl_source=no
+-if test "X$CURL_CONFIG" != "X"; then
+-  LIBCURL_CFLAGS=`$CURL_CONFIG --cflags`
+-  LIBCURL_LIBS=`$CURL_CONFIG --libs`
+-
+-  CPPFLAGS="$LIBCURL_CFLAGS $CPPFLAGS"
+-  LIBS="$LIBS $LIBCURL_LIBS"
+-  AC_CHECK_HEADER(curl/curl.h)
+-  AC_CHECK_FUNC(curl_easy_init, have_curl_easy_init=yes, have_curl_easy_init=no)
+-
+-  AC_MSG_CHECKING(for libcurl via curl-config)
+-  if test $have_curl_easy_init = yes; then
+-    libcurl_source="curl-config"
+-    LIBCURL_VERSION=`$CURL_CONFIG --version | sed -e 's/^libcurl *//'`
+-  fi
+-  CPPFLAGS="$oCPPFLAGS"
+-  LIBS="$oLIBS"
+-else
+-  PKG_CHECK_MODULES([LIBCURL],[libcurl],[
+-    LIBCURL_VERSION=`$PKG_CONFIG libcurl --modversion`
+-    libcurl_source="pkg-config"
+-  ], [:])
+-  AC_MSG_CHECKING(for libcurl via pkg-config)
+-fi
++PKG_CHECK_MODULES([LIBCURL],[libcurl],[
++  LIBCURL_VERSION=`$PKG_CONFIG libcurl --modversion`
++  libcurl_source="pkg-config"
++], [:])
++AC_MSG_CHECKING(for libcurl via pkg-config)
+ 
+ if test "$libcurl_source" = "no"; then
+   AC_MSG_RESULT(no - not found)
+@@ -1033,7 +996,7 @@ need_libcurl=0
+ need_libxml_www=0
+ need_libfetch=0
+ 
+-if test "X$CURL_CONFIG" != X; then
++if test "$libcurl_source" != "no"; then
+   CPPFLAGS="$CPPFLAGS $LIBCURL_CFLAGS"
+   LIBS="$LIBS $LIBCURL_LIBS"
+   AC_CHECK_HEADER(curl/curl.h)
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
index 85012bcfb3..7014a28c02 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
@@ -7,18 +7,18 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
-DEPENDS = "libxml2 libxslt curl yajl"
+DEPENDS = "bison-native flex-native libxml2 libxslt curl yajl"
 
 SRC_URI = " \
     http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
     file://0001-Remove-the-access-to-entities-checked-private-symbol.patch \
+    file://raptor-2.0.16-dont_use_curl-config.patch \
 "
 SRC_URI[sha256sum] = "089db78d7ac982354bdbf39d973baf09581e6904ac4c92a98c5caadb3de44680"
 
-inherit autotools pkgconfig gtk-doc
+inherit autotools pkgconfig gtk-doc perlnative
 
 EXTRA_OECONF = " \
     --without-xml2-config \
-    --without-curl-config \
     --without-xslt-config \
 "

