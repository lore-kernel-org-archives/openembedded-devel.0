Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rq3fr-0002w1-3Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 15:18:07 +0100
Received: by eekd41 with SMTP id d41so1697380eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 06:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Mlxqso92s22Zf2TK822/j/UdDjpIFIw8saM4meZMLoY=;
	b=Q97rVikR9uyFDUEY6cFZbE6+DINkM61BtJJJ+cGIBFMKt/UUBs91jeDLsTUk/O07rw
	52q6/a8XZxPfr89PwAUtTFpVsZod7yKjHmFh2+/9cwIeRNCMi5Uo30K7GyfJ7Du8bP7i
	3OkhVYjtPbF6EjO4tAHlgoHO+ahKWyy0sV5c0=
Received: by 10.14.16.163 with SMTP id h35mr6110499eeh.16.1327500620542;
	Wed, 25 Jan 2012 06:10:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 40sm2004497ees.10.2012.01.25.06.10.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 06:10:19 -0800 (PST)
Date: Wed, 25 Jan 2012 15:10:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120125141018.GE3843@jama.jama.net>
References: <1592899.mTy93uB97i@helios>
MIME-Version: 1.0
In-Reply-To: <1592899.mTy93uB97i@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 14:18:07 -0000
X-Groupsio-MsgNum: 36677
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="brEuL7wsLY8+TuWz"
Content-Disposition: inline

--brEuL7wsLY8+TuWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2012 at 12:48:11PM +0000, Paul Eggleton wrote:
> Hi all,
>=20
> The meta-oe layer [1] is becoming the home for additional recipes that we=
 miss=20
> from OE-Classic that don't have another obvious layer to go into, and thi=
s is=20
> a good thing. However I think that meta-oe is already in a state where qu=
ite a=20
> few people feel the new structure is not working for them.
>=20
> As I see it, meta-oe is trying provide the following:
>=20
>  1) Additional recipes that are not in OE-Core
>=20
>  2) Additional functionality for OE-Core recipes that we can't enable in =
OE-
> Core itself (e.g. enabling postgres support in Qt) - mostly just a side-e=
ffect=20
> of #1
>=20
>  3) A place to preserve old versions of recipes that have been removed fr=
om=20
> OE-Core in favour of newer versions
>=20
>  4) Newer less-well tested versions of recipes
>=20
> I think what most people want when they enable meta-oe in their layer=20
> configuration is #1, and it's probably OK to get #2 along with it. They d=
o not=20
> however expect versions of toolchains, eglibc or other fairly fundamental=
 bits=20
> and pieces that might cause their build to fail when everything worked fi=
ne=20
> just building with OE-Core (#4). Equally I expect there will be some peop=
le=20
> who want just #3 and nothing else.
>=20
> I understand there is significant value in providing all of these things,=
 I=20
> just think we shouldn't be trying to do them all in one largely indivisib=
le=20
> layer. In our new layer structure we should be able to find a way to spli=
t the=20
> metadata so that people who want any combination can still have what we h=
ave=20
> in meta-oe today, and yet those who just want one of them don't get unexp=
ected=20
> build failures or older/newer versions being built.
>=20
> Thoughts?

I don't see problems as it's now and I fear that splitting it even more
will result only in more complexity.

If there are problems with some recipes then we should try to fix them
no matter in which even smaller layer they belong.

I think we should rather address that issue with layer "priority" which
should be easier to understand and adjust in bblayers.conf.

And that DEFAULT_PREFERRENCE should be respected across layers, IIRC if
you add newer less-well tested version of some recipe (like I did with
libsoup-2.4 in meta-efl) then it's preferred over "stable" version in
oe-core even when it has lower D_P -1.

And we should continue to replace .bb files which exists in meta-oe and
also in oe-core with .bbappends.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--brEuL7wsLY8+TuWz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8gDUoACgkQN1Ujt2V2gBwJpQCglH8s9vrCFXZq9SdozwAp+0jD
AiMAn2My4QXtnkg8xh78Z4rDapg07qRY
=3nYW
-----END PGP SIGNATURE-----

--brEuL7wsLY8+TuWz--
