Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol6Vc-0003h3-W2
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 22:42:20 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so3275287fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 13:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ZBzn/rhQaDYV23g7COj3FoB8/2JFZ+wt2Z+0UC0AKQg=;
	b=olpapH7B369e6qNbyqzyWst1g2oi0IxH2+xj3menn9J68LD59uAaNv2rNvcQkvdGyV
	iQ2Rh6FvGHvD4I77QXY8IQZMcKq5Q40mUl4xM/XQ/HnR83SdBdP2IedbytbS0kicatrC
	lC2X4+RAUeqQ/d+yTTlcwNdjk/yvFPL+zsCyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ipNZJYIz7q37XJr4Jj4YxwLErE4riuii0U3mj51GiM3vEdHHQIuYXCKokOMszvKYvy
	jkZ4MlymAOAsm+19Fp3SSPEKnJloqxLzz6YMnnDSoTzfN4VU/k9Vr35hCjEZbvEKIWp6
	eskDt1ccmpPGwvBTeHP7L3n9Jt7krWUAtHhn0=
Received: by 10.223.119.198 with SMTP id a6mr5613463far.66.1281991321945;
	Mon, 16 Aug 2010 13:42:01 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm1208454faz.38.2010.08.16.13.42.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 13:42:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 22:41:50 +0200
Message-Id: <1281991310-28325-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281991310-28325-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281991310-28325-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] python: move 2.6.[124] to obsolete, move all distributions to 2.6.5
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
X-List-Received-Date: Mon, 16 Aug 2010 20:42:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../include/angstrom-2008-preferred-versions.inc   |    1 -
 .../include/kaeilos-2009-preferred-versions.inc    |    1 -
 .../00-fix-bindir-libdir-for-cross.patch           |   20 +++
 .../01-use-proper-tools-for-cross-build.patch      |  116 +++++++++++++++++
 .../python-2.6.1/02-remove-test-for-cross.patch    |   94 ++++++++++++++
 .../python-2.6.1/03-fix-tkinter-detection.patch    |   40 ++++++
 .../python-2.6.1/04-default-is-optimized.patch     |   52 ++++++++
 .../05-enable-ctypes-cross-build.patch             |   28 ++++
 .../python/python-2.6.1/07-export-grammer.patch    |   10 ++
 .../python-2.6.1/99-ignore-optimization-flag.patch |   19 +++
 .../obsolete/python/python-2.6.1/sitecustomize.py  |   45 +++++++
 .../00-fix-bindir-libdir-for-cross.patch           |   20 +++
 .../01-use-proper-tools-for-cross-build.patch      |  116 +++++++++++++++++
 .../python-2.6.2/02-remove-test-for-cross.patch    |   94 ++++++++++++++
 .../python-2.6.2/03-fix-tkinter-detection.patch    |   40 ++++++
 .../python-2.6.2/04-default-is-optimized.patch     |   52 ++++++++
 .../05-enable-ctypes-cross-build.patch             |   28 ++++
 .../python-2.6.2/99-ignore-optimization-flag.patch |   19 +++
 .../obsolete/python/python-2.6.2/sitecustomize.py  |   45 +++++++
 .../00-fix-bindir-libdir-for-cross.patch           |   20 +++
 .../01-use-proper-tools-for-cross-build.patch      |  116 +++++++++++++++++
 .../python-2.6.4/02-remove-test-for-cross.patch    |   94 ++++++++++++++
 .../python-2.6.4/03-fix-tkinter-detection.patch    |   40 ++++++
 .../python-2.6.4/04-default-is-optimized.patch     |   52 ++++++++
 .../05-enable-ctypes-cross-build.patch             |   28 ++++
 .../06-ctypes-libffi-fix-configure.patch           |   51 ++++++++
 .../python-2.6.4/99-ignore-optimization-flag.patch |   19 +++
 .../obsolete/python/python-2.6.4/sitecustomize.py  |   45 +++++++
 recipes/obsolete/python/python_2.6.1.bb            |  113 +++++++++++++++++
 recipes/obsolete/python/python_2.6.2.bb            |  130 +++++++++++++++++++
 recipes/obsolete/python/python_2.6.4.bb            |  131 ++++++++++++++++++++
 .../00-fix-bindir-libdir-for-cross.patch           |   20 ---
 .../01-use-proper-tools-for-cross-build.patch      |  116 -----------------
 .../python-2.6.1/02-remove-test-for-cross.patch    |   94 --------------
 .../python-2.6.1/03-fix-tkinter-detection.patch    |   40 ------
 .../python-2.6.1/04-default-is-optimized.patch     |   52 --------
 .../05-enable-ctypes-cross-build.patch             |   28 ----
 .../python/python-2.6.1/07-export-grammer.patch    |   10 --
 .../python-2.6.1/99-ignore-optimization-flag.patch |   19 ---
 recipes/python/python-2.6.1/sitecustomize.py       |   45 -------
 .../00-fix-bindir-libdir-for-cross.patch           |   20 ---
 .../01-use-proper-tools-for-cross-build.patch      |  116 -----------------
 .../python-2.6.2/02-remove-test-for-cross.patch    |   94 --------------
 .../python-2.6.2/03-fix-tkinter-detection.patch    |   40 ------
 .../python-2.6.2/04-default-is-optimized.patch     |   52 --------
 .../05-enable-ctypes-cross-build.patch             |   28 ----
 .../python-2.6.2/99-ignore-optimization-flag.patch |   19 ---
 recipes/python/python-2.6.2/sitecustomize.py       |   45 -------
 .../00-fix-bindir-libdir-for-cross.patch           |   20 ---
 .../01-use-proper-tools-for-cross-build.patch      |  116 -----------------
 .../python-2.6.4/02-remove-test-for-cross.patch    |   94 --------------
 .../python-2.6.4/03-fix-tkinter-detection.patch    |   40 ------
 .../python-2.6.4/04-default-is-optimized.patch     |   52 --------
 .../05-enable-ctypes-cross-build.patch             |   28 ----
 .../06-ctypes-libffi-fix-configure.patch           |   51 --------
 .../python-2.6.4/99-ignore-optimization-flag.patch |   19 ---
 recipes/python/python-2.6.4/sitecustomize.py       |   45 -------
 recipes/python/python_2.6.1.bb                     |  113 -----------------
 recipes/python/python_2.6.2.bb                     |  130 -------------------
 recipes/python/python_2.6.4.bb                     |  131 --------------------
 60 files changed, 1677 insertions(+), 1679 deletions(-)
 create mode 100644 recipes/obsolete/python/python-2.6.1/00-fix-bindir-libdir-for-cross.patch
 create mode 100644 recipes/obsolete/python/python-2.6.1/01-use-proper-tools-for-cross-build.patch
 create mode 100644 recipes/obsolete/python/python-2.6.1/02-remove-test-for-cross.patch
 create mode 100644 recipes/obsolete/python/python-2.6.1/03-fix-tkinter-detection.patch
 create mode 100644 recipes/obsolete/python/python-2.6.1/04-default-is-optimized.patch
 create mode 100644 recipes/obsolete/python/python-2.6.1/05-enable-ctypes-cross-build.patch
 create mode 100644 recipes/obsolete/python/python-2.6.1/07-export-grammer.patch
 create mode 100644 recipes/obsolete/python/python-2.6.1/99-ignore-optimization-flag.patch
 create mode 100644 recipes/obsolete/python/python-2.6.1/sitecustomize.py
 create mode 100644 recipes/obsolete/python/python-2.6.2/00-fix-bindir-libdir-for-cross.patch
 create mode 100644 recipes/obsolete/python/python-2.6.2/01-use-proper-tools-for-cross-build.patch
 create mode 100644 recipes/obsolete/python/python-2.6.2/02-remove-test-for-cross.patch
 create mode 100644 recipes/obsolete/python/python-2.6.2/03-fix-tkinter-detection.patch
 create mode 100644 recipes/obsolete/python/python-2.6.2/04-default-is-optimized.patch
 create mode 100644 recipes/obsolete/python/python-2.6.2/05-enable-ctypes-cross-build.patch
 create mode 100644 recipes/obsolete/python/python-2.6.2/99-ignore-optimization-flag.patch
 create mode 100644 recipes/obsolete/python/python-2.6.2/sitecustomize.py
 create mode 100644 recipes/obsolete/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch
 create mode 100644 recipes/obsolete/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch
 create mode 100644 recipes/obsolete/python/python-2.6.4/02-remove-test-for-cross.patch
 create mode 100644 recipes/obsolete/python/python-2.6.4/03-fix-tkinter-detection.patch
 create mode 100644 recipes/obsolete/python/python-2.6.4/04-default-is-optimized.patch
 create mode 100644 recipes/obsolete/python/python-2.6.4/05-enable-ctypes-cross-build.patch
 create mode 100644 recipes/obsolete/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch
 create mode 100644 recipes/obsolete/python/python-2.6.4/99-ignore-optimization-flag.patch
 create mode 100644 recipes/obsolete/python/python-2.6.4/sitecustomize.py
 create mode 100644 recipes/obsolete/python/python_2.6.1.bb
 create mode 100644 recipes/obsolete/python/python_2.6.2.bb
 create mode 100644 recipes/obsolete/python/python_2.6.4.bb
 delete mode 100644 recipes/python/python-2.6.1/00-fix-bindir-libdir-for-cross.patch
 delete mode 100644 recipes/python/python-2.6.1/01-use-proper-tools-for-cross-build.patch
 delete mode 100644 recipes/python/python-2.6.1/02-remove-test-for-cross.patch
 delete mode 100644 recipes/python/python-2.6.1/03-fix-tkinter-detection.patch
 delete mode 100644 recipes/python/python-2.6.1/04-default-is-optimized.patch
 delete mode 100644 recipes/python/python-2.6.1/05-enable-ctypes-cross-build.patch
 delete mode 100644 recipes/python/python-2.6.1/07-export-grammer.patch
 delete mode 100644 recipes/python/python-2.6.1/99-ignore-optimization-flag.patch
 delete mode 100644 recipes/python/python-2.6.1/sitecustomize.py
 delete mode 100644 recipes/python/python-2.6.2/00-fix-bindir-libdir-for-cross.patch
 delete mode 100644 recipes/python/python-2.6.2/01-use-proper-tools-for-cross-build.patch
 delete mode 100644 recipes/python/python-2.6.2/02-remove-test-for-cross.patch
 delete mode 100644 recipes/python/python-2.6.2/03-fix-tkinter-detection.patch
 delete mode 100644 recipes/python/python-2.6.2/04-default-is-optimized.patch
 delete mode 100644 recipes/python/python-2.6.2/05-enable-ctypes-cross-build.patch
 delete mode 100644 recipes/python/python-2.6.2/99-ignore-optimization-flag.patch
 delete mode 100644 recipes/python/python-2.6.2/sitecustomize.py
 delete mode 100644 recipes/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch
 delete mode 100644 recipes/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch
 delete mode 100644 recipes/python/python-2.6.4/02-remove-test-for-cross.patch
 delete mode 100644 recipes/python/python-2.6.4/03-fix-tkinter-detection.patch
 delete mode 100644 recipes/python/python-2.6.4/04-default-is-optimized.patch
 delete mode 100644 recipes/python/python-2.6.4/05-enable-ctypes-cross-build.patch
 delete mode 100644 recipes/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch
 delete mode 100644 recipes/python/python-2.6.4/99-ignore-optimization-flag.patch
 delete mode 100644 recipes/python/python-2.6.4/sitecustomize.py
 delete mode 100644 recipes/python/python_2.6.1.bb
 delete mode 100644 recipes/python/python_2.6.2.bb
 delete mode 100644 recipes/python/python_2.6.4.bb

diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
index b0c162d..54004de 100644
--- a/conf/distro/include/angstrom-2008-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
@@ -45,7 +45,6 @@ PREFERRED_VERSION_pango-native     = "1.24.4"
 PREFERRED_VERSION_pkgconfig	= "0.23"
 PREFERRED_VERSION_pkgconfig-native = "0.23"
 PREFERRED_VERSION_pulseaudio 	= "0.9.15"
-PREFERRED_VERSION_python = "2.6.4"
 PREFERRED_VERSION_python-pycairo = "1.8.0"
 PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
diff --git a/conf/distro/include/kaeilos-2009-preferred-versions.inc b/conf/distro/include/kaeilos-2009-preferred-versions.inc
index a63359d..83e18ba 100644
--- a/conf/distro/include/kaeilos-2009-preferred-versions.inc
+++ b/conf/distro/include/kaeilos-2009-preferred-versions.inc
@@ -50,7 +50,6 @@ PREFERRED_VERSION_pango-native     = "1.24.4"
 PREFERRED_VERSION_pkgconfig	= "0.23"
 PREFERRED_VERSION_pkgconfig-native = "0.23"
 PREFERRED_VERSION_pulseaudio 	= "0.9.15"
-PREFERRED_VERSION_python = "2.6.4"
 PREFERRED_VERSION_python-pycairo = "1.8.0"
 
 KAEILOS_WX_VERSION ?= "2.8.10"
