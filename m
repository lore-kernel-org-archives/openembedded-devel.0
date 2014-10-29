Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 83A446E67C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 13:35:11 +0000 (UTC)
Received: from localhost (81.232.163.241) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.279.1; Wed, 29 Oct 2014
	14:35:08 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Oct 2014 14:34:38 +0100
Message-ID: <b04cda902acec696949a585033404d1c6ef1ed50.1414589640.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <cover.1414589640.git.anders@chargestorm.se>
References: <cover.1414589640.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 1/1] breakpad: correct the file suffix of the symbol file
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
X-List-Received-Date: Wed, 29 Oct 2014 13:35:17 -0000
Content-Type: text/plain

minidump_stackwalk looks for a .sym file extension. Correct the extension used for the generated file.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/classes/breakpad.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/breakpad.bbclass b/meta-oe/classes/breakpad.bbclass
index e4d6808..b3abf27 100644
--- a/meta-oe/classes/breakpad.bbclass
+++ b/meta-oe/classes/breakpad.bbclass
@@ -24,7 +24,7 @@ python () {
 PACKAGE_PREPROCESS_FUNCS += "breakpad_package_preprocess"
 breakpad_package_preprocess () {
     mkdir -p ${PKGD}/usr/share/breakpad-syms
-    find ${D} -name ${BREAKPAD_BIN} -exec sh -c "dump_syms {} > ${PKGD}/usr/share/breakpad-syms/${BREAKPAD_BIN}.syms" \;
+    find ${D} -name ${BREAKPAD_BIN} -exec sh -c "dump_syms {} > ${PKGD}/usr/share/breakpad-syms/${BREAKPAD_BIN}.sym" \;
 }
 
 PACKAGES =+ "${PN}-breakpad"
-- 
2.1.1


