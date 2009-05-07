Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M2Bhj-0000JK-Kb
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 00:04:37 +0200
Received: by gxk2 with SMTP id 2so767919gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 14:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YNPjmcRUWBE3YQzKqM4HnOd6pkZqG6GhEU4QH04uDsU=;
	b=iv3Bcqy4M81oS1pQYcIcE9WEa2E1IeANGEtqw2VTAjC7vRa7ITYwhrpZb/vyeg5c+T
	UbksJsAP2lOyQZdAKau961kFmaSOOzMzqRkipdQhVpDDebXsVEggCrlunK9je5LSKumZ
	xWPV1QdhWfbcvYBaOrVEKR1/UG0RRTRcC6fDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=L5dwxaibfPT1AQOra+AG+bb1ZmqZQYC5SqdY0E9vXqJrVrvAg60t6Fz0au2i0tsMpt
	joy4JFeIFJ2Ds++gXfXxMsAVArSrTiyaN8LU9Maj5pCxivit9SL2XG05ZBkfp5254xS2
	4w8vpCqJoup+JdQ4q4YP6keaSBFR12kR4tHY4=
MIME-Version: 1.0
Received: by 10.151.75.12 with SMTP id c12mr3567696ybl.176.1241733504934; Thu, 
	07 May 2009 14:58:24 -0700 (PDT)
In-Reply-To: <1241079609-5912-4-git-send-email-khimov@altell.ru>
References: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
	<1241079609-5912-1-git-send-email-khimov@altell.ru>
	<1241079609-5912-2-git-send-email-khimov@altell.ru>
	<1241079609-5912-3-git-send-email-khimov@altell.ru>
	<1241079609-5912-4-git-send-email-khimov@altell.ru>
Date: Thu, 7 May 2009 17:58:24 -0400
Message-ID: <f96d234e0905071458l22022a9gd5b7e77a4607c3c0@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] remove install-native package
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
X-List-Received-Date: Thu, 07 May 2009 22:04:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

We have run into several problems that may be related to this patch.

bitbake libart-lgpl fails on a clean build with following message:

NOTE: Running task 583 of 597 (ID: 237,
/build/oe/oe-testing/oe/openembedded/recipes/libtool/libtool-cross_2.2.4.bb=
,
do_build)
NOTE: package libtool-cross-2.2.4-r23: task do_build: started
NOTE: package libtool-cross-2.2.4-r23: task do_build: completed
NOTE: Running task 584 of 597 (ID: 251,
/build/oe/oe-testing/oe/openembedded/recipes/libtool/libtool-cross_2.2.4.bb=
,
do_rm_work)
NOTE: package libtool-cross-2.2.4-r23: task do_rm_work: started
NOTE: package libtool-cross-2.2.4-r23: task do_rm_work: completed
NOTE: package libart-lgpl-2.3.19-r2: task do_configure: completed
NOTE: Running task 585 of 597 (ID: 7,
/build/oe/oe-testing/oe/openembedded/recipes/gnome/libart-lgpl_2.3.19.bb,
do_qa_configure)
NOTE: package libart-lgpl-2.3.19-r2: task do_qa_configure: started
NOTE: Checking sanity of the config.log file
NOTE: package libart-lgpl-2.3.19-r2: task do_qa_configure: completed
NOTE: Running task 586 of 597 (ID: 8,
/build/oe/oe-testing/oe/openembedded/recipes/gnome/libart-lgpl_2.3.19.bb,
do_compile)
NOTE: package libart-lgpl-2.3.19-r2: task do_compile: started
NOTE: package libart-lgpl-2.3.19-r2: task do_compile: completed
NOTE: Running task 587 of 597 (ID: 9,
/build/oe/oe-testing/oe/openembedded/recipes/gnome/libart-lgpl_2.3.19.bb,
do_install)
NOTE: package libart-lgpl-2.3.19-r2: task do_install: started
ERROR: function do_install failed
ERROR: log data follows
(/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-=
gnueabi/libart-lgpl-2.3.19-r2/temp/log.do_install.11458)
| NOTE: make DESTDIR=3D/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/=
armv7a-angstrom-linux-gnueabi/libart-lgpl-2.3.19-r2/image
install
| make  install-am
| make[1]: Entering directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-=
gnueabi/libart-lgpl-2.3.19-r2/libart_lgpl-2.3.19'
| make[2]: Entering directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-=
gnueabi/libart-lgpl-2.3.19-r2/libart_lgpl-2.3.19'
| test -z "/usr/bin" || mkdir -p
"/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-=
gnueabi/libart-lgpl-2.3.19-r2/image/usr/bin"
|  /build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/=
bin/install-sh
'libart2-config'
'/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-=
gnueabi/libart-lgpl-2.3.19-r2/image/usr/bin/libart2-config'
| /bin/sh: line 5:
/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin=
/install-sh:
No such file or directory
| make[2]: *** [install-binSCRIPTS] Error 127
| make[2]: Leaving directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-=
gnueabi/libart-lgpl-2.3.19-r2/libart_lgpl-2.3.19'
| make[1]: *** [install-am] Error 2
| make[1]: Leaving directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-=
gnueabi/libart-lgpl-2.3.19-r2/libart_lgpl-2.3.19'
| make: *** [install] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-g=
nueabi/libart-lgpl-2.3.19-r2/temp/log.do_install.11458
NOTE: package libart-lgpl-2.3.19-r2: task do_install: failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/build/oe/oe-testing/oe/openembedded/recipes/gnome/libart-lgpl_2.3.19.bb
do_install failed
ERROR: Task 9 (/build/oe/oe-testing/oe/openembedded/recipes/gnome/libart-lg=
pl_2.3.19.bb,
do_install) failed
NOTE: Tasks Summary: Attempted 586 tasks of which 0 didn't need to be
rerun and 1 failed.
ERROR: '/build/oe/oe-testing/oe/openembedded/recipes/gnome/libart-lgpl_2.3.=
19.bb'
failed

