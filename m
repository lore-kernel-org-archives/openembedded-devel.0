Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail.openembedded.org (Postfix) with ESMTP id A88927E71C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 21:04:40 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id r2so28431lfn.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xjI4ubGNoiRDEj/+hG+DLvStW/RkN7L428Bs2MtK898=;
	b=SvS3ypTovTHvYEP60FNAGOJpQ6Gk1RymMh9XS458tQPCSpAQQjzUyd8w0kC+ZKBtV+
	9gUYey6HQJC0sMGU1ZFu24TE3DbPKJH+ZC/mSJ8raGsWH8bY8CqRrWhQseP/45JSveJb
	G9JZUuyqU3nSJXbguf7ZTxvKqCVx6nXWBorilUsPEZx1B+1L0bxh/xuQJcuKLPEE/PnM
	1QAYVASBAkhEodZe8PSSEUJq6r3GGkljfy/DnOlQZ5psbA1fdcScutjc2tEGZ0OSEOmJ
	+UexBvA8btPA2kbGXxK6p/8IiGbKs91ooe4gCnvruqi0V0PyJBMx0y2OvgDX8Ffft9fL
	/Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xjI4ubGNoiRDEj/+hG+DLvStW/RkN7L428Bs2MtK898=;
	b=JjlDEYEDeaUvo8JmeJFOiYGRbFT3feL8cAbuX4V9T4g1w0pYTa8BJ8bfMYfb9M10Mh
	6lg5Vj7nu+8q4NH39R9MG2QVjX1a2AHUqo+HNxrRF7+FPWpnV9tspZqtDmHskPZwiAQP
	6xjbIVp613rLcSEB53e2x3etR/zV6iUoExeWyEEuyjfCgnPMuAIhbMQGkxsHNotEYVwi
	Hbx2d4WuSyvxIZ+YFRq8vojjlz1hC2rX29i4x8pKCbEYl/YvxAxe++WRHk1s14yM34PB
	mbtehM5oxMy7PUMaUnOUQPbYLRqKRZwLQFliPJl/jb+0zxSg5EZModmvaohDJRs4DgMZ
	vK4Q==
X-Gm-Message-State: APjAAAWLal00tF3vaMgiboJ614ei03fGMzEa1cUyAMr5kdelrkz1Dobh
	sXBDo00+JVgDFGAg9PLQmf7xGgQG6OQ=
X-Google-Smtp-Source: APXvYqxpWthJDICzkas1Cq28o4CKA6A3iPgvVjvUz1Da+anFvQSfJxSVXXm/+oHFUZRVBwpimRMpNw==
X-Received: by 2002:ac2:4a6b:: with SMTP id q11mr25367lfp.132.1569445480939;
	Wed, 25 Sep 2019 14:04:40 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id t27sm31089lfl.48.2019.09.25.14.04.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 14:04:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 23:04:36 +0200
Message-Id: <20190925210436.30673-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925210436.30673-1-open.source@oleksandr-kravchuk.com>
References: <20190925210436.30673-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 2/2] libyui-ncurses: udpate to 2.52.0
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
X-List-Received-Date: Wed, 25 Sep 2019 21:04:41 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-Use-override-consistently.patch      | 147 ------------------
 ...e-in-NCPad-and-fix-param-type-of-Set.patch |  49 ------
 ...curses_git.bb => libyui-ncurses_2.52.0.bb} |   5 +-
 3 files changed, 1 insertion(+), 200 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Use-override-consistently.patch
 delete mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch
 rename meta-oe/recipes-graphics/libyui/{libyui-ncurses_git.bb => libyui-ncurses_2.52.0.bb} (87%)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Use-override-consistently.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Use-override-consistently.patch
