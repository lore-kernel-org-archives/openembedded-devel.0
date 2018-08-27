Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 95B22748D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 23:21:22 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id k19-v6so297979pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 16:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gZI0mEhmaguxA+dtnGRS9t6tderonSYpe1ugqPDBv+Y=;
	b=c5N5+JG4HinExKFuxAvz/1ZnOYcQgQLS28RhUJNdxTokrvJ+lcJ++kJNlV3rNEFdB8
	nqC+OFiY39Wa/3WvhBeddmbqqHTfSml3d8D+1E3k9T4MEbkT7mUBe0i3nlNhlnvHlS6Q
	WVrfntqmtt85/JpicDF2KWwLzNdmI740NFyYyOSrL06m8AnF/mb+H9ALN6cIaPYTRh4W
	agfdaDIX60/b0kmAsov5nXaNg5SmjpqxbCF5lbSULxIK8HOYdJ8ySJWJ9uwSaId5Ub95
	mcIEQYhYb16FMH4YHMO1nqWOPncEmuc/0UEJdBIgQeiDvUWGDFHC+THtRUlNA/zHz+PC
	I7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gZI0mEhmaguxA+dtnGRS9t6tderonSYpe1ugqPDBv+Y=;
	b=uNx5LKJVU9HXgF/4vWxBKMDIMyj2hsT/oyTv924QoTkY1KO5fSkLGDAtPo5uNIdvIi
	YiGc2LQRPUED94ynCSkwdAYboUrfLuwLDXSuQ/c/Mzu53hihEPzW8L4cSmK11l8Vvp23
	wLAj4/3LnpiSqgX3RhgkS3Z7Zs4kvXe4kyCtyJIQS9pwIgaHCeFX4vWs8Pal5srwhjLw
	YN9HphBuqiqS3VPIybywRkcETrmLfQEP1+3cNje7DVoqLWdJuxPSAaPD24rwJBjyW9+X
	q1CXsz0YnB1wMwqy5Vo++PM4L7f67jCwllO6Gzbc3vkDguMH2N2ZNBiq+zfH9sZ9L1xy
	Yt0g==
X-Gm-Message-State: APzg51DZ5Fd859dGKi/IB1RzIaNuwwY39FFwWCjkDTk/YuSxOQe6n3Pe
	9ZyECz33HHjIlkI/j7o9PMhO4wVG
X-Google-Smtp-Source: ANB0VdYTGzVPI3wvd87rdQEXRFVm50afrWgFqctQiV8Psv2RQdgD0O7KGgBljczBCoux+xDa2oK18Q==
X-Received: by 2002:a63:bc0a:: with SMTP id
	q10-v6mr13908447pge.60.1535412083107; 
	Mon, 27 Aug 2018 16:21:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	d19-v6sm305511pgi.50.2018.08.27.16.21.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 16:21:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 16:21:12 -0700
Message-Id: <20180827232112.40310-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-python][PATCH V2] python{,3}-grpcio: update to 1.14.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 23:21:22 -0000

From: Jens Rehsack <sno@netbsd.org>

Update python-grpcio and add related python3-grpcio recipe
for recent features and bug-fixes.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix the compiler patch to work with both c/c++ compilers

 .../recipes-devtools/python/python-grpcio.inc | 25 +++++++++++++++++++
 ...-Do-not-mix-C-and-C-compiler-options.patch | 21 +++++++++++-----
 .../python/python-grpcio_1.14.1.bb            |  6 +++++
 .../python/python-grpcio_1.8.4.bb             | 25 -------------------
 .../python/python3-grpcio_1.14.1.bb           |  2 ++
 5 files changed, 48 insertions(+), 31 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio.inc
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio_1.14.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-grpcio_1.8.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio_1.14.1.bb

