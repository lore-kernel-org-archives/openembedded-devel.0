Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 100A160557
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 19:09:15 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so84533729igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 12:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sysTvjFFD9pWEQG+X7eciSpT9U7RhOwLP0pO9pzdjSY=;
	b=eiLPCj+wPTWJ8BslN0zyh+7GkvJ1jXdpC9Zz4XIA3iafE5ghZgYSsSmZ0k/ORwl22M
	vbzFe4/36NqkH6jL3rgdPvcRxDpnt0U7y1KqlSNA86ZmLRHOdQtA57fW9UDgCRQVZi0s
	GmIeiWgL15Et+PP5VBxzfK7KHg8aaZ37n+n1q4Fm/sC5dzxhotJ7n9PPn/LEgRB1SMh9
	8wDPT+E5QF75su1FNAWnnNWln9cH/Xdq9Pno6p22jVAl7L0RAwAFvlT7m9olndRTugD+
	0aokeXL1ONCm76op0zv4RLj77Sqd15ICw/ABOORs2I5mSDNVycUMVjhD+bmc5jLJxUaf
	OisA==
X-Received: by 10.50.43.137 with SMTP id w9mr3743183igl.30.1430852956678;
	Tue, 05 May 2015 12:09:16 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id vk8sm135395igb.4.2015.05.05.12.09.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 12:09:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 12:09:05 -0700
Message-Id: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-gnome][PATCH 1/7] libgnomeprint: Fix build with newer bison >= 3
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
X-List-Received-Date: Tue, 05 May 2015 19:09:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome/libgnomeprint/bison3-support.patch       | 30 ++++++++++++++++++++++
 .../recipes-gnome/gnome/libgnomeprint_2.18.8.bb    |  5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomeprint/bison3-support.patch

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint/bison3-support.patch b/meta-gnome/recipes-gnome/gnome/libgnomeprint/bison3-support.patch
new file mode 100644
index 0000000..29d410a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint/bison3-support.patch
@@ -0,0 +1,30 @@
+Index: libgnomeprint-2.18.8/libgnomeprint/grammar.y
+===================================================================
+--- libgnomeprint-2.18.8.orig/libgnomeprint/grammar.y
++++ libgnomeprint-2.18.8/libgnomeprint/grammar.y
+@@ -99,7 +99,7 @@ gnome_print_filter_parse_prop (GnomePrin
+ }
+ 
+ static int yylex (void *lvalp);
+-static int yyerror (const char *s);
++static int yyerror (graph_t *g, const char *s);
+ %}
+ 
+ %union {
+@@ -117,6 +117,7 @@ static int yyerror (const char *s);
+ %type <p> pool
+ 
+ %pure_parser
++%parse-param { graph_t *graph }
+ 
+ %start graph
+ %%
+@@ -185,7 +186,7 @@ graph: filter {
+ %%
+ 
+ static int
+-yyerror (const char *s)
++yyerror (graph_t *g, const char *s)
+ {
+ 	return -1;
+ }
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
index 15e513a..b17062b 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
@@ -1,15 +1,16 @@
 LICENSE = "GPLv2"
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common freetype"
+DEPENDS = "bison-native flex-native libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common freetype"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit pkgconfig gnomebase
+inherit gnomebase
 
 SRC_URI += "file://fix.includes.patch \
             file://freetype.patch \
             file://0001-configure-use-pkgconfig-for-freetype.patch \
+            file://bison3-support.patch \
            "
 SRC_URI[archive.md5sum] = "63b05ffb5386e131487c6af30f4c56ac"
 SRC_URI[archive.sha256sum] = "1034ec8651051f84d2424e7a1da61c530422cc20ce5b2d9e107e1e46778d9691"
-- 
2.1.4


