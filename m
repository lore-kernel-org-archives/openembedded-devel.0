Return-Path: <nickdademo@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id DDE1E6E85F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 21:35:29 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id wp18so1671674obc.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 14:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=mvJmm/9nIQjTtmKJkub7eD9kj0TxL9YNGpdjkDeqBwo=;
	b=AwX8vR8QeRAgMLdx0Ar6+GnW60sqWXSn6VLGnU4I2mwSsrER5/gGe+TKB9I/wXWT+g
	88DH4/Mpb4G9E4V/EO4kA7J54G6CMbit7PrPsGALlXUjDni2YJrE2qJDsjACURBW5zBS
	wc67+nLNrhxE9f2rivLu94oSPexVfBccrd5hb+R4gEDA4KD0kNSdXfrXr8KtP2ktI4th
	7RVdkx4tBjB5+I3KXm7KusNxBLArx1XAE4A5PcPA+i1AMVqNM+TJw/wgCPn2U9yeWzCB
	l9cDfWVXm5OO3eEDt2KsktyH2uHyr/uxAV13cJ28R4nnovtMVdbHCxqyd1eoLfX+59uo
	X1RQ==
X-Received: by 10.182.53.72 with SMTP id z8mr3406152obo.36.1394746529996; Thu,
	13 Mar 2014 14:35:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.79.165 with HTTP; Thu, 13 Mar 2014 14:35:09 -0700 (PDT)
In-Reply-To: <20140313102116.GE3759@jama>
References: <CANR6C54WmokZxiFHThuXkZ-kiocewgnGVg7AtbH=FHjr1AFHsg@mail.gmail.com>
	<CANR6C56W7g63xx1D5WOA40YL8B_5j-q=uwt6VgFPW72eNZ=k7Q@mail.gmail.com>
	<CANyK_8eseDidQWN6tfCFXF3dXy6pQMH0uSCSyGAHDJfE_zfwzw@mail.gmail.com>
	<CANR6C55tvGxPN1DsJaupK53Z4HdWM=Zi5X8L7ZXM9k5FRH2LWQ@mail.gmail.com>
	<CANyK_8cKnc87R3AGRy1MpNJB9hbPhq1qr4LL5TdNWuBCZ55=+Q@mail.gmail.com>
	<CANR6C5466yB62G30Bg6LhdNYqz6KHb7hJVHEhLWSp1tC=BzGRQ@mail.gmail.com>
	<CANyK_8fbDxMDXkvoi0o1v6UwVaQx5+rp5C3qWjc=qv-BP5hC3w@mail.gmail.com>
	<CANR6C56dt_DH1yNKCBo8-sX63_wATEoFLpnONA42AQYccMi1=g@mail.gmail.com>
	<CANR6C56QsMoMJ7YLB4UF9jPYDO=aF8QEKPkV8XKrxsE1po29Dg@mail.gmail.com>
	<20140313102116.GE3759@jama>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Fri, 14 Mar 2014 08:35:09 +1100
Message-ID: <CANR6C55HHdF1-YoX2yp=_hxMU-0qQEpR4HbsyNxGQyz0QBx+rw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: tk 8.6.0: strange error: "oe_runmake: command not found"
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
X-List-Received-Date: Thu, 13 Mar 2014 21:35:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

That's right - slightly different error (but still related to oe_runmake
though):

| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-l=
inux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so:
error: undefined reference to 'FcFontRenderPrepare'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternAddMatrix'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcCharSetHasChar'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcCharSetDestroy'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternDestroy'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcFontSetDestroy'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternGetString'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternGetDouble'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternGetInteger'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcConfigSubstitute'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcFontSort'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternGetCharSet'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcCharSetCopy'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternCreate'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternAddString'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternAddDouble'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternAddInteger'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcPatternAddBool'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to =
'FcUtf8ToUcs4'
> | collect2: error: ld returned 1 exit status
> | make: *** [wish] Error 1
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/tk/8.6.0-=
r0/temp/log.do_compile.10692)
> NOTE: recipe tk-8.6.0-r0: task do_compile: Failed
> ERROR: Task 11541 (/home/jenkins/oe/shr-core-branches/shr-core/meta-opene=
mbedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile) failed with=
 exit code '1'
>
>
Any ideas?



On Thu, Mar 13, 2014 at 9:21 PM, Martin Jansa <martin.jansa@gmail.com>wrote=
:

