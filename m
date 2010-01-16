Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NW9E0-0003qD-6B for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jan 2010 15:02:03 +0100
Received: from f053038139.adsl.alicedsl.de ([78.53.38.139]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NW9Bt-0000mj-9r for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jan 2010 13:59:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263292840.20557.80.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1263292840.20557.80.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Sat, 16 Jan 2010 14:59:47 +0100
Message-ID: <1263650387.5298.80.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] libcap: Append `-fPIC` to `CFLAGS` to fix compilation on newer binutils/ld. (was: [gcc 4.4.2] [libcap, vdr] relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC)
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
X-List-Received-Date: Sat, 16 Jan 2010 14:02:03 -0000
X-Groupsio-MsgNum: 15767
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-t+cojDDPoloP9+ceglNO"

--=-t+cojDDPoloP9+ceglNO
Content-Type: multipart/mixed; boundary="=-v5gvD+nEt3goj7cEoh1z"

--=-v5gvD+nEt3goj7cEoh1z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE hackers,


Am Dienstag, den 12.01.2010, 11:40 +0100 schrieb Paul Menzel:
> sorry for bothering you with this. I am trying to reproduce the errors
> Henning has seen with g++ 4.4.2 [1] and therefore added the following
> lines to my `local.conf` for =C3=85ngstr=C3=B6m with BeagleBoard [2].
>=20
> Am Montag, den 11.01.2010, 23:42 +0100 schrieb Paul Menzel:
>=20
> [=E2=80=A6]
>=20
> > Putting
> >=20
> >         PREFERRED_VERSION_binutils               =3D "2.20"
> >         PREFERRED_VERSION_binutils-cross         =3D "2.20"
> >         PREFERRED_VERSION_binutils-cross-sdk     =3D "2.20"
> >        =20
> >         PREFERRED_VERSION_gcc                    =3D "4.4.2"
> >         PREFERRED_VERSION_gcc-cross              =3D "4.4.2"
> >         PREFERRED_VERSION_gcc-cross-sdk          =3D "4.4.2"
> >         PREFERRED_VERSION_gcc-cross-initial      =3D "4.4.2"
> >         PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.2"
> >=20
> > in my `local.conf` and running `bitbake vdr` gave me an error in
> > `do_compile` for `libcap_1.10.bb`.
> >=20
> >         arm-angstrom-linux-gnueabi-ld -soname libcap.so.1 -x -shared
> -o libcap.so.1.10 cap_alloc.o cap_proc.o cap_extint.o cap_flag.o
> cap_text.o cap_sys.o
> >         arm-angstrom-linux-gnueabi-ld: cap_text.o: relocation
> R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making
> a shared object; recompile with -fPIC
>=20
> I do not get these errors if I use the standard versions defined for
> =C3=85ngstr=C3=B6m which is 4.1.1. Adding `-fPIC` to the flags as suggest=
ed in
> [3]
> solves the problem for me.
>=20
> Does anyone know if GCC=E2=80=99s behavior was changed somehow?

according to Khem Raj this has to do with binutils/ld [2].

Please find the patch inlined and attached.


Thanks,

Paul

---
=46rom c119072b0f13b674d705d3bc50150a252bf7c5d2 Mon Sep 17 00:00:00 2001
From: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Sat, 16 Jan 2010 14:41:03 +0100
Subject: [PATCH] libcap: Append `-fPIC` to `CFLAGS` to fix compilation on n=
ewer binutils/ld.
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Doing `bitbake libcap` with

        PREFERRED_VERSION_binutils               =3D "2.20"
        PREFERRED_VERSION_binutils-cross         =3D "2.20"
        PREFERRED_VERSION_binutils-cross-sdk     =3D "2.20"

        PREFERRED_VERSION_gcc                    =3D "4.4.2"
        PREFERRED_VERSION_gcc-cross              =3D "4.4.2"
        PREFERRED_VERSION_gcc-cross-sdk          =3D "4.4.2"
        PREFERRED_VERSION_gcc-cross-initial      =3D "4.4.2"
        PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.2"

