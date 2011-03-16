Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzrFZ-0004s1-SW for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 14:59:14 +0100
Received: from f053032013.adsl.alicedsl.de ([78.53.32.13]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzrDx-0002bA-1b for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 13:57:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 14:57:16 +0100
Message-ID: <1300283836.3840.83.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: navit_svn: task fetch fails with `svn: Failed to add directory 'navit': an unversioned directory of the same name already exists`
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
X-List-Received-Date: Wed, 16 Mar 2011 13:59:34 -0000
X-Groupsio-MsgNum: 30269
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-x+9oC4u2OD15NpoGM3dQ"

--=-x+9oC4u2OD15NpoGM3dQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


using `minimal` or `minimal-uclibc` task fetch of `navit_svn.bb` fails
with the following error message.

        $ bitbake -D -c fetch -b /oe/openembedded/recipes/navit/navit_svn.b=
b
        NOTE: package navit-1_0.2.0+svnr4345-r8.12: task do_fetch: Started
        NOTE: Update svn://anonymous@navit.svn.sourceforge.net/svnroot/navi=
t/trunk;module=3Dnavit;proto=3Dhttps
        DEBUG: Running /usr/bin/env svn --non-interactive update --username=
 anonymous -r 4345
        DEBUG: Running export HOME=3D"/home/joe"; export PATH=3D"/oe//bin:/=
oe/build-minimal-eglibc//bin:/oe/openembedded//bin:/oe/build-minimal-eglibc=
/minimal-dev/sysroots/i686-linux/usr/armv7a/bin:/oe/build-minimal-eglibc/mi=
nimal-dev/sysroots/i686-linux/usr/sbin:/oe/build-minimal-eglibc/minimal-dev=
/sysroots/i686-linux/usr/bin:/oe/build-minimal-eglibc/minimal-dev/sysroots/=
i686-linux/sbin:/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux//b=
in:/oe/bitbake/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"; /=
usr/bin/env svn --non-interactive update --username anonymous -r 4345
        svn: Failed to add directory 'navit': an unversioned directory of t=
he same name already exists
        NOTE: package navit-1_0.2.0+svnr4345-r8.12: task Fetch failed: Unab=
le to fetch URL svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/tru=
nk;module=3Dnavit;proto=3Dhttps from any source.: Failed
        ERROR: Function 'Fetch failed: Unable to fetch URL svn://anonymous@=
navit.svn.sourceforge.net/svnroot/navit/trunk;module=3Dnavit;proto=3Dhttps =
from any source.' failed
        ERROR: Task 0 (/oe/openembedded/recipes/navit/navit_svn.bb, do_fetc=
h) failed with exit code '1'
        ERROR: '/oe/openembedded/recipes/navit/navit_svn.bb' failed

Looking at the download directory the checkout of the Subversion
repository already has this directory which has been =E2=80=93 I guess =E2=
=80=93 created
by `navit-icons_svn.bb`.

        $ ls -a ~/oe/downloads/svn/navit.svn.sourceforge.net/svnroot/navit/=
trunk/navit
        .  ..  cmake  navit  .svn  Toolchain
        $ ls -a /home/paul/oe/downloads/svn/navit.svn.sourceforge.net/svnro=
ot/navit/trunk/navit/navit/
        .  ..  xpm

Do the recipes need to share the same repository?


Thanks,

Paul

--=-x+9oC4u2OD15NpoGM3dQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2AwbwACgkQPX1aK2wOHVhi7ACfd4DdXpRxT0FZJs4x7Q0NBgdf
o+MAn24e/CmLkVY1zniB8Paax/uH4KDs
=MrkR
-----END PGP SIGNATURE-----

--=-x+9oC4u2OD15NpoGM3dQ--
