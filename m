Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.21475.1593878144585322519
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2020 08:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l4s1zYzt;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id 80so31309074qko.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2020 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JboVMSpdzo6hnHP/WxjGaKWkM0BDLx+Txp2nCzPpul4=;
        b=l4s1zYztDXjpGLTnjIr29Um4FfsebBCSb8/hKafs3n3MxXsLLiym+UDd2ZpByj7fvO
         +2jUU2nQcSH/6k72lFTst3HmLxNadZlljBIk8IEdbi9hybjGoN0AsnOKDcaRD0eXbMH4
         /Ll+O9QyO/JJcm/Etx4jVJwGMJ2KWQxw462pIoMEIYvGWO0uqtMr8x0NK085aompfY0L
         uKqgMkFMtaVaLaRpsuv5k80T+qu8jfBYgpyI/rn7Im74XY+REIT2aioDbF+mt2AMkP4L
         +M7TRc7VYLpEVZ7n3EpRBafS9gAKZRq9dRwPXwd0QpBDBb3YsAesxlUGUnLGh1lhxcnG
         pzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JboVMSpdzo6hnHP/WxjGaKWkM0BDLx+Txp2nCzPpul4=;
        b=K6xN2eVGfwGcibKc2R0lV48OMIz4yQlUMFHODvQgE9HMjsDSkIrXbZIyOCsPJRPi/J
         TlCcHuw5Il7oPLohsU/hYJ/6K55VnkaQWSJ7bn0VSh8Q9IBxTGvZcnUShIRXX7zWvNBb
         YNuiY/h5XESoPueUrEt0ltJhQzanVGOwskMkyf/m/nVvcuT0/YHwS03Z1Z9aCm0kroXw
         7WoF9pnqD5nPKAfzVqFEAQmCxJMr35/H+vM6pkB6mY38vSHygPWYurjtPC2yCRO9V5nV
         yVud6YNuI9b3l0fFK/EWaQnn176FGzMeyHvA2WSksDgiYC57osrx7wbN1z5Lqm0oVFR8
         FwTA==
X-Gm-Message-State: AOAM533fE+YMxTO1x9M49deQj1S1ZwhmymvewRPAxki7Oxt2UMZGiZAy
	cu87+jQcBrfAJH3rxJebzyOGx4/JKmCaDhN02uY=
X-Google-Smtp-Source: ABdhPJw5CdI1MZkZNQBc4yeXFqub+2bIS42vjth7Pg773P/gUITJTQ99mKDykPHJtf4K/EI0AL4xoiVnyTKIYuIO2pE=
X-Received: by 2002:a05:620a:148d:: with SMTP id w13mr30531454qkj.215.1593878143516;
 Sat, 04 Jul 2020 08:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593799085.git.akuster808@gmail.com>
