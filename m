Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ276-0005uS-E8 for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 14:02:51 +0100
Received: from g229060220.adsl.alicedsl.de ([92.229.60.220]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ24t-0008CJ-3F for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 13:00:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hjg481$2f2$1@ger.gmane.org>
References: <201001230943.24210.holger+oe@freyther.de>
	<hjejrf$m65$1@ger.gmane.org>	<201001231356.29728.holger+oe@freyther.de>
	<19c1b8a91001231540i7c8573aah13e5ccfbfa7dd290@mail.gmail.com>
	<19c1b8a91001231542u5c46cfaem697e696ab21ea0d2@mail.gmail.com>
	<hjg481$2f2$1@ger.gmane.org>
Date: Sun, 24 Jan 2010 14:00:29 +0100
Message-ID: <1264338029.3810.72.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Useful Git hooks for ensuring code quality. (was: Patchwork Workflow improvement)
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
X-List-Received-Date: Sun, 24 Jan 2010 13:02:51 -0000
X-Groupsio-MsgNum: 16155
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-sNLqIyvc9lGDnIrKHWsQ"

--=-sNLqIyvc9lGDnIrKHWsQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 24.01.2010, 01:28 +0100 schrieb Rolf Leggewie:=20
> Khem Raj wrote:
> > I guess we could install commit hooks similar=20
>=20
> [x] show code

I mentioned this too in my other (rather long) mail =C2=BB[oe] [RFC]
Perfect(?) workflow for patches.=C2=AB [1].

I hope I will find some time to code something up. But here are some
links.

I copy the links from [1] into this message. Unfortunately I could not
find the hooks uclibc is using.

Besides in `git help hooks`, Git hooks are covered very well in the Pro
Git book section 7.3 [2]. There is a pretty good blog post regarding
this issue [3] too.

1. Examples in the Pro Git book from section 7.4.
http://progit.org/book/ch7-4.html

2. Git hooks used by arora project (also referred to in [3]):
http://github.com/Arora/arora/tree/master/git_hooks/

3. Script which can be hooked up to automatically change state in
Patchwork (for Subversion/SVN though):
http://lists.ozlabs.org/pipermail/patchwork/attachments/20091006/13e2340a/a=
ttachment.asc

4. Examples in the Git project
http://git.kernel.org/?p=3Dgit/git.git;a=3Dtree;f=3Dcontrib/hooks


I suggest to also create a directory `contrib/hooks` where we should
save tested hooks to share them.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/01=
6715.html
[2] http://progit.org/book/ch7-3.html
[3] http://benjamin-meyer.blogspot.com/2008/10/git-hooks.html

--=-sNLqIyvc9lGDnIrKHWsQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktcRG0ACgkQPX1aK2wOHVhFTgCfWnxwgQ5WYLfEzUWvyTVrA7js
wZMAn1O41ItjiOYsKkLxjXwjRZ+MIA+t
=uGHX
-----END PGP SIGNATURE-----

--=-sNLqIyvc9lGDnIrKHWsQ--
