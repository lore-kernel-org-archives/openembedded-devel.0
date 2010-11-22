Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PKWue-00068v-0S for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 14:59:52 +0100
Received: from f053040216.adsl.alicedsl.de ([78.53.40.216]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PKWtV-0003Ek-MD; Mon, 22 Nov 2010 13:57:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinknkcmWH3q2VgX3nZRTHkdqWWvT1JNHLYHE6ao@mail.gmail.com>
References: <AANLkTi=K08tAZXfh49TQqWQZbyyrBoyvpvWoHHA2HAyf@mail.gmail.com>
	<AANLkTimtH5d-0TeoaUGjrsokfdWMBjDT+L=+WX-oL9es@mail.gmail.com>
	<AANLkTinknkcmWH3q2VgX3nZRTHkdqWWvT1JNHLYHE6ao@mail.gmail.com>
Date: Mon, 22 Nov 2010 14:57:20 +0100
Message-ID: <1290434240.3703.36.camel@mattotaupa>
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
Cc: Nagendra T S <nagendra@mistralsolutions.com>,
	Srinath R <srinath@mistralsolutions.com>, jdk@ti.com,
	Umesh Krishnan <umeshk@mistralsolutions.com>
Subject: Re: X-load git : add patch for am3517-crane support
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
X-List-Received-Date: Mon, 22 Nov 2010 14:00:02 -0000
X-Groupsio-MsgNum: 26417
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-n6480q9tLpALp7elruuu"

--=-n6480q9tLpALp7elruuu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Anil,


Am Montag, den 22.11.2010, 16:58 +0530 schrieb Anil Kumar Mamidala:

> Please find the attached x-boot patch to support am3517-crane board.

Thank you for your patch.

> From 95403dddb0f2a862bf04b8755eabfa153820272e Mon Sep 17 00:00:00 2001
> From: Anil Kumar <anilm@mistralsolutions.com>
> Date: Fri, 19 Nov 2010 11:23:21 +0530
> Subject: [PATCH] Applied patch on x-load for AM3517 Crane board support
>=20
> Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>

The subject in your attached patch differs from the more correct one of
your message. Please fix this with for example `git commit --amend` and
resend the patch marked with `[PATCH v2]`. (`git send-email` does take
care of everything.) [1]

Please also add a short note to the commit message with information to
the board, a link to the product information and maybe a short summary
if the board works fine with the current state in OE. What distribution
did you use for testing? I just saw, that you included some of these
information in the patch adding the machine config. That is fine too.
But please extend it.

Lastly please add a note to your patch where you submitted your patch
for upstream inclusion [2].

Looking at your other patches it seems there should be a certain order
in which your patches should be applied marked by `[PATCH 1/6]` and so
on. I guess first the patches for `u-boot`, `x-load` and `linux=E2=80=A6`. =
And
only in the end the new machine config.

I guess my comments will apply to your other patches too. Please resend
the whole series.


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy
[2] http://wiki.openembedded.org/index.php/Push_patches_upstream

--=-n6480q9tLpALp7elruuu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzqdsAACgkQPX1aK2wOHVhb9wCeJ0aZ6gG+3+9XVeWDI2l4er6l
tN4AnifSA6Ps/Pq2QlJbpU1l7mQmNjpp
=BEs8
-----END PGP SIGNATURE-----

--=-n6480q9tLpALp7elruuu--
