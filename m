Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 57CE3772E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 18:02:54 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u63so3829794wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 10:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=h6KRMoDqpQ6gKy4UG8HkfA90E8WANL5zxdCIrJjC7NM=;
	b=GD2dh128Md2HqGc54KVmI72jUo4+T2bLOzJbdG7dkjkwssT1yWyMlN+S9btVM6An/n
	DVGFl1B3yGBD+8s8UX7DL91QPQ1gqnsbIbXInC15aof3BjZpHtWFZ0gmMaK4e1XP6ger
	zxi8iTB2kKB0qxYQMdNuhsdGnPm/scvbQ/nq1NLWHPxP7lZ4hYBDSvRkUlgqh0WKuGqY
	aOfbFomIBKroRaYJt0gCF38S6YuizBYlth/8G4Te2Z/4mlK73HG1A1PNniBKPeqmV8b9
	uuVvGtaaPH7+E6XcRphk35lV8OhaKa62+NDJ7iJkuZ/qSKZouIxpdAP0tmQUhAVvRU+5
	TcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=h6KRMoDqpQ6gKy4UG8HkfA90E8WANL5zxdCIrJjC7NM=;
	b=gGuwi1FmS2mLGqR5cq19jEzqRdv192b5hG850ZXzFRVv90IZgz/SqiCyD8+EViLV03
	Tqp/OPSQH5NUQPkyeb9fSFjyrXg1hQaA4Gu7+3cDcbywEoI07QeNXUojxaK+xp4w3cTm
	A5cR5EznRK83NhrwZFtUf364tcSIvPNQiybPc8qGQFTq3kX7/fmDfW44dMXq1QhwHTmk
	BzcPYxNF4s24pJ66+Pl6xdpegJ0JOt6/DuCVcmhtYPO2itibohWnioMtl2SfHcT1SYXa
	0xK5HM8vRjB1viBz7KncLefQ5AQr16iqaBSK4WBhfE+pe6mov2Rab1jPC6RDxr5w9iyN
	Iz3Q==
X-Gm-Message-State: AMke39mfmWnfpC271gBvE7nH1mLHNEsx7fizckrOGLrW9VeYuBelTrbrjJFS+qET8AejyQ==
X-Received: by 10.28.236.79 with SMTP id k76mr4895213wmh.79.1487354574550;
	Fri, 17 Feb 2017 10:02:54 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t30sm13777028wra.52.2017.02.17.10.02.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Feb 2017 10:02:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 17 Feb 2017 19:02:54 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170217180254.GA3276@jama>
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
	<CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Feb 2017 18:02:55 -0000
X-Groupsio-MsgNum: 65290
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2017 at 06:24:09PM +0100, Andreas M=FCller wrote:
> On Fri, Feb 17, 2017 at 6:07 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
> > The recent storm of breakage in meta-oe caused by recipe specific sysro=
ots
> > was quite dramatic:
> >
> > ross@flashheart ~/Yocto/meta-oe ((044e518...))
> > $ git grep PNBLACKLIST| wc -l
> > 320
> >
> > Is it time to talk about splitting meta-oe into smaller real repositori=
es
> > so they can be maintained at their own pace by more maintainers?
> >
> > Ross
> What exactly gets better by splitting?

I agree with Andreas.

1) RSS is good thing.

2) The breakage wasn't caused by lack of maintainers (at least I don't
   think that I or Joe were the bottleneck for integrating the fixes).

3) More maintainers doesn't mean more contributions from people actually
   using now broken components, it's actually easier to just send a fix
   than to be a maintainer of some layer just to be able to also merge
   your fix yourself.

4) It doesn't look so dramatic if it turns out that 200 of those
   blacklisted recipes weren't actually used by anyone still active in
   OE ecosystem.

5) If someone wants to replace me as meta-oe maintainer, go ahead, it
   stopped being fun for me long time ago, now it's just slightly annoying
   routine which takes my free time I would rather invest in something
   cooler

Regards,

> Splitting =3D Rotting to death due to unmanageable maintenance burden
> caused by oe? Don't misunderstand me recipe specific sysroot is
> basically a good thing. But I am tired of this game. As you can see in
> meta-qt5-extra: I am interested in having cool images not in a cool
> build system. Long live core-image-sato!
>=20
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKc6zAAKCRA3VSO3ZXaA
HGA4AJ4r8syey4gg46XRtp3+hS0H8/8qzACfaRxxYq/ApqI3itXodLkMjd5KDc0=
=rSfd
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
