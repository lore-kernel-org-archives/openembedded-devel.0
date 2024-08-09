Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB6EC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 14:25:06 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.85226.1723213500696604826
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 07:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IH/AIeKJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso22815181fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723213498; x=1723818298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSylj/lNMOI2cALEV9bLbzHn3EA9mM6w37fk7gS6YxA=;
        b=IH/AIeKJQtDVS3nlwEfc1473iEDpF38FZtpUiIDjbvAi0aJCz+nHC+vMTFyu2ZftP5
         e19tbJGLasKoJCaYtKmTIRe6zfKt1CnXI5zbBMPwpp7VCQ5ho9E3AoQKLY7MhIrjapaJ
         6B4WVUBbcdLRHttJevX+QWoOjFSfEmOP++mCuXuca/MaPHMvqVp8PPn22rfEbUF8ybjK
         r/0x7wcrG183PTPOBszu9KSSgLhTZXWrKCg9DMEo9ysDaqtl4zttTCVkka3is5f5ZraG
         YdIp3HzFR6BaKrbXWx1KCbsu3AdcjOx9eyDAH225S4AJVBsodw+BrqlvVDU5g4iwuOz2
         nFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723213498; x=1723818298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSylj/lNMOI2cALEV9bLbzHn3EA9mM6w37fk7gS6YxA=;
        b=lke+k1HwpqHnqaUEOt7Y8yGNpZLvVoBf5IokrguJKZphJhmaG5puZKCKdc5ymc+dGe
         e0nMp/0XkOyMcD9LsGFbDWjoHPYLDMjoYl/XRF28CKi+sAvf8XoTG4uHn5Xj3JdUAWo0
         DpIT6dwWuIK9plbVQmtUS91X67ceexNIW9rdRSVpX1i953V0T/IeDpt2nFb8nNjtj0bw
         pknGeU2TRUdgPNl/MeXfVxl30gYvNFrgVSF6xjFDOd2y58GjiT0vN4g0UZW66sXTRDZX
         Mslh1boMKe57H1rRAcm9dgwKrHCkIufjzgBVnf8woBz0936IXRjdLGpmgm/1VRTzoQqG
         uHwg==
X-Gm-Message-State: AOJu0YzHLKT2xxx0TckF15ADVHJxu7AocHlZ2AyZ305EKYxcnd3I/srp
	XJve6zNph8HKfIUE5i0jdBdYnmJACM5QsUuuz1EVkF6tUaDTXcfEgeKTzPBZ
X-Google-Smtp-Source: AGHT+IEEkLbVgEeKLY3rD8775jZoQ01M2zTJxru7+cL4qPRLC66bv4CYtCAconWRJkk6vDwmL0qRGg==
X-Received: by 2002:a2e:130a:0:b0:2f0:32f1:896d with SMTP id 38308e7fff4ca-2f1a6c6bcebmr11601971fa.23.1723213497905;
        Fri, 09 Aug 2024 07:24:57 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d272085b8sm5469718f8f.84.2024.08.09.07.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 07:24:57 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] recipes: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 17:24:53 +0300
Message-Id: <20240809142453.54368-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 14:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111694

- Recipes updated with correct PEP-517 build backend
- Dropped unnecessary PYPI_PACKAGE set
- Dependencies updated
- python3-greenlet was supposed to be native because of the python3-gevent build. It's python3-gevent's dependency

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-argcomplete_3.4.0.bb      | 4 ++--
 meta-python/recipes-devtools/python/python3-django_5.0.6.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb  | 4 ++--
 meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb | 4 +++-
 .../recipes-devtools/python/python3-parse-type_0.6.2.bb       | 2 +-
 .../recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb       | 2 +-
 .../recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb    | 2 +-
 .../recipes-devtools/python/python3-pyroute2_0.7.12.bb        | 2 +-
 .../recipes-devtools/python/python3-pytest-metadata_2.0.2.bb  | 4 +---
 .../recipes-devtools/python/python3-pytest-timeout_2.3.1.bb   | 4 +---
 .../recipes-devtools/python/python3-regex_2024.7.24.bb        | 2 +-
 .../python/python3-service-identity_21.1.0.bb                 | 2 +-
 13 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