in the do_install script we have the following:

export INSTALL=3D"/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/x8=
6_64-linux/usr/bin/install-sh"

in my staging dir, the following files are present:

cbrake@happy:/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging$
find -name install-sh
./x86_64-linux/usr/share/libtool/libltdl/config/install-sh
./x86_64-linux/usr/share/libtool/config/install-sh
./x86_64-linux/usr/share/automake-1.10/install-sh
./x86_64-linux/usr/share/doc/gettext/examples/hello-c++-kde/admin/install-s=
h

Any suggestions on a fix?

Thanks,
Cliff


On Thu, Apr 30, 2009 at 4:20 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Sane 'install' program is provided by coreutils-native now.
> ---
> =A0conf/distro/include/preferred-om-2008-versions.inc | =A0 =A01 -
> =A0recipes/beep/beep_1.2.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A01 -
> =A0recipes/callweaver/callweaver-perl.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 -
> =A0recipes/cron/cron_3.0pl1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A01 -
> =A0recipes/cups/cups.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/cups/cups_1.1.23.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A02 +-
> =A0recipes/cups/cups_1.2.7.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 +-
> =A0recipes/cyrus-imapd/cyrus-imapd_2.2.12.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 -
> =A0recipes/gnome/libart-lgpl.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 -
> =A0recipes/install/files/install-sh =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0334 --------------------
> =A0recipes/install/install-native_0.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 27 --
> =A0recipes/netpbm/netpbm_10.28.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
> =A012 files changed, 4 insertions(+), 372 deletions(-)
> =A0delete mode 100644 recipes/install/files/install-sh
> =A0delete mode 100644 recipes/install/install-native_0.1.bb
>
> diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/di=
stro/include/preferred-om-2008-versions.inc
> index e3e2187..8c5c4f7 100644
> --- a/conf/distro/include/preferred-om-2008-versions.inc
> +++ b/conf/distro/include/preferred-om-2008-versions.inc
> @@ -712,7 +712,6 @@ PREFERRED_VERSION_inkscape ?=3D "0.43"
> =A0PREFERRED_VERSION_inkwp ?=3D "0.1.1"
> =A0PREFERRED_VERSION_inotify-tools ?=3D "2.1"
> =A0PREFERRED_VERSION_inputproto ?=3D "1.4.4"
> -PREFERRED_VERSION_install-native ?=3D "0.1"
> =A0PREFERRED_VERSION_insttrain ?=3D "1.0.5"
> =A0PREFERRED_VERSION_interbench ?=3D "0.30"
> =A0PREFERRED_VERSION_intercom ?=3D "0.15"
> diff --git a/recipes/beep/beep_1.2.2.bb b/recipes/beep/beep_1.2.2.bb
> index 759f74f..e3ffdce 100644
> --- a/recipes/beep/beep_1.2.2.bb
> +++ b/recipes/beep/beep_1.2.2.bb
> @@ -4,7 +4,6 @@ DESCRIPTION =3D "A console utility to make a beep noise"
> =A0SECTION =3D "console/utils"
> =A0LICENSE =3D "GPL"
> =A0PR =3D "r2"
> -DEPENDS =3D "install-native"
>
> =A0SRC_URI =A0=3D "http://johnath.com/beep/beep-${PV}.tar.gz"
> =A0SRC_URI +=3D "file://linux-input.patch;patch=3D1"
> diff --git a/recipes/callweaver/callweaver-perl.bb b/recipes/callweaver/c=
allweaver-perl.bb
> index 99e2fb7..7ff077b 100644
> --- a/recipes/callweaver/callweaver-perl.bb
> +++ b/recipes/callweaver/callweaver-perl.bb
> @@ -2,7 +2,6 @@ DESCRIPTION =3D "Callweaver::OGI Perl Gateway Interface M=
odule"
> =A0HOMEPAGE =3D "http://www.callweaver.org"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "GPL"
> -DEPENDS =3D "install-native"
> =A0RDEPENDS =3D "perl callweaver-ogi"
> =A0PR =3D "r0"
> =A0S =3D "${WORKDIR}/callweaver-1.2-${CWRCV}/contrib/ogi-perl/callweaver-=
perl-0.0.1"
> diff --git a/recipes/cron/cron_3.0pl1.bb b/recipes/cron/cron_3.0pl1.bb
> index f7c2ccc..ff1d380 100644
> --- a/recipes/cron/cron_3.0pl1.bb
> +++ b/recipes/cron/cron_3.0pl1.bb
> @@ -2,7 +2,6 @@ SECTION =3D "base"
> =A0DESCRIPTION =3D "Vixie cron."
> =A0LICENSE =3D "cron"
> =A0PR =3D"r8"
> -DEPENDS +=3D "install-native"
>
> =A0SRC_URI =3D "http://ibiblio.org/pub/Linux/system/daemons/cron/cron${PV=
}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 file://nonrootinstall.patch;patch=3D1 \
> diff --git a/recipes/cups/cups.inc b/recipes/cups/cups.inc
> index 59075fb..8e2a7a8 100644
> --- a/recipes/cups/cups.inc
> +++ b/recipes/cups/cups.inc
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "An Internet printing system for Unix."
> =A0SECTION =3D "console/utils"
> =A0LICENSE =3D "GPL LGPL"
> -DEPENDS =3D "gnutls jpeg dbus dbus-glib libpng zlib install-native faker=
oot-native"
> +DEPENDS =3D "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
>
> =A0SRC_URI =3D "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar=
.bz2 \
> =A0 =A0 =A0 =A0 =A0"
> diff --git a/recipes/cups/cups_1.1.23.bb b/recipes/cups/cups_1.1.23.bb
> index b17d899..d6f0de8 100644
> --- a/recipes/cups/cups_1.1.23.bb
> +++ b/recipes/cups/cups_1.1.23.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "An Internet printing system for Unix."
> =A0SECTION =3D "console/utils"
> =A0LICENSE =3D "GPL LGPL"
> -DEPENDS =3D "openssl jpeg libpng zlib install-native fakeroot-native"
> +DEPENDS =3D "openssl jpeg libpng zlib fakeroot-native"
> =A0PR =3D "r6"
>
> =A0SRC_URI =3D "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.ta=
r.bz2 \
> diff --git a/recipes/cups/cups_1.2.7.bb b/recipes/cups/cups_1.2.7.bb
> index 24249fa..8559bfc 100644
> --- a/recipes/cups/cups_1.2.7.bb
> +++ b/recipes/cups/cups_1.2.7.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "An Internet printing system for Unix."
> =A0SECTION =3D "console/utils"
> =A0LICENSE =3D "GPL LGPL"
> -DEPENDS =3D "gnutls jpeg dbus dbus-glib libpng zlib install-native faker=
oot-native"
> +DEPENDS =3D "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
> =A0PR =3D "r1"
>
> =A0SRC_URI =3D "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.ta=
r.bz2 \
> diff --git a/recipes/cyrus-imapd/cyrus-imapd_2.2.12.bb b/recipes/cyrus-im=
apd/cyrus-imapd_2.2.12.bb
> index e80340f..2247ea9 100644
> --- a/recipes/cyrus-imapd/cyrus-imapd_2.2.12.bb
> +++ b/recipes/cyrus-imapd/cyrus-imapd_2.2.12.bb
> @@ -2,7 +2,6 @@ SECTION =3D "console/network"
> =A0DEPENDS =3D "cyrus-sasl virtual/db"
> =A0LICENSE =3D "BSD"
> =A0PR =3D "r12"
> -DEPENDS +=3D "install-native"
>
> =A0SRC_URI =3D "ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/cyrus-imapd-${PV}=
.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://autotools.patch;patch=3D1 \
> diff --git a/recipes/gnome/libart-lgpl.inc b/recipes/gnome/libart-lgpl.in=
c
> index 710656b..4613156 100644
> --- a/recipes/gnome/libart-lgpl.inc
> +++ b/recipes/gnome/libart-lgpl.inc
> @@ -11,8 +11,6 @@ SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/lib=
art_lgpl/2.3/libart_lgpl-${
>
> =A0inherit autotools pkgconfig
>
> -DEPENDS =3D "install-native"
> -
> =A0FILES_${PN} =3D "${libdir}/*.so.*"
> =A0FILES_${PN}-dev +=3D "${bindir}/libart2-config"
>
> diff --git a/recipes/install/files/install-sh b/recipes/install/files/ins=
tall-sh
> deleted file mode 100644
> index 8de386e..0000000
> --- a/recipes/install/files/install-sh
> +++ /dev/null
> @@ -1,334 +0,0 @@
> -#!/bin/sh
> -# install - install a program, script, or datafile
> -
> -scriptversion=3D2004-10-22.00
> -
> -# This originates from X11R5 (mit/util/scripts/install.sh), which was
> -# later released in X11R6 (xc/config/util/install.sh) with the
> -# following copyright and license.
> -#
> -# Copyright (C) 1994 X Consortium
> -#
> -# Permission is hereby granted, free of charge, to any person obtaining =
a copy
> -# of this software and associated documentation files (the "Software"), =
to
> -# deal in the Software without restriction, including without limitation=
 the
> -# rights to use, copy, modify, merge, publish, distribute, sublicense, a=
nd/or
> -# sell copies of the Software, and to permit persons to whom the Softwar=
e is
> -# furnished to do so, subject to the following conditions:
> -#
> -# The above copyright notice and this permission notice shall be include=
d in
> -# all copies or substantial portions of the Software.
> -#
> -# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
> -# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
> -# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. =A0IN NO EVENT S=
HALL THE
> -# X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHET=
HER IN
> -# AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN C=
ONNEC-
> -# TION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> -#
> -# Except as contained in this notice, the name of the X Consortium shall=
 not
> -# be used in advertising or otherwise to promote the sale, use or other =
deal-
> -# ings in this Software without prior written authorization from the X C=
onsor-
> -# tium.
> -#
> -#
> -# FSF changes to this file are in the public domain.
> -#
> -# Calling this script install-sh is preferred over install.sh, to preven=
t
> -# `make' implicit rules from creating a file called install from it
> -# when there is no Makefile.
> -#
> -# This script is compatible with the BSD install script, but was written
> -# from scratch. =A0It can only install one file at a time, a restriction
> -# shared with many OS's install programs.
> -
> -# set DOITPROG to echo to test this script
> -
> -# Don't use :- since 4.3BSD and earlier shells don't like it.
> -doit=3D"${DOITPROG-}"
> -
> -# put in absolute paths if you don't have them in your path; or use env.=
 vars.
> -
> -mvprog=3D"${MVPROG-mv}"
> -cpprog=3D"${CPPROG-cp}"
> -chmodprog=3D"${CHMODPROG-chmod}"
> -chownprog=3D"${CHOWNPROG-chown}"
> -chgrpprog=3D"${CHGRPPROG-chgrp}"
> -stripprog=3D"${STRIPPROG-strip}"
> -rmprog=3D"${RMPROG-rm}"
> -mkdirprog=3D"${MKDIRPROG-mkdir}"
> -
> -chmodcmd=3D"$chmodprog 0755"
> -chowncmd=3D
> -chgrpcmd=3D
> -stripcmd=3D
> -rmcmd=3D"$rmprog -f"
> -mvcmd=3D"$mvprog"
> -src=3D
> -dst=3D
> -dir_arg=3D
> -preserve_arg=3D
> -dstarg=3D
> -no_target_directory=3D
> -
> -usage=3D"Usage: $0 [OPTION]... [-T] SRCFILE DSTFILE
> - =A0 or: $0 [OPTION]... SRCFILES... DIRECTORY
> - =A0 or: $0 [OPTION]... -t DIRECTORY SRCFILES...
> - =A0 or: $0 [OPTION]... -d DIRECTORIES...
> -
> -In the 1st form, copy SRCFILE to DSTFILE.
> -In the 2nd and 3rd, copy all SRCFILES to DIRECTORY.
> -In the 4th, create DIRECTORIES.
> -
> -Options:
> --c =A0 =A0 =A0 =A0 (ignored)
> --D =A0 =A0 =A0 =A0 (ignored)
> --d =A0 =A0 =A0 =A0 create directories instead of installing files.
> --g GROUP =A0 $chgrpprog installed files to GROUP.
> --m MODE =A0 =A0$chmodprog installed files to MODE.
> --o USER =A0 =A0$chownprog installed files to USER.
> --p =A0 =A0 =A0 =A0 apply access/modification times of SRCFILE files
> - =A0 =A0 =A0 =A0 =A0 to corresponding DSTFILE files
> --s =A0 =A0 =A0 =A0 $stripprog installed files.
> --t DIRECTORY =A0install into DIRECTORY.
> --T =A0 =A0 =A0 =A0 report an error if DSTFILE is a directory.
> ---help =A0 =A0 display this help and exit.
> ---version =A0display version info and exit.
> -
> -Environment variables override the default commands:
> - =A0CHGRPPROG CHMODPROG CHOWNPROG CPPROG MKDIRPROG MVPROG RMPROG STRIPPR=
OG
> -"
> -
> -while test -n "$1"; do
> - =A0case $1 in
> - =A0 =A0-c) shift
> - =A0 =A0 =A0 =A0continue;;
> -
> - =A0 =A0-D) shift
> - =A0 =A0 =A0 continue;;
> -
> - =A0 =A0-d) dir_arg=3Dtrue
> - =A0 =A0 =A0 =A0shift
> - =A0 =A0 =A0 =A0continue;;
> -
> - =A0 =A0-g) chgrpcmd=3D"$chgrpprog $2"
> - =A0 =A0 =A0 =A0shift
> - =A0 =A0 =A0 =A0shift
> - =A0 =A0 =A0 =A0continue;;
> -
> - =A0 =A0--help) echo "$usage"; exit 0;;
> -
> - =A0 =A0-m) chmodcmd=3D"$chmodprog $2"
> - =A0 =A0 =A0 =A0shift
> - =A0 =A0 =A0 =A0shift
> - =A0 =A0 =A0 =A0continue;;
> -
> - =A0 =A0-o) chowncmd=3D"$chownprog $2"
> - =A0 =A0 =A0 =A0shift
> - =A0 =A0 =A0 =A0shift
> - =A0 =A0 =A0 =A0continue;;
> -
> - =A0 =A0-p) preserve_arg=3D"-p"
> - =A0 =A0 =A0 shift
> - =A0 =A0 =A0 continue;;
> -
> - =A0 =A0-s) stripcmd=3D$stripprog
> - =A0 =A0 =A0 =A0shift
> - =A0 =A0 =A0 =A0continue;;
> -
> - =A0 =A0-t) dstarg=3D$2
> - =A0 =A0 =A0 shift
> - =A0 =A0 =A0 shift
> - =A0 =A0 =A0 continue;;
> -
> - =A0 =A0-T) no_target_directory=3Dtrue
> - =A0 =A0 =A0 shift
> - =A0 =A0 =A0 continue;;
> -
> - =A0 =A0--version) echo "$0 $scriptversion"; exit 0;;
> -
> - =A0 =A0*) =A0# When -d is used, all remaining arguments are directories=
 to create.