diff --git a/meta-python/recipes-devtools/python/python-grpcio.inc b/meta-python/recipes-devtools/python/python-grpcio.inc
new file mode 100644
index 0000000000..23d25f7aa5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "Google gRPC"
+HOMEPAGE = "http://www.grpc.io/"
+SECTION = "devel/python"
+
+DEPENDS_append = "${PYTHON_PN}-protobuf"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-grpcio:"
+SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch "
+
+RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
+                  ${PYTHON_PN}-setuptools \
+                  ${PYTHON_PN}-six \
+"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+inherit pypi
+
+SRC_URI[md5sum] = "0987ae2e47b5103de3cacc437874a3c5"
+SRC_URI[sha256sum] = "4bf23666e763ca7ff6010465864e9f088f4ac7ecc1e11abd6f85b250e66b2c05"
+
+CLEANBROKEN = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 0c1d964a61..996597b146 100644
--- a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -18,16 +18,25 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: grpcio-1.8.4/setup.py
+Index: grpcio-1.14.1/setup.py
 ===================================================================
---- grpcio-1.8.4.orig/setup.py
-+++ grpcio-1.8.4/setup.py
-@@ -115,7 +115,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
+--- grpcio-1.14.1.orig/setup.py
++++ grpcio-1.14.1/setup.py
+@@ -123,7 +123,7 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.
+ EXTRA_ENV_COMPILE_ARGS = os.environ.get('GRPC_PYTHON_CFLAGS', None)
+ EXTRA_ENV_LINK_ARGS = os.environ.get('GRPC_PYTHON_LDFLAGS', None)
+ if EXTRA_ENV_COMPILE_ARGS is None:
+-  EXTRA_ENV_COMPILE_ARGS = ' -std=c++11'
++  EXTRA_ENV_COMPILE_ARGS = ""
+   if 'win32' in sys.platform and sys.version_info < (3, 5):
+     EXTRA_ENV_COMPILE_ARGS += ' -D_hypot=hypot'
+     # We use define flags here and don't directly add to DEFINE_MACROS below to
+@@ -135,7 +135,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
      else:
        EXTRA_ENV_COMPILE_ARGS += ' -D_ftime=_ftime64 -D_timeb=__timeb64'
    elif "linux" in sys.platform:
--    EXTRA_ENV_COMPILE_ARGS += ' -std=c++11 -std=gnu99 -fvisibility=hidden -fno-wrapv -fno-exceptions'
+-    EXTRA_ENV_COMPILE_ARGS += ' -std=gnu99 -fvisibility=hidden -fno-wrapv -fno-exceptions'
 +    EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
    elif "darwin" in sys.platform:
      EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
- 
+ EXTRA_ENV_COMPILE_ARGS += ' -DPB_FIELD_16BIT'
diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.14.1.bb b/meta-python/recipes-devtools/python/python-grpcio_1.14.1.bb
new file mode 100644
index 0000000000..820bea44b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.14.1.bb
@@ -0,0 +1,6 @@
+inherit setuptools
+require python-grpcio.inc
+
+RDEPENDS_${PN} += " python-enum34 \
+                    python-futures \
+"
diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.8.4.bb b/meta-python/recipes-devtools/python/python-grpcio_1.8.4.bb
deleted file mode 100644
index bec9d846b5..0000000000
--- a/meta-python/recipes-devtools/python/python-grpcio_1.8.4.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Google gRPC"
-HOMEPAGE = "http://www.grpc.io/"
-SECTION = "devel/python"
-
-DEPENDS = "python-protobuf"
-
-SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch "
-
-RDEPENDS_${PN} = "python-enum34 \
-                  python-futures \
-                  python-protobuf \
-                  python-setuptools \
-                  python-six \
-"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
-
-inherit pypi setuptools
-
-SRC_URI[md5sum] = "7860f7c61de3890323670b7b1ff63e56"
-SRC_URI[sha256sum] = "88d87aab9c7889b3ab29dd74aac1a5493ed78b9bf5afba1c069c9dd5531f951d"
-
-# For usage in other recipes when compiling protobuf files (e.g. by grpcio-tools)
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.14.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.14.1.bb
new file mode 100644
index 0000000000..d4720b4b80
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.14.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-grpcio.inc
-- 
2.18.0


