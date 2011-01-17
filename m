Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PenJ9-00023n-MI for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 12:31:35 +0100
Received: from f053038247.adsl.alicedsl.de ([78.53.38.247]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PenIa-0008UM-I8 for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 11:31:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <42777734-3F25-41F9-8FAD-40B6BF4959A4@mac.com>
References: <42777734-3F25-41F9-8FAD-40B6BF4959A4@mac.com>
Date: Mon, 17 Jan 2011 12:30:59 +0100
Message-ID: <1295263859.4844.45.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: How to copy local recipe file to target root filesystem /etc folder
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
X-List-Received-Date: Mon, 17 Jan 2011 11:31:35 -0000
X-Groupsio-MsgNum: 28092
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xihXztLZIIPtMEk+BAeG"

--=-xihXztLZIIPtMEk+BAeG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Elvis,


Am Montag, den 17.01.2011, 14:17 +0400 schrieb Elvis Dowson:

>       I have an OE recipe that I created to automatically login to the be=
agleboard. I have added the autologin recipe to the omap3-console-image.bb =
recipe.
>=20
> Would someone happen to know what OE command I should insert into a recip=
e, that will allow me to copy a file from the autologin recipe folder to th=
e target root filesystem /etc folder?
>=20
> cp inittab-autologin <TARGET-ROOTFS>/etc/inittab
> cp autologin.profile <TARGET-ROOTFS>/etc

It should be something similar to what is for example done in
`recipes/busybox/busybox_1.1x.inc` [1].

        do_install_append() {
            install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
            install -d ${D}${sysconfdir}/init.d/
            install -d ${D}${sysconfdir}/mdev
            install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir=
}/mdev/
            install -m 0755 ${WORKDIR}/usb.sh ${D}${sysconfdir}/mdev/
            install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
       =20
            if grep "CONFIG_UDHCPD=3Dy" ${WORKDIR}/defconfig; then
                  install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdi=
r}/init.d/
            fi
       =20
            if grep "CONFIG_UDHCPC=3Dy" ${WORKDIR}/defconfig; then
                  install -d ${D}${sysconfdir}/udhcpc.d
                  install -d ${D}${datadir}/udhcpc
                  install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir=
}/udhcpc.d/50default
                  install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/=
udhcpc/default.script
            fi
        }


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/busybox=
/busybox_1.1x.inc?id=3Da3d8ebc6318b72c03cd6b626efcbd5186234b32d#n43

--=-xihXztLZIIPtMEk+BAeG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk00KHMACgkQPX1aK2wOHVhNTwCffH5suEYXkOCivT7cXJ3l5dDk
6m4AnRvBgFuRPrvb5xk2bp6pOPJXHNc+
=aqJq
-----END PGP SIGNATURE-----

--=-xihXztLZIIPtMEk+BAeG--
