Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPf0C-0003HF-Nj
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 22:18:51 +0200
Received: by mail-ee0-f45.google.com with SMTP id c50so2277637eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FnMNNOSvWc2A5+99HduupsYE5ekWKX5YMMU7TKn6uKo=;
	b=lEZ1VfOcGkJ0rrsREshzMthSHux4hDaCj16OuCZ4/cMQt1EumAjY7hNHFM9eMuO7zv
	YRSDCWAsmO+qH1GifXM2KjoYAM9tqVZKjMzYzXKqabXiKZgLs//xiQwmrTGwWLMlDbOA
	nL8Ijs2YgDBK8nZgldKrBE43h+wtLbZToANkOmH/dVjGpP6ooI74zILKegRogbilKEo9
	OBG38UbkpK6sENaTamaCAXh5mvECjsCsR8S1fKkgfDooNWAgudxIFnZFCsuF6nZO0tOC
	6NuACMtU5HMv4uucvy5wviBvGouSJoS7cyoBDvCNSPT4B1wsYaQDS+8hb+um137ulSWV
	UeIQ==
X-Received: by 10.14.179.5 with SMTP id g5mr63410858eem.41.1365537688253;
	Tue, 09 Apr 2013 13:01:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	cb50sm18173080eeb.14.2013.04.09.13.01.26
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 13:01:27 -0700 (PDT)
Date: Tue, 9 Apr 2013 22:01:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130409200127.GF2474@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama>
MIME-Version: 1.0
In-Reply-To: <20130305225907.GB14869@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: koen@dominion.thruhere.net, otavio@ossystems.com.br,
	enrico.scholz@sigma-chemnitz.de
Subject: meta-systemd future vote Was: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Tue, 09 Apr 2013 20:18:51 -0000
X-Groupsio-MsgNum: 44002
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Content-Disposition: inline

--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 11:59:07PM +0100, Martin Jansa wrote:
> On Tue, Mar 05, 2013 at 11:50:41PM +0100, Andreas M=FCller wrote:
> > On Tue, Mar 5, 2013 at 11:18 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > > On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >
> > > good old meta-systemd should now parse again,
> > Thanks - will come back to test HEADs soon.
>=20
> But be aware that I've fixed only parsing of avahi and wpa-supplicant.
>=20
> I haven't tested it properly in runtime because my upgrade path is a bit
> broken (because I was building images with khem's patches for a while to
> test other stuff) and even clean build with failed to boot with
> qemux86-64 and I don't have time to debug it now.
>=20
> > > I wont apply this 2 commits
> > > until systemd discussion in oe-core is finished and future of
> > > meta-systemd decided.
> > >
> > After systemd regression is worked around yocto 1.4 release regression
> > is knocking at the door...
>=20
> yes :/
>=20
> If we need to maintain meta-systemd bbappends for upgrade path we can
> also maintain them with PN-systemd packages and good old systemd bbclass.

Khem pinged me about this patch, so here are my thoughts:

PN-systemd discussion in oe-core haven't moved a bit since this patch
was proposed, I think we have 2-3 options, lets vote about meta-systemd fut=
ure.

1) keep PN-systemd separation in meta-systemd and fixup .bbappends to
resolve issues created by oe-core (I've fixed some issues, but still a
lot of issues in postinst/postrm/prerm scripts when both inits are
sharing the same PN)

2) give up on clean separation of PN-<init> and provide upgrade path
=66rom PN-systemd to PN (mostly done by these 2 commits from khem).

3) give up on clean separation of PN-<init> and upgrade path (there are
many issues in other parts of oe-core, so upgrade path from danny to
dylan doesn't look usable.

A) migrate existing .bbappends to their recipes to .bb files and
remove this layer. Any volunteer for that?

My vote: 3) + A) later in 1.5
I guess we're all too busy to implement 1), upgrade path would be nice,
but is all-or-nothing, doesn't make much sense to spend a lot of time
fixing every issue from PN-systemd when there are issues from other
recipes we're not going to fix by .bbappends in meta-oe.

Vote required from Khem, Koen, Andreas, Enrico, Otavio
Vote welcome from other meta-systemd contributors

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFkc5cACgkQN1Ujt2V2gBwqgwCZAWhUeHQ8yYkgovArSfBukEhK
e0IAnjfZcdbbhsnqHbTQBcVuKr6sGALg
=myd0
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--
