Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P9krY-0006vN-81 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 22:38:48 +0200
Received: from f053039124.adsl.alicedsl.de ([78.53.39.124]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P9kqx-00077Q-18 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 20:38:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Oct 2010 22:38:09 +0200
Message-ID: <1287866289.1800.15.camel@mattotaupa>
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
Subject: x11-image: `opkg_install_cmd: Cannot install package locale-base-fr-fr`
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
X-List-Received-Date: Sat, 23 Oct 2010 20:38:48 -0000
X-Groupsio-MsgNum: 25390
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-fJCtifd8AA8NiBcMQe8c"

--=-fJCtifd8AA8NiBcMQe8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


doing `bitbake x11-image` the distributions `minimal` and `minimal-libc`
(`LIBC =3D "libc"`) fail with the following error in task `do_rootfs`.

        [=E2=80=A6]
        | Collected errors:
        |  * resolve_conffiles: Existing conffile /oe/build-minimal-eglibc/=
minimal-dev/rootfs/x11-image/etc/device_table is different from the conffil=
e in the new package. The new conffile will be placed at /oe/build-minimal-=
eglibc/minimal-dev/rootfs/x11-image/etc/device_table-opkg.
        |  * opkg_install_cmd: Cannot install package locale-base-fr-fr.
        | ERROR: Function do_rootfs failed
        NOTE: package x11-image-1.0-r0: task do_rootfs: Failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/images/x11-image.bb do_roo=
tfs failed
        ERROR: Task 13 (/oe/openembedded/recipes/images/x11-image.bb, do_ro=
otfs) failed with 256
        ERROR: '/oe/openembedded/recipes/images/x11-image.bb' failed
        ERROR: '/oe/openembedded/recipes/images/x11-image.bb' failed
        ERROR: '/oe/openembedded/recipes/images/x11-image.bb' failed

I have the following in my `local.conf`.

        DISTRO =3D "minimal"
       =20
        ENABLE_BINARY_LOCALE_GENERATION =3D "0"
        GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"

Could that be the reason for the failure. But if I remember correctly,
some months ago, `x11-image` build fine.

I will try with `angstrom-2008.1` and `angstrom-2010.x` next.


Thanks,

Paul
       =20

--=-fJCtifd8AA8NiBcMQe8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzDR7EACgkQPX1aK2wOHVikCwCfS1E3EtxKQOQujCAM0PYo7kzU
dMAAn3+bdfJkj8lfnUjIdLXiFdnAScKq
=mj/C
-----END PGP SIGNATURE-----

--=-fJCtifd8AA8NiBcMQe8c--
