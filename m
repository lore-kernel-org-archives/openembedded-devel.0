Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tuzyi-0006WV-4P
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jan 2013 07:26:32 +0100
Received: by mail-pb0-f44.google.com with SMTP id uo1so2647757pbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 22:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tSdYTnQgiZ1N7JjN0yV6zoMST2G78n73XIlWydJYcN4=;
	b=twSOCG7oyCHEuSMvr5GnI1SG8J9LVVF4F9WTeIK+e6BSyV2VNGNzaOo+fGZVxR/Bw0
	P9h3qkBsqkW/Q/gBuvWGFCNqpb7FUqyYracdamkh61/KV1XsA3OW1otbII//IxAOAVQZ
	0GmIMK0Ca6NB4s2PKDWqJgKES4fGsuvG7bx19/KyDYSuVAdnYyxibtxfF9ZLLea6QRKW
	yQ1j2liyKn3Y+068RxCu9J9VGQG/bC45AwMO3INYEjL+fP+nVKXxTCQw0Y6+qN+AhOuO
	+TsOkVgFboJt18BKOpRzsw4Gc2T73f3G/XDVwC5C6vyYkqE0MPqHbkbliBqM4ZmX5skC
	8iqQ==
X-Received: by 10.68.242.41 with SMTP id wn9mr118000051pbc.142.1358230271405; 
	Mon, 14 Jan 2013 22:11:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pv8sm9602564pbc.26.2013.01.14.22.11.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 22:11:10 -0800 (PST)
Date: Tue, 15 Jan 2013 07:11:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130115061109.GI2992@jama>
References: <1358094394-25613-1-git-send-email-andrei@gherzan.ro>
MIME-Version: 1.0
In-Reply-To: <1358094394-25613-1-git-send-email-andrei@gherzan.ro>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia][PATCH] libpostproc: Remove -disable-yasm as this is a nonexistent flag
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 06:26:32 -0000
X-Groupsio-MsgNum: 42701
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QDIl5R72YNOeCxaP"
Content-Disposition: inline

--QDIl5R72YNOeCxaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 13, 2013 at 06:26:34PM +0200, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Looks good, but [meta-multimedia] tag is for meta-multimedia layer not
recipes-multimedia.

Cheers,

> diff --git a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb b/=
meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
> index 3620ff0..1520628 100644
> --- a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
> +++ b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
> @@ -6,6 +6,7 @@ LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
>  PV =3D "0.0.0+git${SRCPV}"
> +PR =3D "r1"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> @@ -40,10 +41,6 @@ EXTRA_OECONF =3D " \
>          ${EXTRA_FFCONF} \
>  "
> =20
> -#| yasm not found, use --disable-yasm for a crippled build
> -EXTRA_OECONF_append_x86-64 =3D " --disable-yasm"
> -EXTRA_OECONF_append_x86 =3D " --disable-yasm"
> -
>  do_configure() {
>      ./configure ${EXTRA_OECONF}
>  }
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QDIl5R72YNOeCxaP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD08v0ACgkQN1Ujt2V2gBwUpgCgsxVyw95YlSNixJDPpMYr4gO8
K6gAnA9x8hzNb26iKLkDwH/IbPilnKKp
=Pj9f
-----END PGP SIGNATURE-----

--QDIl5R72YNOeCxaP--
