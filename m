Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NPlg9-0007Fu-0S for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 00:40:44 +0100
Received: from g225082249.adsl.alicedsl.de ([92.225.82.249]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NPleG-0006w2-Vh for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 23:38:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2009 00:39:17 +0100
Message-ID: <1262129957.3447.37.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [`bitbake initramfs-kexecboot-image`] [kexecboot_git.bb] ERROR: function do_compile failed
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
X-List-Received-Date: Tue, 29 Dec 2009 23:40:44 -0000
X-Groupsio-MsgNum: 15285
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-z4Y2NXafMAn1dQPpeYeD"

--=-z4Y2NXafMAn1dQPpeYeD
Content-Type: multipart/mixed; boundary="=-wJkc+ubCgsD7nDC2mTlV"

--=-wJkc+ubCgsD7nDC2mTlV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OpenEmbedded hackers,


after reading Koen=E2=80=99s reply [1] I tried to `bitbake
initramfs-kexecboot-image`. But do_compile failed for kexecboot_git.bb.
Here is the snippet from the error log.

        [=E2=80=A6]
        In file included from util.h:24,
                         from cfgparser.c:40:
        /oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/lib/klibc/in=
clude/asm/setup.h:143: error: expected specifier-qualifier-list before 'u8'
        In file included from util.h:24,
                         from devicescan.c:37:
        /oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/lib/klibc/in=
clude/asm/setup.h:143: error: expected specifier-qualifier-list before 'u8'
        make[1]: *** [cfgparser.o] Error 1
        make[1]: *** Waiting for unfinished jobs....
        make[1]: *** [devicescan.o] Error 1
        In file included from util.h:24,
                         from fb.h:34,
                         from fb.c:25:
        /oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/lib/klibc/in=
clude/asm/setup.h:143: error: expected specifier-qualifier-list before 'u8'
        make[1]: *** [fb.o] Error 1
        In file included from util.h:24,
                         from fb.h:34,
                         from gui.c:23:
        /oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/lib/klibc/in=
clude/asm/setup.h:143: error: expected specifier-qualifier-list before 'u8'
        make[1]: *** [gui.o] Error 1
        [=E2=80=A6]

I am building angstrom-2008.1 for beagleboard. The full log and
local.conf is attached.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-December/0=
15845.html

--=-wJkc+ubCgsD7nDC2mTlV
Content-Disposition: attachment; filename="local.conf"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="local.conf"; charset="UTF-8"

IyBXaGVyZSB0byBzdG9yZSBzb3VyY2VzDQpETF9ESVIgPSAiJHtPRVRSRUV9L2Rvd25sb2FkcyIN
Cg0KSU5IRVJJVCArPSAiIHJtX3dvcmsgIg0KDQojIE1ha2Ugc3VyZSB5b3UgaGF2ZSB0aGVzZSBp
bnN0YWxsZWQNCkFTU1VNRV9QUk9WSURFRCArPSAiZ2RrLXBpeGJ1Zi1jc291cmNlLW5hdGl2ZSBp
bWFnZW1hZ2ljay1uYXRpdmUgbGlicnN2Zy1uYXRpdmUiDQoNCiMgV2hpY2ggZmlsZXMgZG8gd2Ug
d2FudCB0byBwYXJzZToNCkJCRklMRVMgOj0gIiR7T0VUUkVFfS9vcGVuZW1iZWRkZWQvcmVjaXBl
cy8qLyouYmIiDQpCQk1BU0sgPSAiIg0KIA0KIyBXaGF0IGtpbmQgb2YgaW1hZ2VzIGRvIHdlIHdh
bnQ/DQpJTUFHRV9GU1RZUEVTICs9ICIgdGFyLmJ6MiAiDQoNCiMgU2V0IFRNUERJUiBpbnN0ZWFk
IG9mIGRlZmF1bHRpbmcgaXQgdG8gJHB3ZC90bXANClRNUERJUiA9ICIke09FVFJFRX0vJHtESVNU
Uk99LWRldiINCg0KIyBNYWtlIHVzZSBvZiBTTVAgYW5kIGZhc3QgZGlza3MNClBBUkFMTEVMX01B
S0UgPSAiLWo0Ig0KQkJfTlVNQkVSX1RIUkVBRFMgPSAiNCINCg0KRElTVFJPID0gImFuZ3N0cm9t
LTIwMDguMSINCg0KTUFDSElORSA9ICJiZWFnbGVib2FyZCINCkJVSUxEX0FSQ0ggPSAiaTY4NiIN
CkJVSUxEX09TID0gImxpbnV4Ig0KDQpCQl9OSUNFX0xFVkVMPSIxOSINCg==

--=-wJkc+ubCgsD7nDC2mTlV
Content-Disposition: attachment; filename="log.do_compile.9705"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="log.do_compile.9705"; charset="UTF-8"

Tk9URTogbWFrZSAtajQNCm1ha2UgIGFsbC1hbQ0KbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5
IGAvb2UvYW5nc3Ryb20tZGV2L3dvcmsvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkva2V4
ZWNib290LTAuNS1yMTArZ2l0cjc2Zjc2NGNlYmUxZmIwMjA3YjQ0ODUwYjUyZWI1ZjU3ZWNlNmYz
NjMvZ2l0Jw0KYXJtLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkta2xjYyAtREhBVkVfQ09ORklHX0gg
LUkuICAgLWlzeXN0ZW0vb2UvYW5nc3Ryb20tZGV2L3N0YWdpbmcvYXJtdjdhLWFuZ3N0cm9tLWxp
bnV4LWdudWVhYmkvdXNyL2luY2x1ZGUgLVdhbGwgLWlzeXN0ZW0vb2UvYW5nc3Ryb20tZGV2L3N0
YWdpbmcvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2luY2x1ZGUgLWZleHBlbnNp
dmUtb3B0aW1pemF0aW9ucyAtZnJlbmFtZS1yZWdpc3RlcnMgLWZvbWl0LWZyYW1lLXBvaW50ZXIg
LU8yIC1nZ2RiMyAtTVQgY2ZncGFyc2VyLm8gLU1EIC1NUCAtTUYgLmRlcHMvY2ZncGFyc2VyLlRw
byAtYyAtbyBjZmdwYXJzZXIubyBjZmdwYXJzZXIuYw0KYXJtLWFuZ3N0cm9tLWxpbnV4LWdudWVh
Ymkta2xjYyAtREhBVkVfQ09ORklHX0ggLUkuICAgLWlzeXN0ZW0vb2UvYW5nc3Ryb20tZGV2L3N0
YWdpbmcvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2luY2x1ZGUgLVdhbGwgLWlz
eXN0ZW0vb2UvYW5nc3Ryb20tZGV2L3N0YWdpbmcvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVh
YmkvdXNyL2luY2x1ZGUgLWZleHBlbnNpdmUtb3B0aW1pemF0aW9ucyAtZnJlbmFtZS1yZWdpc3Rl
cnMgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLU8yIC1nZ2RiMyAtTVQgZGV2aWNlc2Nhbi5vIC1NRCAt
TVAgLU1GIC5kZXBzL2RldmljZXNjYW4uVHBvIC1jIC1vIGRldmljZXNjYW4ubyBkZXZpY2VzY2Fu
LmMNCmFybS1hbmdzdHJvbS1saW51eC1nbnVlYWJpLWtsY2MgLURIQVZFX0NPTkZJR19IIC1JLiAg
IC1pc3lzdGVtL29lL2FuZ3N0cm9tLWRldi9zdGFnaW5nL2FybXY3YS1hbmdzdHJvbS1saW51eC1n
bnVlYWJpL3Vzci9pbmNsdWRlIC1XYWxsIC1pc3lzdGVtL29lL2FuZ3N0cm9tLWRldi9zdGFnaW5n
L2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9pbmNsdWRlIC1mZXhwZW5zaXZlLW9w
dGltaXphdGlvbnMgLWZyZW5hbWUtcmVnaXN0ZXJzIC1mb21pdC1mcmFtZS1wb2ludGVyIC1PMiAt
Z2dkYjMgLU1UIGZiLm8gLU1EIC1NUCAtTUYgLmRlcHMvZmIuVHBvIC1jIC1vIGZiLm8gZmIuYw0K
YXJtLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkta2xjYyAtREhBVkVfQ09ORklHX0ggLUkuICAgLWlz
eXN0ZW0vb2UvYW5nc3Ryb20tZGV2L3N0YWdpbmcvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVh
YmkvdXNyL2luY2x1ZGUgLVdhbGwgLWlzeXN0ZW0vb2UvYW5nc3Ryb20tZGV2L3N0YWdpbmcvYXJt
djdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2luY2x1ZGUgLWZleHBlbnNpdmUtb3B0aW1p
emF0aW9ucyAtZnJlbmFtZS1yZWdpc3RlcnMgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLU8yIC1nZ2Ri
MyAtTVQgZ3VpLm8gLU1EIC1NUCAtTUYgLmRlcHMvZ3VpLlRwbyAtYyAtbyBndWkubyBndWkuYw0K
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIHV0aWwuaDoyNCwNCiAgICAgICAgICAgICAgICAgZnJvbSBj
ZmdwYXJzZXIuYzo0MDoNCi9vZS9hbmdzdHJvbS1kZXYvc3RhZ2luZy9hcm12N2EtYW5nc3Ryb20t
bGludXgtZ251ZWFiaS9saWIva2xpYmMvaW5jbHVkZS9hc20vc2V0dXAuaDoxNDM6IGVycm9yOiBl
eHBlY3RlZCBzcGVjaWZpZXItcXVhbGlmaWVyLWxpc3QgYmVmb3JlICd1OCcNCkluIGZpbGUgaW5j
bHVkZWQgZnJvbSB1dGlsLmg6MjQsDQogICAgICAgICAgICAgICAgIGZyb20gZGV2aWNlc2Nhbi5j
OjM3Og0KL29lL2FuZ3N0cm9tLWRldi9zdGFnaW5nL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVl
YWJpL2xpYi9rbGliYy9pbmNsdWRlL2FzbS9zZXR1cC5oOjE0MzogZXJyb3I6IGV4cGVjdGVkIHNw
ZWNpZmllci1xdWFsaWZpZXItbGlzdCBiZWZvcmUgJ3U4Jw0KbWFrZVsxXTogKioqIFtjZmdwYXJz
ZXIub10gRXJyb3IgMQ0KbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4u
Li4NCm1ha2VbMV06ICoqKiBbZGV2aWNlc2Nhbi5vXSBFcnJvciAxDQpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gdXRpbC5oOjI0LA0KICAgICAgICAgICAgICAgICBmcm9tIGZiLmg6MzQsDQogICAgICAg
ICAgICAgICAgIGZyb20gZmIuYzoyNToNCi9vZS9hbmdzdHJvbS1kZXYvc3RhZ2luZy9hcm12N2Et
YW5nc3Ryb20tbGludXgtZ251ZWFiaS9saWIva2xpYmMvaW5jbHVkZS9hc20vc2V0dXAuaDoxNDM6
IGVycm9yOiBleHBlY3RlZCBzcGVjaWZpZXItcXVhbGlmaWVyLWxpc3QgYmVmb3JlICd1OCcNCm1h
a2VbMV06ICoqKiBbZmIub10gRXJyb3IgMQ0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHV0aWwuaDoy
NCwNCiAgICAgICAgICAgICAgICAgZnJvbSBmYi5oOjM0LA0KICAgICAgICAgICAgICAgICBmcm9t
IGd1aS5jOjIzOg0KL29lL2FuZ3N0cm9tLWRldi9zdGFnaW5nL2FybXY3YS1hbmdzdHJvbS1saW51
eC1nbnVlYWJpL2xpYi9rbGliYy9pbmNsdWRlL2FzbS9zZXR1cC5oOjE0MzogZXJyb3I6IGV4cGVj
dGVkIHNwZWNpZmllci1xdWFsaWZpZXItbGlzdCBiZWZvcmUgJ3U4Jw0KbWFrZVsxXTogKioqIFtn
dWkub10gRXJyb3IgMQ0KbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgYC9vZS9hbmdzdHJvbS1k
ZXYvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9rZXhlY2Jvb3QtMC41LXIxMCtn
aXRyNzZmNzY0Y2ViZTFmYjAyMDdiNDQ4NTBiNTJlYjVmNTdlY2U2ZjM2My9naXQnDQptYWtlOiAq
KiogW2FsbF0gRXJyb3IgMg0KRkFUQUw6IG9lX3J1bm1ha2UgZmFpbGVkDQo=

--=-wJkc+ubCgsD7nDC2mTlV--

--=-z4Y2NXafMAn1dQPpeYeD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAks6kyUACgkQPX1aK2wOHViWHACdEzFBZyE4R5H+1J6u4evSQVGL
igUAn1Mj3UI+RYtHd4f6MyUHt0XSb2V5
=2qHw
-----END PGP SIGNATURE-----

--=-z4Y2NXafMAn1dQPpeYeD--
