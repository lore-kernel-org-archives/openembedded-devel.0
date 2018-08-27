Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 15C2A60620
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 11:07:56 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id 207-v6so7866584wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 04:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PVgFOV1zMDVI3bI2lJ+A4x+HH/ihLZ2FvlNdJAd5fnw=;
	b=Jo7UCJ1X//Us0ELKntoBH/idupjhlpXUTdtjgBwfOwxxyLoBKcanN0ncfr2yqqzwAp
	/G8js1q7agzLbH7Y34OQiYjFGiUUgHJWYp/Mp4NqxFhCXZ/nJIvnYa4TdcFduy1FLXsz
	xSAPrOySUtPEuV9m+LR0uhXW71FoX27y+YaRBu48gaSy0GhUOdr7PgiT4IOQhpMAdUTx
	3s3VPb1O3VecbweGn+sKrH3FF5MEiPk87ZlZyX8JqJde6rNIEiELWzJzJH+ZhE3bAP2j
	SoxLHLPb0t1qrmyxs9UdyjYb1dX89ZFWMDf1jKPQPwd9oIwkn8dUqeSde0De+nryv6dl
	GuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=PVgFOV1zMDVI3bI2lJ+A4x+HH/ihLZ2FvlNdJAd5fnw=;
	b=o7lwO87hJh5ENMZUePqLxATKGIN0jZ4sMJROU4ww5ctUw1ze70L4zwapacQq0wak8I
	Tus02O4y7FDdugZqIGRcEZZFapLdeqabbgJLOfDAm4737o5gaJkZbF6sPCGd05pXerAx
	Jq8V7PqLHDmWJvMPRIIzM2VVodN/zqfU7TtwUwjITKt1HxxvdAYE3KEhxNyBgs7RkoOg
	YnTDNULXv7R4pbESba98k+65U7bJcoaACvtocLWbEyH3RXpLgsIzBa+FPWAqO1nNTE7A
	DpcEdRRZZq6qCtW48jLGIg3yg+7boqwOB0qkzKcNz3fR2splZ0j6ywiByJygLEcVD2PB
	KsMQ==
X-Gm-Message-State: APzg51BcMWAeUv/ZzUMyxtOjj5e7eUJSCxKIQOVKysMylfgNSFYcvWLK
	arBuO6aTJz3+1ubcIvnP3fJuI+nz
X-Google-Smtp-Source: ANB0VdZFlTqCUB9wKSX6DKZkdJbXlzANLgnw0EjMY1mmbXxO7eiOdhPnm5riCgO06JUCUSAlRGtqJw==
X-Received: by 2002:a1c:1584:: with SMTP id
	126-v6mr5414088wmv.24.1535368077651; 
	Mon, 27 Aug 2018 04:07:57 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm19243016wrr.81.2018.08.27.04.07.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 04:07:56 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 13:07:31 +0200
Message-Id: <20180827110735.6396-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180827110735.6396-1-sno@netbsd.org>
References: <20180827110735.6396-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-python][PATCH 2/6] python{,3}-grpcio: update to 1.14.1
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
X-List-Received-Date: Mon, 27 Aug 2018 11:07:57 -0000

Update python-grpcio and add related python3-grpcio recipe
for recent features and bug-fixes.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-devtools/python/python-grpcio.inc | 25 +++++++++++++++++++
 ...-Do-not-mix-C-and-C-compiler-options.patch |  4 +--
 .../python/python-grpcio_1.14.1.bb            |  6 +++++
 .../python/python-grpcio_1.8.4.bb             | 25 -------------------
 .../python/python3-grpcio_1.14.1.bb           |  2 ++
 5 files changed, 35 insertions(+), 27 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio.inc
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio_1.14.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-grpcio_1.8.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio_1.14.1.bb

diff --git a/meta-python/recipes-devtools/python/python-grpcio.inc b/meta-python/recipes-devtools/python/python-grpcio.inc
new file mode 100644
index 000000000..23d25f7aa
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
index 0c1d964a6..61edc437b 100644
--- a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -22,11 +22,11 @@ Index: grpcio-1.8.4/setup.py
 ===================================================================
 --- grpcio-1.8.4.orig/setup.py
 +++ grpcio-1.8.4/setup.py
-@@ -115,7 +115,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
+@@ -135,7 +135,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
      else:
        EXTRA_ENV_COMPILE_ARGS += ' -D_ftime=_ftime64 -D_timeb=__timeb64'
    elif "linux" in sys.platform:
--    EXTRA_ENV_COMPILE_ARGS += ' -std=c++11 -std=gnu99 -fvisibility=hidden -fno-wrapv -fno-exceptions'
+-    EXTRA_ENV_COMPILE_ARGS += ' -std=gnu99 -fvisibility=hidden -fno-wrapv -fno-exceptions'
 +    EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
    elif "darwin" in sys.platform:
      EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.14.1.bb b/meta-python/recipes-devtools/python/python-grpcio_1.14.1.bb
new file mode 100644
index 000000000..820bea44b
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
index bec9d846b..000000000
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
index 000000000..d4720b4b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.14.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-grpcio.inc
-- 
2.17.1


