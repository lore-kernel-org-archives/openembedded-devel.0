Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NS9M7-0000ot-QW for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 14:21:54 +0100
Received: from g225142234.adsl.alicedsl.de ([92.225.142.234]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NS9KA-0000HD-Ds for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 13:19:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 05 Jan 2010 14:19:43 +0100
Message-ID: <1262697583.3209.23.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/1] Update unavailable whois 4.5.25 to available version 4.7.30.
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
X-List-Received-Date: Tue, 05 Jan 2010 13:21:55 -0000
X-Groupsio-MsgNum: 15406
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-QtcNhST1bOdliR0dsp2O"

--=-QtcNhST1bOdliR0dsp2O
Content-Type: multipart/mixed; boundary="=-vQv8mXm1pRvCKwqlAVr2"

--=-vQv8mXm1pRvCKwqlAVr2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear list,


trying to build a package where `virtual/libintl` is part of `DEPENDS`,
I noticed that whois cannot be build since the sources are not available
anymore. Therefore update the version and the checksums.

`bitbake whois` worked for me.


Thanks,

Paul

---

whois 4.5.25 is not available on all tried servers anymore.

	$ bitbake whois
	[=E2=80=A6]
	NOTE: fetch ftp://ftp.debian.org/debian/pool/main/w/whois/whois_4.5.25.tar=
.gz
	--2010-01-05 13:36:25--  ftp://ftp.debian.org/debian/pool/main/w/whois/who=
is_4.5.25.tar.gz
        	   =3D> `/srv/filme/oe/downloads/whois_4.5.25.tar.gz'
	Resolving ftp.debian.org... 130.89.149.226, 2001:610:1908:a000::149:226
	Connecting to ftp.debian.org|130.89.149.226|:21... connected.
	Logging in as anonymous ... Logged in!
	=3D=3D> SYST ... done.    =3D=3D> PWD ... done.
	=3D=3D> TYPE I ... done.  =3D=3D> CWD (1) /debian/pool/main/w/whois ... do=
ne.
	=3D=3D> SIZE whois_4.5.25.tar.gz ... done.
	=3D=3D> PASV ... done.    =3D=3D> RETR whois_4.5.25.tar.gz ...
	No such file `whois_4.5.25.tar.gz'.
	[=E2=80=A6]
	        NOTE: fetch http://mirrors.openembedded.org//whois_4.5.25.tar.gz
        --2010-01-05 13:37:45--  http://mirrors.openembedded.org//whois_4.5=
.25.tar.gz
        Resolving mirrors.openembedded.org... 82.197.159.157
        Connecting to mirrors.openembedded.org|82.197.159.157|:80... connec=
ted.
        HTTP request sent, awaiting response... 404 Not Found
        2010-01-05 13:37:45 ERROR 404: Not Found.

        NOTE: fetch http://sources.openembedded.org//whois_4.5.25.tar.gz
        --2010-01-05 13:37:45--  http://sources.openembedded.org//whois_4.5=
.25.tar.gz
        Resolving sources.openembedded.org... 140.211.169.165
        Connecting to sources.openembedded.org|140.211.169.165|:80... conne=
cted.
        HTTP request sent, awaiting response... 404 Not Found
        2010-01-05 13:37:46 ERROR 404: Not Found.

        NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/w=
hois_4.5.25.tar.gz
        --2010-01-05 13:37:46--  http://www.angstrom-distribution.org/unsta=
ble/sources/whois_4.5.25.tar.gz
        Resolving www.angstrom-distribution.org... 188.40.83.200
        Connecting to www.angstrom-distribution.org|188.40.83.200|:80... co=
nnected.
        HTTP request sent, awaiting response... 404 Not Found
        2010-01-05 13:37:47 ERROR 404: Not Found.

        NOTE: Task failed: Fetch failed: ftp://ftp.debian.org/debian/pool/m=
