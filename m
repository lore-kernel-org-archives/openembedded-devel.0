Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id EBF3A6F573
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 15:03:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,787,1389740400"; d="scan'208";a="43960843"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 03 Apr 2014 17:03:44 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC21.usr.ingenico.loc ([10.31.4.221]) with mapi id
	14.02.0328.009; Thu, 3 Apr 2014 17:03:44 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [OE-core] State of bitbake world, Failed tasks 2014-04-03
Thread-Index: AQHPTz2Zj2AKZMhApkmcTeBnUufFAJr//RrQ
Date: Thu, 3 Apr 2014 15:03:43 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B57551D68@COSNADEXC13.usr.ingenico.loc>
References: <20140403130609.GF2132@jama>
In-Reply-To: <20140403130609.GF2132@jama>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Thu, 03 Apr 2014 15:03:50 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

open-vcdiff seems to fail again. It seems you have the correct v2 patch.
However the returned error is still the original one:

| aclocal: error: non-option arguments are not accepted: '\'.

There is no more \ character, it is patched.

Patch has been really applied?

Matt


-----Message d'origine-----
De=A0: openembedded-core-bounces@lists.openembedded.org [mailto:openembedde=
d-core-bounces@lists.openembedded.org] De la part de Martin Jansa
Envoy=E9=A0: jeudi 3 avril 2014 15:06
=C0=A0: openembedded-core@lists.openembedded.org; openembedded-devel@lists.=
openembedded.org
Objet=A0: [OE-core] State of bitbake world, Failed tasks 2014-04-03

On Sun, Mar 30, 2014 at 01:28:00AM +0100, Martin Jansa wrote:
> Be aware that I plan to run test-dependencies script for next few=20
> days, so changes to meta-oe will be delayed until it's finished and I=20
> can use jenkins again to test incoming changes.

I've just started this long test-dependencies build so jenkins will be busy=
 for next 14 days or so, but I'll send complete qa.log in advance as soon a=
s it finishes building world from scratch.

The report looks a lot better, thanks to everybody who sent patches! Be awa=
re that qemuarm still shows a lot more failures, that's because only last q=
emux86-64 build contained all fixes from ML.

Here is just qemux86-64 build:
  meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_configure
  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
  meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_insta=
ll
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure
  meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, do_c=
ompile
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft_1=
.15.1.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgr=
ounds_2.32.0.bb, do_configure
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb, =
do_compile
  openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb=
, do_configure
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_configure
  meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_compi=
le
  meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, do_c=
onfigure

qtbase was broken by one patch from oe-devel ML, I've removed it for now.

abiword was upgraded to fix failure, but will need some more changes.

openal-soft, gst-ffmpeg and xbmc are failing because now world builds set P=
_V for libav to use version 9 needed by newer mplayer (which was failing be=
fore because of live555), xbmc was always failing, now it only fails a bit =
sooner in do_configure when checking ffmpeg.

emacs is failing because of segfault in qemu, the same symptoms as before:
http://git.openembedded.org/meta-openembedded/commit/?id=3D72e02b4625dceb0c=
c72e1edfc28215786c7de63a
maybe some something was lost in transition to oe-core, or there is new iss=
ue in pixman or somewhere else:
http://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/xo=
rg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.pat=
ch

I'll look into gnome-backgrounds and mousepad, because I have pending patch=
es for them which probably don't fix it completely.

Other recipes are still "free" for fixing, please fix them and send reply t=
o this thread when you start looking into it, so that nobody duplicates wor=
k.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-04-03 =3D=3D

=3D=3D=3D common (7) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-ba=
ckgrounds_2.32.0.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-so=
ft_1.15.1.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.1=
3.bb, do_configure

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compil=
e
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (15) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
.0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_ins=
tall
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8=
.3.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-task=
manager_git.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-panel-plugins/closebutton/xfce4-c=
losebutton-plugin_git.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-setting=
s_git.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb, do_confi=
gure
    * meta-qt5/recipes-qt/qt5/qtwebkit-examples_5.2.1.bb, do_compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, d=
o_compile


=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb, =
do_compile

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||22    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140401_012017.log/
|-
||qemux86       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140401_122021.log//
|-
||qemux86_64    ||15    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140402_111852.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

