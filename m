Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E525A755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 03:18:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9S3Hxfc023144
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:17:59 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 20:17:59 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Oct 2015 11:09:05 +0800
Message-ID: <1446001745-16883-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] libx86-1: add the recipe
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
X-List-Received-Date: Wed, 28 Oct 2015 03:18:01 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

A library to provide support for making real-mode calls x86 calls. On
x86 hardware, vm86 mode is used. On other platforms, x86 emulation is
provided.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
new file mode 100644
index 0000000..7551e7d
--- /dev/null
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "x86 real-mode library"
+DESCRIPTION = "A library to provide support for making real-mode calls x86 calls. On \
+x86 hardware, vm86 mode is used. On other platforms, x86 emulation is \
+provided."
+HOMEPAGE = "http://www.codon.org.uk/~mjg59/libx86/"
+LICENSE = "MIT & BSD-3-Clause"
+SECTION = "libs"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=633af6c02e6f624d4c472d970a2aca53"
+
+SRC_URI = "http://www.codon.org.uk/~mjg59/libx86/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "41bee1f8e22b82d82b5f7d7ba51abc2a"
+SRC_URI[sha256sum] = "5bf13104cb327472b5cb65643352a9138646becacc06763088d83001d832d048"
+
+BPN = "libx86"
+COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
+
+export LIBDIR = "${libdir}"
+export BACKEND = "x86emu"
+
+inherit autotools-brokensep
-- 
1.9.1


