Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2290C7D711
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 09:43:11 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v17so1476958wml.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wMFbGr0RYquj8rh0mrERboVYSUsbItfu8/DCkoYqEBw=;
	b=HxSELoyHroq8DVSLR/75aDTpTUtQapVXLZ6niCvBbKtbzz4k1xIcvek1sVtJ9xHKWC
	0pNvgY2bDB+PHTfZFNyel1Xyifl8/vnANhqb1U8oO3kkxsYN4XXPgsOpF2e+O1IlWIqM
	+SkaqpVO0CT08msdG1GNIB0XCF1P5gEUHRQZtAmxP0aEuBMa70yxmBzLQlCL5FC5+Ywj
	nyS6kWHNpTBcMV7RG2yk7/cE1hhXBUDBEynOm3Q4TDIFv6Zn7QkVGfaR9ycjOaZ48Wj+
	cX02UP81zaCVb/dl+rxL5tT7wl8pp7jOa5HYSzpvJb6V/+ly5kHrpJz5nhUPZYVb/nHA
	tyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wMFbGr0RYquj8rh0mrERboVYSUsbItfu8/DCkoYqEBw=;
	b=RmMBn4vXAUP/eeuZu1H/kRI7AC/0oAi8SnqvjeEDlVqXtTdMgjZoWivJivpSHcqn4o
	CIfJN4ONa1Jhp3wbY52yRck2z1Py4BRmvR4TJXe/kV9AmH9JEOtRsCpgOmiEZwJs+xTL
	ek87qHfxWLdZIYfzQwfIB/AKUza59HXRyXLcBEXVOcpu3S+fmmE+vl0ZnuCVWJ4ZxhkR
	uu+1BTp8asrfk0Vdd2rsiDr4ZHoUB11tlygtTrzYm/oI4ss5fr3iNN0KmB0riLHU2Eby
	veml5Z14cAfy7EjX6p7Lqh9Bp7ByRYKl0YP1DulLy/GFrAjeOPWYPKCFAXK5ZrTrmlhs
	Vmvg==
X-Gm-Message-State: APjAAAX65i7YHN6sDWjSCvGWcaGM4WMYUBuZWuWmXH2F3I/6NHEI3Yp+
	3FWjsNK+fgzWlS5T+rHynfzgLA==
X-Google-Smtp-Source: APXvYqxAcw2l00wkXtsalwyQ3IMr8Td5fL+8R7lDAFdA4bn7/s9P65sdebVJEwnhSdJM+2Nu1LMbnQ==
X-Received: by 2002:a7b:ca43:: with SMTP id m3mr2541940wml.20.1568367791976;
	Fri, 13 Sep 2019 02:43:11 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id
	b15sm1975560wmb.28.2019.09.13.02.43.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 02:43:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 11:43:07 +0200
Message-Id: <20190913094307.27733-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] unclutter-xfixes: new package
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
X-List-Received-Date: Fri, 13 Sep 2019 09:43:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a recipe for unclutter-xfixes - a rewrite of the popular tool
unclutter using the x11-xfixes extension.

Included is a patch adding autotools support (instead of a hand-coded
Makefile) that's already been submitted upstream.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../0001-build-use-autotools.patch            | 238 ++++++++++++++++++
 .../unclutter-xfixes/unclutter-xfixes_1.5.bb  |  23 ++
 2 files changed, 261 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch
 create mode 100644 meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb

diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch
new file mode 100644
index 000000000..25771168c
--- /dev/null
+++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch
@@ -0,0 +1,238 @@
+From 2a5cf5021b56bc92c9953d2c82e8c90502d22c97 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+Date: Fri, 13 Sep 2019 10:20:53 +0200
+Subject: [PATCH] build: use autotools
+
+This removes the hand-crafted Makefile in favor of standardized autotools
+build configuration. This is done to allow for easy cross-compilation of
+this project.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+---
+ .gitignore          | 17 ++++++++++++
+ Makefile            | 66 ---------------------------------------------
+ Makefile.am         | 10 +++++++
+ configure.ac        | 36 +++++++++++++++++++++++++
+ include/Makefile.am |  9 +++++++
+ man/Makefile.am     |  7 +++++
+ obj/.gitkeep        |  0
+ src/Makefile.am     | 13 +++++++++
+ 8 files changed, 92 insertions(+), 66 deletions(-)
+ delete mode 100644 Makefile
+ create mode 100644 Makefile.am
+ create mode 100644 configure.ac
+ create mode 100644 include/Makefile.am
+ create mode 100644 man/Makefile.am
+ delete mode 100644 obj/.gitkeep
+ create mode 100644 src/Makefile.am
+
+diff --git a/.gitignore b/.gitignore
+index af88e94..4e7355a 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -3,3 +3,20 @@ obj/*.o
+ man/*.1
+ man/*.xml
+ test/GLOB*
++*.o
++
++# autotools stuff
++.deps/
++Makefile
++Makefile.in
++aclocal.m4
++autom4te.cache/
++autostuff/
++config.h
++config.h.in
++config.h.in~
++config.log
++config.status
++configure
++m4/
++stamp-h1
+diff --git a/Makefile b/Makefile
+deleted file mode 100644
+index 6264da0..0000000
+--- a/Makefile
++++ /dev/null
+@@ -1,66 +0,0 @@
+-TARGET = unclutter
+-VERSION = 1.5
+-SDIR = src
+-IDIR = include
+-ODIR = obj
+-
+-INSTALL = install
+-PREFIX = /usr
+-
+-BINDIR = $(PREFIX)/bin
+-MANDIR = $(PREFIX)/share/man/man1
+-LICENSEDIR = $(PREFIX)/share/licenses/$(TARGET)
+-
+-CC = gcc
+-LD = $(CC)
+-PKG_CONFIG = pkg-config
+-
+-CPPFLAGS += -D'__VERSION="${VERSION}"' "-I$(IDIR)"
+-
+-CFLAGS += -std=gnu99
+-CFLAGS += -Wall -Wundef -Wshadow -Wformat-security
+-
+-LDFLAGS += $(shell $(PKG_CONFIG) --libs x11 xi xfixes)
+-# libev has no pkg-config support
+-LDFLAGS += -lev
+-
+-INCS = $(wildcard $(IDIR)/*.h)
+-SRCS = $(wildcard $(SDIR)/*.c)
+-OBJS = $(patsubst %,$(ODIR)/%,$(notdir $(SRCS:.c=.o)))
+-
+-MANS = man/unclutter-xfixes.1
+-
+-.NOTPARALLEL:
+-
+-.PHONY: all
+-all: clean $(TARGET) mans
+-
+-.PHONY: $(TARGET)
+-$(TARGET): $(OBJS)
+-	$(LD) $(OBJS) $(LDFLAGS) -o "$(TARGET)"
+-
+-$(ODIR)/%.o: $(SDIR)/%.c $(INCS)
+-	$(CC) $(CPPFLAGS) $(CFLAGS) -o "$@" -c "$<"
+-
+-.PHONY: install
+-install: $(TARGET) mans
+-	$(INSTALL) -Dm 0755 "$(TARGET)" "$(DESTDIR)$(BINDIR)/$(TARGET)"
+-	$(INSTALL) -Dm 0644 man/unclutter-xfixes.1 "$(DESTDIR)$(MANDIR)/unclutter.1"
+-	$(INSTALL) -Dm 0644 -t "$(DESTDIR)$(LICENSEDIR)/" LICENSE
+-
+-.PHONY: uninstall
+-uninstall:
+-	$(RM) "$(DESTDIR)$(BINDIR)/$(TARGET)"
+-	$(RM) "$(DESTDIR)$(MANDIR)/unclutter.1"
+-	$(RM) "$(DESTDIR)$(LICENSEDIR)/LICENSE"
+-
+-.PHONY: mans
+-mans: $(MANS)
+-
+-$(MANS): %.1: %.man
+-	a2x --no-xmllint -f manpage "$<"
+-
+-.PHONY: clean
+-clean:
+-	$(RM) $(TARGET) $(OBJS)
+-	$(RM) man/*.1 man/*.xml
+diff --git a/Makefile.am b/Makefile.am
+new file mode 100644
+index 0000000..38ecaa1
+--- /dev/null
++++ b/Makefile.am
+@@ -0,0 +1,10 @@
++ACLOCAL_AMFLAGS = -I m4
++AUTOMAKE_OPTIONS = foreign
++SUBDIRS = include src
++
++if HAS_A2X
++SUBDIRS += man
++endif
++
++licensedir = $(datadir)/licenses/unclutter
++license_DATA = LICENSE
+diff --git a/configure.ac b/configure.ac
+new file mode 100644
+index 0000000..1d59197
+--- /dev/null
++++ b/configure.ac
+@@ -0,0 +1,36 @@
++AC_PREREQ(2.61)
++
++AC_INIT([unclutter-xfixes], 1.6)
++AC_DEFINE_UNQUOTED([VERSION], ["$PACKAGE_VERSION"])
++
++AC_CONFIG_AUX_DIR([autostuff])
++AC_CONFIG_MACRO_DIRS([m4])
++AM_INIT_AUTOMAKE([foreign subdir-objects])
++
++m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
++
++AC_CONFIG_SRCDIR([src])
++AC_CONFIG_HEADER([config.h])
++
++AM_PROG_AR
++AC_PROG_CC
++AC_PROG_INSTALL
++
++# libev has no pkg-config support
++AC_CHECK_HEADERS([ev.h], [], [AC_MSG_ERROR([ev.h not found - please install libev])])
++
++PKG_CHECK_MODULES([X11], [x11 xi xfixes])
++
++AC_CHECK_PROG([has_a2x], [a2x], [true], [false])
++AM_CONDITIONAL([HAS_A2X], [test "x$has_a2x" = xtrue])
++if test "x$has_a2x" = xfalse
++then
++	AC_MSG_NOTICE([a2x not found - needed to generate man pages])
++fi
++
++AC_CONFIG_FILES([Makefile
++		 include/Makefile
++		 src/Makefile
++		 man/Makefile])
++
++AC_OUTPUT
+diff --git a/include/Makefile.am b/include/Makefile.am
+new file mode 100644
+index 0000000..90d8bbc
+--- /dev/null
++++ b/include/Makefile.am
+@@ -0,0 +1,9 @@
++noinst_HEADERS = \
++	all.h \
++	cursor.h \
++	event.h \
++	extensions.h \
++	externals.h \
++	globals.h \
++	types.h \
++	util.h
+diff --git a/man/Makefile.am b/man/Makefile.am
+new file mode 100644
+index 0000000..7856e6a
+--- /dev/null
++++ b/man/Makefile.am
+@@ -0,0 +1,7 @@
++unclutter-xfixes.1:
++	a2x --no-xmllint -f manpage unclutter-xfixes.man
++
++dist_man1_MANS = unclutter-xfixes.1
++
++clean-local:
++	rm -f unclutter-xfixes.1
+diff --git a/obj/.gitkeep b/obj/.gitkeep
+deleted file mode 100644
+index e69de29..0000000
+diff --git a/src/Makefile.am b/src/Makefile.am
+new file mode 100644
+index 0000000..c7f0729
+--- /dev/null
++++ b/src/Makefile.am
+@@ -0,0 +1,13 @@
++AM_CFLAGS = -D'__VERSION="${VERSION}"' "-I$(top_srcdir)/include"
++AM_CFLAGS += -std=gnu99 -Wall -Wundef -Wshadow -Wformat-security
++AM_CFLAGS += $(X11_CFLAGS)
++AM_LDFLAGS = -lev $(X11_LIBS)
++
++bin_PROGRAMS = unclutter
++
++unclutter_SOURCES = \
++	cursor.c \
++	event.c \
++	extensions.c \
++	unclutter.c \
++	util.c
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb
new file mode 100644
index 000000000..a566bc18a
--- /dev/null
+++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Remove idle cursor image from screen."
+DESCRIPTION = "This is a rewrite of the popular tool unclutter, but using the x11-xfixes extension."
+AUTHOR = "Ingo Bürk"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b25d2c4cca175f44120d1b8e67cb358d"
+
+SRC_URI = "git://github.com/Airblader/unclutter-xfixes.git \
+           file://0001-build-use-autotools.patch"
+SRCREV = "10fd337bb77e4e93c3380f630a0555372778a948"
+
+inherit autotools pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS = "libev libx11 libxi libxfixes"
+
+S = "${WORKDIR}/git"
+
+do_install_append() {
+    # LICENSE is installed to /usr/share/licenses but we don't want it in the package
+    rm -rf ${D}${datadir}
+}
-- 
2.21.0


