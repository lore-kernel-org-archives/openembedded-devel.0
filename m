Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoHnD-0002zd-Vn for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 17:22:31 +0200
Received: from f053042170.adsl.alicedsl.de ([78.53.42.170]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoHmK-00057F-RP for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 15:20:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
References: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
Date: Wed, 25 Aug 2010 17:20:36 +0200
Message-ID: <1282749636.3880.143.camel@mattotaupa>
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
Subject: Re: Patch procedure for dummies
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
X-List-Received-Date: Wed, 25 Aug 2010 15:23:44 -0000
X-Groupsio-MsgNum: 22644
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9VIb2FmkJut3/btosRnR"

--=-9VIb2FmkJut3/btosRnR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 25.08.2010, 08:43 -0600 schrieb AJ ONeal:
> Please give me feedback and I'll post this on the wiki.
>=20
> A task-oriented guide to creating a patch:
>=20
> > Let's say you create a new recipe and you'd like to submit it for inclu=
sion
> > (and you've already tested that it works, of course).
> >
> > 1. Now commit with a good strong helpful message

=E2=80=A6 explaining your changes in a way others get a short overview with=
out
looking at the code.

> >     git add recipes/nodejs/
> >     git commit # don't use the -m option
> >
> > 2. The message should look like this
> >
> >     added recipe for node.js

The rule is to give the recipe name at the beginning followed by a
colon.

> >     * added recipe for node.js (bug #5555 - no nodejs recipe)
> >     ** patched libev's wscript to not try to execute code
> >     ** patched node's wscript to not search in '/usr/include'
> >
> >     Signed-off-by: AJ ONeal <coolaj86@gmail.com>
> >
> > 3. Create your patch
> >
> >     git format-patch -1 # or however many commits are part of this chan=
ge

Signed-off-by line can be added automatically either using `-s` either
in 1. or 3.. I would recommend 3..

> > 3++. If you are submitting a second version also add "--subject-prefix
> > [v2]"

=E2=80=A6 to `git format-patch`.

> >     git send-email
> >
> > Your patch will be immediately visible on
> > http://patchwork.openembedded.org/patch/
> >
>=20
>=20
> > 4. Once your patch has been accepted or rejected, create an account and
> > update the status to "accepted" or "rejected"
> >
> > 4++. If you get soft-rejected (a lot of feedback), make the changes, su=
bmit
> > the next version,

=E2=80=A6 using `--subject-prefix` to mark the patch iteration.

> > and update the status of the previous patch to
> > "superseded"
> >
> > Appendix: Properly configuring git (using tekkub@gmail.com as an exampl=
e
> > user)
> >
> >     sudo apt-get install git-core git-email

Please use `sudo aptitude install git-core git-email` since it is the
recommended package tool by Debian. People preferring `apt-get` know how
to use it instead.

> >     git config --global user.name "Tekkub"
> >     git config --global user.email "tekkub@gmail.com"

These two should be given in 0. or 1. as they are also important for the
commit meta data.

> >     git config --global sendemail.smtpserver smtp.gmail.com
> >     git config --global sendemail.smtpserverport 587
> >     git config --global sendemail.smtpencryption tls
> >     git config --global sendemail.smtpuser tekkupl@gmail.com

Thank you for your work. I would suggest to include links to more in
depth information (commit policy, patchwork) after each section for a
clarification.


Thanks,

Paul

--=-9VIb2FmkJut3/btosRnR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx1NMQACgkQPX1aK2wOHVhqIwCfRbgBNmzy5wEH9Y0XMmjATtWS
vaoAnj13A4nIy/pc/Kk8T9Do2P9reQz1
=yTVS
-----END PGP SIGNATURE-----

--=-9VIb2FmkJut3/btosRnR--
