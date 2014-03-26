Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id B63E06F8CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 19:15:29 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2070414eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 12:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Dozwn5hWosaHVl0zE7afaq4ygt9K0ZfJZHrAQumE/d0=;
	b=kucgi0uWQFCxQHgPCw5IeUdtED09kftPUIqGocm2DLTCIlcjBKmVYAKp48qy8OtAq5
	uePHoQBJxq4Q1mfoJlYxGQ9ySxAzBVM77YmrPgu6G6yc794vVRedRAx3Th/t9wWJ8MZ0
	HGzjijAwicPvy7b9ekl/cXzxBMEXQrtSrOYxVxdtuNxZw72ah8ebnO6HanrDeXaNyIeb
	tI9mHp9SRTBcXBNsKhDnNEIvD29fMbym8NL+U9bJqZMiIevaZFLXzHcFQ9RvY/Wekipp
	U2cPaoM/hJuI3hvcXSCrDERPTIKIF4j0cYxisa+2+4xqmTeKczD3mQRYBdB26HxVeQ1C
	xYlQ==
X-Received: by 10.15.73.134 with SMTP id h6mr58209185eey.3.1395861329707;
	Wed, 26 Mar 2014 12:15:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm48994732eeg.4.2014.03.26.12.15.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 12:15:27 -0700 (PDT)
Date: Wed, 26 Mar 2014 20:15:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140326191527.GH3709@jama>
References: <CAFeBWL73bvbfgZdNxHJshfLcGrQ647diP24Oy-vHjkCFX6XG+w@mail.gmail.com>
	<20140326182821.GG3709@jama>
	<CAFeBWL69O+4K4sP6jX1uFhPJ+K78Lh1DQLjwZrixRKK-wrYVRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL69O+4K4sP6jX1uFhPJ+K78Lh1DQLjwZrixRKK-wrYVRQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: Warnings during build
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
X-List-Received-Date: Wed, 26 Mar 2014 19:15:30 -0000
X-Groupsio-MsgNum: 48841
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzX0AQGjRQPusK/O"
Content-Disposition: inline

--NzX0AQGjRQPusK/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 11:41:43AM -0700, Adam Lee wrote:
> I see! I trust bitbake to link against the right one (newer one that is).

bitbake doesn't know which one is right, that's why there is the warning

so

bitbake gtk something-which-links-with-im-ipa.so

and

bitbake gtk3 something-which-links-with-im-ipa.so

will give you different packages (well the same package but with
different runtime dependency).

> Thanks for ur response JaMa.
>=20
> Adam
>=20
>=20
> On Wed, Mar 26, 2014 at 11:28 AM, Martin Jansa <martin.jansa@gmail.com>wr=
ote:
>=20
> > On Wed, Mar 26, 2014 at 11:12:28AM -0700, Adam Lee wrote:
> > > Hope I am not spamming the list with pesky questions.
> > > I am getting build warnings similar to below:
> > >
> > > WARNING: gtk-immodule-ipa-2.24.22 was registered as shlib provider for
> > > im-ipa.so, changing it to gtk3-immodule-ipa-3.10.7 because it was bui=
lt
> > > later
> > >
> > >
> > > The full list of warnings can be found at - http://pastebin.com/quqwC=
PEq
> > .
> > >
> > > I am not sure what these warnings are. They are definitely new in 1.6=
=2E I
> > am
> > > trying to figure out if there is something I can do, or if this will =
be
> > > sorted out as we get closer to the 1.6 release date.
> >
> > See
> > http://comments.gmane.org/gmane.comp.handhelds.openembedded/62213
> >
> > as long as nothing tries to link against im-ipa.so it's safe and you
> > should just list them in PRIVATE_LIBS.
> >
> > The warning means that if something links with im-ipa.so then it's not
> > known if it will get runtime dependency on gtk-immodule-ipa-2.24.22 or
> > gtk3-immodule-ipa-3.10.7 (it will always be the one built later in the
> > same sysroot).
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NzX0AQGjRQPusK/O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMzJ08ACgkQN1Ujt2V2gBxKTQCbBvynaLJ4x4/yPguVKm/nkYYT
sAsAn3HcMjym+7k7LRkcqNXyj8cghvP6
=4D1t
-----END PGP SIGNATURE-----

--NzX0AQGjRQPusK/O--
