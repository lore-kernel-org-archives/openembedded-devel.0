Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.5264.1599331424218115492
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 11:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MEBW5aH9;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id t20so7243069qtr.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 11:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H/WW9k7d5zFzlNPb2T628Fse5mFJWR3jN7bnZlVCaak=;
        b=MEBW5aH9BlpX4wRKiz8rNqbxCIi4ZN+cEvyuFZ4sg/E3jy43ak08eRUia/S6YHPfIi
         zChpwI4VfM3VGxK0x0MvslMHdBTKg0mmstwqC46ti7He9Q5n+pDkNoIvo5+tulxDpT5H
         Meb6pvGjiUyJ7HZSwN8cySra9iLmR9rTr0LocCOGvMO6HTB2kgP7NF6bk/AKGVC8/esp
         g0ZQqO3oZnqMZo6S0yh2uWaZR0oFw0CiCcm4YFmqrIGUgdoiLF1SKI4+Dmcn89j/gKfz
         +U519pjN+mUCrmRRTHxrEHcsbmoGjsFss/46SnlFEUO9FpScnTzmC1mvHSNXm7Dak1CH
         oxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H/WW9k7d5zFzlNPb2T628Fse5mFJWR3jN7bnZlVCaak=;
        b=ohgdY0aYqRmtPK/Ls+/9N4NqYTaS+nxk6AjO8No3mia6aXNSnhlvum63Qp+pgNOQNM
         p5rWi9QVGw3HB6XD2JZYxGHmNJBwuXDxt9kZG/31jQ/4XRNscXFHxF3zRlhOHlcp6Ekq
         DmomIJnaQ/YQbbSpZ7yZO0arcamykX8puioGADX8J/X+QpSv1q4WBWvm8JqfanEgI5Dc
         5uLCT6AzLs7I9Gos9Gnyh9SURQoALxl73IwNCdrsbTc9Ar6MfIHnX/oc0QnoOWkGLFP+
         Ca4m4gLe4/LuWHph3WkTo3WrnB1O22w0fLpA5RoZRwbwp/O9uLHBGtiYtxRiPikhk5Y+
         oa0w==
X-Gm-Message-State: AOAM5332fYLRAfVYyUdnmAXWiS4ERviFh0vaiJg1pS0ghiq6+Q6RfVCf
	Hux66LuivJNTFxPwfFVbdnMFaFUDJokXVLPg0ug=
X-Google-Smtp-Source: ABdhPJx/jvn73oP0BBCeWF7lSk0z/Q16jNZTcEKzsvPSUeR8+P1WD8D1buvgsQ0WHzZk2jBvVGyuShZirDWpCjjF1Ms=
X-Received: by 2002:ac8:4a92:: with SMTP id l18mr14937955qtq.378.1599331423247;
 Sat, 05 Sep 2020 11:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599324864.git.akuster808@gmail.com>
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 5 Sep 2020 11:43:17 -0700
Message-ID: <CAMKF1sr=+T=wXOi-0QdooY4r+q81sQc9tD3X-Z1+=XbB5+gHrA@mail.gmail.com>
Subject: Re: [oe] [dunfell 00/20] Patch review Sept 5
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2020 at 9:56 AM akuster <akuster808@gmail.com> wrote:
>
> Here is the next set of dunfell changes.
> Please review and have feedback by Monday.
>
>

looks good to me


