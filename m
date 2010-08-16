Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OkyzM-0004RN-3A for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 14:40:28 +0200
Received: from f053039031.adsl.alicedsl.de ([78.53.39.31]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Okyz7-0004S3-8D for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 12:40:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1281960985-8977-1-git-send-email-noor_ahsan@mentor.com>
References: <1281960985-8977-1-git-send-email-noor_ahsan@mentor.com>
Date: Mon, 16 Aug 2010 14:40:08 +0200
Message-ID: <1281962408.3911.58.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sdcc-native: Added bison-native and flex-native in DEPENDS to remove configuration erros
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
X-List-Received-Date: Mon, 16 Aug 2010 12:40:28 -0000
X-Groupsio-MsgNum: 22236
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-nE01lhP7Rj+Wolf6kkuf"

--=-nE01lhP7Rj+Wolf6kkuf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 16.08.2010, 18:16 +0600 schrieb Noor Ahsan:

Nitpicks (I think): 1. add *to*, 2. erro*r*s

> * configure script was unable to find bison and flex utilities. It was gi=
ving error "configure: error: Cannot find required program bison." and "con=
figure: error: Cannot find required program flex." Added bison-native and f=
lex-native in DEPENDS to remove this error.
> * Bump PR to r1.
> * Ran oe_stylize.py script and used it output to create a new recipe and =
PATCH.

Could you split up this patch please, if it is not too much work.

1/3 sdcc-native: run `oe_stylize.py`
2/3 sdcc-native: add bison-native and flex-native to DEPENDS
(give the error in the commit message)

This would be great if you could do that:
3/3 sdcc-native: convert to new style staging, remove `do_stage()`

> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>

[=E2=80=A6]


Thanks,

Paul

--=-nE01lhP7Rj+Wolf6kkuf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxpMagACgkQPX1aK2wOHVhsiQCeOJMQcPZMPD0E3GDkInJOzAN6
LrEAn0sK6cgNpg/PMa7d1daqRLw+pFry
=XA/R
-----END PGP SIGNATURE-----

--=-nE01lhP7Rj+Wolf6kkuf--