> On Thu, Mar 13, 2014 at 07:23:36PM +1100, Nick D'Ademo wrote:
> > This bug is still present and has been for nearly 3 months now.
>
> tk is regularly failing in world builds for more than 3 months:
> www.openembedded.org/wiki/Bitbake_World_Status
> but with different error.
>
> > Has anyone else encountered it or has any ideas as to why oe_runmake
> isn't
> > being found?
> >
> >
> >
> >
> > On Tue, Feb 18, 2014 at 3:11 AM, Nick D'Ademo <nickdademo@gmail.com>
> wrote:
> >
> > > No worries Paul.
> > >
> > > The issue is currently listed in the state of Bitbake world failed
> tasks
> > > as well, so hopefully someone else may see it and have a better idea.
> > >
> > >
> > >
> > >
> > > On Mon, Feb 17, 2014 at 8:35 PM, Paul Barker <paul@paulbarker.me.uk
> >wrote:
> > >
> > >> On 11 February 2014 13:01, Nick D'Ademo <nickdademo@gmail.com> wrote=
:
> > >> > The only reference to "oe_runmake" in the run file is within the
> > >> > autotools_do_install() function (as pasted in my previous message)=
.
> > >> >
> > >> > Complete run file below:
> > >> >
> > >> >> #!/bin/sh
> > >> >>
> > >> >> # Emit a useful diagnostic if something fails:
> > >> >> bb_exit_handler() {
> > >> >>     ret=3D$?
> > >> >>     case $ret in
> > >> >>     0)  ;;
> > >> >>     *)  case $BASH_VERSION in
> > >> >>         "")   echo "WARNING: exit code $ret from a shell
> command.";;
> > >> >>         *)    echo "WARNING: ${BASH_SOURCE[0]}:${BASH_LINENO[0]}
> exit
> > >> $ret
> > >> >> from
> > >> >>   "$BASH_COMMAND"";;
> > >> >>         esac
> > >> >>         exit $ret
> > >> >>     esac
> > >> >> }
> > >> >> trap 'bb_exit_handler' 0
> > >> >> set -e
> > >> >> export localstatedir=3D"/var"
> > >> >> export prefix=3D"/usr"
> > >> >> export LD=3D"x86_64-poky-linux-ld
> > >> >> --sysroot=3D/home/nick/poky/build/tmp/sysroots/nuc  "
> > >> >> export RANLIB=3D"x86_64-poky-linux-ranlib"
> > >> >> export CXX=3D"x86_64-poky-linux-g++  -m64 -march=3Dcorei7 -mtune=
=3Dcorei7
> > >> >> -mfpmath=3Dsse -msse4.2
> --sysroot=3D/home/nick/poky/build/tmp/sysroots/nuc"
> > >> >> export lt_cv_sys_lib_dlsearch_path_spec=3D"/usr/lib64 /lib64"
> > >> >> export servicedir=3D"/srv"
> > >> >> export sysconfdir=3D"/etc"
> > >> >> export TARGET_LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed"
> > >> >> export PKG_CONFIG_DISABLE_UNINSTALLED=3D"yes"
> > >> >> export STRINGS=3D"x86_64-poky-linux-strings"
> > >> >> export
> > >> >>
> > >>
> BUILD_CFLAGS=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-linux/usr=
/include
> > >> >> -O2 -pipe"
> > >> >> export base_prefix=3D""
> > >> >> export CPP=3D"x86_64-poky-linux-gcc -E
> > >> >> --sysroot=3D/home/nick/poky/build/tmp/sysroots/nuc  -m64
> -march=3Dcorei7
> > >> >> -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2"
> > >> >> export
> > >> >>
> > >>
> PSEUDO_LOCALSTATEDIR=3D"/home/nick/poky/build/tmp/work/corei7-64-poky-lin=
ux/tk/8.6.0-r0/pseudo/"
> > >> >> export LOGNAME=3D"nick"
> > >> >> export STRIP=3D"x86_64-poky-linux-strip"
> > >> >> export datadir=3D"/usr/share"
> > >> >> export
> PKG_CONFIG_SYSROOT_DIR=3D"/home/nick/poky/build/tmp/sysroots/nuc"
> > >> >> export bindir=3D"/usr/bin"
> > >> >> export mandir=3D"/usr/share/man"
> > >> >> export
> > >> >>
> > >>
> CPPFLAGS_FOR_BUILD=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-lin=
ux/usr/include"
> > >> >> export PATCH_GET=3D"0"
> > >> >> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> > >> >> -Wl,-rpath,/usr/lib64/tcltk/8.6.0/lib"
> > >> >> export MAKE=3D"make"
> > >> >> export
> > >> >>
> > >>
> PKG_CONFIG_PATH=3D"/home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/pkgco=
nfig:/home/nick/poky/build/tmp/sysroots/nuc/usr/share/pkgconfig"
> > >> >> export LD_FOR_BUILD=3D"ld "
> > >> >> export AS=3D"x86_64-poky-linux-as  "
> > >> >> export AR=3D"x86_64-poky-linux-ar"
> > >> >> export exec_prefix=3D"/usr"
> > >> >> export LC_ALL=3D"C"
> > >> >> export base_libdir=3D"/lib64"
> > >> >> export
> > >> >>
> > >>
> PATH=3D"/home/nick/poky/scripts:/home/nick/poky/build/tmp/sysroots/i686-l=
inux/usr/bin/corei7-64-poky-linux:/home/nick/poky/build/tmp/sysroots/nuc/us=
r/bin/crossscripts:/home/nick/poky/build/tmp/sysroots/i686-linux/usr/sbin:/=
home/nick/poky/build/tmp/sysroots/i686-linux/usr/bin:/home/nick/poky/build/=
tmp/sysroots/i686-linux/sbin:/home/nick/poky/build/tmp/sysroots/i686-linux/=
bin:/home/nick/poky/scripts:/home/nick/poky/bitbake/bin:/usr/lib/lightdm/li=
ghtdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/gam=
es:/home/nick/workspace/tye-firmware/util/arm-2011.03/bin"
> > >> >> export infodir=3D"/usr/share/info"
> > >> >> export BUILD_CC=3D"gcc "
> > >> >> export
> > >> >>
> BUILD_LDFLAGS=3D"-L/home/nick/poky/build/tmp/sysroots/i686-linux/usr/lib
> > >> >> -L/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> > >> >>
> -Wl,-rpath-link,/home/nick/poky/build/tmp/sysroots/i686-linux/usr/lib
> > >> >> -Wl,-rpath-link,/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> > >> >> -Wl,-rpath,/home/nick/poky/build/tmp/sysroots/i686-linux/usr/lib
> > >> >> -Wl,-rpath,/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> -Wl,-O1"
> > >> >> export BUILD_CCLD=3D"gcc "
> > >> >> export
> > >> >>
> > >>
> CFLAGS_FOR_BUILD=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-linux=
/usr/include
> > >> >> -O2 -pipe"
> > >> >> export CC=3D"x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=
=3Dcorei7
> > >> >> -mfpmath=3Dsse -msse4.2
> --sysroot=3D/home/nick/poky/build/tmp/sysroots/nuc"
> > >> >> export CPPFLAGS=3D""
> > >> >> export OBJCOPY=3D"x86_64-poky-linux-objcopy"
> > >> >> export systemd_unitdir=3D"/lib/systemd"
> > >> >> export
> > >> >>
> > >>
> PKG_CONFIG_DIR=3D"/home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/pkgcon=
fig"
> > >> >> export CCLD=3D"x86_64-poky-linux-gcc  -m64 -march=3Dcorei7
> -mtune=3Dcorei7
> > >> >> -mfpmath=3Dsse -msse4.2
> --sysroot=3D/home/nick/poky/build/tmp/sysroots/nuc"
> > >> >> export base_bindir=3D"/bin"
> > >> >> export
> > >> >>
> > >>
> PKG_CONFIG_LIBDIR=3D"/home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/pkg=
config"
> > >> >> export sbindir=3D"/usr/sbin"
> > >> >> export CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types"
> > >> >> export
> > >> >>
> > >>
> LDFLAGS_FOR_BUILD=3D"-L/home/nick/poky/build/tmp/sysroots/i686-linux/usr/=
lib
> > >> >> -L/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> > >> >>
> -Wl,-rpath-link,/home/nick/poky/build/tmp/sysroots/i686-linux/usr/lib
> > >> >> -Wl,-rpath-link,/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> > >> >> -Wl,-rpath,/home/nick/poky/build/tmp/sysroots/i686-linux/usr/lib
> > >> >> -Wl,-rpath,/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> -Wl,-O1"
> > >> >> export docdir=3D"/usr/share/doc"
> > >> >> export TERM=3D"xterm"
> > >> >> export CCACHE_DISABLE=3D"1"
> > >> >> export
> > >> >>
> > >>
> BUILD_CXXFLAGS=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-linux/u=
sr/include
> > >> >> -O2 -pipe -fpermissive"
> > >> >> export FC=3D"x86_64-poky-linux-gfortran  -m64 -march=3Dcorei7
> -mtune=3Dcorei7
> > >> >> -mfpmath=3Dsse -msse4.2
> --sysroot=3D/home/nick/poky/build/tmp/sysroots/nuc"
> > >> >> export HOME=3D"/home/nick"
> > >> >> export CXXFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types
> > >> -fpermissive
> > >> >> -fvisibility-inlines-hidden"
> > >> >> unset MACHINE
> > >> >> export BUILD_STRIP=3D"strip"
> > >> >> export PSEUDO_PASSWD=3D"/home/nick/poky/build/tmp/sysroots/nuc"
> > >> >> export libexecdir=3D"/usr/lib64/tk"
> > >> >> export TARGET_CXXFLAGS=3D" -O2 -pipe -g
> -feliminate-unused-debug-types
> > >> >> -fpermissive"
> > >> >> export includedir=3D"/usr/include"
> > >> >> export BUILD_LD=3D"ld "
> > >> >> export oldincludedir=3D"/usr/include"
> > >> >> export BUILD_RANLIB=3D"ranlib"
> > >> >> export BUILD_NM=3D"nm"
> > >> >> export BUILD_AR=3D"ar"
> > >> >> export BUILD_AS=3D"as "
> > >> >> export sharedstatedir=3D"/com"
> > >> >> export CONFIG_SITE=3D"/home/nick/poky/meta/site/endian-little
> > >> >> /home/nick/poky/meta/site/common-linux
> > >> >> /home/nick/poky/meta/site/common-glibc
> > >> >> /home/nick/poky/meta/site/x86_64-linux
> /home/nick/poky/meta/site/common
> > >> >> /home/nick/poky/meta-openembedded/meta-oe/site/endian-little "
> > >> >> export PSEUDO_DISABLED=3D"0"
> > >> >> export CXX_FOR_BUILD=3D"g++ "
> > >> >> export libdir=3D"/usr/lib64"
> > >> >> export nonarch_base_libdir=3D"/lib"
> > >> >> export BUILD_CXX=3D"g++ "
> > >> >> unset TARGET_ARCH
> > >> >> export CCACHE_DIR=3D"/home/nick"
> > >> >> export
> > >> PSEUDO_PREFIX=3D"/home/nick/poky/build/tmp/sysroots/i686-linux/usr"
> > >> >> export BUILD_CPP=3D"cpp "
> > >> >> export base_sbindir=3D"/sbin"
> > >> >> export USER=3D"nick"
> > >> >> export NM=3D"x86_64-poky-linux-nm"
> > >> >> export
> > >> >>
> > >>
> BUILD_CPPFLAGS=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-linux/u=
sr/include"
> > >> >> export BUILD_FC=3D"gfortran "
> > >> >> export CPP_FOR_BUILD=3D"cpp "
> > >> >> export TARGET_CPPFLAGS=3D""
> > >> >> export
> > >> >>
> > >>
> CXXFLAGS_FOR_BUILD=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-lin=
ux/usr/include
> > >> >> -O2 -pipe -fpermissive"
> > >> >> export TARGET_CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-ty=
pes"
> > >> >> export OBJDUMP=3D"x86_64-poky-linux-objdump"
> > >> >> unset DISTRO
> > >> >> export CC_FOR_BUILD=3D"gcc "
> > >> >> export SHELL=3D"/bin/bash"
> > >> >> export PSEUDO_NOSYMLINKEXP=3D"1"
> > >> >> do_install() {
> > >> >>     autotools_do_install
> > >> >>     ln -sf libtk8.6.so
> > >> >>
> > >>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr=
/lib64/libtk8.6.so.0
> > >> >>     oe_libinstall -so libtk8.6
> > >> >>
> > >>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr=
/lib64
> > >> >>     ln -sf wish8.6
> > >> >>
> > >>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr=
/bin/wish
> > >> >>
> > >> >>     # Even after passing libdir=3D/usr/lib64 at config, some
> incorrect
> > >> dirs
> > >> >> are still generated for the multilib build
> > >> >>     if [ "$libdir" !=3D "/usr/lib" ]; then
> > >> >>         # Move files to correct library directory
> > >> >>         mv
> > >> >>
> > >>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr=
/lib/tk8.6/*
> > >> >>
> > >>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image//us=
r/lib64/tk8.6/
> > >> >>         # Remove unneeded/incorrect dir ('usr/lib/')
> > >> >>         rm -rf
> > >> >>
> > >>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr=
/lib
> > >> >>     fi
> > >> >>
> > >> >> }
> > >> >>
> > >> >> oe_libinstall() {
> > >> >>     # Purpose: Install a library, in all its forms
> > >> >>     # Example
> > >> >>     #
> > >> >>     # oe_libinstall libltdl
> > >> >> /home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/
> > >> >>     # oe_libinstall -C src/libblah libblah
> > >> >>
> > >>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image//us=
r/lib64/
> > >> >>     dir=3D""
> > >> >>     libtool=3D""
> > >> >>     silent=3D""
> > >> >>     require_static=3D""
> > >> >>     require_shared=3D""
> > >> >>     staging_install=3D""
> > >> >>     while [ "$#" -gt 0 ]; do
> > >> >>         case "$1" in
> > >> >>         -C)
> > >> >>             shift
> > >> >>             dir=3D"$1"
> > >> >>             ;;
> > >> >>         -s)
> > >> >>             silent=3D1
> > >> >>             ;;
> > >> >>         -a)
> > >> >>             require_static=3D1
> > >> >>             ;;
> > >> >>         -so)
> > >> >>             require_shared=3D1
> > >> >>             ;;
> > >> >>         -*)
> > >> >>             bbfatal "oe_libinstall: unknown option: $1"
> > >> >>             ;;
> > >> >>         *)
> > >> >>             break;
> > >> >>             ;;
> > >> >>         esac
> > >> >>         shift
> > >> >>     done
> > >> >>
> > >> >>     libname=3D"$1"
> > >> >>     shift
> > >> >>     destpath=3D"$1"
> > >> >>     if [ -z "$destpath" ]; then
> > >> >>         bbfatal "oe_libinstall: no destination path specified"
> > >> >>     fi
> > >> >>     if echo "$destpath/" | egrep
> > >> >> '^/home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/' >/dev/null
> > >> >>     then
> > >> >>         staging_install=3D1
> > >> >>     fi
> > >> >>
> > >> >>     __runcmd () {
> > >> >>         if [ -z "$silent" ]; then
> > >> >>             echo >&2 "oe_libinstall: $*"
> > >> >>         fi
> > >> >>         $*
> > >> >>     }
> > >> >>
> > >> >>     if [ -z "$dir" ]; then
> > >> >>         dir=3D`pwd`
> > >> >>     fi
> > >> >>
> > >> >>     dotlai=3D$libname.lai
> > >> >>
> > >> >>     # Sanity check that the libname.lai is unique
> > >> >>     number_of_files=3D`(cd $dir; find . -name "$dotlai") | wc -l`
> > >> >>     if [ $number_of_files -gt 1 ]; then
> > >> >>         bbfatal "oe_libinstall: $dotlai is not unique in $dir"
> > >> >>     fi
> > >> >>
> > >> >>
> > >> >>     dir=3D$dir`(cd $dir;find . -name "$dotlai") | sed
> > >> >> "s/^\.//;s/\/$dotlai\$//;q"`
> > >> >>     olddir=3D`pwd`
> > >> >>     __runcmd cd $dir
> > >> >>
> > >> >>     lafile=3D$libname.la
> > >> >>
> > >> >>     # If such file doesn't exist, try to cut version suffix
> > >> >>     if [ ! -f "$lafile" ]; then
> > >> >>         libname1=3D`echo "$libname" | sed 's/-[0-9.]*$//'`
> > >> >>         lafile1=3D$libname.la
> > >> >>         if [ -f "$lafile1" ]; then
> > >> >>             libname=3D$libname1
> > >> >>             lafile=3D$lafile1
> > >> >>         fi
> > >> >>     fi
> > >> >>
> > >> >>     if [ -f "$lafile" ]; then
> > >> >>         # libtool archive
> > >> >>         eval `cat $lafile|grep "^library_names=3D"`
> > >> >>         libtool=3D1
> > >> >>     else
> > >> >>         library_names=3D"$libname.so* $libname.dll.a
> $libname.*.dylib"
> > >> >>     fi
> > >> >>
> > >> >>     __runcmd install -d $destpath/
> > >> >>     dota=3D$libname.a
> > >> >>     if [ -f "$dota" -o -n "$require_static" ]; then
> > >> >>         rm -f $destpath/$dota
> > >> >>         __runcmd install -m 0644 $dota $destpath/
> > >> >>     fi
> > >> >>     if [ -f "$dotlai" -a -n "$libtool" ]; then
> > >> >>         rm -f $destpath/$libname.la
> > >> >>         __runcmd install -m 0644 $dotlai $destpath/$libname.la
> > >> >>     fi
> > >> >>
> > >> >>     for name in $library_names; do
> > >> >>         files=3D`eval echo $name`
> > >> >>         for f in $files; do
> > >> >>             if [ ! -e "$f" ]; then
> > >> >>                 if [ -n "$libtool" ]; then
> > >> >>                     bbfatal "oe_libinstall: $dir/$f not found."
> > >> >>                 fi
> > >> >>             elif [ -L "$f" ]; then
> > >> >>                 __runcmd cp -P "$f" $destpath/
> > >> >>             elif [ ! -L "$f" ]; then
> > >> >>                 libfile=3D"$f"
> > >> >>                 rm -f $destpath/$libfile
> > >> >>                 __runcmd install -m 0755 $libfile $destpath/
> > >> >>             fi
> > >> >>         done
> > >> >>     done
> > >> >>
> > >> >>     if [ -z "$libfile" ]; then
> > >> >>         if  [ -n "$require_shared" ]; then
> > >> >>             bbfatal "oe_libinstall: unable to locate shared
> library"
> > >> >>         fi
> > >> >>     elif [ -z "$libtool" ]; then
> > >> >>         # special case hack for non-libtool .so.#.#.# links
> > >> >>         baselibfile=3D`basename "$libfile"`
> > >> >>         if (echo $baselibfile | grep -qE '^lib.*\.so\.[0-9.]*$');
> then
> > >> >>             sonamelink=3D`x86_64-poky-linux-readelf -d $libfile |=
grep
> > >> >> 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
> > >> >>             solink=3D`echo $baselibfile | sed -e 's/\.so\..*/.so/=
'`
> > >> >>             if [ -n "$sonamelink" -a x"$baselibfile" !=3D
> x"$sonamelink"
> > >> ];
> > >> >> then
> > >> >>                 __runcmd ln -sf $baselibfile $destpath/$sonamelin=
k
> > >> >>             fi
> > >> >>             __runcmd ln -sf $baselibfile $destpath/$solink
> > >> >>         fi
> > >> >>     fi
> > >> >>
> > >> >>     __runcmd cd "$olddir"
> > >> >>
> > >> >>
> > >> >> }
> > >> >>
> > >> >> autotools_do_install() {
> > >> >>     oe_runmake
> > >> >>
> > >>
> 'DESTDIR=3D/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r=
0/image'
> > >> >> install
> > >> >>     # Info dir listing isn't interesting at this point so remove
> it if
> > >> it
> > >> >> exists.
> > >> >>     if [ -e
> > >> >>
> > >>
> "/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/us=
r/share/info/dir"
> > >> >> ]; then
> > >> >>         rm -f
> > >> >>
> > >>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr=
/share/info/dir
> > >> >>     fi
> > >> >>
> > >> >> }
> > >> >>
> > >> >> bbfatal() {
> > >> >>     echo "ERROR: $*"
> > >> >>     exit 1
> > >> >>
> > >> >> }
> > >> >>
> > >> >> cd
> > >> >>
> > >>
> '/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/tk8.6.0/=
unix'
> > >> >> do_install
> > >> >>
> > >> >> # cleanup
> > >> >> ret=3D$?
> > >> >> trap '' 0
> > >> >> exit $?
> > >> >
> > >>
> > >> Sorry, I'm lost on where to look next on this. The run files in my
> > >> builds include the definition of oe_runmake() and the other function=
s
> > >> which are used so I assume that's what's supposed to happen. I was
> > >> hoping someone else would notice this thread and have a better idea
> > >> what the underlying problem might be. I've never really looked at th=
e
> > >> internals of bitbake or how these scripts are generated.
> > >>
> > >> I'd suggest asking on the #oe or #yocto channels on irc.freenode.net=
,
> > >> plus maybe reposting to yocto@yoctoproject.org if no-one else replie=
s
> > >> to this and you still need help.
> > >>
> > >> Sorry I can't be any more help.
> > >>
> > >> --
> > >> Paul Barker
> > >>
> > >> Email: paul@paulbarker.me.uk
> > >> http://www.paulbarker.me.uk
> > >>
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

