Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 074D8600BB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 21:51:30 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id t22so15326457ioa.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 13:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9a9xfjlfrpArw29lrpqi7nQcjenRJOAF2TlaRzECCq0=;
	b=giW7M2Mbws+aHZ+9HSuJCdH9FEZmv/nKUKOeFGG9rcS662P/9egxq9cpMqz/1SJfPn
	Aup8V4rdTyKjH1r0zt5DtSFxEFSiPX+Y/xD0NxhEgVkPqxsseZnp8eQZFGLyAD9ZN/Z6
	ufPFgUG60Qdr4g0xMpwo2m8OLk0Xe2UaVgBGIJrVO2JhN4hdbPHJiGmsUDwW79vcAj7D
	0HXOndfHoB7pUPzz9s+WgSeQ8voUKcnWNFtu5p8K8a49a/yKnQGlkVVGl6qbPp40iOac
	2JS2TLiTERWz3Ha9PNBW7QIB2TL8ZkfIPc7UJyn8bN+V8iAFVYl8tb9O3oxNLPDXD3Dt
	p7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9a9xfjlfrpArw29lrpqi7nQcjenRJOAF2TlaRzECCq0=;
	b=s38aIUtB9qVBp8PMCs1uD2J5d5P1A9H6DGSXrIT869u9hb0AKa2U3kpvNqjb7PI3jB
	5O9GpI5SrayB2KvxOTRqkEInCI+7nXp1gh4XmyeUxqXWi4Ybx+7wWJfI3SyoP/+tN3Wl
	d0V6U+t75OuTL4xmBA3cfhHhW04/8IsbuV7pRyDxzrkOAjKyd1rrYwP9lyBnZhnKOiym
	DagcD5sVTFskLThCIda0gmFuMb60HliHU16j2/EqEioqQGx8c/dFWA6NkXKsqwyJ0JKe
	XctoHpB1wndsrjb3b3OMuLCP10JmfyBwly9oLmvAXpylFOH/TVJwAVkEZizIhdNpFjrr
	IEyg==
X-Gm-Message-State: APf1xPCgAkbUHB+xDnSC3yxAS+i9mglTWw/JVcvhO8IQvixkgovzmkgl
	UP9HoL74dwzRef6CTtWALncRKPWP
X-Google-Smtp-Source: AH8x224wJl+STfgaEP17OrowTUW6gJWrif6+kLFbb+r1bbzj/4QmGPuBYxHsg+6OcDNjPmLgImXdOA==
X-Received: by 10.107.198.86 with SMTP id w83mr10514769iof.75.1518385891769;
	Sun, 11 Feb 2018 13:51:31 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	v76sm4712333itb.41.2018.02.11.13.51.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Feb 2018 13:51:31 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Feb 2018 15:51:29 -0600
Message-Id: <20180211215129.9564-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-networking][PATCH] waf-samba.bbclass: No longer inherit waf.bbclass
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
X-List-Received-Date: Sun, 11 Feb 2018 21:51:31 -0000

waf-samba.bbclass uses waf in a very different way than the "standard"
method that waf.bbclass targets and ends getting very little useful
functionality from that class.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-networking/classes/waf-samba.bbclass | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index e49017624..4b1499fd4 100644
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
 
@@ -21,6 +21,31 @@ CONFIGUREOPTS = " --prefix=${prefix} \
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
+            v = None
+            opt = pm.pop(0)
+            if opt == '-j':
+                v = pm.pop(0)
+            elif opt.startswith('-j'):
+                v = opt[2:].strip()
+            else:
+                v = None
+
+            if v:
+                v = min(64, int(v))
+                return '-j' + str(v)
+
+    return ""
+
 # Three methods for waf cross compile:
 # 1. answers:
 #    Only --cross-answers - try the cross-answers file, and if
-- 
2.14.3


