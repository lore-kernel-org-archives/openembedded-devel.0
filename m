Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id C10597F2DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 22:50:40 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id d10so3471420pgo.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LYuobVuqpEYlOx8qYPO0mvy3u2crxKgiRdzPLZE3fzE=;
	b=MxNiExhfc1BeCwmG8bORfKMe3NK7BtNS0rZWlw+n50qrvoi+RF1I+ULq46+oU+r7QL
	hzGmO/V23q9pP/uXr8uv+9BunnVMABEHUWKw+PdQA7s/g08D7XuStKWYmklvSaLMXx9o
	x7fcYXVqA7NFeTZ6K3kMEX5UF8UBGkVes7PcKuwG7x0/tngfmS129DUogGaa6Jn1rKXI
	fYbsAUGY8YPgWMV/XyZFUGx4BWcIAudqEJL6Wpy9SBJubU8qxM+WGAvcANc7XqHlVw8u
	1Xju7OJuEM4AwdmnZAuGzeejm040Enl1Czk7BvJJBBSCnUrNBlv44FRdkNtyreMtTGwG
	A4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LYuobVuqpEYlOx8qYPO0mvy3u2crxKgiRdzPLZE3fzE=;
	b=uoJThhRfDUSv9oWdPrdftfzLcVcB1omJJtG3zMBKbPQYgl/bq6GpFIBuHH08IO8QhB
	dTBi7VRfkNKLuLJjEe7NzzqVJx+322A1vr+HCpFNsJ46SK2M72E2P9leNlWieJIBlvMO
	7U2TPTu5foy8V9SJTDJ/FEACNYIIb5/PSqtPmPxk5NZHpTSZbqJtiGVzDGUZW5c9MyBP
	ZMPd9dclwTOCQxUvm5vkEGXXn/D1X5gdDlBqQwv9sm6Vx51jxpc1Gol3nsm0OnXNU5iF
	dQ0suxr2MUJa9knR5YXvr+rwMlyXRGS2aAdjteDOb26NTU2jgYF2wyyG52tIfohboA+L
	MK9Q==
X-Gm-Message-State: APjAAAXEbd0ylkH8mqYIk5UZH6+chwT+xRXS1sqcEJz/e140hDquNU4m
	ZVcAIzdVRM+FMBc6ACxOJTHSq7XEg08=
X-Google-Smtp-Source: APXvYqxSeTWcL1kMeqKG4Ajw/3PTnvDJwkdG1Hn08GYNIboI+8tORzUVNZYoxJjfv+vbSDXClhrmSw==
X-Received: by 2002:a17:90b:28b:: with SMTP id
	az11mr4334174pjb.22.1567464641104; 
	Mon, 02 Sep 2019 15:50:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	g3sm14834602pjx.32.2019.09.02.15.50.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 15:50:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Sep 2019 15:50:26 -0700
Message-Id: <20190902225026.35622-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] iperf2: Fix build with latest libc++
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
X-List-Received-Date: Mon, 02 Sep 2019 22:50:41 -0000
Content-Transfer-Encoding: 8bit

This patch was accidentally dropped in past iperf2 upgrades therefore
bring it back see 0647b7d6400b1c40fc6cb40596e56b852ceb85c5

helps in fixing  build with latest clang/libc++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nition-considering-stdbool.h-being-p.patch | 39 +++++++++++++++++++
 .../recipes-benchmark/iperf2/iperf2_2.0.13.bb |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
new file mode 100644
index 0000000000..44b902b5e8
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
@@ -0,0 +1,39 @@
+From 6df092a4153c6c37cfaddcabf2cd25a910a7f6e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Sep 2019 15:40:52 -0700
+Subject: [PATCH] Detect bool definition considering stdbool.h being present
+
+This helps in defining the value correctly on different platforms e.g.
+clang/libc++ depends on the definition coming from stdbool.h
+current builds fail to compile therefore
+
+TMPDIR/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/iperf2/2.0.13-r0/recipe-sysroot/usr/include/c++/v1/type_traits:742:29: error: redefinition of '__libcpp_is_integral<int>'
+template <>          struct __libcpp_is_integral<int>                : public true_type {};
+                            ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/dast.m4 | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/m4/dast.m4 b/m4/dast.m4
+index 2f729d4..7085955 100644
+--- a/m4/dast.m4
++++ b/m4/dast.m4
+@@ -11,7 +11,12 @@ AH_TEMPLATE([false])
+ 
+ AC_DEFUN(DAST_CHECK_BOOL, [
+ 
+-AC_CHECK_SIZEOF(bool)
++if test "$ac_cv_header_stdbool_h" = yes; then
++  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
++else
++  AC_CHECK_SIZEOF(bool)
++fi
++
+ if test "$ac_cv_sizeof_bool" = 0 ; then
+   AC_DEFINE(bool, int)
+ fi
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
index 2bd552d1d8..4a520e3be5 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
@@ -4,7 +4,9 @@ SECTION = "console/network"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
 
-SRC_URI = " ${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \
+           file://0001-Detect-bool-definition-considering-stdbool.h-being-p.patch \
+"
 
 SRC_URI[md5sum] = "31ea1c6d5cbf80b16ff3abe4288dad5e"
 SRC_URI[sha256sum] = "c88adec966096a81136dda91b4bd19c27aae06df4d45a7f547a8e50d723778ad"
-- 
2.23.0


