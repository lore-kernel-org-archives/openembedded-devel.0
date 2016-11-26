Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8142571989
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 04:57:49 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id x23so7156737pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 20:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:subject:date:references:to:in-reply-to:message-id; 
	bh=Lq1qtyWQ4SAAz0RJgqEsG45GYfCIlSJcGvSNSoSg0BU=;
	b=inRjwcDVLEGEBKhv1YYKrM3ixc+xeQAi3jUVgkvb3rPPK0kMjELMlvlCN71KNKKnBw
	EiyslcDkdfMbOF3HYY2FZstiO2JSqIVTJURI5mEreJMbSFUTUO8nmcoZW2kX28zvP4IO
	lKibm4I+cQ+euvIUz4+urQZaPGTRKqhpQOLyfTL+gJ/XxVbL8OmejGTSXYg0Fhs51O2l
	soey1/S3v/qkE6lLcEBkgEv5YK9IYIXPpcM6X8Vb+HxWuK51G6Odiqklnl5z/qC8czwY
	0+wv2bjjIBriacCOW7SEx5ZtVZ3Y4LfLnCty041AwcoyeoB9cRE2CqQqIZF/zsLYaiVf
	wFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:subject:date:references:to
	:in-reply-to:message-id;
	bh=Lq1qtyWQ4SAAz0RJgqEsG45GYfCIlSJcGvSNSoSg0BU=;
	b=VuYXwaD/3uvQlF2WAzF8t/MZK0eJ6C8JZSJwNPJHjmRHqu0uaeE4NX8FZOoM+e0oKn
	ZgANFYRrdE4ufpDxS0sWVY1aSz2muoct1CT0UqMpD4ncQekSE2OdpYhjWlql5NL6g/OS
	T2AZfzRGfcbviQqwipDD2OWQN/IXmoItoqYs2U6qHFNhBo84ytZEXKAmg/6gbmJyFhSA
	Z7i8HvBwb6ItKD6aXqspoOTkH47QHJf+ZEbSYEwSYHJ81owUtzBLVnDvubQ9PBYRk1Vg
	mzJC+pXY1Q2qzDIaoEs6mbea3BiauQsV5VgPVnIjMPW/ieRLGp8RWyz2+fgKdEIHjDk0
	ZVqg==
X-Gm-Message-State: AKaTC03xFORvVObr8VgKTQlkRRzaJqY7lkPVb1QeHtFLIejGvKvw82/5kZZ5eO0O22azVw==
X-Received: by 10.99.122.14 with SMTP id v14mr20778927pgc.31.1480136270765;
	Fri, 25 Nov 2016 20:57:50 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:e574:db7a:d1a9:c4a6?
	([2601:646:8882:b8c:e574:db7a:d1a9:c4a6])
	by smtp.gmail.com with ESMTPSA id
	t67sm71176234pfg.13.2016.11.25.20.57.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 20:57:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Fri, 25 Nov 2016 20:57:49 -0800
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-31-raj.khem@gmail.com>
	<20161126001717.GE8369@jama>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20161126001717.GE8369@jama>
Message-Id: <00A62FB4-2D3C-487E-A4AB-420D1CECF772@gmail.com>
X-Mailer: Apple Mail (2.3251)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 31/49] openobex,obexftp: Update recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Nov 2016 04:57:49 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 25, 2016, at 4:17 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Nov 23, 2016 at 01:21:51AM -0800, Khem Raj wrote:
>> Update obexftp to 0.24.2 and openobex to 1.7.2
>> These packages moved to CMake infra for builds
>> therefore make adjustments to cross compile it
>=20
> opexftp autodetect uriparser now:
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/1=
10050.html =
<http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/=
110050.html>

uriparser is not in meta-openembedded layers. So I guess I could =
packageconfig out it and keep it disabled by default

>=20
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../disable-cable-test.patch                       |  0
>> .../libusb_crosscompile_check.patch                |  0
>> .../separate_builddir.patch                        |  0
>> meta-oe/recipes-connectivity/obex/openobex_1.5.bb  | 35 =
----------------
>> .../recipes-connectivity/obex/openobex_1.7.2.bb    | 37 =
+++++++++++++++++
>> ...ists.txt-Explicitly-link-libbfb-and-libmu.patch | 47 =
++++++++++++++++++++++
>> .../recipes-connectivity/obexftp/obexftp_0.23.bb   | 16 --------
>> .../recipes-connectivity/obexftp/obexftp_0.24.2.bb | 33 =
+++++++++++++++
>> 8 files changed, 117 insertions(+), 51 deletions(-)
>> rename meta-oe/recipes-connectivity/obex/{openobex-1.5 =3D> =
openobex}/disable-cable-test.patch (100%)
>> rename meta-oe/recipes-connectivity/obex/{openobex-1.5 =3D> =
openobex}/libusb_crosscompile_check.patch (100%)
>> rename meta-oe/recipes-connectivity/obex/{openobex-1.5 =3D> =
openobex}/separate_builddir.patch (100%)
>> delete mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.5.bb
>> create mode 100644 =
meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
>> create mode 100644 =
meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Expl=
icitly-link-libbfb-and-libmu.patch
>> delete mode 100644 =
meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
>> create mode 100644 =
meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
>>=20
>> diff --git =
a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch =
b/meta-oe/recipes-connectivity/obex/openobex/disable-cable-test.patch
>> similarity index 100%
>> rename from =
meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
>> rename to =
meta-oe/recipes-connectivity/obex/openobex/disable-cable-test.patch
>> diff --git =
a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check=
.patch =
b/meta-oe/recipes-connectivity/obex/openobex/libusb_crosscompile_check.pat=
ch
>> similarity index 100%
>> rename from =
meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.p=
atch
>> rename to =
meta-oe/recipes-connectivity/obex/openobex/libusb_crosscompile_check.patch=

