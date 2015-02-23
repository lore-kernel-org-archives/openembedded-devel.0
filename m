Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 627BA72D36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 19:13:03 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YPyRE-0000iB-5w from Joe_MacDonald@mentor.com ;
	Mon, 23 Feb 2015 11:13:04 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Feb 2015 11:13:03 -0800
Received: by burninator (Postfix, from userid 1000)	id 66ADE582837; Mon, 23
	Feb 2015 14:13:07 -0500 (EST)
Date: Mon, 23 Feb 2015 14:13:07 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Message-ID: <20150223191307.GA8949@mentor.com>
References: <1424073156-18834-1-git-send-email-biannm@cn.fujitsu.com>
	<1424073156-18834-3-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1424073156-18834-3-git-send-email-biannm@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2 2/2] postfix: fix bug of main.cf_2.0
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
X-List-Received-Date: Mon, 23 Feb 2015 19:13:08 -0000
X-Groupsio-MsgNum: 54463
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bian,

I merged the other postfix change, but this one I'm less sure about.  Is
this actually incorrect?  The standard place to install postfix is in
/usr/libexec and that seems to be where we install it as well.

-J.

[[oe] [meta-networking][PATCH v2 2/2] postfix: fix bug of main.cf_2.0] On 1=
5.02.16 (Mon 15:52) Bian Naimeng wrote:

>  ${exec_prefix}/libexec/${PN} =3D> ${libexecdir}
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  meta-networking/recipes-daemons/postfix/files/main.cf_2.0 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0 b/=
meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> index bb31451..9e1077f 100644
> --- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> +++ b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> @@ -30,7 +30,7 @@ queue_directory =3D /var/spool/postfix
>  mail_spool_directory =3D /var/spool/mail
>  readme_directory =3D no
>  command_directory =3D /usr/sbin
> -daemon_directory =3D /usr/libexec/postfix
> +daemon_directory =3D /usr/lib/postfix
>  mail_owner =3D postfix
>  setgid_group =3D postdrop
>  unknown_local_recipient_reject_code =3D 450
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU63vAAAoJEEn8ffcsOfaW8g4IAJ/RY6UgUQbmGMQTry48EV8+
4z4xwYTbP9iRaiQjb+UKHAaxUUNZuykyUcw6evKsAInlwqYjNnaiGZEjPAPkHNa5
YFh4J8+ZeanmOx444B8AYnfUxhGi+Wc7MAsCeuIVrzyy2iA3tdlNT0Yzqe9YvKGn
4efJOAvZRPqHbGkh4m+/iwdTAzft+89x6AYSb74h5rWwFvqR9VjpgmNnO2lAKVP5
XK+iGGYu+P9azUbiuiqj97/NwjIe7sUEzW3qxsumaWM5agqwrVCFJxluYJtKYXRo
PEY2M7sbkiSjwM5+eVypIYfkmdZo2lk0cerRcnP0JH0dl5/2BwUS311Y+NatwIk=
=yJN9
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
