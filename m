Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JxZeZ-0000o6-KC
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 May 2008 05:33:44 +0200
Received: by wa-out-1112.google.com with SMTP id j37so1221565waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2008 20:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type:date:message-id:mime-version:x-mailer;
	bh=T/fkMooPimu49aX/OSNDXdppM946F4y0Eqk6W7Cbb6Q=;
	b=s7U4Ydbl8wOVEN8hBDp6VCTnhsCKv/dFJtLhqHg06d7K1yBUXBOJGOBhtIFMoxBvj5kmqd94x9IGRwnWjo0bkeT04XEjBzeViL0aZj/iYZLCZUmckLgGgCjYEZNoVvwdzO2A3Qcq0CFAYpd3iG572RgRD8xaUTBsE7Qfnpfw6so=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer;
	b=nqxjX0Dx2K/N1dmpUqM8bwadowiTgoPcVctKhNK3lanCdOm0lROtA+4fyR8TI1KDJ4HSc3hZoYbGeCStn5Yy7nJWd24SS2UPVPZvB4zL1utbOJfrYElS91GbtRsFN85rU6skn4sG3igUKB+4X6HwKKADOEeNRUk/sgpScUIFR/M=
Received: by 10.114.151.13 with SMTP id y13mr5707851wad.134.1211081498584;
	Sat, 17 May 2008 20:31:38 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.23.244])
	by mx.google.com with ESMTPS id y25sm10109391pod.8.2008.05.17.20.31.37
	(version=SSLv3 cipher=RC4-MD5); Sat, 17 May 2008 20:31:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Sat, 17 May 2008 20:31:35 -0700
Message-Id: <1211081495.8550.60.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Subject: scp-argument-fix.patch is not needed for dropbear 0.50
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 18 May 2008 03:33:44 -0000
X-Groupsio-MsgNum: 5204
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-6AYf8ls/sKQ4c/KdyGYn"

--=-6AYf8ls/sKQ4c/KdyGYn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

This commit here

http://lists.linuxtogo.org/pipermail/openembedded-commits/2008-May/014777.h=
tmlhttp://lists.linuxtogo.org/pipermail/openembedded-commits/2008-May/01477=
7.html

applied scp-argument-fix.patch to all versions of dropbear. However this
patch is not needed for dropbear 0.50 e.g. Only 0.49 requires it.

I have tested and applied the following patch

Thanks

-Khem

#
# old_revision [3290f95e113d0da965ed4791ceb9de80bb2b03bd]
#
# rename "packages/dropbear/dropbear/scp-argument-fix.patch"
#     to "packages/dropbear/dropbear-0.49/scp-argument-fix.patch"
#=20
# patch "packages/dropbear/dropbear.inc"
#  from [4ec56e07501d1a5accce2d4e6240ee349005dd46]
#    to [6d50c1193e4d2fa9a7c6f85db6149b36aee06851]
#=20
# patch "packages/dropbear/dropbear_0.49.bb"
#  from [ca38761fd3af49819c41b42791592ee01c0d97cc]
#    to [251634540a152574b870f74866d793a0dedefae3]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/dropbear/dropbear.inc	4ec56e07501d1a5accce2d4e6240ee349005dd46
+++ packages/dropbear/dropbear.inc	6d50c1193e4d2fa9a7c6f85db6149b36aee06851
@@ -10,7 +10,6 @@ SRC_URI =3D "http://matt.ucc.asn.au/dropbe
 	   file://urandom-xauth-changes-to-options.h.patch;patch=3D1 \
 	   file://configure.patch;patch=3D1 \
 	   file://fix-2kb-keys.patch;patch=3D1 \
-	   file://scp-argument-fix.patch;patch=3D1 \
 	   file://allow-nopw.patch \
 	   file://init"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/dropbear/dropbear_0.49.bb	ca38761fd3af49819c41b42791592ee01c0d=
97cc
+++ packages/dropbear/dropbear_0.49.bb	251634540a152574b870f74866d793a0dede=
fae3
@@ -1,3 +1,5 @@
-PR =3D "r1"
+PR =3D "r2"
=20
 require dropbear.inc
+SRC_URI +=3D "file://scp-argument-fix.patch;patch=3D1 \
+	   "


--=-6AYf8ls/sKQ4c/KdyGYn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIL6MXHnJKy6V6em4RAlSUAJ9PDrbfjWy05YztnpTLNDtaMrm6UgCfdHrv
6uCb0USZYRic0ZtZbCNewe4=
=Ejmx
-----END PGP SIGNATURE-----

--=-6AYf8ls/sKQ4c/KdyGYn--
