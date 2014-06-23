Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7483966055
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 13:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 863C13A29577
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 09:40:33 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id dWHZditHdge2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 09:40:29 -0400 (EDT)
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 056083A29570
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 09:40:28 -0400 (EDT)
Received: by mail-vc0-f172.google.com with SMTP id hy10so5928440vcb.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 06:40:28 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.221.44.73 with SMTP id uf9mr19521177vcb.9.1403530828194;
	Mon, 23 Jun 2014 06:40:28 -0700 (PDT)
Received: by 10.58.85.131 with HTTP; Mon, 23 Jun 2014 06:40:28 -0700 (PDT)
In-Reply-To: <20140621074733.GD2117@jama>
References: <CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
	<20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
	<20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
	<20140620234853.GA2117@jama>
	<CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
	<20140621010508.GC2117@jama>
	<CACgAsMdguugQZiTiOo8aWaBZFCYnsWUtp7-0KWu7VdGvdBDCSA@mail.gmail.com>
	<20140621074733.GD2117@jama>
Date: Mon, 23 Jun 2014 09:40:28 -0400
Message-ID: <CACgAsMdQgREcvnQqnH5942TMzAR1LJr5bkHwm0nD+G2wNarEMg@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [yocto][meta-qt5][daisy] Error during bitbake of my image
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
X-List-Received-Date: Mon, 23 Jun 2014 13:40:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2014 at 3:47 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Jun 20, 2014 at 11:35:34PM -0400, Kevyn-Alexandre Par=C3=A9 wrote=
:
>> On Fri, Jun 20, 2014 at 9:05 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Fri, Jun 20, 2014 at 08:22:39PM -0400, Kevyn-Alexandre Par=C3=A9 wr=
ote:
>> >> On Fri, Jun 20, 2014 at 7:48 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>> >> > On Fri, Jun 20, 2014 at 06:30:09PM -0400, Kevyn-Alexandre Par=C3=A9=
 wrote:
>> >> >> [1] I still don't understand why adding qtwebkit IMAGE_INSTALL mak=
e my
>> >> >> build fail with:
>> >> >> ERROR: qtwebkit not found in the base feeds
>> >> >> LOG: http://pastebin.com/fx2Zi9vW
>> >> >> Any clue what I'm doing wrong?
>> >> >
>> >> > Check which packages (if any) were created by qtwebkit recipe, if a=
ny
>> >> > then read log.do_configure for possible clues.
>> >> >
>> >>
>> >> qtwebkit-dbg and qtwebkit-dev is part of deploy rpm not qtwebkit? In
>> >> pkgdata these only to have ".packaged"
>> >> http://pastebin.com/0ugj2NVF
>> >>
>> >> log.do_configure:
>> >> http://pastebin.com/cXWdDXmy
>> >
>> > The WebKit build was disabled for the following reasons:
>> >     * ICU is required. To build QtWebKit with Qt 5 you need to build Q=
t
>> >      5 with libICU support. Check for ICU support being mentioned in
>> >      qtbase/config.summary.
>> >
>>
>> Yes you told me that in previous email I when to
>> layers.openembedded.org to check
>>
>> icu  53.1 International Component for Unicode libraries   openembedded-c=
ore
>>
>> I add it in PACKAGECONFIG_append_pn-qtbase and IMAGE_INSTALL I thought
>> it will be enough?
>>
>> Obviously, I'm still missing somethink
>>
>> qtbase/config.summary? you mean qtbase.inc?
>
> I've just pasted it for you from the log.do_configure you sent me,
> please _read_ it.
>

Thanks for trying to make me _see_ what I'm clearly not seeing yet...

I cleanall qtbase & my image since I was having multiple
log.do_configure and could have looked at the wrong one...

My image with IMAGE_INSTALL & PACKAGECONFIG:
http://pastebin.com/4JCWb5cY

Here the way I check that icu is added as part of my image:
bitbake -e nirs-console-image | grep -n5 PACKAGECONFIG
2560-# $B_pn-strace
2561-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yoc=
to_build/src/poky/meta/conf/distro/include/seperatebuilddir.inc:645
2562-#     "${SEPB}"
2563-B_pn-strace=3D"/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_po=
int/yocto_build/src/build/tmp/work/overo-poky-linux-gnueabi/nirs-console-im=
age/1.0-r0/build"
2564-#
2565:# $PACKAGECONFIG [2 operations]
2566-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yoc=
to_build/src/poky/meta/conf/documentation.conf:308
2567-#     [doc] "This variable provides a means of enabling or
disabling features of a recipe on a per-recipe basis."
2568-#   _append[pn-qtbase]
/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/=
poky/meta-nirs/recipes-images/gumstix/nirs-console-image.bb:17
2569-#     "   developer   tests   examples   icu   alsa-lib   gles2
accessibility   glib-2.0   tslib   linuxfb   sqlite3 "


> Check config.summary in qtbase WORKDIR (where you built qtbase to be
> sure it was enabled) and check with bitbake -e that it's really in your
> PACKAGECONFIG for qtbase.

My bad I didn't check in the WORKDIR only in meta-qt5...

Check config.summary:
find tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/ -name config.summa=
ry
tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.2.1-r0/build/config.su=
mmary

http://pastebin.com/gZ2Nqa5g

Found that ICU is disable:
 27 Support enabled for:
 28   Accessibility .......... no
 29   ALSA ................... no
 30   CUPS ................... no
 31   FontConfig ............. no
 32   FreeType ............... qt
 33   Iconv .................. no
 34   ICU .................... no

Clearly I'm doing something wrong!

[1] Will _read_ and try to make the config.summary change to yes...

[2] When i'm setting my PACKAGECONFIG and i'm having one like:
PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"

I'm suppose to set:
PACKAGECONFIG_append_pn-qtbase =3D " virtual/libgles2"
and not
PACKAGECONFIG_append_pn-qtbase =3D " gles2"
?

BR,

-KA

