Return-Path: <Michael_Powell@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC5160053
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 17:46:16 +0000 (UTC)
Received: from svr-orw-mbx-04.mgc.mentorg.com ([147.34.90.204])
	by relay1.mentorg.com with esmtp 
	id 1cZhw9-0007Q2-El from Michael_Powell@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Feb 2017 09:46:17 -0800
Received: from ALM-MPOWELL-DT.localdomain (147.34.91.1) by
	SVR-ORW-MBX-04.mgc.mentorg.com (147.34.90.204) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Fri, 3 Feb 2017 09:46:14 -0800
From: Michael Powell <michael_powell@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Feb 2017 10:45:55 -0700
Message-ID: <1486143955-8226-1-git-send-email-michael_powell@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
	SVR-ORW-MBX-04.mgc.mentorg.com (147.34.90.204)
Subject: [meta-oe][morty][PATCH] fltk: fix undefined Fl_XFont_On_Demand
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
X-List-Received-Date: Fri, 03 Feb 2017 17:46:17 -0000
Content-Type: text/plain

http://www.fltk.org/str.php?L3156

Signed-off-by: Michael Powell <michael_powell@mentor.com>
---
 .../fltk/fix-undefined-Fl-XFont-On-Demand.patch    | 42 ++++++++++++++++++++++
 meta-oe/recipes-support/fltk/fltk_1.3.3.bb         |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/fltk/fltk/fix-undefined-Fl-XFont-On-Demand.patch

diff --git a/meta-oe/recipes-support/fltk/fltk/fix-undefined-Fl-XFont-On-Demand.patch b/meta-oe/recipes-support/fltk/fltk/fix-undefined-Fl-XFont-On-Demand.patch
new file mode 100644
index 0000000..7820324
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/fix-undefined-Fl-XFont-On-Demand.patch
@@ -0,0 +1,42 @@
+diff --git a/FL/x.H b/FL/x.H
+index 85c6f6c..96f198a 100644
+--- a/FL/x.H
++++ b/FL/x.H
+@@ -132,6 +132,7 @@ private:
+   XFontStruct *ptr;
+ };
+ extern FL_EXPORT Fl_XFont_On_Demand fl_xfont;
++extern FL_EXPORT XFontStruct* fl_X_core_font();
+ 
+ // this object contains all X-specific stuff about a window:
+ // Warning: this object is highly subject to change!  
+diff --git a/src/fl_font.cxx b/src/fl_font.cxx
+index 48a5bb5..3786ce7 100644
+--- a/src/fl_font.cxx
++++ b/src/fl_font.cxx
+@@ -55,6 +55,12 @@
+ #  include "fl_font_x.cxx"
+ #endif // WIN32
+ 
++#if ! (defined(WIN32) || defined(__APPLE__))
++XFontStruct *fl_X_core_font()
++{
++  return fl_xfont.value();
++}
++#endif
+ 
+ double fl_width(const char* c) {
+   if (c) return fl_width(c, (int) strlen(c));
+diff --git a/src/gl_draw.cxx b/src/gl_draw.cxx
+index 5f78902..8059254 100644
+--- a/src/gl_draw.cxx
++++ b/src/gl_draw.cxx
+@@ -84,7 +84,7 @@ void  gl_font(int fontid, int size) {
+  * then sorting through them at draw time (for normal X rendering) to find which one can
+  * render the current glyph... But for now, just use the first font in the list for GL...
+  */
+-    XFontStruct *font = fl_xfont;
++    XFontStruct *font = fl_X_core_font();
+     int base = font->min_char_or_byte2;
+     int count = font->max_char_or_byte2-base+1;
+     fl_fontsize->listbase = glGenLists(256);
diff --git a/meta-oe/recipes-support/fltk/fltk_1.3.3.bb b/meta-oe/recipes-support/fltk/fltk_1.3.3.bb
index 117ecc3..487d278 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.3.3.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.3.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://fltk.org/pub/fltk/${PV}/${BP}-source.tar.gz \
            file://disable_test.patch \
            file://fltk-no-freetype-config.patch \
            file://fix-boolean-issue-with-jpeg9.patch \
+           file://fix-undefined-Fl-XFont-On-Demand.patch \
 "
 
 SRC_URI[md5sum] = "9ccdb0d19dc104b87179bd9fd10822e3"
-- 
2.7.4


