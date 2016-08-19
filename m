Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70BDD77081
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:04:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7JA4S5Q023356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 03:04:28 -0700
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 19 Aug 2016 03:04:27 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Aug 2016 18:04:16 +0800
Message-ID: <0c74366ac09ecba160173dfffaf18b855a83c7ae.1471600808.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1471600808.git.yi.zhao@windriver.com>
References: <cover.1471600808.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-networking][PATCH 2/3] ipvsadm: fix QA warning for GNU_HASH
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
X-List-Received-Date: Fri, 19 Aug 2016 10:04:29 -0000
Content-Type: text/plain

Add LDFLAGS variable to Makefile so that extra linker flags can be sent
via this variable.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../ipvsadm/ipvsadm/makefile-add-ldflags.patch        | 19 +++++++++++++++++++
 .../recipes-support/ipvsadm/ipvsadm_1.26.bb           |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm/makefile-add-ldflags.patch

diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/makefile-add-ldflags.patch b/meta-networking/recipes-support/ipvsadm/ipvsadm/makefile-add-ldflags.patch
new file mode 100644
index 0000000..1bf1eed
--- /dev/null
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm/makefile-add-ldflags.patch
@@ -0,0 +1,19 @@
+Add LDFLAGS variable to Makefile, make sure the extra linker flags can be passed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/Makefile b/Makefile
+index 461c021..8bc9cde 100644
+--- a/Makefile
++++ b/Makefile
+@@ -86,7 +86,7 @@ libs:
+ 		make -C libipvs
+ 
+ ipvsadm:	$(OBJS) libs
+-		$(CC) $(CFLAGS) -o $@ $(OBJS) $(STATIC_LIBS) $(LIBS)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS) $(STATIC_LIBS) $(LIBS)
+ 
+ install:        all
+ 		if [ ! -d $(SBIN) ]; then $(MKDIR) -p $(SBIN); fi
diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
index 7302e9d..8d1b3f0 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.linuxvirtualserver.org/software/kernel-2.6/${BP}.tar.gz \
         file://0001-Modify-the-Makefile-for-cross-compile.patch \
         file://0002-Replace-nl_handle-to-nl_sock.patch \
         file://0003-ipvsadm-remove-dependency-on-bash.patch \
+        file://makefile-add-ldflags.patch \
 "
 
 SRC_URI[md5sum] = "eac3ba3f62cd4dea2da353aeddd353a8"
-- 
2.7.4


