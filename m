Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26719C02185
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 06:54:11 +0000 (UTC)
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
 by mx.groups.io with SMTP id smtpd.web11.10693.1737442443073692790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 22:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=WrvpHMl6;
 spf=pass (domain: amazon.de, ip: 99.78.197.220, mailfrom: prvs=109346909=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1737442443; x=1768978443;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=syPD4IuNYbJlx9469hInAMLs2C9tHey/xeaZ97GIr0s=;
  b=WrvpHMl6kUfXv57mF+YWh8ZMFYR0xNzwCjUmuIpFj7yE40V2YKHfkFCH
   aCCvePzMh+DGHVlu27ezbLUVzlNGvtlbw42040LJGFaDUgXEwErT66awO
   XpNR/vaBWHx56anE/n5aJhnQOnYfqdDep9oTq0XtVXBbLEgvxv5QPEJVL
   w=;
X-IronPort-AV: E=Sophos;i="6.13,221,1732579200"; 
   d="scan'208";a="165687471"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 06:54:01 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.17.79:3789]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.13.19:2525] with esmtp (Farcaster)
 id 4d4a3e78-1d5f-4692-923c-54f501773081; Tue, 21 Jan 2025 06:54:00 +0000 (UTC)
X-Farcaster-Flow-ID: 4d4a3e78-1d5f-4692-923c-54f501773081
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Tue, 21 Jan 2025 06:54:00 +0000
Received: from u182adcbddbfb55.ant.amazon.com (10.1.212.24) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Tue, 21 Jan 2025 06:53:58 +0000
From: <throos@amazon.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [meta-multimedia] [scarthgap] [PATCH] libcamera: backport 0.4.0 from master-next
Date: Tue, 21 Jan 2025 07:53:46 +0100
Message-ID: <20250121065346.37236-1-throos@amazon.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.1.212.24]
X-ClientProxiedBy: EX19D040UWB003.ant.amazon.com (10.13.138.8) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 06:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115002

From: Thomas Roos <throos@amazon.de>

This is done because libcamera 0.2. is broken,
probablay because of 0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
Tested good with upstream version.

