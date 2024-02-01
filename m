Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5735FC47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:11:19 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.8955.1706764274532502698
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f5B1/dBj;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6e11cda9f6fso280522a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 21:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706764273; x=1707369073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tW2WbqMKuHveh7jMvSb1zRwANevoXAz2hKbBQNVsbuI=;
        b=f5B1/dBj2k1wOGQ5NpzJRF9R0/o0pyPS1UIstF2cSAFEJWGo2ryyfEbCmaoelW7CgA
         6NKl0AEasOEI1wbmUR9Fq0D6N3EiKjXnFvR/1Ps5PenjjPgAgCc7nY6MB90yBQQy0GHO
         T1HdHklqidcrl7RAwckubv367D6ABWuFOjYkJ59qGcv6OfWJfdT8DvMgX306phwseWw8
         G2BkuKG7LzqAmhHGmQvdVJOr/KMjlnmiZJ6c2mzw6WYlAIrlanB1OJHr4JNDzw/Qbk3M
         XAGfgjapi6ODDbXMpJy2mZi2Rw4f8AMH65OQywL3ajdUl9kT8P99XTEii4qGK1Ru9qmm
         PFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706764273; x=1707369073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tW2WbqMKuHveh7jMvSb1zRwANevoXAz2hKbBQNVsbuI=;
        b=UnlF0xGrvm7A3iflq3KvzhTerQt9uwo/zZXjG5TUadcEVrwZWd011K1jM1a0XK5S7l
         WoN8e7s6ySi5dyF4vJYD7yDktBhVAD01OO4NPuZZkQJ6bMqjWaB74eeH0VkMs+KCBy4W
         JZChRPj0A73YONR1o7+Bi0vThUIAmG9awv2y/cG96oQxzo42A0tART6+8bRIj/5Xh/xC
         b+M0rpNHgcP42EWSzAm7JlROAodnP+elmi7dNUqLzTNlyhajULRni2gmOcLsBGsKEjtH
         Wwct51wxgOiaNlx4SMCqJZ4nN4asWU10Zdo7U12NVF3feN3JJQZOk5gP4eQHgogiB0Uo
         xlsA==
X-Gm-Message-State: AOJu0YxSvp9FzkZ1fNyqEdQqmr92eIW9ynWvtmMjjnc3gWfrXqpJeRcJ
	nHYzb5LaXtpTwFqCAqNyV91+nma6efgON8+RwbDJyLbXV5vFBWnsgVVFp7ejnaE=
X-Google-Smtp-Source: AGHT+IHbh3A3sfJUXDVRRscc5oridyGXfDjPeZEJCImfFSasqixB1d6/apIUX3mSPxEOJY3XS7m90Q==
X-Received: by 2002:a05:6808:399b:b0:3bd:cc3b:294a with SMTP id gq27-20020a056808399b00b003bdcc3b294amr5354843oib.8.1706764273395;
        Wed, 31 Jan 2024 21:11:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8157])
        by smtp.gmail.com with ESMTPSA id z184-20020a6365c1000000b005d8c1ce4443sm8708867pgb.88.2024.01.31.21.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 21:11:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Fix build with clang-18
Date: Wed, 31 Jan 2024 21:11:11 -0800
Message-ID: <20240201051111.3507973-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 05:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108511

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...evice-Add-bool-return-type-to-unlock.patch | 59 ++++++++++++
 ...002-options-Replace-use-of-VLAs-in-C.patch | 91 +++++++++++++++++++
 .../libcamera/libcamera_0.2.0.bb              |  2 +
 3 files changed, 152 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