In-Reply-To: <cover.1593799085.git.akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 4 Jul 2020 08:55:14 -0700
Message-ID: <CAMKF1spNXdw-KxAbW8yvp1Qw8enYbDhM6fhAXk3L6zKCMZXA3g@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/30] Merge request July 3
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2020 at 10:59 AM akuster <akuster808@gmail.com> wrote:
>
> Please merge to dunfell.
> Cover letter only
>
> The following changes since commit 8a72d29e0876830ffd96b85d7d0308302eb07=
a5d:
>
>   python3-docutils: Remove, moved to OE-core (2020-06-12 09:32:24 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded dunfell-next
>   http://cgit.openembedded.org/meta-openembedded/log/?h=3Ddunfell-next
>


merged thanks

> Alex Kiernan (1):
>   zstd: Upgrade 1.4.4 -> 1.4.5
>
> Andreas M=C3=BCller (3):
>   libblockdev: upgrade 2.23 -> 2.24
>   openh264: upgrade 2.1.0 -> 2.1.1
>   tcpreplay: upgrade 4.3.2 -> 4.3.3
>
> Armin Kuster (1):
>   ntp: update 4.2.8p15
>
> Changqing Li (2):
>   python-django: add RDEPENDS
>   python-m2crypto: Add RDEPENDS
>
> Christian Eggers (1):
>   linuxptp: Fix segmentation fault on 32 bit platforms with 64 bit
>     time_t
>
> Konrad Weihmann (3):
>   netkit-rsh: properly append PACKAGECONFIG
>   zile: properly append PACKAGECONFIG
>   libtalloc: fix upstream url
>
> Leon Anavi (1):
>   python3-sqlalchemy: Upgrade 1.3.12 -> 1.3.17
>
> Mingli Yu (1):
>   python3-m2crypto: add the missing rdepends
>
> Paul Eggleton (1):
>   protobuf-c: disable parallelism to avoid race condition
>
> Pierre-Jean Texier (9):
>   zchunk: upgrade 1.1.5 -> 1.1.6
>   uriparser: upgrade 0.9.3 -> 0.9.4
>   jsoncpp: upgrade 1.9.2 -> 1.9.3
>   jpnevulator: upgrade 2.3.4 -> 2.3.5
>   libnftnl: upgrade 1.1.6 -> 1.1.7
>   nftables: upgrade 0.9.4 -> 0.9.5
>   haveged: upgrade 1.9.8 -> 1.9.9
>   rsnapshot: upgrade 1.4.2 -> 1.4.3
>   fuse3: upgrade 3.9.1 -> 3.9.2
>
> Qi.Chen@windriver.com (1):
>   python-django: set CVE_PRODUCT to be django
>
> Wang Mingyu (3):
>   postgresql: 12.2 -> 12.3
>   openipmi: upgrade 2.0.28 -> 2.0.29
>   twm: upgrade 1.0.10 -> 1.0.11
>
> Zang Ruochen (3):
>   proj: upgrade 7.0.0 -> 7.0.1
>   libvpx: upgrade 1.8.1 -> 1.8.2
>   mm-common: upgrade 1.0..0 -> 1.0.1
>
>  .../fuse/{fuse3_3.9.1.bb =3D> fuse3_3.9.2.bb}   |   3 +-
>  .../{openh264_2.1.0.bb =3D> openh264_2.1.1.bb}  |   4 +-
>  .../{libnftnl_1.1.6.bb =3D> libnftnl_1.1.7.bb}  |   2 +-
>  .../{nftables_0.9.4.bb =3D> nftables_0.9.5.bb}  |   3 +-
>  .../netkit-rsh/netkit-rsh_0.17.bb             |   2 +-
>  .../libtalloc/libtalloc_2.3.0.bb              |   2 +-
>  .../ntp/{ntp_4.2.8p14.bb =3D> ntp_4.2.8p15.bb}  |   3 +-
>  ...{openipmi_2.0.28.bb =3D> openipmi_2.0.29.bb} |   4 +-
>  ...{tcpreplay_4.3.2.bb =3D> tcpreplay_4.3.3.bb} |   4 +-
>  .../linuxptp/time_t_maybe_long_long.patch     | 135 ++++++++++++++++++
>  .../linuxptp/linuxptp_2.0.bb                  |   1 +
>  ...{mm-common_1.0.0.bb =3D> mm-common_1.0.1.bb} |   4 +-
>  ...Use-pkg-config-for-libxml2-detection.patch |  50 -------
>  meta-oe/recipes-dbs/postgresql/postgresql.inc |   1 -
>  ...{postgresql_12.2.bb =3D> postgresql_12.3.bb} |   4 +-
>  .../{jsoncpp_1.9.2.bb =3D> jsoncpp_1.9.3.bb}    |   2 +-
>  .../protobuf/protobuf-c_1.3.3.bb              |   5 +
>  .../{haveged_1.9.8.bb =3D> haveged_1.9.9.bb}    |   4 +-
>  .../jpnevulator/jpnevulator_git.bb            |   4 +-
>  ...ibblockdev_2.23.bb =3D> libblockdev_2.24.bb} |   7 +-
>  .../0001-Fix-legacy-build-after-2103.patch    |  27 ++++
>  .../zstd/{zstd_1.4.4.bb =3D> zstd_1.4.5.bb}     |   6 +-
>  .../xorg-app/{twm_1.0.10.bb =3D> twm_1.0.11.bb} |   5 +-
>  .../webm/{libvpx_1.8.1.bb =3D> libvpx_1.8.2.bb} |   2 +-
>  .../proj/{proj_7.0.0.bb =3D> proj_7.0.1.bb}     |   4 +-
>  .../rsnapshot/rsnapshot_git.bb                |   4 +-
>  ...{uriparser_0.9.3.bb =3D> uriparser_0.9.4.bb} |   5 +-
>  .../zchunk/0001-zck.h-fix-build-on-musl.patch |  39 -----
>  .../0002-unzck-fix-build-with-musl-libc.patch |  61 --------
>  .../{zchunk_1.1.5.bb =3D> zchunk_1.1.6.bb}      |   8 +-
>  meta-oe/recipes-support/zile/zile_2.4.14.bb   |   2 +-
>  .../recipes-devtools/python/python-django.inc |   3 +
>  .../python/python-m2crypto.inc                |  12 +-
>  ...1.3.12.bb =3D> python3-sqlalchemy_1.3.17.bb} |   6 +-
>  34 files changed, 226 insertions(+), 202 deletions(-)
>  rename meta-filesystems/recipes-support/fuse/{fuse3_3.9.1.bb =3D> fuse3=
_3.9.2.bb} (91%)
>  rename meta-multimedia/recipes-multimedia/openh264/{openh264_2.1.0.bb =
=3D> openh264_2.1.1.bb} (94%)
>  rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.6.bb =3D> =
libnftnl_1.1.7.bb} (88%)
>  rename meta-networking/recipes-filter/nftables/{nftables_0.9.4.bb =3D> =
nftables_0.9.5.bb} (90%)
>  rename meta-networking/recipes-support/ntp/{ntp_4.2.8p14.bb =3D> ntp_4.=
2.8p15.bb} (98%)
>  rename meta-networking/recipes-support/openipmi/{openipmi_2.0.28.bb =3D=
> openipmi_2.0.29.bb} (96%)
>  rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.3.2.bb =
=3D> tcpreplay_4.3.3.bb} (75%)
>  create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/time_=
t_maybe_long_long.patch
>  rename meta-oe/recipes-core/mm-common/{mm-common_1.0.0.bb =3D> mm-commo=
n_1.0.1.bb} (66%)
>  delete mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-co=
nfig-for-libxml2-detection.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_12.2.bb =3D> postgres=
ql_12.3.bb} (63%)
>  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb =3D> jsoncpp_=
1.9.3.bb} (93%)
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.8.bb =3D> haveged_=
1.9.9.bb} (96%)
>  rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.23.bb =3D> l=
ibblockdev_2.24.bb} (94%)
>  create mode 100644 meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-b=
uild-after-2103.patch
>  rename meta-oe/recipes-extended/zstd/{zstd_1.4.4.bb =3D> zstd_1.4.5.bb}=
 (85%)
>  rename meta-oe/recipes-graphics/xorg-app/{twm_1.0.10.bb =3D> twm_1.0.11=
.bb} (67%)
>  rename meta-oe/recipes-multimedia/webm/{libvpx_1.8.1.bb =3D> libvpx_1.8=
.2.bb} (96%)
>  rename meta-oe/recipes-navigation/proj/{proj_7.0.0.bb =3D> proj_7.0.1.b=
b} (75%)
>  rename meta-oe/recipes-support/uriparser/{uriparser_0.9.3.bb =3D> uripa=
rser_0.9.4.bb} (64%)
>  delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix=
-build-on-musl.patch
>  delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix=
-build-with-musl-libc.patch
>  rename meta-oe/recipes-support/zchunk/{zchunk_1.1.5.bb =3D> zchunk_1.1.=
6.bb} (66%)
>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.12.b=
b =3D> python3-sqlalchemy_1.3.17.bb} (67%)
>
> --
> 2.17.1
>
>=20
