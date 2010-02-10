Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfIwH-00068b-Ja
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:13:36 +0100
Received: by fxm25 with SMTP id 25so402470fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=HwEvnLsNGAHlcgWUGZyi6pPqCJ+DYtNcVGlrGtOygQw=;
	b=DL8tXSLKhUoe648ICNQgRBy31kemOlPV+0BDmLQhEYqKMP66KCi2IfPVPqP2n1h6cA
	om2WtOqCYJ3TiX7QsJClvrJQqKHR0XPIRPTqjALF3MiHi+mBAmJpX/gSs8k4Et1l6zDN
	v0iPq+d3lk00HFKu+aVittR+FL3aiQxWUZioQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oZcfInKA04Q7gXXmdURRJ5DAAH07qOcYTjP/qQr2IbM+4Q4WmME5DXGs1DBPLv3X8u
	vAwbDkIFb4iym3qknY3m8qUqkfgmL7g4GgqS9hyayA73k7/KWwmm2RTFVyVvdqYdKcFR
	OmUU0ujriQXvhoEr+uQvvwB7c1tlzBVAivJ/g=
Received: by 10.223.94.201 with SMTP id a9mr904288fan.78.1265832655272;
	Wed, 10 Feb 2010 12:10:55 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 18sm2614298fkq.11.2010.02.10.12.10.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:10:53 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfIvm-0005CY-7m; Wed, 10 Feb 2010 21:13:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:12:59 +0100
Message-Id: <1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 7/8] autoconf: add 2.65
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Feb 2010 20:13:36 -0000

xz needs >= 2.64
Also add patches to recognize BusyBox versions of programs.
Add patch for gettext-0.17 to nop out m4_copy on autoconf > 2.63

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../autoheader-nonfatal-warnings.patch             |   13 ++
 .../autoconf-2.65/autoreconf-exclude.patch         |  123 ++++++++++++++++++++
 .../autoconf-2.65/autoreconf-foreign.patch         |   11 ++
 .../autoconf-2.65/autoreconf-gnuconfigize.patch    |   30 +++++
 recipes/autoconf/autoconf-2.65/config-site.patch   |   11 ++
 recipes/autoconf/autoconf-2.65/fix_path_xtra.patch |  111 ++++++++++++++++++
 recipes/autoconf/autoconf-2.65/program-GNU.patch   |   13 ++
 recipes/autoconf/autoconf-2.65/program-mkdir.patch |   11 ++
 .../autoconf/autoconf-2.65/program_prefix.patch    |   19 +++
 recipes/autoconf/autoconf-native_2.65.bb           |   12 ++
 recipes/autoconf/autoconf_2.65.bb                  |   15 +++
 recipes/gettext/gettext-0.17/m4_copy.patch         |   52 ++++++++
 recipes/gettext/gettext_0.17.bb                    |    1 +
 13 files changed, 422 insertions(+), 0 deletions(-)
 create mode 100644 recipes/autoconf/autoconf-2.65/autoheader-nonfatal-warnings.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/autoreconf-exclude.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/autoreconf-foreign.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/autoreconf-gnuconfigize.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/config-site.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/fix_path_xtra.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/program-GNU.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/program-mkdir.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/program_prefix.patch
 create mode 100644 recipes/autoconf/autoconf-native_2.65.bb
 create mode 100644 recipes/autoconf/autoconf_2.65.bb
 create mode 100644 recipes/gettext/gettext-0.17/m4_copy.patch

