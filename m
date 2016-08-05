Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id B610C77122
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:38:51 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 33so17114339lfw.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0ioipgFvIJgLXX7ncCf1jdhWvenbkChVdKJ4adQFihs=;
	b=q2WZhWQXaKw9L8opJFmNpxuSH8vne6LCvAbJ16OHcsUYQ5PQpi7KEO6+j5GK00SOdA
	/RdSeovZ8ixFzcqdkf5EJqY5/+vIRXQ1/nadQkje6F3jkfVmUTFGRDUC9QIXPFathDSp
	eLEeiffovGZuG5eSXQ5dM3V221HiA4QTt1tfZwlqkja/un92Pg1bjoyIa3epKlVsjZEz
	BGhIuUQhQq+BQPkc1kbLLHftdRGjjT9FiTKwa9Q6p0GIOwsfC9ApqP2JJIlfSrodK+SB
	tg4lEZ5Ay+snUjAM5+9FDuvDqBZNqeyImZiBcmbWpmiiNi8k5MBW2e/2jS3bXtqU21Rq
	m8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0ioipgFvIJgLXX7ncCf1jdhWvenbkChVdKJ4adQFihs=;
	b=fxjnikbTaEfqmHFOuoXQCNeiuMos6Fl8w7acGsKKYiCxooDYb3wEcYo0xkngg4Irw0
	dl+C0N74TZrl3Wu3PhV7nc/5dmO2E0wVhOqVXQFZSOeWkBVftxQHV2Ohu8INNOljFTmi
	1Ie51avZjudIvID08kjr0ojYrzcphU/Xm+nIRXTM4BCvpvCAT/q/G+WYXx60shHyPlFl
	Grj2gVtY4XaSUG+WsLaJtSUPjVVUkSlf6yG4ewa6GnRTsMQGlg2NDmb62oLktCzQikdE
	hwctlT90lGQ7EQbxznZeZFyBNldrZ3Jb1W0GP4MLvJZe38WLPqyfiWrDikPlFGSKiX9B
	BnxA==
X-Gm-Message-State: AEkooutjlYyVpReE/+IdXbLdKfGhjZY9VgMH9Zn+5luNs6kRoYKn8wg1JXsI2cShmQr9og==
X-Received: by 10.25.18.227 with SMTP id 96mr20232692lfs.183.1470415130761;
	Fri, 05 Aug 2016 09:38:50 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	r190sm3351353lfg.49.2016.08.05.09.38.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 09:38:49 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>, raj.khem@gmail.com,
	ml@embed.me.uk
Date: Fri,  5 Aug 2016 18:38:47 +0200
Message-Id: <1470415127-13908-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH] opencv: Fix build with gcc 6.0
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
X-List-Received-Date: Fri, 05 Aug 2016 16:38:54 -0000

It seems like gcc 6.0 does not have the same behaviour as previous 5.x
with regards isystem flag.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../recipes-support/opencv/opencv/fixgcc60.patch   | 30 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.1.bb       |  4 +--
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/fixgcc60.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch b/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
new file mode 100644
index 000000000000..5d0bf97cab63
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
@@ -0,0 +1,30 @@
+diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
+index 28ccc1c6be4f..b0e1cbf77287 100644
+--- a/cmake/OpenCVPCHSupport.cmake
++++ b/cmake/OpenCVPCHSupport.cmake
+@@ -19,7 +19,7 @@ IF(CMAKE_COMPILER_IS_GNUCXX)
+         ARGS ${CMAKE_CXX_COMPILER_ARG1} -dumpversion
+         OUTPUT_VARIABLE gcc_compiler_version)
+     #MESSAGE("GCC Version: ${gcc_compiler_version}")
+-    IF(gcc_compiler_version VERSION_GREATER "4.2.-1")
++    IF(gcc_compiler_version VERSION_GREATER "4.2.-1" AND gcc_compiler_version VERSION_LESS "6.0.0")
+         SET(PCHSupport_FOUND TRUE)
+     ENDIF()
+ 
+diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
+index 3a23cd73633d..1fea1578b1d9 100644
+--- a/cmake/OpenCVUtils.cmake
++++ b/cmake/OpenCVUtils.cmake
+@@ -76,7 +76,11 @@ function(ocv_include_directories)
+     if("${__abs_dir}" MATCHES "^${OpenCV_SOURCE_DIR}" OR "${__abs_dir}" MATCHES "^${OpenCV_BINARY_DIR}")
+       list(APPEND __add_before "${dir}")
+     else()
+-      include_directories(AFTER SYSTEM "${dir}")
++	    if (gcc_compiler_version VERSION_LESS "6.0.0")
++		    include_directories(AFTER SYSTEM "${dir}")
++	    else()
++		    include_directories(AFTER "${dir}")
++	    endif()
+     endif()
+   endforeach()
+   include_directories(BEFORE ${__add_before})
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index c41baec7bba8..8ab9a2b4e071 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
             git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib \
             git://github.com/Itseez/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=party3;name=party3 \
             file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
+            file://fixgcc60.patch \
             file://fixpkgconfig.patch"
 
 PV = "3.1+git${SRCPV}"
@@ -145,6 +146,3 @@ do_install_append() {
     install -d ${D}${datadir}/OpenCV/samples/bin/
     cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
 }
-
-# http://errors.yoctoproject.org/Errors/Details/68617/
-PNBLACKLIST[opencv] ?= "BROKEN: fails to build with gcc-6"
-- 
2.8.1