deleted file mode 100644
index 6d4bdc2ab..000000000
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Use-override-consistently.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 0acfb67f99fd8d6af323311fee8c08116295b148 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Sep 2018 18:21:19 -0700
-Subject: [PATCH 1/2] Use override consistently
-
-Make clang++ happy
-error: 'setApplicationTitle' overrides a member function but is not marked 'override' [-Werror,-Winconsistent-missing-over ride]
-
-Upstream-Status: Submitted [https://github.com/libyui/libyui-ncurses/pull/69]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/NCApplication.h | 46 ++++++++++++++++++++++-----------------------
- 1 file changed, 23 insertions(+), 23 deletions(-)
-
-diff --git a/src/NCApplication.h b/src/NCApplication.h
-index e24c3eb..09e4708 100644
---- a/src/NCApplication.h
-+++ b/src/NCApplication.h
-@@ -60,7 +60,7 @@ public:
-      * Reimplemented from YApplication.
-      **/
-     virtual void setLanguage( const std::string & language,
--			      const std::string & encoding = std::string() );
-+			      const std::string & encoding = std::string() ) override;
- 
-     /**
-      * Open a directory selection box and prompt the user for an existing
-@@ -77,7 +77,7 @@ public:
-      * Implemented from YApplication.
-      **/
-     virtual std::string askForExistingDirectory( const std::string & startDir,
--					    const std::string & headline );
-+					    const std::string & headline ) override;
- 
-     /**
-      * Open a file selection box and prompt the user for an existing file.
-@@ -97,7 +97,7 @@ public:
-      **/
-     virtual std::string askForExistingFile( const std::string & startWith,
- 				       const std::string & filter,
--				       const std::string & headline );
-+				       const std::string & headline ) override;
- 
-     /**
-      * Open a file selection box and prompt the user for a file to save data
-@@ -119,28 +119,28 @@ public:
-      **/
-     virtual std::string askForSaveFileName( const std::string & startWith,
- 				       const std::string & filter,
--				       const std::string & headline );
-+				       const std::string & headline ) override;
- 
-     /**
-      * Beep.
-      *
-      * Reimplemented from YApplication.
-      **/
--    virtual void beep();
-+    virtual void beep() override;
- 
-     /**
-      * Redraw the screen.
-      *
-      * Reimplemented from YApplication.
-      **/
--    virtual void redrawScreen();
-+    virtual void redrawScreen() override;
- 
-     /**
-      * Initialize the (text) console keyboard.
-      *
-      * Reimplemented from YApplication.
-      **/
--    virtual void initConsoleKeyboard();
-+    virtual void initConsoleKeyboard() override;
- 
-     /**
-      * Set the (text) console font according to the current encoding etc.
-@@ -152,7 +152,7 @@ public:
- 				 const std::string & font,
- 				 const std::string & screen_map,
- 				 const std::string & unicode_map,
--				 const std::string & language );
-+				 const std::string & language ) override;
- 
-     /**
-      * Run a shell command (typically an interactive program using NCurses)
-@@ -165,7 +165,7 @@ public:
-      *
-      * Reimplemented from YApplication.
-      **/
--    virtual int runInTerminal( const std::string & command );
-+    virtual int runInTerminal( const std::string & command ) override;
- 
- 
-     /// @{
-@@ -183,33 +183,33 @@ public:
-     //
-     // All implemented from YApplication.
- 
--    virtual int	 displayWidth();
--    virtual int	 displayHeight();
--    virtual int	 displayDepth();
--    virtual long displayColors();
-+    virtual int	 displayWidth() override;
-+    virtual int	 displayHeight() override;
-+    virtual int	 displayDepth() override;
-+    virtual long displayColors() override;
- 
--    virtual int	 defaultWidth();
--    virtual int	 defaultHeight();
-+    virtual int	 defaultWidth() override;
-+    virtual int	 defaultHeight() override;
- 
--    virtual bool isTextMode()			{ return true; }
-+    virtual bool isTextMode() override			{ return true; }
- 
--    virtual bool hasImageSupport()		{ return false; }
-+    virtual bool hasImageSupport() override 		{ return false; }
- 
--    virtual bool hasIconSupport()		{ return false; }
-+    virtual bool hasIconSupport() override		{ return false; }
- 
--    virtual bool hasAnimationSupport()		{ return false; }
-+    virtual bool hasAnimationSupport()	override	{ return false; }
- 
--    virtual bool hasFullUtf8Support();
--    virtual bool richTextSupportsTable()	{ return false; }
-+    virtual bool hasFullUtf8Support() override;
-+    virtual bool richTextSupportsTable() override	{ return false; }
- 
--    virtual bool leftHandedMouse()		{ return false; }
-+    virtual bool leftHandedMouse() override		{ return false; }
-     
-     /**
-      * Set the application title
-      *
-      * Reimplemented from YApplication.
-      **/
--    virtual void setApplicationTitle(const std::string& title);
-+    virtual void setApplicationTitle(const std::string& title) override;
- };
- 
- 
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch
deleted file mode 100644
index f65cbe667..000000000
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 162a0899f1dacd83007c4e82b9034f55610d8c20 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Sep 2018 19:01:51 -0700
-Subject: [PATCH 2/2] Define own resize in NCPad and fix param type of
- SetLabel()
-
-Explicitly override resize() to avoid conflicts from NCursesWindow
-definition since there is another resize definition as well
-
-Fixes
-src/NCPad.h:164:18: error: 'NCPad::resize' hides overloaded virtual function [-Werror,-Woverloaded-virtual]
-
-NCTablePad.h:132:18: error: 'NCTableTag::SetLabel' hides overloaded virtual function [-Werror,-Woverloaded-virtual]
-
-Upstream-Status: Submitted [https://github.com/libyui/libyui-ncurses/pull/69]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/NCPad.h      | 1 +
- src/NCTablePad.h | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/NCPad.h b/src/NCPad.h
-index 328c4aa..d8fb324 100644
---- a/src/NCPad.h
-+++ b/src/NCPad.h
-@@ -162,6 +162,7 @@ public:
-     virtual void Destwin( NCursesWindow * dwin );
- 
-     virtual void resize( wsze nsze );
-+    virtual int resize( int lines, int columns ) { return NCursesWindow::resize(lines, columns );}
-     virtual void wRecoded();
-     virtual void setDirty() { dirty = true; }
- 
-diff --git a/src/NCTablePad.h b/src/NCTablePad.h
-index c450529..3756796 100644
---- a/src/NCTablePad.h
-+++ b/src/NCTablePad.h
-@@ -129,7 +129,7 @@ public:
- 
-     virtual ~NCTableTag() {}
- 
--    virtual void SetLabel( const NCstring & ) { /*NOOP*/; }
-+    virtual void SetLabel( const NClabel & ) { /*NOOP*/; }
- 
-     virtual void DrawAt( NCursesWindow & w, const wrect at,
- 			 NCTableStyle & tableStyle,
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb
similarity index 87%
rename from meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
rename to meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb
index 18ea2e828..dae5c342d 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb
@@ -5,15 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
 "
 
 SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
-           file://0001-Use-override-consistently.patch \
-           file://0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch \
            file://0003-Simplify-ncurses-finding-module.patch \
           "
 
 SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
-PV = "2.48.3+git${SRCPV}"
-SRCREV = "c941b32246e8b2952fce4fd5743f8e318222ab98"
+SRCREV = "d5b64b6291b6f292871ad5c6df25c4f6896f7d50"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


