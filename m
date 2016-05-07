Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE6C7017D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 04:37:27 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 145so11732079pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 21:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=FR+/KHEob4Uq7qSURCQfrdTEhuHKQNm0e2q/ztaKZs8=;
	b=YikbuqAMDrFTT7i9QeXcu5P1zYYSecOQOnYXaaQlns1XP3rIVuKYVvb/jcXRLU56q9
	IwjZmscabH9fWdJNZx/640LOmdiEIq5uIiL+yOemvMNeQolx3Ek4Bl7oPXqiIzNnL+3X
	/WWIjbXWVcHH27pkFKEWkt/A2Qae0lboLy7lFS3vA05yrZMbkjvaPQFU2OnpcVy8LheP
	tiZhx2Hx7wg65dE3+R4l21CXglbnmWmdzWM+Ta1L3I8JVa7oBjE7ymHfB/g8nfR2NJAl
	ZbSbsCnkg+Qmgh6ES1y+22JO4MFv2AnEFIzNDOQ7HVQpF9HPUgpCt2bj1BXepBsArMJf
	BsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FR+/KHEob4Uq7qSURCQfrdTEhuHKQNm0e2q/ztaKZs8=;
	b=QFtFBBd6M3pGDe2J4lUQfYBAGEMBBIG7SuY7/G7A46prisEecNoyWM0VUMx6MFzzXI
	6FflRv6pFSSMO6/UjCrulalUDaFrKz+eZHdsfPzAZwu8bopfF/fwRlvGWa6qepgKqQuF
	peNj37mZ87z+AF6095CMrGYv+O3MegpK1B0TJ8kaS6110khJKGWAljwQr4lr0R3zb42u
	WY1VFMwIAYRyBoehHG9FEjhlfaMW6kMcTKyE7lPmUgdzyecGkY7hXXpAKAA2XgkiAB9p
	RxhVOFI+HCdCOqyoqwSLbtNIW827Y/8Z/KykP89gjUMhZ8yOf9OSHuBLopeExnE4vqSz
	9C3Q==
X-Gm-Message-State: AOPr4FX6TZd58gWirkJzMyMUEd0MEHZqm8mr+TSxyjFM7O6G7jFeWJYtMGKxzhdMGdlmZA==
X-Received: by 10.98.24.88 with SMTP id 85mr34310559pfy.52.1462595848779;
	Fri, 06 May 2016 21:37:28 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 7sm24437056pfe.88.2016.05.06.21.37.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 May 2016 21:37:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 21:37:26 -0700
