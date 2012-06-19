Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sh6WF-0007bY-JE
	for openembedded-devel@openembedded.org; Wed, 20 Jun 2012 00:03:29 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 9CE3CEA04D;
	Wed, 20 Jun 2012 00:00:20 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id BED8D604DE; Tue, 19 Jun 2012 23:52:38 +0200 (CEST)
Date: Tue, 19 Jun 2012 23:52:38 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120619215238.GH4845@hermes>
References: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
	<1340062930-19293-2-git-send-email-apelete@seketeli.net>
	<20120619052932.GN3178@jama.jama.net>
	<20120619060703.GA4845@hermes>
	<20120619063448.GO3178@jama.jama.net>
	<20120619195610.GC4845@hermes> <20120619214933.GG4845@hermes>
MIME-Version: 1.0
In-Reply-To: <20120619214933.GG4845@hermes>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][gtk+][PATCH v2 1/2] gtk+: Rebase gtk+-2.20.1/no-demos.patch
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
X-List-Received-Date: Tue, 19 Jun 2012 22:03:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch rebases the recipes/gtk+/gtk+-2.20.1/no-demos.patch file
against the version of the files of gtk+-2.20.1.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/gtk+/gtk+-2.20.1/no-demos.patch |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/gtk+/gtk+-2.20.1/no-demos.patch b/recipes/gtk+/gtk+-2.20.1/no-demos.patch
index 0fc4c48..ac0730d 100644
--- a/recipes/gtk+/gtk+-2.20.1/no-demos.patch
+++ b/recipes/gtk+/gtk+-2.20.1/no-demos.patch
@@ -1,7 +1,8 @@
---- gtk+-2.10.1/Makefile.am.orig	2006-08-08 12:37:30.000000000 +0100
-+++ gtk+-2.10.1/Makefile.am	2006-08-08 12:37:48.000000000 +0100
-@@ -1,6 +1,6 @@
+--- gtk+-2.20.1/Makefile.am.orig	2012-06-18 22:40:19.348040648 +0200
++++ gtk+-2.20.1/Makefile.am	2012-06-18 22:40:41.272149318 +0200
+@@ -1,7 +1,7 @@
  ## Makefile.am for GTK+
+ include $(top_srcdir)/Makefile.decl
  
 -SRC_SUBDIRS = gdk-pixbuf gdk gtk modules demos tests perf contrib
 +SRC_SUBDIRS = gdk-pixbuf gdk gtk modules tests perf contrib
-- 
1.7.10


-- 
        Apelete


