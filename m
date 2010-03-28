Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvuVf-0005TX-QU for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 17:34:44 +0200
Received: from f053035077.adsl.alicedsl.de ([78.53.35.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvuSa-0007vR-S9 for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 15:31:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B9FE1D9.30304@zenlinux.com>
References: <1268646413.3759.3.camel@mattotaupa> <4B9FE1D9.30304@zenlinux.com>
Date: Sun, 28 Mar 2010 17:31:31 +0200
Message-ID: <1269790291.8018.45.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] enna: Remove `recipes/e17/enna/.mtn2git_empty`.
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
X-List-Received-Date: Sun, 28 Mar 2010 15:34:44 -0000
X-Groupsio-MsgNum: 18195
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qfRZQcLvhEDJ4U1Bl4sC"

--=-qfRZQcLvhEDJ4U1Bl4sC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 16.03.2010, 12:54 -0700 schrieb Scott Garman:
> On 03/15/2010 02:46 AM, Paul Menzel wrote:
> > `.mtn2git_empty` is the only file in `recipes/e17/enna/` and seems have=
 originated from the Monotone to Git transition.
> >=20
> > Since no useful files are in this directory remove it completely.
>=20
> There seem to be several of these files left in the tree:
>=20
> find . -name ".mtn*"
>=20
> ./recipes/mono/mono-1.9.1/.mtn2git_empty
> ./recipes/mamona/bash-noemu-3.2/.mtn2git_empty
> ./recipes/mamona/gcc-noemu-4.1.1/.mtn2git_empty
> ./recipes/mamona/gcc-noemu-4.1.2/.mtn2git_empty
> ./recipes/mamona/binutils-noemu-2.17.50.0.5/.mtn2git_empty
> ./recipes/twisted/.mtn2git_empty
> ./recipes/netbase/netbase/if-post-down.d/.mtn2git_empty
> ./recipes/netbase/netbase/if-down.d/.mtn2git_empty
> ./recipes/netbase/netbase/if-up.d/.mtn2git_empty
> ./recipes/netbase/netbase/if-pre-up.d/.mtn2git_empty
> ./recipes/opensync/libopensync/.mtn2git_empty
> ./recipes/opensync/libsyncml/.mtn2git_empty
> ./recipes/efl1/evas/.mtn2git_empty
> ./recipes/e17/enna/.mtn2git_empty
> ./recipes/postfix/postfix-2.0.20/.mtn2git_empty
> ./contrib/site-conf/.mtn-ignore
> ./docs/usermanual/reference/.mtn2git_empty
> ./docs/usermanual/chapters/.mtn2git_empty
> ./conf/machine/nonworking/.mtn2git_empty
>=20
> Should they all be removed?

I have no idea. If I understood it correctly Monotone supports empty
directories and Git does not.

If I understood it correctly OE needs some empty directories and
therefore those auxiliary files were created.

Probably those files are not needed in the `recipes/` folder. But
someone experienced should comment.

If that takes longer it would be great if my patch could be applied
anyway.


Thanks,

Paul

--=-qfRZQcLvhEDJ4U1Bl4sC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuvdlMACgkQPX1aK2wOHVg0XACfW0O3yHwzZw999ozp8tCG8hdh
7gcAn3Wdhe11XmdS61A1ZJ2DAxJFrVHQ
=rhuv
-----END PGP SIGNATURE-----

--=-qfRZQcLvhEDJ4U1Bl4sC--
