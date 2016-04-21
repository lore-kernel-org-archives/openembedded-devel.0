Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C6BCA6018C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 14:49:58 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1atFva-0005lW-O4 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2016 07:49:58 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.18]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Thu, 21 Apr 2016 15:49:35 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v3 2/2] mpv: Media Player
Thread-Index: AQHRgFs7eCG28ASh706MY+f5laQvMJ+UuTYg
Date: Thu, 21 Apr 2016 14:49:34 +0000
Message-ID: <365E1805BC95084CBE82381A0B8699940127D133B7@EU-MBX-01.mgc.mentorg.com>
References: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
	<1457626042-28653-3-git-send-email-gary@mlbassoc.com>
	<20160311131752.GA2555@jama> <56E3A074.2020509@mlbassoc.com>
	<56EA7828.4030606@mlbassoc.com>
	<CA+chaQcnUGp3=ovW17O+-6Do_fimaOST6BeprK6L+=++Rh0_oA@mail.gmail.com>
	<56EA7CB3.30002@mlbassoc.com> <20160317144519.GD2553@jama>
In-Reply-To: <20160317144519.GD2553@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v3 2/2] mpv: Media Player
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
X-List-Received-Date: Thu, 21 Apr 2016 14:49:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Gary,

Are you planning to send updated PR for MPV?

Noor

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Thursday, March 17, 2016 7:45 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH v3 2/2] mpv: Media Player

On Thu, Mar 17, 2016 at 10:45:23AM +0100, Gary Thomas wrote:
> On 03/17/2016 10:38 AM, Martin Jansa wrote:
> > I don't know, but it doesn't matter what pulled rst.
> >
> > mpv should build ok with or without rst available.
>=20
> I agree and it does build without rst in the mix.  It fails if those=20
> tools are present and I'd like to fix it but I don't know what is=20
> bringing them in (and I don't have the resources available to run=20
> 'bitbake world')

There is also:
mpv-0.15.0: mpv rdepends on libjack, but it isn't a build dependency, missi=
ng jack in DEPENDS or PACKAGECONFIG? [build-deps]

