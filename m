Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGrgJ-0002zI-GE for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 13:52:51 +0200
Received: from f053036031.adsl.alicedsl.de ([78.53.36.31]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGrel-00036N-KV for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 11:51:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304324573-31754-1-git-send-email-koen@openembedded.org>
References: <1304324573-31754-1-git-send-email-koen@openembedded.org>
Date: Mon, 02 May 2011 13:50:15 +0200
Message-ID: <1304337015.3949.62.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] systemd: update to v26
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
X-List-Received-Date: Mon, 02 May 2011 11:52:51 -0000
X-Groupsio-MsgNum: 31557
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-l9ePzCqP9SuuxJLug2wi"

--=-l9ePzCqP9SuuxJLug2wi
Content-Type: multipart/mixed; boundary="=-Zv///ozXmUhUbdMjgF2D"

--=-Zv///ozXmUhUbdMjgF2D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 02.05.2011, 10:22 +0200 schrieb Koen Kooi:
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/systemd/files/disable_xml_generation.patch |   36 --------
>  recipes/systemd/files/execute.patch                |   17 ----
>  recipes/systemd/files/getty-serial@.service        |   19 ----
>  recipes/systemd/files/replace_accpet4.patch        |   26 ------
>  recipes/systemd/files/systemadm.patch              |   13 ---
>  ...-disable-xml-file-stuff-and-introspection.patch |   93 ++++++++++++++=
++++++
>  recipes/systemd/systemd-v26/execute.patch          |   17 ++++
>  recipes/systemd/systemd-v26/getty-serial@.service  |   19 ++++
>  recipes/systemd/systemd-v26/replace_accpet4.patch  |   26 ++++++
>  recipes/systemd/systemd-v26/systemadm.patch        |   13 +++
>  recipes/systemd/systemd_git.bb                     |   26 ++++--
>  11 files changed, 185 insertions(+), 120 deletions(-)
>  delete mode 100644 recipes/systemd/files/disable_xml_generation.patch
>  delete mode 100644 recipes/systemd/files/execute.patch
>  delete mode 100644 recipes/systemd/files/getty-serial@.service
>  delete mode 100644 recipes/systemd/files/replace_accpet4.patch
>  delete mode 100644 recipes/systemd/files/systemadm.patch
>  create mode 100644 recipes/systemd/systemd-v26/0001-systemd-disable-xml-=
file-stuff-and-introspection.patch
>  create mode 100644 recipes/systemd/systemd-v26/execute.patch
>  create mode 100644 recipes/systemd/systemd-v26/getty-serial@.service
>  create mode 100644 recipes/systemd/systemd-v26/replace_accpet4.patch
>  create mode 100644 recipes/systemd/systemd-v26/systemadm.patch

`git log --stat -M -C -C` makes the diff lock much more daunting.

[=E2=80=A6]