diff --git a/recipes/obsolete/python/python-2.6.1/00-fix-bindir-libdir-for-cross.patch b/recipes/obsolete/python/python-2.6.1/00-fix-bindir-libdir-for-cross.patch
new file mode 100644
index 0000000..2559e3a
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.1/00-fix-bindir-libdir-for-cross.patch
@@ -0,0 +1,20 @@
+# $(exec_prefix) points to the wrong directory, when installing
+# a cross-build. @bindir@ and @libdir@ works better and doesn't
+# affect the native build.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Makefile.pre.in
+===================================================================
+--- Python-2.6.1.orig/Makefile.pre.in
++++ Python-2.6.1/Makefile.pre.in
+@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
+ datarootdir=    @datarootdir@
+ 
+ # Expanded directories
+-BINDIR=		$(exec_prefix)/bin
+-LIBDIR=		$(exec_prefix)/lib
++BINDIR=		@bindir@
++LIBDIR=		@libdir@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
diff --git a/recipes/obsolete/python/python-2.6.1/01-use-proper-tools-for-cross-build.patch b/recipes/obsolete/python/python-2.6.1/01-use-proper-tools-for-cross-build.patch
new file mode 100644
index 0000000..e89faa4
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.1/01-use-proper-tools-for-cross-build.patch
@@ -0,0 +1,116 @@
+# We need to ensure our host tools get run during build, not the freshly
+# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Makefile.pre.in
+===================================================================
+--- Python-2.6.1.orig/Makefile.pre.in
++++ Python-2.6.1/Makefile.pre.in
+@@ -175,6 +175,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
+ 
+ PYTHON=		python$(EXE)
+ BUILDPYTHON=	python$(BUILDEXE)
++HOSTPYTHON=	$(BUILDPYTHON)
+ 
+ # The task to run while instrument when building the profile-opt target
+ PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
+@@ -205,7 +206,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
+ ##########################################################################
+ # Parser
+ PGEN=		Parser/pgen$(EXE)
+-
++HOSTPGEN=	$(PGEN)$(EXE)
+ POBJS=		\
+ 		Parser/acceler.o \
+ 		Parser/grammar1.o \
+@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -513,7 +514,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
+ 
+ $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+-		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ 
+ $(PGEN):	$(PGENOBJS)
+ 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
+@@ -879,23 +880,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
++		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
+ $(srcdir)/Lib/$(PLATDIR):
+@@ -993,7 +994,7 @@ libainstall:	all
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall:
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -276,6 +276,7 @@ class PyBuildExt(build_ext):
+             self.failed.append(ext.name)
+             self.announce('*** WARNING: renaming "%s" since importing it'
+                           ' failed: %s' % (ext.name, why), level=3)
++            return
+             assert not self.inplace
+             basename, tail = os.path.splitext(ext_filename)
+             newname = basename + "_failed" + tail
+@@ -310,8 +311,8 @@ class PyBuildExt(build_ext):
+ 
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -410,6 +411,9 @@ class PyBuildExt(build_ext):
+ 
+         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
+ 
++        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
++        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
++
+         #
+         # The following modules are all pretty straightforward, and compile
+         # on pretty much any POSIXish platform.
diff --git a/recipes/obsolete/python/python-2.6.1/02-remove-test-for-cross.patch b/recipes/obsolete/python/python-2.6.1/02-remove-test-for-cross.patch
new file mode 100644
index 0000000..48386ea
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.1/02-remove-test-for-cross.patch
@@ -0,0 +1,94 @@
+# OpenEmbedded prepopulates the autotools site cache, so if this
+# would be using AC_TRY_CACHE, we could patch it in a more sane way
+# Alas, I don't have enough autotalent to do that.
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Index: Python-2.6.1/configure.in
+===================================================================
+--- Python-2.6.1.orig/configure.in
++++ Python-2.6.1/configure.in
+@@ -2556,38 +2556,6 @@ AC_CHECK_LIB(c, inet_aton, [$ac_cv_prog_
+   AC_CHECK_LIB(resolv, inet_aton)
+ )
+ 
+-# On Tru64, chflags seems to be present, but calling it will
+-# exit Python
+-AC_MSG_CHECKING(for chflags)
+-AC_TRY_RUN([
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(chflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-],AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' function.)
+-  AC_MSG_RESULT(yes),
+-  AC_MSG_RESULT(no)
+-)
+-
+-AC_MSG_CHECKING(for lchflags)
+-AC_TRY_RUN([
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(lchflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-],AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' function.)
+-  AC_MSG_RESULT(yes),
+-  AC_MSG_RESULT(no)
+-)
+-
+ dnl Check if system zlib has *Copy() functions
+ dnl
+ dnl On MacOSX the linker will search for dylibs on the entire linker path
+@@ -3649,45 +3617,6 @@ else
+   AC_MSG_RESULT(no)
+ fi
+ 
+-AC_MSG_CHECKING(for %zd printf() format support)
+-AC_TRY_RUN([#include <stdio.h>
+-#include <stddef.h>
+-#include <string.h>
+-
+-#ifdef HAVE_SYS_TYPES_H
+-#include <sys/types.h>
+-#endif
+-
+-#ifdef HAVE_SSIZE_T
+-typedef ssize_t Py_ssize_t;
+-#elif SIZEOF_VOID_P == SIZEOF_LONG
+-typedef long Py_ssize_t;
+-#else
+-typedef int Py_ssize_t;
+-#endif
+-
+-int main()
+-{
+-    char buffer[256];
+-
+-    if(sprintf(buffer, "%zd", (size_t)123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "123"))
+-	return 1;
+-
+-    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "-123"))
+-	return 1;
+-
+-    return 0;
+-}],
+-[AC_MSG_RESULT(yes)
+- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier for Py_ssize_t])],
+- AC_MSG_RESULT(no))
+-
+ AC_CHECK_TYPE(socklen_t,,
+   AC_DEFINE(socklen_t,int,
+             Define to `int' if <sys/socket.h> does not define.),[
diff --git a/recipes/obsolete/python/python-2.6.1/03-fix-tkinter-detection.patch b/recipes/obsolete/python/python-2.6.1/03-fix-tkinter-detection.patch
new file mode 100644
index 0000000..a1a385a
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.1/03-fix-tkinter-detection.patch
@@ -0,0 +1,40 @@
+# We need to supply STAGING_INCDIR here, otherwise the Tk headers
+# will not be found.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
+
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
+                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
+             tcl_include_sub = []
+             tk_include_sub = []
+-            for dir in inc_dirs:
++            for dir in [os.getenv("STAGING_INCDIR")]:
+                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
+                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
+             tk_include_sub += tcl_include_sub
+@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
+             if dir not in include_dirs:
+                 include_dirs.append(dir)
+ 
+-        # Check for various platform-specific directories
+-        if platform == 'sunos5':
+-            include_dirs.append('/usr/openwin/include')
+-            added_lib_dirs.append('/usr/openwin/lib')
+-        elif os.path.exists('/usr/X11R6/include'):
+-            include_dirs.append('/usr/X11R6/include')
+-            added_lib_dirs.append('/usr/X11R6/lib64')
+-            added_lib_dirs.append('/usr/X11R6/lib')
+-        elif os.path.exists('/usr/X11R5/include'):
+-            include_dirs.append('/usr/X11R5/include')
+-            added_lib_dirs.append('/usr/X11R5/lib')
+-        else:
+-            # Assume default location for X11
+-            include_dirs.append('/usr/X11/include')
+-            added_lib_dirs.append('/usr/X11/lib')
+-
+         # If Cygwin, then verify that X is installed before proceeding
+         if platform == 'cygwin':
+             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/obsolete/python/python-2.6.1/04-default-is-optimized.patch b/recipes/obsolete/python/python-2.6.1/04-default-is-optimized.patch
new file mode 100644
index 0000000..805f4f6
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.1/04-default-is-optimized.patch
@@ -0,0 +1,52 @@
+# when compiling for an embedded system, we need every bit of
+# performance we can get. default to optimized with the option
+# of opt-out.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Python/compile.c
+===================================================================
+--- Python-2.6.1.orig/Python/compile.c
++++ Python-2.6.1/Python/compile.c
+@@ -32,7 +32,7 @@
+ #include "symtable.h"
+ #include "opcode.h"
+ 
+-int Py_OptimizeFlag = 0;
++int Py_OptimizeFlag = 1;
+ 
+ #define DEFAULT_BLOCK_SIZE 16
+ #define DEFAULT_BLOCKS 8
+Index: Python-2.6.1/Modules/main.c
+===================================================================
+--- Python-2.6.1.orig/Modules/main.c
++++ Python-2.6.1/Modules/main.c
+@@ -40,7 +40,7 @@ static char **orig_argv;
+ static int  orig_argc;
+ 
+ /* command line options */
+-#define BASE_OPTS "3bBc:dEhiJm:OQ:sStuUvVW:xX?"
++#define BASE_OPTS "3bBc:dEhiJm:NOQ:sStuUvVW:xX?"
+ 
+ #ifndef RISCOS
+ #define PROGRAM_OPTS BASE_OPTS
+@@ -69,8 +69,7 @@ Options and arguments (and corresponding
+ static char *usage_2 = "\
+          if stdin does not appear to be a terminal; also PYTHONINSPECT=x\n\
+ -m mod : run library module as a script (terminates option list)\n\
+--O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
+--OO    : remove doc-strings in addition to the -O optimizations\n\
++-N     : do NOT optimize generated bytecode\n\
+ -Q arg : division options: -Qold (default), -Qwarn, -Qwarnall, -Qnew\n\
+ -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
+ -S     : don't imply 'import site' on initialization\n\
+@@ -353,8 +352,8 @@ Py_Main(int argc, char **argv)
+ 
+ 		/* case 'J': reserved for Jython */
+ 
+-		case 'O':
+-			Py_OptimizeFlag++;
++		case 'N':
++			Py_OptimizeFlag=0;
+ 			break;
+ 
+ 		case 'B':
diff --git a/recipes/obsolete/python/python-2.6.1/05-enable-ctypes-cross-build.patch b/recipes/obsolete/python/python-2.6.1/05-enable-ctypes-cross-build.patch
new file mode 100644
index 0000000..58b8078
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.1/05-enable-ctypes-cross-build.patch
@@ -0,0 +1,28 @@
+# CTypes need to know the actual host we are building on.
+# Signed-Off: Michael Dietrich <mdt@emdete.de>
+
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
+                                          ffi_configfile):
+                 from distutils.dir_util import mkpath
+                 mkpath(ffi_builddir)
+-                config_args = []
++                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
+ 
+                 # Pass empty CFLAGS because we'll just append the resulting
+                 # CFLAGS to Python's; -g or -O2 is to be avoided.
+-                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
+-                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
++                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
++                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
+ 
+                 res = os.system(cmd)
+                 if res or not os.path.exists(ffi_configfile):
+-                    print "Failed to configure _ctypes module"
++                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
+                     return False
+ 
+             fficonfig = {}
diff --git a/recipes/obsolete/python/python-2.6.1/07-export-grammer.patch b/recipes/obsolete/python/python-2.6.1/07-export-grammer.patch
new file mode 100644
index 0000000..b7ec2bb
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.1/07-export-grammer.patch
@@ -0,0 +1,10 @@
+--- Python-2.6.1.orig/Parser/printgrammar.c	2008-04-13 15:35:56.000000000 -0500
++++ Python-2.6.1/Parser/printgrammar.c	2008-12-28 00:01:28.675633800 -0600
+@@ -16,6 +16,7 @@
+ 	fprintf(fp, "/* Generated by Parser/pgen */\n\n");
+ 	fprintf(fp, "#include \"pgenheaders.h\"\n");
+ 	fprintf(fp, "#include \"grammar.h\"\n");
++	fprintf(fp, "PyAPI_DATA(grammar) _PyParser_Grammar;\n");
+ 	printdfas(g, fp);
+ 	printlabels(g, fp);
+ 	fprintf(fp, "grammar _PyParser_Grammar = {\n");
diff --git a/recipes/obsolete/python/python-2.6.1/99-ignore-optimization-flag.patch b/recipes/obsolete/python/python-2.6.1/99-ignore-optimization-flag.patch
new file mode 100644
index 0000000..02dc44c
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.1/99-ignore-optimization-flag.patch
@@ -0,0 +1,19 @@
+# Reinstate the empty -O option to fix weird mixing of native and target
+# binaries and libraries with LD_LIBRARY_PATH when host==target
+#
+# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
+
+Index: Python-2.6.1/Modules/main.c
+===================================================================
+--- Python-2.6.1-orig/Modules/main.c
++++ Python-2.6.1/Modules/main.c
+@@ -352,6 +352,9 @@ Py_Main(int argc, char **argv)
+ 
+ 		/* case 'J': reserved for Jython */
+ 
++		case 'O': /* ignore it */
++			break;
++
+ 		case 'N':
+ 			Py_OptimizeFlag=0;
+ 			break;
diff --git a/recipes/obsolete/python/python-2.6.1/sitecustomize.py b/recipes/obsolete/python/python-2.6.1/sitecustomize.py
new file mode 100644
index 0000000..2739018
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.1/sitecustomize.py
@@ -0,0 +1,45 @@
+# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# GPLv2 or later
+# Version: 20081123
+# Features:
+# * set proper default encoding
+# * enable readline completion in the interactive interpreter
+# * load command line history on startup
+# * save command line history on exit 
+
+import os
+
+def __exithandler():
+    try:
+        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __registerExitHandler():
+    import atexit
+    atexit.register( __exithandler )
+
+def __enableReadlineSupport():
+    readline.set_history_length( 1000 )
+    readline.parse_and_bind( "tab: complete" )
+    try:
+        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __enableDefaultEncoding():
+    import sys
+    try:
+        sys.setdefaultencoding( "utf8" )
+    except LookupError:
+        pass
+
+import sys
+try:
+    import rlcompleter, readline
+except ImportError:
+    pass
+else:
+    __enableDefaultEncoding()
+    __registerExitHandler()
+    __enableReadlineSupport()
diff --git a/recipes/obsolete/python/python-2.6.2/00-fix-bindir-libdir-for-cross.patch b/recipes/obsolete/python/python-2.6.2/00-fix-bindir-libdir-for-cross.patch
new file mode 100644
index 0000000..2559e3a
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.2/00-fix-bindir-libdir-for-cross.patch
@@ -0,0 +1,20 @@
+# $(exec_prefix) points to the wrong directory, when installing
+# a cross-build. @bindir@ and @libdir@ works better and doesn't
+# affect the native build.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Makefile.pre.in
+===================================================================
+--- Python-2.6.1.orig/Makefile.pre.in
++++ Python-2.6.1/Makefile.pre.in
+@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
+ datarootdir=    @datarootdir@
+ 
+ # Expanded directories
+-BINDIR=		$(exec_prefix)/bin
+-LIBDIR=		$(exec_prefix)/lib
++BINDIR=		@bindir@
++LIBDIR=		@libdir@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
diff --git a/recipes/obsolete/python/python-2.6.2/01-use-proper-tools-for-cross-build.patch b/recipes/obsolete/python/python-2.6.2/01-use-proper-tools-for-cross-build.patch
new file mode 100644
index 0000000..e89faa4
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.2/01-use-proper-tools-for-cross-build.patch
@@ -0,0 +1,116 @@
+# We need to ensure our host tools get run during build, not the freshly
+# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Makefile.pre.in
+===================================================================
+--- Python-2.6.1.orig/Makefile.pre.in
++++ Python-2.6.1/Makefile.pre.in
+@@ -175,6 +175,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
+ 
+ PYTHON=		python$(EXE)
+ BUILDPYTHON=	python$(BUILDEXE)
++HOSTPYTHON=	$(BUILDPYTHON)
+ 
+ # The task to run while instrument when building the profile-opt target
+ PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
+@@ -205,7 +206,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
+ ##########################################################################
+ # Parser
+ PGEN=		Parser/pgen$(EXE)
+-
++HOSTPGEN=	$(PGEN)$(EXE)
+ POBJS=		\
+ 		Parser/acceler.o \
+ 		Parser/grammar1.o \
+@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -513,7 +514,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
+ 
+ $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+-		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ 
+ $(PGEN):	$(PGENOBJS)
+ 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
+@@ -879,23 +880,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
++		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
+ $(srcdir)/Lib/$(PLATDIR):
+@@ -993,7 +994,7 @@ libainstall:	all
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall:
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -276,6 +276,7 @@ class PyBuildExt(build_ext):
+             self.failed.append(ext.name)
+             self.announce('*** WARNING: renaming "%s" since importing it'
+                           ' failed: %s' % (ext.name, why), level=3)
++            return
+             assert not self.inplace
+             basename, tail = os.path.splitext(ext_filename)
+             newname = basename + "_failed" + tail
+@@ -310,8 +311,8 @@ class PyBuildExt(build_ext):
+ 
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -410,6 +411,9 @@ class PyBuildExt(build_ext):
+ 
+         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
+ 
++        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
++        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
++
+         #
+         # The following modules are all pretty straightforward, and compile
+         # on pretty much any POSIXish platform.
diff --git a/recipes/obsolete/python/python-2.6.2/02-remove-test-for-cross.patch b/recipes/obsolete/python/python-2.6.2/02-remove-test-for-cross.patch
new file mode 100644
index 0000000..48386ea
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.2/02-remove-test-for-cross.patch
@@ -0,0 +1,94 @@
+# OpenEmbedded prepopulates the autotools site cache, so if this
+# would be using AC_TRY_CACHE, we could patch it in a more sane way
+# Alas, I don't have enough autotalent to do that.
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Index: Python-2.6.1/configure.in
+===================================================================
+--- Python-2.6.1.orig/configure.in
++++ Python-2.6.1/configure.in
+@@ -2556,38 +2556,6 @@ AC_CHECK_LIB(c, inet_aton, [$ac_cv_prog_
+   AC_CHECK_LIB(resolv, inet_aton)
+ )
+ 
+-# On Tru64, chflags seems to be present, but calling it will
+-# exit Python
+-AC_MSG_CHECKING(for chflags)
+-AC_TRY_RUN([
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(chflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-],AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' function.)
+-  AC_MSG_RESULT(yes),
+-  AC_MSG_RESULT(no)
+-)
+-
+-AC_MSG_CHECKING(for lchflags)
+-AC_TRY_RUN([
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(lchflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-],AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' function.)
+-  AC_MSG_RESULT(yes),
+-  AC_MSG_RESULT(no)
+-)
+-
+ dnl Check if system zlib has *Copy() functions
+ dnl
+ dnl On MacOSX the linker will search for dylibs on the entire linker path
+@@ -3649,45 +3617,6 @@ else
+   AC_MSG_RESULT(no)
+ fi
+ 
+-AC_MSG_CHECKING(for %zd printf() format support)
+-AC_TRY_RUN([#include <stdio.h>
+-#include <stddef.h>
+-#include <string.h>
+-
+-#ifdef HAVE_SYS_TYPES_H
+-#include <sys/types.h>
+-#endif
+-
+-#ifdef HAVE_SSIZE_T
+-typedef ssize_t Py_ssize_t;
+-#elif SIZEOF_VOID_P == SIZEOF_LONG
+-typedef long Py_ssize_t;
+-#else
+-typedef int Py_ssize_t;
+-#endif
+-
+-int main()
+-{
+-    char buffer[256];
+-
+-    if(sprintf(buffer, "%zd", (size_t)123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "123"))
+-	return 1;
+-
+-    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "-123"))
+-	return 1;
+-
+-    return 0;
+-}],
+-[AC_MSG_RESULT(yes)
+- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier for Py_ssize_t])],
+- AC_MSG_RESULT(no))
+-
+ AC_CHECK_TYPE(socklen_t,,
+   AC_DEFINE(socklen_t,int,
+             Define to `int' if <sys/socket.h> does not define.),[
diff --git a/recipes/obsolete/python/python-2.6.2/03-fix-tkinter-detection.patch b/recipes/obsolete/python/python-2.6.2/03-fix-tkinter-detection.patch
new file mode 100644
index 0000000..a1a385a
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.2/03-fix-tkinter-detection.patch
@@ -0,0 +1,40 @@
+# We need to supply STAGING_INCDIR here, otherwise the Tk headers
+# will not be found.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
+
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
+                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
+             tcl_include_sub = []
+             tk_include_sub = []
+-            for dir in inc_dirs:
++            for dir in [os.getenv("STAGING_INCDIR")]:
+                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
+                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
+             tk_include_sub += tcl_include_sub
+@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
+             if dir not in include_dirs:
+                 include_dirs.append(dir)
+ 
+-        # Check for various platform-specific directories
+-        if platform == 'sunos5':
+-            include_dirs.append('/usr/openwin/include')
+-            added_lib_dirs.append('/usr/openwin/lib')
+-        elif os.path.exists('/usr/X11R6/include'):
+-            include_dirs.append('/usr/X11R6/include')
+-            added_lib_dirs.append('/usr/X11R6/lib64')
+-            added_lib_dirs.append('/usr/X11R6/lib')
+-        elif os.path.exists('/usr/X11R5/include'):
+-            include_dirs.append('/usr/X11R5/include')
+-            added_lib_dirs.append('/usr/X11R5/lib')
+-        else:
+-            # Assume default location for X11
+-            include_dirs.append('/usr/X11/include')
+-            added_lib_dirs.append('/usr/X11/lib')
+-
+         # If Cygwin, then verify that X is installed before proceeding
+         if platform == 'cygwin':
+             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/obsolete/python/python-2.6.2/04-default-is-optimized.patch b/recipes/obsolete/python/python-2.6.2/04-default-is-optimized.patch
new file mode 100644
index 0000000..805f4f6
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.2/04-default-is-optimized.patch
@@ -0,0 +1,52 @@
+# when compiling for an embedded system, we need every bit of
+# performance we can get. default to optimized with the option
+# of opt-out.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Python/compile.c
+===================================================================
+--- Python-2.6.1.orig/Python/compile.c
++++ Python-2.6.1/Python/compile.c
+@@ -32,7 +32,7 @@
+ #include "symtable.h"
+ #include "opcode.h"
+ 
+-int Py_OptimizeFlag = 0;
++int Py_OptimizeFlag = 1;
+ 
+ #define DEFAULT_BLOCK_SIZE 16
+ #define DEFAULT_BLOCKS 8
+Index: Python-2.6.1/Modules/main.c
+===================================================================
+--- Python-2.6.1.orig/Modules/main.c
++++ Python-2.6.1/Modules/main.c
+@@ -40,7 +40,7 @@ static char **orig_argv;
+ static int  orig_argc;
+ 
+ /* command line options */
+-#define BASE_OPTS "3bBc:dEhiJm:OQ:sStuUvVW:xX?"
++#define BASE_OPTS "3bBc:dEhiJm:NOQ:sStuUvVW:xX?"
+ 
+ #ifndef RISCOS
+ #define PROGRAM_OPTS BASE_OPTS
+@@ -69,8 +69,7 @@ Options and arguments (and corresponding
+ static char *usage_2 = "\
+          if stdin does not appear to be a terminal; also PYTHONINSPECT=x\n\
+ -m mod : run library module as a script (terminates option list)\n\
+--O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
+--OO    : remove doc-strings in addition to the -O optimizations\n\
++-N     : do NOT optimize generated bytecode\n\
+ -Q arg : division options: -Qold (default), -Qwarn, -Qwarnall, -Qnew\n\
+ -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
+ -S     : don't imply 'import site' on initialization\n\
+@@ -353,8 +352,8 @@ Py_Main(int argc, char **argv)
+ 
+ 		/* case 'J': reserved for Jython */
+ 
+-		case 'O':
+-			Py_OptimizeFlag++;
++		case 'N':
++			Py_OptimizeFlag=0;
+ 			break;
+ 
+ 		case 'B':
diff --git a/recipes/obsolete/python/python-2.6.2/05-enable-ctypes-cross-build.patch b/recipes/obsolete/python/python-2.6.2/05-enable-ctypes-cross-build.patch
new file mode 100644
index 0000000..58b8078
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.2/05-enable-ctypes-cross-build.patch
@@ -0,0 +1,28 @@
+# CTypes need to know the actual host we are building on.
+# Signed-Off: Michael Dietrich <mdt@emdete.de>
+
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
+                                          ffi_configfile):
+                 from distutils.dir_util import mkpath
+                 mkpath(ffi_builddir)
+-                config_args = []
++                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
+ 
+                 # Pass empty CFLAGS because we'll just append the resulting
+                 # CFLAGS to Python's; -g or -O2 is to be avoided.
+-                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
+-                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
++                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
++                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
+ 
+                 res = os.system(cmd)
+                 if res or not os.path.exists(ffi_configfile):
+-                    print "Failed to configure _ctypes module"
++                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
+                     return False
+ 
+             fficonfig = {}
diff --git a/recipes/obsolete/python/python-2.6.2/99-ignore-optimization-flag.patch b/recipes/obsolete/python/python-2.6.2/99-ignore-optimization-flag.patch
new file mode 100644
index 0000000..02dc44c
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.2/99-ignore-optimization-flag.patch
@@ -0,0 +1,19 @@
+# Reinstate the empty -O option to fix weird mixing of native and target
+# binaries and libraries with LD_LIBRARY_PATH when host==target
+#
+# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
+
+Index: Python-2.6.1/Modules/main.c
+===================================================================
+--- Python-2.6.1-orig/Modules/main.c
++++ Python-2.6.1/Modules/main.c
+@@ -352,6 +352,9 @@ Py_Main(int argc, char **argv)
+ 
+ 		/* case 'J': reserved for Jython */
+ 
++		case 'O': /* ignore it */
++			break;
++
+ 		case 'N':
+ 			Py_OptimizeFlag=0;
+ 			break;
diff --git a/recipes/obsolete/python/python-2.6.2/sitecustomize.py b/recipes/obsolete/python/python-2.6.2/sitecustomize.py
new file mode 100644
index 0000000..2739018
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.2/sitecustomize.py
@@ -0,0 +1,45 @@
+# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# GPLv2 or later
+# Version: 20081123
+# Features:
+# * set proper default encoding
+# * enable readline completion in the interactive interpreter
+# * load command line history on startup
+# * save command line history on exit 
+
+import os
+
+def __exithandler():
+    try:
+        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __registerExitHandler():
+    import atexit
+    atexit.register( __exithandler )
+
+def __enableReadlineSupport():
+    readline.set_history_length( 1000 )
+    readline.parse_and_bind( "tab: complete" )
+    try:
+        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __enableDefaultEncoding():
+    import sys
+    try:
+        sys.setdefaultencoding( "utf8" )
+    except LookupError:
+        pass
+
+import sys
+try:
+    import rlcompleter, readline
+except ImportError:
+    pass
+else:
+    __enableDefaultEncoding()
+    __registerExitHandler()
+    __enableReadlineSupport()
diff --git a/recipes/obsolete/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch b/recipes/obsolete/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch
new file mode 100644
index 0000000..2559e3a
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch
@@ -0,0 +1,20 @@
+# $(exec_prefix) points to the wrong directory, when installing
+# a cross-build. @bindir@ and @libdir@ works better and doesn't
+# affect the native build.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Makefile.pre.in
+===================================================================
+--- Python-2.6.1.orig/Makefile.pre.in
++++ Python-2.6.1/Makefile.pre.in
+@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
+ datarootdir=    @datarootdir@
+ 
+ # Expanded directories
+-BINDIR=		$(exec_prefix)/bin
+-LIBDIR=		$(exec_prefix)/lib
++BINDIR=		@bindir@
++LIBDIR=		@libdir@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
diff --git a/recipes/obsolete/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch b/recipes/obsolete/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch
new file mode 100644
index 0000000..e89faa4
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch
@@ -0,0 +1,116 @@
+# We need to ensure our host tools get run during build, not the freshly
+# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Makefile.pre.in
+===================================================================
+--- Python-2.6.1.orig/Makefile.pre.in
++++ Python-2.6.1/Makefile.pre.in
+@@ -175,6 +175,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
+ 
+ PYTHON=		python$(EXE)
+ BUILDPYTHON=	python$(BUILDEXE)
++HOSTPYTHON=	$(BUILDPYTHON)
+ 
+ # The task to run while instrument when building the profile-opt target
+ PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
+@@ -205,7 +206,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
+ ##########################################################################
+ # Parser
+ PGEN=		Parser/pgen$(EXE)
+-
++HOSTPGEN=	$(PGEN)$(EXE)
+ POBJS=		\
+ 		Parser/acceler.o \
+ 		Parser/grammar1.o \
+@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -513,7 +514,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
+ 
+ $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+-		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ 
+ $(PGEN):	$(PGENOBJS)
+ 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
+@@ -879,23 +880,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
++		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
+ $(srcdir)/Lib/$(PLATDIR):
+@@ -993,7 +994,7 @@ libainstall:	all
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall:
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -276,6 +276,7 @@ class PyBuildExt(build_ext):
+             self.failed.append(ext.name)
+             self.announce('*** WARNING: renaming "%s" since importing it'
+                           ' failed: %s' % (ext.name, why), level=3)
++            return
+             assert not self.inplace
+             basename, tail = os.path.splitext(ext_filename)
+             newname = basename + "_failed" + tail
+@@ -310,8 +311,8 @@ class PyBuildExt(build_ext):
+ 
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -410,6 +411,9 @@ class PyBuildExt(build_ext):
+ 
+         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
+ 
++        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
++        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
++
+         #
+         # The following modules are all pretty straightforward, and compile
+         # on pretty much any POSIXish platform.
diff --git a/recipes/obsolete/python/python-2.6.4/02-remove-test-for-cross.patch b/recipes/obsolete/python/python-2.6.4/02-remove-test-for-cross.patch
new file mode 100644
index 0000000..48386ea
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.4/02-remove-test-for-cross.patch
@@ -0,0 +1,94 @@
+# OpenEmbedded prepopulates the autotools site cache, so if this
+# would be using AC_TRY_CACHE, we could patch it in a more sane way
+# Alas, I don't have enough autotalent to do that.
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Index: Python-2.6.1/configure.in
+===================================================================
+--- Python-2.6.1.orig/configure.in
++++ Python-2.6.1/configure.in
+@@ -2556,38 +2556,6 @@ AC_CHECK_LIB(c, inet_aton, [$ac_cv_prog_
+   AC_CHECK_LIB(resolv, inet_aton)
+ )
+ 
+-# On Tru64, chflags seems to be present, but calling it will
+-# exit Python
+-AC_MSG_CHECKING(for chflags)
+-AC_TRY_RUN([
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(chflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-],AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' function.)
+-  AC_MSG_RESULT(yes),
+-  AC_MSG_RESULT(no)
+-)
+-
+-AC_MSG_CHECKING(for lchflags)
+-AC_TRY_RUN([
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(lchflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-],AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' function.)
+-  AC_MSG_RESULT(yes),
+-  AC_MSG_RESULT(no)
+-)
+-
+ dnl Check if system zlib has *Copy() functions
+ dnl
+ dnl On MacOSX the linker will search for dylibs on the entire linker path
+@@ -3649,45 +3617,6 @@ else
+   AC_MSG_RESULT(no)
+ fi
+ 
+-AC_MSG_CHECKING(for %zd printf() format support)
+-AC_TRY_RUN([#include <stdio.h>
+-#include <stddef.h>
+-#include <string.h>
+-
+-#ifdef HAVE_SYS_TYPES_H
+-#include <sys/types.h>
+-#endif
+-
+-#ifdef HAVE_SSIZE_T
+-typedef ssize_t Py_ssize_t;
+-#elif SIZEOF_VOID_P == SIZEOF_LONG
+-typedef long Py_ssize_t;
+-#else
+-typedef int Py_ssize_t;
+-#endif
+-
+-int main()
+-{
+-    char buffer[256];
+-
+-    if(sprintf(buffer, "%zd", (size_t)123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "123"))
+-	return 1;
+-
+-    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "-123"))
+-	return 1;
+-
+-    return 0;
+-}],
+-[AC_MSG_RESULT(yes)
+- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier for Py_ssize_t])],
+- AC_MSG_RESULT(no))
+-
+ AC_CHECK_TYPE(socklen_t,,
+   AC_DEFINE(socklen_t,int,
+             Define to `int' if <sys/socket.h> does not define.),[
diff --git a/recipes/obsolete/python/python-2.6.4/03-fix-tkinter-detection.patch b/recipes/obsolete/python/python-2.6.4/03-fix-tkinter-detection.patch
new file mode 100644
index 0000000..a1a385a
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.4/03-fix-tkinter-detection.patch
@@ -0,0 +1,40 @@
+# We need to supply STAGING_INCDIR here, otherwise the Tk headers
+# will not be found.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
+
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
+                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
+             tcl_include_sub = []
+             tk_include_sub = []
+-            for dir in inc_dirs:
++            for dir in [os.getenv("STAGING_INCDIR")]:
+                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
+                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
+             tk_include_sub += tcl_include_sub
+@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
+             if dir not in include_dirs:
+                 include_dirs.append(dir)
+ 
+-        # Check for various platform-specific directories
+-        if platform == 'sunos5':
+-            include_dirs.append('/usr/openwin/include')
+-            added_lib_dirs.append('/usr/openwin/lib')
+-        elif os.path.exists('/usr/X11R6/include'):
+-            include_dirs.append('/usr/X11R6/include')
+-            added_lib_dirs.append('/usr/X11R6/lib64')
+-            added_lib_dirs.append('/usr/X11R6/lib')
+-        elif os.path.exists('/usr/X11R5/include'):
+-            include_dirs.append('/usr/X11R5/include')
+-            added_lib_dirs.append('/usr/X11R5/lib')
+-        else:
+-            # Assume default location for X11
+-            include_dirs.append('/usr/X11/include')
+-            added_lib_dirs.append('/usr/X11/lib')
+-
+         # If Cygwin, then verify that X is installed before proceeding
+         if platform == 'cygwin':
+             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/obsolete/python/python-2.6.4/04-default-is-optimized.patch b/recipes/obsolete/python/python-2.6.4/04-default-is-optimized.patch
new file mode 100644
index 0000000..805f4f6
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.4/04-default-is-optimized.patch
@@ -0,0 +1,52 @@
+# when compiling for an embedded system, we need every bit of
+# performance we can get. default to optimized with the option
+# of opt-out.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Python/compile.c
+===================================================================
+--- Python-2.6.1.orig/Python/compile.c
++++ Python-2.6.1/Python/compile.c
+@@ -32,7 +32,7 @@
+ #include "symtable.h"
+ #include "opcode.h"
+ 
+-int Py_OptimizeFlag = 0;
++int Py_OptimizeFlag = 1;
+ 
+ #define DEFAULT_BLOCK_SIZE 16
+ #define DEFAULT_BLOCKS 8
+Index: Python-2.6.1/Modules/main.c
+===================================================================
+--- Python-2.6.1.orig/Modules/main.c
++++ Python-2.6.1/Modules/main.c
+@@ -40,7 +40,7 @@ static char **orig_argv;
+ static int  orig_argc;
+ 
+ /* command line options */
+-#define BASE_OPTS "3bBc:dEhiJm:OQ:sStuUvVW:xX?"
++#define BASE_OPTS "3bBc:dEhiJm:NOQ:sStuUvVW:xX?"
+ 
+ #ifndef RISCOS
+ #define PROGRAM_OPTS BASE_OPTS
+@@ -69,8 +69,7 @@ Options and arguments (and corresponding
+ static char *usage_2 = "\
+          if stdin does not appear to be a terminal; also PYTHONINSPECT=x\n\
+ -m mod : run library module as a script (terminates option list)\n\
+--O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
+--OO    : remove doc-strings in addition to the -O optimizations\n\
++-N     : do NOT optimize generated bytecode\n\
+ -Q arg : division options: -Qold (default), -Qwarn, -Qwarnall, -Qnew\n\
+ -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
+ -S     : don't imply 'import site' on initialization\n\
+@@ -353,8 +352,8 @@ Py_Main(int argc, char **argv)
+ 
+ 		/* case 'J': reserved for Jython */
+ 
+-		case 'O':
+-			Py_OptimizeFlag++;
++		case 'N':
++			Py_OptimizeFlag=0;
+ 			break;
+ 
+ 		case 'B':
diff --git a/recipes/obsolete/python/python-2.6.4/05-enable-ctypes-cross-build.patch b/recipes/obsolete/python/python-2.6.4/05-enable-ctypes-cross-build.patch
new file mode 100644
index 0000000..58b8078
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.4/05-enable-ctypes-cross-build.patch
@@ -0,0 +1,28 @@
+# CTypes need to know the actual host we are building on.
+# Signed-Off: Michael Dietrich <mdt@emdete.de>
+
+Index: Python-2.6.1/setup.py
+===================================================================
+--- Python-2.6.1.orig/setup.py
++++ Python-2.6.1/setup.py
+@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
+                                          ffi_configfile):
+                 from distutils.dir_util import mkpath
+                 mkpath(ffi_builddir)
+-                config_args = []
++                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
+ 
+                 # Pass empty CFLAGS because we'll just append the resulting
+                 # CFLAGS to Python's; -g or -O2 is to be avoided.
+-                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
+-                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
++                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
++                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
+ 
+                 res = os.system(cmd)
+                 if res or not os.path.exists(ffi_configfile):
+-                    print "Failed to configure _ctypes module"
++                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
+                     return False
+ 
+             fficonfig = {}
diff --git a/recipes/obsolete/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch b/recipes/obsolete/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch
new file mode 100644
index 0000000..3773791
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch
@@ -0,0 +1,51 @@
+This fixes configure issues with recent autoconf, e.g:
+  autoreconf: Entering directory `Modules/_ctypes/libffi'
+  autoreconf: configure.ac: not using Gettext
+  autoreconf: running: aclocal --force
+  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
+  configure.ac:26: the top level
+
+The problem is still present in python-2.6.5 but fixed in python-svn.
+
+diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac Python-2.6.4/Modules/_ctypes/libffi/configure.ac
+--- Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac      2009-04-28 22:01:18.000000000 +0200
++++ Python-2.6.4/Modules/_ctypes/libffi/configure.ac    2010-04-20 22:46:02.000000000 +0200
+@@ -23,6 +23,7 @@ AM_INIT_AUTOMAKE
+ m4_rename([_AC_ARG_VAR_PRECIOUS],[real_PRECIOUS])
+ m4_define([_AC_ARG_VAR_PRECIOUS],[])
+ AC_PROG_CC
++m4_undefine([_AC_ARG_VAR_PRECIOUS])
+ m4_rename([real_PRECIOUS],[_AC_ARG_VAR_PRECIOUS])
+ 
+ AC_SUBST(CFLAGS)
+@@ -366,7 +367,7 @@ test -d src/$TARGETDIR || mkdir src/$TAR
+ 
+ AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
+ 
+-AC_CONFIG_FILES(include/ffi.h)
++AC_CONFIG_FILES(include/ffi.h include/Makefile Makefile)
+ 
+ AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
+ 
+diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am Python-2.6.4/Modules/_ctypes/libffi/Makefile.am
+--- Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am       2008-03-04 21:09:11.000000000 +0100
++++ Python-2.6.4/Modules/_ctypes/libffi/Makefile.am     2010-04-20 22:54:03.000000000 +0200
+@@ -2,7 +2,7 @@
+ 
+ AUTOMAKE_OPTIONS = foreign subdir-objects
+ 
+-SUBDIRS = include testsuite man
++SUBDIRS = include
+ 
+ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
+        src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
+@@ -32,8 +32,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
+        src/frv/ffi.c src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
+        libtool-version ChangeLog.libffi
+ 
+-info_TEXINFOS = doc/libffi.texi
+-
+ ## ################################################################
+ 
+ ##
+
diff --git a/recipes/obsolete/python/python-2.6.4/99-ignore-optimization-flag.patch b/recipes/obsolete/python/python-2.6.4/99-ignore-optimization-flag.patch
new file mode 100644
index 0000000..02dc44c
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.4/99-ignore-optimization-flag.patch
@@ -0,0 +1,19 @@
+# Reinstate the empty -O option to fix weird mixing of native and target
+# binaries and libraries with LD_LIBRARY_PATH when host==target
+#
+# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
+
+Index: Python-2.6.1/Modules/main.c
+===================================================================
+--- Python-2.6.1-orig/Modules/main.c
++++ Python-2.6.1/Modules/main.c
+@@ -352,6 +352,9 @@ Py_Main(int argc, char **argv)
+ 
+ 		/* case 'J': reserved for Jython */
+ 
++		case 'O': /* ignore it */
++			break;
++
+ 		case 'N':
+ 			Py_OptimizeFlag=0;
+ 			break;
diff --git a/recipes/obsolete/python/python-2.6.4/sitecustomize.py b/recipes/obsolete/python/python-2.6.4/sitecustomize.py
new file mode 100644
index 0000000..2739018
--- /dev/null
+++ b/recipes/obsolete/python/python-2.6.4/sitecustomize.py
@@ -0,0 +1,45 @@
+# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# GPLv2 or later
+# Version: 20081123
+# Features:
+# * set proper default encoding
+# * enable readline completion in the interactive interpreter
+# * load command line history on startup
+# * save command line history on exit 
+
+import os
+
+def __exithandler():
+    try:
+        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __registerExitHandler():
+    import atexit
+    atexit.register( __exithandler )
+
+def __enableReadlineSupport():
+    readline.set_history_length( 1000 )
+    readline.parse_and_bind( "tab: complete" )
+    try:
+        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __enableDefaultEncoding():
+    import sys
+    try:
+        sys.setdefaultencoding( "utf8" )
+    except LookupError:
+        pass
+
+import sys
+try:
+    import rlcompleter, readline
+except ImportError:
+    pass
+else:
+    __enableDefaultEncoding()
+    __registerExitHandler()
+    __enableReadlineSupport()
diff --git a/recipes/obsolete/python/python_2.6.1.bb b/recipes/obsolete/python/python_2.6.1.bb
new file mode 100644
index 0000000..1254dbf
--- /dev/null
+++ b/recipes/obsolete/python/python_2.6.1.bb
@@ -0,0 +1,113 @@
+require python.inc
+DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
+           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
+DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+  file://00-fix-bindir-libdir-for-cross.patch \
+  file://01-use-proper-tools-for-cross-build.patch \
+  file://02-remove-test-for-cross.patch \
+  file://03-fix-tkinter-detection.patch \
+  file://04-default-is-optimized.patch \
+  file://05-enable-ctypes-cross-build.patch \
+  file://06-libffi-enable-default-mips.patch \
+  file://07-export-grammer.patch \
+  file://99-ignore-optimization-flag.patch \
+  file://sitecustomize.py \
+"
+S = "${WORKDIR}/Python-${PV}"
+
+inherit autotools
+
+# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
+#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
+TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
+TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
+
+#
+# copy config.h and an appropriate Makefile for distutils.sysconfig
+# which laters uses the information out of these to compile extensions
+#
+do_compile_prepend() {
+	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -m 0644 Makefile Makefile.orig
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+}
+
+do_compile() {
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
+
+	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
+
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		OPT="${CFLAGS}"
+}
+
+do_stage() {
+	install -m 0644 Include/*.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	oe_libinstall -a -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
+}
+
+do_install() {
+	install -m 0644 Makefile.orig Makefile
+	
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		DESTDIR=${D} LIBDIR=${libdir} install
+
+	install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+
+	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
+	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+}
+
+require python-${PYTHON_MAJMIN}-manifest.inc
+
+# manual dependency additions
+RPROVIDES_python-core = "python"
+RRECOMMENDS_python-core = "python-readline"
+RRECOMMENDS_python-crypt = "openssl"
+
+# add sitecustomize
+FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
+
+# 2to3
+FILES_python-core += "${bindir}/2to3"
+
+# package libpython
+PACKAGES =+ "libpython2"
+FILES_libpython2 = "${libdir}/libpython*.so.*"
+
+# catch debug extensions (isn't that already in python-core-dbg?)
+FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
+
+# catch all the rest (unsorted)
+PACKAGES += "python-misc"
+FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
+
+# catch manpage
+PACKAGES += "python-man"
+FILES_python-man = "${datadir}/man"
+
+SRC_URI[md5sum] = "e81c2f0953aa60f8062c05a4673f2be0"
+SRC_URI[sha256sum] = "cf153f10ba6312a8303ceb01bed834a2786d28aa89c7d73dba64714f691628f6"
diff --git a/recipes/obsolete/python/python_2.6.2.bb b/recipes/obsolete/python/python_2.6.2.bb
new file mode 100644
index 0000000..07959fb
--- /dev/null
+++ b/recipes/obsolete/python/python_2.6.2.bb
@@ -0,0 +1,130 @@
+require python.inc
+DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
+           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
+DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
+# set to .0 on every increase of INC_PR
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+  file://00-fix-bindir-libdir-for-cross.patch \
+  file://01-use-proper-tools-for-cross-build.patch \
+  file://02-remove-test-for-cross.patch \
+  file://03-fix-tkinter-detection.patch \
+  file://04-default-is-optimized.patch \
+  file://05-enable-ctypes-cross-build.patch \
+  file://99-ignore-optimization-flag.patch \
+  file://sitecustomize.py \
+"
+S = "${WORKDIR}/Python-${PV}"
+
+inherit autotools
+
+# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
+#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
+TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
+TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
+
+do_configure_prepend() {
+	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || oenote "_ctypes failed to autoreconf"
+}
+
+#
+# Copy config.h and an appropriate Makefile for distutils.sysconfig,
+# which laters uses the information out of these to compile extensions
+#
+do_compile_prepend() {
+	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -m 0644 Makefile Makefile.orig
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+}
+
+do_compile() {
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
+
+	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
+
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		RUNSHARED= OPT="${CFLAGS}"
+}
+
+do_stage() {
+	install -m 0644 Include/*.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	oe_libinstall -a -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
+}
+
+do_install() {
+	install -m 0644 Makefile.orig Makefile
+	
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		DESTDIR=${D} LIBDIR=${libdir} RUNSHARED= install
+
+	install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+
+	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
+	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+}
+
+require python-${PYTHON_MAJMIN}-manifest.inc
+
+# manual dependency additions
+RPROVIDES_python-core = "python"
+RRECOMMENDS_python-core = "python-readline"
+RRECOMMENDS_python-crypt = "openssl"
+
+# add sitecustomize
+FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
+# ship 2to3
+FILES_python-core += "${bindir}/2to3"
+
+# package libpython2
+PACKAGES =+ "libpython2"
+FILES_libpython2 = "${libdir}/libpython*.so*"
+
+# additional stuff -dev
+
+FILES_${PN}-dev = "\
+  ${includedir} \
+  ${libdir}/lib*${SOLIBSDEV} \
+  ${libdir}/*.la \
+  ${libdir}/*.a \
+  ${libdir}/*.o \
+  ${libdir}/pkgconfig \
+  ${base_libdir}/*.a \
+  ${base_libdir}/*.o \
+  ${datadir}/aclocal \
+  ${datadir}/pkgconfig \
+"
+
+# catch debug extensions (isn't that already in python-core-dbg?)
+FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
+
+# catch all the rest (unsorted)
+PACKAGES += "python-misc"
+FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
+
+# catch manpage
+PACKAGES += "python-man"
+FILES_python-man = "${datadir}/man"
+
+SRC_URI[md5sum] = "245db9f1e0f09ab7e0faaa0cf7301011"
+SRC_URI[sha256sum] = "a1cdc4a8f6c1f947ea3b87d097af2db4371019bac941d92c3844124c5694328b"
diff --git a/recipes/obsolete/python/python_2.6.4.bb b/recipes/obsolete/python/python_2.6.4.bb
new file mode 100644
index 0000000..594ffb0
--- /dev/null
+++ b/recipes/obsolete/python/python_2.6.4.bb
@@ -0,0 +1,131 @@
+require python.inc
+DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
+           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
+DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
+# set to .0 on every increase of INC_PR
+PR = "${INC_PR}.1"
+
+SRC_URI = "\
+  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2;name=archive \
+  file://00-fix-bindir-libdir-for-cross.patch \
+  file://01-use-proper-tools-for-cross-build.patch \
+  file://02-remove-test-for-cross.patch \
+  file://03-fix-tkinter-detection.patch \
+  file://04-default-is-optimized.patch \
+  file://05-enable-ctypes-cross-build.patch \
+  file://06-ctypes-libffi-fix-configure.patch \
+  file://99-ignore-optimization-flag.patch \
+  file://sitecustomize.py \
+"
+SRC_URI[archive.md5sum] = "fee5408634a54e721a93531aba37f8c1"
+SRC_URI[archive.sha256sum] = "dad8d5575144a210d5cc4fdbc40b8a26386e9cdb1ef58941bec0be02c7cb9d89"
+
+S = "${WORKDIR}/Python-${PV}"
+
+inherit autotools
+
+# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
+#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
+TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
+TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
+
+do_configure_prepend() {
+	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || oenote "_ctypes failed to autoreconf"
+}
+
+#
+# Copy config.h and an appropriate Makefile for distutils.sysconfig,
+# which laters uses the information out of these to compile extensions
+#
+do_compile_prepend() {
+	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -m 0644 Makefile Makefile.orig
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+}
+
+do_compile() {
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
+
+	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
+
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		RUNSHARED= OPT="${CFLAGS}"
+}
+
+do_stage() {
+	install -m 0644 Include/*.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	oe_libinstall -a -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
+}
+
+do_install() {
+	install -m 0644 Makefile.orig Makefile
+	
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		DESTDIR=${D} LIBDIR=${libdir} RUNSHARED= install
+
+	install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+
+	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
+	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+}
+
+require python-${PYTHON_MAJMIN}-manifest.inc
+
+# manual dependency additions
+RPROVIDES_python-core = "python"
+RRECOMMENDS_python-core = "python-readline"
+RRECOMMENDS_python-crypt = "openssl"
+
+# add sitecustomize
+FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
+# ship 2to3
+FILES_python-core += "${bindir}/2to3"
+
+# package libpython2
+PACKAGES =+ "libpython2"
+FILES_libpython2 = "${libdir}/libpython*.so*"
+
+# additional stuff -dev
+
+FILES_${PN}-dev = "\
+  ${includedir} \
+  ${libdir}/lib*${SOLIBSDEV} \
+  ${libdir}/*.la \
+  ${libdir}/*.a \
+  ${libdir}/*.o \
+  ${libdir}/pkgconfig \
+  ${base_libdir}/*.a \
+  ${base_libdir}/*.o \
+  ${datadir}/aclocal \
+  ${datadir}/pkgconfig \
+"
+
+# catch debug extensions (isn't that already in python-core-dbg?)
+FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
+
+# catch all the rest (unsorted)
+PACKAGES += "python-misc"
+FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
+
+# catch manpage
+PACKAGES += "python-man"
+FILES_python-man = "${datadir}/man"
diff --git a/recipes/python/python-2.6.1/00-fix-bindir-libdir-for-cross.patch b/recipes/python/python-2.6.1/00-fix-bindir-libdir-for-cross.patch
deleted file mode 100644
index 2559e3a..0000000
--- a/recipes/python/python-2.6.1/00-fix-bindir-libdir-for-cross.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-# $(exec_prefix) points to the wrong directory, when installing
-# a cross-build. @bindir@ and @libdir@ works better and doesn't
-# affect the native build.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Makefile.pre.in
-===================================================================
---- Python-2.6.1.orig/Makefile.pre.in
-+++ Python-2.6.1/Makefile.pre.in
-@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
- datarootdir=    @datarootdir@
- 
- # Expanded directories
--BINDIR=		$(exec_prefix)/bin
--LIBDIR=		$(exec_prefix)/lib
-+BINDIR=		@bindir@
-+LIBDIR=		@libdir@
- MANDIR=		@mandir@
- INCLUDEDIR=	@includedir@
- CONFINCLUDEDIR=	$(exec_prefix)/include
diff --git a/recipes/python/python-2.6.1/01-use-proper-tools-for-cross-build.patch b/recipes/python/python-2.6.1/01-use-proper-tools-for-cross-build.patch
deleted file mode 100644
index e89faa4..0000000
--- a/recipes/python/python-2.6.1/01-use-proper-tools-for-cross-build.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-# We need to ensure our host tools get run during build, not the freshly
-# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Makefile.pre.in
-===================================================================
---- Python-2.6.1.orig/Makefile.pre.in
-+++ Python-2.6.1/Makefile.pre.in
-@@ -175,6 +175,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
- 
- PYTHON=		python$(EXE)
- BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=	$(BUILDPYTHON)
- 
- # The task to run while instrument when building the profile-opt target
- PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
-@@ -205,7 +206,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
--
-+HOSTPGEN=	$(PGEN)$(EXE)
- POBJS=		\
- 		Parser/acceler.o \
- 		Parser/grammar1.o \
-@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -513,7 +514,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
- 
- $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
- 		-@$(INSTALL) -d Include
--		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 
- $(PGEN):	$(PGENOBJS)
- 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
-@@ -879,23 +880,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
-+		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
- 
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
-@@ -993,7 +994,7 @@ libainstall:	all
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall:
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -276,6 +276,7 @@ class PyBuildExt(build_ext):
-             self.failed.append(ext.name)
-             self.announce('*** WARNING: renaming "%s" since importing it'
-                           ' failed: %s' % (ext.name, why), level=3)
-+            return
-             assert not self.inplace
-             basename, tail = os.path.splitext(ext_filename)
-             newname = basename + "_failed" + tail
-@@ -310,8 +311,8 @@ class PyBuildExt(build_ext):
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
- 
-         # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-@@ -410,6 +411,9 @@ class PyBuildExt(build_ext):
- 
-         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
- 
-+        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
-+        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
-+
-         #
-         # The following modules are all pretty straightforward, and compile
-         # on pretty much any POSIXish platform.
diff --git a/recipes/python/python-2.6.1/02-remove-test-for-cross.patch b/recipes/python/python-2.6.1/02-remove-test-for-cross.patch
deleted file mode 100644
index 48386ea..0000000
--- a/recipes/python/python-2.6.1/02-remove-test-for-cross.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-# OpenEmbedded prepopulates the autotools site cache, so if this
-# would be using AC_TRY_CACHE, we could patch it in a more sane way
-# Alas, I don't have enough autotalent to do that.
-#
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-Index: Python-2.6.1/configure.in
-===================================================================
---- Python-2.6.1.orig/configure.in
-+++ Python-2.6.1/configure.in
-@@ -2556,38 +2556,6 @@ AC_CHECK_LIB(c, inet_aton, [$ac_cv_prog_
-   AC_CHECK_LIB(resolv, inet_aton)
- )
- 
--# On Tru64, chflags seems to be present, but calling it will
--# exit Python
--AC_MSG_CHECKING(for chflags)
--AC_TRY_RUN([
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(chflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--],AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' function.)
--  AC_MSG_RESULT(yes),
--  AC_MSG_RESULT(no)
--)
--
--AC_MSG_CHECKING(for lchflags)
--AC_TRY_RUN([
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(lchflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--],AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' function.)
--  AC_MSG_RESULT(yes),
--  AC_MSG_RESULT(no)
--)
--
- dnl Check if system zlib has *Copy() functions
- dnl
- dnl On MacOSX the linker will search for dylibs on the entire linker path
-@@ -3649,45 +3617,6 @@ else
-   AC_MSG_RESULT(no)
- fi
- 
--AC_MSG_CHECKING(for %zd printf() format support)
--AC_TRY_RUN([#include <stdio.h>
--#include <stddef.h>
--#include <string.h>
--
--#ifdef HAVE_SYS_TYPES_H
--#include <sys/types.h>
--#endif
--
--#ifdef HAVE_SSIZE_T
--typedef ssize_t Py_ssize_t;
--#elif SIZEOF_VOID_P == SIZEOF_LONG
--typedef long Py_ssize_t;
--#else
--typedef int Py_ssize_t;
--#endif
--
--int main()
--{
--    char buffer[256];
--
--    if(sprintf(buffer, "%zd", (size_t)123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "123"))
--	return 1;
--
--    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "-123"))
--	return 1;
--
--    return 0;
--}],
--[AC_MSG_RESULT(yes)
-- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier for Py_ssize_t])],
-- AC_MSG_RESULT(no))
--
- AC_CHECK_TYPE(socklen_t,,
-   AC_DEFINE(socklen_t,int,
-             Define to `int' if <sys/socket.h> does not define.),[
diff --git a/recipes/python/python-2.6.1/03-fix-tkinter-detection.patch b/recipes/python/python-2.6.1/03-fix-tkinter-detection.patch
deleted file mode 100644
index a1a385a..0000000
--- a/recipes/python/python-2.6.1/03-fix-tkinter-detection.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-# We need to supply STAGING_INCDIR here, otherwise the Tk headers
-# will not be found.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
-
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
-                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
-             tcl_include_sub = []
-             tk_include_sub = []
--            for dir in inc_dirs:
-+            for dir in [os.getenv("STAGING_INCDIR")]:
-                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
-                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
-             tk_include_sub += tcl_include_sub
-@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
-             if dir not in include_dirs:
-                 include_dirs.append(dir)
- 
--        # Check for various platform-specific directories
--        if platform == 'sunos5':
--            include_dirs.append('/usr/openwin/include')
--            added_lib_dirs.append('/usr/openwin/lib')
--        elif os.path.exists('/usr/X11R6/include'):
--            include_dirs.append('/usr/X11R6/include')
--            added_lib_dirs.append('/usr/X11R6/lib64')
--            added_lib_dirs.append('/usr/X11R6/lib')
--        elif os.path.exists('/usr/X11R5/include'):
--            include_dirs.append('/usr/X11R5/include')
--            added_lib_dirs.append('/usr/X11R5/lib')
--        else:
--            # Assume default location for X11
--            include_dirs.append('/usr/X11/include')
--            added_lib_dirs.append('/usr/X11/lib')
--
-         # If Cygwin, then verify that X is installed before proceeding
-         if platform == 'cygwin':
-             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/python/python-2.6.1/04-default-is-optimized.patch b/recipes/python/python-2.6.1/04-default-is-optimized.patch
deleted file mode 100644
index 805f4f6..0000000
--- a/recipes/python/python-2.6.1/04-default-is-optimized.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-# when compiling for an embedded system, we need every bit of
-# performance we can get. default to optimized with the option
-# of opt-out.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Python/compile.c
-===================================================================
---- Python-2.6.1.orig/Python/compile.c
-+++ Python-2.6.1/Python/compile.c
-@@ -32,7 +32,7 @@
- #include "symtable.h"
- #include "opcode.h"
- 
--int Py_OptimizeFlag = 0;
-+int Py_OptimizeFlag = 1;
- 
- #define DEFAULT_BLOCK_SIZE 16
- #define DEFAULT_BLOCKS 8
-Index: Python-2.6.1/Modules/main.c
-===================================================================
---- Python-2.6.1.orig/Modules/main.c
-+++ Python-2.6.1/Modules/main.c
-@@ -40,7 +40,7 @@ static char **orig_argv;
- static int  orig_argc;
- 
- /* command line options */
--#define BASE_OPTS "3bBc:dEhiJm:OQ:sStuUvVW:xX?"
-+#define BASE_OPTS "3bBc:dEhiJm:NOQ:sStuUvVW:xX?"
- 
- #ifndef RISCOS
- #define PROGRAM_OPTS BASE_OPTS
-@@ -69,8 +69,7 @@ Options and arguments (and corresponding
- static char *usage_2 = "\
-          if stdin does not appear to be a terminal; also PYTHONINSPECT=x\n\
- -m mod : run library module as a script (terminates option list)\n\
---O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
---OO    : remove doc-strings in addition to the -O optimizations\n\
-+-N     : do NOT optimize generated bytecode\n\
- -Q arg : division options: -Qold (default), -Qwarn, -Qwarnall, -Qnew\n\
- -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
- -S     : don't imply 'import site' on initialization\n\
-@@ -353,8 +352,8 @@ Py_Main(int argc, char **argv)
- 
- 		/* case 'J': reserved for Jython */
- 
--		case 'O':
--			Py_OptimizeFlag++;
-+		case 'N':
-+			Py_OptimizeFlag=0;
- 			break;
- 
- 		case 'B':
diff --git a/recipes/python/python-2.6.1/05-enable-ctypes-cross-build.patch b/recipes/python/python-2.6.1/05-enable-ctypes-cross-build.patch
deleted file mode 100644
index 58b8078..0000000
--- a/recipes/python/python-2.6.1/05-enable-ctypes-cross-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-# CTypes need to know the actual host we are building on.
-# Signed-Off: Michael Dietrich <mdt@emdete.de>
-
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
-                                          ffi_configfile):
-                 from distutils.dir_util import mkpath
-                 mkpath(ffi_builddir)
--                config_args = []
-+                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
- 
-                 # Pass empty CFLAGS because we'll just append the resulting
-                 # CFLAGS to Python's; -g or -O2 is to be avoided.
--                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
--                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
-+                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
-+                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
- 
-                 res = os.system(cmd)
-                 if res or not os.path.exists(ffi_configfile):
--                    print "Failed to configure _ctypes module"
-+                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
-                     return False
- 
-             fficonfig = {}
diff --git a/recipes/python/python-2.6.1/07-export-grammer.patch b/recipes/python/python-2.6.1/07-export-grammer.patch
deleted file mode 100644
index b7ec2bb..0000000
--- a/recipes/python/python-2.6.1/07-export-grammer.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- Python-2.6.1.orig/Parser/printgrammar.c	2008-04-13 15:35:56.000000000 -0500
-+++ Python-2.6.1/Parser/printgrammar.c	2008-12-28 00:01:28.675633800 -0600
-@@ -16,6 +16,7 @@
- 	fprintf(fp, "/* Generated by Parser/pgen */\n\n");
- 	fprintf(fp, "#include \"pgenheaders.h\"\n");
- 	fprintf(fp, "#include \"grammar.h\"\n");
-+	fprintf(fp, "PyAPI_DATA(grammar) _PyParser_Grammar;\n");
- 	printdfas(g, fp);
- 	printlabels(g, fp);
- 	fprintf(fp, "grammar _PyParser_Grammar = {\n");
diff --git a/recipes/python/python-2.6.1/99-ignore-optimization-flag.patch b/recipes/python/python-2.6.1/99-ignore-optimization-flag.patch
deleted file mode 100644
index 02dc44c..0000000
--- a/recipes/python/python-2.6.1/99-ignore-optimization-flag.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-# Reinstate the empty -O option to fix weird mixing of native and target
-# binaries and libraries with LD_LIBRARY_PATH when host==target
-#
-# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
-
-Index: Python-2.6.1/Modules/main.c
-===================================================================
---- Python-2.6.1-orig/Modules/main.c
-+++ Python-2.6.1/Modules/main.c
-@@ -352,6 +352,9 @@ Py_Main(int argc, char **argv)
- 
- 		/* case 'J': reserved for Jython */
- 
-+		case 'O': /* ignore it */
-+			break;
-+
- 		case 'N':
- 			Py_OptimizeFlag=0;
- 			break;
diff --git a/recipes/python/python-2.6.1/sitecustomize.py b/recipes/python/python-2.6.1/sitecustomize.py
deleted file mode 100644
index 2739018..0000000
--- a/recipes/python/python-2.6.1/sitecustomize.py
+++ /dev/null
@@ -1,45 +0,0 @@
-# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# GPLv2 or later
-# Version: 20081123
-# Features:
-# * set proper default encoding
-# * enable readline completion in the interactive interpreter
-# * load command line history on startup
-# * save command line history on exit 
-
-import os
-
-def __exithandler():
-    try:
-        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __registerExitHandler():
-    import atexit
-    atexit.register( __exithandler )
-
-def __enableReadlineSupport():
-    readline.set_history_length( 1000 )
-    readline.parse_and_bind( "tab: complete" )
-    try:
-        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __enableDefaultEncoding():
-    import sys
-    try:
-        sys.setdefaultencoding( "utf8" )
-    except LookupError:
-        pass
-
-import sys
-try:
-    import rlcompleter, readline
-except ImportError:
-    pass
-else:
-    __enableDefaultEncoding()
-    __registerExitHandler()
-    __enableReadlineSupport()
diff --git a/recipes/python/python-2.6.2/00-fix-bindir-libdir-for-cross.patch b/recipes/python/python-2.6.2/00-fix-bindir-libdir-for-cross.patch
deleted file mode 100644
index 2559e3a..0000000
--- a/recipes/python/python-2.6.2/00-fix-bindir-libdir-for-cross.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-# $(exec_prefix) points to the wrong directory, when installing
-# a cross-build. @bindir@ and @libdir@ works better and doesn't
-# affect the native build.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Makefile.pre.in
-===================================================================
---- Python-2.6.1.orig/Makefile.pre.in
-+++ Python-2.6.1/Makefile.pre.in
-@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
- datarootdir=    @datarootdir@
- 
- # Expanded directories
--BINDIR=		$(exec_prefix)/bin
--LIBDIR=		$(exec_prefix)/lib
-+BINDIR=		@bindir@
-+LIBDIR=		@libdir@
- MANDIR=		@mandir@
- INCLUDEDIR=	@includedir@
- CONFINCLUDEDIR=	$(exec_prefix)/include
diff --git a/recipes/python/python-2.6.2/01-use-proper-tools-for-cross-build.patch b/recipes/python/python-2.6.2/01-use-proper-tools-for-cross-build.patch
deleted file mode 100644
index e89faa4..0000000
--- a/recipes/python/python-2.6.2/01-use-proper-tools-for-cross-build.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-# We need to ensure our host tools get run during build, not the freshly
-# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Makefile.pre.in
-===================================================================
---- Python-2.6.1.orig/Makefile.pre.in
-+++ Python-2.6.1/Makefile.pre.in
-@@ -175,6 +175,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
- 
- PYTHON=		python$(EXE)
- BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=	$(BUILDPYTHON)
- 
- # The task to run while instrument when building the profile-opt target
- PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
-@@ -205,7 +206,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
--
-+HOSTPGEN=	$(PGEN)$(EXE)
- POBJS=		\
- 		Parser/acceler.o \
- 		Parser/grammar1.o \
-@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -513,7 +514,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
- 
- $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
- 		-@$(INSTALL) -d Include
--		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 
- $(PGEN):	$(PGENOBJS)
- 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
-@@ -879,23 +880,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
-+		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
- 
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
-@@ -993,7 +994,7 @@ libainstall:	all
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall:
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -276,6 +276,7 @@ class PyBuildExt(build_ext):
-             self.failed.append(ext.name)
-             self.announce('*** WARNING: renaming "%s" since importing it'
-                           ' failed: %s' % (ext.name, why), level=3)
-+            return
-             assert not self.inplace
-             basename, tail = os.path.splitext(ext_filename)
-             newname = basename + "_failed" + tail
-@@ -310,8 +311,8 @@ class PyBuildExt(build_ext):
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
- 
-         # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-@@ -410,6 +411,9 @@ class PyBuildExt(build_ext):
- 
-         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
- 
-+        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
-+        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
-+
-         #
-         # The following modules are all pretty straightforward, and compile
-         # on pretty much any POSIXish platform.
diff --git a/recipes/python/python-2.6.2/02-remove-test-for-cross.patch b/recipes/python/python-2.6.2/02-remove-test-for-cross.patch
deleted file mode 100644
index 48386ea..0000000
--- a/recipes/python/python-2.6.2/02-remove-test-for-cross.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-# OpenEmbedded prepopulates the autotools site cache, so if this
-# would be using AC_TRY_CACHE, we could patch it in a more sane way
-# Alas, I don't have enough autotalent to do that.
-#
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-Index: Python-2.6.1/configure.in
-===================================================================
---- Python-2.6.1.orig/configure.in
-+++ Python-2.6.1/configure.in
-@@ -2556,38 +2556,6 @@ AC_CHECK_LIB(c, inet_aton, [$ac_cv_prog_
-   AC_CHECK_LIB(resolv, inet_aton)
- )
- 
--# On Tru64, chflags seems to be present, but calling it will
--# exit Python
--AC_MSG_CHECKING(for chflags)
--AC_TRY_RUN([
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(chflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--],AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' function.)
--  AC_MSG_RESULT(yes),
--  AC_MSG_RESULT(no)
--)
--
--AC_MSG_CHECKING(for lchflags)
--AC_TRY_RUN([
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(lchflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--],AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' function.)
--  AC_MSG_RESULT(yes),
--  AC_MSG_RESULT(no)
--)
--
- dnl Check if system zlib has *Copy() functions
- dnl
- dnl On MacOSX the linker will search for dylibs on the entire linker path
-@@ -3649,45 +3617,6 @@ else
-   AC_MSG_RESULT(no)
- fi
- 
--AC_MSG_CHECKING(for %zd printf() format support)
--AC_TRY_RUN([#include <stdio.h>
--#include <stddef.h>
--#include <string.h>
--
--#ifdef HAVE_SYS_TYPES_H
--#include <sys/types.h>
--#endif
--
--#ifdef HAVE_SSIZE_T
--typedef ssize_t Py_ssize_t;
--#elif SIZEOF_VOID_P == SIZEOF_LONG
--typedef long Py_ssize_t;
--#else
--typedef int Py_ssize_t;
--#endif
--
--int main()
--{
--    char buffer[256];
--
--    if(sprintf(buffer, "%zd", (size_t)123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "123"))
--	return 1;
--
--    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "-123"))
--	return 1;
--
--    return 0;
--}],
--[AC_MSG_RESULT(yes)
-- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier for Py_ssize_t])],
-- AC_MSG_RESULT(no))
--
- AC_CHECK_TYPE(socklen_t,,
-   AC_DEFINE(socklen_t,int,
-             Define to `int' if <sys/socket.h> does not define.),[
diff --git a/recipes/python/python-2.6.2/03-fix-tkinter-detection.patch b/recipes/python/python-2.6.2/03-fix-tkinter-detection.patch
deleted file mode 100644
index a1a385a..0000000
--- a/recipes/python/python-2.6.2/03-fix-tkinter-detection.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-# We need to supply STAGING_INCDIR here, otherwise the Tk headers
-# will not be found.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
-
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
-                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
-             tcl_include_sub = []
-             tk_include_sub = []
--            for dir in inc_dirs:
-+            for dir in [os.getenv("STAGING_INCDIR")]:
-                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
-                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
-             tk_include_sub += tcl_include_sub
-@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
-             if dir not in include_dirs:
-                 include_dirs.append(dir)
- 
--        # Check for various platform-specific directories
--        if platform == 'sunos5':
--            include_dirs.append('/usr/openwin/include')
--            added_lib_dirs.append('/usr/openwin/lib')
--        elif os.path.exists('/usr/X11R6/include'):
--            include_dirs.append('/usr/X11R6/include')
--            added_lib_dirs.append('/usr/X11R6/lib64')
--            added_lib_dirs.append('/usr/X11R6/lib')
--        elif os.path.exists('/usr/X11R5/include'):
--            include_dirs.append('/usr/X11R5/include')
--            added_lib_dirs.append('/usr/X11R5/lib')
--        else:
--            # Assume default location for X11
--            include_dirs.append('/usr/X11/include')
--            added_lib_dirs.append('/usr/X11/lib')
--
-         # If Cygwin, then verify that X is installed before proceeding
-         if platform == 'cygwin':
-             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/python/python-2.6.2/04-default-is-optimized.patch b/recipes/python/python-2.6.2/04-default-is-optimized.patch
deleted file mode 100644
index 805f4f6..0000000
--- a/recipes/python/python-2.6.2/04-default-is-optimized.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-# when compiling for an embedded system, we need every bit of
-# performance we can get. default to optimized with the option
-# of opt-out.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Python/compile.c
-===================================================================
---- Python-2.6.1.orig/Python/compile.c
-+++ Python-2.6.1/Python/compile.c
-@@ -32,7 +32,7 @@
- #include "symtable.h"
- #include "opcode.h"
- 
--int Py_OptimizeFlag = 0;
-+int Py_OptimizeFlag = 1;
- 
- #define DEFAULT_BLOCK_SIZE 16
- #define DEFAULT_BLOCKS 8
-Index: Python-2.6.1/Modules/main.c
-===================================================================
---- Python-2.6.1.orig/Modules/main.c
-+++ Python-2.6.1/Modules/main.c
-@@ -40,7 +40,7 @@ static char **orig_argv;
- static int  orig_argc;
- 
- /* command line options */
--#define BASE_OPTS "3bBc:dEhiJm:OQ:sStuUvVW:xX?"
-+#define BASE_OPTS "3bBc:dEhiJm:NOQ:sStuUvVW:xX?"
- 
- #ifndef RISCOS
- #define PROGRAM_OPTS BASE_OPTS
-@@ -69,8 +69,7 @@ Options and arguments (and corresponding
- static char *usage_2 = "\
-          if stdin does not appear to be a terminal; also PYTHONINSPECT=x\n\
- -m mod : run library module as a script (terminates option list)\n\
---O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
---OO    : remove doc-strings in addition to the -O optimizations\n\
-+-N     : do NOT optimize generated bytecode\n\
- -Q arg : division options: -Qold (default), -Qwarn, -Qwarnall, -Qnew\n\
- -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
- -S     : don't imply 'import site' on initialization\n\
-@@ -353,8 +352,8 @@ Py_Main(int argc, char **argv)
- 
- 		/* case 'J': reserved for Jython */
- 
--		case 'O':
--			Py_OptimizeFlag++;
-+		case 'N':
-+			Py_OptimizeFlag=0;
- 			break;
- 
- 		case 'B':
diff --git a/recipes/python/python-2.6.2/05-enable-ctypes-cross-build.patch b/recipes/python/python-2.6.2/05-enable-ctypes-cross-build.patch
deleted file mode 100644
index 58b8078..0000000
--- a/recipes/python/python-2.6.2/05-enable-ctypes-cross-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-# CTypes need to know the actual host we are building on.
-# Signed-Off: Michael Dietrich <mdt@emdete.de>
-
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
-                                          ffi_configfile):
-                 from distutils.dir_util import mkpath
-                 mkpath(ffi_builddir)
--                config_args = []
-+                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
- 
-                 # Pass empty CFLAGS because we'll just append the resulting
-                 # CFLAGS to Python's; -g or -O2 is to be avoided.
--                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
--                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
-+                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
-+                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
- 
-                 res = os.system(cmd)
-                 if res or not os.path.exists(ffi_configfile):
--                    print "Failed to configure _ctypes module"
-+                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
-                     return False
- 
-             fficonfig = {}
diff --git a/recipes/python/python-2.6.2/99-ignore-optimization-flag.patch b/recipes/python/python-2.6.2/99-ignore-optimization-flag.patch
deleted file mode 100644
index 02dc44c..0000000
--- a/recipes/python/python-2.6.2/99-ignore-optimization-flag.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-# Reinstate the empty -O option to fix weird mixing of native and target
-# binaries and libraries with LD_LIBRARY_PATH when host==target
-#
-# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
-
-Index: Python-2.6.1/Modules/main.c
-===================================================================
---- Python-2.6.1-orig/Modules/main.c
-+++ Python-2.6.1/Modules/main.c
-@@ -352,6 +352,9 @@ Py_Main(int argc, char **argv)
- 
- 		/* case 'J': reserved for Jython */
- 
-+		case 'O': /* ignore it */
-+			break;
-+
- 		case 'N':
- 			Py_OptimizeFlag=0;
- 			break;
diff --git a/recipes/python/python-2.6.2/sitecustomize.py b/recipes/python/python-2.6.2/sitecustomize.py
deleted file mode 100644
index 2739018..0000000
--- a/recipes/python/python-2.6.2/sitecustomize.py
+++ /dev/null
@@ -1,45 +0,0 @@
-# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# GPLv2 or later
-# Version: 20081123
-# Features:
-# * set proper default encoding
-# * enable readline completion in the interactive interpreter
-# * load command line history on startup
-# * save command line history on exit 
-
-import os
-
-def __exithandler():
-    try:
-        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __registerExitHandler():
-    import atexit
-    atexit.register( __exithandler )
-
-def __enableReadlineSupport():
-    readline.set_history_length( 1000 )
-    readline.parse_and_bind( "tab: complete" )
-    try:
-        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __enableDefaultEncoding():
-    import sys
-    try:
-        sys.setdefaultencoding( "utf8" )
-    except LookupError:
-        pass
-
-import sys
-try:
-    import rlcompleter, readline
-except ImportError:
-    pass
-else:
-    __enableDefaultEncoding()
-    __registerExitHandler()
-    __enableReadlineSupport()
diff --git a/recipes/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch b/recipes/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch
deleted file mode 100644
index 2559e3a..0000000
--- a/recipes/python/python-2.6.4/00-fix-bindir-libdir-for-cross.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-# $(exec_prefix) points to the wrong directory, when installing
-# a cross-build. @bindir@ and @libdir@ works better and doesn't
-# affect the native build.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Makefile.pre.in
-===================================================================
---- Python-2.6.1.orig/Makefile.pre.in
-+++ Python-2.6.1/Makefile.pre.in
-@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
- datarootdir=    @datarootdir@
- 
- # Expanded directories
--BINDIR=		$(exec_prefix)/bin
--LIBDIR=		$(exec_prefix)/lib
-+BINDIR=		@bindir@
-+LIBDIR=		@libdir@
- MANDIR=		@mandir@
- INCLUDEDIR=	@includedir@
- CONFINCLUDEDIR=	$(exec_prefix)/include
diff --git a/recipes/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch b/recipes/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch
deleted file mode 100644
index e89faa4..0000000
--- a/recipes/python/python-2.6.4/01-use-proper-tools-for-cross-build.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-# We need to ensure our host tools get run during build, not the freshly
-# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Makefile.pre.in
-===================================================================
---- Python-2.6.1.orig/Makefile.pre.in
-+++ Python-2.6.1/Makefile.pre.in
-@@ -175,6 +175,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
- 
- PYTHON=		python$(EXE)
- BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=	$(BUILDPYTHON)
- 
- # The task to run while instrument when building the profile-opt target
- PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
-@@ -205,7 +206,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
--
-+HOSTPGEN=	$(PGEN)$(EXE)
- POBJS=		\
- 		Parser/acceler.o \
- 		Parser/grammar1.o \
-@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -513,7 +514,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
- 
- $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
- 		-@$(INSTALL) -d Include
--		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 
- $(PGEN):	$(PGENOBJS)
- 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
-@@ -879,23 +880,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
-+		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
- 
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
-@@ -993,7 +994,7 @@ libainstall:	all
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall:
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -276,6 +276,7 @@ class PyBuildExt(build_ext):
-             self.failed.append(ext.name)
-             self.announce('*** WARNING: renaming "%s" since importing it'
-                           ' failed: %s' % (ext.name, why), level=3)
-+            return
-             assert not self.inplace
-             basename, tail = os.path.splitext(ext_filename)
-             newname = basename + "_failed" + tail
-@@ -310,8 +311,8 @@ class PyBuildExt(build_ext):
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
- 
-         # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-@@ -410,6 +411,9 @@ class PyBuildExt(build_ext):
- 
-         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
- 
-+        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
-+        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
-+
-         #
-         # The following modules are all pretty straightforward, and compile
-         # on pretty much any POSIXish platform.
diff --git a/recipes/python/python-2.6.4/02-remove-test-for-cross.patch b/recipes/python/python-2.6.4/02-remove-test-for-cross.patch
deleted file mode 100644
index 48386ea..0000000
--- a/recipes/python/python-2.6.4/02-remove-test-for-cross.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-# OpenEmbedded prepopulates the autotools site cache, so if this
-# would be using AC_TRY_CACHE, we could patch it in a more sane way
-# Alas, I don't have enough autotalent to do that.
-#
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-Index: Python-2.6.1/configure.in
-===================================================================
---- Python-2.6.1.orig/configure.in
-+++ Python-2.6.1/configure.in
-@@ -2556,38 +2556,6 @@ AC_CHECK_LIB(c, inet_aton, [$ac_cv_prog_
-   AC_CHECK_LIB(resolv, inet_aton)
- )
- 
--# On Tru64, chflags seems to be present, but calling it will
--# exit Python
--AC_MSG_CHECKING(for chflags)
--AC_TRY_RUN([
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(chflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--],AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' function.)
--  AC_MSG_RESULT(yes),
--  AC_MSG_RESULT(no)
--)
--
--AC_MSG_CHECKING(for lchflags)
--AC_TRY_RUN([
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(lchflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--],AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' function.)
--  AC_MSG_RESULT(yes),
--  AC_MSG_RESULT(no)
--)
--
- dnl Check if system zlib has *Copy() functions
- dnl
- dnl On MacOSX the linker will search for dylibs on the entire linker path
-@@ -3649,45 +3617,6 @@ else
-   AC_MSG_RESULT(no)
- fi
- 
--AC_MSG_CHECKING(for %zd printf() format support)
--AC_TRY_RUN([#include <stdio.h>
--#include <stddef.h>
--#include <string.h>
--
--#ifdef HAVE_SYS_TYPES_H
--#include <sys/types.h>
--#endif
--
--#ifdef HAVE_SSIZE_T
--typedef ssize_t Py_ssize_t;
--#elif SIZEOF_VOID_P == SIZEOF_LONG
--typedef long Py_ssize_t;
--#else
--typedef int Py_ssize_t;
--#endif
--
--int main()
--{
--    char buffer[256];
--
--    if(sprintf(buffer, "%zd", (size_t)123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "123"))
--	return 1;
--
--    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "-123"))
--	return 1;
--
--    return 0;
--}],
--[AC_MSG_RESULT(yes)
-- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier for Py_ssize_t])],
-- AC_MSG_RESULT(no))
--
- AC_CHECK_TYPE(socklen_t,,
-   AC_DEFINE(socklen_t,int,
-             Define to `int' if <sys/socket.h> does not define.),[
diff --git a/recipes/python/python-2.6.4/03-fix-tkinter-detection.patch b/recipes/python/python-2.6.4/03-fix-tkinter-detection.patch
deleted file mode 100644
index a1a385a..0000000
--- a/recipes/python/python-2.6.4/03-fix-tkinter-detection.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-# We need to supply STAGING_INCDIR here, otherwise the Tk headers
-# will not be found.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
-
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
-                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
-             tcl_include_sub = []
-             tk_include_sub = []
--            for dir in inc_dirs:
-+            for dir in [os.getenv("STAGING_INCDIR")]:
-                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
-                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
-             tk_include_sub += tcl_include_sub
-@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
-             if dir not in include_dirs:
-                 include_dirs.append(dir)
- 
--        # Check for various platform-specific directories
--        if platform == 'sunos5':
--            include_dirs.append('/usr/openwin/include')
--            added_lib_dirs.append('/usr/openwin/lib')
--        elif os.path.exists('/usr/X11R6/include'):
--            include_dirs.append('/usr/X11R6/include')
--            added_lib_dirs.append('/usr/X11R6/lib64')
--            added_lib_dirs.append('/usr/X11R6/lib')
--        elif os.path.exists('/usr/X11R5/include'):
--            include_dirs.append('/usr/X11R5/include')
--            added_lib_dirs.append('/usr/X11R5/lib')
--        else:
--            # Assume default location for X11
--            include_dirs.append('/usr/X11/include')
--            added_lib_dirs.append('/usr/X11/lib')
--
-         # If Cygwin, then verify that X is installed before proceeding
-         if platform == 'cygwin':
-             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/python/python-2.6.4/04-default-is-optimized.patch b/recipes/python/python-2.6.4/04-default-is-optimized.patch
deleted file mode 100644
index 805f4f6..0000000
--- a/recipes/python/python-2.6.4/04-default-is-optimized.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-# when compiling for an embedded system, we need every bit of
-# performance we can get. default to optimized with the option
-# of opt-out.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Python/compile.c
-===================================================================
---- Python-2.6.1.orig/Python/compile.c
-+++ Python-2.6.1/Python/compile.c
-@@ -32,7 +32,7 @@
- #include "symtable.h"
- #include "opcode.h"
- 
--int Py_OptimizeFlag = 0;
-+int Py_OptimizeFlag = 1;
- 
- #define DEFAULT_BLOCK_SIZE 16
- #define DEFAULT_BLOCKS 8
-Index: Python-2.6.1/Modules/main.c
-===================================================================
---- Python-2.6.1.orig/Modules/main.c
-+++ Python-2.6.1/Modules/main.c
-@@ -40,7 +40,7 @@ static char **orig_argv;
- static int  orig_argc;
- 
- /* command line options */
--#define BASE_OPTS "3bBc:dEhiJm:OQ:sStuUvVW:xX?"
-+#define BASE_OPTS "3bBc:dEhiJm:NOQ:sStuUvVW:xX?"
- 
- #ifndef RISCOS
- #define PROGRAM_OPTS BASE_OPTS
-@@ -69,8 +69,7 @@ Options and arguments (and corresponding
- static char *usage_2 = "\
-          if stdin does not appear to be a terminal; also PYTHONINSPECT=x\n\
- -m mod : run library module as a script (terminates option list)\n\
---O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
---OO    : remove doc-strings in addition to the -O optimizations\n\
-+-N     : do NOT optimize generated bytecode\n\
- -Q arg : division options: -Qold (default), -Qwarn, -Qwarnall, -Qnew\n\
- -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
- -S     : don't imply 'import site' on initialization\n\
-@@ -353,8 +352,8 @@ Py_Main(int argc, char **argv)
- 
- 		/* case 'J': reserved for Jython */
- 
--		case 'O':
--			Py_OptimizeFlag++;
-+		case 'N':
-+			Py_OptimizeFlag=0;
- 			break;
- 
- 		case 'B':
diff --git a/recipes/python/python-2.6.4/05-enable-ctypes-cross-build.patch b/recipes/python/python-2.6.4/05-enable-ctypes-cross-build.patch
deleted file mode 100644
index 58b8078..0000000
--- a/recipes/python/python-2.6.4/05-enable-ctypes-cross-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-# CTypes need to know the actual host we are building on.
-# Signed-Off: Michael Dietrich <mdt@emdete.de>
-
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
-                                          ffi_configfile):
-                 from distutils.dir_util import mkpath
-                 mkpath(ffi_builddir)
--                config_args = []
-+                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
- 
-                 # Pass empty CFLAGS because we'll just append the resulting
-                 # CFLAGS to Python's; -g or -O2 is to be avoided.
--                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
--                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
-+                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
-+                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
- 
-                 res = os.system(cmd)
-                 if res or not os.path.exists(ffi_configfile):
--                    print "Failed to configure _ctypes module"
-+                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
-                     return False
- 
-             fficonfig = {}
diff --git a/recipes/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch b/recipes/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch
deleted file mode 100644
index 3773791..0000000
--- a/recipes/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-This fixes configure issues with recent autoconf, e.g:
-  autoreconf: Entering directory `Modules/_ctypes/libffi'
-  autoreconf: configure.ac: not using Gettext
-  autoreconf: running: aclocal --force
-  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
-  configure.ac:26: the top level
-
-The problem is still present in python-2.6.5 but fixed in python-svn.
-
-diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac Python-2.6.4/Modules/_ctypes/libffi/configure.ac
---- Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac      2009-04-28 22:01:18.000000000 +0200
-+++ Python-2.6.4/Modules/_ctypes/libffi/configure.ac    2010-04-20 22:46:02.000000000 +0200
-@@ -23,6 +23,7 @@ AM_INIT_AUTOMAKE
- m4_rename([_AC_ARG_VAR_PRECIOUS],[real_PRECIOUS])
- m4_define([_AC_ARG_VAR_PRECIOUS],[])
- AC_PROG_CC
-+m4_undefine([_AC_ARG_VAR_PRECIOUS])
- m4_rename([real_PRECIOUS],[_AC_ARG_VAR_PRECIOUS])
- 
- AC_SUBST(CFLAGS)
-@@ -366,7 +367,7 @@ test -d src/$TARGETDIR || mkdir src/$TAR
- 
- AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
- 
--AC_CONFIG_FILES(include/ffi.h)
-+AC_CONFIG_FILES(include/ffi.h include/Makefile Makefile)
- 
- AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
- 
-diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am Python-2.6.4/Modules/_ctypes/libffi/Makefile.am
---- Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am       2008-03-04 21:09:11.000000000 +0100
-+++ Python-2.6.4/Modules/_ctypes/libffi/Makefile.am     2010-04-20 22:54:03.000000000 +0200
-@@ -2,7 +2,7 @@
- 
- AUTOMAKE_OPTIONS = foreign subdir-objects
- 
--SUBDIRS = include testsuite man
-+SUBDIRS = include
- 
- EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
-        src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
-@@ -32,8 +32,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
-        src/frv/ffi.c src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
-        libtool-version ChangeLog.libffi
- 
--info_TEXINFOS = doc/libffi.texi
--
- ## ################################################################
- 
- ##
-
diff --git a/recipes/python/python-2.6.4/99-ignore-optimization-flag.patch b/recipes/python/python-2.6.4/99-ignore-optimization-flag.patch
deleted file mode 100644
index 02dc44c..0000000
--- a/recipes/python/python-2.6.4/99-ignore-optimization-flag.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-# Reinstate the empty -O option to fix weird mixing of native and target
-# binaries and libraries with LD_LIBRARY_PATH when host==target
-#
-# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
-
-Index: Python-2.6.1/Modules/main.c
-===================================================================
---- Python-2.6.1-orig/Modules/main.c
-+++ Python-2.6.1/Modules/main.c
-@@ -352,6 +352,9 @@ Py_Main(int argc, char **argv)
- 
- 		/* case 'J': reserved for Jython */
- 
-+		case 'O': /* ignore it */
-+			break;
-+
- 		case 'N':
- 			Py_OptimizeFlag=0;
- 			break;
diff --git a/recipes/python/python-2.6.4/sitecustomize.py b/recipes/python/python-2.6.4/sitecustomize.py
deleted file mode 100644
index 2739018..0000000
--- a/recipes/python/python-2.6.4/sitecustomize.py
+++ /dev/null
@@ -1,45 +0,0 @@
-# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# GPLv2 or later
-# Version: 20081123
-# Features:
-# * set proper default encoding
-# * enable readline completion in the interactive interpreter
-# * load command line history on startup
-# * save command line history on exit 
-
-import os
-
-def __exithandler():
-    try:
-        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __registerExitHandler():
-    import atexit
-    atexit.register( __exithandler )
-
-def __enableReadlineSupport():
-    readline.set_history_length( 1000 )
-    readline.parse_and_bind( "tab: complete" )
-    try:
-        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __enableDefaultEncoding():
-    import sys
-    try:
-        sys.setdefaultencoding( "utf8" )
-    except LookupError:
-        pass
-
-import sys
-try:
-    import rlcompleter, readline
-except ImportError:
-    pass
-else:
-    __enableDefaultEncoding()
-    __registerExitHandler()
-    __enableReadlineSupport()
diff --git a/recipes/python/python_2.6.1.bb b/recipes/python/python_2.6.1.bb
deleted file mode 100644
index 1254dbf..0000000
--- a/recipes/python/python_2.6.1.bb
+++ /dev/null
@@ -1,113 +0,0 @@
-require python.inc
-DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
-           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
-DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
-  file://00-fix-bindir-libdir-for-cross.patch \
-  file://01-use-proper-tools-for-cross-build.patch \
-  file://02-remove-test-for-cross.patch \
-  file://03-fix-tkinter-detection.patch \
-  file://04-default-is-optimized.patch \
-  file://05-enable-ctypes-cross-build.patch \
-  file://06-libffi-enable-default-mips.patch \
-  file://07-export-grammer.patch \
-  file://99-ignore-optimization-flag.patch \
-  file://sitecustomize.py \
-"
-S = "${WORKDIR}/Python-${PV}"
-
-inherit autotools
-
-# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
-#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
-TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
-
-#
-# copy config.h and an appropriate Makefile for distutils.sysconfig
-# which laters uses the information out of these to compile extensions
-#
-do_compile_prepend() {
-	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -m 0644 Makefile Makefile.orig
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-}
-
-do_compile() {
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
-
-	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
-
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		OPT="${CFLAGS}"
-}
-
-do_stage() {
-	install -m 0644 Include/*.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	oe_libinstall -a -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
-}
-
-do_install() {
-	install -m 0644 Makefile.orig Makefile
-	
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		DESTDIR=${D} LIBDIR=${libdir} install
-
-	install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
-
-	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
-}
-
-require python-${PYTHON_MAJMIN}-manifest.inc
-
-# manual dependency additions
-RPROVIDES_python-core = "python"
-RRECOMMENDS_python-core = "python-readline"
-RRECOMMENDS_python-crypt = "openssl"
-
-# add sitecustomize
-FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
-
-# 2to3
-FILES_python-core += "${bindir}/2to3"
-
-# package libpython
-PACKAGES =+ "libpython2"
-FILES_libpython2 = "${libdir}/libpython*.so.*"
-
-# catch debug extensions (isn't that already in python-core-dbg?)
-FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
-
-# catch all the rest (unsorted)
-PACKAGES += "python-misc"
-FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
-
-# catch manpage
-PACKAGES += "python-man"
-FILES_python-man = "${datadir}/man"
-
-SRC_URI[md5sum] = "e81c2f0953aa60f8062c05a4673f2be0"
-SRC_URI[sha256sum] = "cf153f10ba6312a8303ceb01bed834a2786d28aa89c7d73dba64714f691628f6"
diff --git a/recipes/python/python_2.6.2.bb b/recipes/python/python_2.6.2.bb
deleted file mode 100644
index 07959fb..0000000
--- a/recipes/python/python_2.6.2.bb
+++ /dev/null
@@ -1,130 +0,0 @@
-require python.inc
-DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
-           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
-DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-# set to .0 on every increase of INC_PR
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
-  file://00-fix-bindir-libdir-for-cross.patch \
-  file://01-use-proper-tools-for-cross-build.patch \
-  file://02-remove-test-for-cross.patch \
-  file://03-fix-tkinter-detection.patch \
-  file://04-default-is-optimized.patch \
-  file://05-enable-ctypes-cross-build.patch \
-  file://99-ignore-optimization-flag.patch \
-  file://sitecustomize.py \
-"
-S = "${WORKDIR}/Python-${PV}"
-
-inherit autotools
-
-# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
-#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
-TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
-
-do_configure_prepend() {
-	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || oenote "_ctypes failed to autoreconf"
-}
-
-#
-# Copy config.h and an appropriate Makefile for distutils.sysconfig,
-# which laters uses the information out of these to compile extensions
-#
-do_compile_prepend() {
-	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -m 0644 Makefile Makefile.orig
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-}
-
-do_compile() {
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
-
-	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
-
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		RUNSHARED= OPT="${CFLAGS}"
-}
-
-do_stage() {
-	install -m 0644 Include/*.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	oe_libinstall -a -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
-}
-
-do_install() {
-	install -m 0644 Makefile.orig Makefile
-	
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		DESTDIR=${D} LIBDIR=${libdir} RUNSHARED= install
-
-	install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
-
-	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
-}
-
-require python-${PYTHON_MAJMIN}-manifest.inc
-
-# manual dependency additions
-RPROVIDES_python-core = "python"
-RRECOMMENDS_python-core = "python-readline"
-RRECOMMENDS_python-crypt = "openssl"
-
-# add sitecustomize
-FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
-# ship 2to3
-FILES_python-core += "${bindir}/2to3"
-
-# package libpython2
-PACKAGES =+ "libpython2"
-FILES_libpython2 = "${libdir}/libpython*.so*"
-
-# additional stuff -dev
-
-FILES_${PN}-dev = "\
-  ${includedir} \
-  ${libdir}/lib*${SOLIBSDEV} \
-  ${libdir}/*.la \
-  ${libdir}/*.a \
-  ${libdir}/*.o \
-  ${libdir}/pkgconfig \
-  ${base_libdir}/*.a \
-  ${base_libdir}/*.o \
-  ${datadir}/aclocal \
-  ${datadir}/pkgconfig \
-"
-
-# catch debug extensions (isn't that already in python-core-dbg?)
-FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
-
-# catch all the rest (unsorted)
-PACKAGES += "python-misc"
-FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
-
-# catch manpage
-PACKAGES += "python-man"
-FILES_python-man = "${datadir}/man"
-
-SRC_URI[md5sum] = "245db9f1e0f09ab7e0faaa0cf7301011"
-SRC_URI[sha256sum] = "a1cdc4a8f6c1f947ea3b87d097af2db4371019bac941d92c3844124c5694328b"
diff --git a/recipes/python/python_2.6.4.bb b/recipes/python/python_2.6.4.bb
deleted file mode 100644
index 594ffb0..0000000
--- a/recipes/python/python_2.6.4.bb
+++ /dev/null
@@ -1,131 +0,0 @@
-require python.inc
-DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
-           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
-DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-# set to .0 on every increase of INC_PR
-PR = "${INC_PR}.1"
-
-SRC_URI = "\
-  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2;name=archive \
-  file://00-fix-bindir-libdir-for-cross.patch \
-  file://01-use-proper-tools-for-cross-build.patch \
-  file://02-remove-test-for-cross.patch \
-  file://03-fix-tkinter-detection.patch \
-  file://04-default-is-optimized.patch \
-  file://05-enable-ctypes-cross-build.patch \
-  file://06-ctypes-libffi-fix-configure.patch \
-  file://99-ignore-optimization-flag.patch \
-  file://sitecustomize.py \
-"
-SRC_URI[archive.md5sum] = "fee5408634a54e721a93531aba37f8c1"
-SRC_URI[archive.sha256sum] = "dad8d5575144a210d5cc4fdbc40b8a26386e9cdb1ef58941bec0be02c7cb9d89"
-
-S = "${WORKDIR}/Python-${PV}"
-
-inherit autotools
-
-# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
-#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
-TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
-
-do_configure_prepend() {
-	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || oenote "_ctypes failed to autoreconf"
-}
-
-#
-# Copy config.h and an appropriate Makefile for distutils.sysconfig,
-# which laters uses the information out of these to compile extensions
-#
-do_compile_prepend() {
-	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -m 0644 Makefile Makefile.orig
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-}
-
-do_compile() {
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
-
-	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
-
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		RUNSHARED= OPT="${CFLAGS}"
-}
-
-do_stage() {
-	install -m 0644 Include/*.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	oe_libinstall -a -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
-}
-
-do_install() {
-	install -m 0644 Makefile.orig Makefile
-	
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		DESTDIR=${D} LIBDIR=${libdir} RUNSHARED= install
-
-	install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
-
-	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
-}
-
-require python-${PYTHON_MAJMIN}-manifest.inc
-
-# manual dependency additions
-RPROVIDES_python-core = "python"
-RRECOMMENDS_python-core = "python-readline"
-RRECOMMENDS_python-crypt = "openssl"
-
-# add sitecustomize
-FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
-# ship 2to3
-FILES_python-core += "${bindir}/2to3"
-
-# package libpython2
-PACKAGES =+ "libpython2"
-FILES_libpython2 = "${libdir}/libpython*.so*"
-
-# additional stuff -dev
-
-FILES_${PN}-dev = "\
-  ${includedir} \
-  ${libdir}/lib*${SOLIBSDEV} \
-  ${libdir}/*.la \
-  ${libdir}/*.a \
-  ${libdir}/*.o \
-  ${libdir}/pkgconfig \
-  ${base_libdir}/*.a \
-  ${base_libdir}/*.o \
-  ${datadir}/aclocal \
-  ${datadir}/pkgconfig \
-"
-
-# catch debug extensions (isn't that already in python-core-dbg?)
-FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
-
-# catch all the rest (unsorted)
-PACKAGES += "python-misc"
-FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
-
-# catch manpage
-PACKAGES += "python-man"
-FILES_python-man = "${datadir}/man"
-- 
1.7.2



