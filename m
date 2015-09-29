Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 944C876710
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 11:21:50 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so145819944wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=K7qLKAMXG3N5RJuHH6Tmj+6tgHqb+Dc4R7TVTDG61VM=;
	b=xeRFSNhZloF9pAZ1WXyPH0UIpsCbQ1Wki+rQRGR8Jn7ATLEDHbMqi4MrvXRBvMZP6Q
	mXqqEHBIx0FEhZIOvfgbgUmZuGjAih36LNX3hsgc7BhNRC5hbR74DfZWAP+yf4YSi1e+
	MyauHlm7LKLrSIIt+iVb3FYX9MsBB5eStJCLl676fFpQnbsu6SbeN3xbRlSJ4W1VHHFV
	PeoGB3h9ccwbQC12ozTcuUXZRuRlmV3WMCDlOiCDIR9x4TCk83gMycLDbcrDXMYz8Afr
	KFWqIo1+J5X9uWs/B+/362fNDL7mzJN6BeBbxPclFqpFYaP0YegapMp6hMUxGmMdfrCM
	/hEw==
X-Received: by 10.194.60.115 with SMTP id g19mr27091837wjr.29.1443525710657;
	Tue, 29 Sep 2015 04:21:50 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hd7sm18119055wib.23.2015.09.29.04.21.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Sep 2015 04:21:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Sep 2015 13:22:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150929112225.GA2400@jama>
References: <1443440681-5009-1-git-send-email-adrian.ratiu@ni.com>
	<1443521722-15792-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1443521722-15792-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH v2] vim: provide the xxd tool (package vim-xxd)
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
X-List-Received-Date: Tue, 29 Sep 2015 11:21:52 -0000
X-Groupsio-MsgNum: 57565
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2015 at 01:15:22PM +0300, Ioan-Adrian Ratiu wrote:
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta-oe/recipes-support/vim/vim_7.4.481.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes=
-support/vim/vim_7.4.481.bb
> index 2ece53b..44e6571 100644
> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> @@ -76,11 +76,12 @@ do_install() {
> =20
>  PARALLEL_MAKEINST =3D ""
> =20
> -PACKAGES =3D+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vi=
mrc"
> +PACKAGES =3D+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vi=
mrc ${PN}-xxd"
>  FILES_${PN}-syntax =3D "${datadir}/${BPN}/${VIMDIR}/syntax"
>  FILES_${PN}-help =3D "${datadir}/${BPN}/${VIMDIR}/doc"
>  FILES_${PN}-tutor =3D "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN=
}tutor"
>  FILES_${PN}-vimrc =3D "${datadir}/${BPN}/vimrc"
> +FILES_${PN}-xxd =3D "${bindir}/xxd"

So it was already included in some other package (probably main vim
package)?

>  FILES_${PN}-data =3D "${datadir}/${BPN}"
>  FILES_${PN}-common =3D " \
>      ${datadir}/${BPN}/${VIMDIR}/*.vim \
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYKdHEACgkQN1Ujt2V2gBzMbQCdGs+bXDY8Ggdr1Mo3Ej0ljQps
qCIAnjldfnvgQkxF6+izs6jbQbILzHp4
=OjWs
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
