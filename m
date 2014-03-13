Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 209A36E00C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 01:07:58 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so109149eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cLKKvvesL74yyvdxC352uu8gpnsg+9TzLaAChIVhTE0=;
	b=B6WWqy98+LX5Dk+2RNhiqr9R0XIOnqMln9SAA67D5UsU4rEU9jMrUbQ4HXJ3VQ0+SR
	SOKdQlXewaZnJ9HUD6khOSLmsshN40cUOJbehl9KjpC2f5pdtEtPrgYdZG8eH2bg5ezv
	qHTY0QxpAAu07H+oJ+6B+LWaWoiBmrMIqfM0/M1cwwYmmujx/P37U24gVrIEKAH0Evx4
	SD/gbOnmziljuSA7FCnFTsQ6UhA9xYCDJ33/2KvUrnwz2wkgy8FKSABcX3Du5Bl8KdPU
	EHcalBInetm/F2/F5gA31nDeOnW4xcXXr+qtXAfKg3AFfeLrAM3MS7K0M5MIqkIxTgG4
	tFmw==
X-Received: by 10.14.39.3 with SMTP id c3mr606674eeb.42.1394672879126;
	Wed, 12 Mar 2014 18:07:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm2193403eef.14.2014.03.12.18.07.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 18:07:57 -0700 (PDT)
Date: Thu, 13 Mar 2014 02:08:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140313010808.GC3759@jama>
References: <1394599581-26844-1-git-send-email-raj.khem@gmail.com>
	<5320F473.1010509@mlbassoc.com>
	<CAMKF1somffWCEn-AKfdEbd+ddvTghW8PD2Es5N+ysmyNjXSNwQ@mail.gmail.com>
	<5320FF05.1050007@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <5320FF05.1050007@mlbassoc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-browser][RFT][PATCH] chromium: Upgrade 29 -> 35
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
X-List-Received-Date: Thu, 13 Mar 2014 01:08:01 -0000
X-Groupsio-MsgNum: 48632
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline

