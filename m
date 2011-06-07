Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QU3Rg-0002tm-RX for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 23:04:16 +0200
Received: from f053039014.adsl.alicedsl.de ([78.53.39.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QU3PK-0004gU-Fp for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 21:01:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110607184418.GA2512@denix.org>
References: <1307369743-14738-1-git-send-email-j-lance1@ti.com>
	<1307370959.4011.17.camel@mattotaupa>
	<BANLkTikbajbPaptoGjE=bwZrCsE+KyyTHw@mail.gmail.com>
	<20110607184418.GA2512@denix.org>
Date: Tue, 07 Jun 2011 23:00:59 +0200
Message-ID: <1307480459.4073.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: different addresses in author/From and Signed-off-by (was: [PATCH 1/1] matrix_gui: Update SRCREV)
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
X-List-Received-Date: Tue, 07 Jun 2011 21:04:16 -0000
X-Groupsio-MsgNum: 32558
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-YWSlOUSeGKgcUOz+Ppnf"

--=-YWSlOUSeGKgcUOz+Ppnf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 07.06.2011, 14:44 -0400 schrieb Denys Dmytriyenko:

[=E2=80=A6]

> I agree with all Paul's comments, except the one requiring From and SoB f=
ields=20
> to match - in some cases it's not possible, especially when people try to=
=20
> avoid inline patches being mangled by corporate mail servers...

Easy enough. Just add

From: Jeff Lance <j-lance1@ti.com>

to the beginning of the message and `git am` will take this for the
author field.

        $ git help am
        [=E2=80=A6]
                "From: " and "Subject: " lines starting the body override t=
he
               respective commit author name and title values taken from th=
e headers.
        [=E2=80=A6]

I do not know where this can be configured, but it should be.


Thanks,

Paul

--=-YWSlOUSeGKgcUOz+Ppnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3ukYAACgkQPX1aK2wOHVhdrgCfQWKvSXG7zrA5tCalcc3tZ3RY
SjgAn3w1zRtqol0Tm9q8GsCInETk34/k
=u4z8
-----END PGP SIGNATURE-----

--=-YWSlOUSeGKgcUOz+Ppnf--
