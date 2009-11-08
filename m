Received: from [93.188.72.201] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1N77CD-000085-Rn
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 13:48:44 +0100
Received: from dizzy-6.localnet ([::ffff:82.192.226.27])
	(AUTH: PLAIN david.lanzendoerfer@o2s.ch, TLS: TLSv1/SSLv3, 256bits,
	AES256-SHA) by koffein with esmtp; Sun, 08 Nov 2009 14:49:02 +0000
	id 000000000002ECD0.000000004AF6DA5E.00002B06
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Sun, 8 Nov 2009 13:47:23 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; x86_64; ; )
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{)
	=?utf-8?q?=3Bh=0A=09=3Ds?=@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')
	=?utf-8?q?Ul8f=7DF=251vdg9=7C52W=3DXs=0A=09rR=5E/E/SPo=5E=7B-R22=5Ba?=
	=?utf-8?q?=7Dc=3F?=@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA;*0A,6>
	=?utf-8?q?=0A=09*GY?=(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(
	=?utf-8?q?32pVlT=3A=3D=26=0A=09i4l=5B3=25=3FZ?=<zzP~wGSke?1VJj\cd~Z(,Upc;
	nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
Mime-Version: 1.0
Message-Id: <200911081347.28851.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 93.188.72.201
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Xorg for htcdream
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
X-List-Received-Date: Sun, 08 Nov 2009 12:48:45 -0000
X-Groupsio-MsgNum: 14002
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="=_koffein-11016-1257691742-0001-2"

--=_koffein-11016-1257691742-0001-2
Content-Type: multipart/mixed;
  boundary="Boundary-01=_b3r9Kacbq8KUhum"
Content-Transfer-Encoding: 7bit

--Boundary-01=_b3r9Kacbq8KUhum
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi folks
I added a new xorg.conf in order to be able to start xorg on devices like=20
htcdream.

greatings leviathan

--Boundary-01=_b3r9Kacbq8KUhum
Content-Type: text/plain;
  charset="ISO-8859-1";
  name="commit-d4dc631"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="commit-d4dc631"

commit d4dc63173726616d4ad5c1bf64f8a9002b6103d3
Author: David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>
Date:   Sun Nov 8 13:43:15 2009 +0100

    Added xorg.conf for htcdream in xserver-xorg

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/htcdream/xorg.conf b/re=
cipes/xorg-xserver/xserver-xorg-conf/htcdream/xorg.conf
new file mode 100644
index 0000000..8d07550
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/htcdream/xorg.conf
@@ -0,0 +1,81 @@
+Section "Monitor"
+	Identifier "Monitor0"
+	Mode "320x480"
+        	DotClock 0	=09
+		HTimings 320 320 320 320
+		VTimings 480 480 480 480
+		Flags    "-HSync" "-VSync"
+	EndMode
+EndSection   =20
+
+
+
+Section "Device"                                 =20
+        Identifier      "fbdev"
+        Driver  "fbdev"
+	Option "ShadowFB" "on"=20
+	#Option "Rotate" "CW"=20
+EndSection                                               =20
+
+
+Section "Screen"                                       =20
+        Identifier "Framebuffer"    =20
+        Device  "fbdev"           =20
+        Monitor "Monitor"              =20
+	DefaultFbBpp 16
+	SubSection "Display"
+		Depth 16
+        	Modes "320x480"
+	EndSubSection
+EndSection                                             =20
+
+Section "Screen"
+        Identifier "320x480x16"
+        Device  "fbdev"
+        Monitor "Monitor"
+        DefaultFbBpp 16
+        SubSection "Display"
+                Depth 16
+                Modes "320x480"
+        EndSubSection
+EndSection
+
+
+Section "ServerLayout"                                =20
+        Identifier      "Builtin Default Layout"                          =
          =20
+        Screen  "Framebuffer"       =20
+	#InputDevice "Trackball" "CorePointer"
+	InputDevice "Touchscreen" "CorePointer"
+        InputDevice "Keyboard" "CoreKeyboard"
+EndSection       =20
+
+Section "InputDevice"
+    Identifier "Trackball"
+    Driver     "evdev"
+    Option     "Device"        "/dev/input/event2"
+    Option     "ScreenNumber"  "0"
+    Option     "ReportingMode" "Raw"   =20
+    #Option     "ReportingMode" "Scaled"
+    #Option     "ButtonNumber"  "1"
+    #Option     "SendCoreEvents"
+EndSection
+
+Section "InputDevice"
+	Identifier 	"Touchscreen"
+	Driver     	"tslib"
+	Option     	"Device"        "/dev/input/event1"
+	Option  	"ScreenNumber"  "0"
+	Option 		"CorePointer"           "true"
+	Option          "SendCoreEvents"        "true"
+	Option          "Protocol"              "Auto"
+	Option          "Width"                 "320"
+	Option          "Height"                "480"
+	Option          "EmulateRightButton"    "1"
+	Option		"CorePointer"		"true"
+EndSection
+
+Section "InputDevice"
+        Identifier  "Keyboard"
+        Driver      "kbd"
+        Option      "XkbLayout" "en_US"
+EndSection

--Boundary-01=_b3r9Kacbq8KUhum--

--=_koffein-11016-1257691742-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkr2veAACgkQAeZw77btGjryVACgmg5ZELa0RYDkvCvpLJszuZbd
q64AoIUMG5/RG4diA1Tpdap9TpLBPHoB
=7KoV
-----END PGP SIGNATURE-----

--=_koffein-11016-1257691742-0001-2--
