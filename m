Return-Path: <joe@deserted.net>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1632E60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 02:04:04 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id l13so5718754iga.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=fqejo0nW/v1aSN/ATju75b8niLa1/Y2NR8X/gRglK2E=;
	b=WzcrwB9Z6CqhGe4oAJl9BRpv0k5DEbUvldSQcJdN04ldbf++/2JKLmvln+Zm0pattc
	78kcQLXL4roNKC+hZ89SMpUwmRVlLy4AqGtml7h1b9MW2laf6Iy03w98VdycctSsQxUJ
	WsiJ718qNqfntKuyQejzgpibTxj7pAQiqRqQUbdV3lGGKz09/TTMP03SaFEFYhjQje/t
	BpEoefrxtnAZNNDsnYT1p+lPawGb5U0csCc0liHQ0fMtYgolB/6B/WsZ9WhS65jM4PR5
	U8qs8I5q26YBx+0DT5S41ERc8itBoZdfwtpmU/jwUSLqaUKPGYo7oDxV4s8DXvzgQyRo
	hX1A==
X-Gm-Message-State: ALoCoQlA2ZKvZa7Zj1P35/8tuHWPNT11vtOjdSbiU6WFu3fTAHAHqRqqeVktx6yHTenOhxFvVnEo
X-Received: by 10.43.1.135 with SMTP id nq7mr279413icb.95.1411524245744;
	Tue, 23 Sep 2014 19:04:05 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id ga10sm3182985igd.0.2014.09.23.19.04.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 19:04:05 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id E77E81685E4; Tue, 23 Sep 2014 22:04:03 -0400 (EDT)
Date: Tue, 23 Sep 2014 22:04:03 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140924020402.GC16953@deserted.net>
References: <1410911419-466-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1410911419-466-1-git-send-email-akuster808@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] wireshark: update to 12.1
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
X-List-Received-Date: Wed, 24 Sep 2014 02:04:05 -0000
X-Groupsio-MsgNum: 52204
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline

--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Armin.  I also included Roy's patch for the BUILD_CFLAGS
since, looking at my own build logs when cross-building, it looks like
it is required, but please let me know if you think it's inappropriate.

Thanks,
-J.

[[oe] [meta-networking][PATCH] wireshark: update to 12.1] On 14.09.16 (Tue =
16:50) Armin Kuster wrote:

> following security fixes included:
> MEGACO dissector infinite loop. (Bug 10333) CVE-2014-6423
> Netflow dissector crash. (Bug 10370) CVE-2014-6424
> CUPS dissector crash. (Bug 10353) CVE-2014-6425
> HIP dissector infinite loop. CVE-2014-6426
> RTSP dissector crash. (Bug 10381) CVE-2014-6427
> SES dissector crash. (Bug 10454) CVE-2014-6428
> Sniffer file parser crash. (Bug 10461) CVE-2014-6429 CVE-2014-6430 CVE-20=
14-6431 CVE-2014-6432
>=20
> re-org'd dd file to be more in-line with style guide.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../{wireshark_1.12.0.bb =3D> wireshark_1.12.1.bb}    | 21 ++++++++++---=
--------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0.bb =
=3D> wireshark_1.12.1.bb} (90%)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.b=
b b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
> similarity index 90%
> rename from meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
> index 39a24dc..71cc082 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
> @@ -2,9 +2,19 @@ DESCRIPTION =3D "wireshark - a popular network protocol =
analyzer"
>  HOMEPAGE =3D "http://www.wireshark.org"
>  SECTION =3D "network"
>  LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb1491=
95e065b0"
> =20
>  DEPENDS =3D "perl-native libcap libpcap pcre expat glib-2.0 libnl sbc"
> =20
> +SRC_URI =3D " \
> +    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-${PV}=
=2Etar.bz2 \
> +"
> +
> +PE =3D "1"
> +
> +SRC_URI[md5sum] =3D "14b3e3d8979d1eb27ff085bb5f400e67"
> +SRC_URI[sha256sum]=3D "82b26bd416ec15903b27785e35a622687008a743342054e96=
eaaeaa249be584b"
> +
>  inherit autotools pkgconfig
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> @@ -27,16 +37,6 @@ PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --with=
-gcrypt=3Dno, libgcrypt"
> =20
>  EXTRA_OECONF =3D "--with-qt=3Dno --enable-usr-local=3Dno --enable-tshark=
 --with-c-ares=3Dno"
> =20
> -LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb1491=
95e065b0"
> -SRC_URI =3D " \
> -    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.=
0.tar.bz2 \
> -"
> -
> -PE =3D "1"
> -
> -SRC_URI[md5sum] =3D "8dcfe451d8769901129809d2e19c1fb7"
> -SRC_URI[sha256sum]=3D "0f59fea1c5b35de90af681067e49113fee0dd7a901750a97f=
a25f4256dbf13c7"
> -
>  do_configure_prepend() {
>      # force to use fallback=20
>      sed -i -e '/^glib_prefix/s/=3D.*$/=3D""/' ${S}/aclocal-flags
> @@ -44,4 +44,3 @@ do_configure_prepend() {
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> -
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlQiJpIACgkQwFvcllog0Xyg/ACffuhLgGT80iaqYfNcg/tiBQ8d
YBUAniGtw2U1W37/IQ3YF6PXIfBMv8Be
=DTGy
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
