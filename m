Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 474DB6167B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 04:10:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QpWQ11q3z4M
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 05:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582517426;
	bh=bTqH/quu5gLXkJMowHyGeV1uVAQSTQgDxYUiXbTv7Wc=;
	h=From:To:Subject:Date:From;
	b=NGYBov1zPj4p5gBtM+lshIJmrxT9YX+0XA+KNxq0fV6NVIfFYbH1n1VVhVXe4AEaF
	MxGfSWkaRt4xDPC/aavxODMLXDet8LHRBD0INlw/RTjzQxNp+fKGk13r83RSNYiQqM
	Xj88mwpEqjwH1M+gdlWsPF6XDetfY2oAu3dENTQseio/ZYfUHKPqSB7e1obYhn/6DR
	z/o/bto3Sc0E/JLy5AR/f8sJ2b4KJhhqV7ugzkddgWGa/tMfRMA28ogt/5HiaGBa36
	5fjTXANkQAQRvDfG20iO7q75T+urCuLEFn1pX2qLSgRTfRL7bxZqz8OTtN9IDwdNj2
	lHVeKpYblyd9b/JaVRtktAcVygNGT5EM+Fg7apkp5zwBlYRG9wGPDQT/jUNuxI1mXa
	KixiiEVo9CbDCWxw4szLZhvsKdwThGE6vENBAkAqQZqw/UtHcwur/r0dNN0RQURnPc
	GGk0G/jpxHGgeD/Og89EZiSpKeH6KdGRi+MYUxJ7wI4gPV00d9ukz/swfvJ6tNF5vP
	1oicYCdAJAcUEhEZCBTPsieyExkBt48NQt43EndGIaLuT6D0M/z5QtEzAJX6xRnvgy
	BTftfjh1N3zsO5K+8c8RcLgfs9/h3nrYNBWYr9I1Gfzuui8Vx84qKQoCNQldAItyZN
	6zbi8GRlrG2EWapvKvj4Veuo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2020 06:10:25 +0200
Message-Id: <20200224041025.21829-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libidn: Moved from OE-core
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
X-List-Received-Date: Mon, 24 Feb 2020 04:10:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-idn-format-security-warnings.patch   | 181 ++++++++++++++++++
 ...R_P_warning_error_with_automake_1.12.patch |  34 ++++
 .../libidn/dont-depend-on-help2man.patch      |  23 +++
 .../libidn/libidn_fix_for_automake-1.12.patch |  35 ++++
 .../recipes-extended/libidn/libidn_1.35.bb    |  42 ++++
 5 files changed, 315 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch
 create mode 100644 meta-oe/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 create mode 100644 meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
 create mode 100644 meta-oe/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
 create mode 100644 meta-oe/recipes-extended/libidn/libidn_1.35.bb

