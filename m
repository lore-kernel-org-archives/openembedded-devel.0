Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id AD7CF79702
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:26 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id j8-v6so5617644pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a+RenTXwAx8Nwv2h4o1Yqopeejp2mZyOQphKkAgQrgk=;
	b=S4T5YiL/c6WswHQlmxOyLznj4mQJoVihuDKA39uBbJzMGgINyV9dHtHfW0tZyd4TdQ
	TAtWZsmaslja65/0wG5kTMldDdDPB/jgm6RopwxAFBmpt+7p2Jnjw++kLhN1SvrMfLQw
	Pzf/arJV41tbOggQapvKO8H0MYkczeq7/AH/Ivof8D3NaSNGLDfmlX5TPKChs3iZqi4H
	37dIS27BLF9jr8RXAtIF+IVHuEFfB2zVs1GZiovjKWQwIC++5c8cs0GwgQzicUlzyIYc
	BIxGoPHaVD2rEmac4KPOKnL/JAY/u2tw8hubN48LDgT6grE1EbtIs7SnGSJa1s8fUZQl
	+3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a+RenTXwAx8Nwv2h4o1Yqopeejp2mZyOQphKkAgQrgk=;
	b=l13+uvjv8birojMNYtAwTPlAP/Q3n4wy/zD7r8O0WjCvrY5uM7g5c45m/dsDPHl5an
	kvr0qKg3/Mc8+ygHIuHXW00W22PbexBwp/Y1vsXcfVrrgbKM/J+ulp2lVi8GDyI7RTG7
	lY11vC1Kz1VkoS0DiZlOI0Ofv5bTcPjnHxXulJVtjuPb5KE8ca3cEyij8BAfkb+cmRYB
	yIxnvj64+qjsVjVBIhIi3cLaYawsL2S/NrJmPSObutGHAsEDBK1WWTdD9Huipfqe56+e
	1J1XGtJw4EidQnlBrR3CVrwqzcOsG6q5hYScez1P9k6OKaMRGG0ji0jU5Os9LUevA2Nf
	AGhA==
X-Gm-Message-State: APzg51AKWMe9DD7Yo9dX/0M/CEClMzhsswTf7u3J9cKS4muYAXWqZbIs
	lT91G7gHPlAWuGzlQckwJfMYuBvZ
X-Google-Smtp-Source: ANB0VdZZAMjF2Tyr2rpxj3lu5fU3bdH6LirLfYDkqt+I0VGm3TQqF70yl1tB9bjDklorSApgMhYZkw==
X-Received: by 2002:a65:6499:: with SMTP id
	e25-v6mr3778576pgv.224.1536254547150; 
	Thu, 06 Sep 2018 10:22:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:00 -0700
