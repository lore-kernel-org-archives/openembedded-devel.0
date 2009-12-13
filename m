Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NJonk-0006b2-R1 for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 14:47:59 +0100
Received: from g225081191.adsl.alicedsl.de ([92.225.81.191]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NJom6-0005ye-6q for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 13:46:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091212173311.GA3730@rhein.zuhause.netz>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091212173311.GA3730@rhein.zuhause.netz>
Date: Sun, 13 Dec 2009 14:46:20 +0100
Message-ID: <1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
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
X-List-Received-Date: Sun, 13 Dec 2009 13:47:59 -0000
X-Groupsio-MsgNum: 15030
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-oQ180V/oUWNpQk7X0dp+"

--=-oQ180V/oUWNpQk7X0dp+
Content-Type: multipart/mixed; boundary="=-Rxq36PkP49zvPur342aQ"

--=-Rxq36PkP49zvPur342aQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 12.12.2009, 18:33 +0100 schrieb Henning Heinold:
> On Sat, Dec 12, 2009 at 12:48:40PM +0100, Paul Menzel wrote:
> > I am trying to write a recipe for The Video Disc Recorder (VDR) [1] and
> > get it into OE.
> >=20
> > Unfortunately I have never done this and I also do not know much about
> > things related to compiling.
> >=20
> > I tried to follow [2] and [3] and came up with the following which is
> > not much as you can see and in addition does not work yet.
> >=20
> > The problem I am facing is, that in the Makefile of VDR [4] there is
> >=20
> >         [=E2=80=A6]
> >         LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype
> >         -lfontconfig
> >         INCLUDES =3D -I/usr/include/freetype
> >         [=E2=80=A6]
> >=20
> > so that the path `/usr/include/freetype/` is passed to the make command
> > which of course fails trying to cross compile the program.
> >=20
> >         CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/includ=
e/freetype2
> >         cc1plus: internal compiler error: in add_path, at c-incpath.c:4=
25
> >=20
> > Now, if I understand it correctly by looking at other recipes there is
> > EXTRA_OEMAKE =3D "" where I should be able to set the INCLUDEPATH to th=
e
> > OE build environment. Is that correct.
> >=20
> > Could you please also tell me what the recipe variable name is for libs=
?
>
> What buildsystem is vdr using autotools or handmade Makefiles?

VDR uses a handmade Makefile.

[=E2=80=A6]

> for handmade Makefiles
>=20
> make a Patch which patches the Makefile and sets the include path to
> our staginginclude-Path

Thank you! I tried this

        +-INCLUDES =3D -I/usr/include/freetype2
        ++INCLUDES =3D -I${STAGING_INCDIR}/freetype2

but the `${STAGING_INCDIR}` was not expanded. The result is the
following.

        INCLUDES =3D -I${STAGING_INCDIR}freetype2

Using an absolute path worked.

Could you please point out my mistake?

Furthermore is there a better way for upstream to set things up so that
no patching is needed? Or is autotools needed for this?

What else do I need to do to get VDR accepted into OE?


Thanks,

Paul

--

The upstream Makefile needs to be patched to use the headers from the stagi=
ng area.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 conf/checksums.ini               |    4 ++++
 recipes/vdr/files/fixpaths.patch |   11 +++++++++++
 recipes/vdr/vdr_1.7.10.bb        |    9 +++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/vdr/files/fixpaths.patch
 create mode 100644 recipes/vdr/vdr_1.7.10.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 3bf9854..e717f1b 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -27046,6 +27046,10 @@ sha256=3D05b473815f9706387a3c5eaeb4da2e492f624e0b7=
783432179454f9d69bb973c
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
diff --git a/recipes/vdr/files/fixpaths.patch b/recipes/vdr/files/fixpaths.=
patch
new file mode 100644
index 0000000..f41bd26
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
++INCLUDES =3D -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi=
/usr/include/freetype2
+=20
+ PLUGINDIR=3D ./PLUGINS
+ PLUGINLIBDIR=3D $(PLUGINDIR)/lib
diff --git a/recipes/vdr/vdr_1.7.10.bb b/recipes/vdr/vdr_1.7.10.bb
new file mode 100644
index 0000000..662c883
--- /dev/null
+++ b/recipes/vdr/vdr_1.7.10.bb
@@ -0,0 +1,9 @@
+DESCRIPTION =3D "Video Disk Recorder (VDR) is a digital sat-receiver progr=
am using Linux and DVB technologies. It allows one to record MPEG2 streams,=
 as well as output the stream to TV. It is also possible to watch DVDs (har=
dware accelerated) with some comfort and use an IR remote control."
+AUTHOR =3D "Klaus Schmidinger"
+LICENSE =3D "GPLv2"
+HOMEPAGE =3D "http://www.tvdr.de"
+
+DEPENDS =3D "fontconfig freetype gettext libcap jpeg"
+
+SRC_URI =3D "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2 \
+           file://fixpaths.patch;patch=3D1"
--=20
1.6.5.4

--=-Rxq36PkP49zvPur342aQ
Content-Disposition: attachment; filename="0001-Package-VDR.patch"
Content-Type: text/x-patch; name="0001-Package-VDR.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBlNjgzYTI2OWJhMDdmYWFhZWU5MTZlMWMyYjdkNzBiNjFkMzliM2MxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFNhdCwgMTIgRGVjIDIwMDkgMTA6MTc6NTIgKzAxMDANClN1Ympl
Y3Q6IFtQQVRDSCAxLzFdIFBhY2thZ2UgVkRSLg0KDQpUaGUgdXBzdHJlYW0gTWFrZWZpbGUgbmVl
ZHMgdG8gYmUgcGF0Y2hlZCB0byB1c2UgdGhlIGhlYWRlcnMgZnJvbSB0aGUgc3RhZ2luZyBhcmVh
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBQYXVsIE1lbnplbCA8cGF1bGVwYW50ZXJAdXNlcnMuc291cmNl
Zm9yZ2UubmV0Pg0KLS0tDQogY29uZi9jaGVja3N1bXMuaW5pICAgICAgICAgICAgICAgfCAgICA0
ICsrKysNCiByZWNpcGVzL3Zkci9maWxlcy9maXhwYXRocy5wYXRjaCB8ICAgMTEgKysrKysrKysr
KysNCiByZWNpcGVzL3Zkci92ZHJfMS43LjEwLmJiICAgICAgICB8ICAgIDkgKysrKysrKysrDQog
MyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCByZWNpcGVzL3Zkci9maWxlcy9maXhwYXRocy5wYXRjaA0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCByZWNpcGVzL3Zkci92ZHJfMS43LjEwLmJiDQoNCmRpZmYgLS1naXQgYS9jb25m
L2NoZWNrc3Vtcy5pbmkgYi9jb25mL2NoZWNrc3Vtcy5pbmkNCmluZGV4IDNiZjk4NTQuLmU3MTdm
MWIgMTAwNjQ0DQotLS0gYS9jb25mL2NoZWNrc3Vtcy5pbmkNCisrKyBiL2NvbmYvY2hlY2tzdW1z
LmluaQ0KQEAgLTI3MDQ2LDYgKzI3MDQ2LDEwIEBAIHNoYTI1Nj0wNWI0NzM4MTVmOTcwNjM4N2Ez
YzVlYWViNGRhMmU0OTJmNjI0ZTBiNzc4MzQzMjE3OTQ1NGY5ZDY5YmI5NzNjDQogbWQ1PWQ5N2E4
ZGJjNzI5NDJjNTc1NDJmNTAzMjJiNTM4YTQ4DQogc2hhMjU2PTA1YjQ3MzgxNWY5NzA2Mzg3YTNj
NWVhZWI0ZGEyZTQ5MmY2MjRlMGI3NzgzNDMyMTc5NDU0ZjlkNjliYjk3M2MNCiANCitbZnRwOi8v
ZnRwLnR2ZHIuZGUvdmRyL0RldmVsb3Blci92ZHItMS43LjEwLnRhci5iejJdDQorbWQ1PWM3NGVl
OTY2YmFjYTFjNDdlZDZiOWUyYmUzZDE2MzliDQorc2hhMjU2PTE2NWJmY2Q4MTFlZjkyY2FiNTBk
MTFhODhhNzZjNDgxZTEwNTY4OTQzODkyOTQxNGQyN2VkZmFjZmIzMTJmNTINCisNCiBbZnRwOi8v
ZnRwLmJpbGxzZ2FtZXMuY29tL3VuaXgveC92ZWN0b3JvaWRzL3NyYy92ZWN0b3JvaWRzLTEuMS4w
LnRhci5nel0NCiBtZDU9YzYzY2U1NmIwOWFhN2RhOWE2ZTk1ZDgwNGU5ZWUzMTQNCiBzaGEyNTY9
OGQxNGRkMjgxNzY3ZTk5NDEwOGFiZDc3YzhlNjdkNWExNzcxOGQwYWQxZTM0ZDM3ZTAyNjkxMWQx
NDY5N2IyZQ0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvdmRyL2ZpbGVzL2ZpeHBhdGhzLnBhdGNoIGIv
cmVjaXBlcy92ZHIvZmlsZXMvZml4cGF0aHMucGF0Y2gNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQpp
bmRleCAwMDAwMDAwLi5mNDFiZDI2DQotLS0gL2Rldi9udWxsDQorKysgYi9yZWNpcGVzL3Zkci9m
aWxlcy9maXhwYXRocy5wYXRjaA0KQEAgLTAsMCArMSwxMSBAQA0KKy0tLSB2ZHIvTWFrZWZpbGV+
Zml4cGF0aHMJMjAwOS0xMC0xOCAxNTo1OToyNS4wMDAwMDAwMDAgKzAyMDANCisrKysgdmRyL01h
a2VmaWxlCTIwMDktMTItMTMgMTI6Mjg6MjIuMDAwMDAwMDAwICswMTAwDQorQEAgLTIxLDcgKzIx
LDcgQEANCisgQklORElSICAgPSAkKFBSRUZJWCkvYmluDQorIExPQ0RJUiAgID0gLi9sb2NhbGUN
CisgTElCUyAgICAgPSAtbGpwZWcgLWxwdGhyZWFkIC1sZGwgLWxjYXAgLWxydCAtbGZyZWV0eXBl
IC1sZm9udGNvbmZpZw0KKy1JTkNMVURFUyA9IC1JL3Vzci9pbmNsdWRlL2ZyZWV0eXBlMg0KKytJ
TkNMVURFUyA9IC1JL3Nydi9maWxtZS9vZS9hbmdzdHJvbS1kZXYvc3RhZ2luZy9hcm12N2EtYW5n
c3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVkZS9mcmVldHlwZTINCisgDQorIFBMVUdJTkRJ
Uj0gLi9QTFVHSU5TDQorIFBMVUdJTkxJQkRJUj0gJChQTFVHSU5ESVIpL2xpYg0KZGlmZiAtLWdp
dCBhL3JlY2lwZXMvdmRyL3Zkcl8xLjcuMTAuYmIgYi9yZWNpcGVzL3Zkci92ZHJfMS43LjEwLmJi
DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uNjYyYzg4Mw0KLS0tIC9kZXYv
bnVsbA0KKysrIGIvcmVjaXBlcy92ZHIvdmRyXzEuNy4xMC5iYg0KQEAgLTAsMCArMSw5IEBADQor
REVTQ1JJUFRJT04gPSAiVmlkZW8gRGlzayBSZWNvcmRlciAoVkRSKSBpcyBhIGRpZ2l0YWwgc2F0
LXJlY2VpdmVyIHByb2dyYW0gdXNpbmcgTGludXggYW5kIERWQiB0ZWNobm9sb2dpZXMuIEl0IGFs
bG93cyBvbmUgdG8gcmVjb3JkIE1QRUcyIHN0cmVhbXMsIGFzIHdlbGwgYXMgb3V0cHV0IHRoZSBz
dHJlYW0gdG8gVFYuIEl0IGlzIGFsc28gcG9zc2libGUgdG8gd2F0Y2ggRFZEcyAoaGFyZHdhcmUg
YWNjZWxlcmF0ZWQpIHdpdGggc29tZSBjb21mb3J0IGFuZCB1c2UgYW4gSVIgcmVtb3RlIGNvbnRy
b2wuIg0KK0FVVEhPUiA9ICJLbGF1cyBTY2htaWRpbmdlciINCitMSUNFTlNFID0gIkdQTHYyIg0K
K0hPTUVQQUdFID0gImh0dHA6Ly93d3cudHZkci5kZSINCisNCitERVBFTkRTID0gImZvbnRjb25m
aWcgZnJlZXR5cGUgZ2V0dGV4dCBsaWJjYXAganBlZyINCisNCitTUkNfVVJJID0gImZ0cDovL2Z0
cC50dmRyLmRlL3Zkci9EZXZlbG9wZXIvJHtQfS50YXIuYnoyIFwNCisgICAgICAgICAgIGZpbGU6
Ly9maXhwYXRocy5wYXRjaDtwYXRjaD0xIg0KLS0gDQoxLjYuNS40DQoNCg==

--=-Rxq36PkP49zvPur342aQ--

--=-oQ180V/oUWNpQk7X0dp+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAksk8B8ACgkQPX1aK2wOHVj5zgCcDSUSV7gmSIs/WwKDK6eqg9Hd
z60AnR4zoVMMO8N/GxGC49etve3hVMdG
=PcBZ
-----END PGP SIGNATURE-----

--=-oQ180V/oUWNpQk7X0dp+--
