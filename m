Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.3568.1591901573770852912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 11:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K9V0xXiI;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id k22so5371383qtm.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v2HCbrnblu7nXZg1eY9m1/SFsPaps87GaC/TS6BewBc=;
        b=K9V0xXiI/IsltawCZlI3nq9WobkZ3i+X5q0AuHs0GOqNPFbUYchlQHHvoZsOybqNSP
         yXbAao1c8++2EunoIkYBeubpbPT4OnxJfdjXhRXCl02r5T6RvPKs1IS++3F5RTtEr/uY
         Rw1d4gsc01JkvZXxEHR04QZ0rPyUHfhkl3m5HDimZNhlnWtY4K0Fz8oGZRFZpLUB9sjT
         XAobWci//wtjANq1IXm6jysgrsrYdsfixkERswq78yiqpueRjH/wKSRryuzfT4wlMRft
         R3/mKh9vKwFaWH9q6wfGY0U+DPy+eFFGqZuVfo9/IKShXjeCMkbd5aBltRVKA2j5D4EV
         z5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v2HCbrnblu7nXZg1eY9m1/SFsPaps87GaC/TS6BewBc=;
        b=SIoG51OyCI/Oa+R0nhrG7JKIxKJmWkmPglZBDW68bfHg0Q+TmieRbBI4ku+Yyt2XSF
         oP7eE7qDAiyE/N2rp4unDTWW5rirVjjWrwQGPLK/wqJ6gDYa9wfE8PkbJU78v7XRU1pU
         Pl1lobtCFY19tonhGZvYeKLiwnXHIZysOFlBk7SxFfDdzEYriXPhIotSiLfFWyo5iGOq
         QddvwVDB8w4hwwC5+dwVjYT7Qy1uD1iigtr9SK/rFZqnoIRCN3WUhQu5YBpkCPlqYG2R
         kE1C+kcn7130OhkLXNRZWxmOUYIfZ3yTkhdF9EemBQJy0WxXlaHBwFORGSVUHCvIQA0x
         UHgQ==
X-Gm-Message-State: AOAM530XLIHok78hMEP/WuvJi6FcCm6Of+Ej7yZgBywEY06hnZwwNlX5
	iZAKgR6ZTGAmlhfePWfADah2MXRA38gUa4GOTq8=
X-Google-Smtp-Source: ABdhPJx1iu91wUOKoiakGEOoybMVdWsjs9vystk8Vsvlbho4LQhMhSNnwMNuG0AVwS+ArJ7aQliCCRCngMQQN8cSzm4=
X-Received: by 2002:ac8:44b3:: with SMTP id a19mr10047680qto.285.1591901572530;
 Thu, 11 Jun 2020 11:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591886131.git.akuster808@gmail.com>
In-Reply-To: <cover.1591886131.git.akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Jun 2020 11:52:26 -0700
Message-ID: <CAMKF1so4fDkW6eitZgDgPua2MdxAk5Q8tMLTXbySMT3+=XYzKQ@mail.gmail.com>
Subject: Re: [oe] [dunfell 00/27] Merge request #3
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2020 at 7:38 AM akuster <akuster808@gmail.com> wrote:
>
> Please merge these changes to dunfell
> Cover letter only
>
> The following changes since commit cc155826b0b4f202a8fa4ac103b7c38368d32=
734:
>
>   thunar: upgrade 1.8.14 -> 1.8.15 (2020-05-28 21:50:13 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded dunfell-next
>   http://cgit.openembedded.org/meta-openembedded/log/?h=3Ddunfell-next
>
> Adrian Bunk (1):
>   python3-docutils: Remove, moved to OE-core
>
> Andreas M=C3=BCller (1):
>   fluidsynth: upgrade 2.1.2 -> 2.1.3
>
> Denys Dmytriyenko (2):
>   python3-pycryptodome(x): moved to OE-Core, remove from meta-python
>   python3-pyelftools: moved to OE-Core, remove from meta-python
>
> Domarys Correa (1):
>   python3-pyyaml: Update 5.3 -> 5.3.1
>
> Hongxu Jia (1):
>   multipath-tools: fix compiling parallel issue
>
> Kai Kang (1):
>   plymouth: disable systemd-integration for sysvinit
>
> Khem Raj (1):
>   dfu-util-native: Remove DEPLOY_DIR_TOOLS from sstate-outputdirs

this is not needed. Since relevant change in core is going to reverted
I plan to revert it in master of meta-oe too.

>
> Konrad Weihmann (6):
>   passwdqc: remove double modify operation
>   sound-theme-freedesktop: remove double depends
>   python3-cmd2: remove double colorama in RDEPENDS
>   python3-smbus2: remove duplicate RDEPENDS settings
>   python3-twisted: remove double var modification
>   proftpd: Fix typo for SRC_URI[md5sum]
>
> Leon Anavi (1):
>   python3-colorama: Upgrade 0.4.1 -> 0.4.3
>
> Maciej Pijanowski (1):
>   qpdf: fix typo in RDEPENDS
>
> Martin Jansa (2):
>   irssi: package libirc_proxy.a in PN-staticdev
>   meta-python: depend on core version 12 or higher
>
> Patrick Williams (1):
>   net-snmp: refresh patches
>
> Zang Ruochen (4):
>   libgphoto2: upgrade 2.5.24 -> 2.5.25
>   mosquitto: upgrade 1.6.9 -> 1.6.10
>   snort: upgrade 2.9.15 -> 2.9.16
>   wireshark: upgrade 3.2.2 -> 3.2.4
>
> Zheng Ruoqin (4):
>   nano: upgrade 4.9.2 -> 4.9.3
>   gsoap: upgrade 2.8.100 -> 2.8.103
>   logwatch: upgrade 7.5.1 -> 7.5.3
>   libnet-dns-perl: upgrade 1.23 -> 1.24
>
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
>
> --
> 2.17.1
>
>=20
