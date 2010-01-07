Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NSxhZ-000409-LW for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 20:07:24 +0100
Received: from g229060098.adsl.alicedsl.de ([92.229.60.98]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NSxfa-0003uz-GO for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 19:05:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262697909.3209.26.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1262649107.3238.44.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100105095147.GA3433@rhein.zuhause.netz>
	<1262694630.3209.10.camel@mattotaupa.wohnung.familie-menzel.net>
	<1262697909.3209.26.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Thu, 07 Jan 2010 20:05:17 +0100
Message-ID: <1262891117.3218.16.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/1] Remove `-lintl` from `LIBS`. (was: [bitbake vdr] /arm-angstrom-linux-gnueabi/bin/ld: cannot find -lintl)
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
X-List-Received-Date: Thu, 07 Jan 2010 19:07:26 -0000
X-Groupsio-MsgNum: 15464
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0+cOOwss3O7yLVOKLns4"

--=-0+cOOwss3O7yLVOKLns4
Content-Type: multipart/mixed; boundary="=-kIHxDCEZPCy4657sYJJW"

--=-kIHxDCEZPCy4657sYJJW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear list,


Am Dienstag, den 05.01.2010, 14:25 +0100 schrieb Paul Menzel:
> Am Dienstag, den 05.01.2010, 13:30 +0100 schrieb Paul Menzel:
> > Am Dienstag, den 05.01.2010, 10:51 +0100 schrieb Henning Heinold:
> > > seems I forgot the depency. Will check them in later. This happens wh=
en one
> > > done build vom clean oetmp.
> >=20
> > I merged your changes, did `bitbake -c clean vdr`, `bitbake vdr` and
> > still get the same errors as yesterday/this night. I also tried `bitbak=
e
> > libintl` manually with no success.
> >=20
> > Is there something messed up with my setup?
>=20
> I tried to build another package with `virtual/libintl` in its `DEPENDS`
> and after updating the whois recipe to a newer version (see patch some
> minutes ago) `bitbake whois` succeeded.
>=20
> Is written yesterday, I do not really know what I am doing and how to
> best approach to fix this problem. ;-)

thanks to you all. Please review and commit the attached patch.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

(Is this needed for patchwork to pick this patch up or does it also look
in the attachments?)


Thanks,

Paul

