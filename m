Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QTtKo-0007mc-JL for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 12:16:30 +0200
Received: from f053039014.adsl.alicedsl.de ([78.53.39.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QTtIR-0004ie-OL for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 10:14:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1307439326-12974-1-git-send-email-james@digitalmatter.com.au>
References: <1307439326-12974-1-git-send-email-james@digitalmatter.com.au>
Date: Tue, 07 Jun 2011 12:13:14 +0200
Message-ID: <1307441594.4064.19.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] initscripts: Modify 'populate-volatile.sh' to atomically update 'volatile.cache'
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
X-List-Received-Date: Tue, 07 Jun 2011 10:16:30 -0000
X-Groupsio-MsgNum: 32539
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Z5+zducv82Y9jw/MqMhG"

--=-Z5+zducv82Y9jw/MqMhG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear James,


thank you for the updated patch.

Am Dienstag, den 07.06.2011, 17:35 +0800 schrieb James Limbouris:
> When power is lost before a new volatile.cache has been flushed to disk,
> it can be corrupted, leaving the volatiles uncreated and causing software=
 failure.

So the device is still booting up although the power is lost? I am still
confused how this patch can fix this. I am sorry for my ignorance.

> Using a temporary file on the same volume and renaming it avoids this iss=
ue.
> The file is sync'd before the rename to avoid problems with newer caching=
 filesystems,
> in which the rename is atomic, but the contents of the file may not yet b=
e flushed.
>=20
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>

I will commit your patch during the next days to leave some time for
others to comment/review.

> ---
>  .../initscripts-1.0/populate-volatile.sh           |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)

[=E2=80=A6]


Thanks,

Paul

--=-Z5+zducv82Y9jw/MqMhG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3t+boACgkQPX1aK2wOHVhtIQCeNbQl0jCIufPanwOmdedwHGL9
m9EAoIYyPbfvm15kYafqM3+vvc0LQZbK
=0ffG
-----END PGP SIGNATURE-----

--=-Z5+zducv82Y9jw/MqMhG--
