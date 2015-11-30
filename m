Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8F120605BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 20:46:54 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1a3VLZ-00071W-Q5 from Joe_MacDonald@mentor.com ;
	Mon, 30 Nov 2015 12:46:53 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 30 Nov 2015 12:46:53 -0800
Received: by burninator (Postfix, from userid 1000)	id A5C6C58089E; Mon, 30
	Nov 2015 15:46:52 -0500 (EST)
Date: Mon, 30 Nov 2015 15:46:52 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20151130204652.GB20849@mentor.com>
References: <1448534206-31940-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1448534206-31940-1-git-send-email-hongxu.jia@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] postfix.inc: fix start postfix failed while hostname is numeric
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Nov 2015 20:46:54 -0000
X-Groupsio-MsgNum: 58853
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] postfix.inc: fix start postfix failed while =
hostname is numeric] On 15.11.26 (Thu 18:36) Hongxu Jia wrote:

> While hostname is numeric, start postfix failed
> ...
> root@localhost:~# hostname
> 128.224.163.251
> root@localhost:~# postfix start
> postfix: warning: valid_hostname: numeric hostname: 128.224.163.251
> postfix: fatal: unable to use my own hostname
> ...
>=20
> The postfix define a macro SLOPPY_VALID_HOSTNAME to allow the
> numeric hostname.

This seems like it's asking for a lot of trouble, if you either assign
your hostname to '128.224.163.251' (as it appears to be in your commit
log, but I don't know off-hand how you'd do that without writing a
program specifically for that purpose, and even then ...) or if you
assign your hostname to be '128' and the FQDN to be '128.224.163.251'.
Certainly the postfix folks think this is a sufficiently unusual and
presumably hazzard-prone to make it not even a runtime option but a
compile-time one.

Are you sure the issue you're trying to solve here won't be resolved by
applying [] throughout your .cf files?  I'm reluctant to take this patch
since it turns on a surprising feature that, my sense is, is not
desirable in common setups.

-J.

>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-n=
etworking/recipes-daemons/postfix/postfix.inc
> index 6d39570..f8b8e43 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -67,7 +67,7 @@ export CCARGS-sasl_class-native =3D ""
>  export AUXLIBS-sasl_class-native =3D ""
> =20
>  # PCRE, TLS support default
> -export CCARGS  =3D "${CFLAGS} -DHAS_PCRE -DUSE_TLS ${CCARGS-ldap} ${CCAR=
GS-sasl}"
> +export CCARGS  =3D "${CFLAGS} -DHAS_PCRE -DUSE_TLS -DSLOPPY_VALID_HOSTNA=
ME ${CCARGS-ldap} ${CCARGS-sasl}"
>  export AUXLIBS =3D "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap=
}"
>  export POSTCONF =3D "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
> =20
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWXLW8AAoJEEn8ffcsOfaWLS8H/1i/qtqsn825KqPaCK3o1hhU
L/bnB36wYZg3xONLmRL0tBz6V/wxdpqRXiYlLbxjSeLTCxDiNOQuqAXqhPNGADzW
w+JJGUJBLvresLQW8idcLIPNAuGEhvwye7kNFAyYtvP147NOIcJjLPh8ZzZzpXcD
wMGVA5xH63TgPwJXdHUxIToG2TNH1c9saycqMKgWtKGV/UJaDSDQ6X7vr+gYm5X5
9zXxngdXAARI0Tl1pqg5mpAi8uSjENKm6hyMrkhLXogtJbs5SLI7KQalV53Vofdv
6rHiKdPKY+XgiZ7PB3I4sZinyqCDikMYXZ5cxE/WWnj+ejG7avGhCmcdWWDIbqY=
=nenL
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
