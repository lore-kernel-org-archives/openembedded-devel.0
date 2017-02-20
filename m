Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5876971C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 11:18:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so13774290wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 03:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cKuMgaGZS/mYIB/FQ7cltEQVYeq8mpzm9DgDB3+W+Xo=;
	b=j5XPPF4Cy9PDwplEQYwjqNQodRpfUAL7vhBnGdcxqT8rm99c4CSkJcgNzrlJbmFs8l
	u7OTNXWUYbeHNx9Yy+jG0CQ6py9vIyjeqbEwXT40+jKm3KJruD7JussEv0pGnA6SVvUl
	uXMDHqFwnO3OQL07uB06VKRKIZXcyRTCVlJEsD5NijdUwN7Peis41x/qjwYjcjQT+M+U
	/Fn6KQxBKHtg60bIMfQ0An7ZYVWINtpMpDp6/rrBKTknvKONaRN52U+oZ8lVR39FGQP9
	npoB6BlWMMJMdMw4U8W6/0oN12s/AyTVdoMSHc29T0JNlV+v6ZR7QAw8GMTRGq0CUb4j
	fjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cKuMgaGZS/mYIB/FQ7cltEQVYeq8mpzm9DgDB3+W+Xo=;
	b=Qp0EHxkJVqC92JbB2COULdEgq+T3s9l9TC+N2eh0kx8PiPJiovLWyEaNYGc1Kuh3sI
	9gEowLiAcOQSxvILR7vO7r9J77vzjKu+tx+9+BANf9oWwH8ShStz0XBvUc//JyiCWkXz
	DR+ias5AsbYQsn6Qj9CabvoZeFmQGCddp58Nbi+LeeeLmLMOcBLko70Ror8t6QZ9yz40
	lMtlxBB1508mD1tv3HnCqysltOmoDtTtbNlHu6lUFxdbURaM0qZDQz1mf5vmulh1s/YR
	CkGVTHi7pznJMpTWH3SKK5HZUbt2lfqA59Wt2KMNC2/8mofAmwqSUtjk9fRGeYtsDhZo
	87Wg==
X-Gm-Message-State: AMke39nPrujVPyVID87nfL/2x/1gix6lP8bTbYxD8ZDyUyCblOg2igkAWuJYes5RDWtTxA==
X-Received: by 10.28.6.210 with SMTP id 201mr19098196wmg.85.1487589509834;
	Mon, 20 Feb 2017 03:18:29 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 36sm24350299wrz.8.2017.02.20.03.18.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Feb 2017 03:18:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Feb 2017 12:18:29 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170220111829.GA3266@jama>
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
	<CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
	<20170217180254.GA3276@jama> <20170217182816.GD8436@mentor.com>
	<3870658c-01ec-252b-9940-a6af3fb1f529@balister.org>
	<1487561463.17001.28.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1487561463.17001.28.camel@linuxfoundation.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Mon, 20 Feb 2017 11:18:31 -0000
X-Groupsio-MsgNum: 65333
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2017 at 07:31:03PM -0800, Richard Purdie wrote:
> On Fri, 2017-02-17 at 14:45 -0500, Philip Balister wrote:
> > And I'm with these gyus. Splitting the git repository doesn't solve
> > any underlying problems. The real problem from my point of view is
> > very few of use are actually paid to maintain the layers we maintain.
> >=20
> > Employers want to pay things they profit from, and that is not paying
> > someone to maintain "core infrastructure".
> >=20
> > Layer maintainers interests change over time, and you burn out
> > supporting people who get to do all the cool stuff with the layers
> > you maintain. In the end, you get all the crap and non of the glory.
> > Within this list, most people appreciate your work. Outside the
> > community, people completely underestimate the amount of work
> > required to keep the ecosystem running.
> >=20
> > Yeah, add my name to the list of cranky people.
>=20
> I do think this is a valid question that Ross asks and that whilst the
> first quick reaction is "no", its worth thinking about the pros/cons.
>=20
> The pros to me would be about better test time on patches and in theory
> more specialist knowledge. This isn't to say Martin/Joe don't do a bad
> job but the size of meta-oe does mean there are limits.

If I continue to do the same "bitbake world" builds to test as many
layers as possible, then the test time will be exactly the same even if
we split meta-oe repository into 10 smaller repositories, probably a bit
longer for fetching all those small repos.

> The cons are more around finding suitable layer maintainers, which as
> we all know are hard to find.
>=20
> I'd probably suggest that:
>=20
> a) We need to encourage/empower more people to maintain layers

I think we lack people willing to contribute patches for recipes they
use, not people willing to merge them into corresponding repository.

> b) Having better infrastructure, tools and processes that help a) would
> =A0 =A0therefore be desirable.
> c) We need to be willing to separate out pieces for people to maintain
> =A0 =A0in such layers. It might not always work out but we should be=A0
> =A0 =A0willing to try.
>=20
> As for the comments about core changes, I really do try hard not to
> make them in many ways. The ones we do make, I'd hope are for the right
> reasons.

Yes everybody agreed that RSS is good change and worth breaking unused
recipes.

> No easy answers but don't shoot Ross for asking what I think is a
> reasonable question.

I wasn't trying to shoot him, but I still don't see how more
repositories solve the issue of unused recipes and lack of people
contributing to fix those still in use somewhere.

And I still think it's easier to send a patch to fix something instead
of volunteering to be maintainer of the layer with the one recipe you're
interested in fixing to merge your fix yourself.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKrQhAAKCRA3VSO3ZXaA
HNNuAJ0aRjwrDLKxlKMuuoZUY6Ea6a44bACdFOeHze7DHTbx6xcS/stnMNckngA=
=mDk5
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
