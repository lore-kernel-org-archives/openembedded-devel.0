Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5Dtv-0003Hu-Ga for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 10:38:33 +0200
Received: from f053041204.adsl.alicedsl.de ([78.53.41.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5DtY-0007sW-GJ for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:38:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CB2A68B.5070108@zenlinux.com>
References: <1286775778-1446-1-git-send-email-sgarman@zenlinux.com>
	<4CB2A68B.5070108@zenlinux.com>
Date: Mon, 11 Oct 2010 10:38:05 +0200
Message-ID: <1286786285.3835.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OT: git format-patch -M (was: [PATCH] cpio: update 2.5 to 2.11)
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
X-List-Received-Date: Mon, 11 Oct 2010 08:38:34 -0000
X-Groupsio-MsgNum: 24658
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-OcG4qfE1ocDVQAkqUJ8h"

--=-OcG4qfE1ocDVQAkqUJ8h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 22:54 -0700 schrieb Scott Garman:
> On 10/10/2010 10:42 PM, Scott Garman wrote:
> > Signed-off-by: Scott Garman<sgarman@zenlinux.com>
> > ---
> >   recipes/cpio/cpio-2.11/statdef.patch |   15 ++++++++
> >   recipes/cpio/cpio_2.11.bb            |   42 +++++++++++++++++++++++
> >   recipes/cpio/cpio_2.5.bb             |   42 -----------------------
> >   recipes/cpio/files/install.patch     |   61 -------------------------=
---------
> >   4 files changed, 57 insertions(+), 103 deletions(-)
> >   create mode 100644 recipes/cpio/cpio-2.11/statdef.patch
> >   create mode 100644 recipes/cpio/cpio_2.11.bb
> >   delete mode 100644 recipes/cpio/cpio_2.5.bb
> >   delete mode 100644 recipes/cpio/files/install.patch
>=20
> I'd like to point out that I used git mv to rename cpio_2.5.bb to=20
> cpio_2.11.bb, but git format-patch refuses to show the rename. I tried=
=20
> passing it the -M flag and also setting diff.renames to true in my=20
> .gitconfig file. So I'm not sure what's causing the problem.

Well my guess is, that it is due to the changed checksums, so that it is
not only a rename.


Thanks,

Paul

--=-OcG4qfE1ocDVQAkqUJ8h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyyzO0ACgkQPX1aK2wOHVhkWACfXIYrrSOjEFkw+KVAfIUxrMNe
tigAn0C/KrSh3mJXBRE7QnObtNLe6L71
=/txb
-----END PGP SIGNATURE-----

--=-OcG4qfE1ocDVQAkqUJ8h--
