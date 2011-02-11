Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PnujD-0002FP-VP for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 16:16:12 +0100
Received: from f053036141.adsl.alicedsl.de ([78.53.36.141]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PnuiC-0008KE-9j for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:15:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinTz=s4K7zbkFKh22HJWRjMDDW0iP5CKxV0HrOX@mail.gmail.com>
References: <1292667009.12094.13.camel@mattotaupa>
	<4D0C8BCC.9050800@eukrea.com>
	<AANLkTik2cV=NMv1=Xj1gd6pBaL-kVVo7=tUH9gmqTxCE@mail.gmail.com>
	<1292859750.1713.3.camel@mattotaupa>
	<AANLkTinTz=s4K7zbkFKh22HJWRjMDDW0iP5CKxV0HrOX@mail.gmail.com>
Date: Fri, 11 Feb 2011 16:15:06 +0100
Message-ID: <1297437306.3785.39.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: minimal{, -uclibc}: linux-omap-psp_2.6.32: task `do_compileconfigs` fails
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
X-List-Received-Date: Fri, 11 Feb 2011 15:16:12 -0000
X-Groupsio-MsgNum: 29071
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-PyP7d9FqEjFGGNnVNyvJ"

--=-PyP7d9FqEjFGGNnVNyvJ
Content-Type: multipart/mixed; boundary="=-6cpnWCejwFyZwBoaF9T2"

--=-6cpnWCejwFyZwBoaF9T2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 20.12.2010, 10:39 -0800 schrieb Khem Raj:
> On Mon, Dec 20, 2010 at 7:42 AM, Paul Menzel wrote:
> > Am Samstag, den 18.12.2010, 22:46 -0800 schrieb Khem Raj:
> >> On Sat, Dec 18, 2010 at 2:24 AM, Eric B=C3=A9nard <eric@eukrea.com> wr=
ote:
> >
> >> > On 18/12/2010 11:10, Paul Menzel wrote:
> >> >>
> >> >> Error: selected processor does not support ARM mode `smc #0'
> >> >
> >> > this seems to be a known problem with gcc 4.5 :
> >> > https://bugs.launchpad.net/ubuntu/+source/gcc-4.5/+bug/669912
> >>
> >> Its not a gcc problem to clarify. Its just that older compilers did
> >> not differentiate security extentions presence.
> >> http://kernel.ubuntu.com/git?p=3Dubuntu/ubuntu-natty.git;a=3Dcommitdif=
f;h=3D1ebe13dea156358f1044a7a755f02945ad3890e4;hp=3Df31ff7673ef77d04e74e1a1=
e45bb2940781f35f0
> >>
> >> http://kernel.ubuntu.com/git?p=3Dubuntu/ubuntu-natty.git;a=3Dcommitdif=
f;h=3D99340d7b23f3df75d9b752fb25088a10064cd0a6;hp=3D9523bd6810e0229a8147e8c=
3d6498e2f40b38974
> >>
> >> are the fixes you should apply to kernel.
> >
> > I just wanted to add that `linux-omap-psp_2.6.32` builds fine with
> > `angstrom-2010.x` (without the above mentioned patches) which uses the
> > following toolchain.
> >
> >        conf/distro/angstrom-2010.x.conf:ANGSTROM_GCC_VERSION           =
          ?=3D "4.5"
> >        conf/distro/angstrom-2010.x.conf:ANGSTROM_BINUTILS_VERSION      =
          ?=3D "2.20.1"
>=20
> yes it will work with binutils < 2.21 the patch I previously implied
> is in assembler.

V=C3=ADctor committed these patches in 4f24435f [1] for
`linux-omap4_2.6.35.3.bb`. I tried to backport these patches to
`linux-omap-psp_2.6.32.bb` but I am not successful. A lot seems to have
changed between Linux 2.6.32 and 2.6.35.

After the adaptations to `arch/arm/mach-omap2/Makefile` I am now getting
the next error message.

        |   LDS     arch/arm/kernel/vmlinux.lds
        | /tmp/ccpCEAjJ.s: Assembler messages:
        | /tmp/ccpCEAjJ.s:306: Error: selected processor does not support A=
RM mode `smc #0'
        | /tmp/ccpCEAjJ.s:346: Error: selected processor does not support A=
RM mode `smc #0'

But I do not know how to adapt that. Is there an easier way to configure
these security extensions?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D4f24435=
fbba0e810c5fdf557e25eb84093837853

--=-6cpnWCejwFyZwBoaF9T2
Content-Disposition: attachment;
	filename="0001-UBUNTU-Config-Fix-FTBS-caused-by-new-binutils.patch"
Content-Type: text/x-patch;
	name="0001-UBUNTU-Config-Fix-FTBS-caused-by-new-binutils.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA3Njk5NzA0ZTAxMWRiODY0YzU2ZjMzM2JjZTk5MzZhMzY1MjJmYjc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogVGltIEdhcmRuZXIgPHRpbS5nYXJkbmVyQGNhbm9uaWNhbC5j
b20+DQpEYXRlOiBUaHUsIDkgRGVjIDIwMTAgMDg6MTY6NTIgLTA3MDANClN1YmplY3Q6IFtQQVRD
SCAxLzJdIFVCVU5UVTogW0NvbmZpZ10gRml4IEZUQlMgY2F1c2VkIGJ5IG5ldyBiaW51dGlscw0K
DQpOZXcgYXNzZW1ibGVycyBuZWVkIC1tYXJjaD1hcm12Ny1hK3NlYyBvbiBjb21tYW5kIGxpbmUg
b3INCi5hcmNoX2V4dGVuc2lvbiBzZWMgaW5saW5lIHRvIGVuYWJsZSB1c2Ugb2YgdGhlIHNtYyBp
bnN0cnVjdGlvbi4NCg0KVGhpcyBwYXRjaCB1c2VzIGFzLWluc3RyIHRvIGNoZWNrIHRoZSBsYXR0
ZXIgdG8gY29uZGl0aW9uYWxseQ0KZW5hYmxlIHRoZSBmb3JtZXIgaW4gQUZMQUdTIGZvciBmaWxl
cyB0aGF0IHVzZSBzbWMuDQoNCkNoZWNrZWQgb24gYm90aCBvbGQgYW5kIG5ldyBiaW51dGlscyB0
byB2ZXJpZnkgdGhhdCBpdCBkb2VzDQpub3QgYnJlYWsgb2xkIHZlcnNpb25zLg0KDQpTaWduZWQt
b2ZmLWJ5OiBKb2huIFJpZ2J5IDxqb2huLnJpZ2J5QGxpbmFyby5vcmc+DQpTaWduZWQtb2ZmLWJ5
OiBUaW0gR2FyZG5lciA8dGltLmdhcmRuZXJAY2Fub25pY2FsLmNvbT4NCi0tLQ0KU3F1YXNoZWQg
d2l0aA0KDQpodHRwOi8va2VybmVsLnVidW50dS5jb20vZ2l0P3A9dWJ1bnR1L3VidW50dS1uYXR0
eS5naXQ7YT1jb21taXRkaWZmO2g9OTkzNDBkN2IyM2YzZGY3NWQ5Yjc1MmZiMjUwODhhMTAwNjRj
ZDBhNjtocD05NTIzYmQ2ODEwZTAyMjlhODE0N2U4YzNkNjQ5OGUyZjQwYjM4OTc0DQoNCmFuZCBh
ZGFwdGVkLg0KLS0tDQogYXJjaC9hcm0vbWFjaC1vbWFwMi9NYWtlZmlsZSB8ICAgIDQgKysrLQ0K
IDEgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1vbWFwMi9NYWtlZmlsZSBiL2FyY2gvYXJtL21hY2gtb21h
cDIvTWFrZWZpbGUgICANCmluZGV4IDc1MjUxYjQuLjAyNDFiNGQgMTAwNjQ0DQotLS0gYS9hcmNo
L2FybS9tYWNoLW9tYXAyL01ha2VmaWxlDQorKysgYi9hcmNoL2FybS9tYWNoLW9tYXAyL01ha2Vm
aWxlDQpAQCAtNSw2ICs1LDggQEANCiAjIENvbW1vbiBzdXBwb3J0DQogb2JqLXkgOj0gaWQubyBp
by5vIGNvbnRyb2wubyBtdXgubyBkZXZpY2VzLm8gc2VyaWFsLm8gZ3BtYy5vIHRpbWVyLWdwLm8N
CiANCitBRkxBR1NfdGltZXItZ3Aub8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oDo9LVdhLC1tYXJjaD1hcm12Ny1hJChwbHVzX3NlYykNCisNCiBvbWFwLTItMy1jb21tb24gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gaXJxLm8gc2RyYy5vIG9tYXBfaHdtb2Qubw0K
IG9tYXAtMy00LWNvbW1vbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSBkcGxsLm8N
CiBwcmNtLWNvbW1vbiAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IHByY20ubyBwb3dlcmRv
bWFpbi5vDQpAQCAtMjEsNiArMjMsMTAgQEANCiBvYmotJChDT05GSUdfU01QKSAgICAgICAgICAg
ICAgICAgICAgICArPSBvbWFwLXNtcC5vIG9tYXAtaGVhZHNtcC5vDQogb2JqLSQoQ09ORklHX0xP
Q0FMX1RJTUVSUykgICAgICAgICAgICAgKz0gdGltZXItbXB1Lm8NCiANCitwbHVzX3NlY8KgOj3C
oCQoY2FsbMKgYXMtaW5zdHIsLmFyY2hfZXh0ZW5zaW9uwqBzZWMsK3NlYykNCitBRkxBR1Nfb21h
cC1oZWFkc21wLm/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA6PS1XYSwtbWFy
Y2g9YXJtdjctYSQocGx1c19zZWMpDQorQUZMQUdTX29tYXA0NHh4LXNtYy5vwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgOj0tV2EsLW1hcmNoPWFybXY3LWEkKHBsdXNfc2VjKQ0K
Kw0KICMgRnVuY3Rpb25zIGxvYWRlZCB0byBTUkFNDQogb2JqLSQoQ09ORklHX0FSQ0hfT01BUDI0
MjApICAgICAgICAgICAgKz0gc3JhbTI0Mngubw0KIG9iai0kKENPTkZJR19BUkNIX09NQVAyNDMw
KSAgICAgICAgICAgICs9IHNyYW0yNDN4Lm8NCkBAIC00Myw2ICs0OSw5IEBADQogZWxzZQ0KIG9i
ai0kKENPTkZJR19BUkNIX09NQVAzKSAgICAgICAgICAgICAgICs9IHNsZWVwMzR4eC5vDQogZW5k
aWYNCisNCitBRkxBR1Nfc2xlZXA0NHh4Lm/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqA6PS1XYSwtbWFyY2g9YXJtdjctYSQocGx1c19zZWMpDQorDQogb2JqLSQoQ09ORklHX1BN
X0RFQlVHKSAgICAgICAgICAgICAgICAgKz0gcG0tZGVidWcubw0KIG9iai0kKENPTkZJR19PTUFQ
X1NNQVJUUkVGTEVYKSAgICAgICAgICs9IHNtYXJ0cmVmbGV4Lm8NCiBlbmRpZg0KLS0gDQoxLjcu
MC4yDQo=

--=-6cpnWCejwFyZwBoaF9T2--

--=-PyP7d9FqEjFGGNnVNyvJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1VUnoACgkQPX1aK2wOHVicGgCcCYm7xaao0byLCSB0wtN2jcDw
F1UAn1RtFFAgvIlP/ZVz3WRZ/kQWMhmw
=R7GQ
-----END PGP SIGNATURE-----

--=-PyP7d9FqEjFGGNnVNyvJ--
