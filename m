Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4CD73BBE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 23:15:51 +0000 (UTC)
Received: by pdbnf5 with SMTP id nf5so1475383pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 16:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mnUXGeJGWvql9RrTdoUHJ58ymSQkpF0ZScvUefWAKNs=;
	b=gGHevOxXObf/cQZpJ2o63vkOLZXB9ZdaVCjHXzL5O3Wchl5d3B5F6YTA+SQiPQzTVY
	iNGc9sz+wb3ztR6aQM+NZQ6cjDToAV6MdYJmZn8xVfVOglpiOrSIDwhTydSq7l0q9mIY
	d4INVgoCtDeFbYSvSDAyzk6zxPjI35FBlARqHZOTXLVE+J8VfdpG49HnidQMVzDxrqfy
	DrZd0268M2ayiAWk23y8T72XBcTxnNb5oACsLrbo8J/214btUPxFdyKzMWt+NjiAbQJm
	tRAkdXJVaJ91u0otehfbM5YFqHzqg81fxO4WchwnC+ICSRcYazIJBj4REEKCHyw93lnS
	FZyg==
X-Received: by 10.70.43.169 with SMTP id x9mr26831045pdl.52.1433805352896;
	Mon, 08 Jun 2015 16:15:52 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id fp3sm3576579pdb.52.2015.06.08.16.15.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jun 2015 16:15:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jun 2015 16:15:44 -0700
Message-Id: <1433805344-17530-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] minini: add initial recipe, minIni v1.2.b
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
X-List-Received-Date: Mon, 08 Jun 2015 23:15:52 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/minini/minini_1.2.b.bb | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/minini/minini_1.2.b.bb

diff --git a/meta-oe/recipes-support/minini/minini_1.2.b.bb b/meta-oe/recipes-support/minini/minini_1.2.b.bb
new file mode 100644
index 0000000..e739498
--- /dev/null
+++ b/meta-oe/recipes-support/minini/minini_1.2.b.bb
@@ -0,0 +1,38 @@
+SUMMARY = "A minimal INI file parser"
+DESCRIPTION = "minIni is a programmer's library to read and write INI files in \
+embedded systems. minIni takes little resources, has a deterministic memory \
+footprint and can be configured for various kinds of file I/O libraries. minIni \
+provides functionality for reading, writing and deleting keys from an INI file, \
+all in 830 lines of (commented) source code (version 1.2) in C (the code also \
+compiles in C++ and comes with a wrapper class)."
+HOMEPAGE = "https://code.google.com/p/minini/"
+
+# License is Apache 2.0 with an exception to allow object code built from
+# unmodified original sources to be distributed more freely. See LICENSE
+# file for details.
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb21481ad45c5578ae8c8d37b8c8d76d"
+
+SRC_URI = "http://minini.googlecode.com/files/minIni_12b.zip;subdir=${BP}"
+
+SRC_URI[md5sum] = "32740621098e3f0a321c7c23f4bcbc5d"
+SRC_URI[sha256sum] = "b08839af74acb36061fb76e1123bf56711bc5cf7a08b32e189b0ad78a2e888e2"
+
+do_configure[noexec] = "1"
+
+do_compile() {
+    ${CC} minIni.c -shared -fPIC -o libminini.so.0.0 -Wl,-soname,libminini.so.0 ${CFLAGS} ${LDFLAGS}
+}
+
+do_install () {
+
+    install -d ${D}${libdir}
+    install -m 0644 libminini.so.0.0 ${D}${libdir}/
+    ln -s libminini.so.0.0 ${D}${libdir}/libminini.so
+    ln -s libminini.so.0.0 ${D}${libdir}/libminini.so.0
+
+    install -d ${D}${includedir}/minini
+    install -m 0644 minIni.h ${D}${includedir}/minini/
+    install -m 0644 minGlue-stdio.h ${D}${includedir}/minini/minGlue.h
+}
-- 
1.9.1


