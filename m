Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1787.1591896710768760844
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 10:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10EE140C1C;
	Thu, 11 Jun 2020 17:31:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 363hDyocCTj2; Thu, 11 Jun 2020 17:31:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EBECB40BB1;
	Thu, 11 Jun 2020 17:31:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4A988173217; Thu, 11 Jun 2020 13:31:48 -0400 (EDT)
Date: Thu, 11 Jun 2020 13:31:48 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [dunfell 00/27] Merge request #3
Message-ID: <20200611173148.GA17660@denix.org>
References: <cover.1591886131.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1591886131.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2020 at 07:38:00AM -0700, akuster wrote:
> Please merge these changes to dunfell
> Cover letter only

Thanks, LGTM!


> The following changes since commit cc155826b0b4f202a8fa4ac103b7c38368d32=
734:
>=20
>   thunar: upgrade 1.8.14 -> 1.8.15 (2020-05-28 21:50:13 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded dunfell-next
>   http://cgit.openembedded.org/meta-openembedded/log/?h=3Ddunfell-next
>=20
> Adrian Bunk (1):
>   python3-docutils: Remove, moved to OE-core
>=20
> Andreas M=FCller (1):
>   fluidsynth: upgrade 2.1.2 -> 2.1.3
>=20
> Denys Dmytriyenko (2):
>   python3-pycryptodome(x): moved to OE-Core, remove from meta-python
>   python3-pyelftools: moved to OE-Core, remove from meta-python
>=20
> Domarys Correa (1):
>   python3-pyyaml: Update 5.3 -> 5.3.1
>=20
> Hongxu Jia (1):
>   multipath-tools: fix compiling parallel issue
>=20
> Kai Kang (1):
>   plymouth: disable systemd-integration for sysvinit
>=20
> Khem Raj (1):
>   dfu-util-native: Remove DEPLOY_DIR_TOOLS from sstate-outputdirs
>=20
> Konrad Weihmann (6):
>   passwdqc: remove double modify operation
>   sound-theme-freedesktop: remove double depends
>   python3-cmd2: remove double colorama in RDEPENDS
>   python3-smbus2: remove duplicate RDEPENDS settings
>   python3-twisted: remove double var modification
>   proftpd: Fix typo for SRC_URI[md5sum]
>=20
> Leon Anavi (1):
>   python3-colorama: Upgrade 0.4.1 -> 0.4.3
>=20
> Maciej Pijanowski (1):
>   qpdf: fix typo in RDEPENDS
>=20
> Martin Jansa (2):
>   irssi: package libirc_proxy.a in PN-staticdev
>   meta-python: depend on core version 12 or higher
>=20
> Patrick Williams (1):
>   net-snmp: refresh patches
>=20
> Zang Ruochen (4):
>   libgphoto2: upgrade 2.5.24 -> 2.5.25
>   mosquitto: upgrade 1.6.9 -> 1.6.10
>   snort: upgrade 2.9.15 -> 2.9.16
>   wireshark: upgrade 3.2.2 -> 3.2.4
>=20
> Zheng Ruoqin (4):
>   nano: upgrade 4.9.2 -> 4.9.3
>   gsoap: upgrade 2.8.100 -> 2.8.103
>   logwatch: upgrade 7.5.1 -> 7.5.3
>   libnet-dns-perl: upgrade 1.23 -> 1.24
>=20
>  .../fluidsynth/fluidsynth.inc                 |  4 +-
>  ...tables-helper-we-have-to-use-native-.patch | 32 +++++++++----
>  ...mosquitto_1.6.9.bb =3D> mosquitto_1.6.10.bb} |  4 +-
>  ...deck-for-gettid-API-during-configure.patch | 48 -------------------
>  .../{snort_2.9.15.bb =3D> snort_2.9.16.bb}      |  5 +-
>  .../recipes-daemons/proftpd/proftpd_1.3.6.bb  |  2 +-
>  ...upport-for-building-applications-and.patch | 24 +++++-----
>  .../0001-config_os_headers-Error-Fix.patch    | 10 ++--
>  ...t-snmp-fix-compile-error-disable-des.patch | 14 +++---
>  ...add-knob-whether-nlist.h-are-checked.patch | 15 +++---
>  ...{wireshark_3.2.2.bb =3D> wireshark_3.2.4.bb} |  4 +-
>  .../recipes-connectivity/irssi/irssi_1.2.2.bb |  2 +
>  .../recipes-core/plymouth/plymouth_0.9.4.bb   |  2 +-
>  .../{logwatch_7.5.1.bb =3D> logwatch_7.5.3.bb}  |  4 +-
>  ...gphoto2_2.5.24.bb =3D> libgphoto2_2.5.25.bb} |  4 +-
>  .../sound-theme-freedesktop_0.8.bb            |  2 +-
>  meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb  |  2 +-
>  .../passwdqc/passwdqc_1.3.1.bb                |  2 +-
>  .../dfu-util/dfu-util-native_0.9.bb           |  1 -
>  .../{gsoap_2.8.100.bb =3D> gsoap_2.8.103.bb}    |  4 +-
>  ...add-explicit-dependency-on-libraries.patch | 40 ++++++++++++++++
>  .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
>  .../nano/{nano_4.9.2.bb =3D> nano_4.9.3.bb}     |  4 +-
>  ...s-perl_1.23.bb =3D> libnet-dns-perl_1.24.bb} |  4 +-
>  meta-python/conf/layer.conf                   |  2 +-
>  .../python/python-pycryptodome.inc            | 29 -----------
>  .../python/python3-cmd2_0.9.23.bb             |  1 -
>  ...ama_0.4.1.bb =3D> python3-colorama_0.4.3.bb} |  4 +-
>  .../python/python3-docutils_0.15.2.bb         | 15 ------
>  .../python/python3-pycryptodome_3.9.4.bb      |  2 -
>  .../python/python3-pycryptodomex_3.9.4.bb     | 10 ----
>  .../python/python3-pyelftools_0.25.bb         | 14 ------
>  .../python/python3-pyyaml_5.3.1.bb            | 18 +++++++
>  .../python/python3-pyyaml_5.3.bb              | 19 --------
>  .../python/python3-smbus2_0.3.0.bb            |  2 -
>  .../python/python3-twisted_19.10.0.bb         |  4 +-
>  36 files changed, 144 insertions(+), 210 deletions(-)
>  rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.9.=
bb =3D> mosquitto_1.6.10.bb} (95%)
>  delete mode 100644 meta-networking/recipes-connectivity/snort/snort/000=
1-chdeck-for-gettid-API-during-configure.patch
>  rename meta-networking/recipes-connectivity/snort/{snort_2.9.15.bb =3D>=
 snort_2.9.16.bb} (95%)
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.2.bb =
=3D> wireshark_3.2.4.bb} (95%)
>  rename meta-oe/recipes-extended/logwatch/{logwatch_7.5.1.bb =3D> logwat=
ch_7.5.3.bb} (95%)
>  rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.24.bb =3D> libg=
photo2_2.5.25.bb} (91%)
>  rename meta-oe/recipes-support/gsoap/{gsoap_2.8.100.bb =3D> gsoap_2.8.1=
03.bb} (89%)
>  create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-a=
dd-explicit-dependency-on-libraries.patch
>  rename meta-oe/recipes-support/nano/{nano_4.9.2.bb =3D> nano_4.9.3.bb} =
(80%)
>  rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.23.bb =3D> libn=
et-dns-perl_1.24.bb} (92%)
>  delete mode 100644 meta-python/recipes-devtools/python/python-pycryptod=
ome.inc
>  rename meta-python/recipes-devtools/python/{python3-colorama_0.4.1.bb =
=3D> python3-colorama_0.4.3.bb} (61%)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-docutils=
_0.15.2.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycrypto=
dome_3.9.4.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycrypto=
domex_3.9.4.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftoo=
ls_0.25.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5=
.3.1.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5=
.3.bb
>=20
> --=20
> 2.17.1
>=20

>=20