in `local.conf` made `do_compile` error out with the following message [1].

        arm-angstrom-linux-gnueabi-ld -soname libcap.so.1 -x -shared -o lib=
cap.so.1.10 cap_alloc.o cap_proc.o cap_extint.o cap_flag.o cap_text.o cap_s=
ys.o
        arm-angstrom-linux-gnueabi-ld: cap_text.o: relocation R_ARM_MOVW_AB=
S_NC against `a local symbol' can not be used when making a shared object; =
recompile with -fPIC

Khem Raj explained it the following way [2].

Am Mittwoch, den 13.01.2010, 02:27 -0800 schrieb Khem Raj:
> > I also get the same error which I did not get before with GCC 4.1.1.
>
> Older versions of binutils/ld can not detect MOVT/MOVW relocations which
> are absolute and cant be used in PIC code.
> hence even if the error was there it remained latent.

Therefore just append `-fPIC` to the CFLAGS and bump the PR variable.

The strange thing is still, that other distributions seem to have patched l=
ibcap to build with `-fPIC` long ago [3=E2=80=935].

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/01=
6142.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/01=
6211.html
[3] http://www.linuxfromscratch.org/patches/downloads/libcap/libcap-1.10-fe=
dora_fixes-1.patch
[4] http://frugalware.org/pipermail/frugalware-darcs/2005-May/000824.html
[5] http://cvs.fedoraproject.org/viewvc/rpms/libcap/F-7/libcap-1.10-fPIC.pa=
tch?revision=3D1.1&view=3Dmarkup

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/libcap/libcap_1.10.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libcap/libcap_1.10.bb b/recipes/libcap/libcap_1.10.bb
index 172acac..241529e 100644
--- a/recipes/libcap/libcap_1.10.bb
+++ b/recipes/libcap/libcap_1.10.bb
@@ -3,9 +3,9 @@ PRIORITY =3D "optional"
 SECTION =3D "libs"
 LICENSE =3D "GPL"
 DEPENDS =3D "bison-native flex-native"
-PR =3D "r1"
+PR =3D "r2"
=20
-CFLAGS_append =3D " -I${S}/libcap/include"
+CFLAGS_append =3D " -I${S}/libcap/include -fPIC"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/security/linux-privs/kerne=
l-2.4/${PN}-${PV}.tar.bz2 \
 	   file://makenames.patch;patch=3D1 \
--=20
1.6.6

--=-v5gvD+nEt3goj7cEoh1z
Content-Disposition: attachment;
	filename*0=0001-libcap-Append-fPIC-to-CFLAGS-to-fix-compilation-on-n.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-libcap-Append-fPIC-to-CFLAGS-to-fix-compilation-on-n.patch";
	charset="UTF-8"

RnJvbSBjMTE5MDcyYjBmMTNiNjc0ZDcwNWQzYmM1MDE1MGEyNTJiZjdjNWQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFNhdCwgMTYgSmFuIDIwMTAgMTQ6NDE6MDMgKzAxMDANClN1Ympl
Y3Q6IFtQQVRDSF0gbGliY2FwOiBBcHBlbmQgYC1mUElDYCB0byBgQ0ZMQUdTYCB0byBmaXggY29t
cGlsYXRpb24gb24gbmV3ZXIgYmludXRpbHMvbGQuDQpNSU1FLVZlcnNpb246IDEuMA0KQ29udGVu
dC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04DQpDb250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOiA4Yml0DQoNCkRvaW5nIGBiaXRiYWtlIGxpYmNhcGAgd2l0aA0KDQogICAgICAgIFBSRUZF
UlJFRF9WRVJTSU9OX2JpbnV0aWxzICAgICAgICAgICAgICAgPSAiMi4yMCINCiAgICAgICAgUFJF
RkVSUkVEX1ZFUlNJT05fYmludXRpbHMtY3Jvc3MgICAgICAgICA9ICIyLjIwIg0KICAgICAgICBQ
UkVGRVJSRURfVkVSU0lPTl9iaW51dGlscy1jcm9zcy1zZGsgICAgID0gIjIuMjAiDQoNCiAgICAg
ICAgUFJFRkVSUkVEX1ZFUlNJT05fZ2NjICAgICAgICAgICAgICAgICAgICA9ICI0LjQuMiINCiAg
ICAgICAgUFJFRkVSUkVEX1ZFUlNJT05fZ2NjLWNyb3NzICAgICAgICAgICAgICA9ICI0LjQuMiIN
CiAgICAgICAgUFJFRkVSUkVEX1ZFUlNJT05fZ2NjLWNyb3NzLXNkayAgICAgICAgICA9ICI0LjQu
MiINCiAgICAgICAgUFJFRkVSUkVEX1ZFUlNJT05fZ2NjLWNyb3NzLWluaXRpYWwgICAgICA9ICI0
LjQuMiINCiAgICAgICAgUFJFRkVSUkVEX1ZFUlNJT05fZ2NjLWNyb3NzLWludGVybWVkaWF0ZSA9
ICI0LjQuMiINCg0KaW4gYGxvY2FsLmNvbmZgIG1hZGUgYGRvX2NvbXBpbGVgIGVycm9yIG91dCB3
aXRoIHRoZSBmb2xsb3dpbmcgbWVzc2FnZSBbMV0uDQoNCiAgICAgICAgYXJtLWFuZ3N0cm9tLWxp
bnV4LWdudWVhYmktbGQgLXNvbmFtZSBsaWJjYXAuc28uMSAteCAtc2hhcmVkIC1vIGxpYmNhcC5z
by4xLjEwIGNhcF9hbGxvYy5vIGNhcF9wcm9jLm8gY2FwX2V4dGludC5vIGNhcF9mbGFnLm8gY2Fw
X3RleHQubyBjYXBfc3lzLm8NCiAgICAgICAgYXJtLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmktbGQ6
IGNhcF90ZXh0Lm86IHJlbG9jYXRpb24gUl9BUk1fTU9WV19BQlNfTkMgYWdhaW5zdCBgYSBsb2Nh
bCBzeW1ib2wnIGNhbiBub3QgYmUgdXNlZCB3aGVuIG1ha2luZyBhIHNoYXJlZCBvYmplY3Q7IHJl
Y29tcGlsZSB3aXRoIC1mUElDDQoNCktoZW0gUmFqIGV4cGxhaW5lZCBpdCB0aGUgZm9sbG93aW5n
IHdheSBbMl0uDQoNCkFtIE1pdHR3b2NoLCBkZW4gMTMuMDEuMjAxMCwgMDI6MjcgLTA4MDAgc2No
cmllYiBLaGVtIFJhajoNCj4gPiBJIGFsc28gZ2V0IHRoZSBzYW1lIGVycm9yIHdoaWNoIEkgZGlk
IG5vdCBnZXQgYmVmb3JlIHdpdGggR0NDIDQuMS4xLg0KPg0KPiBPbGRlciB2ZXJzaW9ucyBvZiBi
aW51dGlscy9sZCBjYW4gbm90IGRldGVjdCBNT1ZUL01PVlcgcmVsb2NhdGlvbnMgd2hpY2gNCj4g
YXJlIGFic29sdXRlIGFuZCBjYW50IGJlIHVzZWQgaW4gUElDIGNvZGUuDQo+IGhlbmNlIGV2ZW4g
aWYgdGhlIGVycm9yIHdhcyB0aGVyZSBpdCByZW1haW5lZCBsYXRlbnQuDQoNClRoZXJlZm9yZSBq
dXN0IGFwcGVuZCBgLWZQSUNgIHRvIHRoZSBDRkxBR1MgYW5kIGJ1bXAgdGhlIFBSIHZhcmlhYmxl
Lg0KDQpUaGUgc3RyYW5nZSB0aGluZyBpcyBzdGlsbCwgdGhhdCBvdGhlciBkaXN0cmlidXRpb25z
IHNlZW0gdG8gaGF2ZSBwYXRjaGVkIGxpYmNhcCB0byBidWlsZCB3aXRoIGAtZlBJQ2AgbG9uZyBh
Z28gWzPigJM1XS4NCg0KWzFdIGh0dHA6Ly9saXN0cy5saW51eHRvZ28ub3JnL3BpcGVybWFpbC9v
cGVuZW1iZWRkZWQtZGV2ZWwvMjAxMC1KYW51YXJ5LzAxNjE0Mi5odG1sDQpbMl0gaHR0cDovL2xp
c3RzLmxpbnV4dG9nby5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRlZC1kZXZlbC8yMDEwLUphbnVh
cnkvMDE2MjExLmh0bWwNClszXSBodHRwOi8vd3d3LmxpbnV4ZnJvbXNjcmF0Y2gub3JnL3BhdGNo
ZXMvZG93bmxvYWRzL2xpYmNhcC9saWJjYXAtMS4xMC1mZWRvcmFfZml4ZXMtMS5wYXRjaA0KWzRd
IGh0dHA6Ly9mcnVnYWx3YXJlLm9yZy9waXBlcm1haWwvZnJ1Z2Fsd2FyZS1kYXJjcy8yMDA1LU1h
eS8wMDA4MjQuaHRtbA0KWzVdIGh0dHA6Ly9jdnMuZmVkb3JhcHJvamVjdC5vcmcvdmlld3ZjL3Jw
bXMvbGliY2FwL0YtNy9saWJjYXAtMS4xMC1mUElDLnBhdGNoP3JldmlzaW9uPTEuMSZ2aWV3PW1h
cmt1cA0KDQpTaWduZWQtb2ZmLWJ5OiBQYXVsIE1lbnplbCA8cGF1bGVwYW50ZXJAdXNlcnMuc291
cmNlZm9yZ2UubmV0Pg0KLS0tDQogcmVjaXBlcy9saWJjYXAvbGliY2FwXzEuMTAuYmIgfCAgICA0
ICsrLS0NCiAxIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvbGliY2FwL2xpYmNhcF8xLjEwLmJiIGIvcmVjaXBlcy9s
aWJjYXAvbGliY2FwXzEuMTAuYmINCmluZGV4IDE3MmFjYWMuLjI0MTUyOWUgMTAwNjQ0DQotLS0g
YS9yZWNpcGVzL2xpYmNhcC9saWJjYXBfMS4xMC5iYg0KKysrIGIvcmVjaXBlcy9saWJjYXAvbGli
Y2FwXzEuMTAuYmINCkBAIC0zLDkgKzMsOSBAQCBQUklPUklUWSA9ICJvcHRpb25hbCINCiBTRUNU
SU9OID0gImxpYnMiDQogTElDRU5TRSA9ICJHUEwiDQogREVQRU5EUyA9ICJiaXNvbi1uYXRpdmUg
ZmxleC1uYXRpdmUiDQotUFIgPSAicjEiDQorUFIgPSAicjIiDQogDQotQ0ZMQUdTX2FwcGVuZCA9
ICIgLUkke1N9L2xpYmNhcC9pbmNsdWRlIg0KK0NGTEFHU19hcHBlbmQgPSAiIC1JJHtTfS9saWJj
YXAvaW5jbHVkZSAtZlBJQyINCiANCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vcHVi
L2xpbnV4L2xpYnMvc2VjdXJpdHkvbGludXgtcHJpdnMva2VybmVsLTIuNC8ke1BOfS0ke1BWfS50
YXIuYnoyIFwNCiAJICAgZmlsZTovL21ha2VuYW1lcy5wYXRjaDtwYXRjaD0xIFwNCi0tIA0KMS42
LjYNCg0K

--=-v5gvD+nEt3goj7cEoh1z--

--=-t+cojDDPoloP9+ceglNO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktRxlMACgkQPX1aK2wOHViO5QCbBSuKIfBlvc3Ejmqg3hJ/2lYQ
0uQAnjkL7Y6SiHzJVrxGIRvsLHA1SrlD
=UoIb
-----END PGP SIGNATURE-----

--=-t+cojDDPoloP9+ceglNO--