See more details here:
https://github.com/openembedded/meta-openembedded/issues/919
and here:
https://github.com/raspberrypi/rpicam-apps/issues/654

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 .../0001-ipu3-Use-posix-basename.patch        |  71 ----------
 ...ca-instead-of-variable-length-arrays.patch |  43 ------
 ...002-options-Replace-use-of-VLAs-in-C.patch | 128 ------------------
 ...{libcamera_0.2.0.bb => libcamera_0.4.0.bb} |  11 +-
 4 files changed, 5 insertions(+), 248 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posix-basename.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.2.0.bb => libcamera_0.4.0.bb} (84%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posix-basename.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posix-basename.patch
deleted file mode 100644
index 9e4adf3d8d..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posix-basename.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 35d2acc61b1b27c0810a80cd21de65f29dc79df7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 24 Mar 2024 11:27:21 -0700
-Subject: [PATCH] ipu3: Use posix basename
-
-musl does not implement GNU basename extention and with latest musl
-the prototype from string.h is also removed [1] which now results in
-compile errors e.g.
-
-../git/utils/ipu3/ipu3-pack.c:21:47: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-
-These utilities are using this function in usage() which is used just
-before program exit. Always use the basename APIs from libgen.h which is
-posix implementation
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/041180.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- utils/ipu3/ipu3-pack.c   | 4 ++--
- utils/ipu3/ipu3-unpack.c | 3 ++-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/utils/ipu3/ipu3-pack.c b/utils/ipu3/ipu3-pack.c
-index decbfc6c..23d2db8b 100644
---- a/utils/ipu3/ipu3-pack.c
-+++ b/utils/ipu3/ipu3-pack.c
-@@ -8,6 +8,7 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <string.h>
-@@ -15,9 +16,8 @@
- #include <sys/types.h>
- #include <unistd.h>
- 
--static void usage(const char *argv0)
-+static void usage(char *argv0)
- {
--
- 	printf("Usage: %s input-file output-file\n", basename(argv0));
- 	printf("Convert unpacked RAW10 Bayer data to the IPU3 packed Bayer formats\n");
- 	printf("If the output-file '-', output data will be written to standard output\n");
-diff --git a/utils/ipu3/ipu3-unpack.c b/utils/ipu3/ipu3-unpack.c
-index 9d2c1200..1505a970 100644
---- a/utils/ipu3/ipu3-unpack.c
-+++ b/utils/ipu3/ipu3-unpack.c
-@@ -8,6 +8,7 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <string.h>
-@@ -15,7 +16,7 @@
- #include <sys/types.h>
- #include <unistd.h>
- 
--static void usage(const char *argv0)
-+static void usage(char *argv0)
- {
- 	printf("Usage: %s input-file output-file\n", basename(argv0));
- 	printf("Unpack the IPU3 raw Bayer format to 16-bit Bayer\n");
--- 
-2.44.0
-
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
deleted file mode 100644
index c336e92548..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 11cc6dbd45f0880beea64cdc514f57484b90bc39 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 20 Feb 2024 18:44:23 -0800
-Subject: [PATCH] rpi: Use malloc instead of variable length arrays
-
-Clang-18+ diagnoses this as error
-
-| ../git/src/ipa/rpi/controller/rpi/alsc.cpp:499:10: error: variable length arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]     |   499 |         int xLo[X], xHi[X];
-|       |                 ^
-
-Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040529.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-s
----
- src/ipa/rpi/controller/rpi/alsc.cpp | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/ipa/rpi/controller/rpi/alsc.cpp b/src/ipa/rpi/controller/rpi/alsc.cpp
-index 8a205c60..a7d42614 100644
---- a/src/ipa/rpi/controller/rpi/alsc.cpp
-+++ b/src/ipa/rpi/controller/rpi/alsc.cpp
-@@ -496,8 +496,8 @@ void resampleCalTable(const Array2D<double> &calTableIn,
- 	 * Precalculate and cache the x sampling locations and phases to save
- 	 * recomputing them on every row.
- 	 */
--	int xLo[X], xHi[X];
--	double xf[X];
-+	int *xLo = (int*)malloc(X), *xHi = (int*)malloc(X);
-+	double *xf = (double*)malloc(X);
- 	double scaleX = cameraMode.sensorWidth /
- 			(cameraMode.width * cameraMode.scaleX);
- 	double xOff = cameraMode.cropX / (double)cameraMode.sensorWidth;
-@@ -539,6 +539,9 @@ void resampleCalTable(const Array2D<double> &calTableIn,
- 			*(out++) = above * (1 - yf) + below * yf;
- 		}
- 	}
-+	free(xf);
-+	free(xHi);
-+	free(xLo);
- }
- 
- /* Calculate chrominance statistics (R/G and B/G) for each region. */
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
deleted file mode 100644
index 473820653e..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 6e4736180fcaffdb06acf52fd3eb50ba5baa3d2a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Jan 2024 21:04:28 -0800
-Subject: [PATCH] options: Replace use of VLAs in C++
-
-Clang++ 18 is fussy about this with new warning checks.
-
-   ../git/src/apps/common/options.cpp:882:20: error: variable length arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]
-      882 |         char shortOptions[optionsMap_.size() * 3 + 2];
-          |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Therefore replace using VLAs with alloca and malloc/free
-
-Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040381.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/apps/common/options.cpp      | 12 ++++++++++--
- src/libcamera/ipc_unixsocket.cpp | 13 +++++++++----
- 2 files changed, 19 insertions(+), 6 deletions(-)
-
-diff --git a/src/apps/common/options.cpp b/src/apps/common/options.cpp
-index 4f7e8691..3656f3c1 100644
---- a/src/apps/common/options.cpp
-+++ b/src/apps/common/options.cpp
-@@ -879,8 +879,8 @@ OptionsParser::Options OptionsParser::parse(int argc, char **argv)
- 	 * Allocate short and long options arrays large enough to contain all
- 	 * options.
- 	 */
--	char shortOptions[optionsMap_.size() * 3 + 2];
--	struct option longOptions[optionsMap_.size() + 1];
-+	char *shortOptions = (char*)malloc(optionsMap_.size() * 3 + 2);
-+	struct option *longOptions = (struct option*)malloc(sizeof(struct option) * (optionsMap_.size() + 1));
- 	unsigned int ids = 0;
- 	unsigned int idl = 0;
- 
-@@ -935,12 +935,16 @@ OptionsParser::Options OptionsParser::parse(int argc, char **argv)
- 			std::cerr << argv[optind - 1] << std::endl;
- 
- 			usage();
-+			free(shortOptions);
-+			free(longOptions);
- 			return options;
- 		}
- 
- 		const Option &option = *optionsMap_[c];
- 		if (!parseValue(option, optarg, &options)) {
- 			usage();
-+			free(shortOptions);
-+			free(longOptions);
- 			return options;
- 		}
- 	}
-@@ -949,10 +953,14 @@ OptionsParser::Options OptionsParser::parse(int argc, char **argv)
- 		std::cerr << "Invalid non-option argument '" << argv[optind]
- 			  << "'" << std::endl;
- 		usage();
-+		free(shortOptions);
-+		free(longOptions);
- 		return options;
- 	}
- 
- 	options.valid_ = true;
-+	free(shortOptions);
-+	free(longOptions);
- 	return options;
- }
- 
-diff --git a/src/libcamera/ipc_unixsocket.cpp b/src/libcamera/ipc_unixsocket.cpp
-index 1980d374..3bd861cb 100644
---- a/src/libcamera/ipc_unixsocket.cpp
-+++ b/src/libcamera/ipc_unixsocket.cpp
-@@ -8,6 +8,7 @@
- #include "libcamera/internal/ipc_unixsocket.h"
- 
- #include <array>
-+#include <cstdint>
- #include <poll.h>
- #include <string.h>
- #include <sys/socket.h>
-@@ -247,8 +248,8 @@ int IPCUnixSocket::sendData(const void *buffer, size_t length,
- 	iov[0].iov_base = const_cast<void *>(buffer);
- 	iov[0].iov_len = length;
- 
--	char buf[CMSG_SPACE(num * sizeof(uint32_t))];
--	memset(buf, 0, sizeof(buf));
-+	char *buf = (char*)malloc(CMSG_SPACE(num * sizeof(uint32_t)));
-+	memset((void*)buf, 0, sizeof(buf));
- 
- 	struct cmsghdr *cmsg = (struct cmsghdr *)buf;
- 	cmsg->cmsg_len = CMSG_LEN(num * sizeof(uint32_t));
-@@ -270,9 +271,11 @@ int IPCUnixSocket::sendData(const void *buffer, size_t length,
- 		int ret = -errno;
- 		LOG(IPCUnixSocket, Error)
- 			<< "Failed to sendmsg: " << strerror(-ret);
-+		free(buf);
- 		return ret;
- 	}
- 
-+	free(buf);
- 	return 0;
- }
- 
-@@ -283,8 +286,8 @@ int IPCUnixSocket::recvData(void *buffer, size_t length,
- 	iov[0].iov_base = buffer;
- 	iov[0].iov_len = length;
- 
--	char buf[CMSG_SPACE(num * sizeof(uint32_t))];
--	memset(buf, 0, sizeof(buf));
-+	char *buf = (char*)malloc(CMSG_SPACE(num * sizeof(uint32_t)));
-+	memset((void*)buf, 0, sizeof(buf));
- 
- 	struct cmsghdr *cmsg = (struct cmsghdr *)buf;
- 	cmsg->cmsg_len = CMSG_LEN(num * sizeof(uint32_t));
-@@ -305,12 +308,14 @@ int IPCUnixSocket::recvData(void *buffer, size_t length,
- 		if (ret != -EAGAIN)
- 			LOG(IPCUnixSocket, Error)
- 				<< "Failed to recvmsg: " << strerror(-ret);
-+		free(buf);
- 		return ret;
- 	}
- 
- 	if (fds)
- 		memcpy(fds, CMSG_DATA(cmsg), num * sizeof(uint32_t));
- 
-+	free(buf);
- 	return 0;
- }
- 
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
similarity index 84%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
index 45d6be31ec..682e56739f 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
@@ -11,12 +11,9 @@ LIC_FILES_CHKSUM = "\
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
         file://0001-media_device-Add-bool-return-type-to-unlock.patch \
