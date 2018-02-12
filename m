Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAB86E650
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:20:50 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id e1so7143546ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ePKVOtXsxKGM9gwMaTXdm7LkVIeCkFH+5Y1xW+H4yuQ=;
	b=mjcSdvP7Lcxq5BbXexD/ab0w92HJwSo6+DRRrkXM4GJT5Prd1Hby62Cbqvku/7EQ8L
	kxmwOQQAhoihTxu0JVkiGdYrs7m+Bx2TnIkTgWqBEMulIxrErU9/1m6QxckJPr1Dq3ZH
	4hZvrtQ/A3/NMmELTPQiU3iEXI5eyOerXWhEJcjB1NEWpQegziG+jpN4ygjfjHh8bKWf
	SJoY+EmOFDjMgnVMszisEJsN965d5th/7fOu4XUF72P9nL/mg+EmiaGoIoKfZ4TokbEo
	+BW1oG/2aXrQmrLD16iZqEJHMtkuHN7pQke+ARDNLl/IWY1p1AZLU6MgeTf7X6wYdrwf
	ylDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ePKVOtXsxKGM9gwMaTXdm7LkVIeCkFH+5Y1xW+H4yuQ=;
	b=eglAcD/Y7Jizcgdl31RCjQ+aox5AL6fyDf/PDmv/Zxl6mn5iPwnBZ+JTyXWNy6t4ue
	a6rTAIFYv27CFLZ/ZcOHtt0g6gamyNo+9juchADe5E2LgrQUaiPz+4z+hQQixC70aZ1H
	Vwte6ItzlC5cFka2gGiJ8KW8Dny1gQELZOsGOzH4/WrE9AFtI2NGJFtMdG26d1MG5VVz
	+PSePQmp/bAGSYBvM4psfc04g7oysBZIk0BWG08t5r2qEFGEW6MZR9xsayIuGu/XXLFq
	0lED1lDaNn3pFOBLNaPmaCYw6Tx09EbcwBSLctIlu9pGCtSppYbnUL4M4eP4iMdttzBR
	95Dg==
X-Gm-Message-State: APf1xPBeuufy9Sy/PGSa1jPdLNe/WP9kCQUeejiPq+TaRIOkf5USWhtX
	uvsbJO8L9WvJw65QgmJVJkdVu+DU
X-Google-Smtp-Source: AH8x224EonfZUzWr94rxg8Gzc3lwWLef99gzF88JJIsQLzoHjlPCCZq6Q9VmKNJsWwY7ivHAWyujgw==
X-Received: by 10.36.41.76 with SMTP id p73mr5767663itp.127.1518452451178;
	Mon, 12 Feb 2018 08:20:51 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	a13sm7503965itj.13.2018.02.12.08.20.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:20:50 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Feb 2018 10:20:41 -0600
Message-Id: <20180212162041.25713-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180211215129.9564-1-JPEWhacker@gmail.com>
References: <20180211215129.9564-1-JPEWhacker@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-networking][PATCH v2] waf-samba.bbclass: No longer inherit waf.bbclass
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
X-List-Received-Date: Mon, 12 Feb 2018 16:20:50 -0000

waf-samba.bbclass uses waf in a very different way than the "standard"
method that waf.bbclass targets and ends getting very little useful
functionality from that class.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-networking/classes/waf-samba.bbclass | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index e490176241..0ce51610f3 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -1,7 +1,7 @@
 # waf is a build system which is used by samba related project.
 # Obtain details from https://wiki.samba.org/index.php/Waf
-# 
-inherit qemu pythonnative waf
+#
+inherit qemu pythonnative
 
 DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python"
 
@@ -21,6 +21,29 @@ CONFIGUREOPTS = " --prefix=${prefix} \
                   ${PACKAGECONFIG_CONFARGS} \
                 "
 
+# avoids build breaks when using no-static-libs.inc
+DISABLE_STATIC = ""
+
+def get_waf_parallel_make(d):
+    pm = d.getVar('PARALLEL_MAKE')
+    if pm:
+        # look for '-j' and throw other options (e.g. '-l') away
+        # because they might have different meaning in bjam
+        pm = pm.split()
+        while pm:
+            opt = pm.pop(0)
+            if opt == '-j':
+                v = pm.pop(0)
+            elif opt.startswith('-j'):
+                v = opt[2:].strip()
+            else:
+                continue
+
+            v = min(64, int(v))
+            return '-j' + str(v)
+
+    return ""
+
 # Three methods for waf cross compile:
 # 1. answers:
 #    Only --cross-answers - try the cross-answers file, and if
@@ -86,6 +109,7 @@ do_configure() {
     fi
 }
 
+do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 do_compile () {
     python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
 }
-- 
2.14.3


