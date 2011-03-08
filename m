Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pwx5T-0007vY-Ra for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 14:36:31 +0100
Received: from f053034177.adsl.alicedsl.de ([78.53.34.177]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pwx40-0001z4-2Z for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 13:35:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 08 Mar 2011 14:34:58 +0100
Message-ID: <1299591298.3785.126.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: xfce4-session: task configure fails with `checking for iceauth... no`
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
X-List-Received-Date: Tue, 08 Mar 2011 13:36:31 -0000
X-Groupsio-MsgNum: 29988
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-AB+dzMqcv+3BsjIqQ0C8"

--=-AB+dzMqcv+3BsjIqQ0C8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task configure of `xfce4-session_4.6.2.bb` fails with the following
error message using any distribution (`minimal`, `angstrom-2008.1`).

        checking if the linker (arm-oe-linux-gnueabi-ld --sysroot=3D/oe/bui=
ld-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi) is GNU ld.=
.. (cached) yes
        checking whether to build with profiling support... no
        checking whether to compile with coverage profiling instrumentation=
... no
        checking whether to disable assertions... no
        checking whether to build final version... yes
        checking whether arm-oe-linux-gnueabi-ld --sysroot=3D/oe/build-mini=
mal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi accepts -O1... yes
        checking for iceauth... no
        configure: error: iceauth missing, please check your X11 installati=
on

In my build directory I get the following hits for =C2=BB*iceauth*=C2=AB.

        $ find . -iname *iceauth*
        ./minimal-dev/deploy/sources/MIT-X/iceauth
        ./minimal-dev/deploy/sources/MIT-X/iceauth/iceauth-1.0.4.tar.bz2
        ./minimal-dev/deploy/ipk/armv5te/iceauth-dbg_1.0.4-r5.0_armv5te.ipk
        ./minimal-dev/deploy/ipk/armv5te/iceauth-dev_1.0.4-r5.0_armv5te.ipk
        ./minimal-dev/deploy/ipk/armv5te/iceauth-doc_1.0.4-r5.0_armv5te.ipk
        ./minimal-dev/deploy/ipk/armv5te/iceauth_1.0.4-r5.0_armv5te.ipk
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_patch
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_package_stage
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_configure
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_unpack
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_setscene
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_compile
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_rm_work
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_package_stage_all
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_fetch
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_package_write
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_qa_configure
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_build
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_install
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_qa_staging
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_package
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_distribute_sources
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_package_write_ipk
        ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0.=
do_populate_sysroot
        ./minimal-dev/pstage/minimaleglibc/staging-iceauth-armv5te-oe-linux=
-gnueabi_1.0.4-r5.0_armv5te-linux-gnueabi.ipk
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/iceauth
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth.pack=
aged
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth-doc
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth-dbg.=
packaged
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth-dev
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth-dbg
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth-doc.=
packaged
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth-loca=
le
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth-dev.=
packaged
        ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth-stat=
ic
        ./minimal-dev/sysroots/armv5te-oe-linux-gnueabi/usr/share/man/man1/=
iceauth.1
        ./minimal-dev/work/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0
        ./minimal-dev/usr/lib/opkg/info/staging-iceauth-armv5te-oe-linux-gn=
ueabi.control
        ./minimal-dev/usr/lib/opkg/info/staging-iceauth-armv5te-oe-linux-gn=
ueabi.list=20

So nothing is in the `sysroot`. Building without `INHERIT +=3D "rm_work"`
I find the following.

        $ ls -l minimal-dev/work/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r=
5.0/package/usr/bin/iceauth=20
        -rwxr-xr-x 1 x x 16264 Mar  7 11:55 minimal-dev/work/armv5te-oe-lin=
ux-gnueabi/iceauth-1_1.0.4-r5.0/package/usr/bin/iceauth

Does anyone have an idea how this can be solved. `git grep iceauth`
indicates that only `xfce4-session_4.*` depends on `iceauth`.


Thanks,

Paul

--=-AB+dzMqcv+3BsjIqQ0C8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk12MIIACgkQPX1aK2wOHVgjGwCggDwQBssgMM4WiM8sCcOmdVMh
rPwAoIiDDqGrndpvbaPOZkj96go1d5Rn
=0SSf
-----END PGP SIGNATURE-----

--=-AB+dzMqcv+3BsjIqQ0C8--
