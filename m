Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1LmSdH-0005c3-Bq
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 13:54:59 +0100
Received: (qmail invoked by alias); 25 Mar 2009 12:53:22 -0000
Received: from p579E1008.dip.t-dialin.net (EHLO [192.168.4.51]) [87.158.16.8]
	by mail.gmx.net (mp065) with SMTP; 25 Mar 2009 13:53:22 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX195chFrict5bh9zirA/nVGy22btqIEpqrcu1dSnMw
	j4b5KTC9dG43Ks
Message-ID: <49CA28F4.9020001@gmx.net>
Date: Wed, 25 Mar 2009 13:52:04 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.66
Subject: RFC: rework llvm recipes
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
X-List-Received-Date: Wed, 25 Mar 2009 12:55:02 -0000
X-Groupsio-MsgNum: 8702
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig469F1A84BB7F4F3E50396A50"

--------------enig469F1A84BB7F4F3E50396A50
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
LLVM does not support upward and downwards compatibility. As such I
would like to rework the llvm recipes to be installed separately.

Hence llvm is rather complicated to build I would like to drop all
version below 2.4. Is that OK?

I would also like to drop 2.4 because it is the last one that uses a
autoconf-based build system. 2.5 introduces one that is based on cmake
and which causes much less grief. :|

llvm_2.4 (if someone is against dropping) will become llvm2.4_2.4.bb
llvm_2.5 will become llvm2.5_2.5.bb. The same goes for the native variant=
s.

For the llvm-config file I will introduce a wrapper that expects the
variable LLVM_VERSION being set and then calls llvm-config-$LLVM_VERSION.=


Recipes using llvm or llvm-native should set this variable correctly.

Please post something about this proposal otherwise I will start it soon
and push it in roughly a week.

Regards
Robert


--------------enig469F1A84BB7F4F3E50396A50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAknKKPQACgkQG9cfwmwwEtrtdACaAuKUrdf+I5kZCf2zFwkTKvRg
DboAn3UBy/DzuNBPYM2NQDlKddD3J3WR
=zvPz
-----END PGP SIGNATURE-----

--------------enig469F1A84BB7F4F3E50396A50--
