Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PJn1w-0000vt-Me for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 13:59:01 +0100
Received: from f053039076.adsl.alicedsl.de ([78.53.39.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PJn0r-00079e-9K for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 12:57:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Nov 2010 13:57:51 +0100
Message-ID: <1290257871.3928.24.camel@mattotaupa>
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
Subject: x11-image: task `rootfs` fails with `opkg_install_cmd: Cannot install package locale-base-fr-fr.`
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
X-List-Received-Date: Sat, 20 Nov 2010 12:59:01 -0000
X-Groupsio-MsgNum: 26349
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-faP45wVlm6MlXB79M8sv"

--=-faP45wVlm6MlXB79M8sv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`bitbake -k x11-image` fails for me with the following error.

        Build Configuration:
        BB_VERSION        =3D "1.10.0"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "18e9ef"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "minimal"
        DISTRO_VERSION    =3D "dev-snapshot-20101120"
        TARGET_FPU        =3D "hard"
        [=E2=80=A6]
        | Configuring psplash.
        | Configuring sysvinit.
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
        ERROR: Task 31 (/oe/openembedded/recipes/images/x11-image.bb, do_ro=
otfs) failed with 256
        NOTE: package console-image-1.0-r0: task do_rootfs: Succeeded
        NOTE: Running task 7023 of 7029 (ID: 8, /oe/openembedded/recipes/im=
ages/console-image.bb, do_build)
        NOTE: package console-image-1.0-r0: task do_build: Started
        NOTE: package console-image-1.0-r0: task do_build: Succeeded
        NOTE: Running task 7024 of 7029 (ID: 15, /oe/openembedded/recipes/i=
mages/console-image.bb, do_rm_work)
        NOTE: package console-image-1.0-r0: task do_rm_work: Started
        NOTE: package console-image-1.0-r0: task do_rm_work: Succeeded
        ERROR: '/oe/openembedded/recipes/images/x11-image.bb' failed
        NOTE: Running task 7025 of 7029 (ID: 16, /oe/openembedded/recipes/i=
mages/console-image.bb, do_rm_work_all)
        NOTE: package console-image-1.0-r0: task do_rm_work_all: Started
        NOTE: package console-image-1.0-r0: task do_rm_work_all: Succeeded
        ERROR: '/oe/openembedded/recipes/images/x11-image.bb' failed
        ERROR: '/oe/openembedded/recipes/images/x11-image.bb' failed

I have seen this error for several months so I think it is no recent
commit that is causing this.


Thanks,

Paul

--=-faP45wVlm6MlXB79M8sv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkznxcIACgkQPX1aK2wOHVhCLgCfbesb7zU7DVt21OlUAbtc92dc
01AAn2xKao6dM/aoDA8q5tO7P8b8VbTv
=qqIF
-----END PGP SIGNATURE-----

--=-faP45wVlm6MlXB79M8sv--
