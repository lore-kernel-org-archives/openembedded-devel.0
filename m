Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OyLMl-0005HL-Ak for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 11:12:01 +0200
Received: from f053038050.adsl.alicedsl.de ([78.53.38.50]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OyLMe-0008LW-7O for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 09:11:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100921051747.GA3989@thinky>
References: <1284228112.14396.159.camel@mattotaupa>
	<1285021068.2453.80.camel@mattotaupa>  <20100921051747.GA3989@thinky>
Date: Wed, 22 Sep 2010 11:11:42 +0200
Message-ID: <1285146702.4175.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-uclibc: freesmartphone/libfsobasics_git.bb: do_compile() failed: utilities.c:35:25: error: sys/eventfd.h: No such file or directory (was: utilities.c:35:22: fatal error: execinfo.h: No such file or directory)
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
X-List-Received-Date: Wed, 22 Sep 2010 09:12:06 -0000
X-Groupsio-MsgNum: 23838
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-udKpkWKrnlE69JjfPF5L"

--=-udKpkWKrnlE69JjfPF5L
Content-Type: multipart/mixed; boundary="=-UffLfoamTcT2Y0NM8zc3"

--=-UffLfoamTcT2Y0NM8zc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Frederik,


Am Dienstag, den 21.09.2010, 07:17 +0200 schrieb Frederik Sdun:

[=E2=80=A6]

> fso is quit untested with none GNU libcs and we partly depend on it. I
> wrote a short patch which add a --enable-no-gnuism switch for configure,
> but want to talk to Michael, before commiting it. Could you test it and
> report more gnuism in our code?

thank you for your patch. It partly reduced the problem. It now chokes
on `eventfd.h`. Unfortunately I do not know anything about if there are
any non glibc equivalents.

	[=E2=80=A6]
	| kobjectnotifier.c:188: warning: passing argument 2 of 'bind' from incomp=
atible pointer type
	| /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/sys/socket.h:115: note: expected 'const struct sockaddr=
 *' but argument is of type 'struct sockaddr_nl *'
	|   CC     libinitexit.lo
	|   CC     logger.lo
	|   CC     netlinknotifier.lo
	| netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_cons=
truct':
	| netlinknotifier.c:206: warning: passing argument 4 of 'g_hash_table_new_=
full' from incompatible pointer type
	| /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/ghash.h:62: note: expected 'GDestroyNotif=
y' but argument is of type 'void (*)(struct GList *)'
	| netlinknotifier.c: In function '_lambda0_':
	| netlinknotifier.c:260: warning: assignment discards qualifiers from poin=
ter target type
	| netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_hand=
leNetlinkMessage':
	| netlinknotifier.c:296: warning: assignment makes pointer from integer wi=
thout a cast
	| netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_hand=
leMessage':
	| netlinknotifier.c:344: warning: cast to pointer from integer of differen=
t size
	| netlinknotifier.c: In function '_fso_framework_base_netlink_notifier_add=
Match':
	| netlinknotifier.c:366: warning: cast to pointer from integer of differen=
t size
	| netlinknotifier.c:372: warning: cast to pointer from integer of differen=
t size
	|   CC     netlinkutils.lo
	|   CC     overlay.lo
	|   CC     process.lo
	|   CC     smartkeyfile.lo
	|   CC     syncasync.lo
	|   CC     threading.lo
	| threading.c: In function 'fso_framework_threading_callDelegateOnMainThre=
ad':
	| threading.c:451: warning: passing argument 4 of 'g_idle_add_full' from i=
ncompatible pointer type
	| /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/gmain.h:291: note: expected 'GDestroyNoti=
fy' but argument is of type 'void (*)(struct Block3Data *)'
	| threading.c:455: warning: passing argument 4 of 'g_idle_add_full' from i=
ncompatible pointer type
	| /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/gmain.h:291: note: expected 'GDestroyNoti=
fy' but argument is of type 'void (*)(struct Block3Data *)'
	| threading.c:458: warning: passing argument 4 of 'g_idle_add_full' from i=
ncompatible pointer type
	| /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/gmain.h:291: note: expected 'GDestroyNoti=
fy' but argument is of type 'void (*)(struct Block3Data *)'
	|   CC     types.lo
	|   CC     utilities.lo
	| utilities.c:35:25: error: sys/eventfd.h: No such file or directory
	| make[3]: *** [utilities.lo] Error 1
	| make[3]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/=
work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+2f8221fea7c667d=
2ee46ff6b8dace2d53b8860cc-r2.0/git/libfsobasics/fsobasics'
	| make[2]: *** [all] Error 2
	| make[2]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/=
work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+2f8221fea7c667d=
2ee46ff6b8dace2d53b8860cc-r2.0/git/libfsobasics/fsobasics'
	| make[1]: *** [all-recursive] Error 1
	| make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/=
work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+2f8221fea7c667d=
2ee46ff6b8dace2d53b8860cc-r2.0/git/libfsobasics'
	| make: *** [all] Error 2
	| FATAL: oe_runmake failed
	| ERROR: Function do_compile failed

I am attaching the patch file to include your patch into OE easily for test=
ing.


Thanks,

Paul

--=-UffLfoamTcT2Y0NM8zc3
Content-Disposition: attachment;
	filename*0=0001-libfsobascis_git.bb-Add-patch-to-compile-with-uClibc.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-libfsobascis_git.bb-Add-patch-to-compile-with-uClibc.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA2YjdkYzc0MGYyOWU1ZjJkYjViN2I5NzFmYjQwM2E4ZDI5Y2I1M2ExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFR1ZSwgMjEgU2VwIDIwMTAgMTA6NTg6MjAgKzAyMDANClN1Ympl
Y3Q6IFtQQVRDSF0gbGliZnNvYmFzY2lzX2dpdC5iYjogQWRkIHBhdGNoIHRvIGNvbXBpbGUgd2l0
aCB1Q2xpYmMuDQpNSU1FLVZlcnNpb246IDEuMA0KQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04DQpDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0DQoNCnVDbGliYyBk
b2VzIG5vdCBwcm92aWRlIGBleGVjaW5mby5oYCwgd2hpY2ggaXMgYSDigJxHTlVpc23igJ0gWzFd
Lg0KDQpBcHBseWluZyB0aGlzIHBhdGNoIGZyb20gRnJlZGVyaWsgU2R1biBbMV0gYW5kIHBhc3Np
bmcgYC0tZW5hYmxlLW5vLWdudWlzbWAgdG8gY29uZmlndXJlIHdoZW4gY29tcGlsaW5nIHdpdGgg
dUNsaWJjIGxldHMgYGxpYmZzb2Jhc2ljc19naXQuYmJgIGJ1aWxkIHdpdGggdUNsaWJjLg0KDQpJ
IGp1c3QgY29tcGlsZSB0ZXN0ZWQgdGhpcyBhbmQgaXQgc29sdmVzIHRoZSBgZXhlY2luZm8uaGAg
ZXJyb3IuIE5vdyBpdCBmYWlscyB3aXRoIGBldmVudGZkLmhgLg0KDQpbMV0gaHR0cDovL2xpc3Rz
LmxpbnV4dG9nby5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRlZC1kZXZlbC8yMDEwLVNlcHRlbWJl
ci8wMjQ0MTEuaHRtbA0KDQpTaWduZWQtb2ZmLWJ5OiBQYXVsIE1lbnplbCA8cGF1bGVwYW50ZXJA
dXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KLS0tDQogcmVjaXBlcy9mcmVlc21hcnRwaG9uZS9saWJm
c29iYXNpY3Mvbm9nbnVpc20ucGF0Y2ggfCAgIDU0ICsrKysrKysrKysrKysrKysrKysrDQogcmVj
aXBlcy9mcmVlc21hcnRwaG9uZS9saWJmc29iYXNpY3NfZ2l0LmJiICAgICAgICAgfCAgICA2ICsr
LQ0KIDIgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcmVjaXBlcy9mcmVlc21hcnRwaG9uZS9saWJmc29iYXNpY3Mvbm9n
bnVpc20ucGF0Y2gNCg0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvZnJlZXNtYXJ0cGhvbmUvbGliZnNv
YmFzaWNzL25vZ251aXNtLnBhdGNoIGIvcmVjaXBlcy9mcmVlc21hcnRwaG9uZS9saWJmc29iYXNp
Y3Mvbm9nbnVpc20ucGF0Y2gNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi40
NTViNzZlDQotLS0gL2Rldi9udWxsDQorKysgYi9yZWNpcGVzL2ZyZWVzbWFydHBob25lL2xpYmZz
b2Jhc2ljcy9ub2dudWlzbS5wYXRjaA0KQEAgLTAsMCArMSw1NCBAQA0KK2RpZmYgLS1naXQgYS9s
aWJmc29iYXNpY3MvY29uZmlndXJlLmFjIGIvbGliZnNvYmFzaWNzL2NvbmZpZ3VyZS5hYw0KK2lu
ZGV4IGJhMDY5MDcuLmQ5ZDQxNzIgMTAwNjQ0DQorLS0tIGEvbGliZnNvYmFzaWNzL2NvbmZpZ3Vy
ZS5hYw0KKysrKyBiL2xpYmZzb2Jhc2ljcy9jb25maWd1cmUuYWMNCitAQCAtNDgsNiArNDgsMTIg
QEAgQUNfQVJHX0VOQUJMRShkZWJ1ZywNCisgICBbZGVidWc9Im5vIl0pDQorIEFNX0NPTkRJVElP
TkFMKCBbV0FOVF9ERUJVR10sIFt0ZXN0IHgiJGRlYnVnIiA9IHgieWVzIl0pDQorIA0KKytBQ19B
UkdfRU5BQkxFKG5vX2dudWlzbSwNCisrICBbICAtLWVuYWJsZS1uby1nbnVpc20gICAgICAgIEVu
YWJsZSBidWlsZCBmb3Igbm9uZSBHTlUtbGliYyAoZGVmYXVsdD1kaXNhYmxlZCldLA0KKysgIFtu
b19nbnVpc209JGVuYWJsZXZhbF0sDQorKyAgW25vX2dudWlzbT0ibm8iXSkNCisrQU1fQ09ORElU
SU9OQUwoIFtXQU5UX05PX0dOVUlTTV0sIFt0ZXN0IHgiJG5vX2dudWlzbSIgPSB4InllcyJdKQ0K
KysNCisgIyBnaXQgdmVyc2lvbg0KKyBHSVRWPWBjYXQgLi4vLmdpdC9yZWZzL2hlYWRzL21hc3Rl
ciB8fCBlY2hvICJ1bmtub3duImANCisgQUNfREVGSU5FX1VOUVVPVEVEKFtQQUNLQUdFX0dJVFZd
LCBbIiR7R0lUVn0iXSwgW2dpdCB2ZXJzaW9uXSkNCitkaWZmIC0tZ2l0IGEvbGliZnNvYmFzaWNz
L2Zzb2Jhc2ljcy9NYWtlZmlsZS5hbSBiL2xpYmZzb2Jhc2ljcy9mc29iYXNpY3MvTWFrZWZpbGUu
YW0NCitpbmRleCA2NmE3Y2Q3Li4wZmM1MzRhIDEwMDY0NA0KKy0tLSBhL2xpYmZzb2Jhc2ljcy9m
c29iYXNpY3MvTWFrZWZpbGUuYW0NCisrKysgYi9saWJmc29iYXNpY3MvZnNvYmFzaWNzL01ha2Vm
aWxlLmFtDQorQEAgLTIzLDYgKzIzLDEwIEBAIFZBTEFDX0FSR1MgKz0gLWcgLUQgREVCVUcNCisg
QU1fQ0ZMQUdTICs9IC1nZ2RiIC1PMA0KKyBlbmRpZg0KKyANCisraWYgV0FOVF9OT19HTlVJU00N
CisrVkFMQUNfQVJHUyArPSAtRCBOT19HTlVJU00NCisrZW5kaWYNCisrDQorIEJVSUxUX1NPVVJD
RVMgPSBmc29iYXNpY3MudmFsYS5zdGFtcA0KKyANCisgbGliX0xUTElCUkFSSUVTID0gXA0KK2Rp
ZmYgLS1naXQgYS9saWJmc29iYXNpY3MvZnNvYmFzaWNzL3V0aWxpdGllcy52YWxhIGIvbGliZnNv
YmFzaWNzL2Zzb2Jhc2ljcy91dGlsaXRpZXMudmFsYQ0KK2luZGV4IDIyZDEwN2QuLjZlZDVmYzgg
MTAwNjQ0DQorLS0tIGEvbGliZnNvYmFzaWNzL2Zzb2Jhc2ljcy91dGlsaXRpZXMudmFsYQ0KKysr
KyBiL2xpYmZzb2Jhc2ljcy9mc29iYXNpY3MvdXRpbGl0aWVzLnZhbGENCitAQCAtNDIwLDYgKzQy
MCw5IEBAIG5hbWVzcGFjZSBGc29GcmFtZXdvcmsgeyBuYW1lc3BhY2UgVXRpbGl0eSB7DQorICAg
ICBwdWJsaWMgc3RyaW5nW10gY3JlYXRlQmFja3RyYWNlKCkNCisgICAgIHsNCisgICAgICAgICBz
dHJpbmdbXSByZXN1bHQgPSBuZXcgc3RyaW5nW10geyB9Ow0KKysjaWYgTk9fR05VSVNNDQorKyAg
ICAgICAgcmVzdWx0ICs9ICJCYWNrdHJhY2Ugbm90IHN1cHBvcnQgZm9yIG5vbmUgR05VIGxpYmNz
IjsNCisrI2Vsc2UNCisgICAgICAgICB2b2lkKiBidWZmZXIgPSBtYWxsb2MwKCBCQUNLVFJBQ0Vf
U0laRSAqIHNpemVvZihzdHJpbmcpICk7DQorICAgICAgICAgdmFyIHNpemUgPSBMaW51eC5iYWNr
dHJhY2UoIGJ1ZmZlciwgQkFDS1RSQUNFX1NJWkUgKTsNCisgICAgICAgICBzdHJpbmdbXSBzeW1i
b2xzID0gTGludXguYmFja3RyYWNlX3N5bWJvbHMoIGJ1ZmZlciwgc2l6ZSApOw0KK0BAIC00Mjks
NiArNDMyLDcgQEAgbmFtZXNwYWNlIEZzb0ZyYW1ld29yayB7IG5hbWVzcGFjZSBVdGlsaXR5IHsN
CisgICAgICAgICAgICAgcmVzdWx0ICs9ICIlc1xuIi5wcmludGYoIHN5bWJvbHNbaV0gKTsNCisg
ICAgICAgICB9DQorICAgICAgICAgcmVzdWx0ICs9ICItLS0gRU5EIEJBQ0tUUkFDRSAtLS1cbiI7
DQorKyNlbmRpZg0KKyAgICAgICAgIHJldHVybiByZXN1bHQ7DQorICAgICB9DQorIA0KZGlmZiAt
LWdpdCBhL3JlY2lwZXMvZnJlZXNtYXJ0cGhvbmUvbGliZnNvYmFzaWNzX2dpdC5iYiBiL3JlY2lw
ZXMvZnJlZXNtYXJ0cGhvbmUvbGliZnNvYmFzaWNzX2dpdC5iYg0KaW5kZXggNDJiMmVkNy4uMDE4
ZTBkMiAxMDA2NDQNCi0tLSBhL3JlY2lwZXMvZnJlZXNtYXJ0cGhvbmUvbGliZnNvYmFzaWNzX2dp
dC5iYg0KKysrIGIvcmVjaXBlcy9mcmVlc21hcnRwaG9uZS9saWJmc29iYXNpY3NfZ2l0LmJiDQpA
QCAtNSw0ICs1LDggQEAgREVQRU5EUyArPSAibGlibmwyIg0KIFNSQ1JFViA9ICIke0ZTT19DT1JO
VUNPUElBX1NSQ1JFVn0iDQogUFYgPSAiMC45LjEwK2dpdHIke1NSQ1BWfSINCiBQRSA9ICIxIg0K
LVBSID0gIiR7SU5DX1BSfS4wIg0KK1BSID0gIiR7SU5DX1BSfS4xIg0KKw0KK1NSQ19VUkkgKz0g
ImZpbGU6Ly9ub2dudWlzbS5wYXRjaDtzdHJpcGxldmVsPTIiDQorDQorRVhUUkFfT0VDT05GX2Fw
cGVuZF91Y2xpbnV4LXVjbGliYyA9ICIgLS1lbmFibGUtbm8tZ251aXNtIg0KLS0gDQoxLjcuMQ0K
DQo=

--=-UffLfoamTcT2Y0NM8zc3--

--=-udKpkWKrnlE69JjfPF5L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyZyEIACgkQPX1aK2wOHVgy0wCfYek3qQmXDYrf4wbStWN4gtmv
OecAnimQ8nYSsV8Gv8dwBkPHaIkmi+Z8
=EHdu
-----END PGP SIGNATURE-----

--=-udKpkWKrnlE69JjfPF5L--