>> diff --git =
a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch =
b/meta-oe/recipes-connectivity/obex/openobex/separate_builddir.patch
>> similarity index 100%
>> rename from =
meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch
>> rename to =
meta-oe/recipes-connectivity/obex/openobex/separate_builddir.patch
>> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb =
b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
>> deleted file mode 100644
>> index 6ac7905..0000000
>> --- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
>> +++ /dev/null
>> @@ -1,35 +0,0 @@
>> -DESCRIPTION =3D "The Openobex project is an open source =
implementation of the \
>> -Object Exchange (OBEX) protocol."
>> -HOMEPAGE =3D "http://openobex.triq.net"
>> -SECTION =3D "libs"
>> -DEPENDS =3D "virtual/libusb0"
>> -DEPENDS +=3D =
"${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
>> -
>> -LICENSE =3D "GPLv2 & LGPLv2.1"
>> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a \
>> -                    =
file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
>> -"
>> -
>> -SRC_URI =3D =
"http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
>> -           file://disable-cable-test.patch \
>> -           file://libusb_crosscompile_check.patch \
>> -           file://separate_builddir.patch"
>> -
>> -SRC_URI[md5sum] =3D "0d83dc86445a46a1b9750107ba7ab65c"
>> -SRC_URI[sha256sum] =3D =
"e602047570799a47ecb028420bda8f2cef41310e5a99d084de10aa9422935e65"
>> -
>> -inherit autotools binconfig pkgconfig
>> -
>> -EXTRA_OECONF =3D "--enable-apps --enable-syslog"
>> -
>> -do_install_append() {
>> -    install -d ${D}${datadir}/aclocal
>> -    install -m 0644 ${S}/openobex.m4 ${D}${datadir}/aclocal
>> -}
>> -
>> -PACKAGES +=3D "openobex-apps"
>> -FILES_${PN} =3D "${libdir}/lib*.so.*"
>> -FILES_${PN}-dev +=3D "${bindir}/openobex-config"
>> -FILES_${PN}-apps =3D "${bindir}/*"
>> -DEBIAN_NOAUTONAME_${PN}-apps =3D "1"
>> -
>> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb =
b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
>> new file mode 100644
>> index 0000000..053c80a
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
>> @@ -0,0 +1,37 @@
>> +DESCRIPTION =3D "The Openobex project is an open source =
implementation of the \
>> +Object Exchange (OBEX) protocol."
>> +HOMEPAGE =3D "http://openobex.triq.net"
>> +SECTION =3D "libs"
>> +DEPENDS =3D "virtual/libusb0"
>> +DEPENDS_append_class-target =3D " =
${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
>> +
>> +LICENSE =3D "GPLv2 & LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a \
>> +                    =
file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
>> +"
>> +
>> +SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}-Source.tar.gz \
>> +"
>> +
>> +SRC_URI[md5sum] =3D "f6e0b6cb7dcfd731460a7e9a91429a3a"
>> +SRC_URI[sha256sum] =3D =
"158860aaea52f0fce0c8e4b64550daaae06df2689e05834697b7e8c7d73dd4fc"
>> +
>> +inherit cmake pkgconfig
>> +
>> +S =3D "${WORKDIR}/${BP}-Source"
>> +
>> +EXTRA_OECONF =3D " -DCMAKE_SKIP_RPATH=3DON "
>> +
>> +#--enable-apps --enable-syslog
>> +
>> +do_install_append () {
>> +    rmdir ${D}${bindir}
>> +}
>> +
>> +PACKAGES =3D+ "openobex-apps"
>> +FILES_${PN}-apps =3D "${bindir}/*"
>> +FILES_${PN} +=3D "${libdir}/lib*.so.*"
>> +FILES_${PN}-dev +=3D "${bindir}/openobex-config ${libdir}/cmake"
>> +DEBIAN_NOAUTONAME_${PN}-apps =3D "1"
>> +
>> +BBCLASSEXTEND =3D "native"
>> diff --git =
a/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Ex=
plicitly-link-libbfb-and-libmu.patch =
b/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Ex=
plicitly-link-libbfb-and-libmu.patch
>> new file mode 100644
>> index 0000000..55e5567
>> --- /dev/null
>> +++ =
b/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Ex=
plicitly-link-libbfb-and-libmu.patch
>> @@ -0,0 +1,47 @@
>> +=46rom b8dc608dad7d9fc3a4c16acd0327d97b81c23b95 Mon Sep 17 00:00:00 =
2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 15 Nov 2016 01:32:31 +0000
>> +Subject: [PATCH] apps/CMakeLists.txt: Explicitly link libbfb and =
libmulticobex
>> +
>> +Transitive linking is disabled now for multicobex and
>> +obexftp, This ends up with linking errors for apps, therefore
>> +they are required to be added to link line explicitly.
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + apps/CMakeLists.txt | 13 +++++++++++--
>> + 1 file changed, 11 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/apps/CMakeLists.txt b/apps/CMakeLists.txt
>> +index b5c84e4..63af134 100644
>> +--- a/apps/CMakeLists.txt
>> ++++ b/apps/CMakeLists.txt
>> +@@ -5,14 +5,23 @@ add_definitions( -DVERSION=3D"${obexftp_VERSION}" =
)
>> + add_definitions ( -DHAVE_USB )
>> +=20
>> + add_executable ( obexftp_app obexftp.c )
>> +-target_link_libraries ( obexftp_app obexftp )
>> ++target_link_libraries ( obexftp_app
>> ++  PRIVATE multicobex
>> ++  PRIVATE bfb
>> ++  obexftp
>> ++)
>> + set_target_properties ( obexftp_app PROPERTIES
>> +   OUTPUT_NAME obexftp
>> + )
>> +=20
>> +=20
>> + add_executable ( obexftpd_app obexftpd.c )
>> +-target_link_libraries ( obexftpd_app obexftp openobex )
>> ++target_link_libraries ( obexftpd_app
>> ++  PRIVATE multicobex
>> ++  PRIVATE bfb
>> ++  obexftp
>> ++  openobex
>> ++)
>> + set_target_properties ( obexftpd_app PROPERTIES
>> +   OUTPUT_NAME obexftpd
>> + )
>> +--=20
>> +1.9.1
>> +
>> diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb =
b/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
>> deleted file mode 100644
>> index b6bdfb7..0000000
>> --- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -DESCRIPTION =3D "A tool for transfer files to/from any OBEX enabled =
device"
>> -LICENSE =3D "GPLv2 & LGPLv2 & LGPLv2.1"
>> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
>> -
>> -DEPENDS +=3D "openobex"
>> -
>> -SRC_URI =3D =
"http://sourceforge.net/projects/openobex/files/obexftp/${PV}/obexftp-${PV=
}.tar.bz2 \
>> -           file://Remove_some_printf_in_obexftpd.patch "
>> -
>> -SRC_URI[md5sum] =3D "f20762061b68bc921e80be4aebc349eb"
>> -SRC_URI[sha256sum] =3D =
"44a74ff288d38c0f75354d6bc2efe7d6dec10112eaff2e7b10e292b0d2105b36"
>> -
>> -inherit autotools pkgconfig
>> -
>> -EXTRA_OECONF +=3D "--disable-tcl --disable-perl --disable-python =
--disable-ruby"
>> -
>> diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb =
b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
>> new file mode 100644
>> index 0000000..991cd48
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
>> @@ -0,0 +1,33 @@
>> +DESCRIPTION =3D "A tool for transfer files to/from any OBEX enabled =
device"
>> +LICENSE =3D "GPLv2 & PD & LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D =
"file://LGPL-2.1.txt;md5=3D4fbd65380cdd255951079008b364516c \
>> +                    =
file://GPL-2.txt;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>> +                    =
file://License.txt;md5=3Dfcbddc3c1debed80dd80da2d3e5f0dc1 \
>> +                   "
>> +
>> +DEPENDS +=3D "openobex obexftp-native"
>> +SRC_URI =3D =
"http://downloads.sourceforge.net/openobex/${BP}-Source.tar.gz \
>> +           =
file://0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch \
>> +"
>> +SRC_URI[md5sum] =3D "157a9d1b2ed220203f7084db906de73c"
>> +SRC_URI[sha256sum] =3D =
"d40fb48e0a0eea997b3e582774b29f793919a625d54b87182e31a3f3d1c989a3"
>> +
>> +inherit cmake pkgconfig
>> +
>> +S =3D "${WORKDIR}/${BP}-Source"
>> +
>> +EXTRA_OECMAKE +=3D "-DCMAKE_SKIP_RPATH=3DON \
>> +                  -DENABLE_PERL=3DNO -DENABLE_PYTHON=3DNO \
>> +                  -DENABLE_RUBY=3DNO -DENABLE_TCL=3DNO \
>> +"
>> +
>> +do_compile_class-native () {
>> +    oe_runmake crctable
>> +}
>> +
>> +do_install_class-native () {
>> +    install -D -m 0755 ${B}/bfb/crctable ${D}${bindir}/crctable
>> +}
>> +
>> +
>> +BBCLASSEXTEND =3D "native"
>> --=20
>> 2.10.2
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com =
<mailto:Martin.Jansa@gmail.com>
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>