> - =A0 =A0 =A0 # When -t is used, the destination is already specified.
> - =A0 =A0 =A0 test -n "$dir_arg$dstarg" && break
> - =A0 =A0 =A0 =A0# Otherwise, the last argument is the destination. =A0Re=
move it from $@.
> - =A0 =A0 =A0 for arg
> - =A0 =A0 =A0 do
> - =A0 =A0 =A0 =A0 =A0if test -n "$dstarg"; then
> - =A0 =A0 =A0 =A0 =A0 # $@ is not empty: it contains at least $arg.
> - =A0 =A0 =A0 =A0 =A0 set fnord "$@" "$dstarg"
> - =A0 =A0 =A0 =A0 =A0 shift # fnord
> - =A0 =A0 =A0 =A0 fi
> - =A0 =A0 =A0 =A0 shift # arg
> - =A0 =A0 =A0 =A0 dstarg=3D$arg
> - =A0 =A0 =A0 done
> - =A0 =A0 =A0 break;;
> - =A0esac
> -done
> -
> -if test -z "$1"; then
> - =A0if test -z "$dir_arg"; then
> - =A0 =A0echo "$0: no input file specified." >&2
> - =A0 =A0exit 1
> - =A0fi
> - =A0# It's OK to call `install-sh -d' without argument.
> - =A0# This can happen when creating conditional directories.
> - =A0exit 0
> -fi
> -
> -for src
> -do
> - =A0# Protect names starting with `-'.
> - =A0case $src in
> - =A0 =A0-*) src=3D./$src ;;
> - =A0esac
> -
> - =A0if test -n "$dir_arg"; then
> - =A0 =A0dst=3D$src
> - =A0 =A0src=3D
> -
> - =A0 =A0if test -d "$dst"; then
> - =A0 =A0 =A0mkdircmd=3D:
> - =A0 =A0 =A0chmodcmd=3D
> - =A0 =A0else
> - =A0 =A0 =A0mkdircmd=3D$mkdirprog
> - =A0 =A0fi
> - =A0else
> - =A0 =A0# Waiting for this to be detected by the "$cpprog $src $dsttmp" =
command
> - =A0 =A0# might cause directories to be created, which would be especial=
ly bad
> - =A0 =A0# if $src (and thus $dsttmp) contains '*'.
> - =A0 =A0if test ! -f "$src" && test ! -d "$src"; then
> - =A0 =A0 =A0echo "$0: $src does not exist." >&2
> - =A0 =A0 =A0exit 1
> - =A0 =A0fi
> -
> - =A0 =A0if test -z "$dstarg"; then
> - =A0 =A0 =A0echo "$0: no destination specified." >&2
> - =A0 =A0 =A0exit 1
> - =A0 =A0fi
> -
> - =A0 =A0dst=3D$dstarg
> - =A0 =A0# Protect names starting with `-'.
> - =A0 =A0case $dst in
> - =A0 =A0 =A0-*) dst=3D./$dst ;;
> - =A0 =A0esac
> -
> - =A0 =A0# If destination is a directory, append the input filename; won'=
t work
> - =A0 =A0# if double slashes aren't ignored.
> - =A0 =A0if test -d "$dst"; then
> - =A0 =A0 =A0if test -n "$no_target_directory"; then
> - =A0 =A0 =A0 echo "$0: $dstarg: Is a directory" >&2
> - =A0 =A0 =A0 exit 1
> - =A0 =A0 =A0fi
> - =A0 =A0 =A0dst=3D$dst/`basename "$src"`
> - =A0 =A0fi
> - =A0fi
> -
> - =A0# This sed command emulates the dirname command.
> - =A0dstdir=3D`echo "$dst" | sed -e 's,/*$,,;s,[^/]*$,,;s,/*$,,;s,^$,.,'`
> -
> - =A0# Make sure that the destination directory exists.
> -
> - =A0# Skip lots of stat calls in the usual case.
> - =A0if test ! -d "$dstdir"; then
> - =A0 =A0defaultIFS=3D'
> - =A0 =A0 =A0 =A0'
> - =A0 =A0IFS=3D"${IFS-$defaultIFS}"
> -
> - =A0 =A0oIFS=3D$IFS
> - =A0 =A0# Some sh's can't handle IFS=3D/ for some reason.
> - =A0 =A0IFS=3D'%'
> - =A0 =A0set x `echo "$dstdir" | sed -e 's@/@%@g' -e 's@^%@/@'`
> - =A0 =A0shift
> - =A0 =A0IFS=3D$oIFS
> -
> - =A0 =A0pathcomp=3D
> -
> - =A0 =A0while test $# -ne 0 ; do
> - =A0 =A0 =A0pathcomp=3D$pathcomp$1
> - =A0 =A0 =A0shift
> - =A0 =A0 =A0if test ! -d "$pathcomp"; then
> - =A0 =A0 =A0 =A0$mkdirprog "$pathcomp"
> - =A0 =A0 =A0 # mkdir can fail with a `File exist' error in case several
> - =A0 =A0 =A0 # install-sh are creating the directory concurrently. =A0Th=
is
> - =A0 =A0 =A0 # is OK.
> - =A0 =A0 =A0 test -d "$pathcomp" || exit
> - =A0 =A0 =A0fi
> - =A0 =A0 =A0pathcomp=3D$pathcomp/
> - =A0 =A0done
> - =A0fi
> -
> - =A0if test -n "$dir_arg"; then
> - =A0 =A0$doit $mkdircmd "$dst" \
> - =A0 =A0 =A0&& { test -z "$chowncmd" || $doit $chowncmd "$dst"; } \
> - =A0 =A0 =A0&& { test -z "$chgrpcmd" || $doit $chgrpcmd "$dst"; } \
> - =A0 =A0 =A0&& { test -z "$stripcmd" || $doit $stripcmd "$dst"; } \
> - =A0 =A0 =A0&& { test -z "$chmodcmd" || $doit $chmodcmd "$dst"; }
> -
> - =A0else
> - =A0 =A0dstfile=3D`basename "$dst"`
> -
> - =A0 =A0# Make a couple of temp file names in the proper directory.
> - =A0 =A0dsttmp=3D$dstdir/_inst.$$_
> - =A0 =A0rmtmp=3D$dstdir/_rm.$$_
> -
> - =A0 =A0# Trap to clean up those temp files at exit.
> - =A0 =A0trap 'ret=3D$?; rm -f "$dsttmp" "$rmtmp" && exit $ret' 0
> - =A0 =A0trap '(exit $?); exit' 1 2 13 15
> -
> - =A0 =A0# Copy the file name to the temp name.
> - =A0 =A0$doit $cpprog $preserve_arg "$src" "$dsttmp" &&
> -
> - =A0 =A0# and set any options; do chmod last to preserve setuid bits.
> - =A0 =A0#
> - =A0 =A0# If any of these fail, we abort the whole thing. =A0If we want =
to
> - =A0 =A0# ignore errors from any of these, just make sure not to ignore
> - =A0 =A0# errors from the above "$doit $cpprog $src $dsttmp" command.
> - =A0 =A0#
> - =A0 =A0{ test -z "$chowncmd" || $doit $chowncmd "$dsttmp"; } \
> - =A0 =A0 =A0&& { test -z "$chgrpcmd" || $doit $chgrpcmd "$dsttmp"; } \
> - =A0 =A0 =A0&& { test -z "$stripcmd" || $doit $stripcmd "$dsttmp"; } \
> - =A0 =A0 =A0&& { test -z "$chmodcmd" || $doit $chmodcmd "$dsttmp"; } &&
> -
> - =A0 =A0# Now rename the file to the real destination.
> - =A0 =A0{ $doit $mvcmd -f "$dsttmp" "$dstdir/$dstfile" 2>/dev/null \
> - =A0 =A0 =A0|| {
> - =A0 =A0 =A0 =A0 =A0# The rename failed, perhaps because mv can't rename=
 something else
> - =A0 =A0 =A0 =A0 =A0# to itself, or perhaps because mv is so ancient tha=
t it does not
> - =A0 =A0 =A0 =A0 =A0# support -f.
> -
> - =A0 =A0 =A0 =A0 =A0# Now remove or move aside any old file at destinati=
on location.
> - =A0 =A0 =A0 =A0 =A0# We try this two ways since rm can't unlink itself =
on some
> - =A0 =A0 =A0 =A0 =A0# systems and the destination file might be busy for=
 other
> - =A0 =A0 =A0 =A0 =A0# reasons. =A0In this case, the final cleanup might =
fail but the new
> - =A0 =A0 =A0 =A0 =A0# file should still install successfully.
> - =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0if test -f "$dstdir/$dstfile"; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0$doit $rmcmd -f "$dstdir/$dstfile" 2>/dev/nu=
ll \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0|| $doit $mvcmd -f "$dstdir/$dstfile" "$rmtm=
p" 2>/dev/null \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0|| {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "$0: cannot unlink or rename $dstdi=
r/$dstfile" >&2
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exit 1); exit
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0:
> - =A0 =A0 =A0 =A0 =A0 =A0fi
> - =A0 =A0 =A0 =A0 =A0} &&
> -
> - =A0 =A0 =A0 =A0 =A0# Now rename the file to the real destination.
> - =A0 =A0 =A0 =A0 =A0$doit $mvcmd "$dsttmp" "$dstdir/$dstfile"
> - =A0 =A0 =A0 =A0}
> - =A0 =A0}
> - =A0fi || { (exit 1); exit; }
> -done
> -
> -# The final little trick to "correctly" pass the exit status to the exit=
 trap.