ain/w/whois/whois_4.5.25.tar.gz

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 conf/checksums.ini            |    6 +++---
 recipes/whois/whois_4.5.25.bb |    6 ------
 recipes/whois/whois_4.7.30.bb |    6 ++++++
 3 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 recipes/whois/whois_4.5.25.bb
 create mode 100644 recipes/whois/whois_4.7.30.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index d07da15..e16e6b2 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -27662,9 +27662,9 @@ sha256=3D7315963b6eefb7530b4a4f63a5d5ccdab30078784c=
f41ccb5297873f9adea2f3
 md5=3De6051f1e1487ec0ebfdbda72bedc70ad
 sha256=3D69044b87c517b986dbc17a5f7e4de430cb56e605330c19c6bb0d384d5c37e638
=20
-[ftp://ftp.debian.org/debian/pool/main/w/whois/whois_4.5.25.tar.gz]
-md5=3D516fc54ce709e874133fc3b3c7c05447
-sha256=3D99979ff161ee209da21ae118eff9ca6de7c5cb1b0dc3397de18df534e0afaf76
+[ftp://ftp.debian.org/debian/pool/main/w/whois/whois_4.7.30.tar.gz]
+md5=3D0667190491a5a9ded8595b8e330dcc11
+sha256=3D67581c0fa7b75ccea366e531b807b02a7f1dbe6fc55d4cd440e8f09eea491d36
=20
 [http://wifi-radar.systemimager.org/pub/wifi-radar-1.9.6.tar.bz2]
 md5=3D4ab4cc22d68dd0655ab28b75c7aa6248
diff --git a/recipes/whois/whois_4.5.25.bb b/recipes/whois/whois_4.5.25.bb
deleted file mode 100644
index 22952b0..0000000
--- a/recipes/whois/whois_4.5.25.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require whois.inc
-
-SRC_URI =3D "${DEBIAN_MIRROR}/main/w/whois/whois_${PV}.tar.gz"
-S =3D "${WORKDIR}/whois-${PV}"
-
-inherit gettext
diff --git a/recipes/whois/whois_4.7.30.bb b/recipes/whois/whois_4.7.30.bb
new file mode 100644
index 0000000..22952b0
--- /dev/null
+++ b/recipes/whois/whois_4.7.30.bb
@@ -0,0 +1,6 @@
+require whois.inc
+
+SRC_URI =3D "${DEBIAN_MIRROR}/main/w/whois/whois_${PV}.tar.gz"
+S =3D "${WORKDIR}/whois-${PV}"
+
+inherit gettext
--=20
1.6.5.7

--=-vQv8mXm1pRvCKwqlAVr2
Content-Disposition: attachment;
	filename*0=0001-Update-unavailable-whois-4.5.25-to-available-version.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-Update-unavailable-whois-4.5.25-to-available-version.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA3ODVhY2JkMTcyODkzN2Y2NWUyOTA4OWNkODc4MGEzNWFiYzFjZWRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFR1ZSwgNSBKYW4gMjAxMCAxNDowOTowOCArMDEwMA0KU3ViamVj
dDogW1BBVENIIDEvMV0gVXBkYXRlIHVuYXZhaWxhYmxlIHdob2lzIDQuNS4yNSB0byBhdmFpbGFi
bGUgdmVyc2lvbiA0LjcuMzAuDQpNSU1FLVZlcnNpb246IDEuMA0KQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PVVURi04DQpDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0DQoN
Cndob2lzIDQuNS4yNSBpcyBub3QgYXZhaWxhYmxlIG9uIGFsbCB0cmllZCBzZXJ2ZXJzIGFueW1v
cmUuDQoNCgkkIGJpdGJha2Ugd2hvaXMNCglb4oCmXQ0KCU5PVEU6IGZldGNoIGZ0cDovL2Z0cC5k
ZWJpYW4ub3JnL2RlYmlhbi9wb29sL21haW4vdy93aG9pcy93aG9pc180LjUuMjUudGFyLmd6DQoJ
LS0yMDEwLTAxLTA1IDEzOjM2OjI1LS0gIGZ0cDovL2Z0cC5kZWJpYW4ub3JnL2RlYmlhbi9wb29s
L21haW4vdy93aG9pcy93aG9pc180LjUuMjUudGFyLmd6DQogICAgICAgIAkgICA9PiBgL3Nydi9m
aWxtZS9vZS9kb3dubG9hZHMvd2hvaXNfNC41LjI1LnRhci5neicNCglSZXNvbHZpbmcgZnRwLmRl
Ymlhbi5vcmcuLi4gMTMwLjg5LjE0OS4yMjYsIDIwMDE6NjEwOjE5MDg6YTAwMDo6MTQ5OjIyNg0K
CUNvbm5lY3RpbmcgdG8gZnRwLmRlYmlhbi5vcmd8MTMwLjg5LjE0OS4yMjZ8OjIxLi4uIGNvbm5l
Y3RlZC4NCglMb2dnaW5nIGluIGFzIGFub255bW91cyAuLi4gTG9nZ2VkIGluIQ0KCT09PiBTWVNU
IC4uLiBkb25lLiAgICA9PT4gUFdEIC4uLiBkb25lLg0KCT09PiBUWVBFIEkgLi4uIGRvbmUuICA9
PT4gQ1dEICgxKSAvZGViaWFuL3Bvb2wvbWFpbi93L3dob2lzIC4uLiBkb25lLg0KCT09PiBTSVpF
IHdob2lzXzQuNS4yNS50YXIuZ3ogLi4uIGRvbmUuDQoJPT0+IFBBU1YgLi4uIGRvbmUuICAgID09
PiBSRVRSIHdob2lzXzQuNS4yNS50YXIuZ3ogLi4uDQoJTm8gc3VjaCBmaWxlIGB3aG9pc180LjUu
MjUudGFyLmd6Jy4NCglb4oCmXQ0KCSAgICAgICAgTk9URTogZmV0Y2ggaHR0cDovL21pcnJvcnMu
b3BlbmVtYmVkZGVkLm9yZy8vd2hvaXNfNC41LjI1LnRhci5neg0KICAgICAgICAtLTIwMTAtMDEt
MDUgMTM6Mzc6NDUtLSAgaHR0cDovL21pcnJvcnMub3BlbmVtYmVkZGVkLm9yZy8vd2hvaXNfNC41
LjI1LnRhci5neg0KICAgICAgICBSZXNvbHZpbmcgbWlycm9ycy5vcGVuZW1iZWRkZWQub3JnLi4u
IDgyLjE5Ny4xNTkuMTU3DQogICAgICAgIENvbm5lY3RpbmcgdG8gbWlycm9ycy5vcGVuZW1iZWRk
ZWQub3JnfDgyLjE5Ny4xNTkuMTU3fDo4MC4uLiBjb25uZWN0ZWQuDQogICAgICAgIEhUVFAgcmVx
dWVzdCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4uLiA0MDQgTm90IEZvdW5kDQogICAgICAgIDIw
MTAtMDEtMDUgMTM6Mzc6NDUgRVJST1IgNDA0OiBOb3QgRm91bmQuDQoNCiAgICAgICAgTk9URTog
ZmV0Y2ggaHR0cDovL3NvdXJjZXMub3BlbmVtYmVkZGVkLm9yZy8vd2hvaXNfNC41LjI1LnRhci5n
eg0KICAgICAgICAtLTIwMTAtMDEtMDUgMTM6Mzc6NDUtLSAgaHR0cDovL3NvdXJjZXMub3BlbmVt
YmVkZGVkLm9yZy8vd2hvaXNfNC41LjI1LnRhci5neg0KICAgICAgICBSZXNvbHZpbmcgc291cmNl
cy5vcGVuZW1iZWRkZWQub3JnLi4uIDE0MC4yMTEuMTY5LjE2NQ0KICAgICAgICBDb25uZWN0aW5n
IHRvIHNvdXJjZXMub3BlbmVtYmVkZGVkLm9yZ3wxNDAuMjExLjE2OS4xNjV8OjgwLi4uIGNvbm5l
Y3RlZC4NCiAgICAgICAgSFRUUCByZXF1ZXN0IHNlbnQsIGF3YWl0aW5nIHJlc3BvbnNlLi4uIDQw
NCBOb3QgRm91bmQNCiAgICAgICAgMjAxMC0wMS0wNSAxMzozNzo0NiBFUlJPUiA0MDQ6IE5vdCBG
b3VuZC4NCg0KICAgICAgICBOT1RFOiBmZXRjaCBodHRwOi8vd3d3LmFuZ3N0cm9tLWRpc3RyaWJ1
dGlvbi5vcmcvdW5zdGFibGUvc291cmNlcy93aG9pc180LjUuMjUudGFyLmd6DQogICAgICAgIC0t
MjAxMC0wMS0wNSAxMzozNzo0Ni0tICBodHRwOi8vd3d3LmFuZ3N0cm9tLWRpc3RyaWJ1dGlvbi5v
cmcvdW5zdGFibGUvc291cmNlcy93aG9pc180LjUuMjUudGFyLmd6DQogICAgICAgIFJlc29sdmlu
ZyB3d3cuYW5nc3Ryb20tZGlzdHJpYnV0aW9uLm9yZy4uLiAxODguNDAuODMuMjAwDQogICAgICAg
IENvbm5lY3RpbmcgdG8gd3d3LmFuZ3N0cm9tLWRpc3RyaWJ1dGlvbi5vcmd8MTg4LjQwLjgzLjIw
MHw6ODAuLi4gY29ubmVjdGVkLg0KICAgICAgICBIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcg
cmVzcG9uc2UuLi4gNDA0IE5vdCBGb3VuZA0KICAgICAgICAyMDEwLTAxLTA1IDEzOjM3OjQ3IEVS
Uk9SIDQwNDogTm90IEZvdW5kLg0KDQogICAgICAgIE5PVEU6IFRhc2sgZmFpbGVkOiBGZXRjaCBm
YWlsZWQ6IGZ0cDovL2Z0cC5kZWJpYW4ub3JnL2RlYmlhbi9wb29sL21haW4vdy93aG9pcy93aG9p
c180LjUuMjUudGFyLmd6DQoNClNpZ25lZC1vZmYtYnk6IFBhdWwgTWVuemVsIDxwYXVsZXBhbnRl
ckB1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQotLS0NCiBjb25mL2NoZWNrc3Vtcy5pbmkgICAgICAg
ICAgICB8ICAgIDYgKysrLS0tDQogcmVjaXBlcy93aG9pcy93aG9pc180LjUuMjUuYmIgfCAgICA2
IC0tLS0tLQ0KIHJlY2lwZXMvd2hvaXMvd2hvaXNfNC43LjMwLmJiIHwgICAgNiArKysrKysNCiAz
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCiBkZWxldGUg
bW9kZSAxMDA2NDQgcmVjaXBlcy93aG9pcy93aG9pc180LjUuMjUuYmINCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcmVjaXBlcy93aG9pcy93aG9pc180LjcuMzAuYmINCg0KZGlmZiAtLWdpdCBhL2NvbmYv
Y2hlY2tzdW1zLmluaSBiL2NvbmYvY2hlY2tzdW1zLmluaQ0KaW5kZXggZDA3ZGExNS4uZTE2ZTZi
MiAxMDA2NDQNCi0tLSBhL2NvbmYvY2hlY2tzdW1zLmluaQ0KKysrIGIvY29uZi9jaGVja3N1bXMu
aW5pDQpAQCAtMjc2NjIsOSArMjc2NjIsOSBAQCBzaGEyNTY9NzMxNTk2M2I2ZWVmYjc1MzBiNGE0
ZjYzYTVkNWNjZGFiMzAwNzg3ODRjZjQxY2NiNTI5Nzg3M2Y5YWRlYTJmMw0KIG1kNT1lNjA1MWYx
ZTE0ODdlYzBlYmZkYmRhNzJiZWRjNzBhZA0KIHNoYTI1Nj02OTA0NGI4N2M1MTdiOTg2ZGJjMTdh
NWY3ZTRkZTQzMGNiNTZlNjA1MzMwYzE5YzZiYjBkMzg0ZDVjMzdlNjM4DQogDQotW2Z0cDovL2Z0
cC5kZWJpYW4ub3JnL2RlYmlhbi9wb29sL21haW4vdy93aG9pcy93aG9pc180LjUuMjUudGFyLmd6
XQ0KLW1kNT01MTZmYzU0Y2U3MDllODc0MTMzZmMzYjNjN2MwNTQ0Nw0KLXNoYTI1Nj05OTk3OWZm
MTYxZWUyMDlkYTIxYWUxMThlZmY5Y2E2ZGU3YzVjYjFiMGRjMzM5N2RlMThkZjUzNGUwYWZhZjc2
DQorW2Z0cDovL2Z0cC5kZWJpYW4ub3JnL2RlYmlhbi9wb29sL21haW4vdy93aG9pcy93aG9pc180
LjcuMzAudGFyLmd6XQ0KK21kNT0wNjY3MTkwNDkxYTVhOWRlZDg1OTViOGUzMzBkY2MxMQ0KK3No
YTI1Nj02NzU4MWMwZmE3Yjc1Y2NlYTM2NmU1MzFiODA3YjAyYTdmMWRiZTZmYzU1ZDRjZDQ0MGU4
ZjA5ZWVhNDkxZDM2DQogDQogW2h0dHA6Ly93aWZpLXJhZGFyLnN5c3RlbWltYWdlci5vcmcvcHVi
L3dpZmktcmFkYXItMS45LjYudGFyLmJ6Ml0NCiBtZDU9NGFiNGNjMjJkNjhkZDA2NTVhYjI4Yjc1
YzdhYTYyNDgNCmRpZmYgLS1naXQgYS9yZWNpcGVzL3dob2lzL3dob2lzXzQuNS4yNS5iYiBiL3Jl
Y2lwZXMvd2hvaXMvd2hvaXNfNC41LjI1LmJiDQpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCmlu
ZGV4IDIyOTUyYjAuLjAwMDAwMDANCi0tLSBhL3JlY2lwZXMvd2hvaXMvd2hvaXNfNC41LjI1LmJi
DQorKysgL2Rldi9udWxsDQpAQCAtMSw2ICswLDAgQEANCi1yZXF1aXJlIHdob2lzLmluYw0KLQ0K
LVNSQ19VUkkgPSAiJHtERUJJQU5fTUlSUk9SfS9tYWluL3cvd2hvaXMvd2hvaXNfJHtQVn0udGFy
Lmd6Ig0KLVMgPSAiJHtXT1JLRElSfS93aG9pcy0ke1BWfSINCi0NCi1pbmhlcml0IGdldHRleHQN
CmRpZmYgLS1naXQgYS9yZWNpcGVzL3dob2lzL3dob2lzXzQuNy4zMC5iYiBiL3JlY2lwZXMvd2hv
aXMvd2hvaXNfNC43LjMwLmJiDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4u
MjI5NTJiMA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvcmVjaXBlcy93aG9pcy93aG9pc180LjcuMzAu
YmINCkBAIC0wLDAgKzEsNiBAQA0KK3JlcXVpcmUgd2hvaXMuaW5jDQorDQorU1JDX1VSSSA9ICIk
e0RFQklBTl9NSVJST1J9L21haW4vdy93aG9pcy93aG9pc18ke1BWfS50YXIuZ3oiDQorUyA9ICIk
e1dPUktESVJ9L3dob2lzLSR7UFZ9Ig0KKw0KK2luaGVyaXQgZ2V0dGV4dA0KLS0gDQoxLjYuNS43
DQoNCg==

--=-vQv8mXm1pRvCKwqlAVr2--

--=-QtcNhST1bOdliR0dsp2O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktDPG8ACgkQPX1aK2wOHVj6DgCePDdpcolKJhtcpQyS/K5+I3ZT
NgAAn3J8JIX3scKxp/ph8PhnmHlP8H1d
=JXv2
-----END PGP SIGNATURE-----

--=-QtcNhST1bOdliR0dsp2O--
