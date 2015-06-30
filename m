Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id DF63B75C8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 11:40:11 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so7148522wgj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GpVYhPExHnVOki9yPM2JVyfXfa/nxIxrfUFtKDZuu5w=;
	b=ElJnV3ARl62gmhJ4BuS+9l5LpUcD9WUlaJenzAoWAWOuU8gG55CMcKRvwLYQZv/wex
	Bsk4CVyyMEC1rEJe4jmn19lkMk4AHiNoe/Q/LN8lxrcy+F/V8KKjdOsMLJ8wESoJRGkt
	sk50r3ChrPet1H53pzLDndtRDSnn8mSqTKYAZAR+vvIx53Q7tInaJSMg6N6vFBtNYJMd
	wBubyby0r6wYCcZpKgHqpLOoVeyTp4x2qlrtS/uB6mwC371GoiMiWY3gM0voACWUzWqR
	qIsT86VKWywd11L/2o2YrAfUsHK8KNrIaRAXKQMBK70ekl5DPRFVobTF3b3U6dBeUhec
	Tiaw==
X-Received: by 10.180.23.8 with SMTP id i8mr33385955wif.39.1435664412320;
	Tue, 30 Jun 2015 04:40:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id q3sm68599261wjr.38.2015.06.30.04.40.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jun 2015 04:40:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Jun 2015 13:40:22 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150630114022.GA2396@jama>
References: <1435571855-62168-1-git-send-email-leimaohui@cn.fujitsu.com>
	<55911B4D.7090303@opendreambox.org> <20150629111252.GA2393@jama>
	<1B56A49860EB2D45ADE3731B15C959FDB2874D@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDB2874D@G08CNEXMBPEKD01.g08.fujitsu.local>
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
X-List-Received-Date: Tue, 30 Jun 2015 11:40:12 -0000
X-Groupsio-MsgNum: 56085
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2015 at 07:26:16AM +0000, Lei, Maohui wrote:
> Hi Martin, Andreas
>=20
>=20
> > > > Lei Maohui (9):
> > > >   openlmi: add new recipe openlmi
> > > >   cim-schema-exper: add new recipe for openlmi
> > > >   cmpi-bindings: add new recipe for openlmi
> > > >   konkretcmpi:add new recipe for openlmi
> > > >   sblim-sfcb: add new recipe for openlmi
> > > >   sblim-sfcCommon: add new recipe
> > > >   sblim-cmpi-devel: add new recipe
> > > >   cim-schema_2.40.0.bb: delete
> > > >   pywbem: add new recipe
> > >
> > > you should order your patches in a way that doesn't break git bisect,
> > > i.e. dependencies should come first.
>=20
> I got it. Thank you.
>=20
> >=20
> > I agree, I've tried to re-order them quickly when cherry-picking to mas=
ter-next.
>=20
> Thank you very much!

=46rom last batch from fujitsu following recipes fail to build in world bui=
lds:
konkretcmpi, sblim-sfcb, cmpi-bindings, openwsman, sysdig
and libldb (still pending from samba patchset)

build logs in:
http://errors.yoctoproject.org/Errors/Build/6836/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWSgCUACgkQN1Ujt2V2gBzEfQCdEO+RyHV5wP50AhQdQI1trpkG
ySgAn0/vydHrmRJBNAcRu9/TObla3GjX
=bEWD
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
