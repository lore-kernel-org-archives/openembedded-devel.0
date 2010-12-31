Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYbhB-0001Fy-M5 for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 10:54:49 +0100
Received: from f053039212.adsl.alicedsl.de ([78.53.39.212]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYbgv-0005oB-Gl; Fri, 31 Dec 2010 09:54:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Dec 2010 10:54:32 +0100
Message-ID: <1293789272.6161.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] testbuilder/README: correct grammar and markup in Markdown [1]
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
X-List-Received-Date: Fri, 31 Dec 2010 09:54:49 -0000
X-Groupsio-MsgNum: 27599
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-SA1H9x8l82t5/QAxY5oc"

--=-SA1H9x8l82t5/QAxY5oc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 31 Dec 2010 10:43:44 +0100

[1] http://daringfireball.net/projects/markdown/

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Yuri Bushmelev <jay4mail@gmail.com>
---
I am no native English speaker, so some corrections are probably incorrect.
---
 contrib/testing/testbuilder/README |   47 ++++++++++++++++++++------------=
----
 1 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/contrib/testing/testbuilder/README b/contrib/testing/testbuild=
er/README
index a8d5aea..fe78105 100644
--- a/contrib/testing/testbuilder/README
+++ b/contrib/testing/testbuilder/README
@@ -1,33 +1,38 @@
-=3D How to setup and use TestBuilder
+How to setup and use TestBuilder
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
=20
-I assume below that you wish install TestBuilder into ~/testbuilder direct=
ory.
+I assume below that you wish to install TestBuilder into `~/testbuilder` d=
irectory.
=20
-1. Copy files from OE contrib/testing/testbuilder directory to any place y=
ou
-   wish to use (e.g. ~/testbuilder) and goto that directory
+1. Copy the files from OE `contrib/testing/testbuilder` directory to any p=
lace you
+   wish to use (e.g. `~/testbuilder`) and go to that directory.
=20
-2. Run setup-testbuilder script with OE branch and bitbake branch you wish=
 to
+2. Run the `setup-testbuilder` script with an OE branch and BitBake branch=
 you wish to
    use. E.g.:
-   ./setup-testbuilder "testing-next" "1.10"
-=20
-   It will clone OE and bitbake trees and prepare build/conf/local.conf fi=
le
-   for you. You can review local.conf after and add some settings there.
=20
-4. Create testbuilder.conf according your needs.  You can use
-   testbuilder.conf.sample as reference.
+       ./setup-testbuilder "testing-next" "1.10"
=20
-5. Run ./testbuilder and wait for build results. Check 'logs' subdir for l=
og
-   files ('tail logs/B.*' is useful)
+   It will clone the OE and BitBake trees and prepare the file `build/conf=
/local.conf`
+   for you. You can review `local.conf` afterward and add some settings th=
ere.
=20
-You can run single configured build (e.g. "testing")
-./testbuilder -B testing
+4. Create `testbuilder.conf` according to your needs. You can use
+   `testbuilder.conf.sample` as reference.
=20
-Or you can use testbuilder to build specified distro/machine/image
-(e.g. angstrom-2008.1/qemuarm/console-image)
-./testbuilder -D angstrom-2008.1 -M qemuarm console-image
+5. Run `./testbuilder` and wait for the build results. Check the `logs` su=
bdir for log
+   files (`tail logs/B.*` is useful)
=20
-If you wish only setup environment and run bitbake by hands you can
-use -S option:
-./testbuilder -D angstrom-2008.1 -M qemuarm -S
+You can run a single configured build (e.g. "testing").
+
+    ./testbuilder -B testing
+
+Or you can use TestBuilder to build a specific distro/machine/image
+(e.g. angstrom-2008.1/qemuarm/console-image).
+
+    ./testbuilder -D angstrom-2008.1 -M qemuarm console-image
+
+If you wish to only setup an environment and run BitBake by hand you can
+use the option `-S`.
+
+    ./testbuilder -D angstrom-2008.1 -M qemuarm -S
=20
 --=20
 Yury 'Jay7' Bushmelev
--=20
1.7.2.3

--=-SA1H9x8l82t5/QAxY5oc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0dqFIACgkQPX1aK2wOHVisKwCeM70+r4OkiDUcNhfe8t1BF5IM
TAUAniVxdKnwgcud1RpceleX+qsMyq1A
=yfsx
-----END PGP SIGNATURE-----

--=-SA1H9x8l82t5/QAxY5oc--