diff --git a/meta-oe/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch b/meta-oe/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch
new file mode 100644
index 000000000..5adc7d9fd
--- /dev/null
+++ b/meta-oe/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch
@@ -0,0 +1,181 @@
+From 82f98dcbc429bbe89a9837c533cbcbc02e77c790 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Tue, 28 Jun 2016 12:43:31 +0100
+Subject: [PATCH] idn: fix printf() format security warnings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| ../../libidn-1.32/src/idn.c: In function 'main':
+| ../../libidn-1.32/src/idn.c:172:7: error: format not a string literal and no format arguments [-Werror=format-security]
+|        error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be specified"));
+|        ^~~~~
+| ../../libidn-1.32/src/idn.c:187:5: error: format not a string literal and no format arguments [-Werror=format-security]
+|      fprintf (stderr, _("Type each input string on a line by itself, "
+|      ^~~~~~~
+| ../../libidn-1.32/src/idn.c:202:4: error: format not a string literal and no format arguments [-Werror=format-security]
+|     error (EXIT_FAILURE, errno, _("input error"));
+|     ^~~~~
+| ../../libidn-1.32/src/idn.c:220:8: error: format not a string literal and no format arguments [-Werror=format-security]
+|         _("could not convert from UTF-8 to UCS-4"));
+|         ^
+| ../../libidn-1.32/src/idn.c:245:8: error: format not a string literal and no format arguments [-Werror=format-security]
+|         _("could not convert from UTF-8 to UCS-4"));
+|         ^
+| ../../libidn-1.32/src/idn.c:281:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       _("could not convert from UTF-8 to UCS-4"));
+|       ^
+| ../../libidn-1.32/src/idn.c:340:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       _("could not convert from UCS-4 to UTF-8"));
+|       ^
+| ../../libidn-1.32/src/idn.c:364:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       _("could not convert from UCS-4 to UTF-8"));
+|       ^
+| ../../libidn-1.32/src/idn.c:442:8: error: format not a string literal and no format arguments [-Werror=format-security]
+|         _("could not convert from UCS-4 to UTF-8"));
+|         ^
+| ../../libidn-1.32/src/idn.c:498:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       _("could not convert from UTF-8 to UCS-4"));
+|       ^
+| ../../libidn-1.32/src/idn.c:527:5: error: format not a string literal and no format arguments [-Werror=format-security]
+|      _("could not convert from UTF-8 to UCS-4"));
+|      ^
+| ../../libidn-1.32/src/idn.c:540:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       error (EXIT_FAILURE, 0, _("could not do NFKC normalization"));
+|       ^~~~~
+| ../../libidn-1.32/src/idn.c:551:5: error: format not a string literal and no format arguments [-Werror=format-security]
+|      _("could not convert from UTF-8 to UCS-4"));
+|      ^
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+Upstream-Status: Pending
+
+ src/idn.c | 27 ++++++++++++++-------------
+ 1 file changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/src/idn.c b/src/idn.c
+index be1c7d1..68e4291 100644
+--- a/src/idn.c
++++ b/src/idn.c
+@@ -170,7 +170,7 @@ main (int argc, char *argv[])
+       (args_info.idna_to_unicode_given ? 1 : 0) +
+       (args_info.nfkc_given ? 1 : 0) != 1)
+     {
+-      error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be specified"));
++      error (0, 0, "%s", _("only one of -s, -e, -d, -a, -u or -n can be specified"));
+       usage (EXIT_FAILURE);
+     }
+ 
+@@ -185,7 +185,7 @@ main (int argc, char *argv[])
+   if (!args_info.quiet_given
+       && args_info.inputs_num == 0
+       && isatty (fileno (stdin)))
+-    fprintf (stderr, _("Type each input string on a line by itself, "
++    fprintf (stderr, "%s", _("Type each input string on a line by itself, "
+ 		       "terminated by a newline character.\n"));
+ 
+   do
+@@ -197,7 +197,7 @@ main (int argc, char *argv[])
+ 	  if (feof (stdin))
+ 	    break;
+ 
+-	  error (EXIT_FAILURE, errno, _("input error"));
++	  error (EXIT_FAILURE, errno, "%s", _("input error"));
+ 	}
+ 
+       if (strlen (line) > 0)
+@@ -215,7 +215,7 @@ main (int argc, char *argv[])
+ 	  if (!q)
+ 	    {
+ 	      free (p);
+-	      error (EXIT_FAILURE, 0,
++	      error (EXIT_FAILURE, 0, "%s",
+ 		     _("could not convert from UTF-8 to UCS-4"));
+ 	    }
+ 
+@@ -240,7 +240,7 @@ main (int argc, char *argv[])
+ 	  if (!q)
+ 	    {
+ 	      free (r);
+-	      error (EXIT_FAILURE, 0,
++	      error (EXIT_FAILURE, 0, "%s",
+ 		     _("could not convert from UTF-8 to UCS-4"));
+ 	    }
+ 
+@@ -277,7 +277,7 @@ main (int argc, char *argv[])
+ 	  q = stringprep_utf8_to_ucs4 (p, -1, &len);
+ 	  free (p);
+ 	  if (!q)
+-	    error (EXIT_FAILURE, 0,
++	    error (EXIT_FAILURE, 0, "%s",
+ 		   _("could not convert from UTF-8 to UCS-4"));
+ 
+ 	  if (args_info.debug_given)
+@@ -336,7 +336,7 @@ main (int argc, char *argv[])
+ 	  r = stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
+ 	  free (q);
+ 	  if (!r)
+-	    error (EXIT_FAILURE, 0,
++	    error (EXIT_FAILURE, 0, "%s",
+ 		   _("could not convert from UCS-4 to UTF-8"));
+ 
+ 	  p = stringprep_utf8_to_locale (r);
+@@ -360,7 +360,7 @@ main (int argc, char *argv[])
+ 	  q = stringprep_utf8_to_ucs4 (p, -1, NULL);
+ 	  free (p);
+ 	  if (!q)
+-	    error (EXIT_FAILURE, 0,
++	    error (EXIT_FAILURE, 0, "%s",
+ 		   _("could not convert from UCS-4 to UTF-8"));
+ 
+ 	  if (args_info.debug_given)
+@@ -438,7 +438,7 @@ main (int argc, char *argv[])
+ 	  if (!q)
+ 	    {
+ 	      free (p);
+-	      error (EXIT_FAILURE, 0,
++	      error (EXIT_FAILURE, 0, "%s",
+ 		     _("could not convert from UCS-4 to UTF-8"));
+ 	    }
+ 
+@@ -494,7 +494,7 @@ main (int argc, char *argv[])
+ 	  r = stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
+ 	  free (q);
+ 	  if (!r)
+-	    error (EXIT_FAILURE, 0,
++	    error (EXIT_FAILURE, 0, "%s",
+ 		   _("could not convert from UTF-8 to UCS-4"));
+ 
+ 	  p = stringprep_utf8_to_locale (r);
+@@ -523,7 +523,7 @@ main (int argc, char *argv[])
+ 	      if (!q)
+ 		{
+ 		  free (p);
+-		  error (EXIT_FAILURE, 0,
++		  error (EXIT_FAILURE, 0, "%s",
+ 			 _("could not convert from UTF-8 to UCS-4"));
+ 		}
+ 
+@@ -537,7 +537,8 @@ main (int argc, char *argv[])
+ 	  r = stringprep_utf8_nfkc_normalize (p, -1);
+ 	  free (p);
+ 	  if (!r)
+-	    error (EXIT_FAILURE, 0, _("could not do NFKC normalization"));
++	    error (EXIT_FAILURE, 0, "%s",
++		   _("could not do NFKC normalization"));
+ 
+ 	  if (args_info.debug_given)
+ 	    {
+@@ -547,7 +548,7 @@ main (int argc, char *argv[])
+ 	      if (!q)
+ 		{
+ 		  free (r);
+-		  error (EXIT_FAILURE, 0,
++		  error (EXIT_FAILURE, 0, "%s",
+ 			 _("could not convert from UTF-8 to UCS-4"));
+ 		}
+ 
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch b/meta-oe/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
new file mode 100644
index 000000000..43bd23294
--- /dev/null
+++ b/meta-oe/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
@@ -0,0 +1,34 @@
+From cdd9e2e960eeb4eda7b08f0113d0cd03524c1d45 Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Tue, 10 Jul 2012 02:44:30 -0700
+Subject: [PATCH] libidn: fix build with automake 1.12
+
+Upstream-Status: Inappropriate
+
+automake 1.12.x has deprecated AM_PROG_MKDIR_P , and throws a warning for that,
+and the warnings are treated as errors because of the -Werror parameter.
+
+These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has not
+eliminated these deprecated macros yet. So disable the treatment of warnings
+as errors until gettext is updated to remove the deprecated macros.
+
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/10
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 261dad2..c4f935e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,7 +22,7 @@ AC_INIT([GNU Libidn], [1.34], [bug-libidn@gnu.org])
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_HEADERS(config.h)
+-AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-override])
++AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+ # Library code modified:                              REVISION++
diff --git a/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
new file mode 100644
index 000000000..0863530f2
--- /dev/null
+++ b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurdd libidn-1.26/doc/Makefile.am libidn-1.26/doc/Makefile.am
+--- libidn-1.26/doc/Makefile.am	2012-09-18 11:25:45.000000000 +0300
++++ libidn-1.26/doc/Makefile.am	2013-02-08 07:41:24.591431462 +0200
+@@ -49,15 +49,9 @@
+
+ # Man pages.
+
+-dist_man_MANS = idn.1 $(gdoc_MANS)
++dist_man_MANS = $(gdoc_MANS)
+ MAINTAINERCLEANFILES = $(dist_man_MANS)
+
+-idn.1: $(top_srcdir)/src/idn.c $(top_srcdir)/src/idn.ggo \
+-		$(top_srcdir)/configure.ac
+-	$(HELP2MAN) \
+-		--name="Internationalized Domain Names command line tool" \
+-		--output=$@ $(top_builddir)/src/idn$(EXEEXT)
+-
+ # GDOC
+
+ GDOC_BIN = $(srcdir)/gdoc
diff --git a/meta-oe/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch b/meta-oe/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
new file mode 100644
index 000000000..3c0559e34
--- /dev/null
+++ b/meta-oe/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
@@ -0,0 +1,35 @@
+From d4f64b78419139eda3c0e1c6ee116bb5f70ea67c Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Wed, 2 May 2012 18:05:19 -0700
+Subject: [PATCH] libtasn1: fix build with automake 1.12
+
+Upstream-Status: Pending
+
+This patch fixes following issue with automake 1.12
+
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libidn.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8297649..7b9626e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,6 +33,10 @@ AC_SUBST(LT_CURRENT, 18)
+ AC_SUBST(LT_REVISION, 0)
+ AC_SUBST(LT_AGE, 6)
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
+ AC_PROG_CC
+ gl_EARLY
+ lgl_EARLY
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.35.bb b/meta-oe/recipes-extended/libidn/libidn_1.35.bb
new file mode 100644
index 000000000..d5ce5b46b
--- /dev/null
+++ b/meta-oe/recipes-extended/libidn/libidn_1.35.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Internationalized Domain Name support library"
+DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
+HOMEPAGE = "http://www.gnu.org/software/libidn/"
+SECTION = "libs"
+LICENSE = "(LGPLv2.1+ | LGPLv3) & GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=df4be47940a91ee69556f5f71eed4aec \
+                    file://COPYING.LESSERv2;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://lib/idna.h;endline=21;md5=37cffad24807f446a24de3e7371f20b9 \
+                    file://src/idn.c;endline=20;md5=09e97034a8877b3451cb65065fc2c06e"
+DEPENDS = "virtual/libiconv autoconf-archive"
+
+inherit pkgconfig autotools gettext texinfo gtk-doc
+
+SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
+           file://libidn_fix_for_automake-1.12.patch \
+           file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
+           file://dont-depend-on-help2man.patch \
+           file://0001-idn-format-security-warnings.patch \
+           "
+
+SRC_URI[md5sum] = "bef634141fe39326cb354b75e891fead"
+SRC_URI[sha256sum] = "f11af1005b46b7b15d057d7f107315a1ad46935c7fcdf243c16e46ec14f0fe1e"
+
+# command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
+# so package command into a separate package
+PACKAGES =+ "idn"
+FILES_idn = "${bindir}/*"
+
+LICENSE_${PN} = "LGPLv2.1+ | LGPLv3"
+LICENSE_idn = "GPLv3+"
+
+EXTRA_OECONF = "--disable-csharp"
+
+do_install_append() {
+	rm -rf ${D}${datadir}/emacs
+}
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.17.1


