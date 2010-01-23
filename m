Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYezP-00054p-TU for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 13:21:22 +0100
Received: from f053033135.adsl.alicedsl.de ([78.53.33.135]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYexD-0007bE-Qs for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 12:19:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hjejrf$m65$1@ger.gmane.org>
References: <201001230943.24210.holger+oe@freyther.de>
	<hjejrf$m65$1@ger.gmane.org>
Date: Sat, 23 Jan 2010 13:19:02 +0100
Message-ID: <1264249142.3630.41.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New state for patches not complying with commit policy (was: Patchwork Workflow improvement)
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
X-List-Received-Date: Sat, 23 Jan 2010 12:21:23 -0000
X-Groupsio-MsgNum: 16083
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-lpyhYa2QrksOg196UG3m"

--=-lpyhYa2QrksOg196UG3m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.01.2010, 11:42 +0100 schrieb Koen Kooi:
> On 23-01-10 09:43, Holger Hans Peter Freyther wrote:
> > right now I'm writing a Qt 4.6 based application that might help us
> a bit with=20
> > the patchwork queue.
> >=20
> > The idea of the script is to have two things at the end:
> >       1.) a branch with all the patches that applied and that can be pu=
blished
> >       2.) a list of patches that don't apply.
> >=20
> >=20
> > What people are supposed to:
> >=20
> > 1.) Cherry pick from the branch
> > 2.) Send updated patches, close the reports on patchwork...
>=20
> I think people that apply those patches to oe.dev should fix up the
> commit message as well. The stack Khem pushed this week is just
> awfull.
>=20
> I guess we should flag patches with bad commit messages as 'rejected' in
> pw ASAP. We can weed out most of them by reject anything that lacks a
> ':' in the subject line.

I am just getting into Patchwork [1][2], so I am sorry if I miss the
obvious.

If it is possible, I suggest to add a new state (=C2=BBRejected =E2=80=93 C=
ommit
Policy=C2=AB) for patches not complying with the commit policy [3]?

As a bonus an automatically answer is sent to the message with the patch
to the list with the following content, which is just a draft/suggestion
of course.


        Dear patch author,
       =20
       =20
        thank you for your patch. Unfortunately we had to reject it
        because it does not comply with our commit policy [3].
       =20
        It would be great if you could resend your patch with this issue
        fixed so that we can review and commit it as soon as possible.
       =20
       =20
        Thank you,
       =20
        OpenEmbedded people


Is there a way to automate this?


Thanks,

Paul


[1] http://patchwork.openembedded.org/
[2] http://ozlabs.org/~jk/projects/patchwork/
[3] http://wiki.openembedded.net/index.php/Commit_Policy

--=-lpyhYa2QrksOg196UG3m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAkta6TUACgkQPX1aK2wOHVj0ygCdF/axSgBTQu0zEjZoeBRJv2nV
u1kAmPezF9GxX7oyfDhujTqa9+WrNEU=
=ph8S
-----END PGP SIGNATURE-----

--=-lpyhYa2QrksOg196UG3m--