Message-Id: <20180906172210.42551-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 07/17] libyui, libyui-ncurse: Update to latest on git
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Add fixes for building with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-override-consistently.patch      | 147 ++++++++++++++++++
 ...use-_nl_msg_cat_cntr-only-with-glibc.patch |  40 -----
 ...e-in-NCPad-and-fix-param-type-of-Set.patch |  49 ++++++
 .../libyui/libyui-ncurses_git.bb              |   9 +-
 .../libyui/0001-Fix-GCC-8-warning.patch       |  48 ------
 ...1-Use-curly-braces-for-MAKE-variable.patch |  32 ++++
 meta-oe/recipes-graphics/libyui/libyui_git.bb |  12 +-
 7 files changed, 239 insertions(+), 98 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Use-override-consistently.patch
 delete mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-use-_nl_msg_cat_cntr-only-with-glibc.patch
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch
 delete mode 100644 meta-oe/recipes-graphics/libyui/libyui/0001-Fix-GCC-8-warning.patch
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui/0001-Use-curly-braces-for-MAKE-variable.patch

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Use-override-consistently.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Use-override-consistently.patch
new file mode 100644
index 0000000000..6d4bdc2ab6
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Use-override-consistently.patch
@@ -0,0 +1,147 @@
+From 0acfb67f99fd8d6af323311fee8c08116295b148 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Sep 2018 18:21:19 -0700
+Subject: [PATCH 1/2] Use override consistently
+
+Make clang++ happy
+error: 'setApplicationTitle' overrides a member function but is not marked 'override' [-Werror,-Winconsistent-missing-over ride]
+
+Upstream-Status: Submitted [https://github.com/libyui/libyui-ncurses/pull/69]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/NCApplication.h | 46 ++++++++++++++++++++++-----------------------
+ 1 file changed, 23 insertions(+), 23 deletions(-)
+
+diff --git a/src/NCApplication.h b/src/NCApplication.h
+index e24c3eb..09e4708 100644
+--- a/src/NCApplication.h
++++ b/src/NCApplication.h
+@@ -60,7 +60,7 @@ public:
+      * Reimplemented from YApplication.
+      **/
+     virtual void setLanguage( const std::string & language,
+-			      const std::string & encoding = std::string() );
++			      const std::string & encoding = std::string() ) override;
+ 
+     /**
+      * Open a directory selection box and prompt the user for an existing
+@@ -77,7 +77,7 @@ public:
+      * Implemented from YApplication.
+      **/
+     virtual std::string askForExistingDirectory( const std::string & startDir,
+-					    const std::string & headline );
++					    const std::string & headline ) override;
+ 
+     /**
+      * Open a file selection box and prompt the user for an existing file.
+@@ -97,7 +97,7 @@ public:
+      **/
+     virtual std::string askForExistingFile( const std::string & startWith,
+ 				       const std::string & filter,
+-				       const std::string & headline );
++				       const std::string & headline ) override;
+ 
+     /**
+      * Open a file selection box and prompt the user for a file to save data
+@@ -119,28 +119,28 @@ public:
+      **/
+     virtual std::string askForSaveFileName( const std::string & startWith,
+ 				       const std::string & filter,
+-				       const std::string & headline );
++				       const std::string & headline ) override;
+ 
+     /**
+      * Beep.
+      *
+      * Reimplemented from YApplication.
+      **/
+-    virtual void beep();
++    virtual void beep() override;
+ 
+     /**
+      * Redraw the screen.
+      *
+      * Reimplemented from YApplication.
+      **/
+-    virtual void redrawScreen();
++    virtual void redrawScreen() override;
+ 
+     /**
+      * Initialize the (text) console keyboard.
+      *
+      * Reimplemented from YApplication.
+      **/
+-    virtual void initConsoleKeyboard();
++    virtual void initConsoleKeyboard() override;
+ 
+     /**
+      * Set the (text) console font according to the current encoding etc.
+@@ -152,7 +152,7 @@ public:
+ 				 const std::string & font,
+ 				 const std::string & screen_map,
+ 				 const std::string & unicode_map,
+-				 const std::string & language );
++				 const std::string & language ) override;
+ 
+     /**
+      * Run a shell command (typically an interactive program using NCurses)
+@@ -165,7 +165,7 @@ public:
+      *
+      * Reimplemented from YApplication.
+      **/
+-    virtual int runInTerminal( const std::string & command );
++    virtual int runInTerminal( const std::string & command ) override;
+ 
+ 
+     /// @{
+@@ -183,33 +183,33 @@ public:
+     //
+     // All implemented from YApplication.
+ 
+-    virtual int	 displayWidth();
+-    virtual int	 displayHeight();
+-    virtual int	 displayDepth();
+-    virtual long displayColors();
++    virtual int	 displayWidth() override;
++    virtual int	 displayHeight() override;
++    virtual int	 displayDepth() override;
++    virtual long displayColors() override;
+ 
+-    virtual int	 defaultWidth();
+-    virtual int	 defaultHeight();
++    virtual int	 defaultWidth() override;
++    virtual int	 defaultHeight() override;
+ 
+-    virtual bool isTextMode()			{ return true; }
++    virtual bool isTextMode() override			{ return true; }
+ 
+-    virtual bool hasImageSupport()		{ return false; }
++    virtual bool hasImageSupport() override 		{ return false; }
+ 
+-    virtual bool hasIconSupport()		{ return false; }
++    virtual bool hasIconSupport() override		{ return false; }
+ 
+-    virtual bool hasAnimationSupport()		{ return false; }
++    virtual bool hasAnimationSupport()	override	{ return false; }
+ 
+-    virtual bool hasFullUtf8Support();
+-    virtual bool richTextSupportsTable()	{ return false; }
++    virtual bool hasFullUtf8Support() override;
++    virtual bool richTextSupportsTable() override	{ return false; }
+ 
+-    virtual bool leftHandedMouse()		{ return false; }
++    virtual bool leftHandedMouse() override		{ return false; }
+     
+     /**
+      * Set the application title
+      *
+      * Reimplemented from YApplication.
+      **/
+-    virtual void setApplicationTitle(const std::string& title);
++    virtual void setApplicationTitle(const std::string& title) override;
+ };
+ 
+ 
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-use-_nl_msg_cat_cntr-only-with-glibc.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-use-_nl_msg_cat_cntr-only-with-glibc.patch
deleted file mode 100644
index 8e3774c1ae..0000000000
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-use-_nl_msg_cat_cntr-only-with-glibc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4b84f243a70a8c07f6a38dad3c9411fa707f25c9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 4 Mar 2018 17:08:43 -0800
-Subject: [PATCH] use _nl_msg_cat_cntr only with glibc
-
-The musl libc provides libintl (similar to glibc)
-but does not use the same internals,
-so even though we are using the GNU gettext
-the libintl included with the libc does not define
-_nl_msg_cat_cntr and it does not need to.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/NCi18n.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/NCi18n.h b/src/NCi18n.h
-index 165b0e7..bfc4ed7 100644
---- a/src/NCi18n.h
-+++ b/src/NCi18n.h
-@@ -59,12 +59,13 @@ inline void setTextdomain( const char * domain )
-     bindtextdomain( domain,  YSettings::localeDir().c_str() );
-     bind_textdomain_codeset( domain, "UTF-8" );
-     textdomain( domain );
--
-+#if defined(__GLIBC__)
-     // Make change known
-     {
- 	extern int _nl_msg_cat_cntr;
- 	++_nl_msg_cat_cntr;
-     }
-+#endif
- }
- 
- 
--- 
-2.16.2
-
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch
new file mode 100644
index 0000000000..f65cbe6679
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch
@@ -0,0 +1,49 @@
+From 162a0899f1dacd83007c4e82b9034f55610d8c20 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Sep 2018 19:01:51 -0700
+Subject: [PATCH 2/2] Define own resize in NCPad and fix param type of
+ SetLabel()
+
+Explicitly override resize() to avoid conflicts from NCursesWindow
+definition since there is another resize definition as well
+
+Fixes
+src/NCPad.h:164:18: error: 'NCPad::resize' hides overloaded virtual function [-Werror,-Woverloaded-virtual]
+
+NCTablePad.h:132:18: error: 'NCTableTag::SetLabel' hides overloaded virtual function [-Werror,-Woverloaded-virtual]
+
+Upstream-Status: Submitted [https://github.com/libyui/libyui-ncurses/pull/69]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/NCPad.h      | 1 +
+ src/NCTablePad.h | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/NCPad.h b/src/NCPad.h
+index 328c4aa..d8fb324 100644
+--- a/src/NCPad.h
++++ b/src/NCPad.h
+@@ -162,6 +162,7 @@ public:
+     virtual void Destwin( NCursesWindow * dwin );
+ 
+     virtual void resize( wsze nsze );
++    virtual int resize( int lines, int columns ) { return NCursesWindow::resize(lines, columns );}
+     virtual void wRecoded();
+     virtual void setDirty() { dirty = true; }
+ 
+diff --git a/src/NCTablePad.h b/src/NCTablePad.h
+index c450529..3756796 100644
+--- a/src/NCTablePad.h
++++ b/src/NCTablePad.h
+@@ -129,7 +129,7 @@ public:
+ 
+     virtual ~NCTableTag() {}
+ 
+-    virtual void SetLabel( const NCstring & ) { /*NOOP*/; }
++    virtual void SetLabel( const NClabel & ) { /*NOOP*/; }
+ 
+     virtual void DrawAt( NCursesWindow & w, const wrect at,
+ 			 NCTableStyle & tableStyle,
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
index 578c713012..4fafce1662 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
@@ -5,13 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
 "
 
 SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
-           file://0001-use-_nl_msg_cat_cntr-only-with-glibc.patch \
+           file://0001-Use-override-consistently.patch \
+           file://0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch \
           "
 
 SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
 PV = "2.48.3+git${SRCPV}"
-SRCREV = "79b804b45ffc6a0d92e28e793ff389a20b63b54b"
+SRCREV = "c941b32246e8b2952fce4fd5743f8e318222ab98"
 
 S = "${WORKDIR}/git"
 
@@ -29,8 +30,8 @@ do_configure_prepend () {
     mkdir -p ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
     cp ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so* ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
     cd -
-    sed -i "s#\${YPREFIX}#\${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${S}/CMakeLists.txt
-    sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${PKG_CONFIG_SYSROOT_DIR}${libdir}/cmake/libyui/LibyuiLibraryDepends-release.cmake
+    sed -i -e "s#\${YPREFIX}#\${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${S}/CMakeLists.txt
+    sed -i -e "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${PKG_CONFIG_SYSROOT_DIR}${libdir}/cmake/libyui/LibyuiLibraryDepends-release.cmake
 }
 
 do_install_append () {
diff --git a/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-GCC-8-warning.patch b/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-GCC-8-warning.patch
deleted file mode 100644
index c1ba42eeed..0000000000
--- a/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-GCC-8-warning.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1e6d40fec16a94d1a4bd40634405267200b7e969 Mon Sep 17 00:00:00 2001
-From: marxin <mliska@suse.cz>
-Date: Tue, 10 Apr 2018 15:21:40 +0200
-Subject: [PATCH] Fix GCC 8 warning:
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-/home/marxin/Programming/libyui/src/YDialog.cc: In static member function ‘static void YDialog::showText(const string&, bool)’:
-/home/marxin/Programming/libyui/src/YDialog.cc:690:26: error: catching polymorphic type ‘class YUIException’ by value [-Werror=catch-value=]
-     catch ( YUIException exception )
-                          ^~~~~~~~~
-/home/marxin/Programming/libyui/src/YDialog.cc: In static member function ‘static bool YDialog::showRelNotesText()’:
-/home/marxin/Programming/libyui/src/YDialog.cc:814:26: error: catching polymorphic type ‘class YUIException’ by value [-Werror=catch-value=]
-     catch ( YUIException exception )
-                          ^~~~~~~~~
----
-Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/122]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- src/YDialog.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/YDialog.cc b/src/YDialog.cc
-index 92e5031..8ecff90 100644
---- a/src/YDialog.cc
-+++ b/src/YDialog.cc
-@@ -687,7 +687,7 @@ YDialog::showText( const std::string & text, bool useRichText )
- 	dialog->waitForEvent();
- 	dialog->destroy();
-     }
--    catch ( YUIException exception )
-+    catch ( YUIException &exception )
-     {
- 	// Don't let the application die just because help couldn't be displayed.
- 
-@@ -811,7 +811,7 @@ YDialog::showRelNotesText()
- 	}
-         dialog->destroy();
-     }
--    catch ( YUIException exception )
-+    catch ( YUIException &exception )
-     {
-         // Don't let the application die just because RN couldn't be displayed.
- 
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-graphics/libyui/libyui/0001-Use-curly-braces-for-MAKE-variable.patch b/meta-oe/recipes-graphics/libyui/libyui/0001-Use-curly-braces-for-MAKE-variable.patch
new file mode 100644
index 0000000000..dbe241709a
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui/0001-Use-curly-braces-for-MAKE-variable.patch
@@ -0,0 +1,32 @@
+From 4eed37b1a61458fc8e5251f7cb7c6d64e8e9da8d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Sep 2018 17:48:09 -0700
+Subject: [PATCH] Use curly braces for MAKE variable
+
+Fixes errors with ninja
+| ninja: error: build.ninja:142: bad $-escape (literal $ must be written as $$)
+
+Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/137]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ buildtools/LibyuiCommon.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/buildtools/LibyuiCommon.cmake b/buildtools/LibyuiCommon.cmake
+index cb93307..e6fbefd 100644
+--- a/buildtools/LibyuiCommon.cmake
++++ b/buildtools/LibyuiCommon.cmake
+@@ -122,8 +122,8 @@ MACRO( SET_BUILD_FLAGS )	# setup compiler-flags depending on CMAKE_BUILD_TYPE
+     ENABLE_TESTING()
+     # add a wrapper "tests" target, the builtin "test" cannot be extended :-(
+     ADD_CUSTOM_TARGET(tests
+-      $(MAKE)
+-      COMMAND $(MAKE) test
++      ${MAKE}
++      COMMAND ${MAKE} test
+     )
+   ENDIF ( ENABLE_TESTS OR ENABLE_CODE_COVERAGE)
+ 
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-graphics/libyui/libyui_git.bb b/meta-oe/recipes-graphics/libyui/libyui_git.bb
index 42945288c4..2826652cb7 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_git.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
                    "
 
 SRC_URI = "git://github.com/libyui/libyui.git \
-           file://0001-Fix-GCC-8-warning.patch \
            file://0001-Fix-build-with-clang.patch \
+           file://0001-Use-curly-braces-for-MAKE-variable.patch \
            "
 
 PV = "3.3.3+git"
-SRCREV = "2b634cb7821e2e79dd4b7a73caf8e67c50189376"
-
+SRCREV = "50672da835ec9d52766320a44a2677e08a24c99c"
+SRCREV_FORMAT = "default"
 S = "${WORKDIR}/git"
 
 inherit cmake gettext pkgconfig
@@ -22,9 +22,9 @@ DEPENDS += "boost"
 BBCLASSEXTEND = "native nativesdk"
 
 do_configure_prepend () {
-        cd ${S}
-        ./bootstrap.sh
-        cd -
+        (cd ${S} &&
+        ./bootstrap.sh &&
+        cd -)
 }
 
 do_install_append () {
-- 
2.18.0


