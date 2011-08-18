Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qu0nz-0005jd-E5 for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 13:30:35 +0200
Received: from f053044176.adsl.alicedsl.de ([78.53.44.176]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qu0jd-0007qw-HL for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 11:26:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1313604363-2973-1-git-send-email-pespin.shar@gmail.com>
References: <1313604363-2973-1-git-send-email-pespin.shar@gmail.com>
Date: Thu, 18 Aug 2011 13:25:56 +0200
Message-ID: <1313666756.4016.76.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: minimal-uclibc: ../../src/lib/.libs/liblightmediascanner.so: undefined reference to `libiconv_open' (was: [meta-efl] lightmediascanner: Add version 0.4.3.0 (initial recipe))
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
X-List-Received-Date: Thu, 18 Aug 2011 11:30:35 -0000
X-Groupsio-MsgNum: 33692
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-MxU70BcGbkJ780Jr+N7a"

--=-MxU70BcGbkJ780Jr+N7a
Content-Type: multipart/mixed; boundary="=-GrNptm5BD975RTYq1AcM"

--=-GrNptm5BD975RTYq1AcM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Pau,


Am Mittwoch, den 17.08.2011, 20:06 +0200 schrieb Pau Espin Pedrol:
> * Recipe based on recipe v0.4.1.0 from oe.dev (http://cgit.openembedded.o=
rg/cgit.cgi/openembedded/tree/recipes/lightmediascanner/lightmediascanner_0=
.4.1.0.bb?id=3D99ed67320060c4b9f686328a22f68980c2154c62)
>=20
> Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>

thank you for addressing the comments. Somehow the tag =C2=BB[PATCH]=C2=AB =
was not
added (by `git send-email`?) to the subject line. Please mark it as `v2`
next time and add a short description below the `---` what changed in
the iteration.

> ---
>  .../lightmediascanner/lightmediascanner_0.4.3.0.bb |   26 ++++++++++++++=
++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightme=
diascanner_0.4.3.0.bb
>=20
> diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascan=
ner_0.4.3.0.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediasc=
anner_0.4.3.0.bb
> new file mode 100644
> index 0000000..7c71d4a
> --- /dev/null
> +++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4=
.3.0.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "Lightweight media scanner meant to be used in not-so-po=
werful devices"
> +AUTHOR =3D "ProFUSION"
> +HOMEPAGE =3D "http://lms.garage.maemo.org/"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> +DEPENDS =3D "sqlite3 flac"

Either `virtual/libintl` or `inherit gettext` is needed too I think.
Please read the end of my reply.

> +
> +PR =3D "r1"

Please start with "r0".

> +
> +SRC_URI =3D "https://garage.maemo.org/frs/download.php/9439/lightmediasc=
anner-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "188ff5188cfa0f2504a42934c969cb77"
> +SRC_URI[sha256sum] =3D "bdbe76655ad212b936fb3cf6a9ca725e318ddeb57cd7d950=
d9c8409297d3b0da"
> +
> +inherit autotools pkgconfig
> +
> +do_install_append() {
> +    install -d ${D}/${bindir}/
> +    install -m 755 ${WORKDIR}/${PN}-${PV}/src/bin/.libs/test  ${D}/${bin=
dir}/test-lms
> +}
> +
> +PACKAGES =3D+ "${PN}-test"
> +
> +FILES_${PN}-test =3D "${bindir}/test-lms"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/${PN}/plugins/.debug"

Furthermore I just wanted to report that the build is failing with
uClibc. I contacted upstream but I am not sure what the correct fix is.
Please find my attempt attached.


Thanks,

Paul

--=-GrNptm5BD975RTYq1AcM
Content-Type: application/mbox; name="lms-uclibc.mbox"
Content-Disposition: attachment; filename="lms-uclibc.mbox"
Content-Transfer-Encoding: base64

RnJvbSBwYXVsZXBhbnRlckB1c2Vycy5zb3VyY2Vmb3JnZS5uZXQgV2VkIEF1ZyAxNyAyMzo0Mjo1
NSAyMDExClN1YmplY3Q6IFtSRkNdW1BBVENIXSBzcmMvYmluL01ha2VmaWxlLmFtOiBBZGQgYEBM
VExJQklDT05WQGAgdG8gYCpfTERBRERgCkZyb206IFBhdWwgTWVuemVsIDxwYXVsZXBhbnRlckB1
c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+ClRvOiBsbXMtZGV2ZWxAZ2FyYWdlLm1hZW1vLm9yZwpDYzog
R3VzdGF2byBTdmVyenV0IEJhcmJpZXJpIDxiYXJiaWVyaUBwcm9mdXNpb24ubW9iaT4KQ29udGVu
dC1UeXBlOiBtdWx0aXBhcnQvc2lnbmVkOyBtaWNhbGc9InBncC1zaGExIjsgcHJvdG9jb2w9ImFw
cGxpY2F0aW9uL3BncC1zaWduYXR1cmUiOyBib3VuZGFyeT0iPS1jVTZOUzdVRUhiTUlpcHNDNHN4
ZCIKRGF0ZTogV2VkLCAxNyBBdWcgMjAxMSAyMzo0Mjo1NSArMDIwMApNZXNzYWdlLUlEOiA8MTMx
MzYxNzM3NS4xNjE4NC4xNC5jYW1lbEBtYXR0b3RhdXBhPgpNaW1lLVZlcnNpb246IDEuMApYLU1h
aWxlcjogRXZvbHV0aW9uIDIuMzIuMyAKWC1Fdm9sdXRpb24tRm9ybWF0OiB0ZXh0L3BsYWluClgt
RXZvbHV0aW9uLUFjY291bnQ6IDExODQ0OTkyODMuNzM5OS44QG1hdHRvdGF1cGEKWC1Fdm9sdXRp
b24tVHJhbnNwb3J0Ogogc210cDovL3BhdWw7YXV0aD1DUkFNLU1ENUBtYWlsLmd3OTAuZGUvO3Vz
ZV9zc2w9d2hlbi1wb3NzaWJsZQpYLUV2b2x1dGlvbi1GY2M6IG1ib3g6Ly8vaG9tZS9wYXVsLy5s
b2NhbC9zaGFyZS9ldm9sdXRpb24vbWFpbC9sb2NhbCNTZW50CgoKLS09LWNVNk5TN1VFSGJNSWlw
c0M0c3hkCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD0iVVRGLTgiDQpDb250ZW50
LVRyYW5zZmVyLUVuY29kaW5nOiBxdW90ZWQtcHJpbnRhYmxlDQoNCkRhdGU6IFdlZCwgMTcgQXVn
IDIwMTEgMjI6NDc6MTAgKzAyMDANCg0KQ29tcGlsYXRpb24gZmFpbHMgd2l0aCB0aGUgZm9sbG93
aW5nIGVycm9yIHVzaW5nIE9wZW5FbWJlZGRlZCBbMV0gd2l0aA0KYG1pbmltYWwtdWNsaWJjYCBm
b3IgYE1BQ0hJTkUgPTNEICJiZWFnbGVib2FyZCJgLg0KDQogICAgICAgIE1ha2luZyBhbGwgaW4g
YmluDQogICAgICAgIG1ha2VbM106IEVudGVyaW5nIGRpcmVjdG9yeSBgL29lL2J1aWxkLW1pbmlt
YWwtdWNsaWJjL21pbmltYWwtdWNsaWI9DQpjLWRldi93b3JrL2FybXY3YS1vZS1saW51eC11Y2xp
YmNlYWJpL2xpZ2h0bWVkaWFzY2FubmVyLTFfMC40LjEuMC1yMi9saWdodG09DQplZGlhc2Nhbm5l
ci0wLjQuMS4wL3NyYy9iaW4nDQogICAgICAgICAgQ0MgICAgIHRlc3Qubw0KICAgICAgICAgIEND
ICAgICBsaXN0LXBhcnNlcnMubw0KICAgICAgICAgIENDTEQgICBsaXN0LXBhcnNlcnMNCiAgICAg
ICAgICBDQ0xEICAgdGVzdA0KICAgICAgICAuLi8uLi9zcmMvbGliLy5saWJzL2xpYmxpZ2h0bWVk
aWFzY2FubmVyLnNvOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvPQ0KIGBsaWJpY29udl9vcGVuJw0K
ICAgICAgICAuLi8uLi9zcmMvbGliLy5saWJzL2xpYmxpZ2h0bWVkaWFzY2FubmVyLnNvOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvPQ0KIGBsaWJpY29udl9jbG9zZScNCiAgICAgICAgLi4vLi4vc3Jj
L2xpYi8ubGlicy9saWJsaWdodG1lZGlhc2Nhbm5lci5zbzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
bz0NCiBgbGliaWNvbnYnDQogICAgICAgIGNvbGxlY3QyOiBsZCByZXR1cm5lZCAxIGV4aXQgc3Rh
dHVzDQogICAgICAgIG1ha2VbM106ICoqKiBbbGlzdC1wYXJzZXJzXSBFcnJvciAxDQogICAgICAg
IG1ha2VbM106ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQogICAgICAgIC4u
Ly4uL3NyYy9saWIvLmxpYnMvbGlibGlnaHRtZWRpYXNjYW5uZXIuc286IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG89DQogYGxpYmljb252X29wZW4nDQogICAgICAgIC4uLy4uL3NyYy9saWIvLmxpYnMv
bGlibGlnaHRtZWRpYXNjYW5uZXIuc286IHVuZGVmaW5lZCByZWZlcmVuY2UgdG89DQogYGxpYmlj
b252X2Nsb3NlJw0KICAgICAgICAuLi8uLi9zcmMvbGliLy5saWJzL2xpYmxpZ2h0bWVkaWFzY2Fu
bmVyLnNvOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvPQ0KIGBsaWJpY29udicNCiAgICAgICAgY29s
bGVjdDI6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMNCiAgICAgICAgbWFrZVszXTogKioqIFt0
ZXN0XSBFcnJvciAxDQoNClRoZSByZWFzb24gaXMgZm9yIGB0ZXN0LmNgIGlzIGl0IGluY2x1ZGVz
IGBpY29udi5oYCBhbmQgdUNsaWJjIGRvZXMgbm90DQppbmNsdWRlIGljb252IHN1cHBvcnQuIFRo
ZXJlZm9yZSB0aGUgYC1saWNvbnZgIG5lZWRzIHRvIGJlIHBhc3NlZCBhcyBhDQpsaW5rIGZsYWcu
IEZvciBgbGlzdC1wYXJzZXJzLmNgIEkgZG8gbm90IGtub3cgd2h5IGl0IGhhcyB0byBiZSBsaW5r
ZWQNCmFnYWluc3QgYGxpYmljb252YC4NCg0KVGhlIGxpYmljb252IFdlYiBzaXRlIFsyXSB0ZWxs
cyB0byBhZGQgYEBMVExJQklDT05WQGAgdG8gdGhlDQpjb3JyZXNwb25kaW5nIHByb2dyYW1zLiBJ
dCBhbHNvIGFkdmlzZXMgdG8gaW5jbHVkZSBgaWNvbnYubTRgIHRvIHRoZQ0KYG00L2AgZGlyZWN0
b3J5Lg0KDQpbMV0gaHR0cDovL3d3dy5vcGVuZW1iZWRkZWQub3JnLw0KWzJdIGh0dHA6Ly93d3cu
Z251Lm9yZy9zb2Z0d2FyZS9saWJpY29udi8NCi0tLQ0KSSBkaWQgbm90IGFkZCBgbTQvaWNvbnYu
bTRgIHRvIHRoZSBjb3JyZXNwb25kaW5nIGRpcmVjdG9yeSBhbmQgSSBqdXN0DQp0ZXN0ZWQgdGhl
IGZpeCBieSBhZGRpbmcgYC1saWNvbnZgIHRvIHRoZSBjcmVhdGVkIGBNYWtlZmlsZWAuDQoNCkkg
aG9wZSB5b3UgZG8ga25vdyB0aGlzIGJldHRlciB0aGFuIG1lIGFuZCBrbm93IHdoYXQgdG8gZG8u
IFNpbmNlIEkgZG8NCm5vdCB1bmRlcnN0YW5kIHRoYXQgZXZlcnkgcHJvZ3JhbSBoYXMgdG8gc2hp
cCB0aGUgbTQgZmlsZXMuIFRoYXQgZG9lcw0Kbm90IGxvb2sgcmlnaHQgZXNwZWNpYWxseSB3aGVu
IHRob3NlIGZpbGVzIGFyZSB1cGRhdGVkLiBCdXQgaWYgdGhpcyBpcw0KbmVlZGVkIHRoYW4gcGxl
YXNlIGFkZCBgaWNvbnYubTRgIGJlZm9yZSBwdXNoaW5nIHRoaXMgcGF0Y2guDQotLS0NCiBzcmMv
YmluL01ha2VmaWxlLmFtIHwgICAgNCArKy0tDQogMSBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9zcmMvYmluL01ha2VmaWxlLmFt
IGIvc3JjL2Jpbi9NYWtlZmlsZS5hbQ0KaW5kZXggM2NlMmNkMy4uYzE5MTMwZiAxMDA2NDQNCi0t
LSBhL3NyYy9iaW4vTWFrZWZpbGUuYW0NCisrKyBiL3NyYy9iaW4vTWFrZWZpbGUuYW0NCkBAIC0x
MCwxMSArMTAsMTEgQEAgbm9pbnN0X1BST0dSQU1TID0zRCBcDQo9MjANCj0yMA0KIHRlc3RfU09V
UkNFUyA9M0QgdGVzdC5jDQotdGVzdF9MREFERCA9M0QgJCh0b3BfYnVpbGRkaXIpL3NyYy9saWIv
bGlibGlnaHRtZWRpYXNjYW5uZXIubGEgQFNRTElURTNfTEk9DQpCU0ANCit0ZXN0X0xEQUREID0z
RCAkKHRvcF9idWlsZGRpcikvc3JjL2xpYi9saWJsaWdodG1lZGlhc2Nhbm5lci5sYSBATFRMSUJJ
Q09OVj0NCkAgQFNRTElURTNfTElCU0ANCiB0ZXN0X0RFUEVOREVOQ0lFUyA9M0QgJCh0b3BfYnVp
bGRkaXIpL3NyYy9saWIvbGlibGlnaHRtZWRpYXNjYW5uZXIubGENCj0yMA0KPTIwDQogbGlzdF9w
YXJzZXJzX1NPVVJDRVMgPTNEIGxpc3QtcGFyc2Vycy5jDQogbGlzdF9wYXJzZXJzX0xEQUREID0z
RCAkKHRvcF9idWlsZGRpcikvc3JjL2xpYi9saWJsaWdodG1lZGlhc2Nhbm5lci5sYSBcDQotCUBT
UUxJVEUzX0xJQlNADQorCUBMVExJQklDT05WQCBAU1FMSVRFM19MSUJTQA0KIGxpc3RfcGFyc2Vy
c19ERVBFTkRFTkNJRVMgPTNEICQodG9wX2J1aWxkZGlyKS9zcmMvbGliL2xpYmxpZ2h0bWVkaWFz
Y2FubmVyPQ0KLmxhDQotLT0yMA0KMS43LjUuNA0KCi0tPS1jVTZOUzdVRUhiTUlpcHNDNHN4ZApD
b250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL3BncC1zaWduYXR1cmU7IG5hbWU9InNpZ25hdHVyZS5h
c2MiCkNvbnRlbnQtRGVzY3JpcHRpb246IFRoaXMgaXMgYSBkaWdpdGFsbHkgc2lnbmVkIG1lc3Nh
Z2UgcGFydAoKLS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEu
NC4xMSAoR05VL0xpbnV4KQoKaUVZRUFCRUNBQVlGQWs1TU5ka0FDZ2tRUFgxYUsyd09IVmp3SFFD
Z2kyMXp6WXRFMlk3NGNwWHFCTkg3ODlpVgphb0lBbjBLQy84OCt0OE9tcVNyNVFWTW8yYnRyUnF6
OQo9eXU3RwotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0KCi0tPS1jVTZOUzdVRUhiTUlpcHND
NHN4ZC0tCgo=

--=-GrNptm5BD975RTYq1AcM--

--=-MxU70BcGbkJ780Jr+N7a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5M9sQACgkQPX1aK2wOHVgYXQCfWR08C6NOz0Fk1gNRUiyLj4V0
EyAAnil7CkHUhJEM+0z6KHf7O3UgxG7o
=IxoJ
-----END PGP SIGNATURE-----

--=-MxU70BcGbkJ780Jr+N7a--
