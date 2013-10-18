Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7AA60CEF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 00:08:23 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ld10so1136171pab.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 17:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RogN+E+LhdevuKC/2IiGrJXrGZEQbhakTbQ5mmUOpSw=;
	b=twrcac3q0QEMxkdinccl8Ban3LrmchhnhjR4rQwjUEHn+a4uyCqL6j8RjtnLRa5SWo
	HgpHjVkZimpx16wQ1A7gvND6EQZEqNJhey1REZACsNGUmJpRjvr/hEKpXbyNqhY2lmWz
	wN/K3/MfL8ClZivEFmQqR26parUNOkuCGWN19A+2pGvvlfg8RIoq0IPQv07498eTB7so
	IIz2EtfgGqTFje8Yo/GPH+jx9e3/ag3xZuZSw6Aq2/CFPIwSv+yoPwLKnakIM/h2LWx3
	Y29/wKVle/u0n7FC8vcH4qbjv0ry/J3i3z0QDPz0fUqvwhkjRIcj8RXdVXi9P6QLC5+p
	KqGw==
X-Received: by 10.68.217.129 with SMTP id oy1mr103717pbc.23.1382054905336;
	Thu, 17 Oct 2013 17:08:25 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	dq3sm100434739pbc.35.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 17:08:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 17:08:03 -0700
Message-Id: <1382054883-16540-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-gnome][PATCH] libbonobo: Fix build error with new autotools
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
X-List-Received-Date: Fri, 18 Oct 2013 00:08:23 -0000

Don't use srcdir with tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libbonobo/do-not-use-srcdir-variable.patch     | 24 ++++++++++++++++++++++
 .../recipes-gnome/bonobo/libbonobo_2.24.3.bb       |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch b/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch
new file mode 100644
index 0000000..46f8137
--- /dev/null
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch
@@ -0,0 +1,24 @@
+| tests/Makefile.am:55: error: using '$(srcdir)' in TESTS is currently broken: '$(srcdir)/te
+st-properties.sh'
+| tests/test-activation/Makefile.am:76: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS
+' (or '*_CPPFLAGS')
+| utils/Makefile.am:9: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS
+')
+| autoreconf: automake failed with exit status: 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Not Submitted
+
+Index: libbonobo-2.24.3/tests/Makefile.am
+===================================================================
+--- libbonobo-2.24.3.orig/tests/Makefile.am	2009-04-18 05:27:41.000000000 -0700
++++ libbonobo-2.24.3/tests/Makefile.am	2013-10-17 16:59:45.612989079 -0700
+@@ -53,7 +53,7 @@
+ 	MODELS_DIR="$(srcdir)/models"
+ 
+ TESTS = test-moniker$(EXEEXT) test-event-source$(EXEEXT) test-object$(EXEEXT) \
+-	test-stream-mem$(EXEEXT) $(srcdir)/test-properties.sh test-storage-mem$(EXEEXT) \
++	test-stream-mem$(EXEEXT) test-properties.sh test-storage-mem$(EXEEXT) \
+ 	test-generic-factory.sh test-main-loop$(EXEEXT)
+ check_SCRIPTS = test-properties.sh test-generic-factory.sh
+ EXTRA_DIST=$(check_SCRIPTS) Test_Generic_Factory.server
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
index 622f244..b837802 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
@@ -1,6 +1,8 @@
 require libbonobo.inc
 PR = "r2"
 
-SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch"
+SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
+            file://do-not-use-srcdir-variable.patch \
+           "
 SRC_URI[archive.md5sum] = "b217cef6a187505290c66c5bf8225d38"
 SRC_URI[archive.sha256sum] = "5310957fa90691689c0557218b8833f681666cae160bd84e1f2c2705189a4ebe"
-- 
1.8.3.2


