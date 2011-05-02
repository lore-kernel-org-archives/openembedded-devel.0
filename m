Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QGrux-0003fC-Tq
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 14:08:00 +0200
Received: by ewy5 with SMTP id 5so1701683ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=3u63HNp1lqPyHkCfedWUN5OvZAQSA5EIuXhmkN9RvEQ=;
	b=dFHxBXkc+RtXNUmd9aIFETsitIdH84pOblwjplGmnivJAYWIuLc45M9JHUht6tYvZQ
	QwDYwYl4QGhZlOiJIXjTEUudorlo0GWoCA+k2DCtr9rzyAJKAYJhHrH+bsgtrdb1tA/N
	mI5MhgoWZQcLQYLIG6Yu/hTtG0d1k0SO9YIpI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nvpX6SR5Uhl2c3MKxYh1yHUQsZKTq780P6aIHcKax7sk2QfPZvQRzk/LhkIrzc91dI
	oU8mnLnMZSSkNQde4ICduSuKhMETXqGsLKzC7DoLAMALddCkhHefyHlgcq7LTLVWxVOK
	LXkpbVr79M/vYMxbAzEYP3HHfHOP6K33GpETs=
Received: by 10.14.49.210 with SMTP id x58mr3315229eeb.12.1304337919716;
	Mon, 02 May 2011 05:05:19 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id u16sm4100299eei.2.2011.05.02.05.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 05:05:18 -0700 (PDT)
Date: Mon, 2 May 2011 14:05:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110502120511.GC3275@jama.jama.net>
References: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
	<20110502105241.GA3275@jama.jama.net>
	<BANLkTinaUrDmaT02zL-H5KCPDVj9T6rm5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTinaUrDmaT02zL-H5KCPDVj9T6rm5A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: buildindex is always 0, using BB_GIT_CLONE_FOR_SRCREV = "1"
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
X-List-Received-Date: Mon, 02 May 2011 12:08:00 -0000
X-Groupsio-MsgNum: 31559
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline

--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2011 at 02:37:40PM +0300, Radoslav Kolev wrote:
> On Mon, May 2, 2011 at 1:52 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Mon, May 02, 2011 at 01:18:08PM +0300, Radoslav Kolev wrote:
> >> Hi,
> >>
> >> I'm trying to make a recipe which gets the newest revision from a git
> >> repository.
> >>
> >> Also to get upgradable packages on different build machines I have the
> >>
> >> BB_GIT_CLONE_FOR_SRCREV =3D "1"
> >
> > You need to set empty
> > BB_LOCALCOUNT_OVERRIDE =3D ""
> > with it.
>=20
> Thanks Martin! I unset the variable in local.conf and it's working as
> expected now. I am sure I tested doing this before too, but with no
> effect. I must have made a change after the last time I tried
> unsetting BB_LOCALCOUNT_OVERRIDE which made it work now, but I can't
> track this down.
>=20
> I'd say I find the description in the bitbake.conf comment a little confu=
sing:
>=20
> # For now disable autoincrement of revision counter in SRCPV, whoever
> wants it, should enable it in local.conf or distro config
> # Revision counter is incremented only locally (bad for multiple
> builders filling shared feeds), LOCALCOUNT can be used to maintain
> # counter globally in OE metadata (LOCALCOUNT value set in recipe).
> # Make sure you disable it, if you want always upgradable paths for
> git recipes without bumping LOCALCOUNT with every SRCREV change
> # or if you're using AUTOREV feature.
> BB_LOCALCOUNT_OVERRIDE =3D "1"
>=20
> My interpretation of this was obviously incorrect. From the first
> sentence "For now disable autoincrement ..." it implies that the
> current default value of "1" means that it (autoincrement) is
> disabled, so no change is needed. And from last sentence "Make sure

I think this part is right. Autoincrement is really disabled (you have
constant 0 as LOCALCOUNT before rev.

> you disable it," I understood 'it' as referring to the "autoincrement
> of revision counter in SRCPV", but it seems it's referring to the
> LOCALCOUNT_OVERRIDE. I think the last sentence will be more clear if
> changed to "Make sure you disable this override, if ..."

I agree on this one.


> Also, I thought the BB_LOCALCOUNT_OVERRIDE var was only concerned when
> keeping an incrementing counter in the local cache, and not when using
> BB_GIT_CLONE_FOR_SRCREV =3D "1".

Be aware that BB_GIT_CLONE_FOR_SRCREV also implies full git clone also
for recipes not in your dependency tree (because it will parse PV
variable with SRCPV even for recipe completely unrelated to your target
- unless you blacklist such recipe ie with angstrom blacklister).

> So to sum up my understanding now and see if it's correct:
>=20
> LOCALCOUNT_OVERRIDE actually does two things if unset - enable
> autoincrementing of revision counter (doesn't matter if it's coming
> from local counter stored in cache or the SCM system like git, svn,
> etc) and disable overriding the LOCALCOUNT value form withing reciper.

I'm not native english speaker, so I agree that comment could be
improved. Please send it as patch and hopefully others will comment on
it.


>=20
> Regards,
> Radoslav Kolev
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2+nfcACgkQN1Ujt2V2gBxJQQCfSnO+wDLSAkLtwAVIUeukMzoI
JAUAn2JD2uH5ccW4m8aFLNbxq3QBm8Pw
=tGPK
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
