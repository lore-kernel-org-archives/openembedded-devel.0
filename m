Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5785BC7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 04:29:00 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.280.1685939332350754828
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jun 2023 21:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UYCfJY4u;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-558a7faa989so807667eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jun 2023 21:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685939331; x=1688531331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxldCSUO/WY3TVytNX+7Lou3XuBqgh09ygeSsA3Guio=;
        b=UYCfJY4uf1fcr2AbbobM3OGbe+Y9TkZJWZQi6V+G+MD7SpBsH7gQJk/Z7D01r9eH4W
         Q1dVsLw3MevKpYy/EUOl3zfYYfXlbYWyKSenfrIm1cM64evza/fkGe51zbZt5lKl3nU4
         dSSoL6aAVQFmvRI47T5NecsGkLQXs3fE1LiNTTn7NYvPHC1DlilOtZ4YqQbV4YT+pavh
         NKFPcm/TWlui4VrAW7l/gLmqvi7UAhKMct2sFBVM3e2HLxDAuKQ3mmv4bO7Pnf/2umzQ
         gvL0ULTrdVzNX+YLkSuNEemBbOcOvG/lDspposYFP087XzThn8BTJsjG/RhH63GSQTVC
         Ov9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685939331; x=1688531331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxldCSUO/WY3TVytNX+7Lou3XuBqgh09ygeSsA3Guio=;
        b=gomij5TYiJL5UcYj+1UrHMQgHBFK7+BnGfKaJ4F3Jvqxq5Sz2TZXLXr9SgjO5bt7iB
         M6iP7H0ZlrKwdSN4B1FnFNWEf1QKfuZF7IuF2G12ckspVXjqGcryWBqvBbxvZkeT9CYJ
         JtQOvKPlcjUI3thF31oMXwF42fMmHHKvlV88lq0b39ZoXlGsyj+05u4UJGSSZV5UkQrf
         zzRfgLkaK0CATcIOaWpHrLUL0lfX/LF4AzTFmSvOiAn3yf8y0DjCG6sDeVzm/iHHR3xy
         6//Kvx8XFXhjyqOkWunw/2tPOteCv0K4J92/KY15tCJK/jQKbxEg5C+EtRqTip060zM1
         yT4w==
X-Gm-Message-State: AC+VfDy7DLUoOhi5HarIJZ/GDsLOopqatIP9XHwz8qGMesdQlneV+NKb
	DoXfV0QXGvOxLp9UiW0xcgqv0Jy9R//XvKjrAgc=
X-Google-Smtp-Source: ACHHUZ4BpQkNVyTPEdKDDffJjo1GB8hhxiMWW8pFKyzJpWK/48/KzHC6e1apA/ctKkXqMSSMUTKQo8FTJ+DAWnIkWTg=
X-Received: by 2002:a4a:d098:0:b0:558:a0fb:30ee with SMTP id
 i24-20020a4ad098000000b00558a0fb30eemr2282976oor.2.1685939331367; Sun, 04 Jun
 2023 21:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <a549e0da-b974-9e18-2d4f-45e5d6af53a8@gmail.com>
In-Reply-To: <a549e0da-b974-9e18-2d4f-45e5d6af53a8@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Jun 2023 21:28:25 -0700
Message-ID: <CAMKF1sobKSwxRYEoj3mpCQEWOe2N3JiFR-FBHwM0G=95KzvpAg@mail.gmail.com>
Subject: Re: mickledore merge request: June 3rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 04:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103106

merged.
thanks Armin

