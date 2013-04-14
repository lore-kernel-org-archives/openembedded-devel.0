Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UROkU-0006No-6B
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 17:21:47 +0200
Received: by mail-ee0-f42.google.com with SMTP id d4so1838297eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=twGih0QvzNRmBV2BRWnpNT2e95yHQxLm+dvSdnlnPMk=;
	b=tIeDXLHlCgOxfzc5qpNiPF4dnDQU1/6zzTNy2tPt4GuFOHpSOPbNus1U6fxR9FKQi2
	tC2tJ99849PwA87xu+CThMV6iP3lKZFKy0bmNh3VYHMIGsYkAgHRRdCSkrccdDz0UhJN
	llloivE8dPiXhUnrNlcrwXeXlEKQ8tQi5jONYxdOeOwxCFBzKnIT0rVY27+3Hw13BlUP
	e2xZmiTPn/L8FzWieDsZINistPDTNqUWwTu3v/kV4HvofIShxwjaZlBTkpIf5/FU7xPG
	9EJ0v2hUaAiRl4YJGx6cv0x6e01J8i4bPhxn7I1M1qQonR+NQEXVS3SpRi8/HnWrnEeO
	WvEw==
X-Received: by 10.14.0.5 with SMTP id 5mr7314514eea.13.1365951859012;
	Sun, 14 Apr 2013 08:04:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j44sm12399665eeu.10.2013.04.14.08.04.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 08:04:18 -0700 (PDT)
Date: Sun, 14 Apr 2013 17:04:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130414150423.GF2475@jama>
References: <1365947374-20385-1-git-send-email-Martin.Jansa@gmail.com>
	<1549811.0FvVnHz5f8@helios>
MIME-Version: 1.0
In-Reply-To: <1549811.0FvVnHz5f8@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] dnsmasq: merge dnsmasq-dbus to main recipe
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
X-List-Received-Date: Sun, 14 Apr 2013 15:21:47 -0000
X-Groupsio-MsgNum: 44165
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline

--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2013 at 04:01:59PM +0100, Paul Eggleton wrote:
> On Sunday 14 April 2013 15:49:34 Martin Jansa wrote:
> > * they conflict in sysroot anyway, should be converted to PACKAGECONFIG
> >   but because dbus is already built in most images I'll let it for some=
one
> >   who has such use-case
>=20
> Hang on a sec, I agree it's good to get rid of this second recipe, but yo=
u're=20
> changing the default - so at least give people a way to influence it. It'=
s not=20
> too hard to put in PACKAGECONFIG now while you're changing the recipe any=
way.

is there someone who needs dnsmasq without dbus?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFqxXcACgkQN1Ujt2V2gBw1XACdFgZXqOMkssnBSUmSk+wxw5sV
Kp0AoKSAZOXg+REsGO2K7gx8KODnASq9
=Ypxw
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
