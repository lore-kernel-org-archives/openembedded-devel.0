Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5BE0871C27
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jul 2017 10:27:31 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id t72so20473622lff.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jul 2017 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aS2DLTI2Tfj6Rt0vHCjxE5oXvqYHLOvVJ1Ki2luX5XM=;
	b=gWCCRVMnBGIAzzRZKnHk2thhpkfowEiTAk6jsrYycapv4zQzqHl9qiVYQqrpixKXRp
	l97HaE2pR75vFV2sH/AUIMClajKa6Twh/YqqjeWK3zBdmuAVy543K1nSYl7tZP5FPfHC
	yiDxIo6UuHSD0rS1c0rT8EBaR6EeO+5l42gfnkgc3J4kY6MH1RR+eCwDIeXcOeIfuRr7
	JgsDgNQtMo7D1FAXWxXLJjvGmcXiEgyNW4afR/lpEJ1gzJ4v42DblZaqm8KJ6Z66M3Yi
	xLnaVdfgk9Y0bXFpPbJCw5aosTUkLcQ7TCdlWbIWX0s7Wzh90mRMctK+RUw3rBBbChv0
	MLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aS2DLTI2Tfj6Rt0vHCjxE5oXvqYHLOvVJ1Ki2luX5XM=;
	b=Ypak8Kb9m8hBo/+z7PxYPApoBgrl/fSDui6YGD1xprCA357lwTcQi9X2IofLVQZHZz
	Vw7ci+iim8GziFpfpyAgUbz6up+lL3uLjAijd4moCUpGZPYsIFuMoy1Wjc6kUwSKWE+t
	fcxOyax01SJJAYRVFv651dNcUTeiGNoPzH4XZe0n2FdYhW811DpOim3ikDrxNpBPg/jm
	EJJyF4J5xlWnD8J4QagTAp1kai2stA0VPGsW09YMX1CkBkh8d4nigUzpJrCtIQIuydpM
	fj7e9rtZzAYrgkZe9fIBgDkSJKAZ0RAmosy4pWqQgv51oL1+tJ9RSH8BL3MyELhsHCu1
	ccvw==
X-Gm-Message-State: AIVw111PkrXC/UKXvpLmDHj5GOHk/Fp+VyjR/0Vn3TXH4QJEiIbmEp+9
	6AiPVto6vha9VXVU
X-Received: by 10.80.146.79 with SMTP id j15mr1829155eda.17.1499423251909;
	Fri, 07 Jul 2017 03:27:31 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.242]) by smtp.gmail.com with ESMTPSA id
	w26sm1541986edw.24.2017.07.07.03.27.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Jul 2017 03:27:30 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jul 2017 12:27:15 +0200
Message-Id: <1499423235-1999-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] librcf: support build on mips/mipsel
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
X-List-Received-Date: Fri, 07 Jul 2017 10:27:32 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This fixes following errors when building on mips/mipsel:
...
src/RCF/ByteOrdering.cpp:115:13: error: 'MachineByteOrder' was not declared in this scope
         if (MachineByteOrder != NetworkByteOrder)
             ^~~~~~~~~~~~~~~~
src/RCF/ByteOrdering.cpp:123:13: error: 'MachineByteOrder' was not declared in this scope
         if (MachineByteOrder != NetworkByteOrder)

src/RCF/ByteOrdering.cpp:131:16: error: 'MachineByteOrder' was not declared in this scope
         return MachineByteOrder == NetworkByteOrder;

src/RCF/ByteOrdering.cpp:136:16: error: 'MachineByteOrder' was not declared in this scope
         return MachineByteOrder == LittleEndian;
...

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../librcf/librcf/0001-mips-mipsel-support.patch   | 34 ++++++++++++++++++++++
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch

diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch
new file mode 100644
index 0000000..6d873c4
--- /dev/null
+++ b/meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch
@@ -0,0 +1,34 @@
+From a0e6a851a7504150e5191b206b8885fa17ce9ab3 Mon Sep 17 00:00:00 2001
+From: Ming Liu <peter.x.liu@external.atlascopco.com>
+Date: Fri, 7 Jul 2017 10:46:45 +0200
+Subject: [PATCH] Support build for mips/mipsel
+
+Upstream-Status: Pending
+
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ src/RCF/ByteOrdering.cpp | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/RCF/ByteOrdering.cpp b/src/RCF/ByteOrdering.cpp
+index 5f3d937..ab99967 100755
+--- a/src/RCF/ByteOrdering.cpp
++++ b/src/RCF/ByteOrdering.cpp
+@@ -64,6 +64,14 @@ namespace RCF {
+ 
+     const ByteOrder MachineByteOrder = LittleEndian;
+ 
++#elif defined(_MIPSEL) || defined(__MIPSEL) || defined(__MIPSEL__)
++
++    const ByteOrder MachineByteOrder = LittleEndian;
++
++#elif defined(_mips) || defined(__mips) || defined(__mips__)
++
++    const ByteOrder MachineByteOrder = BigEndian;
++
+ #elif defined(__bfin__)
+ 
+     const ByteOrder MachineByteOrder = LittleEndian;
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 4c9683a..4dac10e 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
            file://0001-Add-CMake-build-files.patch \
            file://aarch64-support.patch \
            file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch \
+           file://0001-mips-mipsel-support.patch \
           "
 
 SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
-- 
2.7.4