> The following changes since commit 654ad8bea49f142d20b2b96c0dd44810a6be2=
33a:
>
>   jsoncpp: add PE do to revert to older PV (2020-07-18 07:24:39 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nu=
t
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable=
/dunfell-nut
>
> Adrian Bunk (1):
>   gnome-settings-daemon: Remove duplicate outdated SRC_URI hashes
>
> Alistair Francis (1):
>   python3-obd: Add missing setuptools RDEPENDS
>
> Andreas M=C3=BCller (1):
>   exiv2: upgrade 0.27.1 -> 0.27.3
>
> Armin Kuster (3):
>   vlc: fix loop initial declarations are only allowed in C99 mode
>   babl-native: fix build issue
>   gnome-settings-daemon: Backport 3.36 fix for building without wayland
>
> Changqing Li (1):
>   radvd: add /etc/radvd.conf
>
> Julius Hemanth Pitti (1):
>   netkit-telnetd: Fix buffer overflow in netoprintf
>
> Kai Kang (2):
>   lvm2: remove service template from SYSTEMD_SERVICE
>   rdist: fix parallel build
>
> Khem Raj (2):
>   samba: Fix conflicts with nss.h from glibc
>   flashrom: Fix build failure with glibc 2.32
>
> Leon Anavi (1):
>   python3-pandas: Upgrade 1.0.3 -> 1.0.5
>
> Martin Jansa (1):
>   lcov: fix lcov-native build
>
> Mingli Yu (2):
>   freeradius: fix the existed certificate error
>   freeradius: fix the occasional verification failure
>
> Ovidiu Panait (1):
>   net-snmp: Fix CVE-2020-15861 and CVE-2020-15862
>
> Ryan Rowe (1):
>   python3-pint: add setuptools and packaging to RDEPENDS
>
> Yi Zhao (1):
>   samba: upgrade 4.10.15 -> 4.10.17
>
> Yue Tao (1):
>   lua: Security Advisory - lua - CVE-2020-15888
>
>  meta-gnome/recipes-gimp/babl/babl_0.1.74.bb   |   2 +
>  ...gins-wacom-Fix-build-without-WAYLAND.patch |  27 ++
>  .../gnome-settings-daemon_3.34.2.bb           |   5 +-
>  .../recipes-multimedia/vlc/vlc_3.0.9.2.bb     |   2 +-
>  ...file-fix-the-existed-certificate-err.patch |  55 +++
>  ...file-fix-the-occasional-verification.patch | 135 +++++++
>  .../freeradius/freeradius_3.0.20.bb           |   2 +
>  .../rdist-6.1.5-fix-parallel-build.patch      |  31 ++
>  .../recipes-connectivity/rdist/rdist_6.1.5.bb |   1 +
>  ....c-Avoid-nss-function-conflicts-with.patch |  96 +++++
>  .../0001-util-Simplify-input-validation.patch |  59 +++
>  ...n-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch |  79 ++++
>  ...larger-buffer-if-getpwuid_r-returns-.patch |  50 +++
>  .../{samba_4.10.15.bb =3D> samba_4.10.17.bb}    |   8 +-
>  .../recipes-daemons/radvd/files/radvd.conf    |  18 +
>  .../recipes-daemons/radvd/radvd.inc           |   5 +-
>  ....c-Fix-buffer-overflow-in-netoprintf.patch |  56 +++
>  .../netkit-telnet/netkit-telnet_0.17.bb       |   1 +
>  .../net-snmp/CVE-2020-15861-0001.patch        | 164 ++++++++
>  .../net-snmp/CVE-2020-15861-0002.patch        |  44 +++
>  .../net-snmp/CVE-2020-15861-0003.patch        |  40 ++
>  .../net-snmp/CVE-2020-15861-0004.patch        |  33 ++
>  .../net-snmp/CVE-2020-15861-0005.patch        | 349 ++++++++++++++++++
>  .../net-snmp/net-snmp/CVE-2020-15862.patch    |  87 +++++
>  .../net-snmp/net-snmp_5.8.bb                  |   6 +
>  ...or-last-line-only-from-preprocessed-.patch |  57 +++
>  meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  |   1 +
>  .../lua/lua/CVE-2020-15888.patch              |  45 +++
>  meta-oe/recipes-devtools/lua/lua_5.3.5.bb     |   1 +
>  ...-protection-only-if-compiler-arch-su.patch |  40 ++
>  .../{exiv2_0.27.1.bb =3D> exiv2_0.27.3.bb}      |   7 +-
>  meta-oe/recipes-support/lcov/lcov_1.14.bb     |   7 +-
>  meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb  |   8 +-
>  .../recipes-devtools/python/python-pint.inc   |   5 +
>  .../python/python3-obd_0.7.1.bb               |   2 +-
>  ...andas_1.0.3.bb =3D> python3-pandas_1.0.5.bb} |   4 +-
>  36 files changed, 1516 insertions(+), 16 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/files=
/0001-plugins-wacom-Fix-build-without-WAYLAND.patch
>  create mode 100644 meta-networking/recipes-connectivity/freeradius/file=
s/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
>  create mode 100644 meta-networking/recipes-connectivity/freeradius/file=
s/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch
>  create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1=
.5/rdist-6.1.5-fix-parallel-build.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
1-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
1-util-Simplify-input-validation.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
2-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
3-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
>  rename meta-networking/recipes-connectivity/samba/{samba_4.10.15.bb =3D=
> samba_4.10.17.bb} (96%)
>  create mode 100644 meta-networking/recipes-daemons/radvd/files/radvd.co=
nf
>  create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0=
001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/=
CVE-2020-15861-0001.patch
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/=
CVE-2020-15861-0002.patch
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/=
CVE-2020-15861-0003.patch
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/=
CVE-2020-15861-0004.patch
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/=
CVE-2020-15861-0005.patch
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/=
CVE-2020-15862.patch
>  create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-=
Check-for-last-line-only-from-preprocessed-.patch
>  create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patc=
h
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Use-compile=
r-fcf-protection-only-if-compiler-arch-su.patch
>  rename meta-oe/recipes-support/exiv2/{exiv2_0.27.1.bb =3D> exiv2_0.27.3=
.bb} (52%)
>  rename meta-python/recipes-devtools/python/{python3-pandas_1.0.3.bb =3D=
> python3-pandas_1.0.5.bb} (81%)
>
> --
> 2.17.1
>
>=20
