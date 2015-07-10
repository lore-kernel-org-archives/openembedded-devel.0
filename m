Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 412996017E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 11:02:48 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so43239797wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pQnNiy4Y14YIP4dp3Uh9F2NYs0zHA4wkAKjuMQACaeg=;
	b=wMcAa2yPQYt1qOTY5ykP5V3N+sSiLewzdV6yxPI0r/rl5JCeB42TMQ/xa1p++IO30z
	qsoDfkh8+R45aLX1MbgcN2ffgEEBGslqN2xew8AxQQmHLwE9lViaoN1wlmxv+C/xQJUy
	gDb/PxqFDQGQD03T5VByGctOMUk73hvzYdzNgzb0Toy6MyQVysxIunJyYm+1bSv5B5/5
	OZG6pWZG80ePW8A3LTiaSvGpMDBAmkc2ukBaRDFvV+bBD/dSU252gKuDLAdOIl5sDFsH
	V2XyAgaFvuVDzud92jORggDCFwMlDAqBdAMtijx8sRsOndKhTYR002GTXExJSFtyou5w
	bEYQ==
X-Received: by 10.181.12.111 with SMTP id ep15mr5010798wid.15.1436526168262;
	Fri, 10 Jul 2015 04:02:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ck18sm13048077wjb.47.2015.07.10.04.02.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jul 2015 04:02:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Jul 2015 13:03:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150710110308.GA2397@jama>
References: <1435571855-62168-1-git-send-email-leimaohui@cn.fujitsu.com>
	<55911B4D.7090303@opendreambox.org> <20150629111252.GA2393@jama>
	<1B56A49860EB2D45ADE3731B15C959FDB2874D@G08CNEXMBPEKD01.g08.fujitsu.local>
	<20150630114022.GA2396@jama>
	<1B56A49860EB2D45ADE3731B15C959FDB2A386@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDB2A386@G08CNEXMBPEKD01.g08.fujitsu.local>
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
X-List-Received-Date: Fri, 10 Jul 2015 11:02:49 -0000
X-Groupsio-MsgNum: 56219
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2015 at 09:45:09AM +0000, Lei, Maohui wrote:
> Hi Martin
>=20
> > From last batch from fujitsu following recipes fail to build in world b=
uilds:
> > konkretcmpi, sblim-sfcb, cmpi-bindings, openwsman
>=20
> Except konkretcmpi, I can't reproduce the error of sblim-sfcb, cmpi-bindi=
ngs and openwsman.
>=20
> I want to know the difference between my build environment and yours.
>=20
> Would you mind show me your bblayers.conf and local.conf ?

See http://www.openembedded.org/wiki/Bitbake_World_Status_Setup

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of=
 Martin
> > Jansa
> > Sent: Tuesday, June 30, 2015 7:40 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH v2 0/9] add openlmi and it's depends
> >=20
> > On Tue, Jun 30, 2015 at 07:26:16AM +0000, Lei, Maohui wrote:
> > > Hi Martin, Andreas
> > >
> > >
> > > > > > Lei Maohui (9):
> > > > > >   openlmi: add new recipe openlmi
> > > > > >   cim-schema-exper: add new recipe for openlmi
> > > > > >   cmpi-bindings: add new recipe for openlmi
> > > > > >   konkretcmpi:add new recipe for openlmi
> > > > > >   sblim-sfcb: add new recipe for openlmi
> > > > > >   sblim-sfcCommon: add new recipe
> > > > > >   sblim-cmpi-devel: add new recipe
> > > > > >   cim-schema_2.40.0.bb: delete
> > > > > >   pywbem: add new recipe
> > > > >
> > > > > you should order your patches in a way that doesn't break git
> > > > > bisect, i.e. dependencies should come first.
> > >
> > > I got it. Thank you.
> > >
> > > >
> > > > I agree, I've tried to re-order them quickly when cherry-picking to=
 master-next.
> > >
> > > Thank you very much!
> >=20
> > From last batch from fujitsu following recipes fail to build in world b=
uilds:
> > konkretcmpi, sblim-sfcb, cmpi-bindings, openwsman, sysdig and libldb (s=
till pending
> > from samba patchset)
> >=20
> > build logs in:
> > http://errors.yoctoproject.org/Errors/Build/6836/
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWfpmoACgkQN1Ujt2V2gBxXhQCfQYjKwGd0cO7tZpdNctBFKJ2s
VhcAnA10QtZZMqjCaM5OVDjm7eLJ6+hS
=Hmcp
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
