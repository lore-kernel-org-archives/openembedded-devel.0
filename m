Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E18C265C7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 10:44:39 +0000 (UTC)
Received: by wggz12 with SMTP id z12so15352618wgg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3JS8jh01XU20Nih7KkldZWECgDdoFYNwp+Ddsb01nvo=;
	b=UJUhWsYoMWZPwShHB/PSvWHawwKA8fuUQuvYCnYEF0bdFnrBI0waB1kMwUxRRbPpR9
	KSCoaPNCkafhSzV15vc31/c0ZS764fUqsT7XDhDg2j02ToHh+s/M049xa5wmv+xD+KTJ
	2eHBXAlsdEQRgRd9TVyeWbT3Gnw9I4aKcLC3u0Ffg08gHpoltZ9dqu/b2TGw6rp8Um8D
	3kA0MjbsJ7VMuP2XopNns6xDkuU6DZFEsZnzYmXlYO0677/f8fp35Q3BRxy2wGHfH1o3
	i7YQ4yOU9Uo5tY+T575S9CQbyBMk2sX3AxXY4vmvzck4+Hp+fawyPIw7YutKZPAf9HpQ
	shGw==
X-Received: by 10.194.5.37 with SMTP id p5mr17481194wjp.20.1425552279904;
	Thu, 05 Mar 2015 02:44:39 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a13sm9915081wjx.30.2015.03.05.02.44.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 02:44:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 11:44:43 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150305104443.GN2337@jama>
References: <1425487144-27730-1-git-send-email-javier.viguera@digi.com>
	<20150304213644.GB1017@saldanha.aker.com.br>
MIME-Version: 1.0
In-Reply-To: <20150304213644.GB1017@saldanha.aker.com.br>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] crda: move libgcrypt to DEPENDS
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
X-List-Received-Date: Thu, 05 Mar 2015 10:44:40 -0000
X-Groupsio-MsgNum: 54637
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="20XocjIeMTCm4X0r"
Content-Disposition: inline

--20XocjIeMTCm4X0r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2015 at 06:36:44PM -0300, Hugo Vasconcelos Saldanha wrote:
> Hi,
>=20
> On Wed, Mar 04, 2015 at 01:39:04PM -0300, Javier Viguera wrote:
> > crda has a build time dependence on libgcrypt, so move the dependence
> > from RDEPENDS to DEPENDS.
> >=20
> > Otherwise the build fails with:
> >=20
> > reglib.c:28:20: fatal error: gcrypt.h: No such file or directory
> >=20
> > Signed-off-by: Javier Viguera <javier.viguera@digi.com>
>=20
> I think you should move libnl to DEPENDS also. My bad. :(

I've moved libnl when cherry-picking to master-next.

>=20
>=20
> --=20
> 		Hugo
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--20XocjIeMTCm4X0r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4M5sACgkQN1Ujt2V2gBzQ9wCgr+8fzpaeXMlpneSwyzOaTSRm
SEEAnRprVXmSH99rSQ5wJs984PqBYs2w
=fwGN
-----END PGP SIGNATURE-----

--20XocjIeMTCm4X0r--
