Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1Mt0EX-000202-7i
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 16:32:48 +0200
Received: by ewy20 with SMTP id 20so60300ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:mime-version:content-type:content-transfer-encoding
	:message-id; bh=DsP6xk3Dx/NyuthlmH9F9avpxb810OKh+ZhnJ0L997g=;
	b=DPqmFoRnN+wbvrfOoanqhrAVeKCgtnuUO6UuAZvIqF9vzJjZlM9qRn588sw0shtp5C
	+8jS/Ui3ZEsKERj9ZdD0b4pP9nd+i7zyA7MW58PMQsNIexkSqU+1poJT9lkSSamlt5oN
	XM0YTB0g9zloPtXfWLY+dHVF4NJ03pSOLbwbQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	b=FbQ1GJnJp+zuy6md+2bHd4ohv8BToczFBqAz6m7D9/MiiRNY72sI0BuVOU9k0O6exX
	yafhaCwVm5lnmZoKPSE0rhSELi82hKJZQrxETsRhYMez2YTuqAfhjkpF7l98iJl+6vNV
	653Y/r0Z+Sw/S3B+7uckie6eYb9/Txlbhx43I=
Received: by 10.211.128.9 with SMTP id f9mr6964270ebn.93.1254321121270;
	Wed, 30 Sep 2009 07:32:01 -0700 (PDT)
Received: from anarsoul-laptop.localnet ([212.98.167.157])
	by mx.google.com with ESMTPS id 7sm353429eyb.44.2009.09.30.07.31.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Sep 2009 07:31:59 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2009 17:31:16 +0300
User-Agent: KMail/1.12.1 (Linux/2.6.31-gentoo-anarsoul; KDE/4.3.1; i686; ; )
MIME-Version: 1.0
Message-Id: <200909301731.27447.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.220
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix RX1950 config file
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
X-List-Received-Date: Wed, 30 Sep 2009 14:32:49 -0000
X-Groupsio-MsgNum: 13279
Content-Type: multipart/signed; boundary="nextPart1946759.zVUXs1o3U4";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1946759.zVUXs1o3U4
Content-Type: multipart/mixed;
  boundary="Boundary-01=_1u2wKWbktr0UCsx"
Content-Transfer-Encoding: 7bit

--Boundary-01=_1u2wKWbktr0UCsx
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



--Boundary-01=_1u2wKWbktr0UCsx
Content-Type: text/x-patch;
  charset="us-ascii";
  name="0001-Fix-RX1950-config-file.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
	filename="0001-Fix-RX1950-config-file.patch"

=46rom d8d033a579d19579d30b651f1def324fa8633315 Mon Sep 17 00:00:00 2001
=46rom: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 30 Sep 2009 17:29:24 +0300
Subject: [PATCH] Fix RX1950 config file

HP iPAQ RX1950 has no bluetooth, and its flash size is 64M

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
=2D--
 conf/machine/rx1950.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/rx1950.conf b/conf/machine/rx1950.conf
index 1495e86..fb70437 100644
=2D-- a/conf/machine/rx1950.conf
+++ b/conf/machine/rx1950.conf
@@ -10,12 +10,12 @@ TARGET_ARCH =3D "arm"
 # Samsung S3C2xxx CPU
 require conf/machine/include/tune-arm920t.inc
=20
=2DROOT_FLASH_SIZE =3D "32"
+ROOT_FLASH_SIZE =3D "64"
 VOLATILE_STORAGE_SIZE =3D "64"
 MACHINE_GUI_CLASS =3D "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS =3D "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS =3D "320"
=2DMACHINE_FEATURES =3D "kernel26 touchscreen apm alsa irda bluetooth wifi =
usbgadget screen vfat"
+MACHINE_FEATURES =3D "kernel26 touchscreen apm alsa irda wifi usbgadget sc=
reen vfat"
=20
 #
 # Software/packages selection
=2D-=20
1.6.5.rc1


--Boundary-01=_1u2wKWbktr0UCsx--

--nextPart1946759.zVUXs1o3U4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrDa78ACgkQRM6pQpltKE7NvwCfbEEmLTzpRA7ntcSBHbrNTmmP
IosAmgOTKs1P76/YMqk7thGNxxJODUjN
=IvDt
-----END PGP SIGNATURE-----

--nextPart1946759.zVUXs1o3U4--
