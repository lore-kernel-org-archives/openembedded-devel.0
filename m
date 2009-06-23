Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1zc-0006Fk-Po
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:08:40 +0200
Received: (qmail 2972 invoked by uid 813007); 23 Jun 2009 08:57:38 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:57:38 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:56:55 +0200
Message-Id: <1245747417-11163-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230940.05121.marcin@juszkiewicz.com.pl>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
Cc: Tim 'timtim' Ellis <tim.ellis@foonas.org>
Subject: [STABLE][PATCH 054/125] netpbm: Make this aware of LDFLAGS, fixes QA GNU_HASH issue
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
X-List-Received-Date: Tue, 23 Jun 2009 09:08:41 -0000

From: Tim 'timtim' Ellis <tim.ellis@foonas.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/netpbm/netpbm-10.28/libgnuhash.patch |   12 ++++++++++++
 recipes/netpbm/netpbm_10.28.bb               |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netpbm/netpbm-10.28/libgnuhash.patch

diff --git a/recipes/netpbm/netpbm-10.28/libgnuhash.patch b/recipes/netpbm/netpbm-10.28/libgnuhash.patch
new file mode 100644
index 0000000..3df92ca
--- /dev/null
+++ b/recipes/netpbm/netpbm-10.28/libgnuhash.patch
@@ -0,0 +1,12 @@
+diff -urN netpbm-10.28.old/lib/Makefile netpbm-10.28/lib/Makefile
+--- netpbm-10.28.old/lib/Makefile	2005-02-05 18:47:27.000000000 +0000
++++ netpbm-10.28/lib/Makefile	2009-05-12 13:33:10.000000000 +0100
+@@ -111,7 +111,7 @@
+ 	rm -f $@
+ 	$(SYMLINK) $< $@
+ libnetpbm.$(NETPBMLIBSUFFIX).$(MAJ).$(MIN): $(LIBOBJECTS) $(LIBOBJECTS_X)
+-	$(LD) $(LDSHLIB) -o $@ $(LIBOBJECTS) $(LIBOBJECTS_X) \
++	$(LD) $(LDFLAGS) $(LDSHLIB) -o $@ $(LIBOBJECTS) $(LIBOBJECTS_X) \
+           $(SHLIB_CLIB) $(LADD)
+ endif
+ 
diff --git a/recipes/netpbm/netpbm_10.28.bb b/recipes/netpbm/netpbm_10.28.bb
index 8469074..2672e4a 100644
--- a/recipes/netpbm/netpbm_10.28.bb
+++ b/recipes/netpbm/netpbm_10.28.bb
@@ -25,10 +25,11 @@ RDEPENDS = "perl\
 RDEPENDS += "perl-module-exporter-heavy"
 RDEPENDS += "perl-module-file-spec-unix"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/netpbm/netpbm-${PV}.tgz \
 	   file://ppmtojpeg.patch;patch=42 \
+	   file://libgnuhash.patch;patch=1 \
 	   file://Makefile.config \
 	   file://oeendiangen"
 
-- 
1.6.3.1





