Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C49073193
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:10:32 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n205so4726147wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3zu7ZNdLxr5a3A73ycOm034r8cLXzVUvvEqq4y+Fbyk=;
	b=fP5uoKxUODEIvK9m74ogA8f6PMTEFymj7DrjQsAU9UhGq3MeSCLQZHzfiEJBvX7uur
	t3a/8yPOVQYF7RO7EMP5Eydshb48ihI15wwh8Yc9h/fvSDGKILJJ9lsljDkxnlAA9DxA
	wj2SD3GwheScKjvlbcZX2TJw+53motwo+BiuJwZH9BXZY5xU6fAl9qJPKxgLPs0KH1JN
	B5f61nbvozrP/rfahn+ebWUQEbSpIwdeqZma/NGYDfnBwqYPVNZly9G/jimH/5Ic/N7y
	f9DEUiXcLGCNN0eFIXsudobmrXcA7w+MO+GLGbdoeDyloOnbZ8c1MjiscO3V3hwFxTg+
	RzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3zu7ZNdLxr5a3A73ycOm034r8cLXzVUvvEqq4y+Fbyk=;
	b=OZJPRqyqp4Z6W/fjR5Wv/DiKXTSsSFIz0tvifgi/p+RdoH4wRchLv9sTbbRe58fn+e
	KnFsZzA/aAdUctciwpCz02mWzuNF0z2EU0CvlCi3c1DnHgl2fRAZ90KWzUvSpyqQzRix
	BrWUv72ajJ7leONp6xH0YsUGe1oWZzF3guAthYN2VtxitCmY1/f60ij9D1yQVU0Zjmou
	TqDE1BszWvWPHQN29g0S01oVk5oqozy10Db3Gz/vfVaEbWSHT3iPpKQpiZ7deIccPe7U
	oI48eyY/0qdLkWEACdT7+TrZMRlx3CMXHJGqVnrUZ+04spmSFIHkKecq+cL5/vRVrEj1
	9+lg==
X-Gm-Message-State: AD7BkJJ7uwKMO5xEBr/jxmKv8sdfSF2HpXhfBx9JhQ/k23z1Fu10RQWl+mr2eLrpK/eiDA==
X-Received: by 10.28.212.85 with SMTP id l82mr4994108wmg.82.1457626233027;
	Thu, 10 Mar 2016 08:10:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 63sm4242413wms.1.2016.03.10.08.10.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 08:10:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 17:13:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160310161330.GJ2573@jama>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
	<41b4e4a82cb652470eebe853bd1b6076cee59301.1457535831.git.alexander.kanavin@linux.intel.com>
	<20160310142507.GI2573@jama>
	<CAJTo0LbHXD_C+Nm6bjV=xc6MRtMJ=Ry=_Q4YG-ihyWiWHaQ5UA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbHXD_C+Nm6bjV=xc6MRtMJ=Ry=_Q4YG-ihyWiWHaQ5UA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 14/38] python-gst: remove the 0.10 recipe
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
X-List-Received-Date: Thu, 10 Mar 2016 16:10:33 -0000
X-Groupsio-MsgNum: 60475
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4IYkFBVPN84tP7K"
Content-Disposition: inline

--T4IYkFBVPN84tP7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 04:02:43PM +0000, Burton, Ross wrote:
> On 10 March 2016 at 14:25, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > This wont make freesmartphone people happly (if there still are some)
> >
>=20
> Is anyone actually using this software?  Obviously one solution here is to
> move pygobject to meta-gnome or something.  Another would be to nuke
> meta-smartphone from orbit.

Fortunately this python-gst dependency was only from RRECOMMENDS, I've
already removed it from RRECOMMENDS.

I still build images for om-gta04
http://projects.goldelico.com/p/gta04-main/
=66rom time to time, but don't use them in real life anymore (not sure how
many other people do) - the same with om-gta02, nokia900. Other
meta-smartphone BSPs are used more actively in LuneOS, so no nukes on
my meta-smartphone please.

Thanks,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T4IYkFBVPN84tP7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhnSgACgkQN1Ujt2V2gBxAYACdGeZLlrjB4WP0OrZoRtlopR0q
HssAniFJ2ICwb9g2qRhTte4W1qC1/C4t
=xxQo
-----END PGP SIGNATURE-----

--T4IYkFBVPN84tP7K--
