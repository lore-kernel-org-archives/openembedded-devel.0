Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1D43571ADA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jul 2017 20:15:24 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id s66so82221140pfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jul 2017 13:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wZXmoQu3G36SREpHzivBnNCegftlbqcj4Bmuxku2IEg=;
	b=MxmsUP/IGQ769KjfiOShW2FIpwM7t2Wkkx75BUXxhfILpcoGPbdrKoDusV9LQSkY6z
	meqkQ9/xECxiWdBzVNsd7Lk84BoWuVfwdVzbaQ/f9phK+KqqpGPvtooLUcSoC0Fttwi8
	bTse2it02C7p4el22ST4eMUen4VSjdw6Bp2KbJ+Jh41nqB915KfRbRyPfePTKcjpxfbe
	rAnyezOv/LxbEL493PTOB+1Ckaz7pVApsM1u82ZYHhkgUy34TsSQ18pw/ZeEHtZIt5yp
	ZcYEdy074SiW7vEkSnuCPBM0+7jekSuewtXctH0jzfBBf4kwfz9V+27otZx8usFGVGjS
	zaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wZXmoQu3G36SREpHzivBnNCegftlbqcj4Bmuxku2IEg=;
	b=S40b8f73fdRGd1DfKAC4BnuwWzcGWs/4lX1VBJtKi+WUljg3fmeQfBXIvHYiFc2108
	kcxdBOgjlVwgGw+iJBLEgamJFMB6i3bdyMozBTnURx+vpy4FPj0ZK8M6jtIo/bs4d9pw
	A/FUxLprYBSTEN0/YoMxK4jgkqlcW58ewLWQbo7pVffpazNOsfvNf8bpcgKlPJ46rLz2
	7tO4q7b9VZX//xJLRIIM3TZ5xr1GjRN4vlZC8OtqF/vmce/QTTI86D8YVCVE9ozlGcVA
	ddgrCZINUajoSKF/CoP79lHFKrvxSintd8UnAZniOTp6DVA/4OPfGfjUBPe2xRj7yrs4
	5oGg==
X-Gm-Message-State: AIVw1101ZwSDNYlAdg4SvZkAkHCGySBCg3WXdSdJ8OpOu72s55O1LJQj
	62Yi8cYBjWClRkp+
X-Received: by 10.84.170.67 with SMTP id i61mr2280657plb.114.1498940126046;
	Sat, 01 Jul 2017 13:15:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	g5sm20020227pgc.42.2017.07.01.13.15.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 13:15:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jul 2017 13:15:15 -0700
Message-Id: <20170701201515.24835-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170701201515.24835-1-raj.khem@gmail.com>
References: <20170701201515.24835-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] librcf: Define byteorder for powerpc machines
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
X-List-Received-Date: Sat, 01 Jul 2017 20:15:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../librcf/0001-Check-for-__powerpc__-define.patch | 28 ++++++++++++++++++++++
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb  |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch

diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch
new file mode 100644
index 000000000..d91accf1d
--- /dev/null
+++ b/meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch
@@ -0,0 +1,28 @@
+From ac7316679e30f7013604b19aa0949a0744e91d2f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 1 Jul 2017 13:06:30 -0700
+Subject: [PATCH] Check for __powerpc__ define
+
+Also check for gcc's internal define for ppc platform
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/RCF/ByteOrdering.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/RCF/ByteOrdering.cpp b/src/RCF/ByteOrdering.cpp
+index 278ca80..9f9c446 100755
+--- a/src/RCF/ByteOrdering.cpp
++++ b/src/RCF/ByteOrdering.cpp
+@@ -36,7 +36,7 @@ namespace RCF {
+ 
+     const ByteOrder MachineByteOrder = BigEndian;
+ 
+-#elif defined( __ppc__ )
++#elif defined( __ppc__ ) || defined( __powerpc__ )
+ 
+     const ByteOrder MachineByteOrder = BigEndian;
+ 
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 1287eb014..dee74277c 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -15,7 +15,8 @@ SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
            file://aarch64-support.patch \
            file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch \
            file://mips-support.patch \
-          "
+           file://0001-Check-for-__powerpc__-define.patch \
+           "
 
 SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
 SRC_URI[sha256sum] = "bbfcc88de502c39604878c395f516b03fff4eac63eb4f7f44c07d433839712dd"
-- 
2.13.2


