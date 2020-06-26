Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com [68.232.133.109])
 by mx.groups.io with SMTP id smtpd.web12.5692.1593170384482453603
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=NipwFOE0;
 spf=pass (domain: bmw.de, ip: 68.232.133.109, mailfrom: prvs=439b82d5b=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1593170384; x=1624706384;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IbV+r7S5wPNdSbgHNXXbAVpKwe0RUfocTtsqBsCPNog=;
  b=NipwFOE0bCCAimsRO7o+8eZumRWnLIcTgRerg/Am77KHWhd8hb9+WpOc
   OmgGcftB+f0G5cjyd/IG566is0O0dxRSr/LXRGzxbk/owrUCHLbz3oUwE
   42EcKdElzvc97N62Q9Zc4Pn73NE0GGKV8I/jFarKm9cYGWKKZOPV1dub2
   o=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 26 Jun 2020 13:19:39 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw2.muc with ESMTP/TLS;
 26 Jun 2020 13:19:38 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp) ([160.48.96.49])
 by esabb6.muc with ESMTP/TLS; 26 Jun 2020 13:19:37 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10m.europe.bmw.corp
 (160.48.96.49) with Microsoft SMTP Server (TLS;
 Fri, 26 Jun 2020 13:19:36 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Fri,
 26 Jun 2020 13:19:36 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <msisov@igalia.com>
CC: <openembedded-devel@lists.openembedded.org>,
	<fabio.berton@ossystems.com.br>, <raphael.kubo.da.costa@intel.com>,
	<raj.khem@gmail.com>, <otavio@ossystems.com.br>, <ashie@clear-code.com>
Subject: Re: [meta-browser][PATCH] chromium-ozone-wayland: add build dependency to at-spi2-atk
Thread-Topic: [meta-browser][PATCH] chromium-ozone-wayland: add build
 dependency to at-spi2-atk
Thread-Index: AQHWS4pNf9iSRspmcEmu39MclEleJqjqYE6AgAA+a4A=
Date: Fri, 26 Jun 2020 11:19:36 +0000
Message-ID: <20200626111933.GN108868@korppu>
References: <20200626071951.35887-1-mikko.rapeli@bmw.de>
 <b1af5b16e18f92152f2ab0e1083a0089@igalia.com>
In-Reply-To: <b1af5b16e18f92152f2ab0e1083a0089@igalia.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <82E8368CBAAEEB49B3CF9850B1F8672C@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 26, 2020 at 10:36:09AM +0300, Maksim Sisov wrote:
> Hi!
>=20
> Thank you for your contribution! But would you please make a pull
> request to the meta-browser github repo that is the source of the
> meta-browser recipe? Thanks!
>=20
> https://github.com/OSSystems/meta-browser

Ok, I can do this too. README in meta-browser says that contributions
through mailing list also work. Maybe you want to update that.

Cheers,

-Mikko

> On 26.06.2020 10:19, Mikko Rapeli wrote:
> > Fixes configure error with poky master branch:
> >=20
> > ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned
> > non-zero exit code.
> >     pkgresult =3D exec_script(pkg_config_script, args, "value")
> >                 ^----------
> > Current dir:
> > /home/builder/src/yocto/poky/build/tmp/work/cortexa57-poky-linux/chromi=
um-ozone-wayland/83.0.4103.116-r0/chromium-83.0.4103.116/out/Release/
> > Command: python
> > /home/builder/src/yocto/poky/build/tmp/work/cortexa57-poky-linux/chromi=
um-ozone-wayland/83.0.4103.116-r0/chromium-83.0.4103.116/build/config/linux=
/pkg-config.py
> > atk atk-bridge-2.0
> > Returned 1.
> > stderr:
> >=20
> > Package atk-bridge-2.0 was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `atk-bridge-2.0.pc'
> > to the PKG_CONFIG_PATH environment variable
> > No package 'atk-bridge-2.0' found
> > Could not run pkg-config.
> >=20
> > See //build/config/linux/atk/BUILD.gn:19:1: whence it was called.
> > pkg_config("atk_base") {
> > ^-----------------------
> > See //ui/views/BUILD.gn:821:22: which caused the file to be included.
> >         configs +=3D [ "//build/config/linux/atk" ]
> >                      ^-------------------------
> > WARNING: exit code 1 from a shell command.
> > ERROR: Execution of
> > '/home/builder/src/yocto/poky/build/tmp/work/cortexa57-poky-linux/chrom=
ium-ozone-wayland/83.0.4103.116-r0/temp/run.do_configure.35368'
> > failed with exit code 1:
> > ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned
> > non-zero exit code.
> >     pkgresult =3D exec_script(pkg_config_script, args, "value")
> >                 ^----------
> >=20
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git
> > a/recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb
> > b/recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb
> > index de9274d..58fa0fb 100644
> > --- a/recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb
> > +++ b/recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb
> > @@ -3,6 +3,7 @@ require chromium-gn.inc
> >  REQUIRED_DISTRO_FEATURES =3D "wayland"
> > =20
> >  DEPENDS +=3D "\
> > +        at-spi2-atk \
> >          libxkbcommon \
> >          virtual/egl \
> >          wayland \
>=20
> --=20
> Best Regards,
> Maksim Sisov=
