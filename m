Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1FAAD7716A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 11:03:53 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g62so63726136wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 03:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wpq5ovecmv+3UjilSYv8x8fY3H2scqy2o2r/EV3ZC+A=;
	b=tK+awHA+hyE8kspmHMO9uqdbqto5xve1D+EqeJfVkitRy/Hh82qutjTLjg/spi/4gS
	4yBLQqaL3Vwh4WTccXvPGxJFKbZAlCv7X8tv00hM7qAiJOA/yNZokYtyazjFGdUYs+8e
	rksUoheAo9SFm8/7mnhF77TXxa5Og5gj6oLUfAZOzbTbCjVqHWW8BzCmAj+YJo7h0clk
	dhADiFzZVXvrnIdr7fzWJH6goqOYrUIoKHiEj9UnzqkQ1o8QZyOxcdqJuP9wqdjaptdC
	rVxmKqF/EmwvrBxeLGxf3QbopWVJbxxO5TW+OCfxtne17b4cYj/8JwFohjS9MlKFsBKB
	YEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wpq5ovecmv+3UjilSYv8x8fY3H2scqy2o2r/EV3ZC+A=;
	b=l934kPHlbOqOG+RKXUpueGnckQLOOaf9CJ0whuU4SE4qgqq6psH/QRIjk/HHceEc7v
	lqoq7KCt97zqSzf57FeZEmjkvwWF1QMZxbQYHsuDFZquKF0zG+OnTpjVt1kzEuxffOY9
	ZIqyyeBaznR8scVz40mxZEJGQADlwcxDgygy0NqKPImObXLcXl+pJMcM4oS6Ie84teLq
	OUJDEpVmuH+9K9JP0ScDwGj6egD66A5vLVaGZ2b/8AKMZbotFY4gVunCeTpjhrjntezi
	HgsFYdi6I8HvHUMOwtGQh292bR+eJfTifWRyryu3qP/KqyYOKxzvm0Ztm5CpYmw6psb3
	yL0g==
X-Gm-Message-State: AG10YOTFGC78zKualBF5jengUS7nlGxsg3/XjY/y5OR5r4x7OS/3HEHuEpXZXMy6UTQQxg==
X-Received: by 10.194.205.103 with SMTP id lf7mr12184330wjc.147.1455879834353; 
	Fri, 19 Feb 2016 03:03:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	198sm7179704wml.22.2016.02.19.03.03.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 03:03:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 12:04:18 +0100
Message-Id: <1455879859-3401-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455879859-3401-1-git-send-email-Martin.Jansa@gmail.com>
References: <1455879859-3401-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][WIP-for-5.7][meta-qt5 3/4] qtbase: Remove unsupported options xvideo, xinerama, xinput, gtkstyle
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
X-List-Received-Date: Fri, 19 Feb 2016 11:03:54 -0000

* xvideo and xinerama were removed in:
  commit e824abd987d77efaa085fe1f9fb514d270798d55
  Author: Alexander Volkov <a.volkov@rusbitech.ru>
  Date:   Tue Oct 13 18:43:25 2015 +0300

    configure: Remove unused options -xvideo and -xinerama

    -xvideo was not used even by Qt 4 for a long time.
    -xinerama was used by the xlib plugin which was dropped
    by e6a7a6a381c0b61a93a642b425ecbcd714fd1c29.

* xinput was removed in:
  commit fa8dbbff8895e7e1fdf1e6b0a9f3d821cd2caf2f
  Author: Alexander Volkov <a.volkov@rusbitech.ru>
  Date:   Thu Oct 8 18:19:39 2015 +0300

    configure: Remove -xinput option

    It's obsolete since e6a7a6a381c0b61a93a642b425ecbcd714fd1c29
    (Remove xlib plugin) and a2337f79ffd229aa1e91f6bfec6294570eb3fe44
    (Remove Windows and X11 from src/widgets/platforms).

    The actual option is -xinput2.

* gtkstyle was removed (partially replaced with gtk) in:
  commit 899a815414e95da8d9429a4a4f4d7094e49cfc55
  Author: Dmitry Shachnev <mitya57@gmail.com>
  Date:   Thu Jul 30 21:32:43 2015 +0300

    Remove gtk2 style from qtbase, it will be moved to qtstyleplugins

    This will allow us to drop gtk2 support from qtbase in future,
    while still providing the gtk2 style for those who want to use it.

    Also with moving to qtstyleplugins, the code can be simplified
    because we can directly link to libraries we need, instead of using
    QLibrary.

    [ChangeLog][QtWidgets] Remove QGtkStyle, it is now provided in
    qtstyleplugins repository.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 7728ba4..65c1db5 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-tools += "perl"
 
 PACKAGECONFIG_GL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor glib gtkstyle xkb', '', d)}"
+PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xsync xshape xrender xrandr xfixes xinput2 xcursor glib xkb', '', d)}"
 PACKAGECONFIG_FONTS ?= ""
 PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
 PACKAGECONFIG_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
@@ -96,15 +96,12 @@ PACKAGECONFIG[sql-db2] = "-sql-db2,-no-sql-db2"
 PACKAGECONFIG[sql-sqlite2] = "-sql-sqlite2,-no-sql-sqlite2,sqlite"
 PACKAGECONFIG[sql-sqlite] = "-sql-sqlite -system-sqlite,-no-sql-sqlite,sqlite3"
 PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,libxcursor"
-PACKAGECONFIG[xinerama] = "-xinerama,-no-xinerama,libxinerama"
-PACKAGECONFIG[xinput] = "-xinput,-no-xinput"
 PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2,libxi"
 PACKAGECONFIG[xfixes] = "-xfixes,-no-xfixes,libxfixes"
 PACKAGECONFIG[xrandr] = "-xrandr,-no-xrandr,libxrandr"
 PACKAGECONFIG[xrender] = "-xrender,-no-xrender,libxrender"
 PACKAGECONFIG[xshape] = "-xshape,-no-xshape"
 PACKAGECONFIG[xsync] = "-xsync,-no-xsync"
-PACKAGECONFIG[xvideo] = "-xvideo,-no-xvideo"
 PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
 PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
 PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
@@ -113,7 +110,7 @@ PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
 PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
 # depends on glib
 PACKAGECONFIG[fontconfig] = "-fontconfig,-no-fontconfig,fontconfig"
-PACKAGECONFIG[gtkstyle] = "-gtkstyle,-no-gtkstyle,gtk+"
+PACKAGECONFIG[gtk] = "-gtk,-no-gtk,gtk+"
 PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
 PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
 PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
-- 
2.7.1


