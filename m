Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC216E9A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 06:02:05 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hn9so5809841wib.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 23:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QRNHhHezDBEBzxSyeoAC4uPoYazR5uz8G2kJmUmvE+Q=;
	b=fW0gyUsCoRAGW+TJxxVZai/O6SGbEjxtKrbPxCBHNnpU+P/RW5fXC93vw1iYc1mGxk
	Ltij9a37TA37z3VIUPwAw1eF9DBrfa+TDMU8fwbyex0Ck9r6VjPkevftEKp6xiv17Ulo
	ib8nAk2maSynoK4lLuBdGCIpDtcIej0u9YsX7j8kuf59ImAe4qshvPlfJZgrAMbnqIeY
	whL+frDQz9it+ZI1UYGqBd5GYKPvYAGqbYuMQDxGpuhHKVr81pbpcIx6PWaYA0hxs9/6
	DZdf4d0Zb/bEP+9QpAQGTwrWNAkiaal7vZPvK+x6koqp2kcbUpErgMJ6X8dRbIxHIgyn
	RPXw==
MIME-Version: 1.0
X-Received: by 10.194.71.47 with SMTP id r15mr32437222wju.19.1395295325735;
	Wed, 19 Mar 2014 23:02:05 -0700 (PDT)
Received: by 10.216.117.6 with HTTP; Wed, 19 Mar 2014 23:02:05 -0700 (PDT)
In-Reply-To: <CAOLEWZVbSV6bLKTXih01cfmyec4uvmO1PUc6OM02=Fub68OsRg@mail.gmail.com>
References: <1395117284-22655-1-git-send-email-stephen.arnold42@gmail.com>
	<CALbNGRTeZrrDcSLQ8fQ7YOp4kK=e0dp1oAQBRR7D-6MYRQDXYg@mail.gmail.com>
	<CAOLEWZVbSV6bLKTXih01cfmyec4uvmO1PUc6OM02=Fub68OsRg@mail.gmail.com>
Date: Wed, 19 Mar 2014 23:02:05 -0700
Message-ID: <CAOLEWZWb4f2Jomrhj9xt=nfcrk7GUkBB7QoK-vyxVxnvzXK3vA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-xfce][PATCH v3] recipes-xfce/libxfce4ui: depends and autotools fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Mar 2014 06:02:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sorry, maybe you did miss the previous one; if the task is changed to
do_configure_prepend, then it fails like below; if you remove autotools
from inherit, then it fails in a different way.

do_confgure_prepend autogen error:

