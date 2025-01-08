Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56A0E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 13:22:21 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.18661.1736342532671312771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 05:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=HNkmknrP;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=H791qLiG;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736342532; x=1767878532;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qaKvSyO6lPMuJ8Oqq4NNR7SjVLKRzYzTnmM4fXjCSNQ=;
  b=HNkmknrPaYRvHB/TzRBsX//xfWdedgOGE4epHYCRuMsJQ0ghnEpRq5E3
   X/EqE/qqMTYlJMfrDa8eFS7oeNFVu+EHcj516Zy5M+w+bdN8eMOfhi2Ba
   fggje9tR2BwODUI2ySBwkAcZPkiKxq+HGwKLpMzKJnbVehgK4AlJqp3jM
   Z0Wxr1PGuiOzVk/TGyvbLroo1ZoI+cMvIShjKuNiPItfEhKMbF5jt3wSF
   Ftib5O50N/iyvssqEPPVdiD/arOKqsEtuWUyZNaYzlBaDYjmMVssPlSCJ
   /JRjlkatQ0ghke51/P4ZzQuzVQzBbtGT9Frb9bV9gFT//FH/aLwmn2vcw
   g==;
X-CSE-ConnectionGUID: CByDWI2sSfubiU4oNBSdpA==
X-CSE-MsgGUID: /97+XG2rT4ae8r8rqNYpZg==
X-IronPort-AV: E=Sophos;i="6.12,298,1728943200"; 
   d="scan'208";a="40922061"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jan 2025 14:22:10 +0100
X-CheckPoint: {677E7C02-19-9B2B6168-EB6F31C5}
X-MAIL-CPID: E91C7FC8C294BAF0EFE069CAE9F712A7_5
X-Control-Analysis: str=0001.0A682F23.677E7C02.00A6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D85B165177;
	Wed,  8 Jan 2025 14:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736342525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qaKvSyO6lPMuJ8Oqq4NNR7SjVLKRzYzTnmM4fXjCSNQ=;
	b=H791qLiGG3F7qtFRqjXjI3yZZbct/I5RRFm22LzUcvTZl+VsoXn0VjOijMa6wdcKgcqEL9
	hRj4n6WmfG8umM2hziihHzXBAcHLtp5coX69VxbRL2hel6MRgmjEa5zn7XrVhCGBalz4EH
	jE6GqdxV3tkmX31YByIDquGEDaTlGO2/1M51HKryZpHIEwdcH43FsqHS4Zjq9uq0EPqVC0
	k/VrqlZ8rcrsu7eNZ+AGXjBKHoOy4eGfQSwClAGBpP+pbeaOPDmznSsgEOQohNUVsTXI8K
	EHFwELNcFXouSOupqa9JDCPPVKCFGadLMAkvhWGRfe38kcGOqMtbhJJPMugxWQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [oe][meta-oe 1/1] libcamera: update to 0.4.0
Date: Wed,  8 Jan 2025 14:22:00 +0100
Message-Id: <20250108132200.1253205-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 13:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114742

Upgrade libcamera to version 0.4.0, gaining support for ARM Mali-C55 ISP.

Patches 0002-options-Replace-use-of-VLAs-in-C.patch and
0001-rpi-Use-malloc-instead-of-variable-length-arrays.patch are obsolete.
Issues have been fixed upstream (differently).

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 ...oc-instead-of-variable-length-arrays.patch |  41 ------
 ...002-options-Replace-use-of-VLAs-in-C.patch | 128 ------------------
 ...{libcamera_0.3.0.bb => libcamera_0.4.0.bb} |   6 +-
 3 files changed, 2 insertions(+), 173 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-malloc-instead-of-variable-length-arrays.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.3.0.bb => libcamera_0.4.0.bb} (88%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-malloc-instead-of-variable-length-arrays.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-malloc-instead-of-variable-length-arrays.patch
deleted file mode 100644
index 0ca2082c03..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-malloc-instead-of-variable-length-arrays.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From a3e25b6aa9775c43336e30d3b350f54c085a32c8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 20 Feb 2024 18:44:23 -0800
-Subject: [PATCH] rpi: Use malloc instead of variable length arrays
-
-Clang-18+ diagnoses this as error
-
-| ../git/src/ipa/rpi/controller/rpi/alsc.cpp:499:10: error: variable length arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]     |   499 |         int xLo[X], xHi[X];
-|       |                 ^
-
-Upstream-Status: Denied [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040536.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ipa/rpi/controller/rpi/alsc.cpp | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/ipa/rpi/controller/rpi/alsc.cpp b/src/ipa/rpi/controller/rpi/alsc.cpp
-index 67029fc3..6eca9fb7 100644
---- a/src/ipa/rpi/controller/rpi/alsc.cpp
-+++ b/src/ipa/rpi/controller/rpi/alsc.cpp
-@@ -496,8 +496,8 @@ void resampleCalTable(const Array2D<double> &calTableIn,
- 	 * Precalculate and cache the x sampling locations and phases to save
- 	 * recomputing them on every row.
- 	 */
--	int xLo[X], xHi[X];
--	double xf[X];
-+	int *xLo = (int *)malloc(X * sizeof(int)), *xHi = (int *)malloc(X * sizeof(int));
-+	double *xf = (double *)malloc(X * sizeof(double));
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
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
similarity index 88%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
index 857f565fb7..682e56739f 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
@@ -11,11 +11,9 @@ LIC_FILES_CHKSUM = "\
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
         file://0001-media_device-Add-bool-return-type-to-unlock.patch \
-        file://0002-options-Replace-use-of-VLAs-in-C.patch \
-        file://0001-rpi-Use-malloc-instead-of-variable-length-arrays.patch \
 "
 
-SRCREV = "aee16c06913422a0ac84ee3217f87a9795e3c2d9"
+SRCREV = "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
 
 PE = "1"
 
@@ -46,7 +44,7 @@ RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayla
 inherit meson pkgconfig python3native
 
 do_configure:prepend() {
-    sed -i -e 's|py_compile=True,||' ${S}/utils/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py
+    sed -i -e 's|py_compile=True,||' ${S}/utils/codegen/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py
 }
 
 do_install:append() {
-- 
2.34.1