-        file://0002-options-Replace-use-of-VLAs-in-C.patch \
-        file://0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch \
-        file://0001-ipu3-Use-posix-basename.patch \
 "
 
-SRCREV = "89227a428a82e724548399d35c98ea89566f9045"
+SRCREV = "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
 
 PE = "1"
 
@@ -25,10 +22,11 @@ S = "${WORKDIR}/git"
 DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
-PACKAGES =+ "${PN}-gst"
+PACKAGES =+ "${PN}-gst ${PN}-pycamera"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[pycamera] = "-Dpycamera=enabled,-Dpycamera=disabled,python3 python3-pybind11"
 
 LIBCAMERA_PIPELINES ??= "auto"
 
@@ -46,7 +44,7 @@ RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayla
 inherit meson pkgconfig python3native
 
 do_configure:prepend() {
-    sed -i -e 's|py_compile=True,||' ${S}/utils/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py
+    sed -i -e 's|py_compile=True,||' ${S}/utils/codegen/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py
 }
 
 do_install:append() {
@@ -72,6 +70,7 @@ do_package_recalculate_ipa_signatures() {
 
 FILES:${PN} += " ${libexecdir}/libcamera/v4l2-compat.so"
 FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
+FILES:${PN}-pycamera = "${PYTHON_SITEPACKAGES_DIR}/libcamera"
 
 # libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
 # both 32 and 64 bit file APIs.
-- 
2.34.1


