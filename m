Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4D64773166
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:41:35 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l68so120335552wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 07:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sRhQ+wizabGn65CY0ZfRoVVv4tFfaAXlrvF4D8Cd5g0=;
	b=UGZl4eYa8A0OjTQlERIrqoVC6tFrhU5IDpBXxjcU1ulWLv2kDiRRSBQZ/jP1qlg3wQ
	PemIeFWO7u4ZPU7NLWnswl4HlFXHqTGlMZ6dWSHqRlGOFPJR64mkCgtK8HXxJhE6ghci
	eeSagwcOQXCT9nnnVWqju7nwXwu46quObLzlnYGSsddHWyriTr5mu9VQS/lxaCunvf0V
	UAKASCH27aCDe22yK3gcETEqh2qPWNLdDMEn5ms1rqrrga/M84674UbCEUdVxfDYkgKK
	Q7Ad4TRSsSCR2s+tvYHo28z2P2LiMX3r0sIV2KW7b42dpTgtFo7GuoAyz+TEcMkvukLE
	WB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sRhQ+wizabGn65CY0ZfRoVVv4tFfaAXlrvF4D8Cd5g0=;
	b=CAjQgo4Bqg/8q6uiFbrEiCD8gTWgTJzkI6CXeSqUUDm0M0Y9+o54YjdXv8td4rA9Fb
	+IWXg3LPu1rzMWPJB2OzVdjQpaKJt2wzqiDOwisdcG85MyLsV0TuEDjPjinvTf9SQpvR
	bmumYD4TUvPN4RHBdJ128wEUFAjNpafEzA9V9VZmal2Ti9TmE6uoByzMPXFDHORtiW//
	bE8eO0VCR0qp7Qkn1rY834b69xQblGdFm095IwknR/aS09YDftRVK5o+w0wLc5rVs1RB
	fHvQCjkhfNiTYnQirtCCpIr7ht0nTQlqA9cpI5uMdu4IIrhOGiZaLH+qf9vA7t8T4gwM
	fEUg==
X-Gm-Message-State: AD7BkJJAg+Hr/mAFSVXYyOl3oyTu/LMfAi5xMvUpEZoWmbDZT7+D46v6rveUf+KjqkJooQ==
X-Received: by 10.28.136.211 with SMTP id k202mr39131861wmd.93.1458225696394; 
	Thu, 17 Mar 2016 07:41:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id gk4sm8005771wjd.7.2016.03.17.07.41.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 07:41:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 15:45:19 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160317144519.GD2553@jama>
References: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
	<1457626042-28653-3-git-send-email-gary@mlbassoc.com>
	<20160311131752.GA2555@jama> <56E3A074.2020509@mlbassoc.com>
	<56EA7828.4030606@mlbassoc.com>
	<CA+chaQcnUGp3=ovW17O+-6Do_fimaOST6BeprK6L+=++Rh0_oA@mail.gmail.com>
	<56EA7CB3.30002@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <56EA7CB3.30002@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 17 Mar 2016 14:41:36 -0000
