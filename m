Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4uTs-00020V-VL for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 13:54:43 +0200
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4uTW-0004GH-MC for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 11:53:58 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Oct 2010 13:53:57 +0200
Message-ID: <1286711637.3808.42.camel@mattotaupa>
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
Subject: Inclusion of `gobject-introspection` breaks several packages.
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
X-List-Received-Date: Sun, 10 Oct 2010 11:55:24 -0000
X-Groupsio-MsgNum: 24602
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-e19VmwwWkj/7LwraUnDt"

--=-e19VmwwWkj/7LwraUnDt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`gobject-introspection` got added in 143188 [1] to get `libgee_0.6.0` to
build [2].

As a consequence the configure script of a lot of packages like `gtk+`,
`atk`, `gstreamer` detects the presence of GObject Introspection and
enables it.

        $ ./configure --help
        [=E2=80=A6]
          --enable-introspection=3D[no/auto/yes]
                                  Enable introspection for this build
        [=E2=80=A6]

Auto detection seems to be the default.

        [=E2=80=A6]
        configure:12206: checking for gobject-introspection
        configure:12237: $PKG_CONFIG --exists --print-errors "gobject-intro=
spection-1.0 >=3D 0.6.7"
        configure:12240: $? =3D 0
        configure:12251: result: yes
        [=E2=80=A6]

Now for example Pango 1.10.0 does not generate a `gir` file, which was
enabled again in a later release [3]. This breaks building for example
`gtk+` [4].

The question is how to proceed.

1. Somehow excluding `gobject-introspection` from images.
2. Would packaging gir-repository [5] help?
3. Pass `--enable-introspection=3Dno` by default to the configure script.
4. Add `--enable-introspection=3Dno` to all relevant packages.
5. Update to new versions supporting GObject Introspection correctly.

What do you think?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1431887=
2c0063d26c246a35b373dbfaf4f4c6587
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D64a53b0=
ab6695b9ec4e327524fb41a916067bbfd
[3] http://git.gnome.org/browse/pango/commit/?id=3D078300ef69ab0855a7cc3950=
3880cbc8b2e23494
[4] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/02=
5174.html (patch is wrong though)
[5] http://git.gnome.org/browse/gir-repository/tree/

--=-e19VmwwWkj/7LwraUnDt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyxqVUACgkQPX1aK2wOHVhqpQCfX0TICCDc5FZu89XzxEuyDw7S
0IsAn13jnLbQiTxr/vPkFu5Za3n52LeZ
=JL5v
-----END PGP SIGNATURE-----

--=-e19VmwwWkj/7LwraUnDt--
