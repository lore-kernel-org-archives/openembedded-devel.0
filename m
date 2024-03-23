Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486DCC54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 06:55:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.4144.1711176907070065991
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 23:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NkHYzgXh;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dddad37712so24450935ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 23:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711176906; x=1711781706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuSGaEmWhfOt8hovyWwbI+70nzzRI03J9CgvghndeH8=;
        b=NkHYzgXhoAdKNuencBwbzOuViK4l+cmvbRmiErK0Z9fxKICefx+JJ6PZu/y0RR/KBI
         jL7fDYCSNmn+qe2up/4tBZQD21bm2c+lO/KX0PnKrtcY004XcSPDeGYGqoiCjdTOX3ee
         i0Zlvyu1Urv8CrHvn3QbJZqq9wure+IU/OT0pqJPeRK3hx4tYyg9eIXzWZTC8OrUscpW
         caXsadtk8rRKVXtwraD2s4EJZ1UDzjwsNGBOhZLFzfx4WdbwsgCJZB2vmWq6Fp8BT4G/
         0FDMEVr5gKkiag6US+y6UjghynQSdP+sHkEoc/vUb6QxsrJIv8OSE+gfaklm10iLmYMR
         iGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711176906; x=1711781706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuSGaEmWhfOt8hovyWwbI+70nzzRI03J9CgvghndeH8=;
        b=oSuYfCsbgrRl6DMzG4sUEzArSVNkDLzWI85S6FIgLiMMtFUh3jcpZkNz0pzVgg/luM
         AjmMYWz0M6a8y16YErHXA4TOJyXC4qj0IoqYXbPD2/SDdpNsquqTR1BYxgrjOqLKn6yz
         7XfbpUWXLlxZ/jC/mHK66ztZE6wvisYWdkwuoqDmRe/jOjoEExtQwNCWjPdQ2EO+XIPg
         NdTyf5uQa6RWzkr9frtQuswni6Rql8MDoTMmz6+mtMGuoCawRw1L1mtDx7Znnh1aw9iN
         6eI+KxRxyg2DLWGwR65mXuOZYyfEaRrCYNeUyDOV685B8agKtqHgnngdKD8FSMmuVtST
         Hd+Q==
X-Gm-Message-State: AOJu0YxOG1c+d4HkPg0sBkt3DTo1Q7RXEMyDe8uxvkFZbzVQk7xTbVEV
	JFVLNPzPingewkyU2UmEfLQ+TUDQwpNXnP+10lckZQ8aWrBA3rqwY6AD5Fxb
X-Google-Smtp-Source: AGHT+IFWC6uQgqt7CtlvdjBvqGhRtnC7AI4mtCVtJFQXP0kwpe2xyaaBDqtH86TirZWWO8SjQV/7MA==
X-Received: by 2002:a17:902:ecc4:b0:1e0:36e:2bb9 with SMTP id a4-20020a170902ecc400b001e0036e2bb9mr2198763plh.11.1711176906037;
        Fri, 22 Mar 2024 23:55:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id r21-20020a170902ea5500b001dccaafe249sm872605plg.220.2024.03.22.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 23:55:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Fix clang support patches
Date: Fri, 22 Mar 2024 23:55:03 -0700
Message-ID: <20240323065503.4149463-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 06:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109530

Replace alloca with malloc

Allocate size for struct option array was not correct therefore
multiply the value with sizeof(struct option) to account for it

