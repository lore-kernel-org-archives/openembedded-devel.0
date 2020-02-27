Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A6BF1605AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:10:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48T3gP3MNyz3l
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 21:10:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582834209;
	bh=kB0/Sud/PnPzfQ6lieVh/Z/phmYGUc8PDniANwlB7fI=;
	h=From:To:Subject:Date:From;
	b=hGaAWn3boI/HsOTIAIPFpfyJOct6RKo24t+EbPSZ3TOABYNkF+HLObQLTX7owD1BJ
	7cog1gXIZHJ4TmYZYK6c9UzdI23OYX5BnOZ+VKfjL5v9fIup8y1+W8Cly+csrqOgDr
	0LjN8y2/Xj1404HlBVG91QtB7JxirO3IcEich7rLny7HXGr5NBIGOtjv0qjT1yjwg0
	3hk2xEdjHsKUY5MdPpEnf/vaHD/kaG+nMH7yB0MS5lIlydVVDBY623FG8SmW5rA2HM
	7sig0EEodmroOvIiQW29fzLkgtjlUmSfLeVbu+B3x1RvWqdvp5vFvZgLOhXhXRYWZ2
	jAc3dZbiiFOM6nip6+biBRAakMf3HG8CNsa7/FK32P3saeJWQrHQlucOXiDcXY2W6T
	zrcIJlZDIfOJ/484L8PQ4eaT/iWqAY5LlOOrWwvCxTA6e6pQvIs2NlAIKlpfAYxVSH
	rP5ZRmvPNExJM+4zfNs1x4PF6d2KBtVzAfVwDIPN/BrEy60kZvsEgaKut+ZC4nEXNp
	LQy7mrNag4JG4H5Uvq1XecJLmjCRPiNDQXRsE9Astj+QggWBnXSLcJXkRYdqjyi/jG
	Uj5xXO1RCqtzjZ4Hw21Qgx/I+X7eKkgsHELgu+YUEr8NA9HsDTHGBBT9BUO0qiwHyo
	zH8pOJ29dyQJ3mk/IX8dosko=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 22:10:07 +0200
Message-Id: <20200227201007.25063-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libidn: Remove obsolete patches for issues already fixed upstream
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
X-List-Received-Date: Thu, 27 Feb 2020 20:10:11 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...R_P_warning_error_with_automake_1.12.patch | 34 ------------------
 .../libidn/libidn_fix_for_automake-1.12.patch | 35 -------------------
 .../recipes-extended/libidn/libidn_1.35.bb    |  2 --
 3 files changed, 71 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 delete mode 100644 meta-oe/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch

diff --git a/meta-oe/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch b/meta-oe/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
deleted file mode 100644
index 43bd23294..000000000
--- a/meta-oe/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From cdd9e2e960eeb4eda7b08f0113d0cd03524c1d45 Mon Sep 17 00:00:00 2001
-From: Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: Tue, 10 Jul 2012 02:44:30 -0700
-Subject: [PATCH] libidn: fix build with automake 1.12
-
-Upstream-Status: Inappropriate
-
-automake 1.12.x has deprecated AM_PROG_MKDIR_P , and throws a warning for that,
-and the warnings are treated as errors because of the -Werror parameter.
-
-These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has not
-eliminated these deprecated macros yet. So disable the treatment of warnings
-as errors until gettext is updated to remove the deprecated macros.
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/10
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 261dad2..c4f935e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,7 +22,7 @@ AC_INIT([GNU Libidn], [1.34], [bug-libidn@gnu.org])
- AC_CONFIG_AUX_DIR([build-aux])
- AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_HEADERS(config.h)
--AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-override])
-+AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
- # Library code modified:                              REVISION++
diff --git a/meta-oe/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch b/meta-oe/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
deleted file mode 100644
index 3c0559e34..000000000
--- a/meta-oe/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d4f64b78419139eda3c0e1c6ee116bb5f70ea67c Mon Sep 17 00:00:00 2001
-From: Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: Wed, 2 May 2012 18:05:19 -0700
-Subject: [PATCH] libtasn1: fix build with automake 1.12
-
-Upstream-Status: Pending
-
-This patch fixes following issue with automake 1.12
-
-| automake: warnings are treated as errors
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libidn.la': linking libtool libraries using a non-POSIX
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/03
-
----
- configure.ac | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 8297649..7b9626e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -33,6 +33,10 @@ AC_SUBST(LT_CURRENT, 18)
- AC_SUBST(LT_REVISION, 0)
- AC_SUBST(LT_AGE, 6)
- 
-+# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
-+m4_pattern_allow([AM_PROG_AR])
-+AM_PROG_AR
-+
- AC_PROG_CC
- gl_EARLY
- lgl_EARLY
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.35.bb b/meta-oe/recipes-extended/libidn/libidn_1.35.bb
index d5ce5b46b..105740354 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.35.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.35.bb
@@ -15,8 +15,6 @@ DEPENDS = "virtual/libiconv autoconf-archive"
 inherit pkgconfig autotools gettext texinfo gtk-doc
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
-           file://libidn_fix_for_automake-1.12.patch \
-           file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
            file://dont-depend-on-help2man.patch \
            file://0001-idn-format-security-warnings.patch \
            "
-- 
2.17.1


