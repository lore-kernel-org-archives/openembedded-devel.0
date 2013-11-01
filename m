Return-Path: <joe@deserted.net>
Received: from mail-qe0-f45.google.com (mail-qe0-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6CA4D6D34D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 14:27:03 +0000 (UTC)
Received: by mail-qe0-f45.google.com with SMTP id 8so2613074qea.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 07:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=XYZo1/8ZUxoGUKrF2JqBzWx45JrEyogQlsXzJmliVFg=;
	b=gBHhUATD40sNXxUk67fcR5AbsaD6qQDgP+fRUCB5pAM4mMFEZ3sBcGSnbhvtYaIXSQ
	ILKx8iJDZStzYr7vb7sD7GdXSRzInRyTb9KlcCkDJ3KjvFTpMGv1n+GWk+I6N4byTgL/
	frGa6fDR8CLHqTo1oNRhbOMz+hzrpa7SdULKzRDWtAlLSRGAiRsH/zpfTI0EIwpMom9h
	YXmV9XqKqsho/pLMeQ55SJ6bffnWt6TysvCI+EC1xzq/7iEqF9nq3xjgpLkhqQvW9wVv
	UsaIpgVMBaiEXT2gqk5gkiHb9hNW/xhOZ3vK/2MA3Kj3gC0gZrU9sF2IXERLoLuWlFrq
	lQpQ==
X-Gm-Message-State: ALoCoQkdDsHjgiGAfLS1heG65eTYHkkxQqcQqp1lJs9N+aNWzpmjNoxfAWNctBa+MLyYr5zucg+i
X-Received: by 10.229.172.3 with SMTP id j3mr4329036qcz.10.1383316025218;
	Fri, 01 Nov 2013 07:27:05 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id h9sm21475132qaq.9.2013.11.01.07.27.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Nov 2013 07:27:04 -0700 (PDT)
Date: Fri, 1 Nov 2013 10:27:02 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131101142700.GD4412@deserted.net>
References: <1383250251-16449-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1383250251-16449-1-git-send-email-Martin.Jansa@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] cifs-utils: Add PACKAGECONFIG for cifscreds, cifsupcall
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
X-List-Received-Date: Fri, 01 Nov 2013 14:27:03 -0000
X-Groupsio-MsgNum: 46978
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline

--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] cifs-utils: Add PACKAGECONFIG for cifscreds,=
 cifsupcall] On 13.10.31 (Thu 21:10) Martin Jansa wrote:

> * make files in bindir/sbindir a bit more deterministic
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-support/cifs/cifs-utils_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/met=
a-networking/recipes-support/cifs/cifs-utils_git.bb
> index d8de714..2b7a0dd 100644
> --- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> +++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> @@ -14,6 +14,10 @@ S =3D "${WORKDIR}/git"
> =20
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[cap] =3D "--with-libcap,--without-libcap,libcap"
> +# when enabled, it creates ${bindir}/cifscreds and --ignore-fail-on-non-=
empty in do_install_append is needed
> +PACKAGECONFIG[cifscreds] =3D "--enable-cifscreds,--disable-cifscreds,key=
utils"
> +# when enabled, it creates ${sbindir}/cifs.upcall and --ignore-fail-on-n=
on-empty in do_install_append is needed
> +PACKAGECONFIG[cifsupcall] =3D "--enable-cifsupcall,--disable-cifsupcall,=
krb5 talloc keyutils"
> =20
>  inherit autotools pkgconfig
> =20
--=20
-Joe MacDonald.
:wq

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJzujQACgkQwFvcllog0XyKxgCfeHyq/8C0QZl4hlMrHc7vUAJD
AXUAoLCmpVosHLOtLSRWJ9yma9EhZ1Rg
=DsmF
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
