Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8F5C47255
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.218940.1704025419392636119
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HDXW+Mx8;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a235eb41251so911589866b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025418; x=1704630218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oqv/Ig/NzYgrUdbSZ1sM227QHOICZMxa+lo9GP3n3VA=;
        b=HDXW+Mx8XPAPRTBEaO3cIaZ+BrbHROi8MALI9Uxvc/OwgHa1cMvcg5mOPUZPMNNFPL
         4+KJeYgmDK43W6VhAKvXf6dtDDEETJPv0entWf0BQp0f8ZBxa1U89Anrp60B6TKVum0b
         nZ6+A1i5p6f/P98fXBN6BHDyN1FMj5hkV/vru4REaHY4kY/czAGH1pVIxJGAVyts8OLN
         FBvDxnC7md2LzAWMC+ZaVJvbtOYqqKfyH30vthNQLC7jC8Z59FPFsYovmZ7/w/AdVuF0
         iMCoObdROZ2FGNQI3w5+5O/KiamgdW+EXJBGSKILLppAur+oqjjIviKvYrkE9PcibxGC
         T0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025418; x=1704630218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oqv/Ig/NzYgrUdbSZ1sM227QHOICZMxa+lo9GP3n3VA=;
        b=fSFrAoFdkxm2aKo226hLwQoox2+g2IkumC809s/L3BKNPmkvzAlry6iPqDGMDWYzhs
         OlMbRRybCFOJ7yQoQGf2Mgw2ZGOT0WltN9ZsrU6UUcYq+bzaBr52OynhuSbqRN43c1/8
         L6RvO1rPbBRr3V1bSKMkAWgog13pJoe+PhfZPNrmtuOd/ie86zukvfemVxpxJgYAepeo
         L9IOP9wAk3xpvTSyirvayZ4jhhOmBIwQG3qzijVKhvFeFgS1wGcsZWCG9HOb6jVG4cXf
         HkJpYR33+zz1EQtI7+mTAOnP3E+ZwpUDKnVsL6+RZi6VIb9Iz1y/cDbDBfIgRiubyTcw
         BeiA==
X-Gm-Message-State: AOJu0Yxa/DdHouIwW9x/NsBfQnhv7hgWTAIaKskTSxFMcCEXFzXI2OIj
	kc3uFO9rTnYbhlF/EejCFP+KiayszEw=
X-Google-Smtp-Source: AGHT+IHduwP1SXYxBQUDCBV29z0v9bT3l4WVC4RDtfNmUOjvxNXqfVyxSEP56itDZ+e+BFQ1b+RDSQ==
X-Received: by 2002:a17:906:5a96:b0:a22:f592:9e46 with SMTP id l22-20020a1709065a9600b00a22f5929e46mr3598600ejq.228.1704025417834;
        Sun, 31 Dec 2023 04:23:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/23] cmpi-bindings: update 1.0.1 -> 1.0.4
Date: Sun, 31 Dec 2023 13:23:10 +0100
Message-Id: <20231231122329.405225-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107955

Drop several obsolete patches; either upstream fixed the issue or
there's a standard way to cross-build python items.

Add setuptools dependency as distutils is still needed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...BI-suffix-to-the-python-library-name.patch | 22 ----------
 .../cmpi-bindings/0001-Fix-error.patch        | 12 ++----
 .../cmpi-bindings/0001-Modify-cmakelist.patch | 41 -------------------
 ...-fix-the-build-error-when-python-3.0.patch | 33 ---------------
 .../cmpi-bindings-0.4.17-no-ruby-perl.patch   | 14 +++----
 .../cmpi-bindings-0.4.17-sblim-sigsegv.patch  | 18 +++++---
 .../cmpi-bindings-0.9.5-python-lib-dir.patch  | 17 --------
 ...ndings_1.0.1.bb => cmpi-bindings_1.0.4.bb} | 22 ++++------
 8 files changed, 30 insertions(+), 149 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
 delete mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch
 delete mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
 delete mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch
 rename meta-oe/recipes-extended/cmpi-bindings/{cmpi-bindings_1.0.1.bb => cmpi-bindings_1.0.4.bb} (61%)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
