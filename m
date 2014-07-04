Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id C78716116C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 15:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 493653AAAD3A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 11:00:05 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id YQVLPPcyhmEI
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 11:00:02 -0400 (EDT)
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.rogue-research.com (Postfix) with ESMTPSA id A079E3AAAD33
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 11:00:02 -0400 (EDT)
Received: by mail-ve0-f177.google.com with SMTP id i13so1734002veh.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jul 2014 08:00:01 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.58.220.230 with SMTP id pz6mr9978362vec.9.1404486001945;
	Fri, 04 Jul 2014 08:00:01 -0700 (PDT)
Received: by 10.58.237.200 with HTTP; Fri, 4 Jul 2014 08:00:01 -0700 (PDT)
In-Reply-To: <20140623165154.GI2437@jama>
References: <20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
	<20140620234853.GA2117@jama>
	<CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
	<20140621010508.GC2117@jama>
	<CACgAsMdguugQZiTiOo8aWaBZFCYnsWUtp7-0KWu7VdGvdBDCSA@mail.gmail.com>
	<20140621074733.GD2117@jama>
	<CACgAsMdQgREcvnQqnH5942TMzAR1LJr5bkHwm0nD+G2wNarEMg@mail.gmail.com>
	<20140623140131.GH2437@jama>
	<CACgAsMcSoWZSNh9cBnO6Vm9YuCf1NEzzr5VQ=KpSUfoKwC_x5Q@mail.gmail.com>
	<20140623165154.GI2437@jama>
Date: Fri, 4 Jul 2014 11:00:01 -0400
Message-ID: <CACgAsMfbt4Oh2vFcp_1pvYU19iO+dqOrEoPbtgBxWmZ25dTQpw@mail.gmail.com>
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
X-List-Received-Date: Fri, 04 Jul 2014 15:00:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 12:51 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Mon, Jun 23, 2014 at 12:21:24PM -0400, Kevyn-Alexandre Par=C3=A9 wrote=
:
>> On Mon, Jun 23, 2014 at 10:01 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> > On Mon, Jun 23, 2014 at 09:40:28AM -0400, Kevyn-Alexandre Par=C3=A9 wr=
ote:
>> <snip>
>> >> Here the way I check that icu is added as part of my image:
>> >> bitbake -e nirs-console-image | grep -n5 PACKAGECONFIG
>> >> 2560-# $B_pn-strace
>> >> 2561-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_poi=
nt/yocto_build/src/poky/meta/conf/distro/include/seperatebuilddir.inc:645
>> >> 2562-#     "${SEPB}"
>> >> 2563-B_pn-strace=3D"/home/knight/SVN/rogue/3rdParty/Yocto/trunk/start=
ing_point/yocto_build/src/build/tmp/work/overo-poky-linux-gnueabi/nirs-cons=
ole-image/1.0-r0/build"
>> >> 2564-#
>> >> 2565:# $PACKAGECONFIG [2 operations]
>> >> 2566-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_poi=
nt/yocto_build/src/poky/meta/conf/documentation.conf:308
>> >> 2567-#     [doc] "This variable provides a means of enabling or
>> >> disabling features of a recipe on a per-recipe basis."
>> >> 2568-#   _append[pn-qtbase]
>> >> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_buil=
d/src/poky/meta-nirs/recipes-images/gumstix/nirs-console-image.bb:17
>> >> 2569-#     "   developer   tests   examples   icu   alsa-lib   gles2
>> >> accessibility   glib-2.0   tslib   linuxfb   sqlite3 "
>> >
>> > Are you trying to set PACKAGECONFIG_append_pn-qtbase from
>> > nirs-console-image.bb? That wont work you need to set it in distro or
>> > local.conf
>>
>> Yes I was :( I was rereading ref manual
>>
>> Configuration file: This method is identical to changing the block
>> through an append file except you edit your local.conf or
>> <mydistro>.conf file. As with append files previously described, you
>> can either completely override the variable:
>>
>>      PACKAGECONFIG_pn-<recipename>=3D"f4 f5"
>>
>>
>> Or, you can just amend the variable:
>>
>>      PACKAGECONFIG_append_pn-<recipename> =3D " f4"
>>
>>
>> I Move my PACKAGECONFIG_append to my local.conf
>>
>> Here my setup for now just trying to make it compile remove the gles
>> for now it was giving me errors...
>>
>> bitbake -e qtbase | grep ^PACKAGECONFIG=3D
>> PACKAGECONFIG=3D"     release     dbus udev evdev widgets tools libs
>> openssl     gl          xcb xvideo xsync xshape xrender xrandr xfixes
>> xinput2 xinput xinerama xcursor gtkstyle xkb     fontconfig freetype
>>   jpeg libpng zlib     pulseaudio       developer tests examples icu
>> alsa-lib accessibility glib-2.0 tslib sqlite3
>>
>> cat tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.2.1-r0/build/co=
nfig.summary
>> | grep ICU
>>   ICU .................... yes
>>
>> it's compiling further then before and stop
>>
>> meta-qt5/recipes-qt/qt5/qtdeclarative_5.2.1.bb, do_compile) failed
>> with exit code '1'
>>
>> http://pastebin.com/qJAME8ew
>
> Try to disable tests for qtdeclarative, they are not tested as often as
> default setup so it's possible that there is some issue:
> compiling
> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/sr=
c/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtdeclarative/5.2.1-r0/=
qtdeclarative-opensource-src-5.2.1/tests/auto/qml/qv4debugger/tst_qv4debugg=
er.cpp
> mv: `libplugin1.so' and `./libplugin1.so' are the same file
> make[5]: [libplugin1.so] Error 1 (ignored)
>

thx will try to make something more simple work and then will go back
to add "gles" and the config (PACKAGECONFIG) that depends on it.

Simple qt with frame buffer:

# Remove GL & X11 and replace directfb to linuxfb
# conf/local.conf
PACKAGECONFIG_GL_pn-qtbase =3D ""
PACKAGECONFIG_X11_pn-qtbase =3D ""
PACKAGECONFIG_FB_pn-qtbase =3D "linuxfb"

# Package config enable
# bitbake -e qtbase | grep ^PACKAGECONFIG=3D
PACKAGECONFIG=3D"     release     dbus udev evdev widgets tools libs
openssl          linuxfb               jpeg libpng zlib     pulseaudio
     "

# Package enable in the iamge recipe
# recipes recipes-images/gumstix/nirs-console-image.bb
require recipes-images/gumstix/gumstix-console-image.bb

inherit populate_sdk_qt5

IMAGE_INSTALL +=3D " \
  bzip2 \
  u-boot \
  u-boot-fw-utils \
  psplash \
  qtbase \
  qtbase-fonts \
  qtbase-fonts-ttf-vera \
  qtbase-fonts-ttf-dejavu \
  qtbase-fonts-pfa \
  qtbase-fonts-pfb \
  qtbase-fonts-qpf \
  qtbase-tools \
  qtbase-plugins \
  qtbase-dev \
"

# Compile
bitbake nirs-console-image

# This result on an image


# Them try to generate the SDK to use with qtcreator
# Populate SDK
bitbake -c populate_sdk nirs-console-image

# This result with error not founding the
Computing transaction...error: Can't install
qtwebkit-dev-5.2.1-r0@armv7a_vfp_neon: no package provides qtwebkit =3D
5.2.1-r0
http://pastebin.com/Tc8qtu6W

[1] Is it possible to use qtcreator without the populate_sdk?
[2] Any recommendation on how to compile a hello world without the SDK?

BR,

-KA

