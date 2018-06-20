Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 43F4C75318
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 18:06:17 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w7-v6so434185wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 11:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YRmLtiu3ci7MDLo6ZWKK4WMlbfGrFzuA06jbe5AKK8M=;
	b=I8zV8V0xzImAi30lQZGZrSgtpKdPN80VLnSGbjLUt8kt6AjiWATkujUgFfBi24l8uU
	nMlMcndlswRU7QitXPN78zYq8dgUP6DmDLWKDfhOmtmh2OIGnbWANKJk3v4pNsGQt19A
	n1GBasZKNBZNxbXFwBZYQV6TXEqgU9/qltyTFAfpHd/BruAr2Fzob7Cc4jWMBsLXmf11
	XzbWjs7/zK9+q4QzXbhD4l9DbH3NhwIaMun6nKh9NZfKbBVFgKHMm1HF7DZ80lIkBqMM
	wuc/noVzDSNA1402vsOWgiGoRAhw4KsEcZL9wuWMozuI2ybygf7Tgg44/XbGgsvHES3r
	/jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YRmLtiu3ci7MDLo6ZWKK4WMlbfGrFzuA06jbe5AKK8M=;
	b=BOhyFulgLehHyMx5WfxiPgoDQYSpvK7VUgkMC6Jqa3GFyaKMrvX4fqnJMp2HS2Urj+
	vNs/XttGmnSsr1Ew8nUl/iG1F9W7XmN19Z2R1VoGieUzOWBiSLyYC4m0m0YEHbTO1IK5
	9WMV78bCHxNtAqM4IMGEFbwHRPkf4KSLQpc0i3ycxMhJ9p5kVqQTpePghn4XpkRk763q
	wxciZBntDeSjzau+iBkNlmCgrCs/9AleGPBaYE53uHejus0yLnuZ2SxQ9LM4S5VEVLoC
	IYndtmtDznb9xn3cVUZLbMQNP0Aax9i4C8OdFiHzOhP4HdCiVNXAVc5lOgsFrEjJHCIO
	Pxqg==
X-Gm-Message-State: APt69E1P8pkC1WFlpEdWGu9WmUUoqNn8SqGTjUvQOslbsrphvcaJc2NR
	+KDu35TxWSPPqCIoj7euPPQ9Vw==
X-Google-Smtp-Source: ADUXVKIsuPICKxjQkbJMbkeY6d3dNKO16LFFoxlCHoOD4m1IHvWg7w9PXuPD33XemDckj4X7p+wZsw==
X-Received: by 2002:adf:dfc2:: with SMTP id
	q2-v6mr18351930wrn.113.1529517977854; 
	Wed, 20 Jun 2018 11:06:17 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n56-v6sm7228552wrn.72.2018.06.20.11.06.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Jun 2018 11:06:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Jun 2018 20:06:20 +0200
To: Daniel Mack <daniel@zonque.org>
Message-ID: <20180620180620.GC3257@jama>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
	<CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
	<d2df5115-8f79-fb79-e761-919fed4cd50f@zonque.org>
	<20180620112953.GA3257@jama>
	<67f7d601-e2e7-63c8-ac49-2cf27345853d@zonque.org>
MIME-Version: 1.0
In-Reply-To: <67f7d601-e2e7-63c8-ac49-2cf27345853d@zonque.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Wed, 20 Jun 2018 18:06:17 -0000
X-Groupsio-MsgNum: 72964
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 03:52:19PM +0200, Daniel Mack wrote:
> On Wednesday, June 20, 2018 01:29 PM, Martin Jansa wrote:
> > On Wed, Jun 20, 2018 at 12:50:52PM +0200, Daniel Mack wrote:
> >> On Wednesday, June 20, 2018 12:36 PM, Martin Jansa wrote:
> >>> It's already in meta-qt5/master with couple fixes on top of that.
> >>
> >> Ah, sorry. For some reason, I only looked into the -next branches.
> >=20
> > Well, meta-qt5/master-next is exactly the same as meta-qt5/master :).
> >=20
> >> Stupid. FWIW, I have a patch for 5.11.1 ready. Will send once the build
> >> succeeded.
> >=20
> > I've started rebasing the patches in meta-qt5 as well, but we cannot use
> > 5.11.1 until downmerge to 5.11 is finished, because:
> >=20
> > 1) we cannot use 5.11.1 branch, because they might delete this branch at
> > any time (like with 5.10.1)
>=20
> But there's also a v5.11.1 tag, which is unlikely to be deleted?

This is true. But not good enough for bitbake fetcher.

> I might miss something and I haven't followed the discussions, but is=20
> your idea to drop the explicit SRCREVs in the recipes in favor of=20
> AUTOREV and a branch name?

Definitely not.

bitbake fetcher checks out the defined SRCREV, but also checks that the
revision exists in the branch specified in branch parameter ("master" is
the default when the parameter is missing), if the revision exists, but
isn't in the specified branch then an error is shown (which happens when
upstream deletes the branch e.g. 5.10.1 branch and the revision of v5.10.1
tag which is used in SRCREV exists currently only in 5.11 and dev
branches.

qtbase $ git branch -a --contains v5.10.1 | grep origin
  remotes/origin/5.11
  remotes/origin/5.11.0
  remotes/origin/5.11.1
  remotes/origin/dev
  remotes/origin/wip/qbs2
  remotes/origin/wip/webassembly

There is fix for meta-qt5/sumo which is using 5.10.1:
https://patchwork.openembedded.org/patch/151543/
but that's quite unfortunate to use 5.11 branch from 5.10.1 recipes..

That's why I was waiting with 5.9.6 upgrade until it was downmerged to
5.9 branch:
qtbase $ git branch -a --contains v5.9.6 | grep origin
  remotes/origin/5.9
  remotes/origin/5.9.6

and now I wait for the same with v5.11.1
qtbase $ git branch -a --contains v5.11.1 | grep origin
  remotes/origin/5.11.1

AUTOREV is just for people who want to track latest revision in given
branch (e.g. in CI builds).

It's not acceptable to use AUTOREV by default in public layers, because
that would break the build every other day without any change in the
metadata so it would be a mess to use such layer. But in some layers we
were providing .inc files for easy switch between well-tested SRCREVs
and bleeding edge AUTOREV e.g. for developers.

> FWIW, I've written a small shell script that retrieves the SHA1 for each=
=20
> of the qt projects and updates the .bb files automatically. That seems=20
> to work quite well, and I'm happy to share it. There's still the problem=
=20
> with downstream patches and other necessary changes in the recipes for=20
> new Qt versions, but that's an issue either way.

I have some scripts as well, SRCREV is the easy part, updating the
patches in meta-qt5 and corresponding branches/tags on meta-qt5/qt*
repos is the tricky part, because only small part of it can be
automated - that's probably why I'm the only one who updates them when I
find the time :).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWyqXnAAKCRA3VSO3ZXaA
HN42AJ9RAmSGDnn4e6ix1cWiAsJ/70r27QCgoEL3sWBIIdkRYCu7hiANqCsnoKw=
=GaFv
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
