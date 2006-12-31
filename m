Received: from [216.215.6.39] (helo=ice.mudshark.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jack@ice.mudshark.org>) id 1H0qeR-0003qB-ED
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Dec 2006 03:42:19 +0100
Received: by ice.mudshark.org (Postfix, from userid 1000)
	id 11D80134024; Sat, 30 Dec 2006 18:41:26 -0800 (PST)
Date: Sat, 30 Dec 2006 18:41:26 -0800
From: jack-oe@mudshark.org
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061231024125.GL18175@ice.mudshark.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1167506369.5626.46.camel@localhost.localdomain>
User-Agent: Mutt/1.4.1i
Subject: Re: A question of workflow
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 31 Dec 2006 02:42:20 -0000
X-Groupsio-MsgNum: 1041
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Content-Disposition: inline

--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2006 at 07:19:29PM +0000, Richard Purdie wrote:
=20
> What you've described is how I or any other OE developer with an
> authorised monotone key would work with OE. The problem is we can't just
> give access to anyone as that wouldn't make any sense for obvious
> reasons.
=20
Monotone supports trust relations[0] as well as netsync access controls[1].

Netsync access controls are primarily to prevent someone trashing your
repository. OE restricts write access to the repository on openembedded.org=
.=20

Trust relations are orthogonal to access control. Monotone allows you to on=
ly
trust revisions committed by certain users(keys).

In the case of a single trusted repository, that only a certain number of
developers have write access to -- they're the same thing.=20

However, in the case where you have multiple repositories, with different
permissions, things can get complicated. There is work ongoing in monotone =
to
make this simpler[2].=20

> It does mean you shouldn't be committing changes locally via monotone.
> If you do this you will have to pull and then merge every time. That
> isn't a problem in itself but if you do get direct commit access, we
> will not be happy adding hundreds of extra merges to the main
> repository.

Yeah. Or commit your changes to a private branch, and 'propagate' changes t=
here
from the main branch.=20

The monotone wiki has a series of (incomplete) best practices[3]. Important=
 are
DaggyFixes[4], and CommitEarlyCommitOften[5]..

Cheers,=20

--Jack=20

[0] http://venge.net/monotone/wiki/TrustFoundations
[1] section 6.1.3 of http://venge.net/monotone/docs/Hooks.html
[2] http://venge.net/monotone/wiki/VersionedPolicy=20
[3] http://venge.net/monotone/wiki/BestPractices
[4] http://venge.net/monotone/wiki/DaggyFixes
[3] http://venge.net/monotone/wiki/CommitEarlyCommitOften

--
Jack (John) Cummings                           http://mudshark.org/
PGP fingerprint: 0774 D073 E386 B70B 6B16  2D2B 1DD8 F8B0 CCF0 FAEE

--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFFlyNVPVO9yHkX+AIRAlfVAKCpSy/5MpjrrL54EigjbI+84jqq5QCbBizK
N68V/gi05mJaXYuWog/tvtY=
=5Qqt
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--
