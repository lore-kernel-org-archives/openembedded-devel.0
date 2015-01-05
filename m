Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6E02165CF4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 17:40:09 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	t05He9Sd017701 for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jan 2015 11:40:09 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015010511400995-1634051 ;
	Mon, 5 Jan 2015 11:40:09 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 5 Jan 2015 11:39:45 -0600
Message-Id: <1420479585-32765-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.2.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/05/2015 11:40:09 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/05/2015 11:40:09 AM,
	Serialize complete at 01/05/2015 11:40:09 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2015-01-05_03:2015-01-05, 2015-01-05,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH v3] iperf3: Add recipe for version 3.0.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 17:40:17 -0000

iperf3 is the new successor of iperf. The project is now mature enough
as it started in 2009 and has stable releases. It supports reporting
results in the portable JSON format, provides more information than
iperf does and also adds some features from other tools such as nuttcp
and netperf that were missing from the original iperf.

This recipe is based on the iperf v3.0.8 recipe posted to the list by
Guy Morand

(http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098403.html)

with the following changes:

- Pass the 'foreign' option to automake.

- The Makefiles for the examples only work properly when the build is
  done in the same directory as the source.  Fix this in Makefile.am and
  run bootstrap.sh to regenerate Makefile.in.

- Bump the version to the latest stable release.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---

Changes since previous version of patch:

- Removed review comment in commit message
- Added Signed-off-by and Upstream-Status in patches themselves
- Moved patches to iperf3/ directory
- Removed BRANCH unused environment variable
- Fixed indentation
- Moved recipe to iperf3_git.bb and set PV as appropriate.

 .../iperf3/iperf3/automake-foreign.patch           |  19 ++++
 .../iperf3/iperf3/fix-examples.patch               | 107 +++++++++++++++++++++
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb     |  25 +++++
 3 files changed, 151 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/fix-examples.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