On Sat, Jun 3, 2023 at 4:52=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit c032fd0b1a9d444711103c2703dfa8e2964a38=
65:
>
>    redis: upgrade 6.2.11 -> 6.2.12 (2023-05-16 07:32:31 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to 928658212611ea457a5eacec48f0760e03269a24:
>
>    gnulib: Update recipe name to 2018-12-18 (2023-05-31 10:50:50 -0400)
>
> ----------------------------------------------------------------
> Alexander Amelkin (1):
>        ipmitool: Update links
>
> Chen Qi (1):
>        frr: add CVE_PRODUCT
>
> Joe Slater (1):
>        bats: use baselib
>
> Khem Raj (28):
>        libencode-perl: Remove buildpaths from generated .exh files
>        enca: Remove buildpaths from target scripts
>        libirecovery: Add missing build dependency on readline
>        fftw: Remove hardcoded sysroot into binaries
>        lmdb: Pass CFLAGS to Makefile
>        php: Remove buildpaths from scripts and generated headers
>        uw-imap: Pass CFLAGS from environment
>        libmad: Add a patch to pass cflags to build
>        libpeas: Fix reference to TMPDIR in tests
>        lirc: Define SH_PATH=3D/bin/sh
>        mce-inject: Pass CFLAGS to make
>        nbdkit: Remove buildpaths from binaries
>        mpv: Remove references to builddir from mpv binary
>        libnice: Remove buildpaths from binaries
>        curlpp: Remove references to buildpaths e.g. TMPDIR
>        unbound: Remove references to buildpaths
>        uml-utilities: Fix references to TMPDIR
>        openct: Fix buildpaths being emitted into generated types.h
>        minifi-cpp: Remove references to buildpaths in generated files
>        freerdp: Fix reference to TMPDIR in libfreerdp2.so
>        nautilus: Fix buildpath QA errors
>        cgdb: Fix buildpaths emitted into cgdb binary
>        ibus: Point python interpreter to target location
>        gimp: Fix buildpaths in binaries and scripts
>        libgphoto2: Edit out sysroot from CC variable in configure
>        vlan: Pass CFLAGS via CCFLAGS
>        sgpio: Pass CFLAGS to make
>        x265: Pass --debug-prefix-map to nasm
>
> Ming Liu (2):
>        libusbgx: drop hard-coded /usr/bin,/etc
>        libusbgx: check scripts in /etc/usbgx.d
>
> Mingli Yu (2):
>        php: Link with libatomic on rv64
>        minicoredumper: correct the sysvinit service file attribute
>
> Wang Mingyu (3):
>        postgresql: upgrade 15.2 -> 15.3
>        php: upgrade 8.2.5 -> 8.2.6
>        nautilus: upgrade 44.0 -> 44.1
>
> schitrod=3Dcisco.com@lists.openembedded.org (1):
>        gnulib: Update recipe name to 2018-12-18
>
>   ...1-configure-Keep-first-line-of-compiler-version-string.patch | 30
> +++++++
>   ...1-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch | 34
> ++++++++
>   meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb                    | 4 +-
>   .../nautilus/nautilus/0001-Replace-filename-with-basename.patch | 46
> +++++++++++
>   .../nautilus/0001-initialize-GdkDragAction-action-to-0.patch    | 47
> -----------
>   .../nautilus/{nautilus_44.0.bb =3D> nautilus_44.1.bb} |   4 +-
>   meta-gnome/recipes-support/ibus/ibus.bb                         | 2 +-
>   meta-gnome/recipes-support/ibus/ibus.inc                        | 3 +
>   meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb           | 4 +
>   meta-networking/recipes-connectivity/vlan/vlan_1.9.bb           | 2 +-
>   meta-networking/recipes-protocols/frr/frr_8.4.2.bb              | 2 +
>   ...1-curlpp-config.in-Remove-references-to-absolute-build.patch | 40
> +++++++++
>   meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb          | 3 +-
>   .../0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch    | 38
> +++++++++
>   .../nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch   | 39
> ---------
>   meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb        | 2 +-
>   meta-networking/recipes-support/unbound/unbound_1.17.1.bb       | 4 +
>   .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb        | 2 +-
>   meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb   | 2 +-
>   meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb                         | 4 +-
>   .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 10 +-=
-
>   .../postgresql/{postgresql_15.2.bb =3D> postgresql_15.3.bb} |   2 +-
>   .../0001-cgdb-Do-not-search-for-cgdb.txt-in-build-dir.patch     | 34
> ++++++++
>   meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb                     | 3 +-
>   meta-oe/recipes-devtools/php/{php_8.2.5.bb =3D> php_8.2.6.bb} |  10 ++-
>   meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb               | 2 +-
>   meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb         | 6 ++
>   meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb                | 1 +
>   .../0001-cow.c-Replace-stat64-with-stat.patch                   | 34
> ++++++++
>   .../0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch  | 122
> ++++++++++++++++++++++++++++
>   .../recipes-extended/uml-utilities/uml-utilities_20040406.bb    | 2 +
>   ...01-Remove-builddir-and-srcdir-paths-from-test-binaries.patch | 82
> +++++++++++++++++++
>   meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb                 | 1 +
>   .../0001-configure-Filter-out-buildpaths-from-CC.patch          | 48
> +++++++++++
>   meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.30.bb           | 7 +-
>   meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb              | 6 +-
>   meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb   | 2 +-
>   .../0001-configure-Respect-the-cflags-from-environment.patch    | 47
> +++++++++++
>   meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb             | 1 +
>   meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb                | 4 +
>   .../enca/enca/0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch  | 30
> +++++++
>   meta-oe/recipes-support/enca/enca_1.19.bb                       | 4 +-
>   .../0001-agent-meson-Replace-filename-with-basename.patch       | 40
> +++++++++
>   meta-oe/recipes-support/farsight/libnice_0.1.21.bb              | 3 +-
>   meta-oe/recipes-support/fftw/fftw_3.3.10.bb                     | 1 +
>   meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb               | 4 +
>   .../gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb} |   0
>   meta-oe/recipes-support/libusbgx/libusbgx/gadget-start          | 4 +
>   meta-oe/recipes-support/libusbgx/libusbgx_git.bb                | 4 +-
>   meta-oe/recipes-support/mcelog/mce-inject_git.bb                | 2 +-
>   .../0001-m4-Just-emit-the-first-line-of-compiler-version.patch  | 31
> +++++++
>   meta-oe/recipes-support/openct/openct_0.6.20.bb                 | 1 +
>   meta-oe/recipes-test/bats/bats_1.9.0.bb                         | 8 +-
>   meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb         | 6 +-
>   54 files changed, 748 insertions(+), 126 deletions(-)
>   create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compi=
ler-version-string.patch
>   create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-libr=
ary-paths-to-LD_LI.patch
>   create mode 100644
> meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-bas=
ename.patch
>   delete mode 100644
> meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-=
action-to-0.patch
>   rename meta-gnome/recipes-gnome/nautilus/{nautilus_44.0.bb =3D>
> nautilus_44.1.bb} (88%)
>   create mode 100644
> meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remov=
e-references-to-absolute-build.patch
>   create mode 100644
> meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute=
-buildpaths-in-binaries.patch
>   delete mode 100644
> meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-=
printf-is-a-macro.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_15.2.bb =3D>
> postgresql_15.3.bb} (84%)
>   create mode 100644
> meta-oe/recipes-devtools/cgdb/cgdb/0001-cgdb-Do-not-search-for-cgdb.txt-i=
n-build-dir.patch
>   rename meta-oe/recipes-devtools/php/{php_8.2.5.bb =3D> php_8.2.6.bb} (9=
6%)
>   create mode 100644
> meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-=
Replace-stat64-with-stat.patch
>   create mode 100644
> meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefi=
les-Append-to-CFLAGS-instead-of-re-assign.patch
>   create mode 100644
> meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-pat=
hs-from-test-binaries.patch
>   create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure-Filter-out-bui=
ldpaths-from-CC.patch
>   create mode 100644
> meta-oe/recipes-multimedia/libmad/libmad/0001-configure-Respect-the-cflag=
s-from-environment.patch
>   create mode 100644
> meta-oe/recipes-support/enca/enca/0001-Do-not-use-MKTEMP_PROG-in-cross-bu=
ild.patch
>   create mode 100644
> meta-oe/recipes-support/farsight/libnice/0001-agent-meson-Replace-filenam=
e-with-basename.patch
>   rename meta-oe/recipes-support/gnulib/{gnulib_2018-03-07.03.bb =3D>
> gnulib_2018-12-18.bb} (100%)
>   create mode 100644
> meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of=
-compiler-version.patch
>