Poky ["raspberrypi"] >>> bitbake libxfce4ui -c build
NOTE: Started PRServer with DBfile:
/home/sarnold/poky/build-rpihf/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
53789, PID: 25973
Loading cache: 100% |###########################################| ETA:
00:00:00
Loaded 2113 entries from dependency cache.
Parsing recipes: 100% |#########################################| Time:
00:00:00
Parsing of 1663 .bb files complete (1661 cached, 2 parsed). 2100 targets,
45 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.21.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-12.04"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "raspberrypi"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.5+snapshot-20140320"
TUNE_FEATURES     =3D "armv6 vfp callconvention-hard arm1176jzfs
no-thumb-interwork"
TARGET_FPU        =3D "vfp"
meta
meta-yocto
meta-yocto-bsp    =3D "master:387349d29a824d318474ce4cc05d342dcde46621"
meta-raspberrypi  =3D "master:364da37b0db31aa21b1717e5a294e73a8a426d94"
meta-alt-desktop-extras =3D "master:fdffcf33fed9f2806daa6f10326e0e8a2e81eae=
7"
meta-erlang       =3D "master:986fda4a4cd3ac521897206ba39fe4d9f42e50b9"
meta-oe
meta-gnome
meta-networking
meta-filesystems
meta-multimedia
meta-efl
meta-xfce         =3D "master:c25e5ab9335a024aaf7963d7dfb0d3ae7b163f0b"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at
/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-poky-linux-gnueab=
i/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/temp/log.do_configure.27954)
ERROR: Logfile of failure stored in:
/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-poky-linux-gnueab=
i/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/temp/log.do_configure.27954
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/icons/hic=
olor/48x48/apps/xfce4-logo.png
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/pi=
xmaps/hicolor/22x22/actions/widget-libxfce4ui-xfce-titled-dialog.png
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/pi=
xmaps/hicolor/16x16/actions/widget-libxfce4ui-xfce-titled-dialog.png
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/ca=
talogs/libxfce4ui.xml
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/ca=
talogs/
libxfce4ui.xml.in
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/libxfce4ui-config.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/xfce-gdk-extensions.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/libxfce4ui.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/xfce-dialogs.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/libxfce4ui-enum-types.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/xfce-spawn.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/xfce-sm-client.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/xfce-titled-dialog.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/xfce-gtk-extensions.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4kbd-private-2/libxfce4kbd-private/xfce-shortcuts-grabber.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4kbd-private-2/libxfce4kbd-private/xfce-shortcuts-xfwm4.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4kbd-private-2/libxfce4kbd-private/xfce-shortcuts-provider.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4kbd-private-2/libxfce4kbd-private/xfce-shortcuts.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4kbd-private-2/libxfce4kbd-private/xfce-shortcut-dialog.h
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/
libxfce4ui-1.la
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/libxfce4kbd=
-private-2.so
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/libxfce4ui-=
1.so
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/
libxfce4kbd-private-2.la
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/libxfce4kbd=
-private-2.so.0
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/libxfce4ui-=
1.so.0
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/libxfce4kbd=
-private-2.so.0.0.0
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/libxfce4ui-=
1.so.0.0.0
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/pkgconfig/l=
ibxfce4ui-1.pc
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/pkgconfig/l=
ibxfce4kbd-private-2.pc
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/glade3/modu=
les/
libxfce4uiglade.la
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/glade3/modu=
les/libxfce4uiglade.so
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4kbd-private-2/libxfce4kbd-private/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/pi=
xmaps/hicolor/16x16/actions/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/pi=
xmaps/hicolor/22x22/actions/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/libxfce4ui/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4kbd-private-2/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/pi=
xmaps/hicolor/16x16/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/pi=
xmaps/hicolor/22x22/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/icons/hic=
olor/48x48/apps/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/pi=
xmaps/hicolor/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/l=
ibxfce4ui-1/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/icons/hic=
olor/48x48/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/ca=
talogs/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/pi=
xmaps/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/icons/hic=
olor/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/glade3/modu=
les/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/pkgconfig/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/xfce4/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/glade3/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/icons/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/glade3/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/include/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/lib/
| DEBUG: Removing manifest:
/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| Preparing package directory
/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-poky-linux-gnueab=
i/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git...
| Creating
/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-poky-linux-gnueab=
i/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal.m4...
| Running glib-gettextize --force --copy...
| Copying file po/Makefile.in.in
|
| Please add the files
|   codeset.m4 gettext.m4 glibc21.m4 iconv.m4 isc-posix.m4 lcmessage.m4
|   progtest.m4
| from the
/home/sarnold/poky/build-rpihf/tmp/sysroots/x86_64-linux/usr/share/aclocal
directory to your autoconf macro directory
| or directly to your aclocal.m4 file.
| You will also need config.guess and config.sub, which you can get from
| ftp://ftp.gnu.org/pub/gnu/config/.
|
| Running intltoolize --automake --copy --force
| Patching file 'po/Makefile.in.in'
| Running libtoolize --force --copy...
| libtoolize: putting auxiliary files in `.'.
| libtoolize: copying file `./ltmain.sh'
| libtoolize: You should add the contents of the following files to
`aclocal.m4':
| libtoolize:
`/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/aclocal/=
libtool.m4'
| libtoolize:
`/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/aclocal/=
ltoptions.m4'
| libtoolize:
`/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/aclocal/=
ltversion.m4'
| libtoolize:
`/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/aclocal/=
ltsugar.m4'
| libtoolize:
`/home/sarnold/poky/build-rpihf/tmp/sysroots/raspberrypi/usr/share/aclocal/=
lt~obsolete.m4'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.acan=
d
| libtoolize: rerunning libtoolize, to keep the correct libtool macros
in-tree.
| libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| Running gtkdocize --copy...
| Running aclocal   -I
/home/sarnold/poky/build-rpihf/tmp/sysroots/x86_64-linux/usr/share/xfce4/de=
v-tools/m4macros...
| configure.ac:230: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/sysroots/x86_64-linux/usr/share/xfce4/de=
v-tools/m4macros/xdt-features.m4:39:
XDT_SUPPORTED_FLAGS is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/sysroots/x86_64-linux/usr/share/xfce4/de=
v-tools/m4macros/xdt-features.m4:59:
XDT_FEATURE_DEBUG is expanded from...
| configure.ac:230: the top level
| configure.ac:246: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/sysroots/x86_64-linux/usr/share/xfce4/de=
v-tools/m4macros/xdt-features.m4:39:
XDT_SUPPORTED_FLAGS is expanded from...
| configure.ac:246: the top level
| configure.ac:250: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| configure.ac:250: the top level
| configure.ac:279: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/sysroots/x86_64-linux/usr/share/xfce4/de=
v-tools/m4macros/xdt-features.m4:39:
XDT_SUPPORTED_FLAGS is expanded from...
| configure.ac:279: the top level
| Running autoheader...
| configure.ac:230: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| aclocal.m4:11109: XDT_SUPPORTED_FLAGS is expanded from...
| aclocal.m4:11129: XDT_FEATURE_DEBUG is expanded from...
| configure.ac:230: the top level
| configure.ac:246: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| aclocal.m4:11109: XDT_SUPPORTED_FLAGS is expanded from...
| configure.ac:246: the top level
| configure.ac:250: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| configure.ac:250: the top level
| configure.ac:279: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| aclocal.m4:11109: XDT_SUPPORTED_FLAGS is expanded from...
| configure.ac:279: the top level
| Running automake --force-missing --add-missing --copy --gnu...
| configure.ac:230: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| aclocal.m4:11109: XDT_SUPPORTED_FLAGS is expanded from...
| aclocal.m4:11129: XDT_FEATURE_DEBUG is expanded from...
| configure.ac:230: the top level
| configure.ac:246: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| aclocal.m4:11109: XDT_SUPPORTED_FLAGS is expanded from...
| configure.ac:246: the top level
| configure.ac:250: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| configure.ac:250: the top level
| configure.ac:279: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| aclocal.m4:11109: XDT_SUPPORTED_FLAGS is expanded from...
| configure.ac:279: the top level
| configure.ac:56: installing './compile'
| configure.ac:43: installing './config.guess'
| configure.ac:43: installing './config.sub'
| configure.ac:48: installing './install-sh'
| configure.ac:48: installing './missing'
| Makefile.am:10: warning: whitespace following trailing backslash
| Makefile.am: installing './INSTALL'
| glade/Makefile.am: installing './depcomp'
| parallel-tests: installing './test-driver'
| Running autoconf...
| configure.ac:230: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| aclocal.m4:11109: XDT_SUPPORTED_FLAGS is expanded from...
| aclocal.m4:11129: XDT_FEATURE_DEBUG is expanded from...
| configure.ac:230: the top level
| configure.ac:246: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| aclocal.m4:11109: XDT_SUPPORTED_FLAGS is expanded from...
| configure.ac:246: the top level
| configure.ac:250: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| configure.ac:250: the top level
| configure.ac:279: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call
detected in body
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/lang.m4:193:
AC_LANG_CONFTEST is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2584:
_AC_COMPILE_IFELSE is expanded from...
|
/home/sarnold/poky/build-rpihf/tmp/work/x86_64-linux/autoconf-native/2.69-r=
11/autoconf-2.69/lib/autoconf/general.m4:2600:
AC_COMPILE_IFELSE is expanded from...
| aclocal.m4:11109: XDT_SUPPORTED_FLAGS is expanded from...
| configure.ac:279: the top level
|
| Skipping configure process.
| automake (GNU automake) 1.14
| Copyright (C) 2013 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <
http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1
| NOTE: Executing intltoolize --copy --force --automake
| NOTE: Executing ACLOCAL=3D"aclocal
--system-acdir=3D/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-=
poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-c=
opy/"
autoreconf --verbose --install --force --exclude=3Dautopoint
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal
--system-acdir=3D/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-=
poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-c=
opy/
--force
| aclocal: error: couldn't open directory
'/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-poky-linux-gnuea=
bi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/':
No such file or directory
| autoreconf: aclocal failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING:
/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-poky-linux-gnueab=
i/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/temp/run.do_configure.27954:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_configure (log file is located at
/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-poky-linux-gnueab=
i/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/temp/log.do_configure.27954)
ERROR: Task 5
(/home/sarnold/poky/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/
libxfce4ui_4.10.0.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1705 tasks of which 1701 didn't need to be
rerun and 1 failed.
NOTE: Writing buildhistory
No currently running tasks (1704 of 1712)

Summary: 1 task failed:
  /home/sarnold/poky/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/
libxfce4ui_4.10.0.bb, do_configure
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
Poky ["raspberrypi"] >>>



On Tue, Mar 18, 2014 at 2:19 AM, Stephen Arnold
<stephen.arnold42@gmail.com>wrote:

> Because it only works in a separate task (see previous email).
>
>
>
> On Tue, Mar 18, 2014 at 1:46 AM, Andreas M=FCller <
> schnitzeltony@googlemail.com> wrote:
>
>> On Tue, Mar 18, 2014 at 5:34 AM, Stephen Arnold
>> <stephen.arnold42@gmail.com> wrote:
>> > Note: this patch (v3) obseletes previous versions
>> >
>> > libxfce4ui_4.10.0.bb: Upstream changes required autotools and gettext
>> (intl)
>> > fixes, as well as moving the autogen stuff to a separate task.  Full
>> depends
>> > were also added (2 were converted to PACKAGECONFIG options) along with=
 a
>> > vendor config option.
>> >
>> > Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
>> >
>> > ---
>> >  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb | 14
>> ++++++++++----
>> >  1 file changed, 10 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bbb/m=
eta-xfce/recipes-xfce/libxfce4ui/
>> libxfce4ui_4.10.0.bb
>> > index cc63a9f..1e141c4 100644
>> > --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
>> > +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
>> > @@ -2,9 +2,9 @@ SUMMARY =3D "Xfce4 Widget library and X Window System
>> interaction"
>> >  SECTION =3D "x11/libs"
>> >  LICENSE =3D "GPLv2"
>> >  LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a616475"
>> > -DEPENDS =3D "gtk+ intltool libxfce4util startup-notification xfconf
>> glade3"
>> > +DEPENDS =3D "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf
>> xfce4-dev-tools virtual/libx11 libsm libice"
>> >
>> > -inherit xfce
>> > +inherit autotools gettext xfce
>> >
>> >  SRC_URI =3D " \
>> >      git://git.xfce.org/xfce/libxfce4ui;protocol=3Dgit \
>> > @@ -15,9 +15,13 @@ SRCREV =3D "530b72f50fcbd8cb4b970fcc97be0321bf78183=
e"
>> >  PV =3D "4.10.0+git${SRCPV}"
>> >  S =3D "${WORKDIR}/git"
>> >
>> > -EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
>> > +EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug
>>  --with-vendor-info=3D${DISTRO}"
>> >
>> > -do_configure_prepend() {
>> > +PACKAGECONFIG ??=3D ""
>> > +PACKAGECONFIG[gladeui] =3D "--enable-gladeui,--disable-gladeui,glade3=
"
>> > +PACKAGECONFIG[startup-notification] =3D
>> "--enable-startup-notification,--disable-startup-notification,startup-no=
tification"
>> > +
>> > +do_src_prepare() {
>> >         NOCONFIGURE=3Dyes ./autogen.sh
>> >  }
>> >
>> > @@ -27,3 +31,5 @@ FILES_${PN}-dev +=3D "${libdir}/glade3/modules/*.la =
\
>> >  PACKAGES +=3D "${PN}-glade"
>> >  FILES_${PN}-glade =3D "${libdir}/glade3 \
>> >                       ${datadir}/glade3"
>> > +
>> > +addtask do_src_prepare before do_configure after do_patch
>> > --
>> I asked that for lxdm already - maybe I missed something: Why do you
>> create an extra task and do not use do_configure_prepend() ?
>>
>> Andreas
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

