Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A7F516F572
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 15:14:15 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id a1so2056631wgh.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Apr 2014 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UVt9tgG1h2p+VTgUxCBHGr1HBEKTp4mhsOr47jquuJo=;
	b=sT+Vqc/EmGJME039H/a7u5grP6tT2ie2iQZhEDBhG53hUh27t1u4uer5fTFyEuYk30
	NqPxsPO8E3mfG+KTTdvvSVEslphPLjKVR4LNL1YXS65/OGovL/DslC6MoeZ6yoUhIM1r
	/iaVUpbWsX9aQiQ0fQNGJi5o0XVjJnqGs8CWCRCX3OECGz4gX5h2oy7qV1T3V4tWUSwX
	Dev0lqfUi9HOb5AY6nOzLNM7ulEzjm6JE94UwA4kRvDMZSr+AjU6NMLMPswH9feAUeGv
	KyafM6lSo8SvtfuyPPK7tQvuah2Ajb5u2+ua3x059MnE3U70qFEPpgtNaEZTaIppuZuE
	h0wQ==
X-Received: by 10.194.7.196 with SMTP id l4mr6482991wja.92.1396538056102;
	Thu, 03 Apr 2014 08:14:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p8sm12651252eef.26.2014.04.03.08.14.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Apr 2014 08:14:15 -0700 (PDT)
Date: Thu, 3 Apr 2014 17:14:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140403151416.GG2132@jama>
References: <20140403130609.GF2132@jama>
	<8672BB614B4CCA40A6B3BDD6FD82050B57551D68@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B57551D68@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
X-List-Received-Date: Thu, 03 Apr 2014 15:14:21 -0000
X-Groupsio-MsgNum: 49050
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1giRMj6yz/+FOIRq"
Content-Disposition: inline

--1giRMj6yz/+FOIRq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2014 at 03:03:43PM +0000, Matthieu CRAPET wrote:
> open-vcdiff seems to fail again. It seems you have the correct v2 patch.
> However the returned error is still the original one:
>=20
> | aclocal: error: non-option arguments are not accepted: '\'.
>=20
> There is no more \ character, it is patched.
>=20
> Patch has been really applied?

It's not failing for qemux86 and qemux86-64, so it was fixed by that
patch (qemuarm was already running when you sent that patch).

> Matt
>=20
>=20
> -----Message d'origine-----
> De=A0: openembedded-core-bounces@lists.openembedded.org [mailto:openembed=
ded-core-bounces@lists.openembedded.org] De la part de Martin Jansa
> Envoy=E9=A0: jeudi 3 avril 2014 15:06
> =C0=A0: openembedded-core@lists.openembedded.org; openembedded-devel@list=
s.openembedded.org
> Objet=A0: [OE-core] State of bitbake world, Failed tasks 2014-04-03
>=20
> On Sun, Mar 30, 2014 at 01:28:00AM +0100, Martin Jansa wrote:
> > Be aware that I plan to run test-dependencies script for next few=20
> > days, so changes to meta-oe will be delayed until it's finished and I=
=20
> > can use jenkins again to test incoming changes.
>=20
> I've just started this long test-dependencies build so jenkins will be bu=
sy for next 14 days or so, but I'll send complete qa.log in advance as soon=
 as it finishes building world from scratch.
>=20
> The report looks a lot better, thanks to everybody who sent patches! Be a=
ware that qemuarm still shows a lot more failures, that's because only last=
 qemux86-64 build contained all fixes from ML.
>=20
> Here is just qemux86-64 build:
>   meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_configure
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>   meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_ins=
tall
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, do=
_compile
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft=
_1.15.1.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-back=
grounds_2.32.0.bb, do_configure
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb=
, do_compile
>   openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.=
bb, do_configure
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_configure
>   meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_com=
pile
>   meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, do=
_configure
>=20
> qtbase was broken by one patch from oe-devel ML, I've removed it for now.
>=20
> abiword was upgraded to fix failure, but will need some more changes.
>=20
> openal-soft, gst-ffmpeg and xbmc are failing because now world builds set=
 P_V for libav to use version 9 needed by newer mplayer (which was failing =
before because of live555), xbmc was always failing, now it only fails a bi=
t sooner in do_configure when checking ffmpeg.
>=20
> emacs is failing because of segfault in qemu, the same symptoms as before:
> http://git.openembedded.org/meta-openembedded/commit/?id=3D72e02b4625dceb=
0cc72e1edfc28215786c7de63a
> maybe some something was lost in transition to oe-core, or there is new i=
ssue in pixman or somewhere else:
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/=
xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.p=
atch
>=20
> I'll look into gnome-backgrounds and mousepad, because I have pending pat=
ches for them which probably don't fix it completely.
>=20
> Other recipes are still "free" for fixing, please fix them and send reply=
 to this thread when you start looking into it, so that nobody duplicates w=
ork.
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2014-04-03 =3D=3D
>=20
> =3D=3D=3D common (7) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-=
backgrounds_2.32.0.bb, do_configure
>     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git=
=2Ebb, do_configure
>     * meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-=
soft_1.15.1.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do=
_compile
>     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_co=
mpile
>     * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb=
, do_configure
>     * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10=
=2E13.bb, do_configure
>=20
> =3D=3D=3D common-x86 (5) =3D=3D=3D
>     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_comp=
ile
>     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.2=
4.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_c=
ompile
>     * meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_configure
>     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>=20
> =3D=3D=3D qemuarm (15) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb=
, do_compile
>     * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0=
=2E8.0.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do=
_compile
>     * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_i=
nstall
>     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, d=
o_compile
>     * meta-openembedded/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0=
=2E8.3.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb=
, do_configure
>     * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-ta=
skmanager_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-panel-plugins/closebutton/xfce4=
-closebutton-plugin_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-setti=
ngs_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb, do_con=
figure
>     * meta-qt5/recipes-qt/qt5/qtwebkit-examples_5.2.1.bb, do_compile
>     * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
>     * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb,=
 do_compile
>=20
>=20
> =3D=3D=3D qemux86 (1) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb=
, do_compile
>=20
> =3D=3D=3D qemux86_64 (3) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb=
, do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do=
_install
>     * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/lib=
imobiledevice_1.1.4.bb, do_configure
>=20
> =3D=3D=3D Number of failed tasks =3D=3D=3D
> {| class=3Dwikitable
> |-
> ||qemuarm       ||22    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140401_012017.log/
> |-
> ||qemux86       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140401_122021.log//
> |-
> ||qemux86_64    ||15    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140402_111852.log/
> |}
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1giRMj6yz/+FOIRq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM9esgACgkQN1Ujt2V2gByB2gCbBCiDrYVtXtFRmc+2HCGK/xN/
2ZIAnAzB1rXobxxBf+k7fFGY7hMtf1sC
=RwaC
-----END PGP SIGNATURE-----

--1giRMj6yz/+FOIRq--
