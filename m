Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P62ln-0004Mc-DI for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 16:57:34 +0200
Received: from f053040062.adsl.alicedsl.de ([78.53.40.62]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P62lN-0005IL-Pq for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 14:57:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CB5A897.2000003@freyther.de>
References: <mailman.1290.1286961912.3514.openembedded-devel@lists.openembedded.org>
	<4CB58BAD.5090806@gmail.com> <4CB5A86D.6020304@gmail.com>
	<4CB5A897.2000003@freyther.de>
Date: Wed, 13 Oct 2010 16:57:04 +0200
Message-ID: <1286981824.3904.59.camel@mattotaupa>
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
Subject: Re: apr-util_1.3.4.bb fails, looking at host includes
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
X-List-Received-Date: Wed, 13 Oct 2010 14:57:34 -0000
X-Groupsio-MsgNum: 24782
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ihsiAyddz+7c0wI1K6GF"

--=-ihsiAyddz+7c0wI1K6GF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 13.10.2010, 14:39 +0200 schrieb Holger Freyther:
> On 10/13/2010 02:39 PM, Tasslehoff Kjappfot wrote:
>=20
> >=20
> > Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
> > ---
> >  recipes/apr/apr-util_1.3.4.bb |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/recipes/apr/apr-util_1.3.4.bb b/recipes/apr/apr-util_1.3.4=
.bb
> > index cc6781b..5e31171 100644
> > --- a/recipes/apr/apr-util_1.3.4.bb
> > +++ b/recipes/apr/apr-util_1.3.4.bb
> > @@ -14,6 +14,7 @@ EXTRA_OECONF =3D
> > "--with-apr=3D${STAGING_BINDIR_CROSS}/apr-1-config \
> >          --with-gdbm=3D${STAGING_DIR_HOST}${layout_prefix} \
> >          --without-sqlite2 \
> >          --without-sqlite3 \
> > +                --without-pgsql \
>=20
> hmm... the existing file is using spaces, you use tabs... I will fix it w=
hen
> pushing the changes. Please try to follow the indention of the file.

Holger committed your patch in eba2dd [1]. It would be nice if you could
write a elaborate commit message next time with the actual error message
and reason added.

  /checking for pg_config... /usr/bin/pg_config
     adding "-I/usr/include/postgresql" to CPPFLAGS
     adding "-L/usr/lib" to LDFLAGS/

I build tested `r7` with `minimal-uclibc` for `MACHINE =3D "beagleboard"`
and it worked for me without any problems as it was with `r6`. But I did
not have `pg_config` installed on my build system anyway.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Deba2dd0=
9dfb380493e7f416bbbc437d47205b9de

--=-ihsiAyddz+7c0wI1K6GF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky1yMAACgkQPX1aK2wOHVhRxACfSZD6hyRGJ8LfMEWlE0csFiP8
HFYAmQHLu5WSy8VGO9rc09PArZjKSUzl
=4kHz
-----END PGP SIGNATURE-----

--=-ihsiAyddz+7c0wI1K6GF--
