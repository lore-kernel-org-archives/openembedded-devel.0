Return-Path: <daniel.markus@leica-geosystems.com>
Received: from outbound.sbg.se (outbound.sbg.se [83.241.165.85])
	by mail.openembedded.org (Postfix) with ESMTP id B2AFB605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 10:07:27 +0000 (UTC)
Received: from hermes.sbg.se (mail.sbg.se [83.241.165.77])
	by outbound.sbg.se (Postfix) with ESMTP id 8452F1847D2;
	Thu, 26 Feb 2015 11:07:26 +0100 (CET)
Received: from localhost.localdomain (unknown [10.213.0.77])
	by hermes.sbg.se (Postfix) with ESMTP id C6A5C1405E1;
	Thu, 26 Feb 2015 11:06:53 +0100 (CET)
From: Daniel Markus <daniel.markus@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Feb 2015 11:06:37 +0100
Message-Id: <1424945197-5406-1-git-send-email-daniel.markus@leica-geosystems.com>
X-Mailer: git-send-email 1.9.1
X-SBG-MailScanner-ID: C6A5C1405E1.0BD38
X-SBG-MailScanner: Found to be clean
X-SBG-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
	score=-102.9, required 5, autolearn=not spam, ALL_TRUSTED -1.00,
	BAYES_00 -1.90, USER_IN_WHITELIST -100.00)
X-SBG-MailScanner-From: daniel.markus@leica-geosystems.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] socorro-syms: Make usage less verbose
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
X-List-Received-Date: Thu, 26 Feb 2015 10:07:29 -0000

When using Socorro symbols we automatically depend on Breakpad, so
there's no need for the user to explicitly state that dependency.

Let the inheritance of Breakpad be done in the Socorro class,
making the usage of socorro-syms less verbose and less error prone.

Signed-off-by: Daniel Markus <daniel.markus@leica-geosystems.com>
---
 meta-oe/classes/socorro-syms.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/socorro-syms.bbclass b/meta-oe/classes/socorro-syms.bbclass
index a4ac079..766a9e6 100644
--- a/meta-oe/classes/socorro-syms.bbclass
+++ b/meta-oe/classes/socorro-syms.bbclass
@@ -7,13 +7,12 @@
 #
 # Use example:
 #
-# inherit breakpad
-# inherit socorro-syms
 # BREAKPAD_BIN = "YourBinary"
+# inherit socorro-syms
 #
 
 # We depend on Breakpad creating the original symbol file.
-DEPENDS += "breakpad"
+inherit breakpad
 
 PACKAGE_PREPROCESS_FUNCS += "symbol_file_preprocess"
 PACKAGES =+ "${PN}-socorro-syms"
-- 
1.9.1


