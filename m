Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OrKei-0003KN-TE
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 03:05:48 +0200
Received: (qmail invoked by alias); 03 Sep 2010 01:00:45 -0000
Received: from p508829C6.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.41.198]
	by mail.gmx.net (mp026) with SMTP; 03 Sep 2010 03:00:45 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19rV2d/gGFr93jBP+MF1cU32ZBI1c6UQVwuTl2UcS
	JZw8SuBRzzCcHi
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Sep 2010 02:48:11 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201009030248.11226.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5] clutter: remove svn recipes and unreferenced files
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
X-List-Received-Date: Fri, 03 Sep 2010 01:07:20 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


* removed aaina: configure needs clutter-0.6 (now in toys/attic)
* removed clutter*svn*: repositories no more available
* removed clutter* with version < 0.8
* removed moblin-proto: repositories no more available
* removed table: repositories no more available (now in toys/attic)
* removed tidy: repositories no more available

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/aaina.inc                          |    8 --
 recipes/clutter/aaina_svn.bb                       |    8 --
 recipes/clutter/clutter-cairo.inc                  |   11 --
 .../clutter/clutter-cairo/enable_examples.patch    |   28 ------
 recipes/clutter/clutter-cairo_svn.bb               |   11 --
 recipes/clutter/clutter-glx_svn.bb                 |   10 --
 recipes/clutter/clutter-gst/autofoo-0.4.patch      |   15 ---
 recipes/clutter/clutter-gst/autofoo.patch          |   25 -----
 recipes/clutter/clutter-gst_0.4svn.bb              |    9 --
 recipes/clutter/clutter-gst_svn.bb                 |    9 --
 recipes/clutter/clutter/enable_tests-0.4.patch     |   52 ----------
 recipes/clutter/clutter/enable_tests-0.6.patch     |   40 --------
 recipes/clutter/clutter/enable_tests.patch         |   48 ---------
 recipes/clutter/clutter_0.4svn.bb                  |   15 ---
 recipes/clutter/clutter_svn.bb                     |   15 ---
 ...st-videosink-guard-GL-calls-with-ifdef-CL.patch |  102 --------------------
 recipes/clutter/moblin-proto/fix.patch             |   22 ----
 recipes/clutter/moblin-proto/paths.patch           |   15 ---
 recipes/clutter/moblin-proto_git.bb                |   20 ----
 recipes/clutter/table.inc                          |   17 ----
 recipes/clutter/table/fixes.patch                  |   14 ---
 recipes/clutter/table_svn.bb                       |   11 --
 recipes/clutter/tidy.inc                           |   21 ----
 recipes/clutter/tidy/autofoo.patch                 |   11 --
 recipes/clutter/tidy/tidy-enable-tests.patch       |   20 ----
 recipes/clutter/tidy_svn.bb                        |   10 --
 26 files changed, 0 insertions(+), 567 deletions(-)
 delete mode 100644 recipes/clutter/aaina.inc
 delete mode 100644 recipes/clutter/aaina_svn.bb
 delete mode 100644 recipes/clutter/clutter-cairo.inc
 delete mode 100644 recipes/clutter/clutter-cairo/enable_examples.patch
 delete mode 100644 recipes/clutter/clutter-cairo_svn.bb
 delete mode 100644 recipes/clutter/clutter-glx_svn.bb
 delete mode 100644 recipes/clutter/clutter-gst/autofoo-0.4.patch
 delete mode 100644 recipes/clutter/clutter-gst/autofoo.patch
 delete mode 100644 recipes/clutter/clutter-gst_0.4svn.bb
 delete mode 100644 recipes/clutter/clutter-gst_svn.bb
 delete mode 100644 recipes/clutter/clutter/enable_tests-0.4.patch
 delete mode 100644 recipes/clutter/clutter/enable_tests-0.6.patch
 delete mode 100644 recipes/clutter/clutter/enable_tests.patch
 delete mode 100644 recipes/clutter/clutter_0.4svn.bb
 delete mode 100644 recipes/clutter/clutter_svn.bb
 delete mode 100644 recipes/clutter/files/0001-clutter-gst-videosink-guard-GL-calls-with-ifdef-CL.patch
 delete mode 100644 recipes/clutter/moblin-proto/fix.patch
 delete mode 100644 recipes/clutter/moblin-proto/paths.patch
 delete mode 100644 recipes/clutter/moblin-proto_git.bb
 delete mode 100644 recipes/clutter/table.inc
 delete mode 100644 recipes/clutter/table/fixes.patch
 delete mode 100644 recipes/clutter/table_svn.bb
 delete mode 100644 recipes/clutter/tidy.inc
 delete mode 100644 recipes/clutter/tidy/autofoo.patch
 delete mode 100644 recipes/clutter/tidy/tidy-enable-tests.patch
 delete mode 100644 recipes/clutter/tidy_svn.bb