new file mode 100644
index 0000000000..12f034effd
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
@@ -0,0 +1,59 @@
+From 6914c4fd3d53c0c6ea304123bf57429bb64ec16f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Jan 2024 21:01:27 -0800
+Subject: [PATCH 1/2] media_device: Add bool return type to unlock()
+
+unlock uses lockf which is marked with __attribute__
+((warn_unused_result)) and compilers warn about it and some treat
+-Wunused-result as error with -Werror turned on, It would be good to
+check if lockf failed or succeeded, however, that piece is not changed
+with this, this fixes build with clang++ 18
+
+    ../git/src/libcamera/media_device.cpp:167:2: error: ignoring return value of function declared with 'warn_unused_result' attribute [-Werror,-Wunused-result]
+      167 |         lockf(fd_.get(), F_ULOCK, 0);
+          |         ^~~~~ ~~~~~~~~~~~~~~~~~~~~~
+    1 error generated.
+
+Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040380.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/libcamera/internal/media_device.h | 2 +-
+ src/libcamera/media_device.cpp            | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/libcamera/internal/media_device.h b/include/libcamera/internal/media_device.h
+index eb8cfde4..b09dfd16 100644
+--- a/include/libcamera/internal/media_device.h
++++ b/include/libcamera/internal/media_device.h
+@@ -33,7 +33,7 @@ public:
+ 	bool busy() const { return acquired_; }
+ 
+ 	bool lock();
+-	void unlock();
++	bool unlock();
+ 
+ 	int populate();
+ 	bool isValid() const { return valid_; }
+diff --git a/src/libcamera/media_device.cpp b/src/libcamera/media_device.cpp
+index 2949816b..eaa2fdb0 100644
+--- a/src/libcamera/media_device.cpp
++++ b/src/libcamera/media_device.cpp
+@@ -159,12 +159,12 @@ bool MediaDevice::lock()
+  *
+  * \sa lock()
+  */
+-void MediaDevice::unlock()
++bool MediaDevice::unlock()
+ {
+ 	if (!fd_.isValid())
+-		return;
++		return false;
+ 
+-	lockf(fd_.get(), F_ULOCK, 0);
++	return lockf(fd_.get(), F_ULOCK, 0) == 0;
+ }
+ 
+ /**
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
new file mode 100644
index 0000000000..95f321782e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
@@ -0,0 +1,91 @@
+From c80d273a57547aec9353d888aa316bf6560cf1ba Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Jan 2024 21:04:28 -0800
+Subject: [PATCH 2/2] options: Replace use of VLAs in C++
+
+Clang++ 18 is fussy about this with new warning checks.
+
+   ../git/src/apps/common/options.cpp:882:20: error: variable length arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]
+      882 |         char shortOptions[optionsMap_.size() * 3 + 2];
+          |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Therefore replace using VLAs with alloca and malloc/free
+
+Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040381.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/apps/common/options.cpp      |  4 ++--
+ src/libcamera/ipc_unixsocket.cpp | 12 ++++++++----
+ 2 files changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/src/apps/common/options.cpp b/src/apps/common/options.cpp
+index 4f7e8691..b020f603 100644
+--- a/src/apps/common/options.cpp
++++ b/src/apps/common/options.cpp
+@@ -879,8 +879,8 @@ OptionsParser::Options OptionsParser::parse(int argc, char **argv)
+ 	 * Allocate short and long options arrays large enough to contain all
+ 	 * options.
+ 	 */
+-	char shortOptions[optionsMap_.size() * 3 + 2];
+-	struct option longOptions[optionsMap_.size() + 1];
++	char *shortOptions = (char*)alloca(optionsMap_.size() * 3 + 2);
++	struct option *longOptions = (struct option*)alloca(optionsMap_.size() + 1);
+ 	unsigned int ids = 0;
+ 	unsigned int idl = 0;
+ 
+diff --git a/src/libcamera/ipc_unixsocket.cpp b/src/libcamera/ipc_unixsocket.cpp
+index 1980d374..3a7f8ee6 100644
+--- a/src/libcamera/ipc_unixsocket.cpp
++++ b/src/libcamera/ipc_unixsocket.cpp
+@@ -247,8 +247,8 @@ int IPCUnixSocket::sendData(const void *buffer, size_t length,
+ 	iov[0].iov_base = const_cast<void *>(buffer);
+ 	iov[0].iov_len = length;
+ 
+-	char buf[CMSG_SPACE(num * sizeof(uint32_t))];
+-	memset(buf, 0, sizeof(buf));
++	char *buf = (char*)malloc(CMSG_SPACE(num * sizeof(uint32_t)));
++	memset((void*)buf, 0, sizeof(buf));
+ 
+ 	struct cmsghdr *cmsg = (struct cmsghdr *)buf;
+ 	cmsg->cmsg_len = CMSG_LEN(num * sizeof(uint32_t));
+@@ -270,9 +270,11 @@ int IPCUnixSocket::sendData(const void *buffer, size_t length,
+ 		int ret = -errno;
+ 		LOG(IPCUnixSocket, Error)
+ 			<< "Failed to sendmsg: " << strerror(-ret);
++    free(buf);
+ 		return ret;
+ 	}
+ 
++  free(buf);
+ 	return 0;
+ }
+ 
+@@ -283,8 +285,8 @@ int IPCUnixSocket::recvData(void *buffer, size_t length,
+ 	iov[0].iov_base = buffer;
+ 	iov[0].iov_len = length;
+ 
+-	char buf[CMSG_SPACE(num * sizeof(uint32_t))];
+-	memset(buf, 0, sizeof(buf));
++	char *buf = (char*)malloc(CMSG_SPACE(num * sizeof(uint32_t)));
++	memset((void*)buf, 0, sizeof(buf));
+ 
+ 	struct cmsghdr *cmsg = (struct cmsghdr *)buf;
+ 	cmsg->cmsg_len = CMSG_LEN(num * sizeof(uint32_t));
+@@ -305,12 +307,14 @@ int IPCUnixSocket::recvData(void *buffer, size_t length,
+ 		if (ret != -EAGAIN)
+ 			LOG(IPCUnixSocket, Error)
+ 				<< "Failed to recvmsg: " << strerror(-ret);
++    free(buf);
+ 		return ret;
+ 	}
+ 
+ 	if (fds)
+ 		memcpy(fds, CMSG_DATA(cmsg), num * sizeof(uint32_t));
+ 
++  free(buf);
+ 	return 0;
+ }
+ 
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
index 3fd17f0a85..5b2e863369 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
+        file://0001-media_device-Add-bool-return-type-to-unlock.patch \
+        file://0002-options-Replace-use-of-VLAs-in-C.patch \
 "
 
 SRCREV = "89227a428a82e724548399d35c98ea89566f9045"
-- 
2.43.0


