Received: from [134.169.172.64] (helo=thebe.totalueberwachung.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daniel@totalueberwachung.de>) id 1KQl4K-0004ua-G2
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2008 17:36:56 +0200
Received: from elara.dyn.totalueberwachung.de (unknown [192.168.0.8])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by thebe.totalueberwachung.de (Postfix) with ESMTP id 0A157D8286
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2008 17:36:51 +0200 (CEST)
Date: Wed, 6 Aug 2008 17:36:47 +0200
From: Daniel Willmann <daniel@totalueberwachung.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080806173647.1c51a79c@elara.dyn.totalueberwachung.de>
X-Mailer: Claws Mail 3.3.1 (GTK+ 2.12.8; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: RFC deleting libpixman in favor of pixman
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
X-List-Received-Date: Wed, 06 Aug 2008 15:36:56 -0000
X-Groupsio-MsgNum: 5706
Content-Type: multipart/signed; boundary="Sig_/Y62IVsLvqdvxL9ZnOn_BCn1";
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_/Y62IVsLvqdvxL9ZnOn_BCn1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

I just noticed that both are the same library with different names.
They are located in:
packages/libpixman/libpixman*bb
packages/xorg-lib/pixman*bb

libpixman includes versions 0.1.5 and 0.1.6, but a
find packages/ |xargs grep libpixman shows me that libpixman isn't used
anywhere except in:
./packages/tasks/task-sdk-base.bb

So I would suggest that we remove libpixman and change the one
occurence of it in task-sdk-base to pixman instead.

Any objections, something I overlooked?

Regards,
Daniel Willmann

--Sig_/Y62IVsLvqdvxL9ZnOn_BCn1
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkiZxREACgkQZ2fhlIqbZ1gXjACeOpYxTJ5SnQBoLc7Ux8s2K3Jf
VssAoJKoIwq/IaBbtp50ounfYF+pm29Y
=Jk+e
-----END PGP SIGNATURE-----

--Sig_/Y62IVsLvqdvxL9ZnOn_BCn1--
