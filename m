Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8E58E71AFD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 21:38:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p190so989034wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 14:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IzDwf1jBc1JPiR/z+FuetUikS63o9wocQ/im1YK+0Tk=;
	b=VgBuwpZRLPOG6A1V3NR9JjLH4dYhZev+t54v2LPbG1lfai2NxTvKsptKG9xO5ySd2Q
	1iy57itr/uA5O+s4qvvJmsZjnvXussKQwV3gCoh8HipjzmYfHSFiKcIjyJUnO/BPsDDC
	dYIF9hR37F3w5P+eXAgmMubz5pBpi1oPtpdXLmyB4fc22j0ARNj5WWTlEA/S+m7fOIRy
	UCWo9OpN1cpvRL/mbkyhZD2uXT+OBN6u5c65nt4S7nn5pXhsp/YSDqvBsJOkjmcgCsbK
	nMwZvvQFs/KnSyYFJO06KThcw4L0Itt+he7tubevHbNDrJ5iytpbHQYXARcFzR92clom
	dqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IzDwf1jBc1JPiR/z+FuetUikS63o9wocQ/im1YK+0Tk=;
	b=Jq1h88MdZO9x6rRCp2Rdq+aimSQRl2BLfIBMrfkGMk9Ey1oaIQYcyn3QcZ0Y2U85xR
	+xC5RU2DhAfa8nHpg3EBghVQ9onrwmZ6DFTlvAfZD7K4KsZnNQAHBJWw1f5mX9WMO891
	NUcsw62TbKT8b3RobpveDwbxwr3af1Okoh/0rsK/RM8kRK9d6d9fQxthjhP6siafvEUH
	kx1CWVRw1Os9mKpnILwID/xLfHcedX90j0pQXYIBwi4s0IeO6oRWEEV18ZpfsnFZ6LkL
	dgzLDqNtEltD8KEzbkHkBWgO49bcpP5dlGThiepHzMxtdbNu24NS/MsH0b2l6d4BQvUJ
	DCKQ==
X-Gm-Message-State: ABUngvdyVD4nBanb37Bv29pbLJrQ3qASJb5isHtL6RrgnOK4eEj+XoCUzXfi4/HFGsWyZA==
X-Received: by 10.28.213.74 with SMTP id m71mr82746wmg.39.1478209110027;
	Thu, 03 Nov 2016 14:38:30 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o62sm1111359wmg.12.2016.11.03.14.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Nov 2016 14:38:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Nov 2016 22:38:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161103212705.GA3003@jama>
References: <1477886266-2836-1-git-send-email-akuster808@gmail.com>
	<20161101180418.GC2985@jama>
MIME-Version: 1.0
In-Reply-To: <20161101180418.GC2985@jama>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-networking][V2]PATCH] wireshark: install missing header files
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
X-List-Received-Date: Thu, 03 Nov 2016 21:38:31 -0000
X-Groupsio-MsgNum: 63728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline

