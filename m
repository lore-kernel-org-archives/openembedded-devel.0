Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4zL3-00014Q-1e for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 19:05:33 +0200
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4zKg-0001uH-SI for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 17:05:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Oct 2010 19:05:09 +0200
Message-ID: <1286730309.3808.88.camel@mattotaupa>
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
Subject: Preferred handling of pkg-config in cross compile environments.
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
X-List-Received-Date: Sun, 10 Oct 2010 17:05:33 -0000
X-Groupsio-MsgNum: 24612
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Kyd+pRcETKdYw2VroVj2"

--=-Kyd+pRcETKdYw2VroVj2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I stumbled upon several programs who call plain `pkg-config` [1][2].

Is the following statement correct?

To be able to cross compile programs correctly, the build files are
supposed to use the environment variable `PKG_CONFIG` and only call
pkg-config directly if `PKG_CONFIG` is empty.

        if test -z "${PKG_CONFIG}"; then
            PKG_CONFIG=3D"pkg-config"

If you agree I would note that somewhere in the Wiki, so that upstream
can be pointed to some documentation and search the Web will result in
some useful results.


Thanks,

Paul


[1] http://git.gnome.org/browse/gobject-introspection/tree/gir/Makefile.am?=
id=3Db89a110fdd9f6a0c4c0291a6016cb154bb715b0a

--=-Kyd+pRcETKdYw2VroVj2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyx8kQACgkQPX1aK2wOHViEVwCfS3yheGVLg75EDt7fh9Maq4nt
locAnA3aaDUTuXfEdV3CYEe3w1sn1/2Z
=Dg2F
-----END PGP SIGNATURE-----

--=-Kyd+pRcETKdYw2VroVj2--
