Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NTght-0003Kh-OZ for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 20:10:44 +0100
Received: from g225140094.adsl.alicedsl.de ([92.225.140.94]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NTgfs-0006mL-QM for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 19:08:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 09 Jan 2010 20:08:35 +0100
Message-ID: <1263064115.14620.138.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] vdr: reorder recipe header and add SECTION
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
X-List-Received-Date: Sat, 09 Jan 2010 19:10:44 -0000
X-Groupsio-MsgNum: 15501
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iialta29eFHDURAwxuhi"

--=-iialta29eFHDURAwxuhi
Content-Type: multipart/mixed; boundary="=-z2YdvEaKfmd5Z2O3gnJp"

--=-z2YdvEaKfmd5Z2O3gnJp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE developers,


would `SECTION =3D console/multimedia` [1] be correct for VDR [2][3]?

As far as I know it does not need any X server to run. If yes, please
find the patch inlined and attached.


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/html/section_variable.html
[2] http://www.tvdr.de/
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/

---
=E2=80=A2 Order the recipe header as in the user manual [1] and add `SECTIO=
N =3D console/multimedia`.
=E2=80=A2 Bump package release variable.

[1] http://docs.openembedded.org/usermanual/html/recipes_header.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/vdr/vdr.inc       |    6 +++---
 recipes/vdr/vdr_1.7.10.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/vdr/vdr.inc b/recipes/vdr/vdr.inc
index 2e8cf40..1077af9 100644
--- a/recipes/vdr/vdr.inc
+++ b/recipes/vdr/vdr.inc
@@ -1,8 +1,8 @@
 DESCRIPTION =3D "Video Disk Recorder (VDR) is a digital sat-receiver progr=
am using Linux and DVB technologies. It allows one to record MPEG2 streams,=
 as well as output the stream to TV. It is also possible to watch DVDs (har=
dware accelerated) with some comfort and use an IR remote control."
-AUTHOR =3D "Klaus Schmidinger"
-LICENSE =3D "GPLv2"
 HOMEPAGE =3D "http://www.tvdr.de"
-
+SECTION =3D "console/multimedia"
+LICENSE =3D "GPLv2"
+AUTHOR =3D "Klaus Schmidinger"
 DEPENDS =3D "fontconfig freetype gettext libcap jpeg virtual/libintl"
=20
 SRC_URI =3D "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2"
diff --git a/recipes/vdr/vdr_1.7.10.bb b/recipes/vdr/vdr_1.7.10.bb
index 69ca012..de51214 100644
--- a/recipes/vdr/vdr_1.7.10.bb
+++ b/recipes/vdr/vdr_1.7.10.bb
@@ -1,5 +1,5 @@
 require vdr.inc
-PR =3D "r2"
+PR =3D "r3"
=20
 SRC_URI +=3D " file://fixpaths.patch;patch=3D1 \
            file://cplusplus.patch;patch=3D1 \
--=20
1.6.5.7


--=-z2YdvEaKfmd5Z2O3gnJp
Content-Disposition: attachment;
	filename="0001-vdr-reorder-recipe-header-and-add-SECTION.patch"
