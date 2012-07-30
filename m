Received: from mail.mlbassoc.com ([65.100.170.105] helo=zeus)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@zeus>) id 1SvrqI-0002ii-3X
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 17:25:10 +0200
Received: by zeus (Postfix, from userid 996)
	id 863D7520F7B; Mon, 30 Jul 2012 09:04:12 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2012 09:04:07 -0600
Message-Id: <1343660648-20358-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] [meta-oe] glibmm: Fix compile error with latest glib
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
X-List-Received-Date: Mon, 30 Jul 2012 15:25:10 -0000

Internal <glib/XXX.h> files should not be included directly.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../glib-2.0/glibmm/fix-compile-error.patch        |   13 +++++++++++++
 meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb     |    5 ++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/fix-compile-error.patch

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/fix-compile-error.patch b/meta-oe/recipes-core/glib-2.0/glibmm/fix-compile-error.patch
new file mode 100644
index 0000000..33c6215
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glibmm/fix-compile-error.patch
@@ -0,0 +1,13 @@
+Index: glibmm-2.28.2/glib/glibmm/varianttype.cc
+===================================================================
+--- glibmm-2.28.2.orig/glib/glibmm/varianttype.cc
++++ glibmm-2.28.2/glib/glibmm/varianttype.cc
+@@ -23,7 +23,7 @@
+ 
+ #include <glibmm/varianttype.h>
+ #include <glibmm/utility.h>
+-#include <glib/gvarianttype.h>
++#include <glib.h>
+ 
+ namespace Glib
+ {
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
index 6604091..7ec0be2 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
@@ -6,4 +6,7 @@ SRC_URI[archive.md5sum] = "cf33d1861d09fb2952a6a1d69e0502e3"
 SRC_URI[archive.sha256sum] = "7b67178363f8494c94f8b3dd704a4c8db7ad75a253fc84a4ad229e5e179ec192"
 
 SRC_URI += " file://remove-examples.patch \
-             file://glib-2.32.patch"
+             file://fix-compile-error.patch \
+"
+
+
-- 
1.7.9.5



