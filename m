Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 16A4177042
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2015 07:40:49 +0000 (UTC)
Received: by pacwi10 with SMTP id wi10so38506792pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2015 00:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=8wjO1oynRUkJgzJRE9RnZctzgz4dDhycD2tSfIC7d5c=;
	b=GlY6IrqJF6qUWvdKEqznuwboTUuXpiBFjBULHo6MMp5k8j89H+cTh91AtvoWqKRigy
	CuWUPy0gl5pCnTNvRnE5T1EoJPc4hh+1Gc/5r/2PYkDIHnszKlsRpwj6wh34IjrCKdey
	CORLu8T3LWy2rhS650mqMbwnIFDvLTellI9InCqhowHSD37DjJgrzgivwEM7lduwnbkx
	Sv/bkce2ZxUf36NqVPizhZPZAacg19FQxVIev3M+8Sw1bzhgzewqp8NYPsITDTyfVptA
	H3lg+j0rl/Vx4/w2m+fI+wrPxJV4T6ym1WgP3bS4nSskRVbku9oeR+6xwJAyGYNdCm4y
	s6GQ==
X-Received: by 10.68.175.3 with SMTP id bw3mr64228411pbc.106.1441266049945;
	Thu, 03 Sep 2015 00:40:49 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:fd7a:4981:c782:49fe?
	([2601:646:8601:4580:fd7a:4981:c782:49fe])
	by smtp.gmail.com with ESMTPSA id
	fx4sm24099634pbb.92.2015.09.03.00.40.49
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 03 Sep 2015 00:40:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRThO4BbD=VVG=HVOUXeCfAeCaV2-TdYvLhrw+oryjmLZQ@mail.gmail.com>
Date: Thu, 3 Sep 2015 00:40:43 -0700
Message-Id: <A4B4CBAA-A1E5-4E7D-9347-C11722A86A75@gmail.com>
References: <1441240011-49718-1-git-send-email-raj.khem@gmail.com>
	<CALbNGRThO4BbD=VVG=HVOUXeCfAeCaV2-TdYvLhrw+oryjmLZQ@mail.gmail.com>
To: =?utf-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.2104)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] plymouth: Add recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 07:40:50 -0000
X-Groupsio-MsgNum: 57189
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E76F7C43-5850-4336-8A24-236567B40B96";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E76F7C43-5850-4336-8A24-236567B40B96
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 3, 2015, at 12:22 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> Hi Khem,
>=20
> I was on my TODO - thanks. Tiny comment below.
>=20
> On Thu, Sep 3, 2015 at 2:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 62 =
+++++++++++++++++++++++++
>> 1 file changed, 62 insertions(+)
>> create mode 100644 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
>>=20
>> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb =
b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
>> new file mode 100644
>> index 0000000..f7f1af2
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
>> @@ -0,0 +1,62 @@
>> +SUMMARY =3D "Plymouth is a project from Fedora providing a =
flicker-free graphical boot process."
>> +
>> +DESCRIPTION =3D "Plymouth is an application that runs very early in =
the boot process \
>> +               (even before the root filesystem is mounted!) that =
provides a \
>> +              graphical boot animation while the boot process =
happens in the background."
>> +
>> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/Plymouth"
>> +SECTION =3D "base"
>> +
>> +LICENSE =3D "GPLv2+"
>> +
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
>> +
>> +DEPENDS =3D "libcap libpng cairo dbus udev"
>> +PROVIDES =3D "virtual/psplash"
>> +RPROVIDES_${PN} =3D "virtual/psplash virtual/psplash-support"
>> +
>> +SRC_URI =3D =
"http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz=
2"
>> +SRC_URI[md5sum] =3D "ff420994deb7ea203df678df92e7ab7d"
>> +SRC_URI[sha256sum] =3D =
"2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
>> +
>> +EXTRA_OECONF +=3D " --enable-shared --disable-static \
>> +                  --disable-gtk --disable-pango \
> ^ This line should go - it is in PACKAGECONFIG

Done


--Apple-Mail=_E76F7C43-5850-4336-8A24-236567B40B96
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXn+YAACgkQuwUzVZGdMxTfdwCZAfy/qNFNmiwKNGwkU0JQNRaW
pV0AnR7djbKMr/wIB7Qmd49WxpK6O/tn
=8qd0
-----END PGP SIGNATURE-----

--Apple-Mail=_E76F7C43-5850-4336-8A24-236567B40B96--
