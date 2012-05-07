Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRTPk-0001j1-7S
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 21:16:08 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4416002wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 12:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GL3xDPGvQwpOtCJ029IRsr1lDgA1eqpeHv4/RrQWWrY=;
	b=ky1eXDMCAaJHu2RBThQbOnx/6SPIJWJ62DGixqvzutxgUuZtDJ2aNOZs1iFfP2eqox
	bykZYaus/mfIrwQcZpr7ReVXAvLY44p76zkilgxYGlRZGrk3ZsOrtcIBDpyRUAw3fw4C
	7g6W0LUBV7+4QLhCGPPRltqhQKMc+NtsLPEK8JRcHixSEYCFM1dDPVIEHzm9qSWtE+Bi
	BJVcvG7d2dWqJahKbDwa/+kPKPB/B5KZfhc+Fkf7cfSm82ygdyb7Hxcyhj6niqr5FYfa
	Uq+y3o0nw3C1Gl4maWx9WHrDsUPzaUhg+d47d7eWagijOitJpXGoMXOzljldTXZTYFiy
	M9yQ==
Received: by 10.180.8.231 with SMTP id u7mr17225431wia.9.1336417579839;
	Mon, 07 May 2012 12:06:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn9sm6503987wib.5.2012.05.07.12.06.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 12:06:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 21:05:45 +0200
Message-Id: <a1a9409931cc180e3ff61597d133be71e97a8467.1336417488.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gpe][PATCH 3/5] glibmm: fix build with glib-2.32
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
X-List-Received-Date: Mon, 07 May 2012 19:16:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/glib-2.0/glibmm/glib-2.32.patch   |   10 ++++++++++
 meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb     |    7 +++----
 2 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch b/meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch
new file mode 100644
index 0000000..50b7367
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch
@@ -0,0 +1,10 @@
+--- glibmm-2.28.2.orig/glib/glibmm/varianttype.cc	2011-06-09 20:29:48.000000000 +0200
++++ glibmm-2.28.2/glib/glibmm/varianttype.cc	2012-05-06 08:15:32.760680295 +0200
+@@ -23,7 +23,6 @@
+ 
+ #include <glibmm/varianttype.h>
+ #include <glibmm/utility.h>
+-#include <glib/gvarianttype.h>
+ 
+ namespace Glib
+ {
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
index 7e77a1c..6604091 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
@@ -1,10 +1,9 @@
 require glibmm.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[archive.md5sum] = "cf33d1861d09fb2952a6a1d69e0502e3"
 SRC_URI[archive.sha256sum] = "7b67178363f8494c94f8b3dd704a4c8db7ad75a253fc84a4ad229e5e179ec192"
 
-SRC_URI += " file://remove-examples.patch"
-
-
+SRC_URI += " file://remove-examples.patch \
+             file://glib-2.32.patch"
-- 
1.7.8.6



