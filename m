Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id B287760670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 11:12:46 +0000 (UTC)
Received: by wiar9 with SMTP id r9so375283wia.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 04:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=08MzKorlBhsQ/DB2j8U/8hpIF1QjK9nhVS3A7kYMIS8=;
	b=ksTx6cLb+qRcvKyOM0WTEEwWaGKPKUYsEd/6jP2apqCI8IqxFVKd5VILWfN7Nc+WFO
	AQ7MOFTsGqC50JnTZhcVwKol5cAfjYKLKocDzwNBaNqEeM24gffHKzeey9y/o/zNX1S1
	Z/gm00pao7A3hCJFYwUejFJHFG1i9QFukajApsdLOOdMKg24Hp7/8pjfA2uF+ybQPpQy
	mA0tKv0FzjEpT9DC5Cc5/JQwdYLjz1a7anBh8gelq3aLtDu/bYC6//TbJ8wYFeNELged
	jIpu6JrnbrXuYGYtu1VUqynZrPgrF21nbgwkYTSOgsOns1uvJOWz5VfKkIgEOLTxjKZu
	OBfQ==
X-Received: by 10.194.78.14 with SMTP id x14mr29173588wjw.48.1435576367187;
	Mon, 29 Jun 2015 04:12:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id fm8sm11608596wib.9.2015.06.29.04.12.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 04:12:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Jun 2015 13:12:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150629111252.GA2393@jama>
References: <1435571855-62168-1-git-send-email-leimaohui@cn.fujitsu.com>
	<55911B4D.7090303@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <55911B4D.7090303@opendreambox.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 0/9] add openlmi and it's depends
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
X-List-Received-Date: Mon, 29 Jun 2015 11:12:47 -0000
X-Groupsio-MsgNum: 56075
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2015 at 12:17:49PM +0200, Andreas Oberritter wrote:
> Hello Lei,
>=20
> On 29.06.2015 11:57, Lei Maohui wrote:
> > OpenLMI  =3D Open Linux Management Infrastructure.
> > OpenLMI is open-source project aiming to improve management of Linux sy=
stems using WBEM standards.
> >=20
> > Lei Maohui (9):
> >   openlmi: add new recipe openlmi
> >   cim-schema-exper: add new recipe for openlmi
> >   cmpi-bindings: add new recipe for openlmi
> >   konkretcmpi:add new recipe for openlmi
> >   sblim-sfcb: add new recipe for openlmi
> >   sblim-sfcCommon: add new recipe
> >   sblim-cmpi-devel: add new recipe
> >   cim-schema_2.40.0.bb: delete
> >   pywbem: add new recipe
>=20
> you should order your patches in a way that doesn't break git bisect,
> i.e. dependencies should come first.

I agree, I've tried to re-order them quickly when cherry-picking to
master-next.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWRKDMACgkQN1Ujt2V2gBzUYACeIYWqMTwruaGw5M3g4kkfH/UO
KcQAn1AsVFPRRHQn5j1eusBbieji6+ON
=tEa+
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
