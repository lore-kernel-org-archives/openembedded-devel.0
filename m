Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 210156AF35
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 23:09:44 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id jz11so234592veb.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 16:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=AG1dSLpSmYO+rLjiwn1pdWLZDqBAqxdsqM6C0YjG0eQ=;
	b=XTCQyMWZD7GH0S5aypBWuZOC12gEccbMuXCEVgcEbTW+JvP03TwVMtHnQc6DG5otaW
	CUA6nxPfHtKdBJ1SphokzQ3eSyKZWO+YSbxJfC2TJeLNgOFMjZgWcAMCF3IKQ9GLiFhZ
	sHn9QdCW+lzL2IsUa/oVZsyVO3dRPK91mF3mNFcG7ho3FFwhP2pB4u9PMVWswLBbjKoR
	iQ0tBioQx9bHbACJhQFl5Y9cVw/5hFgIQHhBx8Rv6ExGicrvGAURHk8N9dQo6jpTT2WW
	PCfPqPuVD0I7VUEWf7BN2ZC9UF6oPjXlUFm4rv2atCLAJNzMPnQ3MxnGksJ2co4WDGMm
	TJWQ==
X-Received: by 10.53.5.162 with SMTP id cn2mr382847vdd.13.1401923385271;
	Wed, 04 Jun 2014 16:09:45 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id g3sm6721937vdc.19.2014.06.04.16.09.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 16:09:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 56A041B3FAAC8; Wed,  4 Jun 2014 20:09:41 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed,  4 Jun 2014 20:09:39 -0300
Message-Id: <1401923379-7684-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] nbench-byte: Fix parallel building error
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
X-List-Received-Date: Wed, 04 Jun 2014 23:09:45 -0000

This extends the dependencies on pointer.h to fix following error:

| ./sysinfo.sh arm-poky-linux-gnueabi-gcc ...
| In file included from misc.h:36:0,
|                  from misc.c:23:
| nmglobal.h:29:21: fatal error: pointer.h: No such file or directory
|  #include "pointer.h"
|                      ^
| compilation terminated.
| make: *** [misc.o] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...kefile-add-more-dependencies-to-pointer.h.patch | 23 ++++++++++++++++++++++
 .../nbench-byte/nbench-byte_2.2.3.bb               |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-add-more-dependencies-to-pointer.h.patch

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-add-more-dependencies-to-pointer.h.patch b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-add-more-dependencies-to-pointer.h.patch
new file mode 100644
index 0000000..abdb434
--- /dev/null
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-add-more-dependencies-to-pointer.h.patch
@@ -0,0 +1,23 @@
+Makefile: add more dependencies to pointer.h
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 915866d..edd9ea2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -122,7 +122,7 @@ emfloat.o: emfloat.h emfloat.c nmglobal.h pointer.h Makefile
+ pointer.h: Makefile
+ 	touch pointer.h ;
+ 
+-misc.o: misc.h misc.c Makefile
++misc.o: misc.h misc.c nmglobal.h pointer.h Makefile
+ 	$(CC) $(MACHINE) $(DEFINES) $(CFLAGS)\
+ 		-c misc.c
+ 
+
diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index 37f3e46..addb2d2 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7
 SECTION = "console/utils"
 
 SRC_URI = "http://www.tux.org/~mayer/linux/${PN}-${PV}.tar.gz \
-           file://nbench_32bits.patch"
+           file://nbench_32bits.patch \
+           file://Makefile-add-more-dependencies-to-pointer.h.patch"
 
 SRC_URI[md5sum] = "285dfab361080759d477ea1fe7d3093a"
 SRC_URI[sha256sum] = "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac488d8f5aed9101ac"
-- 
2.0.0.rc4


