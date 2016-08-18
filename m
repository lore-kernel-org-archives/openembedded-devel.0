Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B49E776B7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:37:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7I9bt06023089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 02:37:55 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 18 Aug 2016 02:37:54 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Aug 2016 17:37:40 +0800
Message-ID: <7850a4a770dfa81c4c2fbe500a49061a3baf5594.1471512743.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1471512743.git.yi.zhao@windriver.com>
References: <cover.1471512743.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-oe][PATCH 2/2] wipe: fix QA warning for GNU_HASH
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
X-List-Received-Date: Thu, 18 Aug 2016 09:37:54 -0000
Content-Type: text/plain

Add LDFLAGS variable to Makefile so that extra linker flags can be sent
via this variable.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../wipe/files/makefile-add-ldflags.patch               | 17 +++++++++++++++++
 meta-oe/recipes-extended/wipe/wipe_git.bb               |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wipe/files/makefile-add-ldflags.patch

diff --git a/meta-oe/recipes-extended/wipe/files/makefile-add-ldflags.patch b/meta-oe/recipes-extended/wipe/files/makefile-add-ldflags.patch
new file mode 100644
index 0000000..fac1b31
--- /dev/null
+++ b/meta-oe/recipes-extended/wipe/files/makefile-add-ldflags.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/Makefile b/Makefile
+index 9e74cdf..cad8109 100644
+--- a/Makefile
++++ b/Makefile
+@@ -151,7 +151,7 @@ generic	:
+ 		$(MAKE) $(TARGETS) "CC=$(CC_GENERIC)" "CCO=$(CCO_GENERIC)" "CCOC=$(CCOC_GENERIC)"
+ 
+ wipe	:	$(OBJECTS)
+-		$(CC) $(CCO) $(OBJECTS) -o wipe
++		$(CC) $(CCO) $(LDFLAGS) $(OBJECTS) -o wipe
+ 
+ wipe.o	:	wipe.c random.h misc.h version.h
+ 		$(CC) $(CCO) $(CCOC) wipe.c -o wipe.o
diff --git a/meta-oe/recipes-extended/wipe/wipe_git.bb b/meta-oe/recipes-extended/wipe/wipe_git.bb
index 70229f0..dd49958 100644
--- a/meta-oe/recipes-extended/wipe/wipe_git.bb
+++ b/meta-oe/recipes-extended/wipe/wipe_git.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "git://github.com/berke/wipe.git;branch=master \
            file://support-cross-compile-for-linux.patch \
+           file://makefile-add-ldflags.patch \
           "
 SRCREV = "d9c100c9cd0b1cbbe4359e4d6c9a035d11e7597c"
 PV = "0.23+git${SRCPV}"
-- 
2.7.4


