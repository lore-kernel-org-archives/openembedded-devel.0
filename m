Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0AA77E2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 09:24:49 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id 80so18399799lfy.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 02:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=otpQ4/K3YlvPUJYnlRDJV61CDBxR4yjirhZWnhmtXZw=;
	b=BLI1afW6bsLAmasFAUVSn31ds3Fw6KMLMfW0J7Yv6TUsgapLZIEC6ICVfF2MVbimT3
	E90dGiMFdLmEbOmRh8qjDPKl6r3eAe06eK7gtL7CcEPa2k3i9VXpz5zsiq4fqMwcxtpJ
	vtsDM/Zl75v63CXER/EipZfG7qAdvD4PVBHXN/5E/h+4jYEhtGD0vip4iOYIEEc7cUb7
	22AfJSFVN5gLF6g3D6HLKHmOd8pIMQ2zmBj5vQ3+CwmZr74yYBP0YnUJbCpcg56ATSHw
	4neuXvdqs5VyA+fY9LHj/Jv8vpsVBLyeb5FRM9xGaelGfv1ravtZf09pWzgweemB+2qT
	Ljyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=otpQ4/K3YlvPUJYnlRDJV61CDBxR4yjirhZWnhmtXZw=;
	b=HJuaGXrFc2dvx382Q8LTiuNuCHIjP9YT4fXHg7/O0DWAKj0J8QcFJlyrSD0ycBpxBv
	AABCNwwd6Lpk38yw5+8kU62UMryFyD7IN3+XodT1RKEQ8ZQOZCfNwp+QKbp+p7Po7xBt
	2tFM9S1y1Ri3GuM2KozKOb82zTc81cYgkZtcA2BxsJ0zE41SHQI+4m6/4KP4CU2jYrXc
	BZPhkit6Zq4+gyZ6zKlf92PUywez8jDOWUWjq9oHj+BYGne+Fff+ifp2w0cNhrqJBCrt
	0FwL1Kk2k4gbXYwG2XOLrDQAuLsWcCiR4TciLza4YsMoKlZbeTWSBAX7ZXprvHWV3+CW
	08uQ==
X-Gm-Message-State: AHPjjUjIpRc2YtqGRh5q73rK/WKw/+UQf+8KylrhmDpmUiNsBze0tO0c
	S61pM7qeIoRciy6EmF4=
X-Google-Smtp-Source: AOwi7QAZoaGIVey1a8RnxOL40J32PK6GYIpdldkcVzEtMXW6juImCMv1YGMuSQFVYvJfL9UiJSbsvQ==
X-Received: by 10.25.18.38 with SMTP id h38mr318431lfi.73.1504776290105;
	Thu, 07 Sep 2017 02:24:50 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id a1sm322900ljb.94.2017.09.07.02.24.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 02:24:48 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Sep 2017 11:24:46 +0200
Message-Id: <20170907092446.18244-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-java][PATCH] openjdk-8-common: Fix warning evaluating CFLAGS
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
X-List-Received-Date: Thu, 07 Sep 2017 09:24:49 -0000

Code is (on my opinion) simpler, making use of the dumpversion flag, instead of calling the pre-processor via a pipe.

Flag has been tested on both clang gcc:

ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-4.8 -dumpversion
4.8
ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-4.9 -dumpversion
4.9.3
ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-5 -dumpversion
5.4.1
ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-6 -dumpversion
6.4.0
ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-7 -dumpversion
7
ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ clang-4.0 -dumpversion
4.2.1

Without this patch:

 WARNING:
 /home/ricardo/curro/qt5022/build-qt5022-pyro/repo/yocto/../java/recipes-core/openjdk/openjdk-8-native_102b14.bb:
 Unable to export ${CXXFLAGS}: Failure expanding variable CXXFLAGS,
 expression was
 -isystem/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/openjdk-8-native/102b14-r0/recipe-sysroot-native/usr/include
 -O2 -pipe -D_GLIBCXX_USE_CXX11_ABI=0 ${@version_specific_cflags(d)}
 ${@jdk_cpp_options(d)} which triggered exception IndexError: string
 index out of range
 WARNING:
 /home/ricardo/curro/qt5022/build-qt5022-pyro/repo/yocto/../java/recipes-core/openjdk/openjdk-8-native_102b14.bb:
 Unable to export ${CFLAGS}: Failure expanding variable CFLAGS,
 expression was
 -isystem/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/openjdk-8-native/102b14-r0/recipe-sysroot-native/usr/include
 -O2 -pipe -Wno-error=deprecated-declarations
 ${@version_specific_cflags(d)} ${@jdk_cpp_options(d)} which triggered
 exception IndexError: string index out of range

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 0c5c2c3e3d2f..83828e156fb6 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -238,13 +238,9 @@ def version_specific_cflags(d):
     if bb.data.inherits_class('native', d):
         from subprocess import Popen, PIPE
 
-        cmd = d.expand('${CPP} -P -').split()
-        cc = Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=PIPE)
-        # This check is GCC specific. Clang always returns 4. For Clang
-        # __clang_major__ and __clang_minor__ need to be checked. Ideally
-        # __GNUC_MINOR__ would be checked as well, but for this recipe
-        # GCC major is all we care about.
-        version = cc.communicate(b'__GNUC__')[0].decode('utf-8')[0]
+        cmd = d.expand('${CC} -dumpversion').split()
+        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
+        version = cc.communicate()[0].decode('utf-8')[0]
     else:
         # in the cross case, trust that GCCVERSION is correct. This won't
         # work if the native toolchain is Clang, but as of this writing that
-- 
2.14.1


