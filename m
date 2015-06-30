Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id BB05160017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 19:29:12 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C3FC0F811DC; Tue, 30 Jun 2015 13:29:13 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6AB67F811DB;
	Tue, 30 Jun 2015 13:29:13 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jun 2015 13:29:56 -0600
Message-Id: <1435692596-11250-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-browser][PATCH] chromium: List all PACKAGECONFIG settings to avoid warning
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
X-List-Received-Date: Tue, 30 Jun 2015 19:29:12 -0000

OE-core now warns if PACKAGECONFIG is used to set an option that
does not have a corresponding PACKAGECONFIG[option]="xxx" line.
This recipe makes use of many such options & this patch suppresses
those warnings by listing the options.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 recipes-browser/chromium/chromium.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 8e83f6a..611929e 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -17,6 +17,14 @@ PACKAGECONFIG ??= "use-egl"
 # automatically and silently fall back to GLX
 PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
 
+# Additional PACKAGECONFIG options - listed here to avoid warnings
+PACKAGECONFIG[use-gl] = ""
+PACKAGECONFIG[component-build] = ""
+PACKAGECONFIG[ignore-lost-context] = ""
+PACKAGECONFIG[component-build] = ""
+PACKAGECONFIG[impl-side-painting] = ""
+PACKAGECONFIG[disable-api-keys-info-bar] = ""
+
 GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
 do_configure() {
-- 
1.9.1


