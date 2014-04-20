Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3F39C65DA2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:18:25 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so2850751eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1KYR+o5Jtbpqp3WBS8uJGrbDubJ1OVgxcdMhH96kzkE=;
	b=YVWo9enb7MgLrbujujV+kAe8XpHjzZQxr1wkBaJdeb4TKD1Gc1n2HH4oYynAIzGXcm
	0IinfsuuuKjG/SRT9swG+WhTurGlt/AyNKCOSJGg4j9vWIREJcvlobAtr8eZMBZmolSm
	OFlAnVZaVdpAEnU224EUJUBKjpe0ng9ZiPsqnYKzxeHelwxtzV0wMfMx1Gjr/2RwzNq6
	DRiB8mBaUIuARlLdI7subR4NzR26DVrZqwXpH9iPnxeGSoj19jcXRRkKuClkoJB+3l4b
	obFzDmC9VN2LY24m7zmxxjhwnNezdgVcIGOpH/hmeZbFHX9cIFGJFfeZFG4o06HiWB7k
	z1TQ==
X-Received: by 10.15.10.3 with SMTP id f3mr37114128eet.1.1397985506674;
	Sun, 20 Apr 2014 02:18:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e42sm92941448eev.32.2014.04.20.02.18.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:18:25 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:18:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420091830.GA2486@jama>
References: <1397206982-13117-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397206982-13117-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] iw: use BP instead of P to fix multilib builds
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
X-List-Received-Date: Sun, 20 Apr 2014 09:18:26 -0000
X-Groupsio-MsgNum: 49308
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KjcUHqqCp23GY06r"
Content-Disposition: inline

--KjcUHqqCp23GY06r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 05:03:02PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>

Merged, thanks.

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-connectivity/iw/iw_3.11.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/iw/iw_3.11.bb b/meta-oe/recipes=
-connectivity/iw/iw_3.11.bb
> index 42477e7..d72a140 100644
> --- a/meta-oe/recipes-connectivity/iw/iw_3.11.bb
> +++ b/meta-oe/recipes-connectivity/iw/iw_3.11.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D878618a5c4af25=
e9b93ef0be1a93f774"
> =20
>  DEPENDS =3D "libnl pkgconfig"
> =20
> -SRC_URI =3D "http://www.kernel.org/pub/software/network/iw/${P}.tar.bz2 \
> +SRC_URI =3D "http://www.kernel.org/pub/software/network/iw/${BP}.tar.bz2=
 \
>             file://0001-iw-version.sh-don-t-use-git-describe-for-versioni=
ng.patch \
>  "
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KjcUHqqCp23GY06r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkOYACgkQN1Ujt2V2gBxzsACdHQVV8R9mjh68h2BnwopINYE7
MR8AnReJevNDU7i3L0WscHc5DIFTmSer
=Aaug
-----END PGP SIGNATURE-----

--KjcUHqqCp23GY06r--