deleted file mode 100644
index fa029da2b..000000000
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From a701ed30ac1bc2f77d063c237d6ae040a2d53f6b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 16 May 2016 16:52:24 +0300
-Subject: [PATCH] Add 'm' suffix to the python library name.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- swig/python/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/swig/python/CMakeLists.txt
-+++ b/swig/python/CMakeLists.txt
-@@ -49,7 +49,7 @@ ADD_DEFINITIONS(-DCMPI_PLATFORM_LINUX_GE
- SET( NAME pyCmpiProvider )
- ADD_LIBRARY( ${NAME} SHARED ${SWIG_OUTPUT})
- #TARGET_LINK_LIBRARIES( ${NAME} ${PYTHON_LIBRARIES} )
--TARGET_LINK_LIBRARIES( ${NAME} python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION} )
-+TARGET_LINK_LIBRARIES( ${NAME} python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION}${PYTHON_ABI} )
- TARGET_LINK_LIBRARIES( ${NAME} pthread )
- TARGET_LINK_LIBRARIES( ${NAME} dl )
- TARGET_LINK_LIBRARIES( ${NAME} util )
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
index 1d8013be6..1f147d52f 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
@@ -1,20 +1,19 @@
-From b8e791ce93a467081fb1594b91841e2f57c634a0 Mon Sep 17 00:00:00 2001
+From 3ab3ac2876cbf4a34a94f0d3256a5be9d1202370 Mon Sep 17 00:00:00 2001
 From: Qian Lei <qianl.fnst@cn.fujitsu.com>
 Date: Fri, 16 Jan 2015 18:37:26 +0800
 Subject: [PATCH] Fix error
 
 Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
----
 Upstream-Status: Pending
-
+---
  swig/python/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/swig/python/CMakeLists.txt b/swig/python/CMakeLists.txt
-index 3976296..8073fc8 100644
+index 93b4755..a7268f0 100644
 --- a/swig/python/CMakeLists.txt
 +++ b/swig/python/CMakeLists.txt
