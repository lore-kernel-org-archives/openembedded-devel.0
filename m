Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtGsE-00080l-7R for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 12:27:54 +0200
Received: from f053034117.adsl.alicedsl.de ([78.53.34.117]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtGnq-0008KZ-Ao for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 10:23:22 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <e0ebd62ce3368f4005276160fca96c5059c94f75.1313486613.git.anders@chargestorm.se>
References: <cover.1313486613.git.anders@chargestorm.se>
	<e0ebd62ce3368f4005276160fca96c5059c94f75.1313486613.git.anders@chargestorm.se>
Date: Tue, 16 Aug 2011 12:23:17 +0200
Message-ID: <1313490197.3496.29.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH 2/2] ckermit: update to version 9.0
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
X-List-Received-Date: Tue, 16 Aug 2011 10:27:54 -0000
X-Groupsio-MsgNum: 33618
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-3maRp3pGOA1AJAQEtGO5"

--=-3maRp3pGOA1AJAQEtGO5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 16.08.2011, 11:24 +0200 schrieb Anders Darander:
> The update changes the license from kermit to BSD.
> Remove the NOAPCS compile flag to make the new version compile cleanly.

What configuration did you use for build and run testing?

> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-oe/recipes-support/ckermit/ckermit_211.bb |   98 ------------------=
------
>  meta-oe/recipes-support/ckermit/ckermit_301.bb |   58 ++++++++++++++
>  2 files changed, 58 insertions(+), 98 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/ckermit/ckermit_211.bb
>  create mode 100644 meta-oe/recipes-support/ckermit/ckermit_301.bb

Please pass `-M -M -C -C -C`(?) to `git format-patch` to make reviews
easier.

[=E2=80=A6]

> diff --git a/meta-oe/recipes-support/ckermit/ckermit_301.bb b/meta-oe/rec=
ipes-support/ckermit/ckermit_301.bb

The version numbers seem quite confusing. Why is this 9.0? But that is
an upstream problem.

[=E2=80=A6]

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-3maRp3pGOA1AJAQEtGO5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5KRRUACgkQPX1aK2wOHVjkIACeLyDw8v98zO+798RJy9jUkyS2
IcUAn1ZFQguE69vUkI5EJtEmhBCB78ee
=xuUk
-----END PGP SIGNATURE-----

--=-3maRp3pGOA1AJAQEtGO5--
