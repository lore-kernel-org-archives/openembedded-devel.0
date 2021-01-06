Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.9411.1609946251810963035
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QfmF+SQ3;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id jx16so5433689ejb.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SA7x3pfS9jyu+87oiPvDHHSlwro2cMnZerMpMZplPeI=;
        b=QfmF+SQ3zK7TZ5blRF5CeS1Jty4WlN4pumgicfbh+ajyml1IA+Hyx1zH8M8Ay/AdSk
         ccwV5UcPAIGRh1LsHxKtikpOJfDIQdUUl/1JSwZqCImf7gpLgQYhDdUYXSPMABRqSxG2
         wSalYP0b0P2kX8gIA+6+vgmAq1gCB+hABeA7Tg7S3uQrjsBzDfMk9aDBWUj0FFMyFQEG
         f9aw6o5AG8vm1R++hmMxZXvCd24MKDe5R7DMeMmC6TEiGRODiRacJAB2Jmn9K7uaC7eE
         4rDu0StxLY94b8e5Tx9L0BIxvnSafgbbbtoA862wfhhxuwKdJrzlp6gnU5Bumuip7yDt
         Eijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SA7x3pfS9jyu+87oiPvDHHSlwro2cMnZerMpMZplPeI=;
        b=OuoKIDCYxHfIeZMjMKvjWeK2mqFXnkPjgDGMnjtTWFd0SNIaRe5wfG3FMnmu7JV1a4
         cmYL0hwH7ObujGmsYsBgUj0E2C7hOPz99vAxPhFKfunejusc1jDgnIcMWyHSF9nmWEEL
         SzEtjrdzb6OH/cIUMIrgnbm7r93vfiIakD//i4cZQHfMHXxH/SQyler9lBYzDSU/EqXl
         usJafT+knlgG0Ml8IN75viIHBzO92vCv8Sry8uLY/YCZ4WmtQmAHAiRdC6EDVu4Cdr1h
         oh33CVBF5ESHK4/8yWtTfM6WSG3yD5gKseuwCWsXXNMUOQISk3cVgRdErAlJoa5ooZXd
         sqIA==
X-Gm-Message-State: AOAM5308Q4YOdyHoQ+dQ/aOa02gvURJPZMdwr7gwUuxQzW5GRGOXTn5u
	pHSibLDbElAx2zPSHrPWDFMPHorZi3ZeCA==
X-Google-Smtp-Source: ABdhPJz4kL7sb4Jo5KRNmOdQUj/alXfbMfwjXaIXPl2onQ0BZsqRxPlaGhrOi5aSxoQk8MxHikhtog==
X-Received: by 2002:a17:906:1741:: with SMTP id d1mr3312016eje.182.1609946250012;
        Wed, 06 Jan 2021 07:17:30 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:28 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/28] xfce4-dev-tools: upgrade 4.14.0 -> 4.16.0
