Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NRRHI-0001QU-Sv for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jan 2010 15:18:00 +0100
Received: from f053045068.adsl.alicedsl.de ([78.53.45.68]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NRRFN-0000aL-4W for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jan 2010 14:15:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1260822492.9310.16.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091212173311.GA3730@rhein.zuhause.netz>
	<1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091213141849.GG17995@ibawizard.net>
	<1260719131.3110.26.camel@mattotaupa.wohnung.familie-menzel.net>
	<1260818012.9310.9.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091214201018.GA26808@rhein.zuhause.netz>
	<1260822492.9310.16.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Sun, 03 Jan 2010 15:15:50 +0100
Message-ID: <1262528150.3326.46.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: package VDR for OE
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
X-List-Received-Date: Sun, 03 Jan 2010 14:18:00 -0000
X-Groupsio-MsgNum: 15340
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/lK27eamhbTfY6m8DodZ"

--=-/lK27eamhbTfY6m8DodZ
Content-Type: multipart/mixed; boundary="=-XJ3HWBSQweWX+ErrAlik"

--=-XJ3HWBSQweWX+ErrAlik
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 14.12.2009, 21:28 +0100 schrieb Paul Menzel:
> Am Montag, den 14.12.2009, 21:10 +0100 schrieb Henning Heinold:
> > On Mon, Dec 14, 2009 at 08:13:32PM +0100, Paul Menzel wrote:
> > > Could someone advise me on how to get VDR included officially into OE=
?
> > > Had someone time already to test the recipe?
> >=20
> > Please submit your recipe here with git format-patch. I will look into =
it.
>=20
> Thank you. I sent it already on yesterday 16:45 CET [1]. If you do not
> have it in your mailbox I can sent the attachment again.

Sorry to bother you again. I guess you had and have a lot of other
business to take care of.

I paste the patch into this message and also attach it.


Thanks,

Paul


> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-December=
/015599.html

--
=46rom bb3ddb5df2b506f67ebcc9f1ed9f09d80c16e1bf Mon Sep 17 00:00:00 2001
From: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Sat, 12 Dec 2009 10:17:52 +0100
Subject: [PATCH 1/1] Package VDR.

The upstream Makefile needs to be patched to use the headers from the
staging area.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 conf/checksums.ini               |    4 ++++
 recipes/vdr/files/fixpaths.patch |   11 +++++++++++
 recipes/vdr/vdr_1.7.10.bb        |   11 +++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/vdr/files/fixpaths.patch
 create mode 100644 recipes/vdr/vdr_1.7.10.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 3bf9854..e717f1b 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -27046,6 +27046,10 @@
sha256=3D05b473815f9706387a3c5eaeb4da2e492f624e0b7783432179454f9d69bb973c
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
diff --git a/recipes/vdr/files/fixpaths.patch
b/recipes/vdr/files/fixpaths.patch
new file mode 100644
index 0000000..418f2d9
--- /dev/null
+++ b/recipes/vdr/files/fixpaths.patch
@@ -0,0 +1,11 @@
+--- vdr/Makefile~fixpaths	2009-10-18 15:59:25.000000000 +0200
++++ vdr/Makefile	2009-12-13 12:28:22.000000000 +0100
+@@ -21,7 +21,7 @@
+ BINDIR   =3D $(PREFIX)/bin
+ LOCDIR   =3D ./locale
+ LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig
+-INCLUDES =3D -I/usr/include/freetype2
++INCLUDES =3D ${CFLAGS}
+=20
+ PLUGINDIR=3D ./PLUGINS
+ PLUGINLIBDIR=3D $(PLUGINDIR)/lib
diff --git a/recipes/vdr/vdr_1.7.10.bb b/recipes/vdr/vdr_1.7.10.bb
new file mode 100644
index 0000000..d9bcfb4
--- /dev/null
+++ b/recipes/vdr/vdr_1.7.10.bb
@@ -0,0 +1,11 @@
+DESCRIPTION =3D "Video Disk Recorder (VDR) is a digital sat-receiver
program using Linux and DVB technologies. It allows one to record MPEG2
streams, as well as output the stream to TV. It is also possible to
watch DVDs (hardware accelerated) with some comfort and use an IR remote
control."
+AUTHOR =3D "Klaus Schmidinger"
+LICENSE =3D "GPLv2"
+HOMEPAGE =3D "http://www.tvdr.de"
+
+DEPENDS =3D "fontconfig freetype gettext libcap jpeg"
+
+SRC_URI =3D "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2 \
+           file://fixpaths.patch;patch=3D1"
+
+CFLAGS_append +=3D " -I${STAGING_INCDIR}/freetype2"
--=20
1.6.5.4

--=-XJ3HWBSQweWX+ErrAlik
Content-Disposition: attachment; filename="0001-Package-VDR.patch"
Content-Type: text/x-patch; name="0001-Package-VDR.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBiYjNkZGI1ZGYyYjUwNmY2N2ViY2M5ZjFlZDlmMDlkODBjMTZlMWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFNhdCwgMTIgRGVjIDIwMDkgMTA6MTc6NTIgKzAxMDANClN1Ympl
Y3Q6IFtQQVRDSCAxLzFdIFBhY2thZ2UgVkRSLg0KDQpUaGUgdXBzdHJlYW0gTWFrZWZpbGUgbmVl
ZHMgdG8gYmUgcGF0Y2hlZCB0byB1c2UgdGhlIGhlYWRlcnMgZnJvbSB0aGUgc3RhZ2luZyBhcmVh
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBQYXVsIE1lbnplbCA8cGF1bGVwYW50ZXJAdXNlcnMuc291cmNl
Zm9yZ2UubmV0Pg0KLS0tDQogY29uZi9jaGVja3N1bXMuaW5pICAgICAgICAgICAgICAgfCAgICA0
ICsrKysNCiByZWNpcGVzL3Zkci9maWxlcy9maXhwYXRocy5wYXRjaCB8ICAgMTEgKysrKysrKysr
KysNCiByZWNpcGVzL3Zkci92ZHJfMS43LjEwLmJiICAgICAgICB8ICAgMTEgKysrKysrKysrKysN
CiAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvdmRyL2ZpbGVzL2ZpeHBhdGhzLnBhdGNoDQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHJlY2lwZXMvdmRyL3Zkcl8xLjcuMTAuYmINCg0KZGlmZiAtLWdpdCBhL2Nv
bmYvY2hlY2tzdW1zLmluaSBiL2NvbmYvY2hlY2tzdW1zLmluaQ0KaW5kZXggM2JmOTg1NC4uZTcx
N2YxYiAxMDA2NDQNCi0tLSBhL2NvbmYvY2hlY2tzdW1zLmluaQ0KKysrIGIvY29uZi9jaGVja3N1
bXMuaW5pDQpAQCAtMjcwNDYsNiArMjcwNDYsMTAgQEAgc2hhMjU2PTA1YjQ3MzgxNWY5NzA2Mzg3
YTNjNWVhZWI0ZGEyZTQ5MmY2MjRlMGI3NzgzNDMyMTc5NDU0ZjlkNjliYjk3M2MNCiBtZDU9ZDk3
YThkYmM3Mjk0MmM1NzU0MmY1MDMyMmI1MzhhNDgNCiBzaGEyNTY9MDViNDczODE1Zjk3MDYzODdh
M2M1ZWFlYjRkYTJlNDkyZjYyNGUwYjc3ODM0MzIxNzk0NTRmOWQ2OWJiOTczYw0KIA0KK1tmdHA6
Ly9mdHAudHZkci5kZS92ZHIvRGV2ZWxvcGVyL3Zkci0xLjcuMTAudGFyLmJ6Ml0NCittZDU9Yzc0
ZWU5NjZiYWNhMWM0N2VkNmI5ZTJiZTNkMTYzOWINCitzaGEyNTY9MTY1YmZjZDgxMWVmOTJjYWI1
MGQxMWE4OGE3NmM0ODFlMTA1Njg5NDM4OTI5NDE0ZDI3ZWRmYWNmYjMxMmY1Mg0KKw0KIFtmdHA6
Ly9mdHAuYmlsbHNnYW1lcy5jb20vdW5peC94L3ZlY3Rvcm9pZHMvc3JjL3ZlY3Rvcm9pZHMtMS4x
LjAudGFyLmd6XQ0KIG1kNT1jNjNjZTU2YjA5YWE3ZGE5YTZlOTVkODA0ZTllZTMxNA0KIHNoYTI1
Nj04ZDE0ZGQyODE3NjdlOTk0MTA4YWJkNzdjOGU2N2Q1YTE3NzE4ZDBhZDFlMzRkMzdlMDI2OTEx
ZDE0Njk3YjJlDQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy92ZHIvZmlsZXMvZml4cGF0aHMucGF0Y2gg
Yi9yZWNpcGVzL3Zkci9maWxlcy9maXhwYXRocy5wYXRjaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAuLjQxOGYyZDkNCi0tLSAvZGV2L251bGwNCisrKyBiL3JlY2lwZXMvdmRy
L2ZpbGVzL2ZpeHBhdGhzLnBhdGNoDQpAQCAtMCwwICsxLDExIEBADQorLS0tIHZkci9NYWtlZmls
ZX5maXhwYXRocwkyMDA5LTEwLTE4IDE1OjU5OjI1LjAwMDAwMDAwMCArMDIwMA0KKysrKyB2ZHIv
TWFrZWZpbGUJMjAwOS0xMi0xMyAxMjoyODoyMi4wMDAwMDAwMDAgKzAxMDANCitAQCAtMjEsNyAr
MjEsNyBAQA0KKyBCSU5ESVIgICA9ICQoUFJFRklYKS9iaW4NCisgTE9DRElSICAgPSAuL2xvY2Fs
ZQ0KKyBMSUJTICAgICA9IC1sanBlZyAtbHB0aHJlYWQgLWxkbCAtbGNhcCAtbHJ0IC1sZnJlZXR5
cGUgLWxmb250Y29uZmlnDQorLUlOQ0xVREVTID0gLUkvdXNyL2luY2x1ZGUvZnJlZXR5cGUyDQor
K0lOQ0xVREVTID0gJHtDRkxBR1N9DQorIA0KKyBQTFVHSU5ESVI9IC4vUExVR0lOUw0KKyBQTFVH
SU5MSUJESVI9ICQoUExVR0lORElSKS9saWINCmRpZmYgLS1naXQgYS9yZWNpcGVzL3Zkci92ZHJf
MS43LjEwLmJiIGIvcmVjaXBlcy92ZHIvdmRyXzEuNy4xMC5iYg0KbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCmluZGV4IDAwMDAwMDAuLmQ5YmNmYjQNCi0tLSAvZGV2L251bGwNCisrKyBiL3JlY2lwZXMv
dmRyL3Zkcl8xLjcuMTAuYmINCkBAIC0wLDAgKzEsMTEgQEANCitERVNDUklQVElPTiA9ICJWaWRl
byBEaXNrIFJlY29yZGVyIChWRFIpIGlzIGEgZGlnaXRhbCBzYXQtcmVjZWl2ZXIgcHJvZ3JhbSB1
c2luZyBMaW51eCBhbmQgRFZCIHRlY2hub2xvZ2llcy4gSXQgYWxsb3dzIG9uZSB0byByZWNvcmQg
TVBFRzIgc3RyZWFtcywgYXMgd2VsbCBhcyBvdXRwdXQgdGhlIHN0cmVhbSB0byBUVi4gSXQgaXMg
YWxzbyBwb3NzaWJsZSB0byB3YXRjaCBEVkRzIChoYXJkd2FyZSBhY2NlbGVyYXRlZCkgd2l0aCBz
b21lIGNvbWZvcnQgYW5kIHVzZSBhbiBJUiByZW1vdGUgY29udHJvbC4iDQorQVVUSE9SID0gIkts
YXVzIFNjaG1pZGluZ2VyIg0KK0xJQ0VOU0UgPSAiR1BMdjIiDQorSE9NRVBBR0UgPSAiaHR0cDov
L3d3dy50dmRyLmRlIg0KKw0KK0RFUEVORFMgPSAiZm9udGNvbmZpZyBmcmVldHlwZSBnZXR0ZXh0
IGxpYmNhcCBqcGVnIg0KKw0KK1NSQ19VUkkgPSAiZnRwOi8vZnRwLnR2ZHIuZGUvdmRyL0RldmVs
b3Blci8ke1B9LnRhci5iejIgXA0KKyAgICAgICAgICAgZmlsZTovL2ZpeHBhdGhzLnBhdGNoO3Bh
dGNoPTEiDQorDQorQ0ZMQUdTX2FwcGVuZCArPSAiIC1JJHtTVEFHSU5HX0lOQ0RJUn0vZnJlZXR5
cGUyIg0KLS0gDQoxLjYuNS40DQoNCg==

--=-XJ3HWBSQweWX+ErrAlik--

--=-/lK27eamhbTfY6m8DodZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktAppYACgkQPX1aK2wOHVjhmACeP0iuGnRc1tGPC+FLDPM9StUH
MwYAmgJJeP2UEwOAbPo2eCSUBuisQgPO
=71W8
-----END PGP SIGNATURE-----

--=-/lK27eamhbTfY6m8DodZ--