[YOCTO #15449 ]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ca-instead-of-variable-length-arrays.patch | 29 ++++---
 ...002-options-Replace-use-of-VLAs-in-C.patch | 77 ++++++++++++++-----
 2 files changed, 76 insertions(+), 30 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
index a6526d5903..c336e92548 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
@@ -1,7 +1,7 @@
-From 7982e55ce3a8b3c60a47258ff7d37d0dd78c303d Mon Sep 17 00:00:00 2001
+From 11cc6dbd45f0880beea64cdc514f57484b90bc39 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 20 Feb 2024 18:44:23 -0800
-Subject: [PATCH] rpi: Use alloca instead of variable length arrays
+Subject: [PATCH] rpi: Use malloc instead of variable length arrays
 
 Clang-18+ diagnoses this as error
 
@@ -10,12 +10,14 @@ Clang-18+ diagnoses this as error
 
 Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040529.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+s
 ---
- src/ipa/rpi/controller/rpi/alsc.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/ipa/rpi/controller/rpi/alsc.cpp | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/ipa/rpi/controller/rpi/alsc.cpp b/src/ipa/rpi/controller/rpi/alsc.cpp
-index 8a205c60..8c0ae8eb 100644
+index 8a205c60..a7d42614 100644
 --- a/src/ipa/rpi/controller/rpi/alsc.cpp
 +++ b/src/ipa/rpi/controller/rpi/alsc.cpp
 @@ -496,8 +496,8 @@ void resampleCalTable(const Array2D<double> &calTableIn,
@@ -24,11 +26,18 @@ index 8a205c60..8c0ae8eb 100644
  	 */
 -	int xLo[X], xHi[X];
 -	double xf[X];
-+	int *xLo = (int*)alloca(X), *xHi = (int*)alloca(X);
-+	double *xf = (double*)alloca(X);
++	int *xLo = (int*)malloc(X), *xHi = (int*)malloc(X);
++	double *xf = (double*)malloc(X);
  	double scaleX = cameraMode.sensorWidth /
  			(cameraMode.width * cameraMode.scaleX);
  	double xOff = cameraMode.cropX / (double)cameraMode.sensorWidth;
--- 
-2.43.2
-
+@@ -539,6 +539,9 @@ void resampleCalTable(const Array2D<double> &calTableIn,
+ 			*(out++) = above * (1 - yf) + below * yf;
+ 		}
+ 	}
++	free(xf);
++	free(xHi);
++	free(xLo);
+ }
+ 
+ /* Calculate chrominance statistics (R/G and B/G) for each region. */
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
index 95f321782e..473820653e 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
@@ -1,7 +1,7 @@
-From c80d273a57547aec9353d888aa316bf6560cf1ba Mon Sep 17 00:00:00 2001
+From 6e4736180fcaffdb06acf52fd3eb50ba5baa3d2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jan 2024 21:04:28 -0800
-Subject: [PATCH 2/2] options: Replace use of VLAs in C++
+Subject: [PATCH] options: Replace use of VLAs in C++
 
 Clang++ 18 is fussy about this with new warning checks.
 
@@ -14,12 +14,12 @@ Therefore replace using VLAs with alloca and malloc/free
 Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040381.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/apps/common/options.cpp      |  4 ++--
- src/libcamera/ipc_unixsocket.cpp | 12 ++++++++----
- 2 files changed, 10 insertions(+), 6 deletions(-)
+ src/apps/common/options.cpp      | 12 ++++++++++--
+ src/libcamera/ipc_unixsocket.cpp | 13 +++++++++----
+ 2 files changed, 19 insertions(+), 6 deletions(-)
 
 diff --git a/src/apps/common/options.cpp b/src/apps/common/options.cpp
-index 4f7e8691..b020f603 100644
+index 4f7e8691..3656f3c1 100644
 --- a/src/apps/common/options.cpp
 +++ b/src/apps/common/options.cpp
 @@ -879,8 +879,8 @@ OptionsParser::Options OptionsParser::parse(int argc, char **argv)
@@ -28,16 +28,56 @@ index 4f7e8691..b020f603 100644
  	 */
 -	char shortOptions[optionsMap_.size() * 3 + 2];
 -	struct option longOptions[optionsMap_.size() + 1];
-+	char *shortOptions = (char*)alloca(optionsMap_.size() * 3 + 2);
-+	struct option *longOptions = (struct option*)alloca(optionsMap_.size() + 1);
++	char *shortOptions = (char*)malloc(optionsMap_.size() * 3 + 2);
++	struct option *longOptions = (struct option*)malloc(sizeof(struct option) * (optionsMap_.size() + 1));
  	unsigned int ids = 0;
  	unsigned int idl = 0;
  