--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2014 at 06:42:45PM -0600, Gary Thomas wrote:
> On 2014-03-12 18:02, Khem Raj wrote:
> > On Wed, Mar 12, 2014 at 4:57 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> >> On 2014-03-11 22:46, Khem Raj wrote:
> >>> Removed already applied patches
> >>>
> >>> License year changed thats why there is change in checksum
> >>>
> >>> -// Copyright 2014 The Chromium Authors. All rights reserved.
> >>> +// Copyright (c) 2013 The Chromium Authors. All rights reserved.
> >>>
> >>> we see
> >>>
> >>> rpm/bin/debugedit: canonicalization unexpectedly shrank by one charac=
ter
> >>>
> >>> so we add PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> >>>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>>  ..._focus_tracker_notify_deprecated_since_ATK_2_9_4.patch |  0
> >>>  .../{chromium-29.0.1518.2 =3D> chromium}/armv6/include.gypi |  0
> >>>  .../armv6/oe-defaults.gypi                                |  0
> >>>  .../armv7a/include.gypi                                   |  0
> >>>  .../armv7a/oe-defaults.gypi                               |  0
> >>>  .../{chromium-29.0.1518.2 =3D> chromium}/google-chrome      |  0
> >>>  .../google-chrome.desktop                                 |  0
> >>>  .../{chromium-29.0.1518.2 =3D> chromium}/i586/include.gypi  |  0
> >>>  .../i586/oe-defaults.gypi                                 |  0
> >>>  .../secitem_array.patch                                   |  0
> >>>  .../uninitialised-warning.patch                           |  6 +++---
> >>>  .../{chromium-29.0.1518.2 =3D> chromium}/unistd-2.patch     |  0
> >>>  .../x86-64/include.gypi                                   |  0
> >>>  .../x86-64/oe-defaults.gypi                               |  0
> >>>  .../{chromium_29.0.1518.2.bb =3D> chromium_35.0.1883.0.bb}  | 15 +++=
+++++-------
> >>>  15 files changed, 11 insertions(+), 10 deletions(-)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/armv6/include.gypi (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/armv6/oe-defaults.gypi (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/armv7a/include.gypi (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/armv7a/oe-defaults.gypi (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/google-chrome (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/google-chrome.desktop (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/i586/include.gypi (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/i586/oe-defaults.gypi (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/secitem_array.patch (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/uninitialised-warning.patch (96%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/unistd-2.patch (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/x86-64/include.gypi (100%)
> >>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 =3D> chromium}=
/x86-64/oe-defaults.gypi (100%)
> >>>  rename recipes-browser/chromium/{chromium_29.0.1518.2.bb =3D> chromi=
um_35.0.1883.0.bb} (84%)
> >>>
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/001-atk_fo=
cus_tracker_notify_deprecated_since_ATK_2_9_4.patch b/recipes-browser/chrom=
ium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/001-atk_foc=
us_tracker_notify_deprecated_since_ATK_2_9_4.patch
> >>> rename to recipes-browser/chromium/chromium/001-atk_focus_tracker_not=
ify_deprecated_since_ATK_2_9_4.patch
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/incl=
ude.gypi b/recipes-browser/chromium/chromium/armv6/include.gypi
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv6/inclu=
de.gypi
> >>> rename to recipes-browser/chromium/chromium/armv6/include.gypi
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-d=
efaults.gypi b/recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-de=
faults.gypi
> >>> rename to recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/inc=
lude.gypi b/recipes-browser/chromium/chromium/armv7a/include.gypi
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv7a/incl=
ude.gypi
> >>> rename to recipes-browser/chromium/chromium/armv7a/include.gypi
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-=
defaults.gypi b/recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-d=
efaults.gypi
> >>> rename to recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chr=
ome b/recipes-browser/chromium/chromium/google-chrome
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/google-chro=
me
> >>> rename to recipes-browser/chromium/chromium/google-chrome
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chr=
ome.desktop b/recipes-browser/chromium/chromium/google-chrome.desktop
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/google-chro=
me.desktop
> >>> rename to recipes-browser/chromium/chromium/google-chrome.desktop
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/inclu=
de.gypi b/recipes-browser/chromium/chromium/i586/include.gypi
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/i586/includ=
e.gypi
> >>> rename to recipes-browser/chromium/chromium/i586/include.gypi
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-de=
faults.gypi b/recipes-browser/chromium/chromium/i586/oe-defaults.gypi
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-def=
aults.gypi
> >>> rename to recipes-browser/chromium/chromium/i586/oe-defaults.gypi
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/secitem_ar=
ray.patch b/recipes-browser/chromium/chromium/secitem_array.patch
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/secitem_arr=
ay.patch
> >>> rename to recipes-browser/chromium/chromium/secitem_array.patch
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/uninitiali=
sed-warning.patch b/recipes-browser/chromium/chromium/uninitialised-warning=
=2Epatch
> >>> similarity index 96%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/uninitialis=
ed-warning.patch
> >>> rename to recipes-browser/chromium/chromium/uninitialised-warning.pat=
ch
> >>> index fac12bb..afdd784 100644
> >>> --- a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-war=
ning.patch
> >>> +++ b/recipes-browser/chromium/chromium/uninitialised-warning.patch
> >>> @@ -30,10 +30,10 @@ Make gcc 4.8 happy. It complains about uninitiali=
zed symbols
> >>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>
> >>>  Upstream-Status: Unknown
> >>> -Index: chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
> >>> +Index: chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
> >>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> ---- chromium-29.0.1518.2.orig/webkit/glue/webclipboard_impl.cc
> >>> -+++ chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
> >>> +--- chromium-29.0.1518.2.orig/content/renderer/webclipboard_impl.cc
> >>> ++++ chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
> >>>  @@ -73,7 +73,7 @@ uint64 WebClipboardImpl::getSequenceNumb
> >>>   }
> >>>
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.p=
atch b/recipes-browser/chromium/chromium/unistd-2.patch
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.pa=
tch
> >>> rename to recipes-browser/chromium/chromium/unistd-2.patch
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/inc=
lude.gypi b/recipes-browser/chromium/chromium/x86-64/include.gypi
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/x86-64/incl=
ude.gypi
> >>> rename to recipes-browser/chromium/chromium/x86-64/include.gypi
> >>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-=
defaults.gypi b/recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
> >>> similarity index 100%
> >>> rename from recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-d=
efaults.gypi
> >>> rename to recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
> >>> diff --git a/recipes-browser/chromium/chromium_29.0.1518.2.bb b/recip=
es-browser/chromium/chromium_35.0.1883.0.bb
> >>> similarity index 84%
> >>> rename from recipes-browser/chromium/chromium_29.0.1518.2.bb
> >>> rename to recipes-browser/chromium/chromium_35.0.1883.0.bb
> >>> index 1c62f1e..6a03d6b 100644
> >>> --- a/recipes-browser/chromium/chromium_29.0.1518.2.bb
> >>> +++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
> >>> @@ -1,6 +1,6 @@
> >>>  DESCRIPTION =3D "Chromium browser"
> >>>  LICENSE =3D "BSD"
> >>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2d164565cc10f298390174d9=
cb6d18d"
> >>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D537e0b52077bf0a616d0a0c8a=
79bc9d5"
> >>>  DEPENDS =3D "xz-native pciutils pulseaudio xextproto cairo nss gtk+ =
zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
> >>>  SRC_URI =3D "\
> >>>          http://gsdview.appspot.com/chromium-browser-official/${P}.ta=
r.xz \
> >>> @@ -9,12 +9,9 @@ SRC_URI =3D "\
> >>>          file://unistd-2.patch \
> >>>          file://google-chrome \
> >>>          file://google-chrome.desktop \
> >>> -        file://uninitialised-warning.patch \
> >>> -     file://001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.=
patch \
> >>> -     file://secitem_array.patch;striplevel=3D2 \
> >>>  "
> >>> -SRC_URI[md5sum] =3D "2480c3fd109ef000575629acb8a906ca"
> >>> -SRC_URI[sha256sum] =3D "7f08624f7d9bd120de0043da7ee09985ae6b6990d22d=
8c1b1f7c66fd4ed681a1"
> >>> +SRC_URI[md5sum] =3D "c0659bc3c6b540e106e043fd27f54358"
> >>> +SRC_URI[sha256sum] =3D "666d5948c6508072f9f5d6acff82290fa5939e1da1b9=
4b042a1e05daf3357b61"
> >>>
> >>>  # include.gypi exists only for armv6 and armv7a and there isn't some=
thing like COMPATIBLE_ARCH afaik
> >>>  COMPATIBLE_MACHINE =3D "(-)"
> >>> @@ -60,8 +57,9 @@ do_install() {
> >>>
> >>>       install -d ${D}${bindir}/chrome/
> >>>       install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/ch=
rome
> >>> -     install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrom=
e/
> >>>       install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/ch=
rome/
> >>> +     install -m 0644 ${S}/out/Release/content_resources.pak ${D}${bi=
ndir}/chrome/
> >>> +     install -m 0644 ${S}/out/Release/keyboard_resources.pak ${D}${b=
indir}/chrome/
> >>>       install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${b=
indir}/chrome/
> >>>       install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bind=
ir}/chrome/
> >>>       install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}=
/chrome/
> >>> @@ -72,3 +70,6 @@ do_install() {
> >>>
> >>>  FILES_${PN} =3D "${bindir}/chrome/ ${bindir}/google-chrome ${datadir=
}/applications"
> >>>  FILES_${PN}-dbg =3D "${bindir}/chrome/.debug/"
> >>> +
> >>> +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> >>> +
> >>>
> >>
> >> I'm trying to build this on a RAM-challenged machine and it keeps
> >> blowing up in the linker by running out of memory.  My machine has
> >> only 3GB (plus 5GB swap) and was easily able to build the previous
> >> version.  I've tried both the standard linker and ld-is-gold.
> >>
> >> Is there any way around this?
> >>
> >=20
> > is it a 32bit machine ? Mine has 8G it worked out to be ok for me.
>=20
> Yes, the failing machine is 32bit.  'ulimit -m' shows unlimited, so my
> 3G of RAM + 5G of swap _should_ be the same.

It would be worth trying if -Wl,--no-keep-memory helps here as well, see
discussion about adding it to webkit-gtk in oe-core:
http://lists.openembedded.org/pipermail/openembedded-core/2013-September/08=
4718.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMhBPgACgkQN1Ujt2V2gBwZPACdHkuZIdEq+IhqsnSpsRcIlx7f
cDwAn2ElyQo5/IN5j5gzyK4ACtmErBph
=+CVc
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
