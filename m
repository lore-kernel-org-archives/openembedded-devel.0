Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1138A65EB4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 16:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 07EE13A2ADF6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 12:21:30 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 22BkjAgbwrBy
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 12:21:25 -0400 (EDT)
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 8DFCF3A2ADEF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 12:21:25 -0400 (EDT)
Received: by mail-vc0-f182.google.com with SMTP id il7so6210510vcb.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 09:21:24 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.58.118.168 with SMTP id kn8mr1889170veb.44.1403540484922;
	Mon, 23 Jun 2014 09:21:24 -0700 (PDT)
Received: by 10.58.85.131 with HTTP; Mon, 23 Jun 2014 09:21:24 -0700 (PDT)
In-Reply-To: <20140623140131.GH2437@jama>
References: <20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
	<20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
	<20140620234853.GA2117@jama>
	<CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
	<20140621010508.GC2117@jama>
	<CACgAsMdguugQZiTiOo8aWaBZFCYnsWUtp7-0KWu7VdGvdBDCSA@mail.gmail.com>
	<20140621074733.GD2117@jama>
	<CACgAsMdQgREcvnQqnH5942TMzAR1LJr5bkHwm0nD+G2wNarEMg@mail.gmail.com>
	<20140623140131.GH2437@jama>
Date: Mon, 23 Jun 2014 12:21:24 -0400
Message-ID: <CACgAsMcSoWZSNh9cBnO6Vm9YuCf1NEzzr5VQ=KpSUfoKwC_x5Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 23 Jun 2014 16:21:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 10:01 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Mon, Jun 23, 2014 at 09:40:28AM -0400, Kevyn-Alexandre Par=C3=A9 wrote=
:
<snip>
>> Here the way I check that icu is added as part of my image:
>> bitbake -e nirs-console-image | grep -n5 PACKAGECONFIG
>> 2560-# $B_pn-strace
>> 2561-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/=
yocto_build/src/poky/meta/conf/distro/include/seperatebuilddir.inc:645
>> 2562-#     "${SEPB}"
>> 2563-B_pn-strace=3D"/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting=
_point/yocto_build/src/build/tmp/work/overo-poky-linux-gnueabi/nirs-console=
-image/1.0-r0/build"
>> 2564-#
>> 2565:# $PACKAGECONFIG [2 operations]
>> 2566-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/=
yocto_build/src/poky/meta/conf/documentation.conf:308
>> 2567-#     [doc] "This variable provides a means of enabling or
>> disabling features of a recipe on a per-recipe basis."
>> 2568-#   _append[pn-qtbase]
>> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/poky/meta-nirs/recipes-images/gumstix/nirs-console-image.bb:17
>> 2569-#     "   developer   tests   examples   icu   alsa-lib   gles2
>> accessibility   glib-2.0   tslib   linuxfb   sqlite3 "
>
> Are you trying to set PACKAGECONFIG_append_pn-qtbase from
> nirs-console-image.bb? That wont work you need to set it in distro or
> local.conf

Yes I was :( I was rereading ref manual

Configuration file: This method is identical to changing the block
through an append file except you edit your local.conf or
<mydistro>.conf file. As with append files previously described, you
can either completely override the variable:

     PACKAGECONFIG_pn-<recipename>=3D"f4 f5"


Or, you can just amend the variable:

     PACKAGECONFIG_append_pn-<recipename> =3D " f4"


I Move my PACKAGECONFIG_append to my local.conf

Here my setup for now just trying to make it compile remove the gles
for now it was giving me errors...

bitbake -e qtbase | grep ^PACKAGECONFIG=3D
PACKAGECONFIG=3D"     release     dbus udev evdev widgets tools libs
openssl     gl          xcb xvideo xsync xshape xrender xrandr xfixes
xinput2 xinput xinerama xcursor gtkstyle xkb     fontconfig freetype
  jpeg libpng zlib     pulseaudio       developer tests examples icu
alsa-lib accessibility glib-2.0 tslib sqlite3

cat tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.2.1-r0/build/confi=
g.summary
| grep ICU
  ICU .................... yes

it's compiling further then before and stop

meta-qt5/recipes-qt/qt5/qtdeclarative_5.2.1.bb, do_compile) failed
with exit code '1'

http://pastebin.com/qJAME8ew

_reading_ qtbase.inc qtwebkit depends on qtdeclarative and it depends
# gl or gles needs to be enabled in order to build qtdeclarative

The error is maybe not related to this but will work on adding gles to my i=
mage.

>
>> > Check config.summary in qtbase WORKDIR (where you built qtbase to be
>> > sure it was enabled) and check with bitbake -e that it's really in you=
r
>> > PACKAGECONFIG for qtbase.
>>
>> My bad I didn't check in the WORKDIR only in meta-qt5...
>>
>> Check config.summary:
>> find tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/ -name config.su=
mmary
>> tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.2.1-r0/build/config=
.summary
>>
>> http://pastebin.com/gZ2Nqa5g
>>
>> Found that ICU is disable:
>>  27 Support enabled for:
>>  28   Accessibility .......... no
>>  29   ALSA ................... no
>>  30   CUPS ................... no
>>  31   FontConfig ............. no
>>  32   FreeType ............... qt
>>  33   Iconv .................. no
>>  34   ICU .................... no
>>
>> Clearly I'm doing something wrong!
>
> Yes, setting PACKAGECONFIG in wrong place.

thx

>
> bitbake -e qtbase | grep ^PACKAGECONFIG=3D
>
> is what you need to check.
>
>> [1] Will _read_ and try to make the config.summary change to yes...
>>
>> [2] When i'm setting my PACKAGECONFIG and i'm having one like:
>> PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/e=
gl"
>>
>> I'm suppose to set:
>> PACKAGECONFIG_append_pn-qtbase =3D " virtual/libgles2"
>> and not
>> PACKAGECONFIG_append_pn-qtbase =3D " gles2"
>> ?
>
> The later is less wrong, but setting
> PACKAGECONFIG_GL_pn-qtbase =3D "gles2"
> is even better.

For gles2 it's easy to know to use PACKAGECONFIG_GL but how do you
know for example when to put it where? I know it result all in
PACKAGECONFIG but I'm just curious?
ex: glib? PACKAGECONFIG_DISTRO or  PACKAGECONFIG_SYSTEM?

Leaving for a week of vacancy & understanding a lot more thx to you!

BR,

-KA

