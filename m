Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.4628.1594242058017106646
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FI1XSdHR;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: philip.balister@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id e12so28165qtr.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2020 14:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=9VgIKLrWvkO9wWkdgjPOSJXd6TEkZyJYGk1mSx7R7Bg=;
        b=FI1XSdHRLdf8yYcSHcYy5N4+FkMOkL8gIdEFn+ZOFwh1DWrCu0bIJ6bNQrsjFXrEbS
         3J9lefZxqyxh49Mq6wjvQwhS/O5YecqFAaBoSIPK5OBvUFIly1T3VcUmgpHRNZiWMY9y
         JQFx/QTbs8ab5Hc05KQgzfGukBVd4L0EREl9Q8OHRwUfeLUvaXHRk6A5CE84eRbahdR7
         ijAkU10Q4sYge85cHTvfp+/h/ACFr8qq6FtWNaA1g56UxSmI4iikL/aTh79oIro/WB2u
         1WzlvqPAXqOg+I5Mwdcyg6JmQSH0KMB1p5Sxz+BesYCyHvoKdR+24eL7lVCtknrI1mnm
         JTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=9VgIKLrWvkO9wWkdgjPOSJXd6TEkZyJYGk1mSx7R7Bg=;
        b=HSWgeiLP1xb5xbEbeNuDoxsAqLiry6O/2IG45NP7d9jxQcKyQB80i/PpvzJHGzzFa8
         mZ3LywPj4N/+j5VJRgwWfrKdDtVZU7nH1ssjcu+UM1QQFpuJUbr5dUqzgA645PLGmtT2
         ElGFvDvk431AKtjLcWyczbAAjxjfC1UlExdLrr6mjYGm1853/Hg6uEbb1Eft6wNgE1i5
         udXmG00K017vQHIRKRzvSefKscS0t3OVITVA6lQczbGgtnGHD9EuTjRw7VXWB8TP5Nfw
         kFSP3bGtYqvw3n6YIqvS8ip72AyfQ7ma0nlSaqK/2AblTiLRXKIQlOLv9g01bwFvjVuZ
         y0Eg==
X-Gm-Message-State: AOAM531WaDhd2p9ARtM6vXNbPj98rC9C+lBuE1eMl5mMPeVuKQP5+mYt
	BgNgbmQF31scPSM8/51k5vY+o+8yhX4=
X-Google-Smtp-Source: ABdhPJxDfq3hXX2XmnnRn5zXwOdsR8LDxPNFlL+GaIxVaZ/60xwGgiK4tkuGO/9gYhAxCOlSH6nUjA==
X-Received: by 2002:ac8:518b:: with SMTP id c11mr60547904qtn.195.1594242056651;
        Wed, 08 Jul 2020 14:00:56 -0700 (PDT)
Return-Path: <philip.balister@gmail.com>
Received: from prague.hsd1.va.comcast.net ([2601:5c0:c100:b84:c110:9e9e:8241:dfa])
        by smtp.gmail.com with ESMTPSA id 2sm1147673qka.42.2020.07.08.14.00.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 14:00:55 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: "Philip Balister" <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [meta-python][PATCH] python3-pybind11: Use cmake to build and add -native version
Date: Wed,  8 Jul 2020 17:00:48 -0400
Message-Id: <20200708210048.7409-1-philip@balister.org>
X-Mailer: git-send-email 2.13.6

 * Switch to git repo to pick up cmake files for recipes to use
 * Use cmake to build innstead of pypi so cmake files are included in sysroot
 * Disable tests to prevent configure failure (I tried adding pytest asa DEPEND)
 * Patch out cmake that strips output to prevent QA failures
 * With this I can build gnuradio using pybind11.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../0001-Do-not-strip-binaries.patch               | 39 ++++++++++++++++++++++
 .../python/python3-pybind11_2.5.0.bb               | 15 +++++++--
 2 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
new file mode 100644
index 000000000..07ab9a03b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
@@ -0,0 +1,39 @@
+From 918f3ef01c7a67f3beb67307966698474f144581 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@balister.org>
+Date: Wed, 8 Jul 2020 09:41:43 -0400
+Subject: [PATCH] Do not strip binaries.
+
+ * OpenEmbedded strips them after creating debug packages.
+
+Signed-off-by: Philip Balister <philip@balister.org>
+---
+ tools/pybind11Tools.cmake | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
+index a3603ab..b4c8f63 100644
+--- a/tools/pybind11Tools.cmake
++++ b/tools/pybind11Tools.cmake
+@@ -230,19 +230,6 @@ function(pybind11_add_module target_name)
+ 
+   _pybind11_add_lto_flags(${target_name} ${ARG_THIN_LTO})
+ 
+-  if (NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
+-    # Strip unnecessary sections of the binary on Linux/Mac OS
+-    if(CMAKE_STRIP)
+-      if(APPLE)
+-        add_custom_command(TARGET ${target_name} POST_BUILD
+-                           COMMAND ${CMAKE_STRIP} -x $<TARGET_FILE:${target_name}>)
+-      else()
+-        add_custom_command(TARGET ${target_name} POST_BUILD
+-                           COMMAND ${CMAKE_STRIP} $<TARGET_FILE:${target_name}>)
+-      endif()
+-    endif()
+-  endif()
+-
+   if(MSVC)
+     # /MP enables multithreaded builds (relevant when there are many files), /bigobj is
+     # needed for bigger binding projects due to the limit to 64k addressable sections
+-- 
+2.25.4
+
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index dc3b8f6ad..7dcf71e13 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -3,7 +3,16 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
 
-SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
-SRC_URI[sha256sum] = "ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
+DEPENDS = "boost"
 
-inherit pypi setuptools3
+SRC_URI = "git://github.com/pybind/pybind11.git \
+           file://0001-Do-not-strip-binaries.patch"
+SRCREV = "3b1dbebabc801c9cf6f0953a4c20b904d444f879"
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
+
+EXTRA_OECMAKE =  "-DPYBIND11_TEST=OFF"
+
+inherit cmake python3native
-- 
2.13.6

