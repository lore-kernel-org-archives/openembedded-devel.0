Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMHxi-0000Bf-CY for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 12:57:14 +0200
Received: from f053033076.adsl.alicedsl.de ([78.53.33.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMHuy-0008NO-1v for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 10:54:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTik25d8oDdLDkFKe=Pnw_r=3hB6woA@mail.gmail.com>
References: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
	<1305433012-13000-2-git-send-email-christian.betz@gmail.com>
	<1305456100.5838.16.camel@mattotaupa>
	<BANLkTik25d8oDdLDkFKe=Pnw_r=3hB6woA@mail.gmail.com>
Date: Tue, 17 May 2011 12:54:21 +0200
Message-ID: <1305629661.4065.48.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] fix acpid compiler warning on some platforms
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
X-List-Received-Date: Tue, 17 May 2011 10:57:14 -0000
X-Groupsio-MsgNum: 32139
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-alkpokKSldQ/7CCmJqza"

--=-alkpokKSldQ/7CCmJqza
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 16.05.2011, 21:10 -0400 schrieb Christian Betz:
> Signed-off-by: Christian Betz <christian.betz@gmail.com>
> ---------------------------------------------------------
> I'm sorry I missed the part about officially signing off.

No problem. This has happened to all of us. I committed your patch in
[1]. Please update the state in the patch queue [2].

> Would you mind telling me the sequence of git format-patch and git
> send-email that you typically use?
>=20
> This is what I plan to do next time
>=20
>   git format-patch -s 2b621ed98259fa87b2e7ad05d4787d2dbf618608
>   git send-email --annotate 0001-fix-something.patch
>=20
> I will put the commit message as the subject and then detail why the
> fix is needed in my editor in annotate mode.

The subject should just contain the summary and the body further
information [3]. So what you wanted to write into annotate you should
put that into the commit message, i. e., when you run `git commit`.

So an example work flow could be the following.

git commit -s # quick note if you are in a hurry
git commit --amend -s # to improve the commit message
git rebase -i HEAD~20 # 20 is an example. This way you can reformat/reorder=
/edit committed patches.
git format-patch -1 -s # -1 takes the last commit
git send-email 0001-fix-something.patch # You do not need `--annotate` if y=
ou formatted and improved everything above.


`-s` is only needed once in that series but it is ignored if the
Signed-off-by line is already present.

> Or maybe there is an official wiki document you (someone) can point me to=
?

I found [4] and [5]. The manual pages are also very elaborate and
accessible using `git help yourcommand`, e. g., `git help format-patch`.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De0d2de3=
98e156fbdc913cc4decf75c357fcf2b33
[2] http://openembedded.org/index.php/Patchwork
[3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032692=
.html
[4] http://openembedded.org/index.php/Git
[5] http://en.opensuse.org/Git

--=-alkpokKSldQ/7CCmJqza
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3SU90ACgkQPX1aK2wOHVhd5ACeIrkfKvIf/eqtIkvTh3IcNiAO
WRoAnA2Pq1iaRWJ/dwhSTOefBs8EScgu
=WLOx
-----END PGP SIGNATURE-----

--=-alkpokKSldQ/7CCmJqza--
