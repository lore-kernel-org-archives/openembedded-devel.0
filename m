Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C491C719DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 13:38:31 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1cQa9f-0001xY-6W from Joe_MacDonald@mentor.com ;
	Mon, 09 Jan 2017 05:38:31 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Mon, 9 Jan 2017
	05:38:30 -0800
Received: by burninator (Postfix, from userid 1000)	id D1A785805F6; Mon,  9
	Jan 2017 08:38:29 -0500 (EST)
Date: Mon, 9 Jan 2017 08:38:29 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Message-ID: <20170109133828.GB21527@mentor.com>
References: <1483345698-2761-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<20170105180258.GA3243@jama>
	<CAKuJqM83ELOk+n=gGNzdqqNLHFXwdB0=gWe-67hLVWV=pbx+Dg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKuJqM83ELOk+n=gGNzdqqNLHFXwdB0=gWe-67hLVWV=pbx+Dg@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] tcpdump: upgrade to 4.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2017 13:38:32 -0000
X-Groupsio-MsgNum: 64663
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] tcpdump: upgrade to 4.8.1] On 17.01.07 (=
Sat 10:12) Oleksandr Kravchuk wrote:

> Martin -
>=20
> Thank you for the comment. I will try to pay closer attention to
> warnings during testing in the future.
>=20
> I have sent a fix to the mailing list, "[meta-networking][PATCH]
> tcpdump: remove obsolete enable-ipv6 configure flag".

As far as I can tell, --disable-ipv6 is still a valid option for 4.7.4
and since your patch doing the update hasn't been merged yet, please
just send a v2 of the single patch.  There's no need for two.

Thanks.
-J.

>=20
> On 5 January 2017 at 19:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Mon, Jan 02, 2017 at 09:28:18AM +0100, Oleksandr Kravchuk wrote:
> >> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> >
> > Causes:
> > ERROR: tcpdump-4.8.1-r0 do_configure: QA Issue: tcpdump: configure was =
passed unrecognised options: --enable-ipv6 [unknown-configure-option]
> > ERROR: tcpdump-4.8.1-r0 do_configure: Fatal QA errors found, failing ta=
sk.
> > ERROR: tcpdump-4.8.1-r0 do_configure: Function failed: do_qa_configure
> >
> >> ---
> >>  .../recipes-support/tcpdump/{tcpdump_4.7.4.bb =3D> tcpdump_4.8.1.bb} =
   | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.7.4.bb =3D>=
 tcpdump_4.8.1.bb} (91%)
> >>
> >> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb =
b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
> >> similarity index 91%
> >> rename from meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> >> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
> >> index e18228f..18efb9b 100644
> >> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> >> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
> >> @@ -12,8 +12,8 @@ SRC_URI =3D " \
> >>      file://add-ptest.patch \
> >>      file://run-ptest \
> >>  "
> >> -SRC_URI[md5sum] =3D "58af728de36f499341918fc4b8e827c3"
> >> -SRC_URI[sha256sum] =3D "6be520269a89036f99c0b2126713a60965953eab92100=
2b07608ccfc0c47d9af"
> >> +SRC_URI[md5sum] =3D "32f57943649f276e09236ba66622bb0c"
> >> +SRC_URI[sha256sum] =3D "20e4341ec48fcf72abcae312ea913e6ba6b958617b2f3=
fb496d51f0ae88d831c"
> >>  export LIBS=3D" -lpcap"
> >>
> >>  inherit autotools-brokensep ptest
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20
>=20
>=20
> --=20
> echo "EOF" >> /var/tmp/email
--=20
-Joe MacDonald.
:wq

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYc5JSAAoJEEn8ffcsOfaWo54IAMJ0u3qF7/P424mrhB7djXss
ZpMPju+eIX7ciJ3XfP9ed1RoPoNgQ7YJtZkczjBwy6yRgXczj1JIj4pK0qXG2e3I
lbryYxYwgDemlGVTc+VXQNOtDXu6X5eKTDJXhcOoQH52UTyjjhf1gwcE4vMn6OJU
AlkD8tnnqMn9+Ig7KsB6s57Wh5AG0EYzdd2KqbVnnTlyAO6mOv+CtlQjv41HyhAI
ztHPtEYidgY9Rdi5SIwTU2I8eqmL1mu3+gsI+OmiwtmU79t6uLZEFXCyG/Dv1syt
OiXoBWNeCClY1iOjZv8CJl2k2v8M+uS0eX+i5UpBP5lUbcTil2+Q9e2chaplJhI=
=ra0g
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
