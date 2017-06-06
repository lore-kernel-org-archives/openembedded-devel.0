Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5769D77D67
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jun 2017 04:07:30 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n195so90853378wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 21:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pZkBFYVVU1bAtmxnvyUb2+iukixrHWPcZeLwKzF3P78=;
	b=hD09GKWlaAzI8dFz2Jhw7cs0NHDf3rsQOa6l1SRKux/bnaTJrPxWAMC6HAN1QfjFU1
	bwEfLYsUOxaw7RytX/EOFL+jAgd2Id9nRH7r3OgfkMNPY8dTQ6n6saQBvUg+Wk3Fl3R1
	kuKBIjduehLQUyU++JuuikLQYyYbFV2pQjUkGx/nAMupTEczVRd/zOoA8qODbGU+NJ5a
	R9qIDdpBwk1f6Dmrlb1w30sRA8DnZPxKqwKYpUhWxIfG7aVti2MiMbnkykAhSxcr3QqJ
	1wXUrQq/+IJxDmDbbYURz52IeQS/2qn1AIuCbHJVT32XpRm/4SkxkTUypzB+dpMbqIRa
	65bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pZkBFYVVU1bAtmxnvyUb2+iukixrHWPcZeLwKzF3P78=;
	b=SLGHmO4O1KhFmikfRmXianR8QSyrl5Nx4VlGJQtnLs0CQRBw3PSOYwbNO2AWeOtqJ5
	kbl3gtwAwT9srC0bgRb57br4+Iya+M3xh89cTbCDVB6A2GPQ7BRGg5rr/w3Nid86o2+6
	oyUhmgiHL0Kl+odsSYwn8UhXJ1MkseVavf3vKwClfZ8Ydft3HqC7dxdPbmyLFvgTmt7Q
	RJ/x4Q6vOAGsH2xLGyqU/TToM9s1+dfcNFgMPAjwP1crY6o2ZHHGe4O9GOjw7eAu7HlB
	cu2AszXhBk4pkm2ijvwmCL/VAJ5y+XMgZSwr9nSBtCB2ZZQaQ/S0rXSQ4AYBS+AX/gYX
	fJmw==
X-Gm-Message-State: AODbwcAevlbv4l5CZgMjADpL7gEhaBiM0qvezff+YFhoiPf9xBDwgExe
	o1opRHAocg6DMVFk
X-Received: by 10.80.171.28 with SMTP id s28mr11588687edc.140.1496722051372;
	Mon, 05 Jun 2017 21:07:31 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.199.183]) by smtp.gmail.com with ESMTPSA id
	e18sm5548134edd.27.2017.06.05.21.07.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jun 2017 21:07:30 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jun 2017 06:07:21 +0200
Message-Id: <1496722041-19402-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] librcf: fix a clang compiling issue
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
X-List-Received-Date: Tue, 06 Jun 2017 04:07:31 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A error was observed with clang compiler, as follows:
| src/RCF/RCF.cpp:49:
| src/RCF/ClientStub.cpp:28:
| include/RCF/Future.hpp:49:26: error: 'enrol' is a private member of 'RCF::ClientStub'

it can be fixed by declaring Future as a friend class of ClientStub.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 ...lientStub.hpp-fix-a-clang-compiling-issue.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch

diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
new file mode 100644
index 0000000..3b39fa1
--- /dev/null
+++ b/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
@@ -0,0 +1,35 @@
+From d78851b6f87f2472f041102d7b3726ffc009bfad Mon Sep 17 00:00:00 2001
+From: Ming Liu <peter.x.liu@external.atlascopco.com>
+Date: Tue, 6 Jun 2017 05:54:20 +0200
+Subject: [PATCH] ClientStub.hpp: fix a clang compiling issue
+
+A error was observed with clang compiler, as follows:
+| src/RCF/RCF.cpp:49:
+| src/RCF/ClientStub.cpp:28:
+| include/RCF/Future.hpp:49:26: error: 'enrol' is a private member of 'RCF::ClientStub'
+
+it can be fixed by declaring Future as a friend class of ClientStub.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ include/RCF/ClientStub.hpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/RCF/ClientStub.hpp b/include/RCF/ClientStub.hpp
+index 9882cf4..8465625 100755
+--- a/include/RCF/ClientStub.hpp
++++ b/include/RCF/ClientStub.hpp
+@@ -372,6 +372,8 @@ namespace RCF {
+ 
+     private:
+ 
++        template<typename U>
++        friend class Future;
+         friend class FutureImplBase;
+ 
+         template<
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 51ad7ec..05ffa7a 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=137c2935b51c95068a8b1bbd434ffe2d"
 SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
            file://0001-Add-CMake-build-files.patch \
            file://aarch64-support.patch \
+           file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch \
           "
 
 SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
-- 
2.7.4


