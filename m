Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWczH-0006Z4-40 for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 22:48:50 +0100
Received: from g225080206.adsl.alicedsl.de ([92.225.80.206]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWcx9-0004ns-Lb for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 21:46:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hivpa7$hib$3@ger.gmane.org>
References: <alpine.LFD.2.00.1001170412460.4070@localhost>
	<hivpa7$hib$3@ger.gmane.org>
Date: Sun, 17 Jan 2010 22:46:34 +0100
Message-ID: <1263764794.5353.33.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: move marvell firmware tarballs out of OE repo?
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
X-List-Received-Date: Sun, 17 Jan 2010 21:48:50 -0000
X-Groupsio-MsgNum: 15827
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vommvWmDvqllVhWjpZ4m"

--=-vommvWmDvqllVhWjpZ4m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 17.01.2010, 20:44 +0100 schrieb Rolf Leggewie:
> Robert P. J. Day wrote:
> >   (this is the first in a small number of postings to clarify the
> > purpose of some tarballs in the OE dev repository
>=20
> DUDE!
>=20
> Why are you again wasting everybody's time?  I thought you wanted to use
> git log yourself to find out and then targeting the relevant people in a
> focused fashion instead of flooding the list with this junk?

(Very polite! ;-))

If you look at his other messages you will see that this was probably
not Robert=E2=80=99s intention and that he did his best.

> BTW, re your suggestion to add READMEs.  Well, I guess that is fine.
> But for people who aren't too lazy to use "git log --find-copies-harder"
> the answers are often right there.

(Again not a nice implication.)

Anyways looking at the relevant commit

        $ git log --follow recipes/firmwares/marvell-gspi-fw/9.70.3-p37.tar=
.gz
        commit 7ea3026aa3c216f9943711771e9245b2b6ff7c84
        Author: Marcin Juszkiewicz <marcin@buglabs.net>
        Date:   Thu Apr 23 14:01:35 2009 +0200
       =20
            marvel-gspi-fw: added firmware for WiFi bugmodule
           =20
            This is firmware for not-yet-released-into-sales wifi/bt bugmod=
ule.

it does not explicitly say, why the firmware cannot be made public
somewhere or if it ever will be available.

Having =E2=80=9Cperfect=E2=80=9D commit messages in OE seems to still be a =
current
topic, so having a README file is certainly an idea I support at least
for the files the commit messages can not be changed anymore. This would
definitely help me and lower the barrier/learning curve to get to know
OE.


Thanks,

Paul

--=-vommvWmDvqllVhWjpZ4m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktThTkACgkQPX1aK2wOHVj9sACfW25RZ03O6Rs2VbIH3ym3elO5
2ncAni7N/xLlLUlHq/gJMPVjnCi9Yjhm
=e/eT
-----END PGP SIGNATURE-----

--=-vommvWmDvqllVhWjpZ4m--
