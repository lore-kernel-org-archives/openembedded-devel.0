Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id C9B996B23B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2013 18:45:17 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so1062696ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6D5ixWfe71nuikuo2A90glPQHrQtN950Nsys4n7SW78=;
	b=qvdKM9uU23vn6hoz0XcdDexfqzHZtT3wOX1OHue/iONT6nZxb8y2lt+W8NicgRtPhE
	gOMlluYA92DeqtQaeY8iWk3Rd9OAKyze/1anDIBYH1Tg4/Lm02KcVcZnOxK9jpEprKDO
	E42n0tqhFMbUeDCp5YzV5e64/RFWYtft4SsIa38LVPSZOKcKV9KoDgpvSks4RQyvvGF/
	rA6wwZD4borMg9s/LZDQeL6acehahtHu22TqPUs2liCB4pAth0nFXiEv2iux75o3ZEU6
	jAA02ncs06v2HnDQ16S8d0LDwoWNeHIL6AMNaNDPUTcWrWuBHLh0GaoELKsCoNTKRFPw
	89jw==
X-Received: by 10.15.10.9 with SMTP id f9mr443992eet.84.1377197117929;
	Thu, 22 Aug 2013 11:45:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm19343214eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 11:45:17 -0700 (PDT)
Date: Thu, 22 Aug 2013 20:46:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130822184623.GM522@jama>
References: <1377192537-9770-1-git-send-email-root@pol-lx-007.polatis.com>
MIME-Version: 1.0
In-Reply-To: <1377192537-9770-1-git-send-email-root@pol-lx-007.polatis.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] stunnel: Add 4.56 version
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
X-List-Received-Date: Thu, 22 Aug 2013 18:45:18 -0000
X-Groupsio-MsgNum: 45804
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cqq5NadOW2RfLMJ/"
Content-Disposition: inline

--Cqq5NadOW2RfLMJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2013 at 06:28:57PM +0100, root@myhostname wrote:
> From: Laszlo Papp <lpapp@kde.org>
>=20

missing SOB line.

> ---
>  meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 14 +++++++++++=
+++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.=
bb
>=20
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_4.56.bb
> new file mode 100644
> index 0000000..21fa436
> --- /dev/null
> +++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "SSL encryption wrapper between remote client and local (ine=
td-startable) or remote server."
> +SECTION =3D "net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df41ebed8571077706fee0b860c4d6=
666"
> +DEPENDS =3D "openssl"
> +
> +SRC_URI =3D "https://www.stunnel.org/downloads/${PN}-${PV}.tar.gz"

You can shorten ${PN}-${PV} as ${P} or even ${BP}.

> +
> +SRC_URI[md5sum] =3D "ac4c4a30bd7a55b6687cbd62d864054c"
> +SRC_URI[sha256sum] =3D "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec=
8d2778a01c871293"
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_INCDIR}' --disable-fips"
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Cqq5NadOW2RfLMJ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIWXH8ACgkQN1Ujt2V2gByebgCgr/b2DQOYo8DIn0a/v6UlYkv1
7ocAnA+CXKoi7IF+hA4ROemO980FCoc6
=t8NR
-----END PGP SIGNATURE-----

--Cqq5NadOW2RfLMJ/--
