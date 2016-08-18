Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5401576B7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:37:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7I9bpV9021365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 02:37:51 -0700
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 18 Aug 2016 02:37:50 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Aug 2016 17:37:39 +0800
Message-ID: <25bd02a0ea897f2c5a661fde0b88c0b8729f8a5d.1471512743.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1471512743.git.yi.zhao@windriver.com>
References: <cover.1471512743.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-oe][PATCH 1/2] libx86-1: fix QA warning for GNU_HASH
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
X-List-Received-Date: Thu, 18 Aug 2016 09:37:51 -0000
Content-Type: text/plain

Add LDFLAGS variable to Makefile so that extra linker flags can be sent
via this variable.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libx86-1/libx86-1.1/makefile-add-ldflags.patch      | 17 +++++++++++++++++
 meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb       |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch
new file mode 100644
index 0000000..821ab37
--- /dev/null
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/Makefile b/Makefile
+index 951b617..6d9b73d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,7 @@ static: $(OBJECTS)
+ 	$(AR) cru libx86.a $(OBJECTS)
+ 
+ shared: $(OBJECTS)
+-	$(CC) $(CFLAGS) -o libx86.so.1 -shared -Wl,-soname,libx86.so.1 $(OBJECTS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o libx86.so.1 -shared -Wl,-soname,libx86.so.1 $(OBJECTS)
+ 
+ objclean:
+ 	$(MAKE) -C x86emu clean
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
index 20c152c..d303147 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=633af6c02e6f624d4c472d970a2aca53"
 SRC_URI = "http://www.codon.org.uk/~mjg59/libx86/downloads/${BPN}-${PV}.tar.gz \
            file://libx86-mmap-offset.patch \
            file://0001-assume-zero-is-valid-address.patch \
+           file://makefile-add-ldflags.patch \
 "
 
 SRC_URI[md5sum] = "41bee1f8e22b82d82b5f7d7ba51abc2a"
-- 
2.7.4