Message-Id: <1462595846-24863-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] graphviz: Add new package
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
X-List-Received-Date: Sat, 07 May 2016 04:37:29 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../graphviz/graphviz_no_mkdef_build.patch         |  90 +++++++++++++
 .../graphviz/graphviz/linear_angle.gv              | 101 ++++++++++++++
 .../recipes-graphics/graphviz/graphviz/simple.gv   |   1 +
 .../recipes-graphics/graphviz/graphviz_2.38.0.bb   | 149 +++++++++++++++++++++
 4 files changed, 341 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef_build.patch
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/simple.gv
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef_build.patch b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef_build.patch
new file mode 100644
index 0000000..6d4c964
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef_build.patch
@@ -0,0 +1,90 @@
+Index: graphviz-2.38.0/lib/gvpr/Makefile.in
+===================================================================
+--- graphviz-2.38.0.orig/lib/gvpr/Makefile.in
++++ graphviz-2.38.0/lib/gvpr/Makefile.in
+@@ -55,7 +55,6 @@ PRE_UNINSTALL = :
+ POST_UNINSTALL = :
+ build_triplet = @build@
+ host_triplet = @host@
+-noinst_PROGRAMS = mkdefs$(EXEEXT)
+ subdir = lib/gvpr
+ DIST_COMMON = $(noinst_HEADERS) $(pkginclude_HEADERS) \
+ 	$(srcdir)/Makefile.am $(srcdir)/Makefile.in \
+@@ -120,10 +119,6 @@ libgvpr_C_la_LIBADD =
+ am_libgvpr_C_la_OBJECTS = actions.lo compile.lo gvpr.lo gprstate.lo \
+ 	parse.lo queue.lo
+ libgvpr_C_la_OBJECTS = $(am_libgvpr_C_la_OBJECTS)
+-PROGRAMS = $(noinst_PROGRAMS)
+-am_mkdefs_OBJECTS = mkdefs.$(OBJEXT)
+-mkdefs_OBJECTS = $(am_mkdefs_OBJECTS)
+-mkdefs_LDADD = $(LDADD)
+ AM_V_P = $(am__v_P_@AM_V@)
+ am__v_P_ = $(am__v_P_@AM_DEFAULT_V@)
+ am__v_P_0 = false
+@@ -158,10 +153,8 @@ AM_V_CCLD = $(am__v_CCLD_@AM_V@)
+ am__v_CCLD_ = $(am__v_CCLD_@AM_DEFAULT_V@)
+ am__v_CCLD_0 = @echo "  CCLD    " $@;
+ am__v_CCLD_1 = 
+-SOURCES = $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES) \
+-	$(mkdefs_SOURCES)
+-DIST_SOURCES = $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES) \
+-	$(mkdefs_SOURCES)
++SOURCES = $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES)
++DIST_SOURCES = $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES)
+ am__can_run_installinfo = \
+   case $$AM_UPDATE_INFO_DIR in \
+     n|no|NO) false;; \
+@@ -568,8 +561,7 @@ libgvpr_la_LIBADD = $(libgvpr_C_la_LIBAD
+ 	$(MATH_LIBS)
+ 
+ libgvpr_la_DEPENDENCIES = $(libgvpr_C_la_DEPENDENCIES)
+-mkdefs_SOURCES = mkdefs.c
+-EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata mkdefs.c gdefs.h trie.c gvprlib.vcproj
++EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata gdefs.h trie.c gvprlib.vcproj
+ DISTCLEANFILES = $(pdf_DATA) gdefs.h mkdefs
+ all: all-am
+ 
+@@ -657,18 +649,6 @@ libgvpr.la: $(libgvpr_la_OBJECTS) $(libg
+ libgvpr_C.la: $(libgvpr_C_la_OBJECTS) $(libgvpr_C_la_DEPENDENCIES) $(EXTRA_libgvpr_C_la_DEPENDENCIES) 
+ 	$(AM_V_CCLD)$(LINK)  $(libgvpr_C_la_OBJECTS) $(libgvpr_C_la_LIBADD) $(LIBS)
+ 
+-clean-noinstPROGRAMS:
+-	@list='$(noinst_PROGRAMS)'; test -n "$$list" || exit 0; \
+-	echo " rm -f" $$list; \
+-	rm -f $$list || exit $$?; \
+-	test -n "$(EXEEXT)" || exit 0; \
+-	list=`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$//'`; \
+-	echo " rm -f" $$list; \
+-	rm -f $$list
+-mkdefs$(EXEEXT): $(mkdefs_OBJECTS) $(mkdefs_DEPENDENCIES) $(EXTRA_mkdefs_DEPENDENCIES) 
+-	@rm -f mkdefs$(EXEEXT)
+-	$(AM_V_CCLD)$(LINK) $(mkdefs_OBJECTS) $(mkdefs_LDADD) $(LIBS)
+-
+ mostlyclean-compile:
+ 	-rm -f *.$(OBJEXT)
+ 
+Index: graphviz-2.38.0/lib/gvpr/Makefile.am
+===================================================================
+--- graphviz-2.38.0.orig/lib/gvpr/Makefile.am
++++ graphviz-2.38.0/lib/gvpr/Makefile.am
+@@ -21,7 +21,6 @@ AM_CPPFLAGS = \
+ 	-DDFLT_GVPRPATH="\".$(PATH_SEPARATOR)$(pkgdatadir)/gvpr\""
+ 
+ pkginclude_HEADERS = gvpr.h
+-noinst_PROGRAMS = mkdefs
+ noinst_HEADERS = actions.h compile.h gprstate.h parse.h queue.h trieFA.h trie.c
+ noinst_LTLIBRARIES = libgvpr_C.la
+ lib_LTLIBRARIES = libgvpr.la
+@@ -50,11 +49,10 @@ libgvpr_la_LIBADD = $(libgvpr_C_la_LIBAD
+ 	$(MATH_LIBS)
+ libgvpr_la_DEPENDENCIES = $(libgvpr_C_la_DEPENDENCIES)
+ 
+-mkdefs_SOURCES = mkdefs.c
+ 
+ gdefs.h: $(top_srcdir)/lib/gvpr/gprdata mkdefs
+ 	./mkdefs gdefs.h < $(top_srcdir)/lib/gvpr/gprdata
+ 
+-EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata mkdefs.c gdefs.h trie.c gvprlib.vcproj
++EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata gdefs.h trie.c gvprlib.vcproj
+ 
+ DISTCLEANFILES = $(pdf_DATA) gdefs.h mkdefs
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv b/meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv
new file mode 100644
index 0000000..827bde5
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv
@@ -0,0 +1,101 @@
+digraph G { bgcolor="purple:pink" style="filled"
+  subgraph cluster1 {fillcolor="blue:green" style="filled"
+		node [shape=circle fillcolor="gold:brown" style="radial" gradientangle=180]
+		a0 [label=<
+ <TABLE border="10" cellspacing="10" cellpadding="10" style="rounded" bgcolor="yellow:violet" gradientangle="315">
+<TR><TD border="3"  bgcolor="yellow" gradientangle="315">00</TD>
+<TD border="3"  bgcolor="yellow:green" gradientangle="315">01</TD>
+<TD border="3"  bgcolor="green" gradientangle="315">02</TD>
+<TD border="3"  bgcolor="green:blue" gradientangle="315">03</TD>
+<TD border="3"  bgcolor="blue" gradientangle="315">04</TD>
+<TD border="3"  bgcolor="blue:purple" gradientangle="315">05</TD>
+<TD border="3"  bgcolor="purple" gradientangle="315">06</TD>
+<TD border="3"  bgcolor="purple:violet" gradientangle="315">07</TD>
+<TD border="3"  bgcolor="violet" gradientangle="315">08</TD></TR>
+  
+<TR><TD border="3"  bgcolor="yellow:gold"  gradientangle="315">10</TD>
+<TD border="3"  bgcolor="yellow:green"  gradientangle="315">11</TD>
+<TD border="3"  bgcolor="yellow:green"  gradientangle="315">12</TD>
+<TD border="3"  bgcolor="yellow:blue"  gradientangle="315">13</TD>
+<TD border="3"  bgcolor="yellow:blue"  gradientangle="315">14</TD>
+<TD border="3"  bgcolor="yellow:purple"  gradientangle="315">15</TD>
+<TD border="3"  bgcolor="yellow:purple"  gradientangle="315">16</TD>
+<TD border="3"  bgcolor="yellow:violet"  gradientangle="315">17</TD>
+<TD border="3"  bgcolor="yellow:violet"  gradientangle="315">18</TD></TR>
+  
+<TR><TD border="3"  bgcolor="gold"  gradientangle="315">20</TD>
+<TD border="3"  bgcolor="gold:green"  gradientangle="315">21</TD>
+<TD border="3"  bgcolor="gold:green"  gradientangle="315">22</TD>
+<TD border="3"  bgcolor="gold:blue"  gradientangle="315">23</TD>
+<TD border="3"  bgcolor="gold:blue"  gradientangle="315">24</TD>
+<TD border="3"  bgcolor="gold:purple"  gradientangle="315">25</TD>
+<TD border="3"  bgcolor="gold:purple"  gradientangle="315">26</TD>
+<TD border="3"  bgcolor="gold:violet"  gradientangle="315">27</TD>
+<TD border="3"  bgcolor="gold:violet"  gradientangle="315">28</TD></TR>
+  
+<TR><TD border="3"  bgcolor="gold:orange"  gradientangle="315">30</TD>
+<TD border="3"  bgcolor="orange:green"  gradientangle="315">31</TD>
+<TD border="3"  bgcolor="orange:green"  gradientangle="315">32</TD>
+<TD border="3"  bgcolor="orange:blue"  gradientangle="315">33</TD>
+<TD border="3"  bgcolor="orange:blue"  gradientangle="315">34</TD>
+<TD border="3"  bgcolor="orange:purple"  gradientangle="315">35</TD>
+<TD border="3"  bgcolor="orange:purple"  gradientangle="315">36</TD>
+<TD border="3"  bgcolor="orange:violet"  gradientangle="315">37</TD>
+<TD border="3"  bgcolor="orange:violet"  gradientangle="315">38</TD></TR>
+  
+<TR><TD border="3"  bgcolor="orange"  gradientangle="315">40</TD>
+<TD border="3"  bgcolor="orange:green"  gradientangle="315">41</TD>
+<TD border="3"  bgcolor="orange:green"  gradientangle="315">42</TD>
+<TD border="3"  bgcolor="orange:blue"  gradientangle="315">43</TD>
+<TD border="3"  bgcolor="orange:blue"  gradientangle="315">44</TD>
+<TD border="3"  bgcolor="orange:purple"  gradientangle="315">45</TD>
+<TD border="3"  bgcolor="orange:purple"  gradientangle="315">46</TD>
+<TD border="3"  bgcolor="orange:violet"  gradientangle="315">47</TD>
+<TD border="3"  bgcolor="orange:violet"  gradientangle="315">48</TD></TR>
+  
+<TR><TD border="3"  bgcolor="orange:red"  gradientangle="315">50</TD>
+<TD border="3"  bgcolor="red:green"  gradientangle="315">51</TD>
+<TD border="3"  bgcolor="red:green"  gradientangle="315">52</TD>
+<TD border="3"  bgcolor="red:blue"  gradientangle="315">53</TD>
+<TD border="3"  bgcolor="red:blue"  gradientangle="315">54</TD>
+<TD border="3"  bgcolor="red:purple"  gradientangle="315">55</TD>
+<TD border="3"  bgcolor="red:purple"  gradientangle="315">56</TD>
+<TD border="3"  bgcolor="red:violet"  gradientangle="315">57</TD>
+<TD border="3"  bgcolor="red:violet"  gradientangle="315">58</TD></TR>
+  
+<TR><TD border="3"  bgcolor="red"  gradientangle="315">60</TD>
+<TD border="3"  bgcolor="red:green"  gradientangle="315">61</TD>
+<TD border="3"  bgcolor="red:green"  gradientangle="315">62</TD>
+<TD border="3"  bgcolor="red:blue"  gradientangle="315">63</TD>
+<TD border="3"  bgcolor="red:blue"  gradientangle="315">64</TD>
+<TD border="3"  bgcolor="red:purple"  gradientangle="315">65</TD>
+<TD border="3"  bgcolor="red:purple"  gradientangle="315">66</TD>
+<TD border="3"  bgcolor="red:violet"  gradientangle="315">67</TD>
+<TD border="3"  bgcolor="red:violet"  gradientangle="315">68</TD></TR>
+  
+<TR><TD border="3"  bgcolor="red:brown"  gradientangle="315">70</TD>
+<TD border="3"  bgcolor="brown:green"  gradientangle="315">71</TD>
+<TD border="3"  bgcolor="brown:green"  gradientangle="315">72</TD>
+<TD border="3"  bgcolor="brown:blue"  gradientangle="315">73</TD>
+<TD border="3"  bgcolor="brown:blue"  gradientangle="315">74</TD>
+<TD border="3"  bgcolor="brown:purple"  gradientangle="315">75</TD>
+<TD border="3"  bgcolor="brown:purple"  gradientangle="315">76</TD>
+<TD border="3"  bgcolor="brown:violet"  gradientangle="315">77</TD>
+<TD border="3"  bgcolor="brown:violet"  gradientangle="315">78</TD></TR>
+  
+<TR><TD border="3"  bgcolor="brown"  gradientangle="315">80</TD>
+<TD border="3"  bgcolor="brown:green"  gradientangle="315">81</TD>
+<TD border="3"  bgcolor="brown:green"  gradientangle="315">82</TD>
+<TD border="3"  bgcolor="brown:blue"  gradientangle="315">83</TD>
+<TD border="3"  bgcolor="brown:blue"  gradientangle="315">84</TD>
+<TD border="3"  bgcolor="brown:purple"  gradientangle="315">85</TD>
+<TD border="3"  bgcolor="brown:purple"  gradientangle="315">86</TD>
+<TD border="3"  bgcolor="brown:violet"  gradientangle="315">87</TD>
+<TD border="3"  bgcolor="brown:violet"  gradientangle="315">88</TD></TR>
+  
+</TABLE>>];
+
+}
+
+} 
+
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/simple.gv b/meta-oe/recipes-graphics/graphviz/graphviz/simple.gv
new file mode 100644
index 0000000..1b140f9
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/simple.gv
@@ -0,0 +1 @@
+    graph { a -- b; b -- c; a -- c; d -- c; e -- c; e -- a; } 
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb
new file mode 100644
index 0000000..1ace8c8
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb
@@ -0,0 +1,149 @@
+SUMMARY = "Graphviz - Graph Visualization Software."
+DESCRIPTION = "Graphviz is open source graph visualization software. Graph visualization is a way of representing structural information as diagrams of abstract graphs and networks. It has important applications in networking, bioinformatics,  software engineering, database and web design, machine learning, and in visual interfaces for other technical domains."
+HOMEPAGE = "http://www.graphviz.org/"
+SECTION = "graphics"
+LICENSE = "EPL-1.0"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=1;endline=2;md5=737cf7b11c0759e6d3b0d6cb08b7c4f8"
+
+DEPENDS += "graphviz-native bison flex libtool zlib chrpath-replacement-native"
+DEPENDS_class-native = ""
+
+SRC_URI_BASE = "${DEBIAN_MIRROR}/main/g/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
+           ${DEBIAN_MIRROR}/main/g/${BPN}/${BPN}_${PV}-7.debian.tar.xz;name=patch \
+"
+
+SRC_URI = "${SRC_URI_BASE} \
+        file://graphviz_no_mkdef_build.patch \
+        file://simple.gv \
+        file://linear_angle.gv \
+        "
+
+SRC_URI_class-native = "${SRC_URI_BASE}"
+
+SRC_URI[archive.md5sum] = "5b6a829b2ac94efcd5fa3c223ed6d3ae"
+SRC_URI[archive.sha256sum] = "81aa238d9d4a010afa73a9d2a704fc3221c731e1e06577c2ab3496bdef67859e"
+SRC_URI[patch.md5sum] = "5cbcff92169d682471cdfdf58d215098"
+SRC_URI[patch.sha256sum] = "312ab8215fbe1800664675cfc284aecfeff3ce699407523b5bdefee64cf1a53c"
+
+inherit autotools-brokensep pkgconfig
+
+LDFLAGS += "-Wunused-but-set-variable -Wmaybe-uninitialized -Wunused-variable"
+
+PACKAGECONFIG ?= "ghost rsvg cairo swig tcl gtk lua sfdp png libgd \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'X11', '', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'glut', '', d)}"
+
+PACKAGECONFIG_class-native ??= ""
+
+PACKAGECONFIG[sfdp] = "--enable-sfdp=yes, --disable-sfdp, ,"
+PACKAGECONFIG[swig] = "--enable-swig=yes, --disable-swig, swig,"
+PACKAGECONFIG[lua] = "--enable-lua=yes, --disable-lua, lua,"
+PACKAGECONFIG[cairo] = "--with-pangocairo=yes, --with-pangocairo=no, cairo,"
+PACKAGECONFIG[tcl] = "--enable-tcl=yes --with-tclsh=tclsh, --disable-tcl, tcl, tcl"
+PACKAGECONFIG[glut] = "--with-glut=yes, --without-glut, mesa-glut,"
+PACKAGECONFIG[gtk] = "--with-gtk=yes, --without-gtk, gtk+,"
+PACKAGECONFIG[expect] = "--with-expect=yes, --without-expect, expect,"
+PACKAGECONFIG[ghost] = "--with-ghostscript=yes, --without-ghostscript, ghostscript,"
+PACKAGECONFIG[fontconfig] = "--with-fontconfig=yes, --without-fontconfig, fontconfig,"
+PACKAGECONFIG[freetype] = "--with-freetype2=yes, --with-freetype2=no, freetype,"
+PACKAGECONFIG[poppler] = "--with-poppler=yes, --with-poppler=no, poppler,"
+PACKAGECONFIG[guile] = "--enable-guile, --disable-guile, guile,"
+PACKAGECONFIG[php] = "--enable-php, --disable-php , php,"
+PACKAGECONFIG[perl] = "--enable-perl, --disable-perl, perl,"
+PACKAGECONFIG[python] = "--enable-python, --disable-python, python ,"
+PACKAGECONFIG[ruby] = "--enable-ruby, --disable-ruby, ruby, "
+PACKAGECONFIG[qt] = "--with-qt=yes, --with-qt=no, qte,"
+PACKAGECONFIG[glade] = "--with-glade=yes, --with-glade=no, glade3,"
+PACKAGECONFIG[libgd] = "--with-libgd=yes, --with-libgd=no, libglade,"
+PACKAGECONFIG[png] = "--with-libpng=yes, --with-libpng=no, libpng, libpng"
+PACKAGECONFIG[rsvg] = "--with-rsvg=yes, --with-rsvg=no, librsvg, librsvg"
+PACKAGECONFIG[pixbuf] = "--with-gdk=yes --with-gdk-pixbuf=yes, --with-gdk=no --with-gdk-pixbuf=no, gdk-pixbuf,"
+PACKAGECONFIG[X11] = "--with-x, --without-x, libx11 virtual/libx11 , libxaw7"
+
+CONFIGUREOPTS = " --build=${BUILD_SYS} \
+    --host=${HOST_SYS} \
+    --prefix=${prefix} \
+    --exec_prefix=${exec_prefix} \
+    --bindir=${bindir} \
+    --sbindir=${sbindir} \
+    --libexecdir=${libexecdir} \
+    --datadir=${datadir} \
+    --sysconfdir=${sysconfdir} \
+    --sharedstatedir=${sharedstatedir} \
+    --localstatedir=${localstatedir} \
+    --libdir=${libdir} \
+    --includedir=${includedir} \
+    --oldincludedir=${oldincludedir} \
+    --infodir=${infodir} \
+    --mandir=${mandir} \
+"
+
+EXTRA_OECONF += "--enable-ltdl"
+
+EXTRA_OECONF_class-native = " \
+    --enable-sharp=no \
+    --enable-java=no \
+    --enable-ocaml=no \
+    --enable-r=no \
+    --with-devil=no \
+    --with-lasi=no \
+    --with-gtkgl=no \
+    --with-gtkglext=no \
+    --with-gts=no \
+    --with-ann=no \
+    --with-ortho=no \
+    --with-digcola=no \
+    --with-smyrna=no \
+    --with-ipsepcola=no \
+     "
+EXTRANATIVEPATH += "chrpath-native"
+
+debian_do_patch() {
+    cd ${S}
+    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; done < ${WORKDIR}/debian/patches/series
+}
+
+python do_patch() {
+    bb.build.exec_func('debian_do_patch', d)
+    bb.build.exec_func('patch_do_patch', d)
+}
+
+do_configure_prepend () {
+    # copy mkdefs from the native graphviz build
+    if [ "${PN}" != "graphviz-native" ]; then
+        cp ${STAGING_BINDIR_NATIVE}/graphviz-${PV}/mkdefs ${S}/lib/gvpr/.
+    fi
+    ./autogen.sh
+}
+
+do_compile_class-native () {
+    cd lib/gvpr
+    oe_runmake mkdefs
+}
+
+do_install_append () {
+    if [ "${PN}" != "graphviz-native" ]; then
+        install  -d ${D}${datadir}/graphviz
+        install  ${WORKDIR}/*.gv ${D}${datadir}/graphviz/
+    fi
+}
+
+do_install_class-native () {
+    install -d ${D}${bindir}/graphviz-${PV}
+    install -m 755 ${S}/lib/gvpr/mkdefs ${D}${bindir}/graphviz-${PV}/
+}
+
+pkg_postinst_${PN} () {
+if test "x$D" != "x"; then
+    exit 1
+else
+    ${bindr}/dot -c
+fi
+}
+
+INSANE_SKIP_${PN} += "dev-so"
+
+RDEPENDS_${PN} = "libxml2 libcroco"
+RDEPENDS_class-native = ""
+
+BBCLASSEXTEND = "native"
-- 
2.3.5


