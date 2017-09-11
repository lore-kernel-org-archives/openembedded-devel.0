Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9776A71BE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:11:06 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id q76so5009758pfq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AbnPXdZwtaarG36HlJdz3xeZNRKt4lzpWnt98bEYpqc=;
	b=qKnwbOgULESQrlQzZB97exBrQnKdUJ9d52Z+1ysEtGTLvkVx2UaPMKfSO4ecBU0G1T
	+rA+fD0v3bxhbyt2iCG5xEcg+SjhMS1+yXG9glly4+MDUB3YGt4Jxg4MIpUjYU1gC4Pc
	bi6yi93JSJ99WltzgEWrmD3hFWzkx7FWc2c9YjprhLPdMkIkC1tlNAPEJVxt7HSVxQsQ
	6hXtV9zp7ihZPqBTu1nLA4ICUSVw/G/TqK2gLwd5mEXRSGA0KAU9eiBxjvCrFZFOcvb6
	VtOekMLuoxOLymIxKhCG+toVABZdYJvyz9kU6V/c9DusVqUGS438YjDak9WOp0S4V90P
	Hx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AbnPXdZwtaarG36HlJdz3xeZNRKt4lzpWnt98bEYpqc=;
	b=LC+XtV+KxBcxx+ctjeVyDGsJeUAB9IIVPhoU2Tmm2yTXHFG+qTOnpYTaaZzwu3y+1C
	Odd0dKifHKYvykcWqfWoMTS2dNUhJmLu1F87NYlzpZ7SuwtGuOe0GhD0aarA4liNxf8T
	3JLNX1IsYs+kUK/JodisdhfR+HIO1m+yZ7Z974NBu++VDYRR9IYR/RyZmAUvq/K+qeme
	ja2iKJVb8S3u7S7y/JP7AzcpRG5MWw0xNG5OA0Uc89Ez4XoVsC8kQJviI9aBD/r/OaFB
	jEZOBdMwx4fK7Dz/BjemajAmtXii/Tx6u7ed6p4mybKMzoGlttmA0hxNs2oEfhp2iPtl
	vc1A==
X-Gm-Message-State: AHPjjUhKm5aVMwf/uoBEmSHcEIRTzuuKaQxqA7SIuFHr6fvynHOmZBYa
	ZLF6d3M3KqjtzSt5
X-Google-Smtp-Source: ADKCNb6xrNwnQsA3IObA4eLY+SqlLVR7ajZSg9Q6GzCh5vfBAoxPK78MINjFe40vs2DXOdrwF4sLCw==
X-Received: by 10.98.93.152 with SMTP id n24mr12005794pfj.288.1505142667408;
	Mon, 11 Sep 2017 08:11:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	75sm4374067pfx.145.2017.09.11.08.11.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 08:11:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Sep 2017 08:10:54 -0700
Message-Id: <20170911151056.4577-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911151056.4577-1-raj.khem@gmail.com>
References: <20170911151056.4577-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] opencv: Fix build with clang
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
X-List-Received-Date: Mon, 11 Sep 2017 15:11:06 -0000

-isystem is not needed even with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opencv/opencv/0001-Dont-use-isystem.patch      | 26 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.3.bb       |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
new file mode 100644
index 000000000..6dd48fcdc
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
@@ -0,0 +1,26 @@
+From 2bc6bb9831d07f035fea74ea745cea43dd5f9ef9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Sep 2017 23:48:31 -0700
+Subject: [PATCH] Dont use isystem
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ cmake/OpenCVPCHSupport.cmake | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+Index: git/cmake/OpenCVPCHSupport.cmake
+===================================================================
+--- git.orig/cmake/OpenCVPCHSupport.cmake
++++ git/cmake/OpenCVPCHSupport.cmake
+@@ -17,7 +17,8 @@ IF(CMAKE_COMPILER_IS_GNUCXX)
+     IF(NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.2.0")
+         SET(PCHSupport_FOUND TRUE)
+     ENDIF()
+-
++    SET(CMAKE_INCLUDE_SYSTEM_FLAG_C "-I")
++    SET(CMAKE_INCLUDE_SYSTEM_FLAG_CXX "-I")
+     SET(_PCH_include_prefix "-I")
+     SET(_PCH_isystem_prefix "-isystem")
+     SET(_PCH_define_prefix "-D")
diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index efbb2f52a..25f247662 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -49,8 +49,8 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://0001-build-workaround-GCC-7.1.1-compilation-issue-with-sa.patch \
     file://0002-imgcodecs-refactoring-improve-code-quality.patch \
     file://0003-imgproc-test-add-checks-for-remove-call.patch \
+    file://0001-Dont-use-isystem.patch \
 "
-
 PV = "3.3+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.14.1