> --- /dev/null
> +++ b/recipes/systemd/systemd-v26/systemadm.patch
> @@ -0,0 +1,13 @@
> +Index: git/src/systemadm.vala
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/systemadm.vala	2010-06-15 11:02:35.863509632 +0200
> ++++ git/src/systemadm.vala	2010-06-15 11:06:16.305986249 +0200
> +@@ -297,7 +297,7 @@
> +=20
> +                 bbox.pack_start(cancel_button, false, true, 0);
> +=20
> +-                bus =3D Bus.get(session ? BusType.SESSION : BusType.SYS=
TEM);
> ++                bus =3D DBus.Bus.get(session ? DBus.BusType.SESSION : D=
Bus.BusType.SYSTEM);
> +=20
> +                 manager =3D bus.get_object(
> +                                 "org.freedesktop.systemd1",
> diff --git a/recipes/systemd/systemd_git.bb b/recipes/systemd/systemd_git=
.bb
> index 5f98e54..7634b22 100644
> --- a/recipes/systemd/systemd_git.bb
> +++ b/recipes/systemd/systemd_git.bb
> @@ -1,48 +1,56 @@
>  DESCRIPTION =3D "Systemd a init replacement"
>  HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
>  DEPENDS =3D "readline udev dbus libcap2 libcgroup gtk+"
>  PRIORITY =3D "optional"
>  SECTION =3D "base/shell"
> =20
> -PV =3D "0.0"
> -PR_append =3D "+${SRCPV}"
> +PV =3D "v26"
> +#PR_append =3D "+${SRCPV}"

Remove the commented line.
=20
>  inherit autotools vala
> =20
> -TAG =3D "1ebdf2d8793181f31b766b8342391aa1978f9917"
> +TAG =3D "${PV}"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/systemd;protocol=3Dgit;tag=3D=
${TAG} \
>             file://execute.patch \
> -           file://systemadm.patch \
> -           file://disable_xml_generation.patch \
> +#           file://systemadm.patch \

Maybe a comment in the recipe or the commit message would be nice, why
this is commented. Could it be needed in the future?

> +           file://0001-systemd-disable-xml-file-stuff-and-introspection.=
patch \
>             file://replace_accpet4.patch \
>             file://getty-serial@.service \
>            "
> =20
>  S =3D "${WORKDIR}/git"
> =20
> +# The gtk+ tools should get built as a seperate recipe e.g. systemd-tool=
s

s/seperate/separate/

=E2=80=A6 to not force people to build all gtk+ packages/recipes.

>  EXTRA_OECONF =3D " --with-distro=3Ddebian \
>                   --with-rootdir=3D${base_prefix} \
> +                 --disable-gtk \
>                 "
> =20
> -PACKAGES =3D "${PN} ${PN}-gui ${PN}-dbg ${PN}-doc"
> +PACKAGES =3D+ "${PN}-gui"
> =20
>  FILES_${PN}-gui =3D "${bindir}/systemadm"
> =20
>  FILES_${PN} =3D " ${base_bindir}/* \
>                  ${datadir}/dbus-1/services \
>                  ${datadir}/dbus-1/system-services \
> +                ${datadir}/polkit-1 \
>                  ${datadir}/${PN} \
>                  ${sysconfdir} \
>                  ${base_libdir}/systemd/* \
>                  ${base_libdir}/systemd/system/* \
>                  ${base_libdir}/udev/rules.d \
> +                ${base_libdir}/security/*.so \
>                  /cgroup \
> -                ${bindir}/systemd-install \
> +                ${bindir}/systemd* \
> +                ${libdir}/tmpfiles.d/*.conf \
> +                ${libdir}/systemd \
>                 "
> =20
> -FILES_${PN}-dbg +=3D " /lib/systemd/.debug "
> +FILES_${PN}-dbg +=3D "${base_libdir}/systemd/.debug ${base_libdir}/syste=
md/*/.debug"
> =20
>  def get_baudrate(bb, d):
>      return bb.data.getVar('SERIAL_CONSOLE', d, 1).split()[0]

A split in two commits to fix/improve the recipe and to update to v26
would have been nice.

Anyway, using `angstrom-2010.x` for `MACHINE =3D "beagleboard"` fails with
the following error message.

        [=E2=80=A6]
          CCLD   systemd-getty-generator
          GEN    man/systemd.1
        I/O error : Attempt to load network entity http://docbook.sourcefor=
ge.net/release/xsl/current/manpages/docbook.xsl
        warning: failed to load external entity "http://docbook.sourceforge=
.net/release/xsl/current/manpages/docbook.xsl"
        cannot parse http://docbook.sourceforge.net/release/xsl/current/man=
pages/docbook.xsl
        make[1]: *** [man/systemd.1] Error 4
        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/systemd-v26-r0/git'
        make: *** [all] Error 2
        + die 'oe_runmake failed'
        + oefatal 'oe_runmake failed'
        + echo FATAL: 'oe_runmake failed'
        FATAL: oe_runmake failed
        + exit 1

Please find `log.do_compile` attached.


Thanks,

Paul

--=-Zv///ozXmUhUbdMjgF2D
Content-Disposition: attachment; filename="log.do_compile"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="log.do_compile"; charset="UTF-8"

KyBkb19jb21waWxlDQorIGJhc2VfZG9fY29tcGlsZQ0KKyAnWycgLWUgTWFrZWZpbGUgLW8gLWUg
bWFrZWZpbGUgLW8gLWUgR05VbWFrZWZpbGUgJ10nDQorIG9lX3J1bm1ha2UNCisgb2Vub3RlIG1h
a2UNCisgZWNobyBOT1RFOiBtYWtlDQpOT1RFOiBtYWtlDQorIG1ha2UNCm1ha2UgIGFsbC1hbQ0K
bWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvb2UvYnVpbGQtYW5nc3Ryb20tbmV4dC9hbmdz
dHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9zeXN0ZW1kLXYyNi1y
MC9naXQnDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9iYXNpY19sYS11dGlsLmxvDQpzcmMvdXRp
bC5jOiBJbiBmdW5jdGlvbiAnYWNxdWlyZV90ZXJtaW5hbCc6DQpzcmMvdXRpbC5jOjI0ODQ6Mjk6
IHdhcm5pbmc6IGNhc3QgaW5jcmVhc2VzIHJlcXVpcmVkIGFsaWdubWVudCBvZiB0YXJnZXQgdHlw
ZSBbLVdjYXN0LWFsaWduXQ0Kc3JjL3V0aWwuYzoyNDk3OjM3OiB3YXJuaW5nOiBjYXN0IGluY3Jl
YXNlcyByZXF1aXJlZCBhbGlnbm1lbnQgb2YgdGFyZ2V0IHR5cGUgWy1XY2FzdC1hbGlnbl0NCiAg
Q0MgICAgIHNyYy9saWJzeXN0ZW1kX2Jhc2ljX2xhLWxhYmVsLmxvDQogIENDICAgICBzcmMvbGli
c3lzdGVtZF9iYXNpY19sYS1oYXNobWFwLmxvDQpzcmMvaGFzaG1hcC5jOiBJbiBmdW5jdGlvbiAn
bGlua19lbnRyeSc6DQpzcmMvaGFzaG1hcC5jOjEwNDoyNjogd2FybmluZzogY2FzdCBpbmNyZWFz
ZXMgcmVxdWlyZWQgYWxpZ25tZW50IG9mIHRhcmdldCB0eXBlIFstV2Nhc3QtYWxpZ25dDQpzcmMv
aGFzaG1hcC5jOjEwNjoxMzogd2FybmluZzogY2FzdCBpbmNyZWFzZXMgcmVxdWlyZWQgYWxpZ25t
ZW50IG9mIHRhcmdldCB0eXBlIFstV2Nhc3QtYWxpZ25dDQpzcmMvaGFzaG1hcC5jOjEwNzoxNzog
d2FybmluZzogY2FzdCBpbmNyZWFzZXMgcmVxdWlyZWQgYWxpZ25tZW50IG9mIHRhcmdldCB0eXBl
IFstV2Nhc3QtYWxpZ25dDQpzcmMvaGFzaG1hcC5jOjEwODo5OiB3YXJuaW5nOiBjYXN0IGluY3Jl
YXNlcyByZXF1aXJlZCBhbGlnbm1lbnQgb2YgdGFyZ2V0IHR5cGUgWy1XY2FzdC1hbGlnbl0NCnNy
Yy9oYXNobWFwLmM6IEluIGZ1bmN0aW9uICd1bmxpbmtfZW50cnknOg0Kc3JjL2hhc2htYXAuYzox
NDg6MTc6IHdhcm5pbmc6IGNhc3QgaW5jcmVhc2VzIHJlcXVpcmVkIGFsaWdubWVudCBvZiB0YXJn
ZXQgdHlwZSBbLVdjYXN0LWFsaWduXQ0Kc3JjL2hhc2htYXAuYzogSW4gZnVuY3Rpb24gJ2hhc2hf
c2Nhbic6DQpzcmMvaGFzaG1hcC5jOjE5ODoxODogd2FybmluZzogY2FzdCBpbmNyZWFzZXMgcmVx
dWlyZWQgYWxpZ25tZW50IG9mIHRhcmdldCB0eXBlIFstV2Nhc3QtYWxpZ25dDQogIENDICAgICBz
cmMvbGlic3lzdGVtZF9iYXNpY19sYS1zZXQubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2Jh
c2ljX2xhLXN0cnYubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2Jhc2ljX2xhLWNvbmYtcGFy
c2VyLmxvDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9iYXNpY19sYS1zb2NrZXQtdXRpbC5sbw0K
ICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfYmFzaWNfbGEtbG9nLmxvDQogIENDICAgICBzcmMvbGli
c3lzdGVtZF9iYXNpY19sYS1yYXRlbGltaXQubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2Jh
c2ljX2xhLWV4aXQtc3RhdHVzLmxvDQogIENDTEQgICBsaWJzeXN0ZW1kLWJhc2ljLmxhDQogIEND
ICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLXVuaXQubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0
ZW1kX2NvcmVfbGEtam9iLmxvDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLW1hbmFn
ZXIubG8NCnNyYy9tYW5hZ2VyLmM6IEluIGZ1bmN0aW9uICdtYW5hZ2VyX3Byb2Nlc3Nfbm90aWZ5
X2ZkJzoNCnNyYy9tYW5hZ2VyLmM6MTk1NjoyNTogd2FybmluZzogY2FzdCBpbmNyZWFzZXMgcmVx
dWlyZWQgYWxpZ25tZW50IG9mIHRhcmdldCB0eXBlIFstV2Nhc3QtYWxpZ25dDQogIENDICAgICBz
cmMvbGlic3lzdGVtZF9jb3JlX2xhLXBhdGgtbG9va3VwLmxvDQogIENDICAgICBzcmMvbGlic3lz
dGVtZF9jb3JlX2xhLWxvYWQtZnJhZ21lbnQubG8NCnNyYy9sb2FkLWZyYWdtZW50LmM6IEluIGZ1
bmN0aW9uICdsb2FkX2Zyb21fcGF0aCc6DQpzcmMvbG9hZC1mcmFnbWVudC5jOjE5OTg6Mjg6IHdh
cm5pbmc6IGNhc3QgaW5jcmVhc2VzIHJlcXVpcmVkIGFsaWdubWVudCBvZiB0YXJnZXQgdHlwZSBb
LVdjYXN0LWFsaWduXQ0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS1zZXJ2aWNlLmxv
DQogIENDICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLWF1dG9tb3VudC5sbw0KICBDQyAgICAg
c3JjL2xpYnN5c3RlbWRfY29yZV9sYS1tb3VudC5sbw0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRf
Y29yZV9sYS1zd2FwLmxvDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLWRldmljZS5s
bw0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS10YXJnZXQubG8NCiAgQ0MgICAgIHNy
Yy9saWJzeXN0ZW1kX2NvcmVfbGEtc25hcHNob3QubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1k
X2NvcmVfbGEtc29ja2V0LmxvDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLXRpbWVy
LmxvDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLXBhdGgubG8NCnNyYy9wYXRoLmM6
IEluIGZ1bmN0aW9uICdwYXRoX2ZkX2V2ZW50JzoNCnNyYy9wYXRoLmM6NTc1OjEzOiB3YXJuaW5n
OiBjYXN0IGluY3JlYXNlcyByZXF1aXJlZCBhbGlnbm1lbnQgb2YgdGFyZ2V0IHR5cGUgWy1XY2Fz
dC1hbGlnbl0NCnNyYy9wYXRoLmM6NTg3OjIxOiB3YXJuaW5nOiBjYXN0IGluY3JlYXNlcyByZXF1
aXJlZCBhbGlnbm1lbnQgb2YgdGFyZ2V0IHR5cGUgWy1XY2FzdC1hbGlnbl0NCiAgQ0MgICAgIHNy
Yy9saWJzeXN0ZW1kX2NvcmVfbGEtbG9hZC1kcm9waW4ubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0
ZW1kX2NvcmVfbGEtZXhlY3V0ZS5sbw0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS11
dG1wLXd0bXAubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2NvcmVfbGEtZGJ1cy5sbw0KICBD
QyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS1kYnVzLW1hbmFnZXIubG8NCiAgQ0MgICAgIHNy
Yy9saWJzeXN0ZW1kX2NvcmVfbGEtZGJ1cy11bml0LmxvDQogIENDICAgICBzcmMvbGlic3lzdGVt
ZF9jb3JlX2xhLWRidXMtam9iLmxvDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLWRi
dXMtc2VydmljZS5sbw0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS1kYnVzLXNvY2tl
dC5sbw0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS1kYnVzLXRpbWVyLmxvDQogIEND
ICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLWRidXMtdGFyZ2V0LmxvDQogIENDICAgICBzcmMv
bGlic3lzdGVtZF9jb3JlX2xhLWRidXMtbW91bnQubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1k
X2NvcmVfbGEtZGJ1cy1hdXRvbW91bnQubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2NvcmVf
bGEtZGJ1cy1zd2FwLmxvDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLWRidXMtc25h
cHNob3QubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2NvcmVfbGEtZGJ1cy1kZXZpY2UubG8N
CiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2NvcmVfbGEtZGJ1cy1leGVjdXRlLmxvDQogIENDICAg
ICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLWRidXMtcGF0aC5sbw0KICBDQyAgICAgc3JjL2xpYnN5
c3RlbWRfY29yZV9sYS1jZ3JvdXAubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2NvcmVfbGEt
bW91bnQtc2V0dXAubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2NvcmVfbGEtaG9zdG5hbWUt
c2V0dXAubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2NvcmVfbGEtc2VsaW51eC1zZXR1cC5s
bw0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS1sb29wYmFjay1zZXR1cC5sbw0Kc3Jj
L2xvb3BiYWNrLXNldHVwLmM6IEluIGZ1bmN0aW9uICdhZGRfcnRhdHRyJzoNCnNyYy9sb29wYmFj
ay1zZXR1cC5jOjUwOjE1OiB3YXJuaW5nOiBjYXN0IGluY3JlYXNlcyByZXF1aXJlZCBhbGlnbm1l
bnQgb2YgdGFyZ2V0IHR5cGUgWy1XY2FzdC1hbGlnbl0NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1k
X2NvcmVfbGEta21vZC1zZXR1cC5sbw0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS1s
b2NhbGUtc2V0dXAubG8NCiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2NvcmVfbGEtbWFjaGluZS1p
ZC1zZXR1cC5sbw0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS1zcGVjaWZpZXIubG8N
CiAgQ0MgICAgIHNyYy9saWJzeXN0ZW1kX2NvcmVfbGEtdW5pdC1uYW1lLmxvDQogIENDICAgICBz
cmMvbGlic3lzdGVtZF9jb3JlX2xhLWZkc2V0LmxvDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9j
b3JlX2xhLW5hbWVzcGFjZS5sbw0KICBDQyAgICAgc3JjL2xpYnN5c3RlbWRfY29yZV9sYS10Y3B3
cmFwLmxvDQogIENDICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLWNncm91cC11dGlsLmxvDQog
IENDICAgICBzcmMvbGlic3lzdGVtZF9jb3JlX2xhLWNvbmRpdGlvbi5sbw0KICBDQyAgICAgc3Jj
L2xpYnN5c3RlbWRfY29yZV9sYS1kYnVzLWNvbW1vbi5sbw0KICBDQ0xEICAgbGlic3lzdGVtZC1j
b3JlLmxhDQphcm0tYW5nc3Ryb20tbGludXgtZ251ZWFiaS1saWJ0b29sOiBsaW5rOiB3YXJuaW5n
OiBgL29lL2J1aWxkLWFuZ3N0cm9tLW5leHQvYW5nc3Ryb20tZGV2L3N5c3Jvb3RzL2FybXY3YS1h
bmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9saWIvbGlicGFtLmxhJyBzZWVtcyB0byBiZSBtb3Zl
ZA0KICBDQyAgICAgc3JjL3NkLWRhZW1vbi5sbw0KICBDQ0xEICAgbGlic3lzdGVtZC1kYWVtb24u
bGENCiAgQ0MgICAgIHNyYy9wYW1fc3lzdGVtZF9sYS1wYW0tbW9kdWxlLmxvDQogIENDICAgICBz
cmMvcGFtX3N5c3RlbWRfbGEtY2dyb3VwLXV0aWwubG8NCiAgQ0NMRCAgIHBhbV9zeXN0ZW1kLmxh
DQphcm0tYW5nc3Ryb20tbGludXgtZ251ZWFiaS1saWJ0b29sOiBsaW5rOiB3YXJuaW5nOiBgL29l
L2J1aWxkLWFuZ3N0cm9tLW5leHQvYW5nc3Ryb20tZGV2L3N5c3Jvb3RzL2FybXY3YS1hbmdzdHJv
bS1saW51eC1nbnVlYWJpL3Vzci9saWIvbGlicGFtLmxhJyBzZWVtcyB0byBiZSBtb3ZlZA0KICBD
QyAgICAgc3JjL3N5c3RlbWRfY2dscy1jZ2xzLm8NCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX2NnbHMt
Y2dyb3VwLXNob3cubw0KICBDQyAgICAgc3JjL3N5c3RlbWRfY2dscy1jZ3JvdXAtdXRpbC5vDQog
IENDTEQgICBzeXN0ZW1kLWNnbHMNCiAgQ0MgICAgIHNyYy9icmlkZ2Uubw0KICBDQ0xEICAgc3lz
dGVtZC1zdGRpby1icmlkZ2UNCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX25zcGF3bi1uc3Bhd24ubw0K
ICBDQyAgICAgc3JjL3N5c3RlbWRfbnNwYXduLWNncm91cC11dGlsLm8NCiAgQ0NMRCAgIHN5c3Rl
bWQtbnNwYXduDQogIENDICAgICBzcmMvdGVzdF9lbmdpbmUtdGVzdC1lbmdpbmUubw0KICBDQ0xE
ICAgdGVzdC1lbmdpbmUNCiAgQ0MgICAgIHNyYy90ZXN0X2pvYl90eXBlLXRlc3Qtam9iLXR5cGUu
bw0KICBDQ0xEICAgdGVzdC1qb2ItdHlwZQ0KICBDQyAgICAgc3JjL3Rlc3RfbnMtdGVzdC1ucy5v
DQogIENDTEQgICB0ZXN0LW5zDQogIENDICAgICBzcmMvdGVzdC1sb29wYmFjay5vDQogIENDICAg
ICBzcmMvbG9vcGJhY2stc2V0dXAubw0Kc3JjL2xvb3BiYWNrLXNldHVwLmM6IEluIGZ1bmN0aW9u
ICdhZGRfcnRhdHRyJzoNCnNyYy9sb29wYmFjay1zZXR1cC5jOjUwOjE1OiB3YXJuaW5nOiBjYXN0
IGluY3JlYXNlcyByZXF1aXJlZCBhbGlnbm1lbnQgb2YgdGFyZ2V0IHR5cGUgWy1XY2FzdC1hbGln
bl0NCiAgQ0NMRCAgIHRlc3QtbG9vcGJhY2sNCiAgQ0MgICAgIHNyYy90ZXN0LWhvc3RuYW1lLm8N
CiAgQ0MgICAgIHNyYy9ob3N0bmFtZS1zZXR1cC5vDQogIENDTEQgICB0ZXN0LWhvc3RuYW1lDQog
IENDICAgICBzcmMvdGVzdC1kYWVtb24ubw0KICBDQ0xEICAgdGVzdC1kYWVtb24NCiAgQ0MgICAg
IHNyYy90ZXN0X2Nncm91cC10ZXN0LWNncm91cC5vDQogIENDICAgICBzcmMvdGVzdF9jZ3JvdXAt
Y2dyb3VwLXV0aWwubw0KICBDQ0xEICAgdGVzdC1jZ3JvdXANCiAgQ0MgICAgIHNyYy90ZXN0X2Vu
dl9yZXBsYWNlLXRlc3QtZW52LXJlcGxhY2Uubw0KICBDQ0xEICAgdGVzdC1lbnYtcmVwbGFjZQ0K
ICBDQyAgICAgc3JjL3Rlc3Rfc3Rydi10ZXN0LXN0cnYubw0KICBDQyAgICAgc3JjL3Rlc3Rfc3Ry
di1zcGVjaWZpZXIubw0KICBDQ0xEICAgdGVzdC1zdHJ2DQogIENDICAgICBzcmMvc3lzdGVtZC1t
YWluLm8NCiAgQ0NMRCAgIHN5c3RlbWQNCiAgQ0MgICAgIHNyYy9zeXN0ZW1jdGwtc3lzdGVtY3Rs
Lm8NCiAgQ0MgICAgIHNyYy9zeXN0ZW1jdGwtdXRtcC13dG1wLm8NCiAgQ0MgICAgIHNyYy9zeXN0
ZW1jdGwtZGJ1cy1jb21tb24ubw0KICBDQyAgICAgc3JjL3N5c3RlbWN0bC1wYXRoLWxvb2t1cC5v
DQogIENDICAgICBzcmMvc3lzdGVtY3RsLWNncm91cC1zaG93Lm8NCiAgQ0MgICAgIHNyYy9zeXN0
ZW1jdGwtY2dyb3VwLXV0aWwubw0KICBDQyAgICAgc3JjL3N5c3RlbWN0bC1leGl0LXN0YXR1cy5v
DQogIENDICAgICBzcmMvc3lzdGVtY3RsLXVuaXQtbmFtZS5vDQogIENDTEQgICBzeXN0ZW1jdGwN
CiAgQ0MgICAgIHNyYy9ub3RpZnkubw0KICBDQyAgICAgc3JjL3NkLXJlYWRhaGVhZC5vDQogIEND
TEQgICBzeXN0ZW1kLW5vdGlmeQ0KICBDQyAgICAgc3JjL2Fzay1wYXNzd29yZC5vDQogIENDICAg
ICBzcmMvYXNrLXBhc3N3b3JkLWFwaS5vDQpzcmMvYXNrLXBhc3N3b3JkLWFwaS5jOiBJbiBmdW5j
dGlvbiAnYXNrX3Bhc3N3b3JkX2FnZW50JzoNCnNyYy9hc2stcGFzc3dvcmQtYXBpLmM6NDc1OjI1
OiB3YXJuaW5nOiBjYXN0IGluY3JlYXNlcyByZXF1aXJlZCBhbGlnbm1lbnQgb2YgdGFyZ2V0IHR5
cGUgWy1XY2FzdC1hbGlnbl0NCiAgQ0NMRCAgIHN5c3RlbWQtYXNrLXBhc3N3b3JkDQogIENDICAg
ICBzcmMvdHR5LWFzay1wYXNzd29yZC1hZ2VudC5vDQogIENDICAgICBzcmMvdXRtcC13dG1wLm8N
CiAgQ0NMRCAgIHN5c3RlbWQtdHR5LWFzay1wYXNzd29yZC1hZ2VudA0KICBDQyAgICAgc3JjL3N5
c3RlbWRfdG1wZmlsZXMtdG1wZmlsZXMubw0KICBDQ0xEICAgc3lzdGVtZC10bXBmaWxlcw0KICBD
QyAgICAgc3JjL3N5c3RlbWRfbWFjaGluZV9pZF9zZXR1cC1tYWNoaW5lLWlkLXNldHVwLm8NCiAg
Q0MgICAgIHNyYy9zeXN0ZW1kX21hY2hpbmVfaWRfc2V0dXAtbWFjaGluZS1pZC1tYWluLm8NCiAg
Q0NMRCAgIHN5c3RlbWQtbWFjaGluZS1pZC1zZXR1cA0KICBDQyAgICAgc3JjL2xvZ2dlci5vDQpz
cmMvbG9nZ2VyLmM6IEluIGZ1bmN0aW9uICdzdHJlYW1fbG9nJzoNCnNyYy9sb2dnZXIuYzoxNjQ6
MjU6IHdhcm5pbmc6IGNhc3QgaW5jcmVhc2VzIHJlcXVpcmVkIGFsaWdubWVudCBvZiB0YXJnZXQg
dHlwZSBbLVdjYXN0LWFsaWduXQ0KICBDQyAgICAgc3JjL3RjcHdyYXAubw0KICBDQ0xEICAgc3lz
dGVtZC1sb2dnZXINCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX2Nncm91cHNfYWdlbnQtY2dyb3Vwcy1h
Z2VudC5vDQogIENDICAgICBzcmMvc3lzdGVtZF9jZ3JvdXBzX2FnZW50LWRidXMtY29tbW9uLm8N
CiAgQ0NMRCAgIHN5c3RlbWQtY2dyb3Vwcy1hZ2VudA0KICBDQyAgICAgc3JjL3N5c3RlbWRfaW5p
dGN0bC1pbml0Y3RsLm8NCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX2luaXRjdGwtZGJ1cy1jb21tb24u
bw0KICBDQ0xEICAgc3lzdGVtZC1pbml0Y3RsDQogIENDICAgICBzcmMvc3lzdGVtZF91cGRhdGVf
dXRtcC11cGRhdGUtdXRtcC5vDQogIENDICAgICBzcmMvc3lzdGVtZF91cGRhdGVfdXRtcC1kYnVz
LWNvbW1vbi5vDQogIENDICAgICBzcmMvc3lzdGVtZF91cGRhdGVfdXRtcC11dG1wLXd0bXAubw0K
ICBDQ0xEICAgc3lzdGVtZC11cGRhdGUtdXRtcA0KICBDQyAgICAgc3JjL3N5c3RlbWRfcmFuZG9t
X3NlZWQtcmFuZG9tLXNlZWQubw0KICBDQ0xEICAgc3lzdGVtZC1yYW5kb20tc2VlZA0KICBDQyAg
ICAgc3JjL3N5c3RlbWRfc2h1dGRvd25kLXV0bXAtd3RtcC5vDQogIENDICAgICBzcmMvc3lzdGVt
ZF9zaHV0ZG93bmQtc2h1dGRvd25kLm8NCnNyYy9zaHV0ZG93bmQuYzogSW4gZnVuY3Rpb24gJ3Jl
YWRfcGFja2V0JzoNCnNyYy9zaHV0ZG93bmQuYzo4NToxNzogd2FybmluZzogY2FzdCBpbmNyZWFz
ZXMgcmVxdWlyZWQgYWxpZ25tZW50IG9mIHRhcmdldCB0eXBlIFstV2Nhc3QtYWxpZ25dDQogIEND
TEQgICBzeXN0ZW1kLXNodXRkb3duZA0KICBDQyAgICAgc3JjL3N5c3RlbWRfc2h1dGRvd24tbW91
bnQtc2V0dXAubw0KICBDQyAgICAgc3JjL3N5c3RlbWRfc2h1dGRvd24tdW1vdW50Lm8NCiAgQ0Mg
ICAgIHNyYy9zeXN0ZW1kX3NodXRkb3duLXNodXRkb3duLm8NCiAgQ0NMRCAgIHN5c3RlbWQtc2h1
dGRvd24NCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX21vZHVsZXNfbG9hZC1tb2R1bGVzLWxvYWQubw0K
ICBDQ0xEICAgc3lzdGVtZC1tb2R1bGVzLWxvYWQNCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX3JlbW91
bnRfYXBpX3Zmcy1yZW1vdW50LWFwaS12ZnMubw0KICBDQyAgICAgc3JjL3N5c3RlbWRfcmVtb3Vu
dF9hcGlfdmZzLW1vdW50LXNldHVwLm8NCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX3JlbW91bnRfYXBp
X3Zmcy1leGl0LXN0YXR1cy5vDQogIENDTEQgICBzeXN0ZW1kLXJlbW91bnQtYXBpLXZmcw0KICBD
QyAgICAgc3JjL3N5c3RlbWRfa21zZ19zeXNsb2dkLWttc2ctc3lzbG9nZC5vDQpzcmMva21zZy1z
eXNsb2dkLmM6IEluIGZ1bmN0aW9uICdwcm9jZXNzX2V2ZW50JzoNCnNyYy9rbXNnLXN5c2xvZ2Qu
Yzo0MjM6NDE6IHdhcm5pbmc6IGNhc3QgaW5jcmVhc2VzIHJlcXVpcmVkIGFsaWdubWVudCBvZiB0
YXJnZXQgdHlwZSBbLVdjYXN0LWFsaWduXQ0KICBDQyAgICAgc3JjL3N5c3RlbWRfa21zZ19zeXNs
b2dkLWZkc2V0Lm8NCiAgQ0NMRCAgIHN5c3RlbWQta21zZy1zeXNsb2dkDQogIENDICAgICBzcmMv
c3lzdGVtZF92Y29uc29sZV9zZXR1cC12Y29uc29sZS1zZXR1cC5vDQogIENDTEQgICBzeXN0ZW1k
LXZjb25zb2xlLXNldHVwDQogIENDICAgICBzcmMvcmVwbHktcGFzc3dvcmQubw0KICBDQ0xEICAg
c3lzdGVtZC1yZXBseS1wYXNzd29yZA0KICBDQyAgICAgc3JjL3N5c3RlbWRfcmVhZGFoZWFkX2Nv
bGxlY3QtcmVhZGFoZWFkLWNvbGxlY3Qubw0Kc3JjL3JlYWRhaGVhZC1jb2xsZWN0LmM6IEluIGZ1
bmN0aW9uICdjb2xsZWN0JzoNCnNyYy9yZWFkYWhlYWQtY29sbGVjdC5jOjM1ODoyOTogd2Fybmlu
ZzogY2FzdCBpbmNyZWFzZXMgcmVxdWlyZWQgYWxpZ25tZW50IG9mIHRhcmdldCB0eXBlIFstV2Nh
c3QtYWxpZ25dDQpzcmMvcmVhZGFoZWFkLWNvbGxlY3QuYzozNzY6Mzc6IHdhcm5pbmc6IGNhc3Qg
aW5jcmVhc2VzIHJlcXVpcmVkIGFsaWdubWVudCBvZiB0YXJnZXQgdHlwZSBbLVdjYXN0LWFsaWdu
XQ0KICBDQyAgICAgc3JjL3N5c3RlbWRfcmVhZGFoZWFkX2NvbGxlY3QtcmVhZGFoZWFkLWNvbW1v
bi5vDQogIENDTEQgICBzeXN0ZW1kLXJlYWRhaGVhZC1jb2xsZWN0DQogIENDICAgICBzcmMvc3lz
dGVtZF9yZWFkYWhlYWRfcmVwbGF5LXJlYWRhaGVhZC1yZXBsYXkubw0Kc3JjL3JlYWRhaGVhZC1y
ZXBsYXkuYzogSW4gZnVuY3Rpb24gJ3JlcGxheSc6DQpzcmMvcmVhZGFoZWFkLXJlcGxheS5jOjIx
Mzo1MTogd2FybmluZzogY2FzdCBpbmNyZWFzZXMgcmVxdWlyZWQgYWxpZ25tZW50IG9mIHRhcmdl
dCB0eXBlIFstV2Nhc3QtYWxpZ25dDQpzcmMvcmVhZGFoZWFkLXJlcGxheS5jOjIyNjozNzogd2Fy
bmluZzogY2FzdCBpbmNyZWFzZXMgcmVxdWlyZWQgYWxpZ25tZW50IG9mIHRhcmdldCB0eXBlIFst
V2Nhc3QtYWxpZ25dDQogIENDICAgICBzcmMvc3lzdGVtZF9yZWFkYWhlYWRfcmVwbGF5LXJlYWRh
aGVhZC1jb21tb24ubw0KICBDQ0xEICAgc3lzdGVtZC1yZWFkYWhlYWQtcmVwbGF5DQogIENDICAg
ICBzcmMvc3lzdGVtZF91c2VyX3Nlc3Npb25zLXVzZXItc2Vzc2lvbnMubw0KICBDQyAgICAgc3Jj
L3N5c3RlbWRfdXNlcl9zZXNzaW9ucy1jZ3JvdXAtdXRpbC5vDQogIENDTEQgICBzeXN0ZW1kLXVz
ZXItc2Vzc2lvbnMNCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX2ZzY2stZnNjay5vDQogIENDICAgICBz
cmMvc3lzdGVtZF9mc2NrLWRidXMtY29tbW9uLm8NCiAgQ0NMRCAgIHN5c3RlbWQtZnNjaw0KICBD
QyAgICAgc3JjL3N5c3RlbWRfcXVvdGFjaGVjay1xdW90YWNoZWNrLm8NCiAgQ0NMRCAgIHN5c3Rl
bWQtcXVvdGFjaGVjaw0KICBDQyAgICAgc3JjL3N5c3RlbWRfdGltZXN0YW1wLXRpbWVzdGFtcC5v
DQogIENDTEQgICBzeXN0ZW1kLXRpbWVzdGFtcA0KICBDQyAgICAgc3JjL3N5c3RlbWRfYWNfcG93
ZXItYWMtcG93ZXIubw0KICBDQ0xEICAgc3lzdGVtZC1hYy1wb3dlcg0KICBDQyAgICAgc3JjL3N5
c3RlbWRfZGV0ZWN0X3ZpcnQtZGV0ZWN0LXZpcnQubw0KICBDQ0xEICAgc3lzdGVtZC1kZXRlY3Qt
dmlydA0KICBDQyAgICAgc3JjL3N5c3RlbWRfc3lzY3RsLXN5c2N0bC5vDQogIENDTEQgICBzeXN0
ZW1kLXN5c2N0bA0KICBDQyAgICAgc3JjL3N5c3RlbWRfaG9zdG5hbWVkLWhvc3RuYW1lZC5vDQog
IENDICAgICBzcmMvc3lzdGVtZF9ob3N0bmFtZWQtZGJ1cy1jb21tb24ubw0KICBDQ0xEICAgc3lz
dGVtZC1ob3N0bmFtZWQNCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX2JpbmZtdC1iaW5mbXQubw0KICBD
Q0xEICAgc3lzdGVtZC1iaW5mbXQNCiAgQ0MgICAgIHNyYy9zeXN0ZW1kX2dldHR5X2dlbmVyYXRv
ci1nZXR0eS1nZW5lcmF0b3Iubw0KICBDQyAgICAgc3JjL3N5c3RlbWRfZ2V0dHlfZ2VuZXJhdG9y
LXVuaXQtbmFtZS5vDQogIENDTEQgICBzeXN0ZW1kLWdldHR5LWdlbmVyYXRvcg0KICBHRU4gICAg
bWFuL3N5c3RlbWQuMQ0KSS9PIGVycm9yIDogQXR0ZW1wdCB0byBsb2FkIG5ldHdvcmsgZW50aXR5
IGh0dHA6Ly9kb2Nib29rLnNvdXJjZWZvcmdlLm5ldC9yZWxlYXNlL3hzbC9jdXJyZW50L21hbnBh
Z2VzL2RvY2Jvb2sueHNsDQp3YXJuaW5nOiBmYWlsZWQgdG8gbG9hZCBleHRlcm5hbCBlbnRpdHkg
Imh0dHA6Ly9kb2Nib29rLnNvdXJjZWZvcmdlLm5ldC9yZWxlYXNlL3hzbC9jdXJyZW50L21hbnBh
Z2VzL2RvY2Jvb2sueHNsIg0KY2Fubm90IHBhcnNlIGh0dHA6Ly9kb2Nib29rLnNvdXJjZWZvcmdl
Lm5ldC9yZWxlYXNlL3hzbC9jdXJyZW50L21hbnBhZ2VzL2RvY2Jvb2sueHNsDQptYWtlWzFdOiAq
KiogW21hbi9zeXN0ZW1kLjFdIEVycm9yIDQNCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAv
b2UvYnVpbGQtYW5nc3Ryb20tbmV4dC9hbmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ryb20t
bGludXgtZ251ZWFiaS9zeXN0ZW1kLXYyNi1yMC9naXQnDQptYWtlOiAqKiogW2FsbF0gRXJyb3Ig
Mg0KKyBkaWUgJ29lX3J1bm1ha2UgZmFpbGVkJw0KKyBvZWZhdGFsICdvZV9ydW5tYWtlIGZhaWxl
ZCcNCisgZWNobyBGQVRBTDogJ29lX3J1bm1ha2UgZmFpbGVkJw0KRkFUQUw6IG9lX3J1bm1ha2Ug
ZmFpbGVkDQorIGV4aXQgMQ0K

--=-Zv///ozXmUhUbdMjgF2D--

--=-l9ePzCqP9SuuxJLug2wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2+mncACgkQPX1aK2wOHVh7cQCgg5w2LE9UypPdJM1DWS3t8o1E
QPQAn0JIsu54I7OVDh2NY4yuzTfJq2pZ
=LRq7
-----END PGP SIGNATURE-----

--=-l9ePzCqP9SuuxJLug2wi--
