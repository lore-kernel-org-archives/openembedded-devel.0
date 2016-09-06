Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 96A5477040
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 21:06:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w12so11099073wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 14:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UB7duUe6Wd1oJi8DOhv4CoLTBL02dtiQ4kyN2TXqoQ4=;
	b=FXAcO8V/tXC4ZUpgp61SXKzt67RyAOhMRqhYksBcntvtlk+wUEuc52QDhEuLCb93BL
	YQ/8hhdVrpysw4sZs8I6p9FE8d/abD/G6nMGomnWjekeNifO55hzDLAQFQihbdCGp5Ky
	BnxSatp1/Dks+5KBTTGo+k75pOTXz46p/tk83/3Ot7vh3V+wst7wCJ3rXS63d6nhDf8d
	wHeOLLyTE7ebbWE/OFvbH0ZmeLxr66IOOAFrIga+MrgmaXMwdvAPAdzti7mHNQzRrPdx
	FwI+65UNlYHUjonuPuCodjOb8MUifbP+W4IcTpRTD23r9QNOdEZCoX9A29YKcbgBaL5y
	tidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UB7duUe6Wd1oJi8DOhv4CoLTBL02dtiQ4kyN2TXqoQ4=;
	b=Fn2hb2Dps8iZpumuO9w2w9RaWmIurIgm3xeZO410rYfIu0s28S7aKK+PlXcDeXy+LG
	fxEZF9F3QGY9jHMPorDoil0CK8BfQ3/E8xPr5jwwwAesOdpKQktGrjwsJBYjWyBYHyzh
	/xncCuHaDCc9zUbvYConTgz7iR5Z4EZuv+RGFBRKtaO39rZqqifiFT84SPCAT7tJILRD
	noc7FEo03pTelSTZB02pKsKg+ioJbW+LHB/Lj1xOD2Bg2JmIbGl7mufe8geu8MY9Hb7c
	oIiQY6+k7YuRl9//Zm5zWyj2VV1EDL70Gb+ACsheoGPMGS6/LAUwbtrBnfS8v13/G7eu
	wtFQ==
X-Gm-Message-State: AE9vXwOK9N5gvSHkP5Kez7x+ETNFtYUnJK9rW2nIjNrXeRyOqUTVW8APDRpsc6ZSuzHtnQ==
X-Received: by 10.194.178.102 with SMTP id cx6mr37574416wjc.58.1473195997371; 
	Tue, 06 Sep 2016 14:06:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id 123sm705299wmj.5.2016.09.06.14.06.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Sep 2016 14:06:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Sep 2016 23:06:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160906210636.GC2645@jama>
References: <20160906184155.23608-1-drew_moseley@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20160906184155.23608-1-drew_moseley@mentor.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-oe][PATCH] xpext: Allow the main package to be empty.
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
X-List-Received-Date: Tue, 06 Sep 2016 21:06:39 -0000
X-Groupsio-MsgNum: 62987
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline

--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 02:41:55PM -0400, Drew Moseley wrote:
> If xpext is included in a build (ie via dependency on mpv) then
> builds of core-image-sato-sdk will fail with errors such as below.
>=20
> Allowing the package to be empty fixes this.
>=20
>      warning: Can't install mpv-dev-0.15.0-r0@i586: Can't install xpext-d=
ev-1.0+5-r0@i586: no package provides xpext =3D 1.0+5-r0

Isn't it better to disable this dependency from xpext-dev than to
install completely useless empty image into the image?

> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>  meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/re=
cipes-multimedia/xpext/xpext_1.0-5.bb
> index d65546d..84ec5be 100644
> --- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> +++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> @@ -15,3 +15,5 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  SRC_URI[md5sum] =3D "1b0cb67b6f2bd7c4abef17648b062896"
>  SRC_URI[sha256sum] =3D "a3b06f5188fd9effd0799ae31352b3cd65cb913b964e2c1a=
923ffa9d3c08abbe"
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> --=20
> 2.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfPL9sACgkQN1Ujt2V2gBx87ACfV4qgjTETE5TCb0vdsyzo4Zih
ONMAn0TrU16U1RrISVwu0YIuyXIlcZxB
=2nyt
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
