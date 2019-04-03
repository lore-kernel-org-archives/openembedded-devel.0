Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86CDD7CE5A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 12:03:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j9so20967805wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 05:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qb0Yt0mbVBJl24M/AUu43DDhKqHgGKC8aE5V1WJ5Es8=;
	b=QPmlp/O3KjQKsDAF0r2kSwLCP3UD9m4pgodnKsAgdmH1J1nZW/CXiYqId2WIumXod/
	5DqP+pThL1obgMYptoJ4vB2yHQyD2/vqIi2p0Dp2zKEsNuCkvL5vZc6geBzjypxveq3t
	R9l8vRjWWNdBKV4d+kCcHlk/FFeXy6kG6uwEYc8dBbecxGu21aI8CeEsXkcjTwFOdFBf
	Tu6ek9Gu0KfX1jDBYUKBry0NMT9gwgN6rX3DAS8uC32fPFc7cduAZuvdg145RPuapsFa
	IPcgU1K6eb+CoVbtOCXRnOSceddgmk6lIkcT/sxWu8vPZiefLFO/+eUrD8S257T7w/FN
	bMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qb0Yt0mbVBJl24M/AUu43DDhKqHgGKC8aE5V1WJ5Es8=;
	b=oC9M0pzxvV0L8ZuPpvRBApuG6qWTW9m0tnX6Vsjbxa3IS9C/0D9k4zfchzEVJH/JkR
	luRvvkYgeXGpV7CnjHYJNfJoNGPnIzhFIaVZbHsp9C3sTkFIDNPMdsih3dkMzSCpGjCa
	NdJNX2ApDaJUXzyYo7vvNkyZFX1kiKyETfZ55PIi9nNTHlZJeNIDXLPwlGfKasilpHGd
	/ZRRIY/6DmuKDsQSIVPlRtY4Ux9kEEnVHQ0AnRjV4PzPXTsVpX0TpyGOMyMZgApqEysV
	EdEFRefih8BhaVr3N4OY8HSDeoTgNVc8RLBm/lehkYOUFGwh6Yt/kxWjnAdfZiREhdWj
	4K2Q==
X-Gm-Message-State: APjAAAWw2KcEqXx3uqYylG4wKNepRby46Qjw9vQeyWRbMpvol88xQoAR
	UnpbOzwv6ek3nPy2xn+qB2Y=
X-Google-Smtp-Source: APXvYqwJsCegEC3LDSdiz1HixowWk0yIIFDIbFg/F6QOBWB6vNMOmhnER857fXOdubIYTP+1XZg9mg==
X-Received: by 2002:a5d:4907:: with SMTP id x7mr4271105wrq.133.1554292994223; 
	Wed, 03 Apr 2019 05:03:14 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	c20sm27372341wre.28.2019.04.03.05.03.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 05:03:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Apr 2019 14:03:14 +0200
To: Vincent Prince <vincent.prince.fr@gmail.com>
Message-ID: <20190403120314.GA2025@jama>
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<20190403085651.GA6467@localhost>
	<CAB2nKc9hnDrOTtKjNfk1cupK0yv8xXksEuvURJtS6ve_baOpJQ@mail.gmail.com>
	<20190403111514.GA20836@localhost>
	<CAB2nKc-nz+YhZ9voQOSo=46gLhLoip5_GT2arkmT6jOGiyEo8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAB2nKc-nz+YhZ9voQOSo=46gLhLoip5_GT2arkmT6jOGiyEo8w@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-devel@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 12:03:13 -0000
X-Groupsio-MsgNum: 76981
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2019 at 01:36:24PM +0200, Vincent Prince wrote:
> Adrien,
>=20
> What I'm not sure to understand is in which case we use "_git.bb" instead
> of having PV in filename.

The PV in filename is just another way for setting PV variable (instead
of setting it inside the recipe). This isn't relevant to what Adrian
requested and I would keep the filename as is.

> If we use a release version, shouldn't we point to
> https://github.com/zeromq/cppzmq/archive/v4.3.0.tar.gz?

Definitely don't use github archives, they are regenerated from time to
time with different checksums, either you can use developer uploaded
tarballs (some projects on github provides them as well) or use git
fetcher with the SRCREV pointing the the tag.

> And if we use git version, shouldn't we specify git commit hash to remove
> any ambiguity between PV and SRCREV?

With git bitbake fetcher (git:// in SRC_URI) you always need to specify
SRCREV, because that's the only thing which defines what "version" of
the source will be fetched.

PV in this case is only to give this SRCREV some human readable (and
sortable) versioning scheme. And that's what users will see when
installing/upgrading the built packages, so it's important to set it
correctly.

+git${SRCPV} in PV is usually used to signify that the SRCREV points to
commit a bit newer than the "base version" in this case 4.3.1 and in
this case this +git${SRCPV} is unnecessary if the SRCREV matches exactly
with 4.3.1 tag.

> Do you know any convention is specified somewhere?

I don't think it's spelled anywhere in wiki.

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXKShAQAKCRA3VSO3ZXaA
HJzIAJ0WFengH9e1AXTdimnE8iks9P7k/gCguQegDM0bQ1BMtgt6wN2zs1k8BVc=
=HnqZ
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