index be3ded82b..d350a6342 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SRC_URI[sha256sum] = "c2abcdfe1be8ace47ba777d4fce319eb13bf8ad9dace8d085dcad6eded88057f"
 
-PYPI_PACKAGE = "argcomplete"
+inherit pypi python_setuptools_build_meta
 
-inherit pypi setuptools3
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
     python3-core \
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
index 69b25742d..513032876 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
@@ -1,5 +1,5 @@
 require python-django.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "ff1b61005004e476e0aeea47c7f79b85864c70124030e95146315396f1e7951f"
 
diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
index 806e09391..e44972178 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
@@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
 LICENSE = "MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65"
-DEPENDS += "python3-greenlet libev libuv c-ares python3-cython-native"
+DEPENDS += "python3-greenlet-native python3-greenlet libev libuv python3-cython-native python3-cffi-native"
 
 RDEPENDS:${PN} = "python3-greenlet \
 		  python3-mime \
@@ -18,7 +18,7 @@ SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch \
 
 SRC_URI[sha256sum] = "432fc76f680acf7cf188c2ee0f5d3ab73b63c1f03114c7cd8a34cebbe5aa2056"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 # Don't embed libraries, link to the system provided libs instead
 export GEVENTSETUP_EMBED_CARES = "0"
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
index abd6c49ca..a79db0049 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
@@ -6,4 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
 
 SRC_URI[sha256sum] = "43374442353259554ce33599da8b692d5aa96f8976d567d4badf263371fbe491"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
index a7d8cd86c..7e7ff8926 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e469278ace89c246d52505acc39c3da"
 SRC_URI[sha256sum] = "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef876aa48d75a73a355"
 
 PYPI_PACKAGE = "parse_type"
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-parse"
 
diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index 857afd1db..20a401131 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2379ecb0d7a8299101b1e4c160cd1f7"
 
 SRC_URI[sha256sum] = "3cdbbf3fac90dc6f118bfd64384f309edeadd902d7c8fb17f02ffa1fc3f49690"
 
-inherit ptest pypi setuptools3
+inherit ptest pypi python_setuptools_build_meta
 
 SRC_URI += "file://run-ptest \
             file://0001-test_cli.py-disable.patch \
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
index 34f3639e5..48372d917 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "831dbcea1b177b28c9baddf4c6d1013c24c3accd14a1873fffaa6a2e90
 
 PYPI_PACKAGE = "pyasn1_modules"
 
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-pyasn1"
 
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 92a8f44c6..06d481a3b 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
 PYPI_PACKAGE = "PyJWT"
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = " \
     python3-json \
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
index 3ea980f44..cf9885df7 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
 
 SRC_URI[sha256sum] = "54d226fc3ff2732f49bac9b26853c50c9d05be05a4d9daf09c7cf6d77301eff3"
 
-inherit setuptools3 pypi ptest
+inherit python_setuptools_build_meta pypi ptest
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
index 163a363f8..9243f6646 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI[sha256sum] = "fcd2f416f15be295943527b3c8ba16a44ae5a7141939c90c3dc5ce9d167cf2a5"
 
-PYPI_PACKAGE = "pytest-metadata"
-
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} = " \
     python3-pytest \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
index b56c26aad..fe9d814c0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
@@ -3,10 +3,8 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-timeout/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
-PYPI_PACKAGE = "pytest-timeout"
-
 SRC_URI[sha256sum] = "12397729125c6ecbdaca01035b9e5239d4db97352320af155b3f5de1ba5165d9"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-pytest"
diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb b/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
index 682c30fc9..b6e09fc83 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "9cfd009eed1a46b27c14039ad5bbc5e71b6367c5b2e6d5f5da0ea91600817506"
 
diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
index 006fae290..267bbea13 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8a0f079f4e6a215d6bd6f9d97cab4d5f"
 SRC_URI[md5sum] = "5e5c195d8fcedc72f9068be2ad9b5a13"
 SRC_URI[sha256sum] = "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.25.1


