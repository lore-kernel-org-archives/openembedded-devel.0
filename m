Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QiU1X-0001ra-Hm for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jul 2011 18:16:55 +0200
Received: from f053041089.adsl.alicedsl.de ([78.53.41.89]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QiTyK-0005cy-9X; Sun, 17 Jul 2011 16:13:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
References: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
Date: Sun, 17 Jul 2011 18:12:51 +0200
Message-ID: <1310919171.4288.19.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: Populating meta-oe with new patches on oe.dev
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
X-List-Received-Date: Sun, 17 Jul 2011 16:16:55 -0000
X-Groupsio-MsgNum: 33191
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-sIOnW+ybSMb19WKRV2ew"

--=-sIOnW+ybSMb19WKRV2ew
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Khem,


Am Freitag, den 15.07.2011, 14:42 -0700 schrieb Khem Raj:

> As we all know that next release of OpenEmbedded is slated based on
> oe-core, I would like to request submitters and committers of
> the patches for oe.dev to port the patches to meta-oe or any other
> layer that is suitable for a given patch. Any new recipes
> being added to oe.dev should definitely go into the new layered structure

unfortunately as someone not having followed the creation of oe-core and
meta-oe, I fill somewhat lost. Is there a comprehensive document
somewhere as Russell also asked for?

Additionally I have the following observations.

1. Compared to former oe.dev activity looking at meta-oe there are only
a handful of people doing contributions and a lot of recipes are
missing. I have the feeling that a lot of developers where left out in
the process of creating the new infrastructure and I do not know if they
just develop their private branches based on oe.dev or if they use
meta-oe and I have not noticed this.

2. Looking at the weekly changelogs sent to the lists I see a lot of
duplicated commits in each layer. Why is that needed? Is not that a
design problem of the layers?

3. I find the `recipe-*section*/` directories difficult to handle to
finding a recipe. Before I would use `recipe/` and then tab completion
and now I have to search for it. Are others uncomfortable with this?

4. What images are available in/for oe-core/meta-openembedded? I liked
for example `minimal{,-uclibc}`? `find . -name minimal*` in `oe-core` or
`meta-oe` did not give any result. Not to mention the images for
BeagleBoard or `micro-image` for the recently sent patches for payload
creation for coreboot=20

> Please follow the commit guidelines for meta-oe/oe-core

=E2=80=A6 which can be found in the Wiki [1].

> and submit the appropriate pull requests so that when we cut out the
> next release we don't miss any of those patches.

Did anyone wrote any helper scripts for conversion of recipes/commits
from oe.dev to meta-oe?


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines

--=-sIOnW+ybSMb19WKRV2ew
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4jCfYACgkQPX1aK2wOHVijMgCfWTRaZUCUrN89tsrbvdcv6x27
EZkAnjBrtfPcD4lNVAuH6fR7QKktOFZo
=vbb6
-----END PGP SIGNATURE-----

--=-sIOnW+ybSMb19WKRV2ew--
