Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF5773E3B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 20:23:13 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4A2B0F811D8; Tue, 16 Jun 2015 14:23:13 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C7E70F811D7;
	Tue, 16 Jun 2015 14:23:12 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jun 2015 14:23:29 -0600
Message-Id: <1434486209-463-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-browser][PATCH] chromium: Fix potential configuration issues
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
X-List-Received-Date: Tue, 16 Jun 2015 20:23:16 -0000

This recipe should be using the python interpreter as built by bitbake,
rather than relying on the host python.  In some cases, the host python
may be incomplete or just plain old, yielding errors during the configure
step such as:
  |     from sgmllib import SGMLParser, SGMLParseError
  | ImportError: No module named sgmllib
  | ninja: build stopped: subcommand failed.

Adding 'inherit pythonnative' solves this problem on all build hosts.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 recipes-browser/chromium/chromium.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index cd8bfb5..8e83f6a 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 
 CHROMIUM_BUILD_TYPE = "Release"
 
-inherit gettext
+inherit gettext pythonnative
 
 PACKAGECONFIG ??= "use-egl"
 
-- 
1.9.1