diff --git a/recipes/autoconf/autoconf-2.65/autoheader-nonfatal-warnings.patch b/recipes/autoconf/autoconf-2.65/autoheader-nonfatal-warnings.patch
new file mode 100644
index 0000000..1f18e04
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/autoheader-nonfatal-warnings.patch
@@ -0,0 +1,13 @@
+--- autoconf-2.59/bin/autoheader.in~	2003-10-10 14:52:56.000000000 +0100
++++ autoconf-2.59/bin/autoheader.in	2004-05-03 01:36:45.000000000 +0100
+@@ -272,8 +272,8 @@
+ 	}
+ 
+     }
+-  exit 1
+-    if keys %symbol;
++#  exit 1
++#    if keys %symbol;
+ }
+ 
+ update_file ("$tmp/config.hin", "$config_h_in");
diff --git a/recipes/autoconf/autoconf-2.65/autoreconf-exclude.patch b/recipes/autoconf/autoconf-2.65/autoreconf-exclude.patch
new file mode 100644
index 0000000..2eaf8d9
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/autoreconf-exclude.patch
@@ -0,0 +1,123 @@
+--- /tmp/autoreconf.in	2009-06-02 11:59:05.000000000 +0200
++++ autoconf-2.63/bin/autoreconf.in	2009-06-02 12:09:03.000000000 +0200
+@@ -76,6 +76,7 @@
+   -i, --install            copy missing auxiliary files
+       --no-recursive       don't rebuild sub-packages
+   -s, --symlink            with -i, install symbolic links instead of copies
++  -x, --exclude=STEPS      steps we should not run
+   -m, --make               when applicable, re-run ./configure && make
+   -W, --warnings=CATEGORY  report the warnings falling in CATEGORY [syntax]
+ 
+@@ -136,6 +137,13 @@
+ # Recurse into subpackages
+ my $recursive = 1;
+ 
++# Steps to exclude
++my @exclude;
++my @ex;
++
++my $uses_gettext;
++my $configure_ac;
++
+ ## ---------- ##
+ ## Routines.  ##
+ ## ---------- ##
+@@ -153,6 +161,7 @@
+ 	  'B|prepend-include=s'	 => \@prepend_include,
+ 	  'i|install'            => \$install,
+ 	  's|symlink'            => \$symlink,
++	  'x|exclude=s'          => \@exclude,
+ 	  'm|make'               => \$run_make,
+ 	  'recursive!'           => \$recursive);
+ 
+@@ -162,6 +171,8 @@
+   parse_WARNINGS;
+   parse_warnings '--warnings', @warning;
+ 
++  @exclude = map { split /,/ } @exclude;
++
+   # Even if the user specified a configure.ac, trim to get the
+   # directory, and look for configure.ac again.  Because (i) the code
+   # is simpler, and (ii) we are still able to diagnose simultaneous
+@@ -190,6 +201,7 @@
+   $autoconf   .= join (' --prepend-include=', '', map { shell_quote ($_) } @prepend_include);
+   $autoheader .= join (' --include=', '', map { shell_quote ($_) } @include);
+   $autoheader .= join (' --prepend-include=', '', map { shell_quote ($_) } @prepend_include);
++  $aclocal    .= join (' -I ', '', @include);
+ 
+   # --install and --symlink;
+   if ($install)
+@@ -254,6 +266,11 @@
+ {
+   my ($aclocal, $flags) = @_;
+ 
++  @ex = grep (/^aclocal$/, @exclude);
++  if ($#ex != -1) {
++    return;
++  }
++
+   # aclocal 1.8+ does all this for free.  It can be recognized by its
+   # --force support.
+   if ($aclocal_supports_force)
+@@ -367,8 +384,11 @@
+     }
+   else
+     {
+-      xsystem_hint ("autopoint is needed because this package uses Gettext", "$autopoint");
+-    }
++      @ex = grep (/^autopoint$/, @exclude);
++      if ($#ex == -1) {
++            xsystem_hint ("autopoint is needed because this package uses Gettext", "$autopoint");
++      }
++  }
+ 
+ 
+   # ----------------- #
+@@ -531,7 +551,10 @@
+ 	{
+ 	  $libtoolize .= " --ltdl";
+ 	}
+-      xsystem_hint ("libtoolize is needed because this package uses Libtool", $libtoolize);
++      @ex = grep (/^libtoolize$/, @exclude);
++      if ($#ex == -1) {
++        xsystem_hint ("libtoolize is needed because this package uses Libtool", $libtoolize);
++      }
+       $rerun_aclocal = 1;
+     }
+   else
+@@ -592,7 +615,10 @@
+     }
+   else
+     {
+-      xsystem ($autoheader);
++      @ex = grep (/^autoheader$/, @exclude);
++      if ($#ex == -1) {
++        xsystem ("$autoheader");
++      }
+     }
+ 
+ 
+@@ -609,7 +635,10 @@
+       # We should always run automake, and let it decide whether it shall
+       # update the file or not.  In fact, the effect of `$force' is already
+       # included in `$automake' via `--no-force'.
+-      xsystem ($automake);
++      @ex = grep (/^automake$/, @exclude);
++      if ($#ex == -1) {
++        xsystem ("$automake");
++      }
+     }
+ 
+ 
+@@ -633,7 +662,10 @@
+ 	    }
+ 	  else
+ 	    {
+-	      xsystem ("$make");
++              @ex = grep (/^make$/, @exclude);
++              if ($#ex == -1) {
++                xsystem ("make");
++              }
+ 	    }
+ 	}
+     }
diff --git a/recipes/autoconf/autoconf-2.65/autoreconf-foreign.patch b/recipes/autoconf/autoconf-2.65/autoreconf-foreign.patch
new file mode 100644
index 0000000..587a823
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/autoreconf-foreign.patch
@@ -0,0 +1,11 @@
+--- autoconf-2.59/bin/autoreconf.in~autoreconf-foreign	2004-05-09 20:55:06.000000000 -0400
++++ autoconf-2.59/bin/autoreconf.in	2004-05-09 20:55:55.000000000 -0400
+@@ -184,6 +184,8 @@
+ 
+   $aclocal_supports_force = `$aclocal --help` =~ /--force/;
+ 
++  $automake   .= ' --foreign';
++
+   # Dispatch autoreconf's option to the tools.
+   # --include;
+   $autoconf   .= join (' --include=', '', @include);
diff --git a/recipes/autoconf/autoconf-2.65/autoreconf-gnuconfigize.patch b/recipes/autoconf/autoconf-2.65/autoreconf-gnuconfigize.patch
new file mode 100644
index 0000000..beeb4c7
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/autoreconf-gnuconfigize.patch
@@ -0,0 +1,30 @@
+--- /tmp/autoreconf.in	2009-06-02 13:10:42.000000000 +0200
++++ autoconf-2.63/bin/autoreconf.in	2009-06-02 13:12:28.000000000 +0200
+@@ -58,7 +58,7 @@
+ $help = "Usage: $0 [OPTION]... [DIRECTORY]...
+ 
+ Run `autoconf' (and `autoheader', `aclocal', `automake', `autopoint'
+-(formerly `gettextize'), and `libtoolize' where appropriate)
++(formerly `gettextize'), `libtoolize', and `gnu-configize' where appropriate)
+ repeatedly to remake the GNU Build System files in specified
+ DIRECTORIES and their subdirectories (defaulting to `.').
+ 
+@@ -115,6 +115,7 @@
+ my $libtoolize = $ENV{'LIBTOOLIZE'} || 'libtoolize';
+ my $autopoint  = $ENV{'AUTOPOINT'}  || 'autopoint';
+ my $make       = $ENV{'MAKE'}       || 'make';
++my $gnuconfigize  = $ENV{'GNUCONFIGIZE'} || 'gnu-configize';
+ 
+ # --install -- as --add-missing in other tools.
+ my $install = 0;
+@@ -643,6 +644,10 @@
+       }
+     }
+ 
++  @ex = grep (/^gnu-configize$/, @exclude);
++  if ($#ex == -1) {
++    xsystem ("$gnuconfigize");
++  }
+ 
+   # -------------- #
+   # Running make.  #
diff --git a/recipes/autoconf/autoconf-2.65/config-site.patch b/recipes/autoconf/autoconf-2.65/config-site.patch
new file mode 100644
index 0000000..0c66fe3
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/config-site.patch
@@ -0,0 +1,11 @@
+--- /tmp/general.m4	2009-06-02 15:14:15.000000000 +0200
++++ autoconf-2.63/lib/autoconf/general.m4	2009-06-02 15:14:42.000000000 +0200
+@@ -1848,7 +1848,7 @@
+   ac_site_file1=$ac_default_prefix/share/config.site
+   ac_site_file2=$ac_default_prefix/etc/config.site
+ fi
+-for ac_site_file in "$ac_site_file1" "$ac_site_file2"
++for ac_site_file in $ac_site_file1 "$ac_site_file2"
+ do
+   test "x$ac_site_file" = xNONE && continue
+   if test -r "$ac_site_file"; then
diff --git a/recipes/autoconf/autoconf-2.65/fix_path_xtra.patch b/recipes/autoconf/autoconf-2.65/fix_path_xtra.patch
new file mode 100644
index 0000000..36043cb
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/fix_path_xtra.patch
@@ -0,0 +1,111 @@
+diff -rdup autoconf-2.64.oorig/lib/autoconf/libs.m4 autoconf-2.64/lib/autoconf/libs.m4
+--- autoconf-2.64.oorig/lib/autoconf/libs.m4	2009-05-13 14:29:15.000000000 +0200
++++ autoconf-2.64/lib/autoconf/libs.m4	2009-10-23 19:16:45.000000000 +0200
+@@ -180,53 +180,6 @@ m4_popdef([AC_Lib_Name])dnl
+ # --------------------- #
+ 
+ 
+-# _AC_PATH_X_XMKMF
+-# ----------------
+-# Internal subroutine of _AC_PATH_X.
+-# Set ac_x_includes and/or ac_x_libraries.
+-m4_define([_AC_PATH_X_XMKMF],
+-[AC_ARG_VAR(XMKMF, [Path to xmkmf, Makefile generator for X Window System])dnl
+-rm -f -r conftest.dir
+-if mkdir conftest.dir; then
+-  cd conftest.dir
+-  cat >Imakefile <<'_ACEOF'
+-incroot:
+-	@echo incroot='${INCROOT}'
+-usrlibdir:
+-	@echo usrlibdir='${USRLIBDIR}'
+-libdir:
+-	@echo libdir='${LIBDIR}'
+-_ACEOF
+-  if (export CC; ${XMKMF-xmkmf}) >/dev/null 2>/dev/null && test -f Makefile; then
+-    # GNU make sometimes prints "make[1]: Entering...", which would confuse us.
+-    for ac_var in incroot usrlibdir libdir; do
+-      eval "ac_im_$ac_var=\`\${MAKE-make} $ac_var 2>/dev/null | sed -n 's/^$ac_var=//p'\`"
+-    done
+-    # Open Windows xmkmf reportedly sets LIBDIR instead of USRLIBDIR.
+-    for ac_extension in a so sl dylib la dll; do
+-      if test ! -f "$ac_im_usrlibdir/libX11.$ac_extension" &&
+-	 test -f "$ac_im_libdir/libX11.$ac_extension"; then
+-	ac_im_usrlibdir=$ac_im_libdir; break
+-      fi
+-    done
+-    # Screen out bogus values from the imake configuration.  They are
+-    # bogus both because they are the default anyway, and because
+-    # using them would break gcc on systems where it needs fixed includes.
+-    case $ac_im_incroot in
+-	/usr/include) ac_x_includes= ;;
+-	*) test -f "$ac_im_incroot/X11/Xos.h" && ac_x_includes=$ac_im_incroot;;
+-    esac
+-    case $ac_im_usrlibdir in
+-	/usr/lib | /usr/lib64 | /lib | /lib64) ;;
+-	*) test -d "$ac_im_usrlibdir" && ac_x_libraries=$ac_im_usrlibdir ;;
+-    esac
+-  fi
+-  cd ..
+-  rm -f -r conftest.dir
+-fi
+-])# _AC_PATH_X_XMKMF
+-
+-
+ # _AC_PATH_X_DIRECT
+ # -----------------
+ # Internal subroutine of _AC_PATH_X.
+@@ -234,44 +187,7 @@ fi
+ m4_define([_AC_PATH_X_DIRECT],
+ [# Standard set of common directories for X headers.
+ # Check X11 before X11Rn because it is often a symlink to the current release.
+-ac_x_header_dirs='
+-/usr/X11/include
+-/usr/X11R7/include
+-/usr/X11R6/include
+-/usr/X11R5/include
+-/usr/X11R4/include
+-
+-/usr/include/X11
+-/usr/include/X11R7
+-/usr/include/X11R6
+-/usr/include/X11R5
+-/usr/include/X11R4
+-
+-/usr/local/X11/include
+-/usr/local/X11R7/include
+-/usr/local/X11R6/include
+-/usr/local/X11R5/include
+-/usr/local/X11R4/include
+-
+-/usr/local/include/X11
+-/usr/local/include/X11R7
+-/usr/local/include/X11R6
+-/usr/local/include/X11R5
+-/usr/local/include/X11R4
+-
+-/usr/X386/include
+-/usr/x386/include
+-/usr/XFree86/include/X11
+-
+-/usr/include
+-/usr/local/include
+-/usr/unsupported/include
+-/usr/athena/include
+-/usr/local/x11r5/include
+-/usr/lpp/Xamples/include
+-
+-/usr/openwin/include
+-/usr/openwin/share/include'
++ac_x_header_dirs=''
+ 
+ if test "$ac_x_includes" = no; then
+   # Guess where to find include files, by looking for Xlib.h.
+@@ -320,7 +236,6 @@ AC_DEFUN([_AC_PATH_X],
+ [AC_CACHE_VAL(ac_cv_have_x,
+ [# One or both of the vars are not set, and there is no cached value.
+ ac_x_includes=no ac_x_libraries=no
+-_AC_PATH_X_XMKMF
+ _AC_PATH_X_DIRECT
+ case $ac_x_includes,$ac_x_libraries in #(
+   no,* | *,no | *\'*)
diff --git a/recipes/autoconf/autoconf-2.65/program-GNU.patch b/recipes/autoconf/autoconf-2.65/program-GNU.patch
new file mode 100644
index 0000000..6db0b96
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/program-GNU.patch
@@ -0,0 +1,13 @@
+diff -rdup autoconf-2.64.oorig/lib/autoconf/programs.m4 autoconf-2.64/lib/autoconf/programs.m4
+--- autoconf-2.64.oorig/lib/autoconf/programs.m4	2009-10-29 20:41:30.000000000 +0100
++++ autoconf-2.64/lib/autoconf/programs.m4	2009-10-29 20:42:04.000000000 +0100
+@@ -532,7 +532,8 @@ dnl   # for best performing tool in a li
+ m4_define([_AC_PATH_PROG_FLAVOR_GNU],
+ [# Check for GNU $1
+ case `"$1" --version 2>&1` in
+-*GNU*)
++*GNU* | \
++*'BusyBox v'*)
+   $2;;
+ m4_ifval([$3],
+ [*)
diff --git a/recipes/autoconf/autoconf-2.65/program-mkdir.patch b/recipes/autoconf/autoconf-2.65/program-mkdir.patch
new file mode 100644
index 0000000..efc3c1b
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/program-mkdir.patch
@@ -0,0 +1,11 @@
+diff -rdup autoconf-2.64.oorig/lib/autoconf/programs.m4 autoconf-2.64/lib/autoconf/programs.m4
+--- autoconf-2.64.oorig/lib/autoconf/programs.m4	2009-05-13 14:29:15.000000000 +0200
++++ autoconf-2.64/lib/autoconf/programs.m4	2009-10-29 18:39:06.000000000 +0100
+@@ -696,6 +696,7 @@ if test -z "$MKDIR_P"; then
+ 	   case `"$as_dir/$ac_prog$ac_exec_ext" --version 2>&1` in #(
+ 	     'mkdir (GNU coreutils) '* | \
+ 	     'mkdir (coreutils) '* | \
++	     *'BusyBox v'* | \
+ 	     'mkdir (fileutils) '4.1*)
+ 	       ac_cv_path_mkdir=$as_dir/$ac_prog$ac_exec_ext
+ 	       break 3;;
diff --git a/recipes/autoconf/autoconf-2.65/program_prefix.patch b/recipes/autoconf/autoconf-2.65/program_prefix.patch
new file mode 100644
index 0000000..e6f4096
--- /dev/null
+++ b/recipes/autoconf/autoconf-2.65/program_prefix.patch
@@ -0,0 +1,19 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+--- autoconf-2.57/lib/autoconf/general.m4~program_prefix
++++ autoconf-2.57/lib/autoconf/general.m4
+@@ -1676,8 +1676,9 @@
+ # The aliases save the names the user supplied, while $host etc.
+ # will get canonicalized.
+ test -n "$target_alias" &&
+-  test "$program_prefix$program_suffix$program_transform_name" = \
+-    NONENONEs,x,x, &&
++  test "$target_alias" != "$host_alias" &&
++    test "$program_prefix$program_suffix$program_transform_name" = \
++      NONENONEs,x,x, &&
+   program_prefix=${target_alias}-[]dnl
+ ])# AC_CANONICAL_TARGET
+ 
diff --git a/recipes/autoconf/autoconf-native_2.65.bb b/recipes/autoconf/autoconf-native_2.65.bb
new file mode 100644
index 0000000..b7480cd
--- /dev/null
+++ b/recipes/autoconf/autoconf-native_2.65.bb
@@ -0,0 +1,12 @@
+require autoconf_${PV}.bb
+PR = "${INC_PR}.0"
+
+DEPENDS = "m4-native gnu-config-native"
+RDEPENDS_${PN} = "m4-native gnu-config-native"
+
+SRC_URI += "file://fix_path_xtra.patch;patch=1"
+
+S = "${WORKDIR}/autoconf-${PV}"
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/autoconf-${PV}"
+
+inherit native
diff --git a/recipes/autoconf/autoconf_2.65.bb b/recipes/autoconf/autoconf_2.65.bb
new file mode 100644
index 0000000..42c69c7
--- /dev/null
+++ b/recipes/autoconf/autoconf_2.65.bb
@@ -0,0 +1,15 @@
+require autoconf.inc
+
+PR = "${INC_PR}.0"
+
+PARALLEL_MAKE = ""
+
+SRC_URI += "file://autoreconf-exclude.patch;patch=1 \
+	    file://autoreconf-foreign.patch;patch=1 \
+	    file://autoheader-nonfatal-warnings.patch;patch=1 \
+	    file://autoreconf-gnuconfigize.patch;patch=1 \
+	    file://config-site.patch;patch=1 \
+            file://program-mkdir.patch;patch=1 \
+            file://program-GNU.patch;patch=1"
+SRC_URI[autoconf.md5sum] = "a6de1cc6434cd64038b0a0ae4e252b33"
+SRC_URI[autoconf.sha256sum] = "db11944057f3faf229ff5d6ce3fcd819f565455c152b72cec17ebc1cbb80136b"
diff --git a/recipes/gettext/gettext-0.17/m4_copy.patch b/recipes/gettext/gettext-0.17/m4_copy.patch
new file mode 100644
index 0000000..8f693b0
--- /dev/null
+++ b/recipes/gettext/gettext-0.17/m4_copy.patch
@@ -0,0 +1,52 @@
+Re: _AC_LANG_OPENMP and m4_copy
+
+Bruno Haible
+Wed, 03 Dec 2008 16:33:38 -0800
+
+Hello Ralf,
+
+Thanks for the report and fix.
+
+Eric Blake wrote:
+> Looks fine to me, but let Bruno chime in before committing.  I agree with
+> your approach of fixing gnulib to avoid the problem by not competing when
+> a new-enough autoconf provides the macro
+
+I agree with this approach. But the patch introduces the use of another
+undocumented macro, namely 'm4_version_prereq'. I prefer to get away without
+it, and am committing this:
+
+
+2008-12-03  Ralf Wildenhues  <[EMAIL PROTECTED]>
+            Bruno Haible  <[EMAIL PROTECTED]>
+
+        * m4/openmp.m4 (AC_OPENMP): Do not define with Autoconf 2.62 or newer.
+
+
+--- gettext-0.17.old/gettext-tools/gnulib-m4/openmp.m4	2007-05-27 21:50:22.000000000 +0200
++++ gettext-0.17/gettext-tools/gnulib-m4/openmp.m4	2010-02-10 16:48:58.000000000 +0100
+@@ -1,11 +1,15 @@
+-# openmp.m4 serial 4
+-dnl Copyright (C) 2006-2007 Free Software Foundation, Inc.
++# openmp.m4 serial 5
++dnl Copyright (C) 2006-2008 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+ dnl with or without modifications, as long as this notice is preserved.
+ 
+ dnl This file can be removed once we assume autoconf >= 2.62.
+ 
++dnl Expand to nothing in autoconf >= 2.62. m4_copy has a different
++dnl semantic in autoconf > 2.63.
++m4_ifdef([AC_OPENMP], [], [
++
+ # _AC_LANG_OPENMP
+ # ---------------
+ # Expands to some language dependent source code for testing the presence of
+@@ -90,3 +94,6 @@
+   fi
+   AC_SUBST([OPENMP_]_AC_LANG_PREFIX[FLAGS])
+ ])
++
++])
++
diff --git a/recipes/gettext/gettext_0.17.bb b/recipes/gettext/gettext_0.17.bb
index 2f7faa7..cb3a48b 100644
--- a/recipes/gettext/gettext_0.17.bb
+++ b/recipes/gettext/gettext_0.17.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://wchar-uclibc.patch;patch=1 \
 	   file://use_open_properly.patch;patch=1 \
 	   file://gettext-autoconf-lib-link-no-L.patch;patch=1 \
+	   file://m4_copy.patch;patch=1 \
 	  "
 
 SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
-- 
1.6.5



