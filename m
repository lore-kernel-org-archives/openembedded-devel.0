Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vitap@ti.com>) id 1RQJgt-00087m-Tx
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 15:08:48 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAFE2Nhu002386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2011 08:02:24 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id pAFE2N7s018376
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2011 08:02:23 -0600 (CST)
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAFE2IZq006368
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2011 08:02:23 -0600 (CST)
Received: from DNCE03.ent.ti.com ([fe80::19cb:d761:16a6:9b51]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Tue, 15 Nov 2011 15:02:18 +0100
From: "Preskovsky, Vita" <vitap@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] FW: [PATCH] bluez4: Add version 4.95 - resend
Thread-Index: AQHMou01AJ5W+gbT30+/bj2aIsvJHJWslZEQgAAFMoCAAQLFUA==
Date: Tue, 15 Nov 2011 14:02:17 +0000
Message-ID: <99AD691F1FA415449470C6EA37B6FE46087152@DNCE03.ent.ti.com>
References: <99AD691F1FA415449470C6EA37B6FE46086140@DNCE03.ent.ti.com>
	<j9rliq$8on$1@dough.gmane.org>
In-Reply-To: <j9rliq$8on$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: FW: [PATCH] bluez4: Add version 4.95 - resend
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
X-List-Received-Date: Tue, 15 Nov 2011 14:08:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen,
Sorry for inconvenience. I created public repository at github.com. Please,=
 take the patch at:
git://github.com/vitapr/recipes.git

Thank you,
Vita.


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
Sent: Monday, November 14, 2011 8:10 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] FW: [PATCH] bluez4: Add version 4.95 - resend

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This one has the subject mangled again. Can you please fix your send-email
so that I can pull it from patchwork or put up a public tree where the
patches can be git-pulled from?



Op 14-11-11 17:53, Preskovsky, Vita schreef:
> Second version of the patch adresses comments made by community members.
> Checked on angstrom, version 2011.09. --- recipes/bluez/bluez4_4.95.bb |
> 30 ++++++++++++++++++++++++++++++ 1 files changed, 30 insertions(+), 0
> deletions(-) create mode 100644 recipes/bluez/bluez4_4.95.bb
>=20
> diff --git a/recipes/bluez/bluez4_4.95.bb b/recipes/bluez/bluez4_4.95.bb=
=20
> new file mode 100644 index 0000000..290dff6 --- /dev/null +++
> b/recipes/bluez/bluez4_4.95.bb @@ -0,0 +1,30 @@ +require bluez4.inc +=20
> +SRC_URI =3D "\ +
> ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \ +
> file://bluetooth.conf \ +" +SRC_URI[md5sum] =3D
> "341294b2849a04a4afff5c96bfbf30b2" +SRC_URI[sha256sum] =3D
> "d6ea9de410fc2bcd2620d709c2202893b218e2e6a55c3c0ce6bebd27fa4120f6" +=20
> +DEFAULT_PREFERENCE =3D "-1" +DEFAULT_PREFERENCE_angstrom =3D "1" + +DEPE=
NDS
> +=3D "libsndfile1" + +PR =3D "${INC_PR}.0" + +# Not all distros have a re=
cent
> enough udev +BTUDEV =3D " --disable-udevrules" +BTUDEV_angstrom =3D "
> --enable-udevrules" +BTUDEV_shr =3D " --enable-udevrules" + +EXTRA_OECONF
> +=3D "${BTUDEV}" +do_configure_append(){ +	echo "#define
> LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE" >> ${S}/config.h +} +=20
> +FILES_${PN}-dbg +=3D "\ +  ${base_libdir}/udev/.debug \ +
> ${libdir}/*/.debug \ +"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7BWZMACgkQMkyGM64RGpEoBACeMFGP32P0Xtn50p8X28RzZbCT
0joAn1mAaM4it7LQITrfsu3bVjT+v8wA
=3DZ/8+
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