> -{
> - =A0(exit 0); exit
> -}
> -
> -# Local variables:
> -# eval: (add-hook 'write-file-hooks 'time-stamp)
> -# time-stamp-start: "scriptversion=3D"
> -# time-stamp-format: "%:y-%02m-%02d.%02H"
> -# time-stamp-end: "$"
> -# End:
> diff --git a/recipes/install/install-native_0.1.bb b/recipes/install/inst=
all-native_0.1.bb
> deleted file mode 100644
> index 70c027b..0000000
> --- a/recipes/install/install-native_0.1.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -# This package uses the GNU autotools install-sh script to implement
> -# a target-capable 'install' command.
> -DESCRIPTION =3D "Target install command"
> -SECTION =3D "devel"
> -PRIORITY =3D "optional"
> -LICENSE =3D "MIT"
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -PR =3D "r1"
> -
> -SRC_URI =3D "file://install-sh"
> -
> -inherit native
> -
> -PACKAGES =3D ""
> -S =3D "${WORKDIR}"
> -
> -do_stage() {
> - =A0 =A0 =A0 # When the install command is executed 'STRIP' is defined c=
orrectly in
> - =A0 =A0 =A0 # the environment
> - =A0 =A0 =A0 rm -f ${STAGING_BINDIR}/install-sh
> - =A0 =A0 =A0 cp install-sh ${STAGING_BINDIR}/install-sh
> - =A0 =A0 =A0 chmod 755 ${STAGING_BINDIR}/install-sh
> - =A0 =A0 =A0 rm -f ${STAGING_BINDIR}/install
> - =A0 =A0 =A0 echo '#!/bin/sh' >${STAGING_BINDIR}/install
> - =A0 =A0 =A0 echo 'STRIPPROG=3D"$STRIP" exec sh "${STAGING_BINDIR}/insta=
ll-sh" "$@"' >>${STAGING_BINDIR}/install
> - =A0 =A0 =A0 chmod 755 ${STAGING_BINDIR}/install
> -}
> diff --git a/recipes/netpbm/netpbm_10.28.bb b/recipes/netpbm/netpbm_10.28=
.bb
> index ff90310..cceac41 100644
> --- a/recipes/netpbm/netpbm_10.28.bb
> +++ b/recipes/netpbm/netpbm_10.28.bb
> @@ -9,7 +9,7 @@ LICENSE =3D "GPL MIT Artistic"
> =A0# licenses. =A0The compiled and linked command line utilties are
> =A0# subject to the licenses of the libraries they use too - including
> =A0# libpng libz, IJG, and libtiff licenses
> -DEPENDS =3D "jpeg zlib libpng tiff install-native flex-native"
> +DEPENDS =3D "jpeg zlib libpng tiff flex-native"
> =A0RDEPENDS =3D "perl\
> =A0 =A0 =A0 =A0perl-module-cwd\
> =A0 =A0 =A0 =A0perl-module-english\
> --
> 1.6.2.4
>
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


