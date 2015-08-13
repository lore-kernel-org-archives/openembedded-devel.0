Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 81B1B73905
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 16:12:53 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so40064994pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=8Fd5K1hcIGKsoEKZCuB5ZzeEsnte4iBgdfrpupuUfdU=;
	b=b396tR3ejUbyiMtlxZgIkqwptNGhIzhfi7bfFVgzDajmumnfaiMX71y3dtHcKi1U6R
	f05JQfz8glrcvL/NsgV3QaKUHzjK1Yhfa7COjlYao8qg7A5DQWOrMHRaMRp/3MIGIc7q
	06e8hDpDjohB0DsodRnXjxnU0CorPXUcyL1HAKwuKSP0Wxj561UGlY8EzodPc3ZoWk+v
	KPF4oyIMD64GI0TtUiTypgTWo/MMN2cjHOj87ktW9T19nTk6nEoeFiGCR40imyECycuC
	UTgkS8jqLq4lL9dTuJMTAUyc53OngFptfOPwkWs0V+ZrEwAhc5aw1ZVFhvST+odHlXa4
	elMQ==
X-Received: by 10.68.249.66 with SMTP id ys2mr80427583pbc.82.1439482373528;
	Thu, 13 Aug 2015 09:12:53 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:91a9:55b7:6f3a:6b82?
	([2601:647:4c02:370d:91a9:55b7:6f3a:6b82])
	by smtp.gmail.com with ESMTPSA id j4sm3157303pdo.62.2015.08.13.09.12.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Aug 2015 09:12:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1439461154-22584-1-git-send-email-s.mueller-klieser@phytec.de>
Date: Thu, 13 Aug 2015 09:12:45 -0700
Message-Id: <E8573465-F870-4AAB-B024-3E57EE136D83@gmail.com>
References: <1439461154-22584-1-git-send-email-s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-multimedia][PATCH] vorbis-tools: add new recipe
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
X-List-Received-Date: Thu, 13 Aug 2015 16:12:56 -0000
X-Groupsio-MsgNum: 56683
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6386B377-45FC-4A21-90B4-8BB7C1FC2949";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6386B377-45FC-4A21-90B4-8BB7C1FC2949
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 13, 2015, at 3:19 AM, Stefan M=C3=BCller-Klieser =
<s.mueller-klieser@phytec.de> wrote:
>=20
> Vorbis tools provide command line editing and playback tools for the
> patent free audio codec. Use cases in embedded are audio tests and
> performance benchmarks.
>=20
> Signed-off-by: Stefan M=C3=BCller-Klieser =
<s.mueller-klieser@phytec.de>
> ---
> .../vorbis-tools/vorbis-tools_1.4.0.bb             | 32 =
++++++++++++++++++++++
> 1 file changed, 32 insertions(+)
> create mode 100644 =
meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
>=20
> diff --git =
a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb =
b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
> new file mode 100644
> index 0000000..de89d22
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "Vorbis Tools"
> +DESCRIPTION =3D "Ogg Vorbis is a high-quality lossy audio codec \
> +that is free of intellectual property restrictions. vorbis-tools \
> +include some command line applications to use the libraries."
> +HOMEPAGE =3D "http://www.vorbis.com/"
> +BUGTRACKER =3D "https://trac.xiph.org"
> +SECTION =3D "multimedia"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> +
> +DEPENDS =3D "libogg libvorbis curl libao"
> +
> +SRC_URI =3D "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "567e0fb8d321b2cd7124f8208b8b90e6"
> +SRC_URI[sha256sum] =3D =
"a389395baa43f8e5a796c99daf62397e435a7e73531c9f44d9084055a05d22bc"
> +
> +inherit autotools pkgconfig gettext
> +
> +RDEPENDS_${PN} =3D "libogg libvorbis libcurl libao"
> +
> +PACKAGECONFIG ??=3D "flac"
> +PACKAGECONFIG[flac] =3D ",--without-flac,flac,libflac"
> +PACKAGECONFIG[speex] =3D ",--without-speex,speex,speex"
> +
> +EXTRA_OECONF =3D "--with-ogg-libraries=3D${STAGING_LIBDIR} \
> +                --with-ogg-includes=3D${STAGING_INCDIR} \
> +                --with-vorbis-libraries=3D${STAGING_LIBDIR} \
> +                --with-vorbis-includes=3D${STAGING_INCDIR} \
> +                --with-curl-libraries=3D${STAGING_LIBDIR} \
> +                --with-curl-libraries=3D${STAGING_LIBDIR} \

here there is duplication problem. last two lines are ditto
I also wonder if this EXTRA_CONF setting is completely required or not


> +"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_6386B377-45FC-4A21-90B4-8BB7C1FC2949
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXMwgEACgkQuwUzVZGdMxQofgCfbfEJcWG3iwfH9fNTCvHsoHA2
8+sAoIxkK101B3BPW923H5l2QuuB29oY
=NafB
-----END PGP SIGNATURE-----

--Apple-Mail=_6386B377-45FC-4A21-90B4-8BB7C1FC2949--
