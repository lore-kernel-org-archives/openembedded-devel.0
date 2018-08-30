Return-Path: <diego.rondini@kynetics.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id BB36A748D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 14:44:14 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id h4-v6so6730717edi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 07:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=u4JyJxzS2jreVg6IZEFmzCVIWFjjipC1OH/HMEWBNt0=;
	b=MwaD/K1eYwh17oUPZ2bqVgW8rtxq/OEBgtr3idNU8KWV1x0CZ6C7+9wt9Nsc9C8CmX
	iUnHu993igZuZ8CjPe9tYAWg+ChT5Tf3RO19d4vCGSIhscN9F+elp8h9/w2iDDAPmyFq
	KNvNltmA3DWVBcDCSElv2U8tAznXxailQ6FSpuwHN2V+G7QskuLYWdJiczgAw7XUr4S6
	iJKw/n1BXF/dv75C6uBULjCyV9JKVtoeC2TMWDuEExuEkvAMl4LnNSR4Ej2CuZWDsUlH
	VgxuNpv4vbaunMTpyYrkfC0Ow7AyTEPiYO2TIoM+FltYBpHNdo7a+TBy/Q52fLw1R/F1
	AfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u4JyJxzS2jreVg6IZEFmzCVIWFjjipC1OH/HMEWBNt0=;
	b=Vt57B7ZHQZ7LnNQpwTtJUfmAt3+VEufZ3hK1ZHAMXAuBO9NpbedVqpI4OG1i4kimud
	2y3rSl9txr11cFPTB5Ppg56jR6Om6tTJgBA4cArAhPIBrl05xqS7EKaPe5uwDQZa5Rt8
	6hPixEsZ0hDcjv2kZJON/iiLgg9l7bnoX+YMYGKwl9kka0fyaoW2KTCJUaJeTtRDW0NC
	3Ar/5GcU2tQmz1BeeI06p5VPZi5Vki95tg+kLeg7EjQDOphpNkRLDvJFawkk1wS7b/jU
	kaCkvKwZUQbjMys68DQhOf8mI9yWB7eMUcc+wyJVf5ihfSNcCbmuYANtudwJZVNCtJQr
	MKLA==
X-Gm-Message-State: APzg51DyNMXl1SENoO8hCKz48DOjAZ7ofOHLekIeG4TTC1H/abdJjyvk
	ec1dbFOt9tecc7tIZTe1H9ssG7CjLcEBWFNN
X-Google-Smtp-Source: ANB0Vdadf9Zuzgf4WrCEugzMecOIEdvzey87ur+220FCr2weCQ3WnSYRNTcM5kvpcVkKGUZORNgblw==
X-Received: by 2002:a50:e185:: with SMTP id
	k5-v6mr7686488edl.195.1535640255054; 
	Thu, 30 Aug 2018 07:44:15 -0700 (PDT)
Received: from ip-172-31-7-228.eu-west-1.compute.internal
	(ec2-54-171-5-113.eu-west-1.compute.amazonaws.com. [54.171.5.113])
	by smtp.gmail.com with ESMTPSA id
	p10-v6sm2668202edh.9.2018.08.30.07.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Aug 2018 07:44:14 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2018 14:43:51 +0000
Message-Id: <1535640231-3318-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Gregory Vimont <gregory.vimont@softbankrobotics.com>
Subject: [meta-oe][rocko][sumo][PATCH] tbb: check the version of the cross gcc instead of host gcc
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
X-List-Received-Date: Thu, 30 Aug 2018 14:44:15 -0000

From: Gregory Vimont <gregory.vimont@softbankrobotics.com>

When cross compiling on linux with gcc, the host gcc was used instead of
the cross gcc to set compilation flags according to gcc version.

Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
The reason of the backport is to fix a crash, details here:
http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/120116.html
---
 meta-oe/recipes-support/tbb/tbb.bb                 |  1 +
 .../tbb/tbb/0002-linux-Fix-gcc-version-check.patch | 57 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch

diff --git a/meta-oe/recipes-support/tbb/tbb.bb b/meta-oe/recipes-support/tbb/tbb.bb
index bad9481..f870104 100644
--- a/meta-oe/recipes-support/tbb/tbb.bb
+++ b/meta-oe/recipes-support/tbb/tbb.bb
@@ -13,6 +13,7 @@ PV = "${PRDATE}+${SRCPV}"
 SRC_URI = "git://github.com/01org/tbb;branch=${BRANCH} \
            file://cross-compile.patch \
            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
+           file://0002-linux-Fix-gcc-version-check.patch \
            file://tbb.pc \
 "
 
diff --git a/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
new file mode 100644
index 0000000..9824b61
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
@@ -0,0 +1,57 @@
+From aee098f1bf0511c6b5544de3170a9e8b51673b60 Mon Sep 17 00:00:00 2001
+From: Pierre Le Magourou <plemagourou@softbankrobotics.com>
+Date: Tue, 23 Jan 2018 15:25:50 +0100
+Subject: [PATCH] linux.gcc: Fix cross compilation error.
+
+When cross compiling on linux with gcc, the host gcc was used instead of
+the cross gcc to set compilation flags according to gcc version.
+
+When the cross gcc was in version 5.X and the host gcc in version 7.X,
+tbb was compiled with the -flifetime-dse=1 flag that does not exist on
+gcc 5.X.
+---
+ build/linux.gcc.inc | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
+index 5c1889c..a4d6698 100644
+--- a/build/linux.gcc.inc
++++ b/build/linux.gcc.inc
+@@ -41,29 +41,29 @@ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
+ C_FLAGS = $(CPLUS_FLAGS)
+ 
+ # gcc 4.2 and higher support OpenMP
+-ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
+     OPENMP_FLAG = -fopenmp
+ endif
+ 
+ # gcc 4.8 and later support RTM intrinsics, but require command line switch to enable them
+-ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
+     RTM_KEY = -mrtm
+ endif
+ 
+ # gcc 4.0 and later have -Wextra that is used by some our customers.
+-ifneq (,$(shell gcc -dumpversion | egrep  "^([4-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([4-9])"))
+     TEST_WARNING_KEY += -Wextra
+ endif
+ 
+ # gcc 5.0 and later have -Wsuggest-override option
+ # enable it via a pre-included header in order to limit to C++11 and above
+-ifneq (,$(shell gcc -dumpversion | egrep  "^([5-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([5-9])"))
+     INCLUDE_TEST_HEADERS = -include $(tbb_root)/src/test/harness_preload.h
+ endif
+ 
+ # gcc 6.0 and later have -flifetime-dse option that controls
+ # elimination of stores done outside the object lifetime
+-ifneq (,$(shell gcc -dumpversion | egrep  "^([6-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([6-9])"))
+     # keep pre-contruction stores for zero initialization
+     DSE_KEY = -flifetime-dse=1
+ endif
+-- 
+2.15.1
+
-- 
2.7.4


