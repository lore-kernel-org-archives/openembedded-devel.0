Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4Unz-00037c-NX for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 10:29:24 +0200
Received: from f053037130.adsl.alicedsl.de ([78.53.37.130]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4Une-0002j9-M9 for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 08:29:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 09 Oct 2010 10:29:01 +0200
Message-ID: <1286612941.3831.24.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: DEPENDS not honored: `do_configure` runs before `do_populate_sysroot` of dependencies
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
X-List-Received-Date: Sat, 09 Oct 2010 08:29:24 -0000
X-Groupsio-MsgNum: 24553
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-fRRG1QIUgIM8/cSdRnGa"

--=-fRRG1QIUgIM8/cSdRnGa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


if recipe B depends on A, I noticed that B=E2=80=99s `do_configure` is run
before all operations of A are complete, that means all tasks after
`do_install` like `do_populate_sysroot`.

Here is my concrete example.

Running

        $ bitbake console-image

with `minimal-uclibc` for `MACHINE =3D "beagleboard"`
`virtual:native:libgee_0.6.0.bb` failed to build for me (same error as
in [1]). `do_configure` did not find a file which is provided by
`gobject-introspection-native` which was recently added to `DEPENDS` [2]
to fix [1].

Before the failure the last completed task of
`gobject-introspection-native` was

        NOTE: Running task 1929 of 3724 (ID: 3078, virtual:native:/oe/opene=
mbedded/recipes/gobject-introspection/gobject-introspection_0.9.10.bb, do_i=
nstall)
        NOTE: package gobject-introspection-native-0.9.10-r0: task do_insta=
ll: Started
        NOTE: package gobject-introspection-native-0.9.10-r0: task do_insta=
ll: Succeeded

and then `do_configure` of `libgee-native` was already run. Building
`gobject-introspection-native` manually I saw that there was a task
`do_populate_sysroot`. With this task completed `libgee-native` was
build successful.

Is that a BitBake error?


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/02=
5125.html
    "libgee_0.6.0: gee/Makefile.am:95: HAVE_INTROSPECTION does not appear i=
n AM_CONDITIONAL"
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D72c2ac9=
40065948cb688fde821e51efac6b71b4b

--=-fRRG1QIUgIM8/cSdRnGa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkywJ8cACgkQPX1aK2wOHVjiyACghcv0Qf0XOCc6PEQ/Xw076+ce
PL4AnRGgOREKtnhfQEhcfaWAW3gybFU/
=vlAm
-----END PGP SIGNATURE-----

--=-fRRG1QIUgIM8/cSdRnGa--