+@@ -935,12 +935,16 @@ OptionsParser::Options OptionsParser::parse(int argc, char **argv)
+ 			std::cerr << argv[optind - 1] << std::endl;
+ 
+ 			usage();
++			free(shortOptions);
++			free(longOptions);
+ 			return options;
+ 		}
+ 
+ 		const Option &option = *optionsMap_[c];
+ 		if (!parseValue(option, optarg, &options)) {
+ 			usage();
++			free(shortOptions);
++			free(longOptions);
+ 			return options;
+ 		}
+ 	}
+@@ -949,10 +953,14 @@ OptionsParser::Options OptionsParser::parse(int argc, char **argv)
+ 		std::cerr << "Invalid non-option argument '" << argv[optind]
+ 			  << "'" << std::endl;
+ 		usage();
++		free(shortOptions);
++		free(longOptions);
+ 		return options;
+ 	}
+ 
+ 	options.valid_ = true;
++	free(shortOptions);
++	free(longOptions);
+ 	return options;
+ }
+ 
 diff --git a/src/libcamera/ipc_unixsocket.cpp b/src/libcamera/ipc_unixsocket.cpp
-index 1980d374..3a7f8ee6 100644
+index 1980d374..3bd861cb 100644
 --- a/src/libcamera/ipc_unixsocket.cpp
 +++ b/src/libcamera/ipc_unixsocket.cpp
-@@ -247,8 +247,8 @@ int IPCUnixSocket::sendData(const void *buffer, size_t length,
+@@ -8,6 +8,7 @@
+ #include "libcamera/internal/ipc_unixsocket.h"
+ 
+ #include <array>
++#include <cstdint>
+ #include <poll.h>
+ #include <string.h>
+ #include <sys/socket.h>
+@@ -247,8 +248,8 @@ int IPCUnixSocket::sendData(const void *buffer, size_t length,
  	iov[0].iov_base = const_cast<void *>(buffer);
  	iov[0].iov_len = length;
  
@@ -48,19 +88,19 @@ index 1980d374..3a7f8ee6 100644
  
  	struct cmsghdr *cmsg = (struct cmsghdr *)buf;
  	cmsg->cmsg_len = CMSG_LEN(num * sizeof(uint32_t));
-@@ -270,9 +270,11 @@ int IPCUnixSocket::sendData(const void *buffer, size_t length,
+@@ -270,9 +271,11 @@ int IPCUnixSocket::sendData(const void *buffer, size_t length,
  		int ret = -errno;
  		LOG(IPCUnixSocket, Error)
  			<< "Failed to sendmsg: " << strerror(-ret);
-+    free(buf);
++		free(buf);
  		return ret;
  	}
  
-+  free(buf);
++	free(buf);
  	return 0;
  }
  
-@@ -283,8 +285,8 @@ int IPCUnixSocket::recvData(void *buffer, size_t length,
+@@ -283,8 +286,8 @@ int IPCUnixSocket::recvData(void *buffer, size_t length,
  	iov[0].iov_base = buffer;
  	iov[0].iov_len = length;
  
@@ -71,21 +111,18 @@ index 1980d374..3a7f8ee6 100644
  
  	struct cmsghdr *cmsg = (struct cmsghdr *)buf;
  	cmsg->cmsg_len = CMSG_LEN(num * sizeof(uint32_t));
-@@ -305,12 +307,14 @@ int IPCUnixSocket::recvData(void *buffer, size_t length,
+@@ -305,12 +308,14 @@ int IPCUnixSocket::recvData(void *buffer, size_t length,
  		if (ret != -EAGAIN)
  			LOG(IPCUnixSocket, Error)
  				<< "Failed to recvmsg: " << strerror(-ret);
-+    free(buf);
++		free(buf);
  		return ret;
  	}
  
  	if (fds)
  		memcpy(fds, CMSG_DATA(cmsg), num * sizeof(uint32_t));
  
-+  free(buf);
++	free(buf);
  	return 0;
  }
  
--- 
-2.43.0
-
-- 
2.44.0


