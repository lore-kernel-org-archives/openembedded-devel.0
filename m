Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LRlsI-0003Vq-9I
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 12:12:58 +0100
Received: (qmail invoked by alias); 27 Jan 2009 11:05:24 -0000
Received: from unknown (EHLO [192.168.4.110]) [78.52.66.72]
	by mail.gmx.net (mp040) with SMTP; 27 Jan 2009 12:05:24 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+RcB0D4xuRTAOyceS81O9k3/hbBvZBBQ17sGizpE
	qrdzFuuG1MI4B6
Message-ID: <497EEAE6.7090904@gmx.net>
Date: Tue, 27 Jan 2009 12:07:18 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: RFC: thinking about DEPENDS properties
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
X-List-Received-Date: Tue, 27 Jan 2009 11:12:58 -0000
X-Groupsio-MsgNum: 7435
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig717D12C69E536C64F790AE12"

--------------enig717D12C69E536C64F790AE12
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
today I was thinking about some missing semantics in OE's DEPENDS
variable and had the idea of reusing the way we write SRC_URI entries
for them.

The issues:

1) Strong dependencies

Some recipes have a strong dependency on another recipe. Take llvm as an
example. llvm puts a bunch of static libraries (.a) and object code
files into staging which another program links to. So, if llvm is
recompiled (e.g. changed CFLAGS or applied a patch) those having a
dependency on llvm should be recompiled as well.

In order to express this, I would write:

DEPENDS +=3D "llvm;strong=3Dtrue"

2) Minimum & Maximum supported versions
Some recipes cannot be built with certain versions of other recipes.

DEPENDS +=3D "automake-native;minver=3D1.10"

If the distro uses a lower automake version OE should error out when
someone tries to build that recipe:

ERROR: Recipe 'foo' needs at least 'automake-native 1.10' but
'PREFERRED_VERSION_automake-native' is set to '1.9.6'.

--

I know this brings in a lot of complicated things to think about, e.g.
what is the result of:

foo.inc: DEPENDS =3D "bar;minver=3D0.8;maxver=3D0.9"

foo_1.0: require foo.inc
         DEPENDS +=3D "bar;minver=3D1.0"

Perhaps to many components in OE already expect DEPENDS to be a
whitespace separated list of words and we should be add another variable
whose only purpose is to set properties for existing DEPENDS entries:


foo_1.0:
 require foo.inc
 # Replaces value from foo.inc
 DEPENDSPROPS =3D "bar;minver=3D1.0"

--

My main concern is that the knowledge about which recipe can live in
harmony with another is currently implicit. There is no way to express
this except by writing a comment (which is almost never done).

Regards
Robert


--------------enig717D12C69E536C64F790AE12
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkl+6ukACgkQG9cfwmwwEtov1wCfe63CEF2PgMobLVBJrbCWXYKa
90YAnjXYvONWZ/Ya/PPpttaQoaa2Gv7Y
=lqHR
-----END PGP SIGNATURE-----

--------------enig717D12C69E536C64F790AE12--
