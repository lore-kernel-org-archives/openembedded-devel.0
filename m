Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 998AF607AD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:17:53 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id j26-v6so7333033pfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/GfPXZKilOavvh474ParmxzFvY/xhFLlku2O//o/Jq4=;
	b=AjXJAH7Vj/mUkMZh8zHG/2kUPyl0ILyL+jKbJQyXOzlnI4HieNbj4vQiLcSZtT1Kuk
	LtkHODmHimOK3kGrK8nwxpc+hy4yEKE6xdGalxBaC6IZP7xZjx0as0TpxVLQ5EGftyAo
	8OrJ8Sh93KpZvNKjXyl1ZsBYFFWzb3I0c5ynX+CGNJJA2wgcUZgKnZc9mT0yFoHo4A75
	HYG4XwEZ5T2oOA0O19xT3UM7MsvrSHtR0J6YGhOn8oqO7qqLqt89jH3V63c/iC82pJ7k
	Y8PjbJR9NR+ggzhjc6/ZbDnYQuz+VA8Wcz+XN/+gULkK3Mwa0HNRMUK7sOsJoyNbSZrH
	6eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/GfPXZKilOavvh474ParmxzFvY/xhFLlku2O//o/Jq4=;
	b=WLpdUomVTNqU3ycLS7Q7lTSy0U70Cyb4/+V1KMKa8C3F/sblxLIXZcak0iR2vjf55C
	1A4022CqtuA8oVMA7yfoyhSpbn+cXGiJDIFVRcbh08ZgsSzWSliY4LG9zRn99ZlNev0f
	6vkTPU5qIB/mRXJXf1+6eJuj5Q3IuAVay8TSPtoMI4IdkqXM8vsT/w/wpNdZuvCd0xiM
	1ZdmE7awFGBoG1+WKC545X2ctQqIu4OLCQ289kO/kO4ce9VL9TQ3UKiuLi7f5JEQ/x9I
	DQkdEaaIxG6W137uNYppTCb688PEjHfVu6xhjdVXOiiDN1F+pMHKB2PTg8Tm5oEyejR9
	rxMQ==
X-Gm-Message-State: AOUpUlFfabk0CGLUS1K6hd7C/SwNBjTKhWcO5m38EgCPStDqoyuQfMhP
	mNrB/Uj/vXCJaUiAplJTM1lKgzkk
X-Google-Smtp-Source: AA+uWPzogVD9YxY3YmdFaGd8iEAJIOyqIZWMUgWE3ahKzjoWv50WgMb3TbDd2shYBqafGSuEni0PDA==
X-Received: by 2002:a63:571d:: with SMTP id
	l29-v6mr15511107pgb.296.1534148274103; 
	Mon, 13 Aug 2018 01:17:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:17:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:24 -0700
Message-Id: <20180813081742.6961-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 03/21] oscam: Upgrade to latest rev 11431 on trunk
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
X-List-Received-Date: Mon, 13 Aug 2018 08:17:53 -0000

Add patch to fix build with glibc 2.28+
Remove backported patches which are no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...macros.h-for-major-minor-definitions.patch | 26 +++++++++++++
 .../oscam/oscam/respect-cflags.patch          | 38 -------------------
 .../recipes-dvb/oscam/oscam_svn.bb            |  6 +--
 3 files changed, 29 insertions(+), 41 deletions(-)
 create mode 100644 meta-multimedia/recipes-dvb/oscam/oscam/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
 delete mode 100644 meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch b/meta-multimedia/recipes-dvb/oscam/oscam/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
new file mode 100644
index 0000000000..d3d89e333b
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/oscam/oscam/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
@@ -0,0 +1,26 @@
+From a372fe467495a674ad6244b67e83dfbfa8455f51 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 13:54:32 -0700
+Subject: [PATCH] include sys/sysmacros.h for major/minor definitions
+
+csctapi/ifd_db2com.c:27: undefined reference to `minor'
+collect2: error: ld returned 1 exit status
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ globals.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/globals.h b/globals.h
+index bd12244..9e10225 100644
+--- a/globals.h
++++ b/globals.h
+@@ -36,6 +36,7 @@
+ #include <termios.h>
+ #include <inttypes.h>
+ #include <sys/utsname.h>
++#include <sys/sysmacros.h>
+ 
+ /*
+  * The following hack is taken from Linux: include/linux/kconfig.h
diff --git a/meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch b/meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch
deleted file mode 100644
index 179d04a559..0000000000
--- a/meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Backport
-http://www.streamboard.tv/oscam/changeset/10068
-http://www.streamboard.tv/oscam/changeset/10070
-
-Index: /CMakeLists.txt
-===================================================================
---- a/CMakeLists.txt	(revision 10067)
-+++ b/CMakeLists.txt	(revision 10068)
-@@ -625,8 +625,8 @@
-     list(GET GCC_VERSION_COMPONENTS 0 GCC_MINOR)
-     add_definitions ("-W -Wall ")
--    set (CMAKE_C_FLAGS "-Wall -O2")
--	set (CMAKE_CXX_FLAGS "-Wall -O2")
--    set (CMAKE_C_FLAGS_DEBUG "-O0 -ggdb")
--    set (CMAKE_CXX_FLAGS_DEBUG "-O0 -ggdb")
-+    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -O2")
-+	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O2")
-+    set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -ggdb")
-+    set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -ggdb")
- endif (CMAKE_COMPILER_IS_GNUCC)
- # some optimisations
-Index: /csctapi/CMakeLists.txt
-===================================================================
---- a/csctapi/CMakeLists.txt	(revision 10069)
-+++ b/csctapi/CMakeLists.txt	(revision 10070)
-@@ -6,8 +6,8 @@
-     list(GET GCC_VERSION_COMPONENTS 0 GCC_MINOR)
-     add_definitions ("-W -Wall ")
--    set (CMAKE_C_FLAGS "-Wall -O2")
--	set (CMAKE_CXX_FLAGS "-Wall -O2")
--    set (CMAKE_C_FLAGS_DEBUG "-O0 -ggdb")
--    set (CMAKE_CXX_FLAGS_DEBUG "-O0 -ggdb")
-+    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -O2")
-+	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O2")
-+    set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -ggdb")
-+    set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -ggdb")
- endif (CMAKE_COMPILER_IS_GNUCC)
- # Mac extra removes to avoid ranlib warnings in some situations
diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index cac517ff5d..2bd970fd5d 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libusb1 openssl pcsc-lite"
 
 SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
-    file://respect-cflags.patch \
-"
-SRCREV = "9164"
+           file://0001-include-sys-sysmacros.h-for-major-minor-definitions.patch \
+           "
+SRCREV = "11431"
 PV = "1.10+${SRCPV}"
 
 S = "${WORKDIR}/trunk"
-- 
2.18.0