-@@ -27,7 +27,7 @@ SET( SWIG_INPUT "${CMAKE_CURRENT_SOURCE_DIR}/../cmpi.i" )
+@@ -26,7 +26,7 @@ SET( SWIG_INPUT "${CMAKE_CURRENT_SOURCE_DIR}/../cmpi.i" )
  ADD_CUSTOM_COMMAND (
     OUTPUT  ${SWIG_OUTPUT}
     COMMAND ${CMAKE_COMMAND} -E echo_append "Creating wrapper code for Python ..."
@@ -23,6 +22,3 @@ index 3976296..8073fc8 100644
     COMMAND ${CMAKE_COMMAND} -E echo "Done."
     WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
     DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/../*.i
--- 
-1.8.3.1
-
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch
deleted file mode 100644
index 92e5e5662..000000000
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 070822507befe7c1b8bb1be2d36cb12141d03b8f Mon Sep 17 00:00:00 2001
-From: Qian Lei <qianl.fnst@cn.fujitsu.com>
-Date: Tue, 6 Jan 2015 18:38:32 +0800
-Subject: [PATCH] Change the install path in cmakelist
-
-Upstream-Status: Pending
-Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
----
- swig/python/CMakeLists.txt | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/swig/python/CMakeLists.txt b/swig/python/CMakeLists.txt
-index 3976296..93c87c1 100644
---- a/swig/python/CMakeLists.txt
-+++ b/swig/python/CMakeLists.txt
-@@ -56,18 +56,18 @@ TARGET_LINK_LIBRARIES( ${NAME} util )
- 
- INSTALL(TARGETS ${NAME} LIBRARY DESTINATION ${CMPI_LIBRARY_DIR})
- # .py: swig generated
--INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/cmpi.py DESTINATION ${PYTHON_SITE_DIR} )
-+INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/cmpi.py DESTINATION $ENV{ENV_INSTALL_PATH} )
- 
- 
- #
- # cmpi_pywbem_bindings.py: provider implementation
- #
--INSTALL(FILES cmpi_pywbem_bindings.py DESTINATION ${PYTHON_SITE_DIR} )
-+INSTALL(FILES cmpi_pywbem_bindings.py DESTINATION $ENV{ENV_INSTALL_PATH} )
- #INSTALL(FILES Py_UnixProcessProvider.py DESTINATION /usr/lib/pycim )
- 
--INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py_compile import compile; compile('\$ENV{DESTDIR}${PYTHON_SITE_DIR}/cmpi.py', dfile='${PYTHON_SITE_DIR}/cmpi.py')\")")
-+INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py_compile import compile; compile('\$ENV{DESTDIR}$ENV{ENV_INSTALL_PATH}/cmpi.py', dfile='\$ENV{ENV_INSTALL_PATH}/cmpi.py')\")")
- 
--INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py_compile import compile; compile('\$ENV{DESTDIR}${PYTHON_SITE_DIR}/cmpi_pywbem_bindings.py', dfile='${PYTHON_SITE_DIR}/cmpi_pywbem_bindings.py')\")")
-+INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py_compile import compile; compile('\$ENV{DESTDIR}$ENV{ENV_INSTALL_PATH}/cmpi_pywbem_bindings.py', dfile='$ENV{ENV_INSTALL_PATH}/cmpi_pywbem_bindings.py')\")")
- 
- 
- 
--- 
-1.8.3.1
-
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
deleted file mode 100644
index 5d5652a5f..000000000
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 323ced03a66e6cd963d8277b66cfcc7dce740be7 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Fri, 17 Jul 2015 01:33:43 -0700
-Subject: [PATCH] fix Xthe build error when python>3.0
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
-Upstream-Status: Pending
-
- src/target_python.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/target_python.c b/src/target_python.c
-index 90b43a1..2b76c9e 100644
---- a/src/target_python.c
-+++ b/src/target_python.c
-@@ -167,7 +167,12 @@ PyGlobalInitialize(const CMPIBroker* broker, CMPIStatus* st)
-   
-   Py_SetProgramName("cmpi_swig");
-   Py_Initialize();
--  SWIGEXPORT void SWIG_init(void);
-+#if PY_VERSION_HEX >= 0x03000000
-+SWIGEXPORT PyObject*
-+#else
-+  SWIGEXPORT void 
-+#endif
-+  SWIG_init(void);
-   SWIG_init();
-   cmpiMainPyThreadState = PyGILState_GetThisThreadState();
-   PyEval_ReleaseThread(cmpiMainPyThreadState); 
--- 
-2.1.0
-
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
index 2072da72b..1f9e2394c 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
@@ -1,4 +1,4 @@
-From 7dd01e33f9dac75f177113de9a8ff458d4263a11 Mon Sep 17 00:00:00 2001
+From 0871fb048a48a02ec598c941e577f13d8d24f574 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Mon, 24 Aug 2015 11:00:13 +0900
 Subject: [PATCH] cmpi-bindings-0.4.17 no ruby perl
@@ -7,17 +7,18 @@ Port from Fedora20
 
 Upstream-Status: Pending
 Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+
 ---
  swig/CMakeLists.txt | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/swig/CMakeLists.txt b/swig/CMakeLists.txt
-index 8b5555c..c2655b9 100644
+index 00bf40c..d3cab38 100644
 --- a/swig/CMakeLists.txt
 +++ b/swig/CMakeLists.txt
-@@ -15,15 +15,15 @@ IF (PYTHON_LIBRARY)
-   ENDIF (PYTHON_LINK_LIBS)
- ENDIF (PYTHON_LIBRARY)
+@@ -49,15 +49,15 @@ ELSE (BUILD_PYTHON2)
+   MESSAGE(STATUS "*****")
+ ENDIF (BUILD_PYTHON3)
  
 -FIND_PACKAGE(Perl)
 -IF (PERL_EXECUTABLE)
@@ -42,6 +43,3 @@ index 8b5555c..c2655b9 100644
 +#  ADD_SUBDIRECTORY(ruby)
 +#  OPTION( BUILD_RUBY_GEM "Build Ruby GEM" YES )
 +#ENDIF (RUBY_LIBRARY AND RUBY_INCLUDE_PATH)
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch
index b99337204..04abd5e4b 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch
@@ -1,12 +1,20 @@
-Port from Fedora20
+From bc32342fa63b8359f985fe1e187e811455c96a50 Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Tue, 25 Aug 2015 13:19:51 +0800
+Subject: [PATCH] Port from Fedora20
 
 Upstream-Status: Pending
 Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
 
-diff -up cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py.orig cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py
---- cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py.orig	2012-03-01 17:05:31.878367281 +0100
-+++ cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py	2012-03-01 17:06:34.718110137 +0100
-@@ -350,10 +350,10 @@ class BrokerCIMOMHandle(object):
+---
+ swig/python/cmpi_pywbem_bindings.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/swig/python/cmpi_pywbem_bindings.py b/swig/python/cmpi_pywbem_bindings.py
+index d643990..7f0cc77 100644
+--- a/swig/python/cmpi_pywbem_bindings.py
++++ b/swig/python/cmpi_pywbem_bindings.py
+@@ -361,10 +361,10 @@ class BrokerCIMOMHandle(object):
              allow_null_ns = False
          else:
              allow_null_ns = True
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch
deleted file mode 100644
index b6a51ec0d..000000000
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Port from Fedora20
-
-Upstream-Status: Pending
-Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
-
-diff -up cmpi-bindings-0.9.5/swig/python/CMakeLists.txt.old cmpi-bindings-0.9.5/swig/python/CMakeLists.txt
---- cmpi-bindings-0.9.5/swig/python/CMakeLists.txt.old	2013-08-06 15:57:03.576285764 +0200
-+++ cmpi-bindings-0.9.5/swig/python/CMakeLists.txt	2013-08-06 15:57:14.891345941 +0200
-@@ -9,7 +9,7 @@ SET (BUILD_SHARED_LIBS ON)
- 
- FIND_PACKAGE(PythonInterp REQUIRED)
- 
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib())" OUTPUT_VARIABLE PYTHON_LIB_DIR)
-+EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(1))" OUTPUT_VARIABLE PYTHON_LIB_DIR)
- 
- IF (NOT PYTHON_SITE_DIR)
-   SET (PYTHON_SITE_DIR ${PYTHON_LIB_DIR})
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
similarity index 61%
rename from meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
rename to meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
index 3b7453536..781dc83da 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
@@ -4,39 +4,31 @@ HOMEPAGE = "http://github.com/kkaempf/cmpi-bindings"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b19ee058d2d5f69af45da98051d91064"
 SECTION = "Development/Libraries"
-DEPENDS = "swig-native python3 sblim-cmpi-devel"
+DEPENDS = "swig-native sblim-cmpi-devel python3-setuptools-native"
 
 SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=master \
            file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
            file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
-           file://cmpi-bindings-0.9.5-python-lib-dir.patch \
-           file://0001-Modify-cmakelist.patch \
            file://0001-Fix-error.patch \
-           file://0001-fix-the-build-error-when-python-3.0.patch \
-           file://0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch \
-          "
+           "
 
-SRCREV = "62f60e065aa1b901f826e4f530c0573ae32d065e"
+SRCREV = "69077ee4d249816ed428155fc933dca424167e77"
 S = "${WORKDIR}/git"
 
-inherit cmake python3native
+inherit cmake python3targetconfig
 
 EXTRA_OECMAKE = "-DLIB='${baselib}' \
                  -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
                  -DPYTHON_ABI=${PYTHON_ABI} \
+                 -DBUILD_PYTHON3=YES \
+                 -DPython3_SITE_DIR=${PYTHON_SITEPACKAGES_DIR} \
                  "
 
 # With Ninja it fails with:
 # ninja: error: build.ninja:282: bad $-escape (literal $ must be written as $$)
 OECMAKE_GENERATOR = "Unix Makefiles"
 
-do_configure:prepend() {
-    export STAGING_LIBDIR=${STAGING_LIBDIR}
-    export STAGING_INCDIR=${STAGING_INCDIR}
-    export ENV_INSTALL_PATH=${PYTHON_SITEPACKAGES_DIR}
-}
-
-FILES:${PN} =+"${libdir}/cmpi/libpyCmpiProvider.so ${PYTHON_SITEPACKAGES_DIR}/*"
+FILES:${PN} =+"${libdir}/cmpi/libpy3CmpiProvider.so ${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-dbg =+ "${libdir}/cmpi/.debug/libpyCmpiProvider.so"
 
 BBCLASSEXTEND = "native"
-- 
2.39.2


