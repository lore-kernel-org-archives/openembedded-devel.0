Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id C0EA474B05
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 23:16:35 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id m13so20255916wrj.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2018 16:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3yfN0YSnEvhzqeLamdLVWa+WxTNSjca1kS1W3jdjgdM=;
	b=g6lIJQgcws7z1UCKWPMqYUVApi4NVxGfMFKIUaRE+lR4LW7vgVfw4Tc4FVwDJZS7ZB
	QV0oc1XliBixu5grlnAs7wZcVBRAIYRSwiSPT9ecHwdISjYAfPcoNT2ff1zjHl7c/TuR
	LI0Un6my5VaX2NDCj7KGNVxK+dnYSBhbgjR42ghsgXp/W1SxfrxI0lL6g2AAzy6aIAYC
	716CKJ7B8A+8YJIOadOZkhg98amtVK35C2vXPaSONa+WIW4c29gFkVLtIp7KSIhD4oSe
	6wI98woWkxi00Oe+TPuNzHdlNu1HFeaaLIrqfV+UmbZPlVF3qp91K881T5SRJx6nJaWc
	8mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3yfN0YSnEvhzqeLamdLVWa+WxTNSjca1kS1W3jdjgdM=;
	b=OD8yXdJ3l9TG6SLsp/4oBWL5L4BZczxsFVvvwuUOgkPmqiUSrIP7RBsBHrgusj/3Q/
	el5b8r1pnvjltAElvxIe1RwzvqiVdIp+iuC/fUQMgS1C5AHKI9k2+QPFEnxQLJC2Dauc
	rwocHMdQvRF4GRSQzwREyJ2aRYHOubQw9L26Kh/nIRg8n2YiAyGhnC4FbAuNlEoRexRD
	LG+zUiTSqFnmJ9/REEO1Me/0DODT1wTr1kXdFcMATt2+laF9nhuxzdfoQVJzPv4ruFIQ
	sTOcZUV4HDyj4iOIB55jpo2jRvMDBHi3t3u3L7rrpW3IODmNT3Hj05eHBYFYZM0a8LHM
	3cAg==
X-Gm-Message-State: AElRT7HDAUaMG7+nIBkmyqg67b8IxRmoIVelIhYEBOvwFbb0m9ZZT4FG
	CSwWEvRg5yPPo2lx5rH700TNAg==
X-Google-Smtp-Source: AIpwx48t8kSd4CR8QQ/t0n/9y6pknOjhhrJ1R74mWscRMVIQS/dUFO5ox2Bx86H63QAA+ZC7vLCS+w==
X-Received: by 10.223.164.2 with SMTP id d2mr10166887wra.182.1522797395799;
	Tue, 03 Apr 2018 16:16:35 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC1FD091E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:fd09:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	m129sm2682099wma.27.2018.04.03.16.16.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Apr 2018 16:16:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2018 01:16:00 +0200
Message-Id: <20180403231601.5329-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180403231601.5329-1-schnitzeltony@gmail.com>
References: <20180403231601.5329-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] poppler: Rework patch fixing do_configure
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
X-List-Received-Date: Tue, 03 Apr 2018 23:16:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Turn the patch from a workaround into a proper fix. It was submitted to poppler
bugzilla - but after endless discussions I won't follow this further.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...0001-Do-not-overwrite-all-our-build-flags.patch | 36 ++++++++++++----------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
index 5b66a8a9c..18f508519 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
@@ -10,27 +10,29 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- cmake/modules/PopplerMacros.cmake | 2 ++
- 1 file changed, 2 insertions(+)
+ cmake/modules/PopplerMacros.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/cmake/modules/PopplerMacros.cmake b/cmake/modules/PopplerMacros.cmake
-index ccb2790..f29481e 100644
+index ccb2790..0f392cb 100644
 --- a/cmake/modules/PopplerMacros.cmake
 +++ b/cmake/modules/PopplerMacros.cmake
-@@ -98,6 +98,7 @@ if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
-   set(CMAKE_BUILD_TYPE RelWithDebInfo)
- endif(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
- 
-+if(false)
- if(CMAKE_COMPILER_IS_GNUCXX)
-   # set the default compile warnings
-   set(_warn "-Wall -Wextra -Wpedantic")
-@@ -159,4 +160,5 @@ if(CMAKE_C_COMPILER MATCHES "icc")
-   set(CMAKE_C_FLAGS_DEBUG            "-O2 -g -Ob0 -noalign ${_save_cflags}")
-   set(CMAKE_C_FLAGS_DEBUGFULL        "-g -Ob0 -noalign ${_save_cflags}")
- endif(CMAKE_C_COMPILER MATCHES "icc")
-+endif(false)
+@@ -125,14 +125,14 @@ if(CMAKE_COMPILER_IS_GNUCXX)
+   set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
  
+   set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
+-  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE")
++  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_DEBUG          "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage -fprofile-arcs ${_save_cxxflags}")
+   set(_save_cflags "${CMAKE_C_FLAGS}")
+-  set(CMAKE_C_FLAGS                  "-std=c99 -D_DEFAULT_SOURCE")
++  set(CMAKE_C_FLAGS                  "-std=c99 -D_DEFAULT_SOURCE ${_save_cflags}")
+   set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
+   set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
+   set(CMAKE_C_FLAGS_DEBUG            "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline ${_save_cflags}")
 -- 
 2.14.3
-
-- 
2.14.3