Date: Wed,  6 Jan 2021 16:16:50 +0100
Message-Id: <20210106151717.1779543-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- Bump glib to 2.50 based on xfce4.16 roadmap
- Do not process @LINGUAS@ at xdt-autogen stage
- Fail xfce-build container generation if there is any error
- helpers: Prefer xfce-build over xfce-test (Fixes #38)
- helpers: Add new helper xfce-open-gitlab
- helpers: Add helper to locally run xfce-build
- helpers: Add xfce-build 'pull' argument
- xfce-build: Add Thunar to container (Fixes #40)
- Disable CFLAGS override when building CI container
- use strict CFLAGS to catch common mistakes in ci pipeline
- Add xvfb on xfce-build

Release notes for 4.15.1
========================
[Please note that this is a development release.]

Various improvements to the helpers introduced in 4.15.0,
cleanup of xdt-autogen code (thanks to Gaël Bonithon), various fixes for
our CI.

- get-translations: Fix line wrapping
- xdt-autogen: Various small improvements
- xdt-autogen: Properly handle whitespaces in filenames
- xdt-autogen: Use sed instead of tr to replace strings
- Updates README.md
- xfce-build: Add libclutter-1.0-dev for xfdashboard build
- Update .gitignore
- helpers: Use blank line for tags message
- helpers: Reuse release notes from NEWS for tag message
- helpers: Simplify xfce-update-news
- helpers: Do not strip NEWS blank line at EOF
- helpers: Install xfce-do-release
- xfce-build: Add depend for mousepad (Fixes #37)
- helpers: Add do-release helper and Readme
- xfce-build: Install python3 version of distutils-extra
- helpers: Make get-translations executable
- get-translations: Remove last comma
- get-translations: Correctly get locale from commit messages
- xfce-build: Replace build-dep with package names

Release notes for 4.15.0
========================
[Please note that this is a development release.]

- New macro XDT_VERSION_INIT(SEMVER[, TAG])

This macro takes care of setting up the version numbering.
It will define the following macros based on SEMVER and TAG:

   - xdt_version
   - xdt_version_major
   - xdt_version_minor
   - xdt_version_micro
   - xdt_version_tag
   - xdt_version_build
   - xdt_debug_default

If TAG isn't specified, the xdt_version_tag and xdt_version_git
will be empty and xdt_debug_default will be set to "minimum",
otherwise the xdt_version_build will contain a git hash and
xdt_debug_default will be set to "yes"

Example usage:

  XDT_VERSION_INIT([4.15.3],[git])
  AC_INIT([xfce4-someproject], [xdt_version()])
  ...
  XDT_FEATURE_DEBUG([xdt_debug_default])

- XDT_I18N macro will now automatically find the linguas if none are
specified during the autoconf run.

- Install m4 macros in default search dir. This makes autoconf find the
macros by default.

By setting version via XDT_VERSION_INIT and using XDT_I18N without
arguments,
this is no longer necessary to use a separate configure.ac.in and a
plain configure.ac can be used !
A big thank to Natanael Copa (ncopa) for his work on this part !

- xfce4-dev-tools now also handle the CI (docker container,
.gitlab-ci.yml templates files etc) on our new gitlab instance. A merge
request or a push to master to any of our projects automatically trigger
a build. This will help us to catch errors quicker and have better
quality. Thanks to Jason Yavorska and Simon Steinbeiss.

- New helpers are also available (xfce-get-release-notes,
xfce-get-translations, xfce-update-news) to help our maintainers to do
releases ! Thanks Simon again.

- Use datarootdir instead of datadir
- xdt-autogen: explicitly set search path for m4 macros
- Install the xfce-helpers
- Add two new helpers to help releasers
- Install m4 macros into default $datadir/aclocal
- Update README for new gitlab urls
- xdt-autogen: Improve and simplify linguas detection
- Let XDT_I18N automatically find the po/*.po as default
- Let configure generate the xdt-autogen script
- Implement XDT_VERSION_INIT
- Add manpage and tests to xdt-csource
- Add xfce4-dev-tools build in addition to container build
- Check BEFORE_SHA along with changes to .po files
- gitlabci: Ensure to run autogen in distcheck stage
- Switch to "foreign" mode for automake
- Add CI templates notes
- Update README with explanation of Dockerfile
- Fix whitespace error
- Add helper script to get all translation-updates
- Integrate xfce-build container build/creation

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...0001-Run-native-xdt-csource-on-tests.patch | 33 +++++++++++++++++++
 ...ls_4.14.0.bb => xfce4-dev-tools_4.16.0.bb} |  6 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-Run-native-xdt-csource-on-tests.patch
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.14.0.bb => xfce4-dev-tools_4.16.0.bb} (71%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-Run-native-xdt-csource-on-tests.patch b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-Run-native-xdt-csource-on-tests.patch
new file mode 100644
index 000000000..74b1679ab
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-Run-native-xdt-csource-on-tests.patch
@@ -0,0 +1,33 @@
+From b2fcd5c09ee6b4ad03f93ee5e1dd32f2f062cf07 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 3 Jan 2021 15:36:07 +0100
+Subject: [PATCH] Run native xdt-csource on tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Tests cannot be opted out so let them pass.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ tests/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index fa0832c..7c46bbf 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -26,7 +26,7 @@ DISTCLEANFILES = test-xdt-csource-data.c
+ BUILT_SOURCES = test-xdt-csource-data.c
+ 
+ test-xdt-csource-data.c: Makefile $(srcdir)/data/data.bin $(srcdir)/data/data.txt
+-	$(top_builddir)/xdt-csource/xdt-csource --extern --build-list data_bin $(srcdir)/data/data.bin data_txt $(srcdir)/data/data.txt > test-xdt-csource-data.c
++	xdt-csource --extern --build-list data_bin $(srcdir)/data/data.bin data_txt $(srcdir)/data/data.txt > test-xdt-csource-data.c
+ 
+ clean-local:
+ 	rm -f *.core core core.*
+-- 
+2.26.2
+
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.14.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
similarity index 71%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.14.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
index 0b1196619..143a0a5e7 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.14.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
@@ -3,15 +3,17 @@ HOMEPAGE = "http://www.xfce.org"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+
 DEPENDS = "glib-2.0"
+DEPENDS_append_class-target = " ${BPN}-native"
 
 inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5f8fc8af73819c08d9e4c26a3ac457e7"
-SRC_URI[sha256sum] = "2c9eb8e0fe23e47dc31411a93b683fd1b7a49140e9163f0aab9e94a3d8a0b5fd"
+SRC_URI_append_class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
+SRC_URI[sha256sum] = "f50b3070e66f3ebdf331744dd1ec5e1af5de333965d491e15ce05545e8eb4f04"
 
 do_install_append() {
     install -d ${D}${datadir}/aclocal
-- 
2.26.2

