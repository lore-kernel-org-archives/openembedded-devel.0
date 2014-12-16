Return-Path: <urs@bytesatwork.ch>
X-Greylist: delayed 606 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Dec 2014 09:52:07 UTC
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id 45FB972598
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 09:52:07 +0000 (UTC)
Received: from [192.168.2.20] (201-97.77-83.cust.bluewin.ch [83.77.97.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: urs)
	by bytesatwork.ch (Postfix) with ESMTPSA id 5F4FE18004BC;
	Tue, 16 Dec 2014 10:38:59 +0100 (CET)
Message-ID: <548FFE67.6030104@bytesatwork.ch>
Date: Tue, 16 Dec 2014 10:41:59 +0100
From: =?UTF-8?B?VXJzIEbDpHNzbGVy?= <urs@bytesatwork.ch>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Cc: urs.fassler@bytesatwork.ch
Subject: [meta-qt5][daisy][PATCH] enclose exported variables for SDK in quotation marks to be compatible with sh
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Dec 2014 09:52:11 -0000
X-Groupsio-MsgNum: 53338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="h6SficUDIAnkQR5Tbe5lSIWSR6ITkpbwM"

--h6SficUDIAnkQR5Tbe5lSIWSR6ITkpbwM
Content-Type: multipart/mixed;
 boundary="------------030702050206000205030504"

--------------030702050206000205030504
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Otherwise, sourcing with sh does not work which is a problem when
source'd from a script.

--------------030702050206000205030504
Content-Type: text/x-patch;
 name="0001-enclose-exported-variables-for-SDK-in-quotation-mark.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-enclose-exported-variables-for-SDK-in-quotation-mark.pa";
 filename*1="tch"

From df950dda18f4d006bdadeba9cb35118eacd87cd0 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Urs=3D20F=3DC3=3DA4ssler?=3D <urs.fassler@bytesatwork.ch>
Date: Tue, 16 Dec 2014 10:03:45 +0100
Subject: [meta-qt5][daisy][PATCH] enclose exported variables for SDK in
 quotation marks to be compatible with sh
To: openembedded-devel@lists.openembedded.org

---
 classes/populate_sdk_qt5.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bb=
class
index 7b31bbb..a22bdb1 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -11,10 +11,10 @@ toolchain_create_sdk_env_script_append () {
     echo 'export OE_QMAKE_CFLAGS=3D"$CFLAGS"' >> $script
     echo 'export OE_QMAKE_CXXFLAGS=3D"$CXXFLAGS"' >> $script
     echo 'export OE_QMAKE_LDFLAGS=3D"$LDFLAGS"' >> $script
-    echo 'export OE_QMAKE_CC=3D$CC' >> $script
-    echo 'export OE_QMAKE_CXX=3D$CXX' >> $script
-    echo 'export OE_QMAKE_LINK=3D$CXX' >> $script
-    echo 'export OE_QMAKE_AR=3D$AR' >> $script
+    echo 'export OE_QMAKE_CC=3D"$CC"' >> $script
+    echo 'export OE_QMAKE_CXX=3D"$CXX"' >> $script
+    echo 'export OE_QMAKE_LINK=3D"$CXX"' >> $script
+    echo 'export OE_QMAKE_AR=3D"$AR"' >> $script
     echo 'export OE_QMAKE_LIBDIR_QT=3D${SDKTARGETSYSROOT}${OE_QMAKE_PATH_L=
IBS}' >> $script
     echo 'export OE_QMAKE_INCDIR_QT=3D${SDKTARGETSYSROOT}${OE_QMAKE_PATH_Q=
T_HEADERS}' >> $script
     echo 'export OE_QMAKE_MOC=3D${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}=
/moc' >> $script
--=20
2.1.3


--------------030702050206000205030504--

--h6SficUDIAnkQR5Tbe5lSIWSR6ITkpbwM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUj/5nAAoJEKKADLnESIBjMfoQAITyNxkyQmJz9ymFybUijz8+
IKu2Qz4GlQFQNHUZVambv5Xwp5x/yVyjcC7736NisnckdN3Wz1VoyS+QoZUreSCf
hFwBVe4B74V+jiBfN7YdMZHZ/QjfUewhInzW6FIWlFfBslPBPn4SUpJ9m5G1ePoL
d9b+b0IcmlaThfhEhD2SgcCbd5rZLEPfG19BKEwWfkDueIUvrgvbxjR2tJeQyezl
LizFF2Q85uAjn2AmbrPKPwn1m/N23FVrtOyRK+HuviOFWYGoKeFzN/ZwXoiGHoF0
Ix4M/lwGRuwN7lm4aedKUSZOpnKEBOzRZSJBOpEZ6uu3fRqZL+lLj2VWXoBh76Tq
5NZy5WVqd7efWRKGLY9/hfomcY9WNCi2wSw3x4Q2sYZx61xS3HBF9Qv9q0Sd52Yh
uJlMO9htefL1O6RRjPWPTXfzAFB+c0zj1fOTOYrjDTsxv7UoGzVMfEUeiR6ZEpIv
ifxGqICt8ZnoCNA7BQTB1tM0XfjnhjAS5Ywdau19KIasWM3ANkiAl/sRJUee0ePj
maoVKYVOHWaaAfx/8egHQUyMuYkuSEyxjuFIn5VENq0eDuVe8X6zlb4QvPpWTSpS
7psSUbyehGyB/pYyJnhZcN/t0ey9cNu1OAPqM3e39MxjsRQcIfTwCkI6tykPwRtp
HODVc1wGNs1pZJsJdNFP
=YdvS
-----END PGP SIGNATURE-----

--h6SficUDIAnkQR5Tbe5lSIWSR6ITkpbwM--
