Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 82A986B24D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 13:47:13 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1034898eae.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Aug 2013 06:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cSL9h1C9JmLgx6nUUVOUDqK/vIc9xW6vsoHctAd8Wic=;
	b=PG1f3YBWeV9s7vEftHxvaw5BWOWVHh9wdduZbKFmyVDVI1T90b+K8aZrvrUi/gtaUP
	zyWh3J0qBXnDsMZ16ADRkqnknabOrY2tIqEQ5CGcvn/zg2yKapDTQKz+qyw22FsL5U7q
	DsDjokrYoG1R4ZdjY/8Ha8Codew+M0rUS03Km2sS6dQ3NiqhkwIQ05njr5qo350jsM3l
	tVW5IO1RmKH5rUjdI37lbImifKdnL3PAuS5aUE7uGHfS1IRpHJsFXG/9fBXFlxvAQLp6
	boTsEU1JEjRdyyT5gzdJhdJJGmAGoggQUD/Mg5hvMvQB+UKrJAmD00Q1Cl90CG+YFOdX
	KN4g==
X-Received: by 10.15.21.76 with SMTP id c52mr1457625eeu.135.1375364833719;
	Thu, 01 Aug 2013 06:47:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ci50sm4453169eeb.12.2013.08.01.06.47.12 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 06:47:13 -0700 (PDT)
Date: Thu, 1 Aug 2013 15:47:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130801134749.GP3280@jama>
References: <1375364341-35086-1-git-send-email-javier.viguera@digi.com>
MIME-Version: 1.0
In-Reply-To: <1375364341-35086-1-git-send-email-javier.viguera@digi.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Javier Viguera <javier.viguera@digi.com>
Subject: Re: [meta-networking][dylan][PATCH] vsftpd: fix compile-time dependence
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
X-List-Received-Date: Thu, 01 Aug 2013 13:47:13 -0000
X-Groupsio-MsgNum: 45547
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xNm6VWMD3PcA105u"
Content-Disposition: inline

--xNm6VWMD3PcA105u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2013 at 03:39:01PM +0200, Javier Viguera wrote:
> vsftpd links with openssl libraries (libssl and libcrypto) so there is a
> compile-time dependence on openssl package.
>=20
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>  meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb b/met=
a-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> index c02ee9c..f146910 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> @@ -4,7 +4,7 @@ SECTION =3D "network"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47b1=
271"
> =20
> -DEPENDS =3D "libcap"
> +DEPENDS =3D "libcap openssl"
> =20

It was fixed a month ago:

commit 46354a697c18a64c5836159adf8dbd92e6547e85
Author: Martin Jansa <martin.jansa@gmail.com>
Date:   Tue Jul 2 20:31:56 2013 +0200

    vsftpd: add missing dependency on openssl

And current vsftpd is 3.0.0:

commit 441502b68d03a4ce7796436a53c5e95399724ad2
Author: Roy.Li <rongqing.li@windriver.com>
Date:   Fri Jul 19 10:19:25 2013 +0800

    Upgrade vsftpd to 3.0.0


>  SRC_URI =3D "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
>             file://makefile-destdir.patch \
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xNm6VWMD3PcA105u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH6ZwUACgkQN1Ujt2V2gBy3ewCffhB0LZoKbzddjQDDmFE9/GeO
A1cAoKvzwdZtHWY9tXvRRBMjA1Q4ENYQ
=D5Si
-----END PGP SIGNATURE-----

--xNm6VWMD3PcA105u--