X-Groupsio-MsgNum: 60549
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 10:45:23AM +0100, Gary Thomas wrote:
> On 03/17/2016 10:38 AM, Martin Jansa wrote:
> > I don't know, but it doesn't matter what pulled rst.
> >
> > mpv should build ok with or without rst available.
>=20
> I agree and it does build without rst in the mix.  It fails if those tools
> are present and I'd like to fix it but I don't know what is bringing them
> in (and I don't have the resources available to run 'bitbake world')

There is also:
mpv-0.15.0: mpv rdepends on libjack, but it isn't a build dependency,
missing jack in DEPENDS or PACKAGECONFIG? [build-deps]

> > On Thu, Mar 17, 2016 at 10:26 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> >
> >> Ping?  Once I understand why it breaks in world builds, I can submit a=
 new
> >> patchset.
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
> >>>>> mpv is a fork of mplayer2 and MPlayer. It shares some features with
> >>>>> the former projects while introducing many more.
> >>>>>
> >>>>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> >>>>> ---
> >>>>>    meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 67
> >>>>> ++++++++++++++++++++++++
> >>>>>    1 file changed, 67 insertions(+)
> >>>>>    create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0=
=2Ebb
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
> >>>>> +           libxscrnsaver libv4l libxinerama \
> >>>>> +"
> >>>>>
> >>>>
> >>>> It's failing in world builds
> >>>>
> >>>> ERROR: mpv-0.15.0-r0 do_compile: Function failed: do_compile (log fi=
le
> >>>> is located at
> >>>>
> >>>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnue=
abi/mpv/0.15.0-r0/temp/log.do_compile.11834)
> >>>> ERROR: Logfile of failure stored in:
> >>>>
> >>>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnue=
abi/mpv/0.15.0-r0/temp/log.do_compile.11834
> >>>> Log data follows:
> >>>> | DEBUG: Executing shell function do_compile
> >>>> | Waf: Entering directory
> >>>>
> >>>> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnu=
eabi/mpv/0.15.0-r0/mpv-0.15.0/build'
> >>>> | [  1/195] Compiling version.sh
> >>>> | [  2/195] Compiling
> >>>> TOOLS/osxbundle/mpv.app/Contents/Resources/icon.icns
> >>>> | [  3/195] Compiling video/out/x11_icon.bin
> >>>> | [  4/195] Compiling etc/input.conf
> >>>> | [  5/195] Compiling sub/osd_font.otf
> >>>> | [  6/195] Compiling video/out/opengl/nnedi3_weights.bin
> >>>> | [  7/195] Compiling player/lua/defaults.lua
> >>>> | [  8/195] Compiling player/lua/assdraw.lua
> >>>> | [  9/195] Compiling player/lua/options.lua
> >>>> | [ 10/195] Compiling player/lua/osc.lua
> >>>> | [ 11/195] Compiling player/lua/ytdl_hook.lua
> >>>> | [ 13/195] Processing ebml_types.h: demux/ebml.c demux/demux_mkv.c =
->
> >>>> build/ebml_types.h
> >>>> | [ 13/195] Compiling demux/ebml.c
> >>>> | [ 14/195] Compiling DOCS/man/mpv.rst
> >>>> | Traceback (most recent call last):
> >>>> |   File
> >>>> "/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr=
/bin/rst2man.py",
> >>>> line 21, in <module>
> >>>> |     from docutils.core import publish_cmdline, default_description
> >>>> | ImportError: No module named docutils.core
> >>>> |
> >>>> | Waf: Leaving directory
> >>>>
> >>>> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnu=
eabi/mpv/0.15.0-r0/mpv-0.15.0/build'
> >>>> | Build failed
> >>>> |  -> task in 'rst2man' failed (exit status 1):
> >>>> |     {task 139933719149072: rst2man mpv.rst -> mpv.1}
> >>>> | '
> >>>> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/=
bin/rst2man.py
> >>>> ../DOCS/man/mpv.rst
> >>>> DOCS/man/mpv.1 '
> >>>> | WARNING: exit code 1 from a shell command.
> >>>> | ERROR: Function failed: do_compile (log file is located at
> >>>>
> >>>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnue=
abi/mpv/0.15.0-r0/temp/log.do_compile.11834)
> >>>> NOTE: recipe mpv-0.15.0-r0: task do_compile: Failed
> >>>> ERROR: Task 15304
> >>>> (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-m=
ultimedia/mplayer/
> >>>> mpv_0.15.0.bb,
> >>>> do_compile) failed with exit code '1'
> >>>>
> >>>>
> >>> What recipe/package is pulling in rst?  I'll check the config options
> >>> and make sure it builds correctly with/without that package present.
> >>>
> >>> +
> >>>>> +REQUIRED_DISTRO_FEATURES =3D "x11"
> >>>>> +
> >>>>> +LICENSE =3D "GPLv2+"
> >>>>> +LIC_FILES_CHKSUM =3D
> >>>>> "file://LICENSE;md5=3D91f1cb870c1cc2d31351a4d2595441cb"
> >>>>> +
> >>>>> +SRC_URI =3D "
> >>>>> https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=3Dmpv \
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
> >>>>> +# Note: both lua and libass are required to get on-screen-display
> >>>>> (controls)
> >>>>> +PACKAGECONFIG ??=3D "lua libass"
> >>>>> +PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua luajit"
> >>>>> +PACKAGECONFIG[libass] =3D "--enable-libass,--disable-libass,libass"
> >>>>> +PACKAGECONFIG[libarchive] =3D
> >>>>> "--enable-libarchive,--disable-libarchive,libarchive"
> >>>>> +
> >>>>> +EXTRA_OECONF =3D " \
> >>>>> +    --prefix=3D${prefix} \
> >>>>> +    --target=3D${SIMPLE_TARGET_SYS} \
> >>>>>
> >>>>
> >>>> Where is this variable set? git grep in oe-core and meta-oe didn't s=
how
> >>>> anything.
> >>>>
> >>>> Did you copy it from mplayer2 recipe?
> >>>>
> >>>> If yes then you forgot to include:
> >>>> export SIMPLE_TARGET_SYS=3D"$(echo ${TARGET_SYS} | sed
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
> >>>>> +    --disable-vapoursynth-lazy \
> >>>>> +"
> >>>>> +
> >>>>> +do_configure() {
> >>>>> +    if [ ! -L ../waf ]; then
> >>>>> +        chmod a+x ../waf-1.8.12
> >>>>> +    ln -s waf-1.8.12 ../waf
> >>>>> +    fi
> >>>>> +    ../waf configure ${EXTRA_OECONF}
> >>>>> +}
> >>>>> +
> >>>>> +do_compile () {
> >>>>> +    ../waf build
> >>>>> +}
> >>>>> +
> >>>>> +do_install() {
> >>>>> +    ../waf install --destdir=3D${D}
> >>>>> +}
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
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbqwv4ACgkQN1Ujt2V2gBwOaQCguqKt/Gp9cyxd2+arqQE3t/wz
s4sAn02yCp8s1YMjfZb62JEO0WVd8eXp
=W9PJ
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
