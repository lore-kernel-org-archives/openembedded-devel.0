Return-Path: <mateusz.cz.nowakowski@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7CF162135
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Oct 2016 14:53:04 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id b75so1506939lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2016 07:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/zSZjaOMSY8ZUUy0cL0/AJQweYWlS31r0JGv1lG82bk=;
	b=OU413QjdgHJlhdqu4Yyc1lDRQQz0L08C2LwoF/6DNcR1EIlYZD9s76AiKTYQ4u6An/
	sFEXhMvWDDXxupIRXiuXc7G9+mMe37XWt9QF3nG6D+28K40VMJ6VNyLthGczul0TGKVw
	Y/QgcN7S7MWCCsAOFgcYFnjd8MAmndncPqQSUJmuYa4ESwW2nvfQWSXftuBHKgNrvuDR
	I0OBwosxqJgFpTBcHl8wRTNV3hnPRcf46LvGIcAxAyfVEJJAFALHOtTCvXhPdHWQVgDw
	DtHouchURy+niTXJAhOuSMVRs3urapiGOuqdMBw/ihnXYGwYh2pE+MTcdgYqKWz6x8nv
	kK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/zSZjaOMSY8ZUUy0cL0/AJQweYWlS31r0JGv1lG82bk=;
	b=CBfQH/aH186H++uDyLqgBrJz0IXLvyoLWRdmyFtt1LieNPLXsZJvYWTB+/QzYJenUp
	n+F272pBqfFyAoSlgkUnlrs9jDSjyHzstR2q8Tw/Z7chNhqx5KFxX38uRtTxTdNsSZZ1
	WkjbIwE3uXfcgLcYAtBXV6HOXtDIp+I9ahOGLFbJSteCs3NNA5E4j/uVK0vkfPXXiuJ1
	8aPFcac5+mY9AijTLyU7xnjYaqsWlZ6Y1JWOnN5dgFX7GxHIZuP90f9EvS7bhvOBOSvU
	C0raD5k97X55inUuIywFfqHIdIO5VZZFJrJLa0QAx7nxO17H3NN969abnG3P1Tw6M6x0
	+s3Q==
X-Gm-Message-State: AA6/9RkTCQyg42IGNHRdGjRzi35BFrmiDaBxBMgcCaoKeQCh38RnDbc6zJ48/i4bZ/x7UQ==
X-Received: by 10.46.32.199 with SMTP id g68mr2187466lji.24.1475506385623;
	Mon, 03 Oct 2016 07:53:05 -0700 (PDT)
Received: from localhost.localdomain.pl (87-206-133-125.dynamic.chello.pl.
	[87.206.133.125]) by smtp.gmail.com with ESMTPSA id
	h78sm5694066ljh.45.2016.10.03.07.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Oct 2016 07:53:05 -0700 (PDT)
From: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2016 16:52:52 +0000
Message-Id: <20161003165252.11494-1-mateusz.cz.nowakowski@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] gmock: fixed installing pkgconfig file and libraries on x86_64 architecture
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
X-List-Received-Date: Mon, 03 Oct 2016 14:53:06 -0000

Signed-off-by: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
---
 .../gmock/cmake-Add-install-command-for-libraries-and-headers.patch | 4 ++--
 .../gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch b/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
index 92a6393..0dac998 100644
--- a/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
+++ b/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
@@ -29,8 +29,8 @@ index 572d044..90e797a 100644
              src/gmock_main.cc)
  
 +
-+install(TARGETS gmock DESTINATION lib)
-+install(TARGETS gmock_main DESTINATION lib)
++install(TARGETS gmock DESTINATION ${CMAKE_INSTALL_LIBDIR})
++install(TARGETS gmock_main DESTINATION ${CMAKE_INSTALL_LIBDIR})
 +
  ########################################################################
  #
diff --git a/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch b/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
index aa38fe4..8ffe1a6 100644
--- a/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
+++ b/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
@@ -27,11 +27,11 @@ index 90e797a..98fd824 100644
  # Project-wide settings
 @@ -87,7 +90,9 @@ cxx_library(gmock_main
  
- install(TARGETS gmock DESTINATION lib)
- install(TARGETS gmock_main DESTINATION lib)
+ install(TARGETS gmock DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install(TARGETS gmock_main DESTINATION ${CMAKE_INSTALL_LIBDIR})
 -
 +install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gmock.pc"
-+    DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/"
++    DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/"
 +)  
  ########################################################################
  #
-- 
2.9.3


