Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42CD773211
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:27:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J9RdJr016411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 02:27:39 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 19 Aug 2016 02:27:38 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Aug 2016 17:27:36 +0800
Message-ID: <1471598856-6817-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-filesystems][PATCH] yaffs2-utils: fix QA warning for GNU_HASH
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
X-List-Received-Date: Fri, 19 Aug 2016 09:27:39 -0000
Content-Type: text/plain

Add LDFLAGS variable to Makefile so that extra linker flags can be sent
via this variable.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../yaffs2/yaffs2-utils/makefile-add-ldflags.patch  | 21 +++++++++++++++++++++
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb  |  5 ++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/makefile-add-ldflags.patch

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/makefile-add-ldflags.patch b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/makefile-add-ldflags.patch
new file mode 100644
index 0000000..bb21899
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/makefile-add-ldflags.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/utils/Makefile b/utils/Makefile
+index 710ebbf..6259893 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -57,10 +57,10 @@ $(COMMONOBJS) $(MKYAFFSIMAGEOBJS) $(MKYAFFS2IMAGEOBJS) : %.o: %.c
+ 	$(CC) -c $(CFLAGS) $< -o $@
+ 
+ mkyaffsimage: $(MKYAFFSIMAGEOBJS) $(COMMONOBJS)
+-	$(CC) -o $@  $^
++	$(CC) $(LDFLAGS) -o $@  $^
+ 
+ mkyaffs2image: $(MKYAFFS2IMAGEOBJS) $(COMMONOBJS)
+-	$(CC) -o $@ $^
++	$(CC) $(LDFLAGS) -o $@ $^
+ 
+ 
+ clean:
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 253ea62..e8d1873 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -12,7 +12,10 @@ PV = "0.0+git${SRCPV}"
 DEPENDS = "mtd-utils"
 
 # Source is the HEAD of master branch at the time of writing this recipe
-SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master"
+SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
+           file://makefile-add-ldflags.patch \
+          "
+
 SRCREV = "bc76682d93955cfb33051beb503ad9f8a5450578"
 S = "${WORKDIR}/git"
 
-- 
2.7.4


