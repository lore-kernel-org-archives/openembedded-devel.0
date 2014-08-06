Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5736FE7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 21:39:11 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so3316195wes.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 14:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ceo2ZAu0EcWa6jPyljqEesQsf1CBhDOQpN+v+XWTk1w=;
	b=wCY2Fv1MvDfbsXe3ce7ofxMVlpbL3Oig7gzhyWKigcD8lHSrVsJ97RAD1HitIN3L1Z
	uCSBI8FiR0IBM+sK3DpdhI0kaP9Ey1v8NiB3ppHaeYV6vwS0rpN7WKKogcYv6HaEA1bX
	bLVp1e4lJJe4TkxwvFMhaUxYcXgQb8kqE6iXqayVl+ZS7w0n17dWptT/GLccn+mNpcgl
	TgTFIdzKsH5GO0Z5BJ8wy4291MkCQ62C5OmICUNsHhyuBhLrNYjf/lwpe3jajH6f1maB
	amelnjWf9p7nRY/wZCVePXyzlmofv0K7l2mWKXlzTrqv7Aodf1s3sAbsrEclXmi4h4D6
	wiMw==
X-Received: by 10.181.5.39 with SMTP id cj7mr54295191wid.79.1407361152415;
	Wed, 06 Aug 2014 14:39:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb8sm22087560wib.15.2014.08.06.14.39.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 14:39:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 23:39:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806213942.GR14848@jama>
References: <1407354015-12183-1-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1407354015-12183-1-git-send-email-joe_macdonald@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] wireshark: update configuration and epoch
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
X-List-Received-Date: Wed, 06 Aug 2014 21:39:14 -0000
X-Groupsio-MsgNum: 51471
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e7jIye1Ygp5H0AIi"
Content-Disposition: inline

--e7jIye1Ygp5H0AIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 03:40:15PM -0400, Joe MacDonald wrote:
> Commit 6d781369 warranted a PE bump but didn't include it.  Update it,
> correct a typo in EXTRA_OECONF and explicitly disable c-ares resolver at
> the same time.
>=20
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.b=
b b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> index 449ac47..13b1f3f 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> @@ -23,13 +23,15 @@ PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv=
6,"
>  PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes, --with-gnutls=3Dno, gnut=
ls"
>  PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --with-gcrypt=3Dno, libg=
crypt"
> =20
> -EXTRA_OECONF =3D "--with-qt=3Dno --enable-usr-local=3Dno -enable-tshark"
> +EXTRA_OECONF =3D "--with-qt=3Dno --enable-usr-local=3Dno --enable-tshark=
 --with-c-ares=3Dno"
> =20
>  LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb1491=
95e065b0"
>  SRC_URI =3D " \
>      http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.=
0.tar.bz2 \
>  "
> =20
> +PE =3D "1"
> +
>  SRC_URI[md5sum] =3D "8dcfe451d8769901129809d2e19c1fb7"
>  SRC_URI[sha256sum]=3D "0f59fea1c5b35de90af681067e49113fee0dd7a901750a97f=
a25f4256dbf13c7"

Thanks!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> =20
> --=20
> 2.0.0.257.g75cc6c6
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--e7jIye1Ygp5H0AIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPioJ4ACgkQN1Ujt2V2gByxeQCgljqmzE6mL8Wb59JD2wSo83J9
PlIAnj4Bz/ePjRzu/dkdKPWCK1Veqx6v
=V1uL
-----END PGP SIGNATURE-----

--e7jIye1Ygp5H0AIi--
