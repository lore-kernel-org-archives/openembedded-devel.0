Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A84E75FB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 03:11:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H3BifJ018558
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:11:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 16 Jul 2015 20:11:44 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jul 2015 11:10:03 +0800
Message-ID: <1437102603-25983-5-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
References: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 4/4] multipath-tools: upgrade git rev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jul 2015 03:11:44 -0000
Content-Type: text/plain

There is no new release for package multipath-tools. And just upgrade
its git rev to the latest commit 0.5.0-144-g770e6d0 on Feb 16, 2015.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-support/multipath-tools/files/makefile_inc.patch  | 11 +++++++----
 .../recipes-support/multipath-tools/multipath-tools_git.bb    |  8 ++++++--
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch b/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
index ff71f39..71963e0 100644
--- a/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
@@ -7,6 +7,9 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
+Update for version 0.5.0-144-g770e6d0
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 --- a/Makefile.inc
 +++ b/Makefile.inc
@@ -20,10 +23,10 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 -	endif
 -endif
 -
- prefix      = 
- exec_prefix = $(prefix)
- bindir      = $(exec_prefix)/sbin
-@@ -49,7 +43,10 @@ ifndef RPM_OPT_FLAGS
+ ifndef SYSTEMDPATH
+ 	SYSTEMDPATH=usr/lib
+ endif
+@@ -53,7 +47,10 @@ ifndef RPM_OPT_FLAGS
  	RPM_OPT_FLAGS = -O2 -g -pipe -Wformat-security -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4
  endif
  
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index bb4e15c..37b5fef 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -26,9 +26,12 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
 #
 #    includes important systemd related structure size fix
 #
-SRCREV = "aec68ab217fd2956443b27ceeb97dd6475267789"
+#SRCREV = "aec68ab217fd2956443b27ceeb97dd6475267789"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b06690e7a95c166eefe0199b39118eb1"
 
+# 0.5.0 + commits thru 2/16/2015
+SRCREV = "770e6d0da035deaced82885939161c2b69225e10"
+
 inherit systemd
 
 
@@ -67,6 +70,7 @@ FILES_${PN} += "${base_libdir}/multipath \
 
 PACKAGES =+ "kpartx"
 FILES_kpartx = "${base_sbindir}/kpartx \
-                /lib/udev/kpartx_id"
+                /usr/lib/udev/kpartx_id \
+               "
 
 RDEPENDS_${PN} += "kpartx"
-- 
1.9.1


