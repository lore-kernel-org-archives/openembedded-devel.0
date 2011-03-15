Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzRhQ-000402-0M for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 11:42:00 +0100
Received: from f053032095.adsl.alicedsl.de ([78.53.32.95]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzRfo-00068I-Es for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 10:40:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Mar 2011 11:40:19 +0100
Message-ID: <1300185619.3759.155.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: removal of `angstrom-2008.1` in dev and needed updates
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
X-List-Received-Date: Tue, 15 Mar 2011 10:42:00 -0000
X-Groupsio-MsgNum: 30220
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Jpb8rEnIaTSLUb4u//al"

--=-Jpb8rEnIaTSLUb4u//al
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


in case you are using `angstrom-2008.1` and are getting the following
error message

        $ bitbake -k some-recipe
        ERROR: Error parsing /home/paul/oe/openembedded/recipes/images/uml-=
image.bb: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass
        ERROR: Command execution failed: Exited with 1

it means that `conf/distro/angstrom-2008.1.conf` was removed in [1].

        commit 67a7c91a4eeed0a5b48f99d98ec9bb54ba6ea120
        Author: Koen Kooi <koen@openembedded.org>
        Date:   Wed Mar 9 14:51:10 2011 +0100
       =20
            angstrom 2008.1: remove from .dev
           =20
            This will be maintained in the 2011.03-maintenance branch
           =20
            Signed-off-by: Koen Kooi <koen@openembedded.org>

It looks like some other configurations files and comments still refer
to `angstrom-2008.1` though and probably need an update.

        conf/distro/amsdelta-oe.conf:require conf/distro/angstrom-2008.1.co=
nf
        conf/distro/angstrom-2010.x.conf:# If you want something stable *ri=
ght now*, use angstrom-2008.1
        conf/distro/angstrom-2010.x.conf:# Again, in doubt, use DISTRO=3D"a=
ngstrom-2008.1"
        conf/distro/foonas.conf:require conf/distro/angstrom-2008.1.conf
        conf/distro/iphone-compat.conf:require conf/distro/angstrom-2008.1.=
conf
        conf/distro/nylon.conf:require conf/distro/angstrom-2008.1.conf
        conf/local.conf.sample:# DISTRO =3D "angstrom-2008.1"
        contrib/angstrom/local.conf:DISTRO =3D "angstrom-2008.1"
        contrib/buildbot/scripts/full-oe-autobuild:     echo 'DISTRO =3D "a=
ngstrom-2008.1"' >> "$CONFFILE"
        contrib/testing/testbuilder/README:bitbake (e.g. angstrom-2008.1/qe=
muarm/console-image).
        contrib/testing/testbuilder/README:    ./testbuilder -D angstrom-20=
08.1 -M qemuarm console-image
        contrib/testing/testbuilder/README:    ./testbuilder -D angstrom-20=
08.1 -M qemuarm -S
        contrib/testing/testbuilder/testbuilder.d/testing.conf.sample:DISTR=
OS=3D"angstrom-2008.1 angstrom-2010.x"
        docs/usermanual/chapters/getting_oe.xml:DISTRO =3D "angstrom-2008.1=
"
        recipes/linux/linux-2.6.29/cm-x270/0004-add-build-script.patch:+CRO=
SS_COMPILER_PATH=3D`cd /build/oe/oe-stable/build/angstrom-2008.1/tmp/cross/=
armv5te/bin; pwd`


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D67a7c91=
a4eeed0a5b48f99d98ec9bb54ba6ea120

--=-Jpb8rEnIaTSLUb4u//al
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1/QhMACgkQPX1aK2wOHVgI2QCaA/nQ/gGYZPom640LnvxGs6J/
kioAn3b7uZZNsQkzmZFVyfePc0U9kDOX
=lqps
-----END PGP SIGNATURE-----

--=-Jpb8rEnIaTSLUb4u//al--
