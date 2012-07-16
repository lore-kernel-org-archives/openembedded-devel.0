Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SqfiX-0002uC-Mc
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 09:27:41 +0200
Received: by wgbdr1 with SMTP id dr1so1318985wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 00:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oHNlyo6F+5q+aMkGzs+gKEB0rCC+tjuPrS1f45J8zvg=;
	b=Gqf9ggVptS2xG8CIm8VrW0SzaAhJtbXs/WxaKt7LV1jJs2KeoEFuA9EA/3JpIGc1mn
	SpKiQH0AA1W4jSLDkdhyQ66XMMTPHLBj3dnOFTBnqmMg6v+yLDEqJpSqT2f+VuN4GSHN
	Q66LkT58ZYcpC8nrCDBf5lNzLvZdw+HSrh6VNJ6LZs0Au8ziWVVykpD3GfhBGCvZAn4h
	L2SBlkS/UyTV8Nmq/rDzw52ftgmvRHkNjWiRgFlPBX4LIEr9Eie+pHTiYYIImldxMygJ
	bbbHcG8uRP0NjjRwxiJ8gBdFmjWrNX8a+tVkvf+pqGdc/o+zkVNqOva/Xtt+2kCccOjs
	/cdQ==
Received: by 10.180.97.106 with SMTP id dz10mr15776821wib.21.1342422983880;
	Mon, 16 Jul 2012 00:16:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm29751522wix.5.2012.07.16.00.16.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 00:16:22 -0700 (PDT)
Date: Mon, 16 Jul 2012 09:16:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120716071630.GA3729@jama.jama.net>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<38351001.3KzA0t96MO@helios>
	<71A2669E-47B3-4F5F-B631-014BBB23CC9F@dominion.thruhere.net>
	<4236628.uxsfNWTicv@helios>
MIME-Version: 1.0
In-Reply-To: <4236628.uxsfNWTicv@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Joe MacDonald <joe.macdonald@windriver.com>
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Mon, 16 Jul 2012 07:27:41 -0000
X-Groupsio-MsgNum: 39670
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 05:15:33PM +0100, Paul Eggleton wrote:
> On Friday 13 July 2012 18:03:08 Koen Kooi wrote:
> > Op 13 jul. 2012, om 17:58 heeft Paul Eggleton het volgende geschreven:
> > > On Thursday 12 July 2012 15:57:52 Joe MacDonald wrote:
> > >> Just to make sure we're got it in context, though, the open points w=
ere:
> > >>   - tcpdump listed in meta-oe's recipes-core/tasks/task-cli-tools,
> > >>  =20
> > >>     under RDEPENDS_${PN}-debug.
> > >=20
> > > Koen, any suggestions? This task has pretty random contents - some of=
 it
> > > is even hardware-specific. Do we really need to keep this together?
> >=20
> > That's an SHR recipe, you'd have to ask Martin Jansa.
>=20
> Ultimately we should not have anything distro-specific in meta-oe at all,=
 which=20
> means we all ought to have a say in its contents - otherwise it belongs i=
n the=20
> distro layer.

It was added from oe-core, because we (SHR) were still using it in our
images/tasks. If we're the only one user I don't mind moving it to our
distro layer or reworking it to something usefull for other people too.

> Martin, do you have any objection to this task recipe being reworked in t=
he=20
> face of the proposal to split tcpdump (and other networking-related recip=
es)=20
> out to meta-networking?

Not at all.. I'll just add meta-networking to our layers setup..

> > The biggest blocker right now is where meta-networking is going to be
> > hosted, the layers in the meta-openembedded repo can only depend on oe-=
core
> > and bitbake, no other external layers.
>=20
> I'll leave this for Joe to comment on.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlADv84ACgkQN1Ujt2V2gBzm5gCglmWb+4KHHwNqzEIvDxi7RqhO
TlMAoLQ0rw6TwWelH3t3Zd6yM+axN2wm
=CNCe
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
