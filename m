Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PDgNX-0005BA-KU
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 17:40:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 71FB08E41DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Nov 2010 12:39:14 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06445-04 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  3 Nov 2010 12:39:14 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 75C3C8E3E29; Wed,  3 Nov 2010 12:39:12 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 2795A75E77D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Nov 2010 12:39:11 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id EEAB75000E8; Wed,  3 Nov 2010 12:39:10 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Nov 2010 12:39:10 -0400
Message-Id: <1288802350-21123-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] liboil 0.3.17: fix cross-compile on x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Nov 2010 16:40:04 -0000

Fix typo in whitelist of hosts allowing unaligned memory access.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../liboil-0.3.17/fix-unaligned-whitelist.patch    |   17 +++++++++++++++++
 recipes/liboil/liboil_0.3.17.bb                    |    7 +++++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 recipes/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch

diff --git a/recipes/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch b/recipes/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
new file mode 100644
index 0000000..79d53b6
--- /dev/null
+++ b/recipes/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
@@ -0,0 +1,17 @@
+Upstream: https://bugs.freedesktop.org/show_bug.cgi?id=31358
+
+configure: fix whitelisting of x86_64 unaligned memory access
+
+Fix typo in whitelist so cross-compile works for x86_64.
+
+--- liboil-0.3.17/m4/as-unaligned-access.m4.orig	2009-02-26 14:40:08.000000000 -0500
++++ liboil-0.3.17/m4/as-unaligned-access.m4	2010-11-03 12:19:55.000000000 -0400
+@@ -9,7 +9,7 @@
+         _AS_ECHO_N([(blacklisted) ])
+         as_cv_unaligned_access=no
+ 	;;
+-      i?86*|x86_64|amd64|powerpc*|m68k*|cris*)
++      i?86*|x86_64*|amd64*|powerpc*|m68k*|cris*)
+         _AS_ECHO_N([(whitelisted) ])
+         as_cv_unaligned_access=yes
+ 	;;
diff --git a/recipes/liboil/liboil_0.3.17.bb b/recipes/liboil/liboil_0.3.17.bb
index 83cf4c1..2267821 100644
--- a/recipes/liboil/liboil_0.3.17.bb
+++ b/recipes/liboil/liboil_0.3.17.bb
@@ -1,11 +1,14 @@
 DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
 HOMEPAGE = "http://liboil.freedesktop.org/"
 LICENSE = "liboil"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz"
+SRC_URI = " \
+	http://liboil.freedesktop.org/download/${P}.tar.gz \
+	file://fix-unaligned-whitelist.patch;apply=yes \
+"
 
 inherit autotools pkgconfig
 
-- 
1.7.0.4