new file mode 100644
index 0000000..a27b61e
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
@@ -0,0 +1,19 @@
+Pass the 'foreign' option to automake to enable iperf3 to build.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Ben Shelton <ben.shelton@ni.com>
+---
+
+diff -rupN iperf-3.0.10.old/configure.ac iperf-3.0.10/configure.ac
+--- iperf-3.0.10.old/configure.ac	2014-12-16 13:39:58.000000000 -0600
++++ iperf-3.0.10/configure.ac	2014-12-29 15:09:27.534992643 -0600
+@@ -32,7 +32,7 @@ AC_CONFIG_AUX_DIR(config)
+ 
+ 
+ # Initialize the automake system
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AM_MAINTAINER_MODE
+ AM_CONFIG_HEADER(src/config.h)
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/fix-examples.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/fix-examples.patch
new file mode 100644
index 0000000..445570d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/fix-examples.patch
@@ -0,0 +1,107 @@
+The Makefiles for the examples only work properly when the build is
+done in the same directory as the source.  Fix this in Makefile.am and
+run bootstrap.sh to regenerate Makefile.in.
+
+Upstream-Status: Pending [iperf-dev@googlegroups.com]
+
+Signed-off-by: Ben Shelton <ben.shelton@ni.com>
+---
+
+diff -rupN iperf-3.0.10.old/examples/Makefile.am iperf-3.0.10/examples/Makefile.am
+--- iperf-3.0.10.old/examples/Makefile.am	2014-12-16 13:39:58.000000000 -0600
++++ iperf-3.0.10/examples/Makefile.am	2014-12-29 17:12:02.238979626 -0600
+@@ -2,11 +2,13 @@ noinst_PROGRAMS		= mic mis		# Build, but
+ 
+ mic_SOURCES		= mic.c
+ mic_CFLAGS		= -g
+-mic_LDADD		= ../src/libiperf.la
++mic_LDADD		= $(top_builddir)/src/libiperf.la
+ mic_LDFLAGS		= -g
++mic_CPPFLAGS		= -I$(top_srcdir)/src
+ 
+ mis_SOURCES		= mis.c
+ mis_CFLAGS		= -g
+-mis_LDADD		= ../src/libiperf.la
++mis_LDADD		= $(top_builddir)/src/libiperf.la
+ mis_LDFLAGS		= -g
++mis_CPPFLAGS		= -I$(top_srcdir)/src
+ 
+diff -rupN iperf-3.0.10.old/examples/Makefile.in iperf-3.0.10/examples/Makefile.in
+--- iperf-3.0.10.old/examples/Makefile.in	2014-12-16 13:39:58.000000000 -0600
++++ iperf-3.0.10/examples/Makefile.in	2014-12-29 17:12:07.518979616 -0600
+@@ -94,7 +94,7 @@ CONFIG_CLEAN_VPATH_FILES =
+ PROGRAMS = $(noinst_PROGRAMS)
+ am_mic_OBJECTS = mic-mic.$(OBJEXT)
+ mic_OBJECTS = $(am_mic_OBJECTS)
+-mic_DEPENDENCIES = ../src/libiperf.la
++mic_DEPENDENCIES = $(top_builddir)/src/libiperf.la
+ AM_V_lt = $(am__v_lt_@AM_V@)
+ am__v_lt_ = $(am__v_lt_@AM_DEFAULT_V@)
+ am__v_lt_0 = --silent
+@@ -104,7 +104,7 @@ mic_LINK = $(LIBTOOL) $(AM_V_lt) --tag=C
+ 	$(mic_LDFLAGS) $(LDFLAGS) -o $@
+ am_mis_OBJECTS = mis-mis.$(OBJEXT)
+ mis_OBJECTS = $(am_mis_OBJECTS)
+-mis_DEPENDENCIES = ../src/libiperf.la
++mis_DEPENDENCIES = $(top_builddir)/src/libiperf.la
+ mis_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
+ 	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(mis_CFLAGS) $(CFLAGS) \
+ 	$(mis_LDFLAGS) $(LDFLAGS) -o $@
+@@ -286,12 +286,14 @@ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+ mic_SOURCES = mic.c
+ mic_CFLAGS = -g
+-mic_LDADD = ../src/libiperf.la
++mic_LDADD = $(top_builddir)/src/libiperf.la
+ mic_LDFLAGS = -g
++mic_CPPFLAGS = -I$(top_srcdir)/src
+ mis_SOURCES = mis.c
+ mis_CFLAGS = -g
+-mis_LDADD = ../src/libiperf.la
++mis_LDADD = $(top_builddir)/src/libiperf.la
+ mis_LDFLAGS = -g
++mis_CPPFLAGS = -I$(top_srcdir)/src
+ all: all-am
+ 
+ .SUFFIXES:
+@@ -375,32 +377,32 @@ distclean-compile:
+ @am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(LTCOMPILE) -c -o $@ $<
+ 
+ mic-mic.o: mic.c
+-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.o -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.o -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
+ @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mic-mic.Tpo $(DEPDIR)/mic-mic.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mic.c' object='mic-mic.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
+ 
+ mic-mic.obj: mic.c
+-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.obj -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.obj -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
+ @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mic-mic.Tpo $(DEPDIR)/mic-mic.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mic.c' object='mic-mic.obj' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
+ 
+ mis-mis.o: mis.c
+-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.o -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.o -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
+ @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mis-mis.Tpo $(DEPDIR)/mis-mis.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mis.c' object='mis-mis.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
+ 
+ mis-mis.obj: mis.c
+-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.obj -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.obj -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
+ @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mis-mis.Tpo $(DEPDIR)/mis-mis.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mis.c' object='mis-mis.obj' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
+ 
+ mostlyclean-libtool:
+ 	-rm -f *.lo
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
new file mode 100644
index 0000000..d34eb69
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Network benchmark tool"
+DESCRIPTION = "\
+iperf is a tool for active measurements of the maximum achievable bandwidth \
+on IP networks. It supports tuning of various parameters related to timing, \
+protocols, and buffers. For each test it reports the bandwidth, loss, and \
+other parameters."
+HOMEPAGE = "http://software.es.net/iperf/"
+SECTION = "console/network"
+BUGTRACKER = "https://github.com/esnet/iperf/issues"
+AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ab59a0c3a4bc3954d1ece68ea19d77a4"
+
+SRC_URI = "\
+    git://github.com/esnet/iperf.git;branch=3.0-STABLE \
+    file://automake-foreign.patch \
+    file://fix-examples.patch \
+"
+
+PV = "3.0.10+gitr${SRCPV}"
+SRCREV = "de420cc741dd8967ebc57f80b7712556442de81b"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
2.2.1


