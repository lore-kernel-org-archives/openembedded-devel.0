Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4B01160686
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:53:33 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so2034807eak.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 00:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W4NGMYUB/0zfSWf84amTO3ZPzxbaIYqAhVZLaCQTtBY=;
	b=TbtM5TC3GYx9RHXtW0lnKZ1tDtgafQUC+QTO1jG8BsJc0j/awxXk1bwXsQSObNJ2JA
	obj2LGbqqIm3hfoHek7xuv0FRIaCglrFSMyYqdwznCGZeLblODmuzpp+NcLqJjD9RqRh
	BVswNJeWH6o3dDV97p3O+uIkS5SyZ4rQMC2/9/Dzv4KlAQW2ZRq2FAh9jVtyss7b3Ly8
	W5NFNP3edapk9RRQbfL9pKvAWvI6pytkXd1Bl6c5NQcpIZhGtDyoqy1pJTFkRpynh6yP
	Bq9dsfNFV0IEQDkRM8+JOBPqSstcr1I3ecv8naZaIZBlzN8kemz1xahh5aWd3QCWJEuY
	Biuw==
X-Received: by 10.15.43.13 with SMTP id w13mr32213765eev.37.1377590013711;
	Tue, 27 Aug 2013 00:53:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm27031090eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 00:53:33 -0700 (PDT)
Date: Tue, 27 Aug 2013 09:54:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130827075443.GW3544@jama>
References: <521C514F.1000405@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <521C514F.1000405@pseudoterminal.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: How can I make recipes conditionally enabled?
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
X-List-Received-Date: Tue, 27 Aug 2013 07:53:33 -0000
X-Groupsio-MsgNum: 45866
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lQcP9vuZCkvmDKre"
Content-Disposition: inline

--lQcP9vuZCkvmDKre
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 09:12:15AM +0200, Carlos Rafael Giani wrote:
> Hello,
>=20
> I have a question about a problem I've had several times in the past:
>=20
> if I write a layer, and add .bbappends, then the layers with the=20
> corresponding .bb files become hard dependencies.
> But lets say I want to write a BSP layer, and I add some machine=20
> specific Qt5 patches. Now everybody who wants to use
> my layer must also include meta-qt5, even when they don't really want to=
=20
> use Qt5 anywhere. This is made even worse
> if I have a dependency on meta-oe, which itself brings in a lot of=20
> modifications.
>=20
> In short, I'd like to be able to make .bbappends and .bb files dependend=
=20
> on whether or not a layer is available. The hard
> dependency is fine if it concerns things that are essential in my layer.=
=20
> But if its about optional things, it shouldn't cause
> a build failure.

BB_DANGLINGAPPENDS_WARNONLY is the magic word.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lQcP9vuZCkvmDKre
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIcW0MACgkQN1Ujt2V2gBxBTwCdH2q8EytBo8YiIIuO+RtCL7lu
7pIAnjLC9rV15mMnni+EYAhXlTFZkimC
=FaML
-----END PGP SIGNATURE-----

--lQcP9vuZCkvmDKre--
