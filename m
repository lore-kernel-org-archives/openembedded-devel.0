Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id A17216E8DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 19:14:13 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so5078406eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 12:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MfR1eyutAQA089/30WWdzOLfoAXIzM18zwAbNVpvzdA=;
	b=YBoHzdHjQ30WwOHs6a4Uc+hLJ4MOZerQFrk++ZHSU3DU1/MqgqU34cb9f/ZEhBt8xu
	QAPZbWe9xT4hBQ9X8ZbyTBeD2iZ/9C/jdcvFTzNQpvMMwZpTgS9copPZWRAVmxg15wg6
	QmCbrPhrr8Qvs+2sxfyINzI6fP5XiS2Mla8fFkXUHt4X+IadyhN0ZgbcE3PH3ibRhdGg
	f233PdMY6MKrDi7SEpm36dlcY23JcaHjWd2bObU5NoNlb5gIHaxTmjgwwYhILF0SowjZ
	uPQUaKTvJ3Kr5uidM0vBXRWAGPzIMUKXEdAGiBbYqmOeHslqoROf+XgJg++XFNwox2me
	Ab5g==
X-Received: by 10.14.172.69 with SMTP id s45mr31797005eel.26.1395170053913;
	Tue, 18 Mar 2014 12:14:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	44sm36992189eek.30.2014.03.18.12.14.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Mar 2014 12:14:12 -0700 (PDT)
Date: Tue, 18 Mar 2014 20:14:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140318191412.GC3725@jama>
References: <cover.1395133995.git.Chong.Lu@windriver.com>
	<133cccb358d29dfca2dc65f9194b0d1274854ce6.1395133995.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <133cccb358d29dfca2dc65f9194b0d1274854ce6.1395133995.git.Chong.Lu@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH 1/1] openldap: add a dependency to make do_compile pass
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
X-List-Received-Date: Tue, 18 Mar 2014 19:14:17 -0000
X-Groupsio-MsgNum: 48749
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2014 at 05:15:58PM +0800, Chong Lu wrote:
> During compiling=EF=BC=8C we need soelim command provided by groff-native.
> So add DEPENDS to fix this issue, else we will get following error:
>=20
> 	/bin/sh: 15: soelim: not found
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta-oe/recipes-support/openldap/openldap_2.4.23.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-o=
e/recipes-support/openldap/openldap_2.4.23.bb
> index a565e89..cfb8e7b 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
> @@ -21,6 +21,7 @@ SRC_URI[md5sum] =3D "90150b8c0d0192e10b30157e68844ddf"
>  SRC_URI[sha256sum] =3D "5a5ede91d5e8ab3c7f637620aa29a3b96eb34318a8b26c8e=
ef2d2c789fc055e3"
> =20
>  DEPENDS =3D "util-linux"
> +DEPENDS +=3D "groff-native"

I'll merge these 2 lines to one when cherry-picking to master-next.

>  PR =3D "r1"
>  # The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMomwQACgkQN1Ujt2V2gBz84QCguaSO6t+kb/RExnOU10AKarZd
E2cAoK4kyQT4PXQfVQY8TuwxZx2E24YX
=Kjz8
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