Content-Type: text/x-patch; name="0001-vdr-reorder-recipe-header-and-add-SECTION.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBiNTkxZTA0ZDMxMGYxMmMzNDcyYmIxZDdkNDdjNTNlOGNhMGJmNzYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFNhdCwgOSBKYW4gMjAxMCAxOTo1NTowNSArMDEwMA0KU3ViamVj
dDogW1BBVENIXSB2ZHI6IHJlb3JkZXIgcmVjaXBlIGhlYWRlciBhbmQgYWRkIFNFQ1RJT04NCk1J
TUUtVmVyc2lvbjogMS4wDQpDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgN
CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQNCg0K4oCiIE9yZGVyIHRoZSByZWNpcGUg
aGVhZGVyIGFzIGluIHRoZSB1c2VyIG1hbnVhbCBbMV0gYW5kIGFkZCBgU0VDVElPTiA9IGNvbnNv
bGUvbXVsdGltZWRpYWAuDQrigKIgQnVtcCBwYWNrYWdlIHJlbGVhc2UgdmFyaWFibGUuDQoNClsx
XSBodHRwOi8vZG9jcy5vcGVuZW1iZWRkZWQub3JnL3VzZXJtYW51YWwvaHRtbC9yZWNpcGVzX2hl
YWRlci5odG1sDQoNClNpZ25lZC1vZmYtYnk6IFBhdWwgTWVuemVsIDxwYXVsZXBhbnRlckB1c2Vy
cy5zb3VyY2Vmb3JnZS5uZXQ+DQotLS0NCiByZWNpcGVzL3Zkci92ZHIuaW5jICAgICAgIHwgICAg
NiArKystLS0NCiByZWNpcGVzL3Zkci92ZHJfMS43LjEwLmJiIHwgICAgMiArLQ0KIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
cmVjaXBlcy92ZHIvdmRyLmluYyBiL3JlY2lwZXMvdmRyL3Zkci5pbmMNCmluZGV4IDJlOGNmNDAu
LjEwNzdhZjkgMTAwNjQ0DQotLS0gYS9yZWNpcGVzL3Zkci92ZHIuaW5jDQorKysgYi9yZWNpcGVz
L3Zkci92ZHIuaW5jDQpAQCAtMSw4ICsxLDggQEANCiBERVNDUklQVElPTiA9ICJWaWRlbyBEaXNr
IFJlY29yZGVyIChWRFIpIGlzIGEgZGlnaXRhbCBzYXQtcmVjZWl2ZXIgcHJvZ3JhbSB1c2luZyBM
aW51eCBhbmQgRFZCIHRlY2hub2xvZ2llcy4gSXQgYWxsb3dzIG9uZSB0byByZWNvcmQgTVBFRzIg
c3RyZWFtcywgYXMgd2VsbCBhcyBvdXRwdXQgdGhlIHN0cmVhbSB0byBUVi4gSXQgaXMgYWxzbyBw
b3NzaWJsZSB0byB3YXRjaCBEVkRzIChoYXJkd2FyZSBhY2NlbGVyYXRlZCkgd2l0aCBzb21lIGNv
bWZvcnQgYW5kIHVzZSBhbiBJUiByZW1vdGUgY29udHJvbC4iDQotQVVUSE9SID0gIktsYXVzIFNj
aG1pZGluZ2VyIg0KLUxJQ0VOU0UgPSAiR1BMdjIiDQogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy50
dmRyLmRlIg0KLQ0KK1NFQ1RJT04gPSAiY29uc29sZS9tdWx0aW1lZGlhIg0KK0xJQ0VOU0UgPSAi
R1BMdjIiDQorQVVUSE9SID0gIktsYXVzIFNjaG1pZGluZ2VyIg0KIERFUEVORFMgPSAiZm9udGNv
bmZpZyBmcmVldHlwZSBnZXR0ZXh0IGxpYmNhcCBqcGVnIHZpcnR1YWwvbGliaW50bCINCiANCiBT
UkNfVVJJID0gImZ0cDovL2Z0cC50dmRyLmRlL3Zkci9EZXZlbG9wZXIvJHtQfS50YXIuYnoyIg0K
ZGlmZiAtLWdpdCBhL3JlY2lwZXMvdmRyL3Zkcl8xLjcuMTAuYmIgYi9yZWNpcGVzL3Zkci92ZHJf
MS43LjEwLmJiDQppbmRleCA2OWNhMDEyLi5kZTUxMjE0IDEwMDY0NA0KLS0tIGEvcmVjaXBlcy92
ZHIvdmRyXzEuNy4xMC5iYg0KKysrIGIvcmVjaXBlcy92ZHIvdmRyXzEuNy4xMC5iYg0KQEAgLTEs
NSArMSw1IEBADQogcmVxdWlyZSB2ZHIuaW5jDQotUFIgPSAicjIiDQorUFIgPSAicjMiDQogDQog
U1JDX1VSSSArPSAiIGZpbGU6Ly9maXhwYXRocy5wYXRjaDtwYXRjaD0xIFwNCiAgICAgICAgICAg
IGZpbGU6Ly9jcGx1c3BsdXMucGF0Y2g7cGF0Y2g9MSBcDQotLSANCjEuNi41LjcNCg0K

--=-z2YdvEaKfmd5Z2O3gnJp--

--=-iialta29eFHDURAwxuhi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktI1DIACgkQPX1aK2wOHVhvCACggIdh7K8uIwN6ogXPKwRaaMi6
dwIAn1rvfpwHZBlxJLZOER8Hh8XI4pQm
=5hdv
-----END PGP SIGNATURE-----

--=-iialta29eFHDURAwxuhi--
