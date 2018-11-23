Return-Path: <primoz.fiser@norik.com>
Received: from out-2.mail.amis.net (out-2.mail.amis.net [212.18.32.14])
	by mail.openembedded.org (Postfix) with ESMTP id 0909C6C605
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 14:49:54 +0000 (UTC)
Received: from in-5.mail.amis.net (in-5.mail.amis.net [212.18.32.26])
	by out-2.mail.amis.net (Postfix) with ESMTP id 4CC7780BEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:49:55 +0100 (CET)
Received: from in-5.mail.amis.net (localhost [127.0.0.1])
	by in-5.mail.amis.net (Postfix) with ESMTP id 4B521C9434;
	Fri, 23 Nov 2018 15:49:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at amis.net
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1 required=5 tests=[ALL_TRUSTED=-1]
	autolearn=disabled
Received: from in-5.mail.amis.net ([127.0.0.1])
	by in-5.mail.amis.net (in-5.mail.amis.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GK1trq2omHCe; Fri, 23 Nov 2018 15:49:55 +0100 (CET)
Received: from smtp2.amis.net (smtp2.amis.net [212.18.32.44])
	by in-5.mail.amis.net (Postfix) with ESMTP id E4B45C940E;
	Fri, 23 Nov 2018 15:49:54 +0100 (CET)
Received: from probook.lan (cpe-90-157-180-95.static.amis.net [90.157.180.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp2.amis.net (Postfix) with ESMTPSA id BA8CC80A36;
	Fri, 23 Nov 2018 15:49:54 +0100 (CET)
From: Primoz Fiser <primoz.fiser@norik.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2018 15:48:43 +0100
Message-Id: <1542984523-19704-1-git-send-email-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] sedutil: fix compile errors on big endian architectures
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
X-List-Received-Date: Fri, 23 Nov 2018 14:49:55 -0000

Patch fixes compile errors by defining empty macros as
hinted by TODO mark in the sources.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 ...001-Fix-build-on-big-endian-architectures.patch | 41 ++++++++++++++++++++++
 meta-oe/recipes-extended/sedutil/sedutil_git.bb    |  4 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-architectures.patch

diff --git a/meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-architectures.patch b/meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-architectures.patch
new file mode 100644
index 0000000..7351197
--- /dev/null
+++ b/meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-architectures.patch
@@ -0,0 +1,41 @@
+From ff98a326d5faa585f0e15e51a558cc2c49aa8099 Mon Sep 17 00:00:00 2001
+From: Primoz Fiser <primoz.fiser@norik.com>
+Date: Fri, 23 Nov 2018 08:31:29 +0100
+Subject: [PATCH] Fix build on big endian architectures
+
+Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
+---
+ Common/DtaEndianFixup.h | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/Common/DtaEndianFixup.h b/Common/DtaEndianFixup.h
+index 58eb3ff..184fce0 100644
+--- a/Common/DtaEndianFixup.h
++++ b/Common/DtaEndianFixup.h
+@@ -31,12 +31,11 @@ along with sedutil.  If not, see <http://www.gnu.org/licenses/>.
+ //TODO: add a test on the endianess of the system and define
+ //  empty macros if the system is big endian
+ #pragma once
+-#ifdef __gnu_linux__
+-#include <endian.h>
+-#if __BYTE_ORDER != __LITTLE_ENDIAN
+-#error This code does not support big endian architectures
+-#endif
+-#endif
++#if defined(__BYTE_ORDER__)&&(__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
++#define SWAP16(x) x
++#define SWAP32(x) x
++#define SWAP64(x) x
++#else
+ /** change the "endianess" of a 16bit field */
+ #define SWAP16(x) ((uint16_t) ((x & 0x00ff) << 8) | ((x & 0xff00) >> 8))
+ /** change the "endianess" of a 32bit field */
+@@ -47,3 +46,5 @@ along with sedutil.  If not, see <http://www.gnu.org/licenses/>.
+ 	((uint64_t) (SWAP32((x & 0x00000000ffffffff)) << 32) | \
+ 	((uint64_t) (SWAP32((x >> 32))) )    \
+ 	)
++
++#endif
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
index cec569f..7656184 100644
--- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
+++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://Common/LICENSE.txt;md5=d32239bcb673463ab874e80d47fae5
 BASEPV = "1.15.1"
 PV = "${BASEPV}+git${SRCPV}"
 SRCREV = "358cc758948be788284d5faba46ccf4cc1813796"
-SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git"
+SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git \
+	file://0001-Fix-build-on-big-endian-architectures.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