> > On Thu, Mar 17, 2016 at 10:26 AM, Gary Thomas <gary@mlbassoc.com> wrote=
:
> >
> >> Ping?  Once I understand why it breaks in world builds, I can=20
> >> submit a new patchset.
> >> See below - what's causing rst to be brought in?
> >>
> >> Thanks
> >>
> >>
> >> On 03/12/2016 05:52 AM, Gary Thomas wrote:
> >>
> >>> On 2016-03-11 14:17, Martin Jansa wrote:
> >>>
> >>>> On Thu, Mar 10, 2016 at 05:07:22PM +0100, Gary Thomas wrote:
> >>>>
> >>>>> mpv is a fork of mplayer2 and MPlayer. It shares some features=20
> >>>>> with the former projects while introducing many more.
> >>>>>
> >>>>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> >>>>> ---
> >>>>>    meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 67
> >>>>> ++++++++++++++++++++++++
> >>>>>    1 file changed, 67 insertions(+)
> >>>>>    create mode 100644=20
> >>>>> meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >>>>>
> >>>>> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >>>>> b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >>>>> new file mode 100644
> >>>>> index 0000000..acad319
> >>>>> --- /dev/null
> >>>>> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >>>>> @@ -0,0 +1,67 @@
> >>>>> +SUMMARY =3D "Open Source multimedia player"
> >>>>> +SECTION =3D "multimedia"
> >>>>> +HOMEPAGE =3D "http://www.mpv.io/"
> >>>>> +DEPENDS =3D "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
> >>>>> +           libxscrnsaver libv4l libxinerama \ "
> >>>>>
> >>>>
> >>>> It's failing in world builds
> >>>>
> >>>> ERROR: mpv-0.15.0-r0 do_compile: Function failed: do_compile (log=20
> >>>> file is located at
> >>>>
> >>>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-g
> >>>> nueabi/mpv/0.15.0-r0/temp/log.do_compile.11834)
> >>>> ERROR: Logfile of failure stored in:
> >>>>
> >>>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-g
> >>>> nueabi/mpv/0.15.0-r0/temp/log.do_compile.11834
> >>>> Log data follows:
> >>>> | DEBUG: Executing shell function do_compile
> >>>> | Waf: Entering directory
> >>>>
> >>>> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnu=
eabi/mpv/0.15.0-r0/mpv-0.15.0/build'
> >>>> | [  1/195] Compiling version.sh
> >>>> | [  2/195] Compiling
> >>>> TOOLS/osxbundle/mpv.app/Contents/Resources/icon.icns
> >>>> | [  3/195] Compiling video/out/x11_icon.bin [  4/195] Compiling=20
> >>>> | etc/input.conf [  5/195] Compiling sub/osd_font.otf [  6/195]=20
> >>>> | Compiling video/out/opengl/nnedi3_weights.bin
> >>>> | [  7/195] Compiling player/lua/defaults.lua [  8/195] Compiling=20
> >>>> | player/lua/assdraw.lua [  9/195] Compiling=20
> >>>> | player/lua/options.lua [ 10/195] Compiling player/lua/osc.lua [=20
> >>>> | 11/195] Compiling player/lua/ytdl_hook.lua [ 13/195] Processing=20
> >>>> | ebml_types.h: demux/ebml.c demux/demux_mkv.c ->
> >>>> build/ebml_types.h
> >>>> | [ 13/195] Compiling demux/ebml.c [ 14/195] Compiling=20
> >>>> | DOCS/man/mpv.rst Traceback (most recent call last):
> >>>> |   File
> >>>> "/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/
> >>>> usr/bin/rst2man.py",
> >>>> line 21, in <module>
> >>>> |     from docutils.core import publish_cmdline,=20
> >>>> | default_description
> >>>> | ImportError: No module named docutils.core
> >>>> |
> >>>> | Waf: Leaving directory
> >>>>
> >>>> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnu=
eabi/mpv/0.15.0-r0/mpv-0.15.0/build'
> >>>> | Build failed
> >>>> |  -> task in 'rst2man' failed (exit status 1):
> >>>> |     {task 139933719149072: rst2man mpv.rst -> mpv.1} '
> >>>> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/u
> >>>> sr/bin/rst2man.py
> >>>> ../DOCS/man/mpv.rst
> >>>> DOCS/man/mpv.1 '
> >>>> | WARNING: exit code 1 from a shell command.
> >>>> | ERROR: Function failed: do_compile (log file is located at
> >>>>
> >>>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-g
> >>>> nueabi/mpv/0.15.0-r0/temp/log.do_compile.11834)
> >>>> NOTE: recipe mpv-0.15.0-r0: task do_compile: Failed
> >>>> ERROR: Task 15304
> >>>> (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipe
> >>>> s-multimedia/mplayer/
> >>>> mpv_0.15.0.bb,
> >>>> do_compile) failed with exit code '1'
> >>>>
> >>>>
> >>> What recipe/package is pulling in rst?  I'll check the config=20
> >>> options and make sure it builds correctly with/without that package p=
resent.
> >>>
> >>> +
> >>>>> +REQUIRED_DISTRO_FEATURES =3D "x11"
> >>>>> +
> >>>>> +LICENSE =3D "GPLv2+"
> >>>>> +LIC_FILES_CHKSUM =3D
> >>>>> "file://LICENSE;md5=3D91f1cb870c1cc2d31351a4d2595441cb"
> >>>>> +
> >>>>> +SRC_URI =3D "
> >>>>> https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=3Dmpv=
=20
> >>>>> \
> >>>>> +
> >>>>> http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=3Dwaf \
> >>>>> +"
> >>>>> +SRC_URI[mpv.md5sum] =3D "9042bd3fbff2bc8ba0b7fadaa4a22101"
> >>>>> +SRC_URI[mpv.sha256sum] =3D
> >>>>> "7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
> >>>>> +SRC_URI[waf.md5sum] =3D "cef4ee82206b1843db082d0b0506bf71"
> >>>>> +SRC_URI[waf.sha256sum] =3D
> >>>>> "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
> >>>>> +
> >>>>> +inherit pkgconfig
> >>>>> +
> >>>>> +# Note: both lua and libass are required to get=20
> >>>>> +on-screen-display
> >>>>> (controls)
> >>>>> +PACKAGECONFIG ??=3D "lua libass"
> >>>>> +PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua luajit"
> >>>>> +PACKAGECONFIG[libass] =3D "--enable-libass,--disable-libass,libass=
"
> >>>>> +PACKAGECONFIG[libarchive] =3D
> >>>>> "--enable-libarchive,--disable-libarchive,libarchive"
> >>>>> +
> >>>>> +EXTRA_OECONF =3D " \
> >>>>> +    --prefix=3D${prefix} \
> >>>>> +    --target=3D${SIMPLE_TARGET_SYS} \
> >>>>>
> >>>>
> >>>> Where is this variable set? git grep in oe-core and meta-oe=20
> >>>> didn't show anything.
> >>>>
> >>>> Did you copy it from mplayer2 recipe?
> >>>>
> >>>> If yes then you forgot to include:
> >>>> export SIMPLE_TARGET_SYS=3D"$(echo ${TARGET_SYS} | sed=20
> >>>> s:${TARGET_VENDOR}::g)"
> >>>>
> >>>
> >>> Thanks for pointing this out.
> >>>
> >>>
> >>>> +    --confdir=3D${sysconfdir} \
> >>>>> +    --datadir=3D${datadir} \
> >>>>> +    --disable-manpage-build \
> >>>>> +    --disable-gl \
> >>>>> +    --disable-libsmbclient \
> >>>>> +    --disable-encoding \
> >>>>> +    --disable-libbluray \
> >>>>> +    --disable-dvdread \
> >>>>> +    --disable-dvdnav \
> >>>>> +    --disable-cdda \
> >>>>> +    --disable-enca \
> >>>>> +    --disable-libguess \
> >>>>> +    --disable-uchardet \
> >>>>> +    --disable-rubberband \
> >>>>> +    --disable-lcms2 \
> >>>>> +    --disable-vapoursynth \
> >>>>> +    --disable-vapoursynth-lazy \ "
> >>>>> +
> >>>>> +do_configure() {
> >>>>> +    if [ ! -L ../waf ]; then
> >>>>> +        chmod a+x ../waf-1.8.12
> >>>>> +    ln -s waf-1.8.12 ../waf
> >>>>> +    fi
> >>>>> +    ../waf configure ${EXTRA_OECONF} }
> >>>>> +
> >>>>> +do_compile () {
> >>>>> +    ../waf build
> >>>>> +}
> >>>>> +
> >>>>> +do_install() {
> >>>>> +    ../waf install --destdir=3D${D} }
> >>>>> +
> >>>>> +FILES_${PN} +=3D "${datadir}/icons"
> >>>>> --
> >>>>> 2.5.0
> >>>>>
> >>>>
> >>>
> >>
> >> --
> >> ------------------------------------------------------------
> >> Gary Thomas                 |  Consulting for the
> >> MLB Associates              |    Embedded world
> >> ------------------------------------------------------------
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>=20
>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