diff --git a/recipes/clutter/aaina.inc b/recipes/clutter/aaina.inc
deleted file mode 100644
index 21038f7..0000000
--- a/recipes/clutter/aaina.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "Aaina Clutter Demo"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "GPL"
-
-DEPENDS = "clutter libxml2 gtk+ neon"
-
-inherit autotools pkgconfig
-
diff --git a/recipes/clutter/aaina_svn.bb b/recipes/clutter/aaina_svn.bb
deleted file mode 100644
index a8c6cf7..0000000
--- a/recipes/clutter/aaina_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require aaina.inc
-
-SRCREV = "3597"
-PV = "0.3.0+svnr${SRCPV}"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk/toys;module=aaina;proto=http"
-
-S = "${WORKDIR}/aaina"
diff --git a/recipes/clutter/clutter-cairo.inc b/recipes/clutter/clutter-cairo.inc
deleted file mode 100644
index 5c6d7e7..0000000
--- a/recipes/clutter/clutter-cairo.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Clutter Cairo"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPL"
-
-DEPENDS = "clutter cairo"
-
-PACKAGES =+ "${PN}-examples"
-FILES_${PN}-examples = "${bindir}/flowers ${bindir}/clock"
-
-inherit autotools pkgconfig
-
diff --git a/recipes/clutter/clutter-cairo/enable_examples.patch b/recipes/clutter/clutter-cairo/enable_examples.patch
deleted file mode 100644
index c5ed63f..0000000
--- a/recipes/clutter/clutter-cairo/enable_examples.patch
+++ /dev/null
@@ -1,28 +0,0 @@
----
- examples/Makefile.am |    2 +-
- examples/flowers.c   |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: clutter-cairo/examples/Makefile.am
-===================================================================
---- clutter-cairo.orig/examples/Makefile.am	2008-08-11 16:30:04.000000000 +0100
-+++ clutter-cairo/examples/Makefile.am	2008-08-11 16:30:24.000000000 +0100
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = clock flowers bubbles
-+bin_PROGRAMS = clock flowers bubbles
- 
- INCLUDES = -I$(top_srcdir)/ @GCC_FLAGS@ @DEPS_CFLAGS@
- AM_LDFLAGS = @DEPS_LIBS@ $(top_builddir)/libclutter-cairo-@CLUTTER_CAIRO_MAJORMINOR@.la 
-Index: clutter-cairo/examples/flowers.c
-===================================================================
---- clutter-cairo.orig/examples/flowers.c	2008-08-11 16:30:04.000000000 +0100
-+++ clutter-cairo/examples/flowers.c	2008-08-11 16:30:10.000000000 +0100
-@@ -11,7 +11,7 @@
- 
- #define PETAL_MIN 20
- #define PETAL_VAR 40
--#define N_FLOWERS 40 /* reduce if you have a small card */
-+#define N_FLOWERS 8 /* reduce if you have a small card */
- 
- typedef struct Flower
- {
diff --git a/recipes/clutter/clutter-cairo_svn.bb b/recipes/clutter/clutter-cairo_svn.bb
deleted file mode 100644
index db270c1..0000000
--- a/recipes/clutter/clutter-cairo_svn.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require clutter-cairo.inc
-
-PV = "0.8.0+svnr${SRCPV}"
-SRCREV = "3210"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk;module=${PN};proto=http \
-           file://enable_examples.patch"
-
-S = "${WORKDIR}/${PN}"
-
-
diff --git a/recipes/clutter/clutter-glx_svn.bb b/recipes/clutter/clutter-glx_svn.bb
deleted file mode 100644
index 0590330..0000000
--- a/recipes/clutter/clutter-glx_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter.inc
-
-PV = "0.3.1+svn${SRCDATE}"
-PR = "${INC_PR}.0"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk;module=clutter;proto=http"
-
-S = "${WORKDIR}/clutter"
-
-
diff --git a/recipes/clutter/clutter-gst/autofoo-0.4.patch b/recipes/clutter/clutter-gst/autofoo-0.4.patch
deleted file mode 100644
index 54df63d..0000000
--- a/recipes/clutter/clutter-gst/autofoo-0.4.patch
+++ /dev/null
@@ -1,15 +0,0 @@
----
- doc/reference/Makefile.am |    2 +-
- examples/Makefile.am      |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: clutter-gst/examples/Makefile.am
-===================================================================
---- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0000
-+++ clutter-gst/examples/Makefile.am	2007-11-06 18:53:59.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = video-player video-sink audio
-+bin_PROGRAMS = video-player video-sink audio
- 
- INCLUDES = -I$(top_srcdir)/
- 
diff --git a/recipes/clutter/clutter-gst/autofoo.patch b/recipes/clutter/clutter-gst/autofoo.patch
deleted file mode 100644
index 569b0d8..0000000
--- a/recipes/clutter/clutter-gst/autofoo.patch
+++ /dev/null
@@ -1,25 +0,0 @@
----
- doc/reference/Makefile.am |    2 +-
- examples/Makefile.am      |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: clutter-gst/examples/Makefile.am
-===================================================================
---- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0000
-+++ clutter-gst/examples/Makefile.am	2007-11-06 18:53:59.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = video-player video-sink audio
-+bin_PROGRAMS = video-player video-sink audio
- 
- INCLUDES = -I$(top_srcdir)/
- 
-Index: clutter-gst/doc/reference/Makefile.am
-===================================================================
---- clutter-gst.orig/doc/reference/Makefile.am	2007-11-06 19:36:56.000000000 +0000
-+++ clutter-gst/doc/reference/Makefile.am	2007-11-06 19:37:02.000000000 +0000
-@@ -77,4 +77,4 @@ include $(top_srcdir)/gtk-doc.make
- 
- # Other files to distribute
- # e.g. EXTRA_DIST += version.xml.in
--EXTRA_DIST += version.xml.in
-+EXTRA_DIST = version.xml.in
diff --git a/recipes/clutter/clutter-gst_0.4svn.bb b/recipes/clutter/clutter-gst_0.4svn.bb
deleted file mode 100644
index 35f94c2..0000000
--- a/recipes/clutter/clutter-gst_0.4svn.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require clutter-gst.inc
-
-PV = "0.4.0+svnr${SRCPV}"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/branches;module=clutter-gst-0-4;proto=http \
-           file://autofoo-0.4.patch"
-
-
-S = "${WORKDIR}/clutter-gst-0-4"
diff --git a/recipes/clutter/clutter-gst_svn.bb b/recipes/clutter/clutter-gst_svn.bb
deleted file mode 100644
index 42dc2d8..0000000
--- a/recipes/clutter/clutter-gst_svn.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require clutter-gst.inc
-
-PV = "0.8.0+svnr${SRCPV}"
-SRCREV = "3188"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk;module=${PN};proto=http \
-           file://autofoo.patch"
-
-S = "${WORKDIR}/${PN}"
diff --git a/recipes/clutter/clutter/enable_tests-0.4.patch b/recipes/clutter/clutter/enable_tests-0.4.patch
deleted file mode 100644
index 3178a2c..0000000
--- a/recipes/clutter/clutter/enable_tests-0.4.patch
+++ /dev/null
@@ -1,52 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Index: clutter-0-4/tests/Makefile.am
-===================================================================
---- clutter-0-4.orig/tests/Makefile.am	2007-11-06 21:49:25.000000000 +0000
-+++ clutter-0-4/tests/Makefile.am	2007-11-06 21:49:48.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = test-textures test-events test-offscreen test-scale \
-+bin_PROGRAMS = test-textures test-events test-offscreen test-scale \
-                   test-actors test-behave test-text test-entry test-project \
- 		  test-boxes test-perspective test-rotate test-depth \
- 		  test-threads test-timeline
-@@ -24,4 +24,9 @@ test_depth_SOURCES     = test-depth.c
- test_threads_SOURCES   = test-threads.c
- test_timeline_SOURCES  = test-timeline.c
- 
-+test_textdir           = $(pkgdatadir)
-+test_text_DATA         = test-text.c
-+test_actorsdir         = $(pkgdatadir)
-+test_actors_DATA       = redhand.png
-+
- EXTRA_DIST = redhand.png
-Index: clutter-0-4/tests/test-actors.c
-===================================================================
---- clutter-0-4.orig/tests/test-actors.c	2007-11-06 21:49:25.000000000 +0000
-+++ clutter-0-4/tests/test-actors.c	2007-11-06 21:49:28.000000000 +0000
-@@ -143,7 +143,7 @@ main (int argc, char *argv[])
-   stage = clutter_stage_get_default ();
-   clutter_actor_set_size (stage, 800, 600);
- 
--  pixbuf = gdk_pixbuf_new_from_file ("redhand.png", NULL);
-+  pixbuf = gdk_pixbuf_new_from_file ("/usr/share/clutter/redhand.png", NULL);
- 
-   if (!pixbuf)
-     g_error("pixbuf load failed");
-Index: clutter-0-4/tests/test-text.c
-===================================================================
---- clutter-0-4.orig/tests/test-text.c	2007-11-06 21:49:25.000000000 +0000
-+++ clutter-0-4/tests/test-text.c	2007-11-06 21:49:28.000000000 +0000
-@@ -27,7 +27,7 @@ main (int argc, char *argv[])
- 
-   stage = clutter_stage_get_default ();
- 
--  if (!g_file_get_contents ("test-text.c", &text, &size, NULL)) 
-+  if (!g_file_get_contents ("/usr/share/clutter/test-text.c", &text, &size, NULL))
-     g_error("g_file_get_contents() of test-text.c failed");
- 
-   clutter_actor_set_size (stage, 800, 600);
diff --git a/recipes/clutter/clutter/enable_tests-0.6.patch b/recipes/clutter/clutter/enable_tests-0.6.patch
deleted file mode 100644
index 544a7e5..0000000
--- a/recipes/clutter/clutter/enable_tests-0.6.patch
+++ /dev/null
@@ -1,40 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Index: clutter-0-6/tests/Makefile.am
-===================================================================
---- clutter.orig/tests/Makefile.am	2007-11-06 12:29:17.000000000 +0000
-+++ clutter-0-6/tests/Makefile.am	2007-11-06 12:30:11.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = test-textures test-events test-offscreen test-scale \
-+bin_PROGRAMS = test-textures test-events test-offscreen test-scale \
-                   test-actors test-behave test-text test-entry test-project \
- 		  test-boxes test-perspective test-rotate test-depth \
- 		  test-threads test-timeline test-score test-script
-@@ -26,4 +26,9 @@ test_timeline_SOURCES  = test-timeline.c
- test_score_SOURCES     = test-score.c
- test_script_SOURCES    = test-script.c
- 
-+test_textdir           = $(pkgdatadir)
-+test_text_DATA         = test-text.c
-+test_actorsdir         = $(pkgdatadir)
-+test_actors_DATA       = redhand.png
-+
- EXTRA_DIST = redhand.png test-script.json
-Index: clutter-0-6/tests/test-actors.c
-===================================================================
---- clutter.orig/tests/test-actors.c	2007-11-06 12:29:17.000000000 +0000
-+++ clutter-0-6/tests/test-actors.c	2007-11-06 12:29:21.000000000 +0000
-@@ -143,7 +143,7 @@ main (int argc, char *argv[])
-   stage = clutter_stage_get_default ();
-   clutter_actor_set_size (stage, 800, 600);
- 
--  pixbuf = gdk_pixbuf_new_from_file ("redhand.png", NULL);
-+  pixbuf = gdk_pixbuf_new_from_file ("/usr/share/clutter/redhand.png", NULL);
- 
-   if (!pixbuf)
-     g_error("pixbuf load failed");
-
diff --git a/recipes/clutter/clutter/enable_tests.patch b/recipes/clutter/clutter/enable_tests.patch
deleted file mode 100644
index 4a99968..0000000
--- a/recipes/clutter/clutter/enable_tests.patch
+++ /dev/null
@@ -1,48 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Index: clutter/tests/Makefile.am
-===================================================================
---- clutter.orig/tests/Makefile.am	2008-04-25 16:45:17.000000000 +0100
-+++ clutter/tests/Makefile.am	2008-04-25 16:47:12.000000000 +0100
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = test-textures test-events test-offscreen test-scale \
-+bin_PROGRAMS = test-textures test-events test-offscreen test-scale \
-                   test-actors test-behave test-text test-entry test-project \
- 		  test-perspective test-rotate test-depth \
- 		  test-threads test-timeline test-timeline-dup-frames \
-@@ -14,7 +14,7 @@
- 		  test-cogl-tex-polygon test-stage-read-pixels
- 
- if X11_TESTS
--noinst_PROGRAMS += test-pixmap
-+bin_PROGRAMS += test-pixmap
- endif
- 
- INCLUDES = -I$(top_srcdir)/ -I$(top_builddir)/clutter
-@@ -61,4 +61,9 @@
- test_cogl_offscreen_SOURCES   = test-cogl-offscreen.c
- test_stage_read_pixels_SOURCES = test-stage-read-pixels.c
- 
-+test_textdir           = $(pkgdatadir)
-+test_text_DATA         = test-text.c
-+test_actorsdir         = $(pkgdatadir)
-+test_actors_DATA       = redhand.png
-+
- EXTRA_DIST = redhand.png test-script.json
-Index: clutter/tests/test-actors.c
-===================================================================
---- clutter.orig/tests/test-actors.c	2008-04-25 16:45:17.000000000 +0100
-+++ clutter/tests/test-actors.c	2008-04-25 16:45:17.000000000 +0100
-@@ -184,7 +184,7 @@
-       /* Create a texture from file, then clone in to same resources */
-       if (i == 0)
- 	{
--	  if ((oh->hand[i] = clutter_texture_new_from_file ("redhand.png",
-+	  if ((oh->hand[i] = clutter_texture_new_from_file ("/usr/share/clutter/redhand.png",
- 							    &error)) == NULL)
- 	    {
- 	      g_error ("image load failed: %s", error->message);
diff --git a/recipes/clutter/clutter_0.4svn.bb b/recipes/clutter/clutter_0.4svn.bb
deleted file mode 100644
index 9399180..0000000
--- a/recipes/clutter/clutter_0.4svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require clutter.inc
-
-PV = "0.4.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-SRCREV = "3240"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/branches;module=clutter-0-4;proto=http \
-	   file://enable_tests-0.4.patch "
-
-S = "${WORKDIR}/clutter-0-4"
-
-do_stage () {
-        cp ${S}/clutter.pc ${S}/clutter-0.4.pc
-        autotools_stage_all
-}
diff --git a/recipes/clutter/clutter_svn.bb b/recipes/clutter/clutter_svn.bb
deleted file mode 100644
index f2cd50b..0000000
--- a/recipes/clutter/clutter_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require clutter.inc
-
-DEFAULT_PREFERENCE = "-1"
-
-PV = "0.8.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-SRCREV = "3240"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk;module=clutter;proto=http \
-           file://enable_tests.patch;maxrev=2989 \
-           file://enable-tests-r2990.patch;minrev=2990"
-
-S = "${WORKDIR}/clutter"
-
-
diff --git a/recipes/clutter/files/0001-clutter-gst-videosink-guard-GL-calls-with-ifdef-CL.patch b/recipes/clutter/files/0001-clutter-gst-videosink-guard-GL-calls-with-ifdef-CL.patch
deleted file mode 100644
index e373bca..0000000
--- a/recipes/clutter/files/0001-clutter-gst-videosink-guard-GL-calls-with-ifdef-CL.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 0677f1e6b5221caf78d50d94d2d0611e7f4b0abc Mon Sep 17 00:00:00 2001
-From: Damien Lespiau <damien.lespiau@intel.com>
-Date: Sun, 14 Jun 2009 15:30:04 +0100
-Subject: [PATCH] Fix compilation with OpenGL ES backends
-
-* Don't try to compile ARB fp1.0 shaders on non GL platforms,
-* Use CGL_MAX_COMBINED_TEXTURE_IMAGE_UNITS to query the number of
-  texture units one can use in a shader in a portable fashion.
----
- clutter-gst/clutter-gst-video-sink.c |   14 ++++++++++++--
- 1 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/clutter-gst/clutter-gst-video-sink.c b/clutter-gst/clutter-gst-video-sink.c
-index d6eb6a3..516a42c 100644
---- a/clutter-gst/clutter-gst-video-sink.c
-+++ b/clutter-gst/clutter-gst-video-sink.c
-@@ -236,6 +236,7 @@ _string_array_to_char_array (char	*dst,
-   *dst = '\0';
- }
- 
-+#ifdef CLUTTER_COGL_HAS_GL
- static void
- clutter_gst_video_sink_fp_paint (ClutterActor        *actor,
-                                 ClutterGstVideoSink *sink)
-@@ -274,6 +275,7 @@ clutter_gst_video_sink_set_fp_shader (ClutterGstVideoSink *sink,
-   priv->shaders_init = TRUE;
- 
- }
-+#endif
- 
- static void
- clutter_gst_video_sink_paint (ClutterActor        *actor,
-@@ -532,6 +534,7 @@ static ClutterGstRenderer yv12_glsl_renderer =
-  * 8 bit Y plane followed by 8 bit 2x2 subsampled V and U planes.
-  */
- 
-+#ifdef CLUTTER_COGL_HAS_GL
- static void
- clutter_gst_yv12_fp_init (ClutterActor        *actor,
-                           ClutterGstVideoSink *sink)
-@@ -573,6 +576,7 @@ static ClutterGstRenderer yv12_fp_renderer =
-   clutter_gst_yv12_paint,
-   clutter_gst_yv12_fp_post_paint,
- };
-+#endif
- 
- /*
-  * I420
-@@ -620,6 +624,7 @@ static ClutterGstRenderer i420_glsl_renderer =
-  * Basically the same as YV12, but with the 2 chroma planes switched.
-  */
- 
-+#ifdef CLUTTER_COGL_HAS_GL
- static void
- clutter_gst_i420_fp_init (ClutterActor        *actor,
-                           ClutterGstVideoSink *sink)
-@@ -646,6 +651,7 @@ static ClutterGstRenderer i420_fp_renderer =
-   clutter_gst_yv12_paint,
-   clutter_gst_yv12_fp_post_paint,
- };
-+#endif
- 
- /*
-  * AYUV
-@@ -707,9 +713,11 @@ clutter_gst_build_renderers_list (ClutterGstSymbols *syms)
-       &rgb24_renderer,
-       &rgb32_renderer,
-       &yv12_glsl_renderer,
--      &yv12_fp_renderer,
-       &i420_glsl_renderer,
-+#ifdef CLUTTER_COGL_HAS_GL
-+      &yv12_fp_renderer,
-       &i420_fp_renderer,
-+#endif
-       &ayuv_glsl_renderer,
-       NULL
-     };
-@@ -717,11 +725,12 @@ clutter_gst_build_renderers_list (ClutterGstSymbols *syms)
-   /* get the features */
-   gl_extensions = (const gchar*) glGetString (GL_EXTENSIONS);
- 
--  glGetIntegerv (GL_MAX_TEXTURE_UNITS, &nb_texture_units);
-+  glGetIntegerv (CGL_MAX_COMBINED_TEXTURE_IMAGE_UNITS, &nb_texture_units);
- 
-   if (nb_texture_units >= 3)
-     features |= CLUTTER_GST_MULTI_TEXTURE;
- 
-+#ifdef CLUTTER_COGL_HAS_GL
-   if (cogl_check_extension ("GL_ARB_fragment_program", gl_extensions))
-     {
-       /* the shaders we'll feed to the GPU are simple enough, we don't need
-@@ -741,6 +750,7 @@ clutter_gst_build_renderers_list (ClutterGstSymbols *syms)
-           features |= CLUTTER_GST_FP;
-         }
-     }
-+#endif
- 
-   if (cogl_features_available (COGL_FEATURE_SHADERS_GLSL))
-     features |= CLUTTER_GST_GLSL;
--- 
-1.6.3
-
diff --git a/recipes/clutter/moblin-proto/fix.patch b/recipes/clutter/moblin-proto/fix.patch
deleted file mode 100644
index 8bde677..0000000
--- a/recipes/clutter/moblin-proto/fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile	2008-08-11 22:49:48.000000000 +0100
-+++ git/Makefile	2008-08-12 12:16:52.000000000 +0100
-@@ -15,7 +15,7 @@
- 
- SCP_DESTINATION=pug.vpn:tmp
- 
--BINARY=$(shell basename `pwd`)#
-+BINARY=moblin-proto
- PACKAGE=../$(BINARY).tar.bz2 # you can use both .gz and .bz2 as extension here
- 
- #CFLAGS= -Wall -I /home/pippin/src/clutter-box2d/clutter-box2d
-@@ -61,7 +61,7 @@
- %.o: %.c $(HFILES)
- 	$(CC) -g $(CFLAGS) $(INCS) -c $< -o$@
- $(BINARY): $(OBJECTS)
--	$(CC) -o $@ $(OBJECTS) $(LIBS)
-+	$(CXX) -o $@ $(OBJECTS) $(LIBS)
- 
- #$(BINARY): $(CFILES)
- #	$(LD) $(CFLAGS) $(INCS) $(CFILES) $(LIBS) -o $@
diff --git a/recipes/clutter/moblin-proto/paths.patch b/recipes/clutter/moblin-proto/paths.patch
deleted file mode 100644
index d241c8f..0000000
--- a/recipes/clutter/moblin-proto/paths.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff --git a/moblin-desktop.h b/moblin-desktop.h
-index 880a9ad..3d51a14 100644
---- a/moblin-desktop.h
-+++ b/moblin-desktop.h
-@@ -29,8 +29,8 @@
- #define __MAIN_H__
- 
- 
--#define ASSET_ROOT "./assets/"
--#define JSON_ROOT "./layouts/"
-+#define ASSET_ROOT "/usr/share/moblin-proto/assets/"
-+#define JSON_ROOT "/usr/share/moblin-proto/layouts/"
- 
- typedef struct
- {
diff --git a/recipes/clutter/moblin-proto_git.bb b/recipes/clutter/moblin-proto_git.bb
deleted file mode 100644
index 299cc17..0000000
--- a/recipes/clutter/moblin-proto_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DEPENDS = "clutter-box2d"
-
-SRCREV = "8f2cb524fe06555182c25b4ba3202d7b368ac0ce"
-PV = "0.0+gitr${SRCREV}"
-PR = "r1"
-PE = "1"
-
-SRC_URI = "git://git.moblin.org/repos/users/pippin/prototype.git/;protocol=http \
-           file://paths.patch"
-
-S = "${WORKDIR}/git"
-
-do_install () {
-	install -d ${D}${bindir}
-	install ${S}/moblin-proto ${D}${bindir}
-
-	install -d ${D}${datadir}/moblin-proto/
-        cp -a ${S}/assets ${D}${datadir}/moblin-proto/
-        cp -a ${S}/layouts ${D}${datadir}/moblin-proto/
-}
diff --git a/recipes/clutter/table.inc b/recipes/clutter/table.inc
deleted file mode 100644
index 6ee1672..0000000
--- a/recipes/clutter/table.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Table Clutter Demo"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPL"
-
-DEPENDS = "clutter-gst gnome-vfs"
-
-inherit autotools pkgconfig
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/table ${D}${bindir}/table
-}
-
-#do_stage () {
-#        autotools_stage_all
-#}
-
diff --git a/recipes/clutter/table/fixes.patch b/recipes/clutter/table/fixes.patch
deleted file mode 100644
index a7cdc43..0000000
--- a/recipes/clutter/table/fixes.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: table/Makefile
-===================================================================
---- table.orig/Makefile	2007-07-10 13:24:18.000000000 +0100
-+++ table/Makefile	2007-07-10 13:28:10.000000000 +0100
-@@ -8,7 +8,7 @@ all: table
- 
- 
- table: table.o clutter-dominatrix.o clutter-video-player.o
--	$(CC) -g -Wall $(CFLAGS) -o $@ table.o clutter-dominatrix.o clutter-video-player.o $(LIBS)
-+	$(CC) -g -Wall $(CFLAGS) $(LDFLAGS) -o $@ table.o clutter-dominatrix.o clutter-video-player.o $(LIBS)
- 
- clean:
- 	rm -fr *.o table
-\ No newline at end of file
diff --git a/recipes/clutter/table_svn.bb b/recipes/clutter/table_svn.bb
deleted file mode 100644
index b4308d8..0000000
--- a/recipes/clutter/table_svn.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require table.inc
-
-SRCREV = "2191"
-PV = "0.3.0+svnr${SRCPV}"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk/toys;module=table;proto=http \
-           file://fixes.patch"
-
-S = "${WORKDIR}/table"
-
-
diff --git a/recipes/clutter/tidy.inc b/recipes/clutter/tidy.inc
deleted file mode 100644
index c69166f..0000000
--- a/recipes/clutter/tidy.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Tidy library"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPL"
-
-STDDEPENDS = "clutter"
-BASE_CONF = "--disable-gtk-doc"
-
-DEPENDS = "${STDDEPENDS}"
-EXTRA_OECONF = "${BASE_CONF}"
-
-inherit autotools pkgconfig
-
-PACKAGES =+ "tidy-examples"
-FILES_tidy-examples = "${bindir}/test-*"
-
-do_configure_prepend() {
-        touch ${S}/gtk-doc.make
-        sed -i s:docs/reference/Makefile::g ${S}/configure.ac
-        sed -i s:docs::g ${S}/Makefile.am
-}
-
diff --git a/recipes/clutter/tidy/autofoo.patch b/recipes/clutter/tidy/autofoo.patch
deleted file mode 100644
index 7f54a33..0000000
--- a/recipes/clutter/tidy/autofoo.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: tidy/doc/reference/Makefile.am
-===================================================================
---- tidy.orig/doc/reference/Makefile.am  2007-11-06 19:36:56.000000000 +0000
-+++ tidy/doc/reference/Makefile.am       2007-11-06 19:37:02.000000000 +0000
-@@ -77,4 +77,4 @@ include $(top_srcdir)/gtk-doc.make
- 
- # Other files to distribute
- # e.g. EXTRA_DIST += version.xml.in
--EXTRA_DIST += version.xml.in
-+EXTRA_DIST = version.xml.in
-
diff --git a/recipes/clutter/tidy/tidy-enable-tests.patch b/recipes/clutter/tidy/tidy-enable-tests.patch
deleted file mode 100644
index c5e1660..0000000
--- a/recipes/clutter/tidy/tidy-enable-tests.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: trunk/tests/Makefile.am
-===================================================================
---- trunk.orig/tests/Makefile.am	2008-03-04 12:22:10.000000000 +0000
-+++ trunk/tests/Makefile.am	2008-03-04 12:23:46.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	test-button \
- 	test-finger-scroll \
- 	test-list-view \
-@@ -14,6 +14,9 @@
- 	test-grow \
- 	test-viewport
- 
-+test_texture_framedir = $(pkgdatadir)
-+test_texture_frame_DATA = frame.png
-+
- INCLUDES = -I$(top_srcdir)
- LDADD = $(top_builddir)/tidy/libtidy-1.0.la
- 
diff --git a/recipes/clutter/tidy_svn.bb b/recipes/clutter/tidy_svn.bb
deleted file mode 100644
index f81c788..0000000
--- a/recipes/clutter/tidy_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require tidy.inc
-
-PV = "0.1.0+svnr${SRCPV}"
-PR = "6"
-
-SRC_URI = "svn://svn.o-hand.com/repos/tidy;module=trunk;proto=http \
-           file://tidy-enable-tests.patch"
-
-S = "${WORKDIR}/trunk"
-
-- 
1.5.3.4


