Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2896A35B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 09:23:11 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c1so1210382eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bqWKuu3Z6mLuYOG08DREVaan4Fa8FKDIjvYJB/fxnX4=;
	b=gn6ePKjnOBzwC7taOjSG+s8Rem8qZaTKAd36DaGWfPr0yKSad623M5uSpxtIoioj0K
	EU85mlvdL0yB+9AZXK/PgrweogwvwB2SEPnmioEQC8TBGWFkbl1FKtxPL3CNSkFpGnkd
	8PRWUWkd9Q6uB/nspcM4uhetPbuKA70PTpJ/Gdzb45geag4idPqxpEPA1WxFp57xcbR3
	/ZJ+440o9ZDcmW1zoFCFbXJ4/wqPA4XBFC5XQagf6fll7nHdFGHT5Xo0Q+zFteGBj5N1
	livBG0/MznB2EsOQqXCQnNb2jUpJIPyU/k/wObnwJMyj9tpckLnN6JTriduzt7QL81eD
	Zbew==
X-Received: by 10.14.193.198 with SMTP id k46mr894827een.128.1383211393531;
	Thu, 31 Oct 2013 02:23:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b42sm6099737eem.9.2013.10.31.02.23.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 02:23:12 -0700 (PDT)
Date: Thu, 31 Oct 2013 10:23:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Zongchun YU <b40527@freescale.com>, Joe MacDonald <joe@deserted.net>
Message-ID: <20131031092314.GF32015@jama>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
	<20131031081012.GC32015@jama> <006201ced618$dc97d420$95c77c60$@com>
MIME-Version: 1.0
In-Reply-To: <006201ced618$dc97d420$95c77c60$@com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: 'Zongchun Yu' <Zongchun.Yu@freescale.com>,
	openembedded-devel@lists.openembedded.org, b44149@freescale.com
Subject: Re: [meta-oe][PATCH v2] tcpreplay:add recipe
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
X-List-Received-Date: Thu, 31 Oct 2013 09:23:13 -0000
X-Groupsio-MsgNum: 46955
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Content-Disposition: inline

--K/NRh952CO+2tg14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 05:09:07PM +0800, Zongchun YU wrote:
> Hi Martin.
>=20
> Thanks for your kind comments. I see tcpdump in meta-oe layer too. tcprep=
lay
> may use packages captured by tcpdump.
> putting them in the same layer maybe better. Wish your suggestion?
>=20
> Best Regards
> Zongchun

+Joe

tcpdump is used only in one meta-oe recipe, were it can be dropped or
replaced with PACKAGECONFIG

meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:    tcpdump

And then we can move tcpdump to meta-networking and add tcpreplay there.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K/NRh952CO+2tg14
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJyIYIACgkQN1Ujt2V2gBxt4gCgrnLQkkO6xUn94hxkFBSxGHMY
/lkAnA2oPLIbYd+OV7ebtu33G0jG0jHm
=ghox
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--
