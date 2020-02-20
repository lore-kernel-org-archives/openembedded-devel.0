Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 29E6F61604
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:38:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n10so5187051wrm.1
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MAmPAxryZ/ngRePlG8AFX7MhQEHvFO93GtRklZkErA8=;
	b=ISqlQJwgBaa1kJJ7MsXCN/HYNswfP+G1P9yijIXUCv/aS7Po6d4uLhONasIhnD9PZz
	EhtujbcPsjOaW4HD61gSpV8IxaNkJYIYUvO52xu8Oj6lAJea9IVtqJESasoJqYSpo23t
	ae5vopfptoUcxSoL9vVr+v7/5mTHu9dL6E7mlAUI+uhOXh0uVjrK4WQzM1siroGIxhlc
	M/nTEHwofrw7qBXjjh45cdbfdogHOPPrXuVqw0jwURSgIdiSSQq66rqmDUsNuRqieXS1
	fowhzaT3swyJ1vgjOKSDVNiF2jpG8725Uehj63VAIEXc1VDltdYO1+V0fgIF3qvDgqXp
	vkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MAmPAxryZ/ngRePlG8AFX7MhQEHvFO93GtRklZkErA8=;
	b=lkUPb6mmPOPftn5tn3+sQS6ZLFhxFxpsk8cItnvWI/NvQ76DW5CuWn78NU52mYVWsT
	6NXkpjahVw4F93oeH5a0fVCUkhu6L9WRy3FA5tWOo9jr7WPjnA7X0he1qWxrjPuy8Lat
	nfzWnSpLtCoQ84dV2q3YpOQjKeDt4K32q3ip4dc6c5/QUbt5Wf/+1o5RrlkWEjm4YCSg
	MfnsIyy2Z1vg/deMnvBTSg5xig7U9QQw9xwOBayrMS8X+f9NWrZvqqY0/U1h8zpUPzbA
	A23GuxJxxJqjJjjElv+CYnPvsLkqDShRiP5zuTrOoYHu92VEIuErF4Gwg6ria61qYy7B
	lkpw==
X-Gm-Message-State: APjAAAWTs7XYTjNS0tXBqk9J07oy9a02H63zXca13Cch9hcU6M7HK+o0
	ZQjPghIxDMpZHteIeLutlA8=
X-Google-Smtp-Source: APXvYqwQbhv0nyVmPxhnVUEDNa6NJzUT7J2Bh85dGMF0uaA6rJi6DW6LzyXQGXT4+D8Q9wswsQ1PYg==
X-Received: by 2002:adf:f182:: with SMTP id h2mr42325895wro.364.1582213081694; 
	Thu, 20 Feb 2020 07:38:01 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	a16sm4669001wrx.87.2020.02.20.07.38.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 07:38:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Feb 2020 16:37:58 +0100
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20200220153758.o25tn46hhewgmasd@jama>
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
	<20200220144848.msiyguq2bsmqokxc@jama>
	<20200220151620.GA30034@localhost>
MIME-Version: 1.0
In-Reply-To: <20200220151620.GA30034@localhost>
User-Agent: NeoMutt/20180716
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: S variable for svn fetcher Was: State of OE world - 2020-02-18
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
X-List-Received-Date: Thu, 20 Feb 2020 15:38:01 -0000
X-Groupsio-MsgNum: 82927
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsvld7cc2rlpm556"
Content-Disposition: inline

--tsvld7cc2rlpm556
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 05:16:20PM +0200, Adrian Bunk wrote:
> On Thu, Feb 20, 2020 at 03:48:48PM +0100, Martin Jansa wrote:
> >...
> > Any idea why these aren't shown in our build?
> >...
>=20
> What is your mirror configuration?
>=20
> Default configuration downloads the tarball from [1].

Maybe I'm missing your point, but these aren't fetch issues.

Even when bitbake fetches the tarball (with the svn repo), svn fetcher
will still do the actual checkout to WORKDIR, so it will fail the same
when fetching from upstream repo with svn or when using tarball.

Cheers,

--tsvld7cc2rlpm556
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXk6n1gAKCRA3VSO3ZXaA
HB0VAJwLMyphm7INFnX4p0bdnAA9yeM3OwCeNZJ4zicBE61FZgnHgsnW/v1EQwI=
=mQzL
-----END PGP SIGNATURE-----

--tsvld7cc2rlpm556--
