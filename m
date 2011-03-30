Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q4tJR-0005Eh-Q2 for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 13:11:47 +0200
Received: from f053043231.adsl.alicedsl.de ([78.53.43.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q4tHP-0006OY-7y for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 11:09:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 13:09:37 +0200
Message-ID: <1301483378.10697.16.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: e-image-core: task rootfs fails because dependency `evas-engine-gl-x11` is not satisfied
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
X-List-Received-Date: Wed, 30 Mar 2011 11:11:47 -0000
X-Groupsio-MsgNum: 30721
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-TmFV5HT2BBoNxJNC8pbr"

--=-TmFV5HT2BBoNxJNC8pbr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task rootfs of `bitbake e-image-core` with `minimal` for `MACHINE =3D
"beagleboard"` fails with the following error message.

        [=E2=80=A6]
        Configuring eglibc-localedata-i18n.
        Configuring xf86-input-mouse.
        Configuring udev.
        Configuring tinylogin.
        Configuring xf86-input-evdev.
        Configuring sysvinit.
        Collected errors:
         * satisfy_dependencies_for: Cannot satisfy the following dependenc=
ies for task-e-x11-core:
         *      evas-engine-gl-x11 *=20
         * opkg_install_cmd: Cannot install package task-e-x11-core.
         * resolve_conffiles: Existing conffile /oe/build-minimal-eglibc/mi=
nimal-dev/rootfs/e-image-core/etc/device_table is different from the conffi=
le in the new package. The new conffile will be placed at /oe/build-minimal=
-eglibc/minimal-dev/rootfs/e-image-core/etc/device_table-opkg.

How can this dependency be satisfied?

`recipes/tasks/task-e-x11.bb` runtime depends on `expedite` which in
return runtime depends on `evas-engine-gl-x11`. Where is the problem?


Thanks,

Paul

--=-TmFV5HT2BBoNxJNC8pbr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2TD3EACgkQPX1aK2wOHVhjNACfRTpCxXMj1vkC/EZsH8wQIGpC
8SgAnjITnyuZa3FiQyx0EGSZXG4IDiAf
=SujS
-----END PGP SIGNATURE-----

--=-TmFV5HT2BBoNxJNC8pbr--
