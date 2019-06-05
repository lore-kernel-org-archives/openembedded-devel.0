Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E562C7DE75
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 03:05:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x55353L8011405
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jun 2019 20:05:14 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 20:04:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jun 2019 11:04:01 +0800
Message-ID: <1559703841-263740-8-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] multipath-tools: upgrade 0.8.0 -> 0.8.1
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
X-List-Received-Date: Wed, 05 Jun 2019 03:05:23 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ools-modify-Makefile.inc-for-cross-compil.patch | 28 ++++++++++++----------
 ...ath-tools_0.8.0.bb => multipath-tools_0.8.1.bb} |  2 +-
 2 files changed, 16 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.8.0.bb => multipath-tools_0.8.1.bb} (98%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch b/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
index 4fa7960..3919f99 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
@@ -1,10 +1,7 @@
-From a805b601fcf4bb9e269566a8d25e48d9e60915c0 Mon Sep 17 00:00:00 2001
+From c3436ec8a502a40579abf62be0a479fa9d7888ad Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 26 Nov 2018 11:14:24 +0800
-Subject: [PATCH] From 8bdd4481d822b6625d8bf719431ca74ed1b5e021 Mon Sep 17
- 00:00:00 2001 From: Changqing Li <changqing.li@windriver.com> Date: Mon, 16
- Jul 2018 15:56:37 +0800 Subject: [PATCH] multipath-tools: modify Makefile.inc
- for cross-compilation
+Date: Tue, 4 Jun 2019 11:39:39 +0800
+Subject: [PATCH] multipath-tools: modify Makefile.inc for cross-compilation
 
 Do not look for systemd info on the host, and allow us to pass in CFLAGS
 using the OPTFLAGS variable.
@@ -27,23 +24,28 @@ remove change about CFLAGS part, since patch 0024 already have similar function.
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
-update for version 0.7.9
+update for version 0.8.1
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- Makefile.inc | 6 ------
- 1 file changed, 6 deletions(-)
+ Makefile.inc | 11 -----------
+ 1 file changed, 11 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index 295afb9..7136db3 100644
+index 661f141..3f9fd28 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -38,12 +38,6 @@ ifndef RUN
+@@ -35,17 +35,6 @@ ifndef RUN
  	endif
  endif
  
 -ifndef SYSTEMD
--	ifeq ($(shell systemctl --version > /dev/null 2>&1 && echo 1), 1)
--		SYSTEMD = $(shell systemctl --version 2> /dev/null |  sed -n 's/systemd \([0-9]*\)/\1/p')
+-	ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
+-		SYSTEMD = $(shell pkg-config --modversion libsystemd)
+-	else
+-		ifeq ($(shell systemctl --version >/dev/null 2>&1 && echo 1), 1)
+-			SYSTEMD = $(shell systemctl --version 2> /dev/null | \
+-				sed -n 's/systemd \([0-9]*\).*/\1/p')
+-		endif
 -	endif
 -endif
 -
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.0.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb
similarity index 98%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.0.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb
index 0cff48d..55866e9 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.0.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb
@@ -46,7 +46,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRCREV = "eb688e1833e9533bfd9496ddc37eecc93590defa"
+SRCREV = "e23b5d7cf67a9c543e118f2f6b902594a02a804a"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


