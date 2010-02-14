Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NggmV-0004hY-Oc for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 16:53:14 +0100
Received: from f053033040.adsl.alicedsl.de ([78.53.33.40]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nggk0-00080L-P0 for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 15:50:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100214130905.GD5979@excalibur.local>
References: <20100213203508.540D614AF55@gandalf.denix.org>
	<20100214130905.GD5979@excalibur.local>
Date: Sun, 14 Feb 2010 16:50:35 +0100
Message-ID: <1266162635.5009.42.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Update state in Patchwork. (was: [PATCH] meta-toolchain: Run rmdir only if empty dirs are actually found.)
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
X-List-Received-Date: Sun, 14 Feb 2010 15:53:14 -0000
X-Groupsio-MsgNum: 16766
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-cuebXla2by8/ZeSKesCu"

--=-cuebXla2by8/ZeSKesCu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Stefan,


Am Sonntag, den 14.02.2010, 14:09 +0100 schrieb Stefan Schmidt:
> On Sat, 2010-02-13 at 20:34, Denys Dmytriyenko wrote:
> > > Prevent a failure in do_populate_sdk when there are no empty
> > > directories:
> > >    /bin/rmdir: missing operand
> > >    Try `/bin/rmdir --help' for more information.
> > >
> > > See also http://tinderbox.openembedded.net/packages/478437/
> > >
> > > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > Acked-by: Denys Dmytriyenko <denis@denix.org>
>=20
> Acked and pushed. Now I need to find out how to update patchwork with the=
 new
> status...

1. Register an account at [1].
2. Update the state.

a) Use the Web interface.
b) Use pwclient [2] and set it up with your account details and do the
following.=20

    $ pwclient update -s applied -c <commit-ref> <ID>


Thanks,

Paul


[1] http://patchwork.openembedded.org/project/openembedded/list/
[2] http://patchwork.openembedded.org/project/openembedded/ (at the bottom)

--=-cuebXla2by8/ZeSKesCu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkt4G8oACgkQPX1aK2wOHVj6+wCggMMqevvSz6Y1L83m6MyAwdcn
sr8AnA6Qxz1EbKuNioG7KlE2KvF1SFVm
=4xE/
-----END PGP SIGNATURE-----

--=-cuebXla2by8/ZeSKesCu--
