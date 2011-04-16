Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB4Y5-0004M3-7J for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 14:24:25 +0200
Received: from f053044057.adsl.alicedsl.de ([78.53.44.57]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB4WF-0005Dg-TQ; Sat, 16 Apr 2011 12:22:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Apr 2011 14:22:07 +0200
Message-ID: <1302956527.8709.67.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Subject: dasher-gpe_0.0-svn: task configure fails with `Your intltool is too old.`
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
X-List-Received-Date: Sat, 16 Apr 2011 12:24:25 -0000
X-Groupsio-MsgNum: 31217
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Epb7FSTD3QVGoe1pJ0yS"

--=-Epb7FSTD3QVGoe1pJ0yS
Content-Type: multipart/mixed; boundary="=-06zI+HdkwJ157H2V03vs"

--=-06zI+HdkwJ157H2V03vs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`bitbake dasher-gpe` fails with the following error message.

        checking whether make sets $(MAKE)... (cached) yes
        checking for intltool >=3D 0.18... /oe/build-angstrom-next/angstrom=
-dev/work/armv7a-angstrom-linux-gnueabi/dasher-gpe-0.0+svnr1251-r1/trunk/co=
nfigure: line 2935: test: : integer expression expected
         found. Your intltool is too old.  You need intltool 0.18 or later.

With

        do_configure_prepend() {
        	rm -f m4/libtool.m4
        	intltoolize --force
        }

the problem seems to be that `intltoolize --force` creates an empty
`intltool-update.in`.

        /oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnu=
eabi/dasher-gpe-0.0+svnr1251-r1/trunk$ more intltool-update.in=20
        /oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnu=
eabi/dasher-gpe-0.0+svnr1251-r1/trunk$

Also the following message is printed in `log.do_configure` and I got it
too running it directly.

        $ /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/=
intltoolize --force
        You should add the contents of '/home/paul/oe/build-angstrom-next/a=
ngstrom-dev/sysroots/i686-linux/usr/share/aclocal/intltool.m4' to 'aclocal.=
m4'.

`intltool-update.in` is used `m4/intltool.m4` to check the version.

        dnl AC_PROG_INTLTOOL([MINIMUM-VERSION])
        # serial 1 AC_PROG_INTLTOOL
        AC_DEFUN(AC_PROG_INTLTOOL,
        [
       =20
        if test -n "$1"; then
            AC_MSG_CHECKING(for intltool >=3D $1)
       =20
            INTLTOOL_REQUIRED_VERSION_AS_INT=3D`echo $1 | awk -F. '{ printf=
 "%d", $[1] * 100 + $[2]; }'`
            INTLTOOL_APPLIED_VERSION=3D`awk -F\" '/\\$VERSION / { printf $[=
2]; }'  < ${srcdir}/intltool-update.in`
            changequote({{,}})
            INTLTOOL_APPLIED_VERSION_AS_INT=3D`awk -F\" '/\\$VERSION / { sp=
lit(${{2}}, VERSION, "."); printf "%d\n", VERSION[1] * 100 + VERSION[2];}' =
< ${srcdir}/intltool-update.in`
            changequote([,])
       =20
            if test "$INTLTOOL_APPLIED_VERSION_AS_INT" -ge "$INTLTOOL_REQUI=
RED_VERSION_AS_INT"; then
        	AC_MSG_RESULT([$INTLTOOL_APPLIED_VERSION found])
            else
        	AC_MSG_RESULT([$INTLTOOL_APPLIED_VERSION found. Your intltool is t=
oo old.  You need intltool $1 or later.])
        	exit 1
            fi
        fi

But since `intltool-update.in` is empty this check fails.

Unfortunately I have no idea how to fix this properly. I used the
attached patch, but the next problem turns up right away.

        checking for style of include used by make... GNU
        checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-g=
nueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Ds=
oftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-angstrom-next/angs=
trom-dev/sysroots/armv7a-angstrom-linux-gnueabi
        checking whether the C compiler works... no
        configure: error: in `/oe/build-angstrom-next/angstrom-dev/work/arm=
v7a-angstrom-linux-gnueabi/dasher-gpe-0.0+svnr1251-r1/trunk':
        configure: error: C compiler cannot create executables
        See `config.log' for more details.

Unfortunately I could not find the original author to contact him.

        $ git log -p --follow -C -C -C -M recipes/dasher/ # is not sufficie=
nt

Additionally this the revision used in this recipe is over four years
old, so maybe it should be removed if nobody care about `dasher-gpe`.


Thanks,

Paul

--=-06zI+HdkwJ157H2V03vs
Content-Disposition: attachment; filename="0001-dasher-add-patch-for-intl.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-dasher-add-patch-for-intl.patch"; charset="UTF-8"

RnJvbSAyNWFiYTRjMjgxN2MxMjgyYWMzNmNiMzU5NjM3MzM5ZTkwNjllNTlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFNhdCwgMTYgQXByIDIwMTEgMTE6MDM6NTEgKzAyMDANClN1Ympl
Y3Q6IFtQQVRDSF0gZGFzaGVyOiBhZGQgcGF0Y2ggZm9yIGludGwNCg0KCWNoZWNraW5nIHdoZXRo
ZXIgbWFrZSBzZXRzICQoTUFLRSkuLi4gKGNhY2hlZCkgeWVzDQoJY2hlY2tpbmcgZm9yIGludGx0
b29sID49IDAuMTguLi4gL2hvbWUvcGF1bC9vZS9idWlsZC1hbmdzdHJvbS1uZXh0L2FuZ3N0cm9t
LWRldi93b3JrL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL2Rhc2hlci1ncGUtMC4wK3N2
bnIxMjUxLXIxL3RydW5rL2NvbmZpZ3VyZTogbGluZSAyOTM1OiB0ZXN0OiA6IGludGVnZXIgZXhw
cmVzc2lvbiBleHBlY3RlZA0KCSBmb3VuZC4gWW91ciBpbnRsdG9vbCBpcyB0b28gb2xkLiAgWW91
IG5lZWQgaW50bHRvb2wgMC4xOCBvciBsYXRlci4NCg0KU2lnbmVkLW9mZi1ieTogUGF1bCBNZW56
ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCi0tLQ0KIC4uLjQtaW50bHRv
b2wubTQtZG8tbm90LXF1aXQtb24tZmF1bHR5LWNoZWNrLnBhdGNoIHwgICAyNyArKysrKysrKysr
KysrKysrKysrKw0KIHJlY2lwZXMvZGFzaGVyL2Rhc2hlci1ncGVfMC4wLXN2bi5iYiAgICAgICAg
ICAgICAgIHwgICAgNCArKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvZGFzaGVyL2Rhc2hlci1n
cGUvMDAwMS1tNC1pbnRsdG9vbC5tNC1kby1ub3QtcXVpdC1vbi1mYXVsdHktY2hlY2sucGF0Y2gN
Cg0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvZGFzaGVyL2Rhc2hlci1ncGUvMDAwMS1tNC1pbnRsdG9v
bC5tNC1kby1ub3QtcXVpdC1vbi1mYXVsdHktY2hlY2sucGF0Y2ggYi9yZWNpcGVzL2Rhc2hlci9k
YXNoZXItZ3BlLzAwMDEtbTQtaW50bHRvb2wubTQtZG8tbm90LXF1aXQtb24tZmF1bHR5LWNoZWNr
LnBhdGNoDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uN2E4OTMyNg0KLS0t
IC9kZXYvbnVsbA0KKysrIGIvcmVjaXBlcy9kYXNoZXIvZGFzaGVyLWdwZS8wMDAxLW00LWludGx0
b29sLm00LWRvLW5vdC1xdWl0LW9uLWZhdWx0eS1jaGVjay5wYXRjaA0KQEAgLTAsMCArMSwyNyBA
QA0KK0Zyb20gMWVmNDA0ZjQ1ODVkM2Q3YTMxMTYyNjY1NWY2YjMxYWVhN2VjNzI4YyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDENCitGcm9tOiBQYXVsIE1lbnplbCA8cGF1bGVwYW50ZXJAdXNlcnMu
c291cmNlZm9yZ2UubmV0Pg0KK0RhdGU6IFNhdCwgMTYgQXByIDIwMTEgMTQ6MDI6MDggKzAyMDAN
CitTdWJqZWN0OiBbUEFUQ0hdIG00L2ludGx0b29sLm00OiBkbyBub3QgcXVpdCBvbiBmYXVsdHkg
Y2hlY2sNCisNCisNCitTaWduZWQtb2ZmLWJ5OiBQYXVsIE1lbnplbCA8cGF1bGVwYW50ZXJAdXNl
cnMuc291cmNlZm9yZ2UubmV0Pg0KKy0tLQ0KKyBtNC9pbnRsdG9vbC5tNCB8ICAgIDIgKy0NCisg
MSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pDQorDQorZGlm
ZiAtLWdpdCBhL200L2ludGx0b29sLm00IGIvbTQvaW50bHRvb2wubTQNCitpbmRleCBiZGQyZTMz
Li5mMjY5Njc1IDEwMDY0NA0KKy0tLSBhL200L2ludGx0b29sLm00DQorKysrIGIvbTQvaW50bHRv
b2wubTQNCitAQCAtNDAsNyArNDAsNyBAQCBpZiB0ZXN0IC1uICIkMSI7IHRoZW4NCisgCUFDX01T
R19SRVNVTFQoWyRJTlRMVE9PTF9BUFBMSUVEX1ZFUlNJT04gZm91bmRdKQ0KKyAgICAgZWxzZQ0K
KyAJQUNfTVNHX1JFU1VMVChbJElOVExUT09MX0FQUExJRURfVkVSU0lPTiBmb3VuZC4gWW91ciBp
bnRsdG9vbCBpcyB0b28gb2xkLiAgWW91IG5lZWQgaW50bHRvb2wgJDEgb3IgbGF0ZXIuXSkNCist
CWV4aXQgMQ0KKysjCWV4aXQgMQ0KKyAgICAgZmkNCisgZmkNCisgDQorLS0gDQorMS43LjQuNA0K
Kw0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvZGFzaGVyL2Rhc2hlci1ncGVfMC4wLXN2bi5iYiBiL3Jl
Y2lwZXMvZGFzaGVyL2Rhc2hlci1ncGVfMC4wLXN2bi5iYg0KaW5kZXggYTYzYzZlOS4uNTYxYzc4
OCAxMDA2NDQNCi0tLSBhL3JlY2lwZXMvZGFzaGVyL2Rhc2hlci1ncGVfMC4wLXN2bi5iYg0KKysr
IGIvcmVjaXBlcy9kYXNoZXIvZGFzaGVyLWdwZV8wLjAtc3ZuLmJiDQpAQCAtNSw3ICs1LDkgQEAg
U1JDUkVWID0gIjEyNTEiDQogREVQRU5EUyA9ICJsaWJ4c2V0dGluZ3MtY2xpZW50IGxpYmdsYWRl
IGxpYnh0c3QgZ2NvbmYgZ3RrKyINCiBTRUNUSU9OID0gImdwZSINCiBTUkNfVVJJID0gInN2bjov
L3N2bi5nbm9tZS5vcmcvc3ZuL2Rhc2hlcjttb2R1bGU9dHJ1bms7cHJvdG89aHR0cCBcDQotCWZp
bGU6Ly9jb25maWd1cmUtbG9zc2FnZS5wYXRjaCINCisJZmlsZTovL2NvbmZpZ3VyZS1sb3NzYWdl
LnBhdGNoIFwNCisJZmlsZTovLzAwMDEtbTQtaW50bHRvb2wubTQtZG8tbm90LXF1aXQtb24tZmF1
bHR5LWNoZWNrLnBhdGNoIFwNCisJIg0KIA0KIFMgPSAiJHtXT1JLRElSfS90cnVuayINCiBGSUxF
U18ke1BOfSArPSAiJHtkYXRhZGlyfS9kYXNoZXIiDQotLSANCjEuNy40LjQNCg0K

--=-06zI+HdkwJ157H2V03vs--

--=-Epb7FSTD3QVGoe1pJ0yS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2pie8ACgkQPX1aK2wOHVim8gCgizNonjxNt15w7/ptsFKFeIjR
aZYAn21auy9OvZbEJcTRJGTvvw1jdIwD
=uiym
-----END PGP SIGNATURE-----

--=-Epb7FSTD3QVGoe1pJ0yS--
