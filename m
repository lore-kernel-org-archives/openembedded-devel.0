Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PdOER-0004K9-E1
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 15:32:55 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id p0DEWHAK006144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 13 Jan 2011 15:32:18 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1PdODp-0006kT-8v; Thu, 13 Jan 2011 15:32:17 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 15:32:15 +0100
Message-Id: <1294929135-25911-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.3.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.915
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: [PATCH] gdbm: use full qualified permissions for chmod operations
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
X-List-Received-Date: Thu, 13 Jan 2011 14:32:55 -0000

From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

An umask of 022 can cause 'chmod' to fail in a way like

| $ chmod -w X
| chmod: X: new permissions are r--rw-r--, not r--r--r--

It is better to specify 'a-w' because chmod is not affected by the
umask then and changes all permission bits.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 recipes/gdbm/gdbm-1.8.3/chmod.patch |   23 +++++++++++++++++++++++
 recipes/gdbm/gdbm_1.8.3.bb          |    3 ++-
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gdbm/gdbm-1.8.3/chmod.patch

diff --git a/recipes/gdbm/gdbm-1.8.3/chmod.patch b/recipes/gdbm/gdbm-1.8.3/chmod.patch
new file mode 100644
index 0000000..11c65d9
--- /dev/null
+++ b/recipes/gdbm/gdbm-1.8.3/chmod.patch
@@ -0,0 +1,23 @@
+With an umask of 022 the build might fail with
+
+| chmod -w gdbm.h
+| chmod: gdbm.h: new permissions are r--rw----, not r--r-----
+| make: *** [gdbm.h] Error 1
+
+Index: gdbm-1.8.3/Makefile.in
+===================================================================
+--- gdbm-1.8.3.orig/Makefile.in
++++ gdbm-1.8.3/Makefile.in
+@@ -167,10 +167,10 @@ libgdbm_compat.la: $(C_LOBJS) gdbm.h
+ gdbm.h:	gdbm.proto gdbmerrno.h gdbm.proto2
+ 	rm -f gdbm.h
+ 	cp $(srcdir)/gdbm.proto gdbm.h
+-	chmod +w gdbm.h
++	chmod u+w gdbm.h
+ 	grep _ $(srcdir)/gdbmerrno.h >> gdbm.h
+ 	cat $(srcdir)/gdbm.proto2 >> gdbm.h
+-	chmod -w gdbm.h
++	chmod a-w gdbm.h
+ 
+ testgdbm: testgdbm.o libgdbm.la @LIBOBJS@
+ 	$(LIBTOOL) $(CC) $(LDFLAGS) -o testgdbm testgdbm.o libgdbm.la @LIBOBJS@
diff --git a/recipes/gdbm/gdbm_1.8.3.bb b/recipes/gdbm/gdbm_1.8.3.bb
index 9c91ae9..24c541a 100644
--- a/recipes/gdbm/gdbm_1.8.3.bb
+++ b/recipes/gdbm/gdbm_1.8.3.bb
@@ -8,7 +8,8 @@ PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
 	   file://makefile.patch \
-           file://libtool-mode.patch"
+           file://libtool-mode.patch \
+           file://chmod.patch"
 
 inherit autotools
 
-- 
1.7.3.4



