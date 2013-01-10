Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtKnQ-0003qa-5f
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 17:16:01 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so436459pac.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 08:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Oakelzhp6kuvXnNucrRkJ/3SSNBE1sQsjz/d9Mf/noc=;
	b=tn8Ll09XQM5ie5soLAZ+Rrp0yv/mRUqdRDcZLIdRSjMxivkZY5FVwQ8IRYv0CWTV7m
	HxPLCDS3knQoWy0c8n69Oa0qqXTwdFTYnFB9zrzwCdAD0QnPaixl5hrNuUIUMyK/mmFK
	PU9RW/j7uy1vYfavoBRjf3fVPbQGAy9WmqE1i3Km4FE0IYZWo6ApLyIKZYCZggDgCkgg
	ZYPCtonwYBmsB5bJ+ev1PuhVhetH5+dPBTZY0ZCSGu83sDE3HR8bilBWDUmH5RVIe7aI
	9ynfSSW9KXv9jKZbuvhCJ7Q9eo6jE0mRW49w5DZtntoqXjk8iABRTS44K9SqfjSJMf+K
	qj+g==
X-Received: by 10.66.85.70 with SMTP id f6mr190200357paz.76.1357833645555;
	Thu, 10 Jan 2013 08:00:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gu5sm1019051pbc.10.2013.01.10.08.00.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 08:00:44 -0800 (PST)
Date: Thu, 10 Jan 2013 17:00:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110160050.GH3722@jama.palm1.palmone.com>
References: <CAGiJk9d25RWg6UB-wO5Eg3M80MWjBhu6Kk=pVKbMzAaS440WKg@mail.gmail.com>
	<20130110110535.GW3722@jama.palm1.palmone.com>
	<CAGiJk9c5L=T4eia+bJeZtvr_KDRgpZOCoYKAAgPLxBxqKGb8tA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9c5L=T4eia+bJeZtvr_KDRgpZOCoYKAAgPLxBxqKGb8tA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Disabling sstate cache generation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 16:16:02 -0000
X-Groupsio-MsgNum: 42646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kgh2FNDOY+603hGA"
Content-Disposition: inline

--Kgh2FNDOY+603hGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 03:52:32PM +0100, Samuel Stirtzel wrote:
> 2013/1/10 Martin Jansa <martin.jansa@gmail.com>:
> > On Thu, Jan 10, 2013 at 11:59:53AM +0100, Samuel Stirtzel wrote:
> >> Hi,
> >>
> >> what is the preferred way to disable sstate cache generation?
> >>
> >> In my use-case the build machine doesn't do incremental builds (e.g.
> >> it only does builds from scratch)
> >
> > http://patchwork.openembedded.org/patch/17039/
> >
>=20
> Thanks,
>=20
> this patch works good (saves ~20 minutes per build),
> may I ask why it was rejected back then?

Search oe-core ML archive.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Kgh2FNDOY+603hGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDu5bIACgkQN1Ujt2V2gBwOvwCfY+cpkWHASe6UE1uJfdqWzotf
rLUAn3qCvs5OsDiNOXZ4Q1oA/Oq4X+ix
=AQXv
-----END PGP SIGNATURE-----

--Kgh2FNDOY+603hGA--
