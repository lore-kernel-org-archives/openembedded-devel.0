Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 87F1F7293D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 16:30:27 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id p10so9997465wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 08:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m0+LVBFYAii8HCnACSMw9wbP6vlJw1UcmQSs73NBsUw=;
	b=n0OmkH1lpsf5FI/tbe1FFcVxEmv/vm2derBkDCFX4JPVAbVfYMaQJ4GWEUAGUiQAI7
	SJP8rcccdt2vT8kaSWRDqq0fwBVqgRpn9lIByLiSIG4Le3B3e+IgdXIFXuExs8FPmGGd
	+Vg13EBqdLOjvx+cV50tWOMRcpZkH6ai59odsDSW/AmXiLcFfQf+pmwXV9xFpt++Daiy
	qWRPJJgvGeDqGWVC7jkTrt1xSjVkxrPG62J5kVSnzvvGB0kGj6FL8GWdQdX07N09x2RK
	ccc0jyxUb9lCuc989makVtF7dbMsNZpdv1Uf31u5RWfZsm73d4+1/2xwgVwhlHO1b7Z0
	YOPA==
X-Received: by 10.194.185.243 with SMTP id
	ff19mr187826478wjc.126.1420561826884; 
	Tue, 06 Jan 2015 08:30:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bj3sm14560591wib.3.2015.01.06.08.30.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 08:30:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 17:30:28 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150106163028.GA29986@jama>
References: <1420560067-8617-1-git-send-email-akuster808@gmail.com>
	<1420560067-8617-2-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1420560067-8617-2-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 2/2] libssh: fix krb5 rdepends issue
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
X-List-Received-Date: Tue, 06 Jan 2015 16:30:32 -0000
X-Groupsio-MsgNum: 53699
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 08:01:07AM -0800, Armin Kuster wrote:
> the default is to build with GSSAPI enable so we need
> krb5 support.

shouldn't it be in DEPENDS then? RDEPENDS could be too late for
do_configure to detect it.

Also I don't see 0.6.3 version in current master:
OE @ ~/meta-openembedded $ find . -name libssh\*
=2E/meta-oe/recipes-support/libssh2
=2E/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
=2E/meta-oe/recipes-support/libssh
=2E/meta-oe/recipes-support/libssh/libssh_git.bb

>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/libssh/libssh_0.6.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb b/meta-oe/rec=
ipes-support/libssh/libssh_0.6.3.bb
> index 771a47a..9c5ebf5 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
> @@ -27,3 +27,6 @@ do_configure_prepend () {
>  }
> =20
>  FILES_${PN}-dev +=3D "${libdir}/cmake"
> +
> +# This builds with GSSAPI enabled as default
> +RDEPENDS_${PN} =3D "krb5"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSsDaQACgkQN1Ujt2V2gBzGqgCgq0ziI/cH3StDhtWHfYXXqxUJ
b5gAoIZmnrfbcufrU5t4Haf2tVVbUt54
=rbJf
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
