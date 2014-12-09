Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5D87C724E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:25:47 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so7336527wiw.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JlAl+YIubGtjt7yYge3ouuCsH8y4ZhVnaypJOjvWW0E=;
	b=yKc7YBFChnAWpgESHhSo+lcUdAS048XHmDfbPA0qaj6ms2lwrb2mJtliMmiFiekWHr
	H3AGxUlHyh5YHQcMcKKrWrlQ4EkmpsusWQI7E4UxGu0PQo9W9/ivNMVXBvD/2olGLEr/
	+iXgf16vjoIe2Oz7l1T57Aa23/4O+rh1SqatJq9UQXdily59CJc4L2v5Z/8722IT5ACF
	JPwdMRS1b3GR+k4CYVyicgyBBT3Q0tROsmmudjCx2gd55HltJZIuKWRnL6Mg+v3sf/Ah
	3o/I5HeusWF25rWdoud+ha1dVHCwr0RZYiUUENepPfrQhZueydc6yOhK0lXyk5bPrwew
	bkCA==
X-Received: by 10.180.83.228 with SMTP id t4mr31774915wiy.28.1418120747872;
	Tue, 09 Dec 2014 02:25:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ep6sm1640010wib.0.2014.12.09.02.25.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:25:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:25:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209102548.GG2470@jama>
References: <1417596619-28605-1-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1417596619-28605-1-git-send-email-sven.ebenfeld@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] stunnel: Update to Version 5.07
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
X-List-Received-Date: Tue, 09 Dec 2014 10:25:48 -0000
X-Groupsio-MsgNum: 53234
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2NLGdgz3UMHa/lqP"
Content-Disposition: inline

--2NLGdgz3UMHa/lqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2014 at 09:50:19AM +0100, Sven Ebenfeld wrote:
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 17 -----------=
------
>  meta-networking/recipes-support/stunnel/stunnel_5.07.bb | 15 +++++++++++=
++++
>  2 files changed, 15 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.=
bb
>  create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.07.=
bb

and=20
stunnel-5.07: stunnel requires /usr/bin/perl, but no providers in its
RDEPENDS [file-rdeps]

>=20
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_4.56.bb
> deleted file mode 100644
> index 74f2234..0000000
> --- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY =3D "Program for providing universal TLS/SSL tunneling service"
> -DESCRIPTION =3D "SSL encryption wrapper between remote client and local =
(inetd-startable) or remote server."
> -SECTION =3D "net"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df41ebed8571077706fee0b860c4d6=
666"
> -DEPENDS =3D "openssl zlib tcp-wrappers"
> -
> -RDEPENDS_${PN} +=3D "perl"
> -
> -SRC_URI =3D "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "ac4c4a30bd7a55b6687cbd62d864054c"
> -SRC_URI[sha256sum] =3D "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec=
8d2778a01c871293"
> -
> -inherit autotools
> -
> -EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_EXECPREFIXDIR}' --disable-fip=
s"
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.07.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_5.07.bb
> new file mode 100644
> index 0000000..bf47aef
> --- /dev/null
> +++ b/meta-networking/recipes-support/stunnel/stunnel_5.07.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "SSL encryption wrapper between remote client and local (ine=
td-startable) or remote server."
> +SECTION =3D "net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D45e8e7befe9a0f7e0543b78dfeebd=
e20"
> +
> +DEPENDS =3D "openssl"
> +SRC_URI =3D "https://www.stunnel.org/downloads/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "c10edd84ecbc676a5a48c7e34ab3d1c5"
> +SRC_URI[sha256sum] =3D "505c6c63c4a20fc0cce8c35ef1ab7626c7b01071e3fca4ac=
6ea417afe8065309"
> +
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_INCDIR}' --disable-fips"
> --=20
> 1.8.1.rc3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2NLGdgz3UMHa/lqP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSGziwACgkQN1Ujt2V2gBxUEQCcCPgyXa/xGeQSuZbWWR071pKQ
2n4AoLqrocvwWM9NkUG6WfzU/nK8E3vo
=T12Z
-----END PGP SIGNATURE-----

--2NLGdgz3UMHa/lqP--