--=-kIHxDCEZPCy4657sYJJW
Content-Disposition: attachment; filename="0001-Remove-lintl-from-LIBS.patch"
Content-Type: text/x-patch; name="0001-Remove-lintl-from-LIBS.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA3MDU2YTQyNThlYjkwOTQ1MjhjZjE0MTM3ZWRiZmU3MDU0Mzg2MzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFRodSwgNyBKYW4gMjAxMCAxOToxMTo1MSArMDEwMA0KU3ViamVj
dDogW1BBVENIIDEvMV0gUmVtb3ZlIGAtbGludGxgIGZyb20gYExJQlNgLg0KTUlNRS1WZXJzaW9u
OiAxLjANCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOA0KQ29udGVudC1U
cmFuc2Zlci1FbmNvZGluZzogOGJpdA0KDQpgZG9fY29tcGlsZWAgZmFpbGVkIHdpdGggdGhlIGZv
bGxvd2luZyBlcnJvciBbMV0uDQoNCglb4oCmXQ0KCWFybS1hbmdzdHJvbS1saW51eC1nbnVlYWJp
LWcrKyAtbWFyY2g9YXJtdjctYSAtbXR1bmU9Y29ydGV4LWE4IC1tZnB1PW5lb24gLW1mbG9hdC1h
Ymk9c29mdGZwIC1pc3lzdGVtL29lL2FuZ3N0cm9tLWRldi9zdGFnaW5nL2FybXY3YS1hbmdzdHJv
bS1saW51eC1nbnVlYWJpL3Vzci9pbmNsdWRlIC1mZXhwZW5zaXZlLW9wdGltaXphdGlvbnMgLWZy
ZW5hbWUtcmVnaXN0ZXJzIC1mb21pdC1mcmFtZS1wb2ludGVyIC1PMiAtZ2dkYjMgLWZwZXJtaXNz
aXZlIC1mdmlzaWJpbGl0eS1pbmxpbmVzLWhpZGRlbiAtcmR5bmFtaWMgYXVkaW8ubyBjaGFubmVs
cy5vIGNpLm8gY29uZmlnLm8gY3V0dGVyLm8gZGV2aWNlLm8gZGlzZXFjLm8gZHZiZGV2aWNlLm8g
ZHZiY2kubyBkdmJvc2QubyBkdmJwbGF5ZXIubyBkdmJzcHUubyBkdmJzdWJ0aXRsZS5vIGVpdC5v
IGVpdHNjYW4ubyBlcGcubyBmaWx0ZXIubyBmb250Lm8gaTE4bi5vIGludGVyZmFjZS5vIGtleXMu
byBsaXJjLm8gbWVudS5vIG1lbnVpdGVtcy5vIG5pdC5vIG9zZGJhc2UubyBvc2QubyBwYXQubyBw
bGF5ZXIubyBwbHVnaW4ubyByY3UubyByZWNlaXZlci5vIHJlY29yZGVyLm8gcmVjb3JkaW5nLm8g
cmVtb3RlLm8gcmVtdXgubyByaW5nYnVmZmVyLm8gc2R0Lm8gc2VjdGlvbnMubyBzaHV0ZG93bi5v
IHNraW5jbGFzc2ljLm8gc2tpbnMubyBza2luc3R0bmcubyBzb3VyY2VzLm8gc3B1Lm8gc3RhdHVz
Lm8gc3ZkcnAubyB0aGVtZXMubyB0aHJlYWQubyB0aW1lcnMubyB0b29scy5vIHRyYW5zZmVyLm8g
dmRyLm8gdmlkZW9kaXIubyAtbGpwZWcgLWxwdGhyZWFkIC1sZGwgLWxjYXAgLWxydCAtbGZyZWV0
eXBlIC1sZm9udGNvbmZpZyAtbGludGwgLUwvb2UvYW5nc3Ryb20tZGV2L3N0YWdpbmcvYXJtdjdh
LWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2xpYiAtV2wsLXJwYXRoLWxpbmssL29lL2FuZ3N0
cm9tLWRldi9zdGFnaW5nL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9saWIgLVds
LC1PMSAtV2wsLS1oYXNoLXN0eWxlPWdudSAgLi9saWJzaS9saWJzaS5hIC1vIHZkcg0KICAgICAg
ICAvb2UvYW5nc3Ryb20tZGV2L2Nyb3NzL2FybXY3YS9saWIvZ2NjL2FybS1hbmdzdHJvbS1saW51
eC1nbnVlYWJpLzQuMy4zLy4uLy4uLy4uLy4uL2FybS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL2Jp
bi9sZDogY2Fubm90IGZpbmQgLWxpbnRsDQogICAgICAgIGNvbGxlY3QyOiBsZCByZXR1cm5lZCAx
IGV4aXQgc3RhdHVzDQogICAgICAgIG1ha2U6ICoqKiBbdmRyXSBFcnJvciAxDQogICAgICAgIEZB
VEFMOiBvZV9ydW5tYWtlIGZhaWxlZA0KCVvigKZdDQoNClvigKZdDQoxMTowMCA8IFBhdWxlUGFu
dGVyPiB6ZWNrZTogSSB3aWxsIHRyeSB0byByZW1vdmUgdGhlIGAtbGludGxgIGZyb20gdGhlIGNh
bGwuDQoxMTowMiA8IHplY2tlPiBQYXVsZVBhbnRlcjogaXQgd29ya3MgdGhlbi4gRm9yIHVjbGli
YyBhbmQgc3VjaCB3ZSBuZWVkIC1saW50bCBidXQgbm90IGZvciBnbGliYyAoQUZBSUspDQpb4oCm
XQ0KDQpbMV0gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRl
ZC1kZXZlbC8yMDEwLUphbnVhcnkvMDE1OTYwLmh0bWwNCg0KU2lnbmVkLW9mZi1ieTogUGF1bCBN
ZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCi0tLQ0KIHJlY2lwZXMv
dmRyL2ZpbGVzL2xpYmludGwucGF0Y2ggICAgIHwgICAxMyAtLS0tLS0tLS0tLS0tDQogcmVjaXBl
cy92ZHIvZmlsZXMvbGlua2VyZmxhZ3MucGF0Y2ggfCAgICA0ICsrLS0NCiByZWNpcGVzL3Zkci92
ZHJfMS43LjEwLmJiICAgICAgICAgICB8ICAgIDMgKy0tDQogMyBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KIGRlbGV0ZSBtb2RlIDEwMDY0NCByZWNpcGVz
L3Zkci9maWxlcy9saWJpbnRsLnBhdGNoDQoNCmRpZmYgLS1naXQgYS9yZWNpcGVzL3Zkci9maWxl
cy9saWJpbnRsLnBhdGNoIGIvcmVjaXBlcy92ZHIvZmlsZXMvbGliaW50bC5wYXRjaA0KZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCA1MzU0MDQwLi4wMDAwMDAwDQotLS0gYS9yZWNpcGVz
L3Zkci9maWxlcy9saWJpbnRsLnBhdGNoDQorKysgL2Rldi9udWxsDQpAQCAtMSwxMyArMCwwIEBA
DQotSW5kZXg6IHZkci0xLjcuMTAvTWFrZWZpbGUNCi09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotLS0tIHZkci0xLjcu
MTAub3JpZy9NYWtlZmlsZQkyMDEwLTAxLTAzIDE3OjM3OjM0LjQ4MTUwMzg2NiArMDEwMA0KLSsr
KyB2ZHItMS43LjEwL01ha2VmaWxlCTIwMTAtMDEtMDMgMTc6Mzc6NDYuNzA4MTY4MDE2ICswMTAw
DQotQEAgLTIwLDcgKzIwLDcgQEANCi0gTUFORElSICAgPSAkKFBSRUZJWCkvc2hhcmUvbWFuDQot
IEJJTkRJUiAgID0gJChQUkVGSVgpL2Jpbg0KLSBMT0NESVIgICA9IC4vbG9jYWxlDQotLUxJQlMg
ICAgID0gLWxqcGVnIC1scHRocmVhZCAtbGRsIC1sY2FwIC1scnQgLWxmcmVldHlwZSAtbGZvbnRj
b25maWcNCi0rTElCUyAgICAgPSAtbGpwZWcgLWxwdGhyZWFkIC1sZGwgLWxjYXAgLWxydCAtbGZy
ZWV0eXBlIC1sZm9udGNvbmZpZyAtbGludGwNCi0gSU5DTFVERVMgPSAke0NGTEFHU30NCi0gDQot
IFBMVUdJTkRJUj0gLi9QTFVHSU5TDQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy92ZHIvZmlsZXMvbGlu
a2VyZmxhZ3MucGF0Y2ggYi9yZWNpcGVzL3Zkci9maWxlcy9saW5rZXJmbGFncy5wYXRjaA0KaW5k
ZXggNmFlMmZlZi4uZDQwMGFjMyAxMDA2NDQNCi0tLSBhL3JlY2lwZXMvdmRyL2ZpbGVzL2xpbmtl
cmZsYWdzLnBhdGNoDQorKysgYi9yZWNpcGVzL3Zkci9maWxlcy9saW5rZXJmbGFncy5wYXRjaA0K
QEAgLTYsOCArNiw4IEBAIEluZGV4OiB2ZHItMS43LjEwL01ha2VmaWxlDQogIE1BTkRJUiAgID0g
JChQUkVGSVgpL3NoYXJlL21hbg0KICBCSU5ESVIgICA9ICQoUFJFRklYKS9iaW4NCiAgTE9DRElS
ICAgPSAuL2xvY2FsZQ0KLS1MSUJTICAgICA9IC1sanBlZyAtbHB0aHJlYWQgLWxkbCAtbGNhcCAt
bHJ0IC1sZnJlZXR5cGUgLWxmb250Y29uZmlnIC1saW50bA0KLStMSUJTICAgICA9IC1sanBlZyAt
bHB0aHJlYWQgLWxkbCAtbGNhcCAtbHJ0IC1sZnJlZXR5cGUgLWxmb250Y29uZmlnIC1saW50bCAk
e0xERkxBR1N9DQorLUxJQlMgICAgID0gLWxqcGVnIC1scHRocmVhZCAtbGRsIC1sY2FwIC1scnQg
LWxmcmVldHlwZSAtbGZvbnRjb25maWcNCisrTElCUyAgICAgPSAtbGpwZWcgLWxwdGhyZWFkIC1s
ZGwgLWxjYXAgLWxydCAtbGZyZWV0eXBlIC1sZm9udGNvbmZpZyAke0xERkxBR1N9DQogIElOQ0xV
REVTID0gJHtDRkxBR1N9DQogIA0KICBQTFVHSU5ESVI9IC4vUExVR0lOUw0KZGlmZiAtLWdpdCBh
L3JlY2lwZXMvdmRyL3Zkcl8xLjcuMTAuYmIgYi9yZWNpcGVzL3Zkci92ZHJfMS43LjEwLmJiDQpp
bmRleCBiNGNjNWNlLi5hNDI1MWY4IDEwMDY0NA0KLS0tIGEvcmVjaXBlcy92ZHIvdmRyXzEuNy4x
MC5iYg0KKysrIGIvcmVjaXBlcy92ZHIvdmRyXzEuNy4xMC5iYg0KQEAgLTQsMTIgKzQsMTEgQEAg
TElDRU5TRSA9ICJHUEx2MiINCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LnR2ZHIuZGUiDQogUFIg
PSAicjEiDQogDQotREVQRU5EUyA9ICJmb250Y29uZmlnIGZyZWV0eXBlIGdldHRleHQgbGliY2Fw
IGpwZWcgdmlydHVhbC9saWJpbnRsIg0KK0RFUEVORFMgPSAiZm9udGNvbmZpZyBmcmVldHlwZSBn
ZXR0ZXh0IGxpYmNhcCBqcGVnIg0KIA0KIFNSQ19VUkkgPSAiZnRwOi8vZnRwLnR2ZHIuZGUvdmRy
L0RldmVsb3Blci8ke1B9LnRhci5iejIgXA0KICAgICAgICAgICAgZmlsZTovL2ZpeHBhdGhzLnBh
dGNoO3BhdGNoPTEgXA0KICAgICAgICAgICAgZmlsZTovL2NwbHVzcGx1cy5wYXRjaDtwYXRjaD0x
IFwNCi0gICAgICAgICAgIGZpbGU6Ly9saWJpbnRsLnBhdGNoO3BhdGNoPTEgXA0KICAgICAgICAg
ICAgZmlsZTovL2Rpc2FibGVfcGx1Z2luLnBhdGNoO3BhdGNoPTEgXA0KICAgICAgICAgICAgZmls
ZTovL2xpbmtlcmZsYWdzLnBhdGNoO3BhdGNoPTEgXA0KICAgICAgICAgICAiDQotLSANCjEuNi41
LjcNCg0K

--=-kIHxDCEZPCy4657sYJJW--

--=-0+cOOwss3O7yLVOKLns4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktGMGwACgkQPX1aK2wOHVhjOACfdM/zbkkRtxdveUvngHo5DakS
9aMAnRHWwZ6l0p6W3zzosvr5gS6NKR9B
=gHcE
-----END PGP SIGNATURE-----

--=-0+cOOwss3O7yLVOKLns4--
