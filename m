Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NJQUL-0005Nn-Gq for openembedded-devel@lists.openembedded.org;
	Sat, 12 Dec 2009 12:50:20 +0100
Received: from g225139006.adsl.alicedsl.de ([92.225.139.6]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NJQSi-0002tU-23 for openembedded-devel@lists.openembedded.org;
	Sat, 12 Dec 2009 11:48:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Dec 2009 12:48:40 +0100
Message-ID: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: package VDR for OE
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
X-List-Received-Date: Sat, 12 Dec 2009 11:50:21 -0000
X-Groupsio-MsgNum: 15024
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-aw+ryJC/19Wd0N9t2Ugf"

--=-aw+ryJC/19Wd0N9t2Ugf
Content-Type: multipart/mixed; boundary="=-AVbcNRgpWH2W3ULCdbKI"

--=-AVbcNRgpWH2W3ULCdbKI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE hackers,


I am trying to write a recipe for The Video Disc Recorder (VDR) [1] and
get it into OE.

Unfortunately I have never done this and I also do not know much about
things related to compiling.

I tried to follow [2] and [3] and came up with the following which is
not much as you can see and in addition does not work yet.

The problem I am facing is, that in the Makefile of VDR [4] there is

        [=E2=80=A6]
        LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype
        -lfontconfig
        INCLUDES =3D -I/usr/include/freetype
        [=E2=80=A6]

so that the path `/usr/include/freetype/` is passed to the make command
which of course fails trying to cross compile the program.

        CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/fr=
eetype2
        cc1plus: internal compiler error: in add_path, at c-incpath.c:425

Now, if I understand it correctly by looking at other recipes there is
EXTRA_OEMAKE =3D "" where I should be able to set the INCLUDEPATH to the
OE build environment. Is that correct.

Could you please also tell me what the recipe variable name is for libs?


Thank you,

Paul


[1] http://www.tvdr.de
[2] http://wiki.openmoko.org/wiki/BitBake_recipe
[3] http://docs.openembedded.org/usermanual/html/recipes_directories.html
[4] http://git.gekrumbel.de/vdr.git?p=3Dvdr.git;a=3Dblob;f=3DMakefile;h=3D7=
03b801f623d16d9f3e872716a2646d908f35273;hb=3Dea01358b3bca9d55402ba632c95cdd=
6458abfdb3


diff --git a/conf/checksums.ini b/conf/checksums.ini
index 3bf9854..e717f1b 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -27046,6 +27046,10 @@ sha256=3D05b473815f9706387a3c5eaeb4da2e492f624e0b7=
7834321
 md5=3Dd97a8dbc72942c57542f50322b538a48
 sha256=3D05b473815f9706387a3c5eaeb4da2e492f624e0b7783432179454f9d69bb973c
=20
+[ftp://ftp.tvdr.de/vdr/Developer/vdr-1.7.10.tar.bz2]
+md5=3Dc74ee966baca1c47ed6b9e2be3d1639b
+sha256=3D165bfcd811ef92cab50d11a88a76c481e105689438929414d27edfacfb312f52
+
 [ftp://ftp.billsgames.com/unix/x/vectoroids/src/vectoroids-1.1.0.tar.gz]
 md5=3Dc63ce56b09aa7da9a6e95d804e9ee314
 sha256=3D8d14dd281767e994108abd77c8e67d5a17718d0ad1e34d37e026911d14697b2e

--=-AVbcNRgpWH2W3ULCdbKI
Content-Disposition: attachment; filename="vdr_1.7.10.bb"
Content-Type: text/plain; name="vdr_1.7.10.bb"; charset="UTF-8"
Content-Transfer-Encoding: base64

REVTQ1JJUFRJT04gPSAiVmlkZW8gRGlzayBSZWNvcmRlciAoVkRSKSBpcyBhIGRpZ2l0YWwgc2F0
LXJlY2VpdmVyIHByb2dyYW0gdXNpbmcgTGludXggYW5kIERWQiB0ZWNobm9sb2dpZXMuIEl0IGFs
bG93cyBvbmUgdG8gcmVjb3JkIE1QRUcyIHN0cmVhbXMsIGFzIHdlbGwgYXMgb3V0cHV0IHRoZSBz
dHJlYW0gdG8gVFYuIEl0IGlzIGFsc28gcG9zc2libGUgdG8gd2F0Y2ggRFZEcyAoaGFyZHdhcmUg
YWNjZWxlcmF0ZWQpIHdpdGggc29tZSBjb21mb3J0IGFuZCB1c2UgYW4gSVIgcmVtb3RlIGNvbnRy
b2wuIg0KQVVUSE9SID0gIktsYXVzIFNjaG1pZGluZ2VyIg0KTElDRU5TRSA9ICJHUEx2MiINCkhP
TUVQQUdFID0gImh0dHA6Ly93d3cudHZkci5kZSINCg0KREVQRU5EUyA9ICJmb250Y29uZmlnIGZy
ZWV0eXBlIGdldHRleHQgbGliY2FwIGpwZWciDQoNClNSQ19VUkkgPSAiZnRwOi8vZnRwLnR2ZHIu
ZGUvdmRyL0RldmVsb3Blci8ke1B9LnRhci5iejIiDQoNCg0KRVhUUkFfT0VNQUtFID0gIiINCg==

--=-AVbcNRgpWH2W3ULCdbKI--

--=-aw+ryJC/19Wd0N9t2Ugf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAksjgw8ACgkQPX1aK2wOHViM5wCfZipKsbbqX5d6zyhkaRlelp4h
Cl4AmgP3J2CRHU2FdrcjR3v0LuN28HLW
=UkPE
-----END PGP SIGNATURE-----

--=-aw+ryJC/19Wd0N9t2Ugf--
