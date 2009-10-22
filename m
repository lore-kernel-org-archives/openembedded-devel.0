Received: from [82.192.226.27] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1N15RB-0000St-Qt
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 23:43:16 +0200
Received: from dizzy-6.localnet ([::ffff:192.168.2.122])
	(TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by koffein with esmtp; Thu, 22 Oct 2009 22:18:16 +0200
	id 0000000000013E09.000000004AE0BE08.0000458A
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 23:44:17 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31.1; KDE/4.3.1; x86_64; ; )
References: <200910222339.32881.david.lanzendoerfer@o2s.ch>
In-Reply-To: <200910222339.32881.david.lanzendoerfer@o2s.ch>
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{); h
	=s@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')Ul8f}F%1vdg9|52W=Xs
	rR^/E/SPo^{-R22[a}c?@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA; *0A,6>
	*GY(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(32pVlT:=&
	i4l[3%?Z<zzP~wGSke?1VJj\cd~Z(,Upc;nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
Mime-Version: 1.0
Message-Id: <200910222344.20662.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 82.192.226.27
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patches
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
X-List-Received-Date: Thu, 22 Oct 2009 21:43:16 -0000
X-Groupsio-MsgNum: 13559
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="=_koffein-17804-1256242696-0001-2"

--=_koffein-17804-1256242696-0001-2
Content-Type: multipart/mixed;
  boundary="Boundary-01=_xIN4K/8Kbd8OIGv"
Content-Transfer-Encoding: 7bit

--Boundary-01=_xIN4K/8Kbd8OIGv
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Another patch: to fix missing building of other filesystems then tar.gz-
rootfs-images.

greatings
	leviathan

--Boundary-01=_xIN4K/8Kbd8OIGv
Content-Type: text/plain;
  charset="ISO-8859-1";
  name="commit-2e5480c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="commit-2e5480c"

commit 2e5480c76bfb3961a5e559b76641c4cce5eb438d
Author: David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>
Date:   Thu Oct 22 23:41:45 2009 +0200

    Removed filesystems declaration from conf/machine/include/htc-msm7.inc =
because it should been already decleared in ${build}/conf/local.conf

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

--Boundary-01=_xIN4K/8Kbd8OIGv--

--=_koffein-17804-1256242696-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrg0jQACgkQAeZw77btGjqmEQCfab6Hr4EZ0iGyOFL7Q8ab0k9f
IioAoKSCxPnOzbjPxCWnxmK93CXxR6IO
=svYT
-----END PGP SIGNATURE-----

--=_koffein-17804-1256242696-0001-2--
