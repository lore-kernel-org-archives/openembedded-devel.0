Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 952CC719C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 09:23:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA19NTn0027791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Nov 2016 02:23:29 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 1 Nov 2016 02:23:27 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Nov 2016 17:23:04 +0800
Message-ID: <b4b03e4e21b7791118932d4c805278657e925ec9.1477991825.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477991825.git.yi.zhao@windriver.com>
References: <cover.1477991825.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-networking][PATCH 5/6] vblade: fix QA warning for GNU_HASH
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
X-List-Received-Date: Tue, 01 Nov 2016 09:23:27 -0000
Content-Type: text/plain

Add LDFLAGS variable to Makefile so that extra linker flags can be sent
via this variable.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../vblade/files/makefile-add-ldflags.patch           | 19 +++++++++++++++++++
 meta-networking/recipes-daemons/vblade/vblade_20.bb   |  4 +++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch

diff --git a/meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch b/meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch
new file mode 100644
index 0000000..a74452d
--- /dev/null
+++ b/meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch
@@ -0,0 +1,19 @@
+Add LDFLAGS variable to Makefile, make sure the extra linker flags can be passed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/makefile b/makefile
+index 98008da..c328ba7 100644
+--- a/makefile
++++ b/makefile
+@@ -11,7 +11,7 @@ mandir = ${sharedir}/man
+ O=aoe.o bpf.o ${PLATFORM}.o ata.o
+ 
+ vblade: $O
+-	${CC} -o vblade $O
++	${CC} ${LDFLAGS} -o vblade $O
+ 
+ aoe.o : aoe.c config.h dat.h fns.h makefile
+ 	${CC} ${CFLAGS} -c $<
diff --git a/meta-networking/recipes-daemons/vblade/vblade_20.bb b/meta-networking/recipes-daemons/vblade/vblade_20.bb
index a357e40..344c746 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_20.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_20.bb
@@ -5,7 +5,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${BPN}-${PV}.tgz \
-       file://cross.patch"
+           file://cross.patch \
+           file://makefile-add-ldflags.patch \
+          "
 
 SRC_URI[md5sum] = "3c80e4a6bc7d66ae0c235b88cb44bd59"
 SRC_URI[sha256sum] = "c8fe2fc4f2fba8e07e5cfdf17335982584eef2cd5c78bf8b1db93f2b56e7121d"
-- 
2.7.4