--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2016 at 07:04:18PM +0100, Martin Jansa wrote:
> On Sun, Oct 30, 2016 at 08:57:46PM -0700, Armin Kuster wrote:
> > Wireshark does not install header files. add install_append
> > Remove ALLOW_EMPTY & INHIBIT_PACKAGE_DEBUG_SPLIT, they are no longer ne=
eded
> >=20
> > V2]
> > add missing libssh and sbc config
> >=20
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  .../recipes-support/wireshark/wireshark_2.2.1.bb   | 28 ++++++++++++++=
++++----
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.=
bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> > index a5fb7f6..4e23bae 100644
> > --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> > +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> > @@ -4,7 +4,7 @@ SECTION =3D "net"
> >  LICENSE =3D "GPL-2.0"
> >  LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb14=
9195e065b0"
> > =20
> > -DEPENDS =3D "pcre expat glib-2.0 sbc"
> > +DEPENDS =3D "pcre expat glib-2.0"
> > =20
> >  SRC_URI =3D "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.=
bz2"
> > =20
> > @@ -37,13 +37,33 @@ PACKAGECONFIG[lua] =3D "--with-lua=3Dyes, --with-lu=
a=3Dno, lua"
> >  PACKAGECONFIG[zlib] =3D "--with-zlib=3Dyes, --with-zlib=3Dno, zlib"
> >  PACKAGECONFIG[geoip] =3D "--with-geoip=3Dyes, --with-geoip=3Dno, geoip"
> >  PACKAGECONFIG[plugins] =3D "--with-plugins=3Dyes, --with-plugins=3Dno"
> > +PACKAGECONFIG[sbc] =3D "--with-sbc=3Dyes, --with-sbc=3Dno, sbc"
> > +
> > +PACKAGECONFIG[libssh] =3D "--with-ssh=3Dyes, --with-ssh=3Dno, libssh2"
> > +
> > =20
> >  # these next two options require addional layers
> >  PACKAGECONFIG[c-ares] =3D "--with-c-ares=3Dyes, --with-c-ares=3Dno, c-=
ares"
> > =20
> >  EXTRA_OECONF +=3D "--with-qt=3Dno --enable-tshark --enable-rawshark"
> > =20
> > -ALLOW_EMPTY_${PN} =3D "1"
> > -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> > +# Currently wireshark does not install header files
> > +do_install_append () {
> > +
> > +	install -d ${D}/${includedir}/${BPN}
> > +	install -d ${D}/${includedir}/${BPN}/epan
> > +	install -d ${D}/${includedir}/${BPN}/epan/crypt
> > +	install -d ${D}/${includedir}/${BPN}/epan/dfilter
> > +	install -d ${D}/${includedir}/${BPN}/epan/dissectors
> > +	install -d ${D}/${includedir}/${BPN}/epan/ftypes
> > +	install -d ${D}/${includedir}/${BPN}/epan/wmem
> > =20
> > -FILES_${PN} +=3D "${datadir}*"
>=20
> Doesn't this still cause many unpackaged files and QA errors as reported
> earlier?

It does and sbc issue is still there as well:

wireshark-2.2.1: wireshark: Files/directories were installed but not
shipped in any package:
  /usr/share/mime
  /usr/share/appdata
  /usr/share/icons
  /usr/share/mime/packages
  /usr/share/mime/packages/wireshark.xml
  /usr/share/appdata/wireshark.appdata.xml
  /usr/share/icons/hicolor
  /usr/share/icons/hicolor/16x16
  /usr/share/icons/hicolor/24x24
  /usr/share/icons/hicolor/32x32
  /usr/share/icons/hicolor/48x48
  /usr/share/icons/hicolor/64x64
  /usr/share/icons/hicolor/128x128
  /usr/share/icons/hicolor/256x256
  /usr/share/icons/hicolor/scalable
  /usr/share/icons/hicolor/16x16/apps
  /usr/share/icons/hicolor/16x16/mimetypes
  /usr/share/icons/hicolor/16x16/apps/wireshark.png
  /usr/share/icons/hicolor/16x16/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/24x24/apps
  /usr/share/icons/hicolor/24x24/mimetypes
  /usr/share/icons/hicolor/24x24/apps/wireshark.png
  /usr/share/icons/hicolor/24x24/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/32x32/apps
  /usr/share/icons/hicolor/32x32/mimetypes
  /usr/share/icons/hicolor/32x32/apps/wireshark.png
  /usr/share/icons/hicolor/32x32/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/48x48/apps
  /usr/share/icons/hicolor/48x48/mimetypes
  /usr/share/icons/hicolor/48x48/apps/wireshark.png
  /usr/share/icons/hicolor/48x48/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/64x64/apps
  /usr/share/icons/hicolor/64x64/mimetypes
  /usr/share/icons/hicolor/64x64/apps/wireshark.png
  /usr/share/icons/hicolor/64x64/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/128x128/apps
  /usr/share/icons/hicolor/128x128/mimetypes
  /usr/share/icons/hicolor/128x128/apps/wireshark.png
  /usr/share/icons/hicolor/128x128/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/256x256/apps
  /usr/share/icons/hicolor/256x256/mimetypes
  /usr/share/icons/hicolor/256x256/apps/wireshark.png
  /usr/share/icons/hicolor/256x256/mimetypes/application-wireshark-doc.png
  /usr/share/icons/hicolor/scalable/apps
  /usr/share/icons/hicolor/scalable/apps/wireshark.svg
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
wireshark: 45 installed and not shipped files. [installed-vs-shipped]
wireshark-2.2.1: wireshark rdepends on sbc, but it isn't a build
dependency, missing sbc in DEPENDS or PACKAGECONFIG? [build-deps]

>=20
> > +	install config.h ${D}/${includedir}/${BPN}
> > +	install ${S}/register.h ${D}/${includedir}/${BPN}
> > +	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
> > +	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
> > +	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilt=
er
> > +	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/di=
ssectors
> > +	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
> > +	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
> > +}
> > --=20
> > 2.7.4
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgbrlYACgkQN1Ujt2V2gBzRqACfeMJ/BQuDNW9yFqy2062ojl0r
4wwAoJV+gh4N1a74paIdnQJq39IegzU9
=ofoX
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
