Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48oR-0004Gt-Nm
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:55:56 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD0032ACN5BL6X@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:54:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7009114AF60; Sat,
	31 Oct 2009 03:54:41 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:54:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031075441.GJ16188@denix.org>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1256726758-22996-5-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1256726758-22996-5-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH 4/6] remove install-native package
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
X-List-Received-Date: Sat, 31 Oct 2009 07:55:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 28, 2009 at 11:45:56AM +0100, Marcin Juszkiewicz wrote:
> From: Roman I Khimov <khimov@altell.ru>
> 
> Sane 'install' program is provided by coreutils-native now.
> 
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  conf/distro/include/preferred-om-2008-versions.inc |    1 -
>  recipes/beep/beep_1.2.2.bb                         |    1 -
>  recipes/callweaver/callweaver-perl.bb              |    1 -
>  recipes/cron/cron_3.0pl1.bb                        |    1 -
>  recipes/cups/cups.inc                              |    2 +-
>  recipes/cups/cups_1.1.23.bb                        |    2 +-
>  recipes/cups/cups_1.2.7.bb                         |    2 +-
>  recipes/cyrus-imapd/cyrus-imapd_2.2.12.bb          |    1 -
>  recipes/gnome/libart-lgpl.inc                      |    2 -
>  recipes/install/files/install-sh                   |  334 --------------------
>  recipes/install/install-native_0.1.bb              |   27 --
>  recipes/netpbm/netpbm_10.28.bb                     |    2 +-
>  12 files changed, 4 insertions(+), 372 deletions(-)
>  delete mode 100644 recipes/install/files/install-sh
>  delete mode 100644 recipes/install/install-native_0.1.bb
> 
> diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
> index 55d5136..56354ca 100644
> --- a/conf/distro/include/preferred-om-2008-versions.inc
> +++ b/conf/distro/include/preferred-om-2008-versions.inc
> @@ -712,7 +712,6 @@ PREFERRED_VERSION_inkscape ?= "0.43"
>  PREFERRED_VERSION_inkwp ?= "0.1.1"
>  PREFERRED_VERSION_inotify-tools ?= "2.1"
>  PREFERRED_VERSION_inputproto ?= "1.4.4"
> -PREFERRED_VERSION_install-native ?= "0.1"
>  PREFERRED_VERSION_insttrain ?= "1.0.5"
>  PREFERRED_VERSION_interbench ?= "0.30"
>  PREFERRED_VERSION_intercom ?= "0.15"
> diff --git a/recipes/beep/beep_1.2.2.bb b/recipes/beep/beep_1.2.2.bb
> index 759f74f..e3ffdce 100644
> --- a/recipes/beep/beep_1.2.2.bb
> +++ b/recipes/beep/beep_1.2.2.bb
> @@ -4,7 +4,6 @@ DESCRIPTION = "A console utility to make a beep noise"
>  SECTION = "console/utils"
>  LICENSE = "GPL"
>  PR = "r2"
> -DEPENDS = "install-native"
>  
>  SRC_URI  = "http://johnath.com/beep/beep-${PV}.tar.gz"
>  SRC_URI += "file://linux-input.patch;patch=1"
> diff --git a/recipes/callweaver/callweaver-perl.bb b/recipes/callweaver/callweaver-perl.bb
> index 99e2fb7..7ff077b 100644
> --- a/recipes/callweaver/callweaver-perl.bb
> +++ b/recipes/callweaver/callweaver-perl.bb
> @@ -2,7 +2,6 @@ DESCRIPTION = "Callweaver::OGI Perl Gateway Interface Module"
>  HOMEPAGE = "http://www.callweaver.org"
>  SECTION = "libs"
>  LICENSE = "GPL"
> -DEPENDS = "install-native"
>  RDEPENDS = "perl callweaver-ogi"
>  PR = "r0"
>  S = "${WORKDIR}/callweaver-1.2-${CWRCV}/contrib/ogi-perl/callweaver-perl-0.0.1"
> diff --git a/recipes/cron/cron_3.0pl1.bb b/recipes/cron/cron_3.0pl1.bb
> index f7c2ccc..ff1d380 100644
> --- a/recipes/cron/cron_3.0pl1.bb
> +++ b/recipes/cron/cron_3.0pl1.bb
> @@ -2,7 +2,6 @@ SECTION = "base"
>  DESCRIPTION = "Vixie cron."
>  LICENSE = "cron"
>  PR ="r8"
> -DEPENDS += "install-native"
>  
>  SRC_URI = "http://ibiblio.org/pub/Linux/system/daemons/cron/cron${PV}.tar.gz \
>  	   file://nonrootinstall.patch;patch=1 \
> diff --git a/recipes/cups/cups.inc b/recipes/cups/cups.inc
> index 59075fb..8e2a7a8 100644
> --- a/recipes/cups/cups.inc
> +++ b/recipes/cups/cups.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "An Internet printing system for Unix."
>  SECTION = "console/utils"
>  LICENSE = "GPL LGPL"
> -DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib install-native fakeroot-native"
> +DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
>  
>  SRC_URI = "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
>  	  "
> diff --git a/recipes/cups/cups_1.1.23.bb b/recipes/cups/cups_1.1.23.bb
> index b17d899..d6f0de8 100644
> --- a/recipes/cups/cups_1.1.23.bb
> +++ b/recipes/cups/cups_1.1.23.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "An Internet printing system for Unix."
>  SECTION = "console/utils"
>  LICENSE = "GPL LGPL"
> -DEPENDS = "openssl jpeg libpng zlib install-native fakeroot-native"
> +DEPENDS = "openssl jpeg libpng zlib fakeroot-native"
>  PR = "r6"
>  
>  SRC_URI = "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
> diff --git a/recipes/cups/cups_1.2.7.bb b/recipes/cups/cups_1.2.7.bb
> index 24249fa..8559bfc 100644
> --- a/recipes/cups/cups_1.2.7.bb
> +++ b/recipes/cups/cups_1.2.7.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "An Internet printing system for Unix."
>  SECTION = "console/utils"
>  LICENSE = "GPL LGPL"
> -DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib install-native fakeroot-native"
> +DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
>  PR = "r1"
>  
>  SRC_URI = "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
> diff --git a/recipes/cyrus-imapd/cyrus-imapd_2.2.12.bb b/recipes/cyrus-imapd/cyrus-imapd_2.2.12.bb
> index e80340f..2247ea9 100644
> --- a/recipes/cyrus-imapd/cyrus-imapd_2.2.12.bb
> +++ b/recipes/cyrus-imapd/cyrus-imapd_2.2.12.bb
> @@ -2,7 +2,6 @@ SECTION = "console/network"
>  DEPENDS = "cyrus-sasl virtual/db"
>  LICENSE = "BSD"
>  PR = "r12"
> -DEPENDS += "install-native"
>  
>  SRC_URI = "ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/cyrus-imapd-${PV}.tar.gz \
>             file://autotools.patch;patch=1 \
> diff --git a/recipes/gnome/libart-lgpl.inc b/recipes/gnome/libart-lgpl.inc
> index 1af5b0e..4dad51e 100644
> --- a/recipes/gnome/libart-lgpl.inc
> +++ b/recipes/gnome/libart-lgpl.inc
> @@ -13,8 +13,6 @@ SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-${
>  
>  inherit autotools pkgconfig
>  
> -DEPENDS = "install-native"
> -
>  FILES_${PN} = "${libdir}/*.so.*"
>  FILES_${PN}-dev += "${bindir}/libart2-config"
>  
> diff --git a/recipes/install/files/install-sh b/recipes/install/files/install-sh
> deleted file mode 100644
> index 8de386e..0000000
> --- a/recipes/install/files/install-sh
> +++ /dev/null
> @@ -1,334 +0,0 @@
> -#!/bin/sh
> -# install - install a program, script, or datafile
> -
> -scriptversion=2004-10-22.00
> -
> -# This originates from X11R5 (mit/util/scripts/install.sh), which was
> -# later released in X11R6 (xc/config/util/install.sh) with the
> -# following copyright and license.
> -#
> -# Copyright (C) 1994 X Consortium
> -#
> -# Permission is hereby granted, free of charge, to any person obtaining a copy
> -# of this software and associated documentation files (the "Software"), to
> -# deal in the Software without restriction, including without limitation the
> -# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> -# sell copies of the Software, and to permit persons to whom the Software is
> -# furnished to do so, subject to the following conditions:
> -#
> -# The above copyright notice and this permission notice shall be included in
> -# all copies or substantial portions of the Software.
> -#
> -# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> -# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> -# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
> -# X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
> -# AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNEC-
> -# TION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> -#
> -# Except as contained in this notice, the name of the X Consortium shall not
> -# be used in advertising or otherwise to promote the sale, use or other deal-
> -# ings in this Software without prior written authorization from the X Consor-
> -# tium.
> -#
> -#
> -# FSF changes to this file are in the public domain.
> -#
> -# Calling this script install-sh is preferred over install.sh, to prevent
> -# `make' implicit rules from creating a file called install from it
> -# when there is no Makefile.
> -#
> -# This script is compatible with the BSD install script, but was written
> -# from scratch.  It can only install one file at a time, a restriction
> -# shared with many OS's install programs.
> -
> -# set DOITPROG to echo to test this script
> -
> -# Don't use :- since 4.3BSD and earlier shells don't like it.
> -doit="${DOITPROG-}"
> -
> -# put in absolute paths if you don't have them in your path; or use env. vars.
> -
> -mvprog="${MVPROG-mv}"
> -cpprog="${CPPROG-cp}"
> -chmodprog="${CHMODPROG-chmod}"
> -chownprog="${CHOWNPROG-chown}"
> -chgrpprog="${CHGRPPROG-chgrp}"
> -stripprog="${STRIPPROG-strip}"
> -rmprog="${RMPROG-rm}"
> -mkdirprog="${MKDIRPROG-mkdir}"
> -
> -chmodcmd="$chmodprog 0755"
> -chowncmd=
> -chgrpcmd=
> -stripcmd=
> -rmcmd="$rmprog -f"
> -mvcmd="$mvprog"
> -src=
> -dst=
> -dir_arg=
> -preserve_arg=
> -dstarg=
> -no_target_directory=
> -
> -usage="Usage: $0 [OPTION]... [-T] SRCFILE DSTFILE
> -   or: $0 [OPTION]... SRCFILES... DIRECTORY
> -   or: $0 [OPTION]... -t DIRECTORY SRCFILES...
> -   or: $0 [OPTION]... -d DIRECTORIES...
> -
> -In the 1st form, copy SRCFILE to DSTFILE.
> -In the 2nd and 3rd, copy all SRCFILES to DIRECTORY.
> -In the 4th, create DIRECTORIES.
> -
> -Options:
> --c         (ignored)
> --D         (ignored)
> --d         create directories instead of installing files.
> --g GROUP   $chgrpprog installed files to GROUP.
> --m MODE    $chmodprog installed files to MODE.
> --o USER    $chownprog installed files to USER.
> --p         apply access/modification times of SRCFILE files
> -           to corresponding DSTFILE files
> --s         $stripprog installed files.
> --t DIRECTORY  install into DIRECTORY.
> --T         report an error if DSTFILE is a directory.
> ---help     display this help and exit.
> ---version  display version info and exit.
> -
> -Environment variables override the default commands:
> -  CHGRPPROG CHMODPROG CHOWNPROG CPPROG MKDIRPROG MVPROG RMPROG STRIPPROG
> -"
> -
> -while test -n "$1"; do
> -  case $1 in
> -    -c) shift
> -        continue;;
> -
> -    -D) shift
> -    	continue;;
> -
> -    -d) dir_arg=true
> -        shift
> -        continue;;
> -
> -    -g) chgrpcmd="$chgrpprog $2"
> -        shift
> -        shift
> -        continue;;
> -
> -    --help) echo "$usage"; exit 0;;
> -
> -    -m) chmodcmd="$chmodprog $2"
> -        shift
> -        shift
> -        continue;;
> -
> -    -o) chowncmd="$chownprog $2"
> -        shift
> -        shift
> -        continue;;
> -
> -    -p) preserve_arg="-p"
> -    	shift
> -	continue;;
> -
> -    -s) stripcmd=$stripprog
> -        shift
> -        continue;;
> -
> -    -t) dstarg=$2
> -	shift
> -	shift
> -	continue;;
> -
> -    -T) no_target_directory=true
> -	shift
> -	continue;;
> -
> -    --version) echo "$0 $scriptversion"; exit 0;;
> -
> -    *)  # When -d is used, all remaining arguments are directories to create.
> -	# When -t is used, the destination is already specified.
> -	test -n "$dir_arg$dstarg" && break
> -        # Otherwise, the last argument is the destination.  Remove it from $@.
> -	for arg
> -	do
> -          if test -n "$dstarg"; then
> -	    # $@ is not empty: it contains at least $arg.
> -	    set fnord "$@" "$dstarg"
> -	    shift # fnord
> -	  fi
> -	  shift # arg
> -	  dstarg=$arg
> -	done
> -	break;;
> -  esac
> -done
> -
> -if test -z "$1"; then
> -  if test -z "$dir_arg"; then
> -    echo "$0: no input file specified." >&2
> -    exit 1
> -  fi
> -  # It's OK to call `install-sh -d' without argument.
> -  # This can happen when creating conditional directories.
> -  exit 0
> -fi
> -
> -for src
> -do
> -  # Protect names starting with `-'.
> -  case $src in
> -    -*) src=./$src ;;
> -  esac
> -
> -  if test -n "$dir_arg"; then
> -    dst=$src
> -    src=
> -
> -    if test -d "$dst"; then
> -      mkdircmd=:
> -      chmodcmd=
> -    else
> -      mkdircmd=$mkdirprog
> -    fi
> -  else
> -    # Waiting for this to be detected by the "$cpprog $src $dsttmp" command
> -    # might cause directories to be created, which would be especially bad
> -    # if $src (and thus $dsttmp) contains '*'.
> -    if test ! -f "$src" && test ! -d "$src"; then
> -      echo "$0: $src does not exist." >&2
> -      exit 1
> -    fi
> -
> -    if test -z "$dstarg"; then
> -      echo "$0: no destination specified." >&2
> -      exit 1
> -    fi
> -
> -    dst=$dstarg
> -    # Protect names starting with `-'.
> -    case $dst in
> -      -*) dst=./$dst ;;
> -    esac
> -
> -    # If destination is a directory, append the input filename; won't work
> -    # if double slashes aren't ignored.
> -    if test -d "$dst"; then
> -      if test -n "$no_target_directory"; then
> -	echo "$0: $dstarg: Is a directory" >&2
> -	exit 1
> -      fi
> -      dst=$dst/`basename "$src"`
> -    fi
> -  fi
> -
> -  # This sed command emulates the dirname command.
> -  dstdir=`echo "$dst" | sed -e 's,/*$,,;s,[^/]*$,,;s,/*$,,;s,^$,.,'`
> -
> -  # Make sure that the destination directory exists.
> -
> -  # Skip lots of stat calls in the usual case.
> -  if test ! -d "$dstdir"; then
> -    defaultIFS='
> -	 '
> -    IFS="${IFS-$defaultIFS}"
> -
> -    oIFS=$IFS
> -    # Some sh's can't handle IFS=/ for some reason.
> -    IFS='%'
> -    set x `echo "$dstdir" | sed -e 's@/@%@g' -e 's@^%@/@'`
> -    shift
> -    IFS=$oIFS
> -
> -    pathcomp=
> -
> -    while test $# -ne 0 ; do
> -      pathcomp=$pathcomp$1
> -      shift
> -      if test ! -d "$pathcomp"; then
> -        $mkdirprog "$pathcomp"
> -	# mkdir can fail with a `File exist' error in case several
> -	# install-sh are creating the directory concurrently.  This
> -	# is OK.
> -	test -d "$pathcomp" || exit
> -      fi
> -      pathcomp=$pathcomp/
> -    done
> -  fi
> -
> -  if test -n "$dir_arg"; then
> -    $doit $mkdircmd "$dst" \
> -      && { test -z "$chowncmd" || $doit $chowncmd "$dst"; } \
> -      && { test -z "$chgrpcmd" || $doit $chgrpcmd "$dst"; } \
> -      && { test -z "$stripcmd" || $doit $stripcmd "$dst"; } \
> -      && { test -z "$chmodcmd" || $doit $chmodcmd "$dst"; }
> -
> -  else
> -    dstfile=`basename "$dst"`
> -
> -    # Make a couple of temp file names in the proper directory.
> -    dsttmp=$dstdir/_inst.$$_
> -    rmtmp=$dstdir/_rm.$$_
> -
> -    # Trap to clean up those temp files at exit.
> -    trap 'ret=$?; rm -f "$dsttmp" "$rmtmp" && exit $ret' 0
> -    trap '(exit $?); exit' 1 2 13 15
> -
> -    # Copy the file name to the temp name.
> -    $doit $cpprog $preserve_arg "$src" "$dsttmp" &&
> -
> -    # and set any options; do chmod last to preserve setuid bits.
> -    #
> -    # If any of these fail, we abort the whole thing.  If we want to
> -    # ignore errors from any of these, just make sure not to ignore
> -    # errors from the above "$doit $cpprog $src $dsttmp" command.
> -    #
> -    { test -z "$chowncmd" || $doit $chowncmd "$dsttmp"; } \
> -      && { test -z "$chgrpcmd" || $doit $chgrpcmd "$dsttmp"; } \
> -      && { test -z "$stripcmd" || $doit $stripcmd "$dsttmp"; } \
> -      && { test -z "$chmodcmd" || $doit $chmodcmd "$dsttmp"; } &&
> -
> -    # Now rename the file to the real destination.
> -    { $doit $mvcmd -f "$dsttmp" "$dstdir/$dstfile" 2>/dev/null \
> -      || {
> -	   # The rename failed, perhaps because mv can't rename something else
> -	   # to itself, or perhaps because mv is so ancient that it does not
> -	   # support -f.
> -
> -	   # Now remove or move aside any old file at destination location.
> -	   # We try this two ways since rm can't unlink itself on some
> -	   # systems and the destination file might be busy for other
> -	   # reasons.  In this case, the final cleanup might fail but the new
> -	   # file should still install successfully.
> -	   {
> -	     if test -f "$dstdir/$dstfile"; then
> -	       $doit $rmcmd -f "$dstdir/$dstfile" 2>/dev/null \
> -	       || $doit $mvcmd -f "$dstdir/$dstfile" "$rmtmp" 2>/dev/null \
> -	       || {
> -		 echo "$0: cannot unlink or rename $dstdir/$dstfile" >&2
> -		 (exit 1); exit
> -	       }
> -	     else
> -	       :
> -	     fi
> -	   } &&
> -
> -	   # Now rename the file to the real destination.
> -	   $doit $mvcmd "$dsttmp" "$dstdir/$dstfile"
> -	 }
> -    }
> -  fi || { (exit 1); exit; }
> -done
> -
> -# The final little trick to "correctly" pass the exit status to the exit trap.
> -{
> -  (exit 0); exit
> -}
> -
> -# Local variables:
> -# eval: (add-hook 'write-file-hooks 'time-stamp)
> -# time-stamp-start: "scriptversion="
> -# time-stamp-format: "%:y-%02m-%02d.%02H"
> -# time-stamp-end: "$"
> -# End:
> diff --git a/recipes/install/install-native_0.1.bb b/recipes/install/install-native_0.1.bb
> deleted file mode 100644
> index 70c027b..0000000
> --- a/recipes/install/install-native_0.1.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -# This package uses the GNU autotools install-sh script to implement
> -# a target-capable 'install' command.
> -DESCRIPTION = "Target install command"
> -SECTION = "devel"
> -PRIORITY = "optional"
> -LICENSE = "MIT"
> -INHIBIT_DEFAULT_DEPS = "1"
> -PR = "r1"
> -
> -SRC_URI = "file://install-sh"
> -
> -inherit native
> -
> -PACKAGES = ""
> -S = "${WORKDIR}"
> -
> -do_stage() {
> -	# When the install command is executed 'STRIP' is defined correctly in
> -	# the environment
> -	rm -f ${STAGING_BINDIR}/install-sh
> -	cp install-sh ${STAGING_BINDIR}/install-sh
> -	chmod 755 ${STAGING_BINDIR}/install-sh
> -	rm -f ${STAGING_BINDIR}/install
> -	echo '#!/bin/sh' >${STAGING_BINDIR}/install
> -	echo 'STRIPPROG="$STRIP" exec sh "${STAGING_BINDIR}/install-sh" "$@"' >>${STAGING_BINDIR}/install
> -	chmod 755 ${STAGING_BINDIR}/install
> -}
> diff --git a/recipes/netpbm/netpbm_10.28.bb b/recipes/netpbm/netpbm_10.28.bb
> index 4ce1a5a..2672e4a 100644
> --- a/recipes/netpbm/netpbm_10.28.bb
> +++ b/recipes/netpbm/netpbm_10.28.bb
> @@ -9,7 +9,7 @@ LICENSE = "GPL MIT Artistic"
>  # licenses.  The compiled and linked command line utilties are
>  # subject to the licenses of the libraries they use too - including
>  # libpng libz, IJG, and libtiff licenses
> -DEPENDS = "jpeg zlib libpng tiff install-native flex-native"
> +DEPENDS = "jpeg zlib libpng tiff flex-native"
>  RDEPENDS = "perl\
>  	perl-module-cwd\
>  	perl-module-english\
> -- 
> 1.6.5
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


