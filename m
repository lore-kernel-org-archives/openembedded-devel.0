Received: from [82.192.226.27] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1N3y6p-0004PA-RE
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 21:30:10 +0100
Received: from dizzy-6.localnet ([::ffff:192.168.2.122])
	(TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by koffein with esmtp; Fri, 30 Oct 2009 23:04:32 +0100
	id 0000000000013E15.000000004AEB62F0.00000BC1
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2009 21:30:05 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31.1; KDE/4.3.2; x86_64; ; )
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{); h
	=s@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')Ul8f}F%1vdg9|52W=Xs
	rR^/E/SPo^{-R22[a}c?@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA; *0A,6>
	*GY(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(32pVlT:=&
	i4l[3%?Z<zzP~wGSke?1VJj\cd~Z(,Upc;nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
Mime-Version: 1.0
Message-Id: <200910302130.17290.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 82.192.226.27
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] htc-msm7.inc
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
X-List-Received-Date: Fri, 30 Oct 2009 20:30:11 -0000
X-Groupsio-MsgNum: 13743
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="=_koffein-3011-1256940272-0001-2"

--=_koffein-3011-1256940272-0001-2
Content-Type: multipart/mixed;
  boundary="Boundary-01=_Nz06KbJTSisIYMX"
Content-Transfer-Encoding: 7bit

--Boundary-01=_Nz06KbJTSisIYMX
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=46or htcdream (for example) is an yaffs2-image needed for flashing into=20
internal memory.
The IMAGE_FSTYPES in the machine declaration did prohibit that.
ROOTFS type should be declared in conf/local.conf and NOT in machine specs.

greatings
	leviathan

--Boundary-01=_Nz06KbJTSisIYMX
Content-Type: text/x-patch;
  charset="ISO-8859-1";
  name="fix_machine.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="fix_machine.patch"

commit 4425a0bd614a63c4e5d977115ac7d81993c4bfa1
Author: David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>
Date:   Fri Oct 30 21:24:47 2009 +0100

    ROOTFS type should be declared in conf/local.conf and NOT in machine sp=
ecs

diff --git a/conf/machine/include/htc-msm7.inc b/conf/machine/include/htc-m=
sm7.inc
index 5d7596f..f2164bd 100644
--- a/conf/machine/include/htc-msm7.inc
+++ b/conf/machine/include/htc-msm7.inc
@@ -15,9 +15,6 @@ MACHINE_CLASS =3D "htc-msm7"
 # features
 MACHINE_FEATURES =3D "kernel26 touchscreen screen phone gps usb keyboard"
=20
-# filesystems
-IMAGE_FSTYPES =3D "tar.gz"
-
 # CPU
 require conf/machine/include/tune-arm1136-novfp.inc
=20

--Boundary-01=_Nz06KbJTSisIYMX--

--=_koffein-3011-1256940272-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrrTNkACgkQAeZw77btGjp+GgCcDTNBR3dEdBuanzPnZh9E+3SV
0bcAnR7DMyzkjvh6tQmLeAaoS4wWR/7R
=elfI
-----END PGP SIGNATURE-----

--=_koffein-3011-1256940272-0001-2--
