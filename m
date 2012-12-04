Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfrKl-0004dq-C0
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:10:43 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2146062eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 03:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rlaKyz77/VZvE1iNBZKiEQJBKWtt8zshXFHAR65iqT4=;
	b=DL/w5+NmQ2P4W7bATROw0P53Lgm3/iCQN7EKoz57u6CTVj6JIZI4uCgwQ1j+wyzgEI
	unXIW3DN0ZlkGXp4Xkmo8q7rhO28C+juRiwehFnwCWbOOv4ZzG+dWKP/zX+asg98gwG5
	bprVDqC6L4WBdGIvTQ1aNVV4uH+p3GfxK2OH8KShM3+3qMR81hLK61UVM+CVz+9KdZld
	B81xeuXYpmNqbs+Y14HAt3sbj0fHK1iQXzRAp870AUHzwIcH2MFGs0regcJBzIX7UBUm
	5vLueTs52Mmqm2yemFbaB1oRnNNH8MV7qRlvPqgSzF7MUpKsubX4UbUpBXmvoEgn++J4
	hjvQ==
Received: by 10.14.177.1 with SMTP id c1mr47755972eem.8.1354622180932;
	Tue, 04 Dec 2012 03:56:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm2194721eeo.7.2012.12.04.03.56.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 03:56:20 -0800 (PST)
Date: Tue, 4 Dec 2012 12:56:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121204115616.GF14870@jama.jama.net>
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
	<ea86ab799567bbf1f2fd02d47f9bdc775ba26f9e.1353602922.git.paul.eggleton@linux.intel.com>
	<20121204074429.GA6288@ad.chargestorm.se>
	<11016715.fxrlBBZh8S@helios>
MIME-Version: 1.0
In-Reply-To: <11016715.fxrlBBZh8S@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [danny?] Re: [meta-networking][PATCH v2 1/2] ntp: cleanup recipes and fix SSL support
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
X-List-Received-Date: Tue, 04 Dec 2012 12:10:43 -0000
X-Groupsio-MsgNum: 41961
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SnV5plBeK2Ge1I9g"
Content-Disposition: inline

--SnV5plBeK2Ge1I9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2012 at 09:21:23AM +0000, Paul Eggleton wrote:
> On Tuesday 04 December 2012 08:44:30 Anders Darander wrote:
> > * Paul Eggleton <paul.eggleton@linux.intel.com> [121122 17:50]:
> > > * Move common definitions to the inc file
> > > * Drop override of do_configure which doesn't seem to be needed anymo=
re
> > > * Fold ntp-ssl into the ntp recipe as a PACKAGECONFIG option for those
> > >   who want it (default to off) and fix configure-time checks to detect
> > >   OpenSSL properly so that it gets enabled when selected
> > > * Remove ntp-bin package and put its contents in currently empty
> > >   ntp-utils package (with migration path)
> > > * Fix hardcoded paths in ntpd initscript
> > > * Specify ntpd.conf as a configuration file for packaging purposes
> > > * Rearrange so that packaging definitions are towards the end in the
> > >   expected order
> > > * Delete unused "ntp" initscript file
> > > * Add SUMMARY
> > > * Update HOMEPAGE
> >=20
> > Would this patch be acceptable for a push to danny? Or is it to
> > intrusive?
> >=20
> > If it's to intrusive, we need to update the SRC_URI checksums in danny,
> > as they're currently not matching the downloaded file...
> >=20
> > If needed, I can create a SRC_URI-patch for danny, though I'd prefer to
> > get this one in if possible.
>=20
> IMO the original recipe was horribly broken, so I'd definitely support ha=
ving=20
> this patch applied to danny as well, assuming people have given it a=20
> reasonable amount of runtime testing and everything's OK.

I agree and I plan to send pull-request for danny with this today.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SnV5plBeK2Ge1I9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC95OAACgkQN1Ujt2V2gBw9gwCbBU8GYY3Qzp2rcxGrCRsHA43x
CdIAn20yxSiAg1CPegFtpwRyKcxUaTlE
=RWuY
-----END PGP SIGNATURE-----

--SnV5plBeK2Ge1I9g--
