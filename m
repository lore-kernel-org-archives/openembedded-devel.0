Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06E9D3C933
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:23:13 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1458.1765387385576187252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gw0db2Et;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-640e065991dso31136d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765387385; x=1765992185; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pN+Nvb2JHRzHj38CXYGg1ciZDZVN7WHM6noQXQ8703w=;
        b=Gw0db2EtXKqJ8Y3bmG2DtZz/hcumodqTyRYvPMfvzdjU0ZaVEsGUMTiGJoVNo6jbz2
         7ENTLTipnRDtiZaU862wsf001jjDK3OOIcCGszM9TV+QYI2C2uLMH6TuNJjTt+zuUNhy
         NYAGVKcR8xZ3E8FHwRSE/kvWjEPUauUL9FMwnKYcy54ws414t1NNjU9x4RrRMQOTjCZv
         5lnZbYibJlxdSGhaKVQRx0RoQq+FWtxPEGk/wVY61vkTUC04OqBKWBjBE+FxIuIOHZTC
         72PED1BPEnuA39PMOrbraRHo3IucyYAabonOWM9/RxjM0gA4OZcNNdaVDr9VDmdQS1LB
         HVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765387385; x=1765992185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pN+Nvb2JHRzHj38CXYGg1ciZDZVN7WHM6noQXQ8703w=;
        b=pyR6PY//06/McysEH5o9+U0YjwvLb53njYipeE2cQB7608KZWj0YyrWzXRah5I7UBj
         BR91SfguwE1S+v9TclIO4xufn+PITrLIaRp9sDC/gsEYA8nyAMxTr3ta0j2iDA826C+I
         OKBgPZjs56CZZ/ULhsPFza90u01xR/gu7F+eeHAcoDCe7D2HauLkHQb2OewznixPAoaN
         tS4Gp0GGDW5Ms50JrdSIjVOFCMtk0K9BjCT2Otz9rA2Q5R7Ib7A2LZvDGIUUFWcSRx2d
         elnX5aMu6gvnNR4S+UrBnel+OdToHRiJyocQf/J5csqVcpq5g+4L4XGVbFnC14sxmx0P
         wJrA==
X-Gm-Message-State: AOJu0Yx7ttuqagh/sj4AicHi9WRdyB3KvMYytYybk/8uuAsOwQEakvpM
	9NWqlP9ITmmwJPbbmmnuJ6c62Ced7RmutjwAjJptghVsw/dItH+Lax5nFPixPdsAxJ8gH2meCfd
	PD0KDJO950j5CrKzRDffodEzBySZeKtU=
X-Gm-Gg: AY/fxX5+3shkChirqAVLZ5HBeOYZeQqaJEipLze/c6kOuDteK3jjDwRW3EmQ6AAWLZl
	ixcXjwzhtm6HNlPrnHR0H2ZfHP1W5q63aSrONr/EeuFIW50zzetu8kot5bVFLPw5Qr8Sh7b6mb4
	fHM5Um1EH0KfESM/zN3cO8bHPu+gw9DFkgkTBG3ipC1HuKZ656wwrYJVJcaECq/QlSXHccn02La
	8CnlnTQyLmlIENxwecx9bVdV9aE6pAODhbq1hh8vbH1P7VtVC1zoA3AE0Y8fmDEPPeiQqrGs5nQ
	GVlDDUi2GY8sj4sd1W/gun7lFmwUBVsCQbihDNU2NUH88EWnP1yAVKHfHoBUjdNvI9rNMz6v8IX
	HNkGy5K5BGPXlmJ81d585/rr1RLjLPm/T8LRlFIT2dV32mQ==
X-Google-Smtp-Source: AGHT+IEqsO14FLfK7C0bpclgWCMBNZ5ucrKpxRyYB23niTEOlnopLe1iQl6uPjymxDTUNQCbEYcjUoQ7QVxKM7pQz74=
X-Received: by 2002:a05:690c:3501:b0:78c:6a2b:c6aa with SMTP id
 00721157ae682-78ca642f79cmr26171617b3.58.1765387384373; Wed, 10 Dec 2025
 09:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20251209141942.35940-1-skandigraun@gmail.com>
In-Reply-To: <20251209141942.35940-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Dec 2025 09:22:38 -0800
X-Gm-Features: AQt7F2qluURHglBHXJkIbV5-Qg9sijSnS6aTpqACFwOzZW--FGz7i-kFX_OrgBQ
Message-ID: <CAMKF1spVkO=zem7qoZGDr-8paHb21O0huXTTW8q9zUTyFm0f2w@mail.gmail.com>
Subject: Re: [oe] Kirkstone Pull Request Dec 9th
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000efc60206459c478b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122562

--000000000000efc60206459c478b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, it's installed now.

On Tue, Dec 9, 2025 at 6:19=E2=80=AFAM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Hello,
>
> This new Kirkstone Pull Request contains mostly SRC_URI and CVE fixes,
> along with a
> few new ptest additions.
>
> Logs:
> world build qemuarm:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/200012994=
17
> world build qemuarm64:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/200054128=
44
> world build qemux86:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/200093974=
04
> world build qemux86-64:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/200093981=
84
> YP compatibility:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/200193269=
42
> ptest execution (qemux86-64):
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/200201652=
99
> ptest logs: https://sarvari.me/yocto/ptest-kirkstone-2025-12.tar.gz
>
> Please let me know if you have any questions or comments.
>
> Thank you
>
> ---
>
> The following changes since commit
> 07ac1890c843b374c27e150f1a2e53ad3db2a8e4:
>
>   libssh: fix CVE-2025-8277 (2025-11-11 08:50:50 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib
> stable/kirkstone-nut
>
> for you to fetch changes up to 97d4be2839754dadfc326c21948472c2fc2985ce:
>
>   gupnp-igd: add ptest support (2025-12-06 19:34:22 +0100)
>
> ----------------------------------------------------------------
> AshishKumar Mishra (1):
>       imagemagick: adds ptest for imagemagick recipe
>
> Divya Chellam (1):
>       libssh : fix CVE-2025-8114
>
> Gerard Salvatella (1):
>       libwebsockets: fix buildpath warnings
>
> Gyorgy Sarvari (94):
>       zabbix: update SRC_URI
>       http-parser: fix SRC_URI branch
>       cmpi-bindings: update SRC_URI branch
>       xf86-video-armsoc: fix SRC_URI
>       transmission: update SRC_URI branch
>       usbredir: update SRC_URI
>       ncftp: correct SRC_URI
>       netsniff-ng: update SRC_URI branch
>       consolation: fix SRC_URI protocol
>       unicode-ucd: Updates due to license.txt updates
>       unicode-ucd: Rename the license.txt in DL_DIR to avoid conflicts
>       breakpad: update SRC_URI branch
>       mpd: fix SRC_URI branch
>       iksemel: fix SRC_URI branch
>       libvdpau: fix SRC_URI
>       nng: Rename default branch of github.com:nanomsg/nng.git
>       wifi-test-suite: correct SRC_URI
>       spirv-shader-generator: fix SRC_URI branch
>       spice: correct SRC_URI
>       python3-behave: update SRC_URI branch
>       pyxdg: update SRC_URI
>       redis: update test error message in CVE patch
>       usrsctp: patch CVE-2019-20503
>       usbredir: patch CVE-2021-3700
>       tmux: ignore CVE-2020-27347
>       libwmf: add proper CVE tag to patch
>       libwmf: add missing CVE tag to patch
>       libwmf: patch CVE-2015-0848 and CVE-2015-4588
>       libwmf: patch CVE-2015-4695
>       libwmf: patch CVE-2015-4696
>       libwmf: patch CVE-2016-9011
>       rsyslog: set status for CVE-2015-3243
>       audiofile: patch CVE-2019-13147 and CVE-2022-24599
>       audiofile: add ptest support
>       audiofile: backport test for CVE-2015-7747
>       audiofile: patch CVE-2018-13440 and CVE-2018-17059
>       evince: fix typo in CVE_CHECK_IGNORE
>       linuxptp: ignore CVE-2024-42861
>       poco: patch CVE-2023-52389
>       logcheck: ignore CVE-2017-20148
>       libtorrent: ignore CVE-2016-5301
>       exiv2: patch CVE-2021-29623
>       exiv2: add missing CVE tag to patch
>       exiv2: patch CVE-2021-32617
>       exiv2: patch CVE-2021-32815
>       exiv2: patch CVE-2021-34334
>       exiv2: patch CVE-2021-34335
>       redis: ignore CVE-2022-3734 and CVE-2022-0543
>       redis: upgrade 6.2.12 -> 6.2.21
>       redis: upgrade 7.0.13 -> 7.0.15
>       redis-7: ignore CVE-2022-3734 and CVE-2022-0543
>       jasper: patch CVE-2023-51257
>       jasper: patch CVE-2025-8835
>       jasper: patch CVE-2025-8836
>       jasper: patch CVE-2025-8837
>       links: set CVE_PRODUCT
>       libde265: patch CVE-2022-1253
>       cockpit: set correct CVE_PRODUCT
>       libao: ignore CVE-2017-11548
>       tigervnc: ignore CVE-2014-8241
>       libraw: ignore CVE-2020-35530
>       libraw: ignore CVE-2020-35531
>       libraw: ignore CVE-2020-35532
>       libraw: ignore CVE-2020-35533
>       libraw: ignore CVE-2020-35534
>       libraw: ignore CVE-2020-35535
>       libraw: patch CVE-2023-1729
>       libraw: patch CVE-2025-43961 and CVE-2025-43962
>       libraw: patch CVE-2025-43963
>       libraw: patch CVE-2025-43964
>       yasm: add alternative CVE_PRODUCT
>       yasm: patch CVE-2023-29579
>       yasm: patch CVE-2021-33464
>       yasm: patch CVE-2021-33456
>       fontforge: ignore CVE-2019-15785
>       fontforge: patch CVE-2020-5395, CVE-2020-25690 and CVE-2020-5496
>       fontforge: patch CVE-2024-25081 and CVE-2024-25082
>       babeld: fix installation with usrmerge
>       gradm: fix installation with usrmerge enabled
>       xrdp: upgrade 0.9.18 -> 0.9.18.1
>       xrdp: patch CVE-2022-23468
>       xrdp: patch CVE-2022-23477
>       xrdp: patch CVE-2022-23478
>       xrdp: patch CVE-2022-23479
>       xrdp: patch CVE-2022-23480
>       xrdp: patch CVE-2022-23481
>       xrdp: patch CVE-2022-23483
>       xrdp: patch CVE-2022-23484
>       xrdp: patch CVE-2022-23493
>       xrdp: add ptest support
>       gssdp: add ptest support
>       gupnp: add ptest support
>       gupnp-av: add ptest support
>       gupnp-igd: add ptest support
>
> Khem Raj (3):
>       audiofile: Fix build with clang++
>       libwebsockets: Fix reference to TMPDIR
>       scsirastools: Fix build with usrmerge
>
> Martin Jansa (2):
>       libwebsockets: remove STAGING_LIBDIR with /
>       libwebsockets: fix buildpath warnings from libcap.so
>
> Mingli Yu (1):
>       nspr: fix buildpaths issue
>
> Naman Jain (1):
>       p7zip: ignore CVE-2022-47069
>
> Ninette Adhikari (1):
>       monkey: Update status for CVE-2013-2183
>
> Peter Marko (4):
>       audiofile: mark CVE-2020-18781 as patched
>       uw-imap: patch CVE-2018-19518
>       rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-2015-8272 as
> fixed
>       monkey: ignore CVE-2013-1771
>
> Saravanan (11):
>       python3-django: upgrade 3.2.23 -> 3.2.25
>       python3-django: upgrade 4.2.17 -> 4.2.26
>       python3-django: fix CVE-2024-27351
>       python3-django: fix CVE-2025-26699
>       python3-django: fix CVE-2024-56374
>       python3-django: fix CVE-2025-57833
>       python3-django: fix CVE-2024-39329
>       python3-django: fix CVE-2024-39330
>       python3-django: fix CVE-2024-41991
>       python3-django: fix CVE-2024-53907
>       python3-django: fix CVE-2025-32873
>
> Zhang Peng (1):
>       wxwidgets: fix CVE-2024-58249
>
>  meta-gnome/recipes-gnome/evince/evince_42.3.bb     |   2 +-
>  .../recipes-connectivity/gupnp/gssdp/run-ptest     |  12 +
>  .../recipes-connectivity/gupnp/gssdp_1.4.0.1.bb    |   9 +-
>  .../recipes-connectivity/gupnp/gupnp-av/run-ptest  |  12 +
>  .../recipes-connectivity/gupnp/gupnp-av_0.14.0.bb  |  21 +-
>  .../recipes-connectivity/gupnp/gupnp-igd/run-ptest |  13 +
>  .../recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb  |  11 +-
>  .../recipes-connectivity/gupnp/gupnp/run-ptest     |  12 +
>  .../recipes-connectivity/gupnp/gupnp_1.4.1.bb      |  14 +-
>  .../recipes-multimedia/libao/libao_1.2.0.bb        |   3 +
>  .../libde265/libde265/CVE-2022-1253.patch          |  34 ++
>  .../recipes-multimedia/libde265/libde265_1.0.5.bb  |   4 +-
>  .../recipes-multimedia/musicpd/mpd_0.23.12.bb      |   2 +-
>  .../recipes-multimedia/rtmpdump/rtmpdump_2.4.bb    |   3 +
>  .../recipes-connectivity/nanomsg/nng_1.5.2.bb      |   2 +-
>  .../recipes-daemons/ncftp/ncftp_3.2.7.bb           |   4 +-
>  .../recipes-protocols/babeld/babeld_1.10.bb        |   2 +-
>  .../usrsctp/usrsctp/CVE-2019-20503.patch           |  54 ++++
>  .../recipes-protocols/usrsctp/usrsctp_git.bb       |   3 +-
>  .../http-parser/http-parser_2.9.4.bb               |   2 +-
>  .../netsniff-ng/netsniff-ng_0.6.8.bb               |   2 +-
>  meta-networking/recipes-support/spice/spice_git.bb |   4 +-
>  .../spice/usbredir/CVE-2021-3700.patch             |  74 +++++
>  .../recipes-support/spice/usbredir_0.9.0.bb        |   6 +-
>  .../libtorrent/libtorrent_git.bb                   |   1 +
>  .../libwebsockets/libwebsockets_4.2.2.bb           |  11 +
>  .../linuxptp/linuxptp_3.1.1.bb                     |   3 +
>  .../transmission/transmission_git.bb               |   2 +-
>  .../wifi-test-suite/wifi-test-suite_git.bb         |   2 +-
>  .../recipes-connectivity/zabbix/zabbix_5.4.12.bb   |   2 +-
>  meta-oe/recipes-devtools/breakpad/breakpad_git.bb  |   2 +-
>  .../uw-imap/uw-imap/CVE-2018-19518.patch           |  24 ++
>  meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb  |   1 +
>  .../yasm/yasm/CVE-2021-33456.patch                 |  35 ++
>  .../yasm/yasm/CVE-2021-33464.patch                 |  34 ++
>  .../yasm/yasm/CVE-2023-29579.patch                 |  39 +++
>  meta-oe/recipes-devtools/yasm/yasm_git.bb          |   7 +-
>  .../cmpi-bindings/cmpi-bindings_1.0.1.bb           |   2 +-
>  .../libwmf/CVE-2015-0848-CVE-2015-4588.patch       | 135 ++++++++
>  .../libwmf/libwmf/CVE-2015-4695.patch              |  70 ++++
>  .../libwmf/libwmf/CVE-2015-4696.patch              |  37 +++
>  .../libwmf/libwmf/CVE-2016-9011.patch              |  50 +++
>  .../libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch |   2 +
>  .../libwmf/libwmf-0.2.8.4-useafterfree.patch       |   2 +
>  meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb  |   6 +-
>  meta-oe/recipes-extended/p7zip/p7zip_16.02.bb      |   3 +
>  .../redis/redis-7.0.13/CVE-2023-41056.patch        |  63 ----
>  .../redis/redis-7.0.13/CVE-2023-45145.patch        |  72 -----
>  .../0001-src-Do-not-reset-FINAL_LIBS.patch         |   0
>  .../0006-Define-correct-gregs-for-RISCV32.patch    |   0
>  .../CVE-2024-31227.patch                           |   0
>  .../CVE-2024-31228.patch                           |   0
>  .../CVE-2024-31449.patch                           |   0
>  .../CVE-2024-46981.patch                           |   0
>  .../CVE-2024-51741.patch                           |   4 +-
>  .../CVE-2025-21605.patch                           |   0
>  .../CVE-2025-27151.patch                           |   0
>  .../CVE-2025-32023.patch                           |   0
>  .../CVE-2025-46817.patch                           |   0
>  .../CVE-2025-46818.patch                           |   0
>  .../CVE-2025-46819.patch                           |   0
>  .../CVE-2025-48367.patch                           |   0
>  .../CVE-2025-49844.patch                           |   0
>  .../GNU_SOURCE-7.patch                             |   0
>  .../hiredis-use-default-CC-if-it-is-set.patch      |   0
>  .../init-redis-server                              |   0
>  ...Makefile-to-use-environment-build-setting.patch |   0
>  .../oe-use-libc-malloc.patch                       |   0
>  .../{redis-7.0.13 =3D> redis-7.0.15}/redis.conf      |   0
>  .../{redis-7.0.13 =3D> redis-7.0.15}/redis.service   |   0
>  .../redis/redis/CVE-2023-45145.patch               |  72 -----
>  .../redis/redis/CVE-2024-31228.patch               |  68 ----
>  .../redis/redis/CVE-2024-31449.patch               |  49 ---
>  .../redis/redis/CVE-2024-46981.patch               |  39 ---
>  .../redis/{redis_6.2.12.bb =3D> redis_6.2.21.bb}     |  11 +-
>  .../redis/{redis_7.0.13.bb =3D> redis_7.0.15.bb}     |   9 +-
>  .../recipes-extended/rsyslog/rsyslog/rsyslog.conf  |   1 +
>  .../recipes-extended/rsyslog/rsyslog_8.2206.0.bb   |   3 +
>  .../scsirastools/scsirastools_1.6.6.bb             |   2 +-
>  meta-oe/recipes-extended/tmux/tmux_3.1c.bb         |   4 +
>  .../wxwidgets/wxwidgets/CVE-2024-58249.patch       | 177 ++++++++++
>  .../recipes-extended/wxwidgets/wxwidgets_3.1.5.bb  |   1 +
>  meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb          |   2 +-
>  .../fontforge/fontforge/CVE-2020-25690-1.patch     |  81 +++++
>  .../fontforge/fontforge/CVE-2020-25690-2.patch     |  32 ++
>  .../fontforge/fontforge/CVE-2024-25081-25082.patch | 181 +++++++++++
>  .../fontforge/fontforge_20190801.bb                |   8 +-
>  .../jasper/jasper/CVE-2023-51257.patch             |  40 +++
>  .../jasper/jasper/CVE-2025-8835.patch              | 170 ++++++++++
>  .../jasper/jasper/CVE-2025-8836.patch              |  78 +++++
>  .../jasper/jasper/CVE-2025-8837.patch              |  63 ++++
>  meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb   |   7 +-
>  .../spir/spirv-shader-generator_git.bb             |   2 +-
>  .../recipes-graphics/tigervnc/tigervnc_1.11.0.bb   |   3 +
>  meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb     |   2 +-
>  .../xorg-driver/xf86-video-armsoc_1.4.1.bb         |   2 +-
>  .../audiofile/audiofile_0.3.6.bb                   |  24 +-
>  ...0001-test-sign.cpp-Fix-C-narrowing-errors.patch |  41 +++
>  ...4-Always-check-the-number-of-coefficients.patch |   1 +
>  .../audiofile/files/CVE-2018-13440.patch           |  36 +++
>  .../audiofile/files/CVE-2018-17059.patch           |  35 ++
>  .../audiofile/files/CVE-2019-13147.patch           |  31 ++
>  .../audiofile/files/CVE-2022-24599.patch           |  50 +++
>  .../recipes-multimedia/audiofile/files/run-ptest   |  14 +
>  .../audiofile/files/test-for-CVE-2015-7747.patch   | 166 ++++++++++
>  .../consolation/consolation_0.0.8.bb               |   2 +-
>  .../exiv2/exiv2/CVE-2021-29458.patch               |   3 +
>  .../exiv2/exiv2/CVE-2021-29623.patch               |  29 ++
>  .../exiv2/exiv2/CVE-2021-32617.patch               | 129 ++++++++
>  .../exiv2/exiv2/CVE-2021-32815.patch               |  36 +++
>  .../exiv2/exiv2/CVE-2021-34334-1.patch             |  36 +++
>  .../exiv2/exiv2/CVE-2021-34334-2.patch             | 322
> +++++++++++++++++++
>  .../exiv2/exiv2/CVE-2021-34334-3.patch             |  35 ++
>  .../exiv2/exiv2/CVE-2021-34334-4.patch             |  25 ++
>  .../exiv2/exiv2/CVE-2021-34335-1.patch             |  43 +++
>  .../exiv2/exiv2/CVE-2021-34335-2.patch             |  57 ++++
>  meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb      |  28 +-
>  .../gradm/0001-make-Define-SBINDIR-flag.patch      |  69 ++++
>  .../gradm/gradm_3.1-201903191516.bb                |   2 +
>  meta-oe/recipes-support/iksemel/iksemel_1.5.bb     |   2 +-
>  .../imagemagick/files/imagemagick-ptest.sh         | 128 ++++++++
>  .../recipes-support/imagemagick/files/run-ptest    |  43 +++
>  .../imagemagick/imagemagick_7.0.10.bb              |   8 +-
>  .../libraw/libraw/CVE-2023-1729.patch              |  25 ++
>  .../libraw/libraw/CVE-2025-43961-43962.patch       | 104 ++++++
>  .../libraw/libraw/CVE-2025-43963.patch             |  36 +++
>  .../libraw/libraw/CVE-2025-43964.patch             |  25 ++
>  meta-oe/recipes-support/libraw/libraw_0.20.2.bb    |  17 +-
>  .../libssh/libssh/CVE-2025-8114.patch              |  50 +++
>  meta-oe/recipes-support/libssh/libssh_0.8.9.bb     |   1 +
>  meta-oe/recipes-support/links/links.inc            |   2 +
>  ...-config-nspr-config.in-don-t-pass-LDFLAGS.patch |  30 ++
>  meta-oe/recipes-support/nspr/nspr_4.29.bb          |   1 +
>  .../recipes-support/poco/poco/CVE-2023-52389.patch | 122 +++++++
>  meta-oe/recipes-support/poco/poco_1.11.2.bb        |   1 +
>  .../unicode-ucd/unicode-ucd_14.0.0.bb              |   6 +-
>  .../recipes-support/xrdp/xrdp/CVE-2022-23468.patch |  34 ++
>  .../recipes-support/xrdp/xrdp/CVE-2022-23477.patch |  38 +++
>  .../recipes-support/xrdp/xrdp/CVE-2022-23478.patch |  85 +++++
>  .../recipes-support/xrdp/xrdp/CVE-2022-23479.patch |  83 +++++
>  .../xrdp/xrdp/CVE-2022-23480-1.patch               | 356
> +++++++++++++++++++++
>  .../xrdp/xrdp/CVE-2022-23480-2.patch               |  54 ++++
>  .../recipes-support/xrdp/xrdp/CVE-2022-23481.patch |  46 +++
>  .../recipes-support/xrdp/xrdp/CVE-2022-23483.patch |  65 ++++
>  .../recipes-support/xrdp/xrdp/CVE-2022-23484.patch |  31 ++
>  .../recipes-support/xrdp/xrdp/CVE-2022-23493.patch |  33 ++
>  meta-oe/recipes-support/xrdp/xrdp/run-ptest        |  13 +
>  .../xrdp/{xrdp_0.9.18.bb =3D> xrdp_0.9.18.1.bb}      |  47 ++-
>  .../recipes-extended/logcheck/logcheck_1.3.23.bb   |   3 +
>  .../recipes-devtools/python/python-django.inc      |   6 +-
>  .../python/python3-behave_1.2.6.bb                 |   2 +-
>  .../python3-django-3.2.25/CVE-2024-39329.patch     | 114 +++++++
>  .../python3-django-3.2.25/CVE-2024-39330.patch     | 184 +++++++++++
>  .../python3-django-3.2.25/CVE-2024-41991.patch     | 143 +++++++++
>  .../python3-django-3.2.25/CVE-2024-53907.patch     | 124 +++++++
>  .../python3-django-3.2.25/CVE-2024-56374.patch     | 308
> ++++++++++++++++++
>  .../python3-django-3.2.25/CVE-2025-26699.patch     | 106 ++++++
>  .../python3-django-3.2.25/CVE-2025-32873.patch     | 110 +++++++
>  .../python3-django-3.2.25/CVE-2025-57833.patch     | 110 +++++++
>  .../python/python3-django/CVE-2024-27351.patch     | 149 +++++++++
>  .../python/python3-django/CVE-2024-39329.patch     | 111 +++++++
>  .../python/python3-django/CVE-2024-39330.patch     | 181 +++++++++++
>  .../python/python3-django/CVE-2024-56374.patch     | 315
> ++++++++++++++++++
>  .../python/python3-django/CVE-2025-26699.patch     | 107 +++++++
>  .../python/python3-django/CVE-2025-32873.patch     | 107 +++++++
>  .../python/python3-django/CVE-2025-57833.patch     |  95 ++++++
>  .../python/python3-django_2.2.28.bb                |   7 +
>  .../python/python3-django_3.2.23.bb                |  13 -
>  .../python/python3-django_3.2.25.bb                |  23 ++
>  .../python/python3-django_4.2.17.bb                |  13 -
>  .../python/python3-django_4.2.26.bb                |  17 +
>  .../recipes-httpd/monkey/monkey_1.6.9.bb           |   4 +
>  .../recipes-webadmin/cockpit/cockpit_220.bb        |   2 +
>  173 files changed, 6620 insertions(+), 455 deletions(-)
>  create mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest
>  create mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gupnp-av/run-ptest
>  create mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest
>  create mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2022-1253.patch
>  create mode 100644
> meta-networking/recipes-protocols/usrsctp/usrsctp/CVE-2019-20503.patch
>  create mode 100644
> meta-networking/recipes-support/spice/usbredir/CVE-2021-3700.patch
>  create mode 100644
> meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
>  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.pat=
ch
>  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.pat=
ch
>  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.pat=
ch
>  create mode 100644
> meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-0848-CVE-2015-4588.patch
>  create mode 100644
> meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch
>  create mode 100644
> meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch
>  create mode 100644
> meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2024-31227.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2024-31228.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2024-31449.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2024-46981.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2024-51741.patch (94%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2025-21605.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2025-27151.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2025-32023.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2025-46817.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2025-46818.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2025-46819.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2025-48367.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/CVE-2025-49844.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/GNU_SOURCE-7.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/hiredis-use-default-CC-if-it-is-set.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/init-redis-server (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/lua-update-Makefile-to-use-environment-build-setting.patch
> (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/oe-use-libc-malloc.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/redis.conf (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D>
> redis-7.0.15}/redis.service (100%)
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch
>  rename meta-oe/recipes-extended/redis/{redis_6.2.12.bb =3D> redis_6.2.21=
.bb}
> (88%)
>  rename meta-oe/recipes-extended/redis/{redis_7.0.13.bb =3D> redis_7.0.15=
.bb}
> (90%)
>  create mode 100644
> meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-1.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-2.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081-25082.patch
>  create mode 100644
> meta-oe/recipes-graphics/jasper/jasper/CVE-2023-51257.patch
>  create mode 100644
> meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8835.patch
>  create mode 100644
> meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8836.patch
>  create mode 100644
> meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8837.patch
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narro=
wing-errors.patch
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/CVE-2018-13440.patch
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/CVE-2018-17059.patch
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/CVE-2019-13147.patch
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/CVE-2022-24599.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/run-ptest
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/test-for-CVE-2015-7747.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29623.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32617.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32815.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-2.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-3.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-4.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-2.patch
>  create mode 100644
> meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/imagemagick-ptest.sh
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/run-ptest
>  create mode 100644
> meta-oe/recipes-support/libraw/libraw/CVE-2023-1729.patch
>  create mode 100644
> meta-oe/recipes-support/libraw/libraw/CVE-2025-43961-43962.patch
>  create mode 100644
> meta-oe/recipes-support/libraw/libraw/CVE-2025-43963.patch
>  create mode 100644
> meta-oe/recipes-support/libraw/libraw/CVE-2025-43964.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch
>  create mode 100644
> meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-L=
DFLAGS.patch
>  create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2023-52389.patc=
h
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patc=
h
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patc=
h
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patc=
h
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patc=
h
>  create mode 100644
> meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1.patch
>  create mode 100644
> meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2.patch
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patc=
h
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patc=
h
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patc=
h
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patc=
h
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/run-ptest
>  rename meta-oe/recipes-support/xrdp/{xrdp_0.9.18.bb =3D> xrdp_0.9.18.1.b=
b}
> (64%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39329.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39330.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-41991.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-53907.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-56374.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-26699.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-32873.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-57833.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-django_3.2.23.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-django_3.2.25.bb
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-django_4.2.17.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-django_4.2.26.bb
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122459):
> https://lists.openembedded.org/g/openembedded-devel/message/122459
> Mute This Topic: https://lists.openembedded.org/mt/116693874/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000efc60206459c478b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, it&#39;s installed now.=C2=A0</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Dec 9, 2025 at 6:19=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hello,<br>
<br>
This new Kirkstone Pull Request contains mostly SRC_URI and CVE fixes, alon=
g with a<br>
few new ptest additions.<br>
<br>
Logs:<br>
world build qemuarm: <a href=3D"https://github.com/OldManYellsAtCloud/meta-=
oe-test/actions/runs/20001299417" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20001299417</a>=
<br>
world build qemuarm64: <a href=3D"https://github.com/OldManYellsAtCloud/met=
a-oe-test/actions/runs/20005412844" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20005412844</=
a><br>
world build qemux86: <a href=3D"https://github.com/OldManYellsAtCloud/meta-=
oe-test/actions/runs/20009397404" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20009397404</a>=
<br>
world build qemux86-64: <a href=3D"https://github.com/OldManYellsAtCloud/me=
ta-oe-test/actions/runs/20009398184" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20009398184<=
/a><br>
YP compatibility: <a href=3D"https://github.com/OldManYellsAtCloud/meta-oe-=
test/actions/runs/20019326942" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20019326942</a><br=
>
ptest execution (qemux86-64): <a href=3D"https://github.com/OldManYellsAtCl=
oud/meta-oe-test/actions/runs/20020165299" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/200201=
65299</a><br>
ptest logs: <a href=3D"https://sarvari.me/yocto/ptest-kirkstone-2025-12.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">https://sarvari.me/yocto/ptest-ki=
rkstone-2025-12.tar.gz</a><br>
<br>
Please let me know if you have any questions or comments.<br>
<br>
Thank you<br>
<br>
---<br>
<br>
The following changes since commit 07ac1890c843b374c27e150f1a2e53ad3db2a8e4=
:<br>
<br>
=C2=A0 libssh: fix CVE-2025-8277 (2025-11-11 08:50:50 +0100)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembe=
dded-contrib</a> stable/kirkstone-nut<br>
<br>
for you to fetch changes up to 97d4be2839754dadfc326c21948472c2fc2985ce:<br=
>
<br>
=C2=A0 gupnp-igd: add ptest support (2025-12-06 19:34:22 +0100)<br>
<br>
----------------------------------------------------------------<br>
AshishKumar Mishra (1):<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: adds ptest for imagemagick recipe<br>
<br>
Divya Chellam (1):<br>
=C2=A0 =C2=A0 =C2=A0 libssh : fix CVE-2025-8114<br>
<br>
Gerard Salvatella (1):<br>
=C2=A0 =C2=A0 =C2=A0 libwebsockets: fix buildpath warnings<br>
<br>
Gyorgy Sarvari (94):<br>
=C2=A0 =C2=A0 =C2=A0 zabbix: update SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 http-parser: fix SRC_URI branch<br>
=C2=A0 =C2=A0 =C2=A0 cmpi-bindings: update SRC_URI branch<br>
=C2=A0 =C2=A0 =C2=A0 xf86-video-armsoc: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 transmission: update SRC_URI branch<br>
=C2=A0 =C2=A0 =C2=A0 usbredir: update SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 ncftp: correct SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 netsniff-ng: update SRC_URI branch<br>
=C2=A0 =C2=A0 =C2=A0 consolation: fix SRC_URI protocol<br>
=C2=A0 =C2=A0 =C2=A0 unicode-ucd: Updates due to license.txt updates<br>
=C2=A0 =C2=A0 =C2=A0 unicode-ucd: Rename the license.txt in DL_DIR to avoid=
 conflicts<br>
=C2=A0 =C2=A0 =C2=A0 breakpad: update SRC_URI branch<br>
=C2=A0 =C2=A0 =C2=A0 mpd: fix SRC_URI branch<br>
=C2=A0 =C2=A0 =C2=A0 iksemel: fix SRC_URI branch<br>
=C2=A0 =C2=A0 =C2=A0 libvdpau: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 nng: Rename default branch of github.com:nanomsg/nng.g=
it<br>
=C2=A0 =C2=A0 =C2=A0 wifi-test-suite: correct SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 spirv-shader-generator: fix SRC_URI branch<br>
=C2=A0 =C2=A0 =C2=A0 spice: correct SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 python3-behave: update SRC_URI branch<br>
=C2=A0 =C2=A0 =C2=A0 pyxdg: update SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 redis: update test error message in CVE patch<br>
=C2=A0 =C2=A0 =C2=A0 usrsctp: patch CVE-2019-20503<br>
=C2=A0 =C2=A0 =C2=A0 usbredir: patch CVE-2021-3700<br>
=C2=A0 =C2=A0 =C2=A0 tmux: ignore CVE-2020-27347<br>
=C2=A0 =C2=A0 =C2=A0 libwmf: add proper CVE tag to patch<br>
=C2=A0 =C2=A0 =C2=A0 libwmf: add missing CVE tag to patch<br>
=C2=A0 =C2=A0 =C2=A0 libwmf: patch CVE-2015-0848 and CVE-2015-4588<br>
=C2=A0 =C2=A0 =C2=A0 libwmf: patch CVE-2015-4695<br>
=C2=A0 =C2=A0 =C2=A0 libwmf: patch CVE-2015-4696<br>
=C2=A0 =C2=A0 =C2=A0 libwmf: patch CVE-2016-9011<br>
=C2=A0 =C2=A0 =C2=A0 rsyslog: set status for CVE-2015-3243<br>
=C2=A0 =C2=A0 =C2=A0 audiofile: patch CVE-2019-13147 and CVE-2022-24599<br>
=C2=A0 =C2=A0 =C2=A0 audiofile: add ptest support<br>
=C2=A0 =C2=A0 =C2=A0 audiofile: backport test for CVE-2015-7747<br>
=C2=A0 =C2=A0 =C2=A0 audiofile: patch CVE-2018-13440 and CVE-2018-17059<br>
=C2=A0 =C2=A0 =C2=A0 evince: fix typo in CVE_CHECK_IGNORE<br>
=C2=A0 =C2=A0 =C2=A0 linuxptp: ignore CVE-2024-42861<br>
=C2=A0 =C2=A0 =C2=A0 poco: patch CVE-2023-52389<br>
=C2=A0 =C2=A0 =C2=A0 logcheck: ignore CVE-2017-20148<br>
=C2=A0 =C2=A0 =C2=A0 libtorrent: ignore CVE-2016-5301<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-29623<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: add missing CVE tag to patch<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-32617<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-32815<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-34334<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-34335<br>
=C2=A0 =C2=A0 =C2=A0 redis: ignore CVE-2022-3734 and CVE-2022-0543<br>
=C2=A0 =C2=A0 =C2=A0 redis: upgrade 6.2.12 -&gt; 6.2.21<br>
=C2=A0 =C2=A0 =C2=A0 redis: upgrade 7.0.13 -&gt; 7.0.15<br>
=C2=A0 =C2=A0 =C2=A0 redis-7: ignore CVE-2022-3734 and CVE-2022-0543<br>
=C2=A0 =C2=A0 =C2=A0 jasper: patch CVE-2023-51257<br>
=C2=A0 =C2=A0 =C2=A0 jasper: patch CVE-2025-8835<br>
=C2=A0 =C2=A0 =C2=A0 jasper: patch CVE-2025-8836<br>
=C2=A0 =C2=A0 =C2=A0 jasper: patch CVE-2025-8837<br>
=C2=A0 =C2=A0 =C2=A0 links: set CVE_PRODUCT<br>
=C2=A0 =C2=A0 =C2=A0 libde265: patch CVE-2022-1253<br>
=C2=A0 =C2=A0 =C2=A0 cockpit: set correct CVE_PRODUCT<br>
=C2=A0 =C2=A0 =C2=A0 libao: ignore CVE-2017-11548<br>
=C2=A0 =C2=A0 =C2=A0 tigervnc: ignore CVE-2014-8241<br>
=C2=A0 =C2=A0 =C2=A0 libraw: ignore CVE-2020-35530<br>
=C2=A0 =C2=A0 =C2=A0 libraw: ignore CVE-2020-35531<br>
=C2=A0 =C2=A0 =C2=A0 libraw: ignore CVE-2020-35532<br>
=C2=A0 =C2=A0 =C2=A0 libraw: ignore CVE-2020-35533<br>
=C2=A0 =C2=A0 =C2=A0 libraw: ignore CVE-2020-35534<br>
=C2=A0 =C2=A0 =C2=A0 libraw: ignore CVE-2020-35535<br>
=C2=A0 =C2=A0 =C2=A0 libraw: patch CVE-2023-1729<br>
=C2=A0 =C2=A0 =C2=A0 libraw: patch CVE-2025-43961 and CVE-2025-43962<br>
=C2=A0 =C2=A0 =C2=A0 libraw: patch CVE-2025-43963<br>
=C2=A0 =C2=A0 =C2=A0 libraw: patch CVE-2025-43964<br>
=C2=A0 =C2=A0 =C2=A0 yasm: add alternative CVE_PRODUCT<br>
=C2=A0 =C2=A0 =C2=A0 yasm: patch CVE-2023-29579<br>
=C2=A0 =C2=A0 =C2=A0 yasm: patch CVE-2021-33464<br>
=C2=A0 =C2=A0 =C2=A0 yasm: patch CVE-2021-33456<br>
=C2=A0 =C2=A0 =C2=A0 fontforge: ignore CVE-2019-15785<br>
=C2=A0 =C2=A0 =C2=A0 fontforge: patch CVE-2020-5395, CVE-2020-25690 and CVE=
-2020-5496<br>
=C2=A0 =C2=A0 =C2=A0 fontforge: patch CVE-2024-25081 and CVE-2024-25082<br>
=C2=A0 =C2=A0 =C2=A0 babeld: fix installation with usrmerge<br>
=C2=A0 =C2=A0 =C2=A0 gradm: fix installation with usrmerge enabled<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: upgrade 0.9.18 -&gt; 0.9.18.1<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: patch CVE-2022-23468<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: patch CVE-2022-23477<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: patch CVE-2022-23478<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: patch CVE-2022-23479<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: patch CVE-2022-23480<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: patch CVE-2022-23481<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: patch CVE-2022-23483<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: patch CVE-2022-23484<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: patch CVE-2022-23493<br>
=C2=A0 =C2=A0 =C2=A0 xrdp: add ptest support<br>
=C2=A0 =C2=A0 =C2=A0 gssdp: add ptest support<br>
=C2=A0 =C2=A0 =C2=A0 gupnp: add ptest support<br>
=C2=A0 =C2=A0 =C2=A0 gupnp-av: add ptest support<br>
=C2=A0 =C2=A0 =C2=A0 gupnp-igd: add ptest support<br>
<br>
Khem Raj (3):<br>
=C2=A0 =C2=A0 =C2=A0 audiofile: Fix build with clang++<br>
=C2=A0 =C2=A0 =C2=A0 libwebsockets: Fix reference to TMPDIR<br>
=C2=A0 =C2=A0 =C2=A0 scsirastools: Fix build with usrmerge<br>
<br>
Martin Jansa (2):<br>
=C2=A0 =C2=A0 =C2=A0 libwebsockets: remove STAGING_LIBDIR with /<br>
=C2=A0 =C2=A0 =C2=A0 libwebsockets: fix buildpath warnings from libcap.so<b=
r>
<br>
Mingli Yu (1):<br>
=C2=A0 =C2=A0 =C2=A0 nspr: fix buildpaths issue<br>
<br>
Naman Jain (1):<br>
=C2=A0 =C2=A0 =C2=A0 p7zip: ignore CVE-2022-47069<br>
<br>
Ninette Adhikari (1):<br>
=C2=A0 =C2=A0 =C2=A0 monkey: Update status for CVE-2013-2183<br>
<br>
Peter Marko (4):<br>
=C2=A0 =C2=A0 =C2=A0 audiofile: mark CVE-2020-18781 as patched<br>
=C2=A0 =C2=A0 =C2=A0 uw-imap: patch CVE-2018-19518<br>
=C2=A0 =C2=A0 =C2=A0 rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-20=
15-8272 as fixed<br>
=C2=A0 =C2=A0 =C2=A0 monkey: ignore CVE-2013-1771<br>
<br>
Saravanan (11):<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: upgrade 3.2.23 -&gt; 3.2.25<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: upgrade 4.2.17 -&gt; 4.2.26<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2024-27351<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2025-26699<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2024-56374<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2025-57833<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2024-39329<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2024-39330<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2024-41991<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2024-53907<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2025-32873<br>
<br>
Zhang Peng (1):<br>
=C2=A0 =C2=A0 =C2=A0 wxwidgets: fix CVE-2024-58249<br>
<br>
=C2=A0meta-gnome/recipes-gnome/evince/<a href=3D"http://evince_42.3.bb" rel=
=3D"noreferrer" target=3D"_blank">evince_42.3.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-connectivity/gupnp/gssdp/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 12 +<br>
=C2=A0.../recipes-connectivity/gupnp/<a href=3D"http://gssdp_1.4.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">gssdp_1.4.0.1.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A09 +-<br>
=C2=A0.../recipes-connectivity/gupnp/gupnp-av/run-ptest=C2=A0 |=C2=A0 12 +<=
br>
=C2=A0.../recipes-connectivity/gupnp/<a href=3D"http://gupnp-av_0.14.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gupnp-av_0.14.0.bb</a>=C2=A0 |=C2=A0 2=
1 +-<br>
=C2=A0.../recipes-connectivity/gupnp/gupnp-igd/run-ptest |=C2=A0 13 +<br>
=C2=A0.../recipes-connectivity/gupnp/<a href=3D"http://gupnp-igd_1.2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gupnp-igd_1.2.0.bb</a>=C2=A0 |=C2=A0 1=
1 +-<br>
=C2=A0.../recipes-connectivity/gupnp/gupnp/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 12 +<br>
=C2=A0.../recipes-connectivity/gupnp/<a href=3D"http://gupnp_1.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gupnp_1.4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 14 +-<br>
=C2=A0.../recipes-multimedia/libao/<a href=3D"http://libao_1.2.0.bb" rel=3D=
"noreferrer" target=3D"_blank">libao_1.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0.../libde265/libde265/CVE-2022-1253.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 34 ++<br>
=C2=A0.../recipes-multimedia/libde265/<a href=3D"http://libde265_1.0.5.bb" =
rel=3D"noreferrer" target=3D"_blank">libde265_1.0.5.bb</a>=C2=A0 |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../recipes-multimedia/musicpd/<a href=3D"http://mpd_0.23.12.bb" rel=
=3D"noreferrer" target=3D"_blank">mpd_0.23.12.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-multimedia/rtmpdump/<a href=3D"http://rtmpdump_2.4.bb" re=
l=3D"noreferrer" target=3D"_blank">rtmpdump_2.4.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 =C2=A03 +<br>
=C2=A0.../recipes-connectivity/nanomsg/<a href=3D"http://nng_1.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">nng_1.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../recipes-daemons/ncftp/<a href=3D"http://ncftp_3.2.7.bb" rel=3D"no=
referrer" target=3D"_blank">ncftp_3.2.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../recipes-protocols/babeld/<a href=3D"http://babeld_1.10.bb" rel=3D=
"noreferrer" target=3D"_blank">babeld_1.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../usrsctp/usrsctp/CVE-2019-20503.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 54 ++++<br>
=C2=A0.../recipes-protocols/usrsctp/<a href=3D"http://usrsctp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">usrsctp_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0.../http-parser/<a href=3D"http://http-parser_2.9.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">http-parser_2.9.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../netsniff-ng/<a href=3D"http://netsniff-ng_0.6.8.bb" rel=3D"norefe=
rrer" target=3D"_blank">netsniff-ng_0.6.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-networking/recipes-support/spice/<a href=3D"http://spice_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">spice_git.bb</a> |=C2=A0 =C2=A04 +-<b=
r>
=C2=A0.../spice/usbredir/CVE-2021-3700.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 74 +++++<br>
=C2=A0.../recipes-support/spice/<a href=3D"http://usbredir_0.9.0.bb" rel=3D=
"noreferrer" target=3D"_blank">usbredir_0.9.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../libtorrent/<a href=3D"http://libtorrent_git.bb" rel=3D"noreferrer=
" target=3D"_blank">libtorrent_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.2.2.bb" rel=3D"no=
referrer" target=3D"_blank">libwebsockets_4.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +<br>
=C2=A0.../linuxptp/<a href=3D"http://linuxptp_3.1.1.bb" rel=3D"noreferrer" =
target=3D"_blank">linuxptp_3.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../transmission/<a href=3D"http://transmission_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">transmission_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../wifi-test-suite/<a href=3D"http://wifi-test-suite_git.bb" rel=3D"=
noreferrer" target=3D"_blank">wifi-test-suite_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-connectivity/zabbix/<a href=3D"http://zabbix_5.4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">zabbix_5.4.12.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-devtools/breakpad/<a href=3D"http://breakpad_git.bb" =
rel=3D"noreferrer" target=3D"_blank">breakpad_git.bb</a>=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../uw-imap/uw-imap/CVE-2018-19518.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 24 ++<br>
=C2=A0meta-oe/recipes-devtools/uw-imap/<a href=3D"http://uw-imap_2007f.bb" =
rel=3D"noreferrer" target=3D"_blank">uw-imap_2007f.bb</a>=C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../yasm/yasm/CVE-2021-33456.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 35 ++<br>
=C2=A0.../yasm/yasm/CVE-2021-33464.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 34 ++<br>
=C2=A0.../yasm/yasm/CVE-2023-29579.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 39 +++<br>
=C2=A0meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yasm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0.../cmpi-bindings/<a href=3D"http://cmpi-bindings_1.0.1.bb" rel=3D"no=
referrer" target=3D"_blank">cmpi-bindings_1.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../libwmf/CVE-2015-0848-CVE-2015-4588.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 135 ++++++++<br>
=C2=A0.../libwmf/libwmf/CVE-2015-4695.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 70 ++++<br>
=C2=A0.../libwmf/libwmf/CVE-2015-4696.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 37 +++<br>
=C2=A0.../libwmf/libwmf/CVE-2016-9011.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 50 +++<br>
=C2=A0.../libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch |=C2=A0 =C2=A02 +<=
br>
=C2=A0.../libwmf/libwmf-0.2.8.4-useafterfree.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta-oe/recipes-extended/libwmf/<a href=3D"http://libwmf_0.2.8.4.bb" =
rel=3D"noreferrer" target=3D"_blank">libwmf_0.2.8.4.bb</a>=C2=A0 |=C2=A0 =
=C2=A06 +-<br>
=C2=A0meta-oe/recipes-extended/p7zip/<a href=3D"http://p7zip_16.02.bb" rel=
=3D"noreferrer" target=3D"_blank">p7zip_16.02.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +<br>
=C2=A0.../redis/redis-7.0.13/CVE-2023-41056.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 63 ----<br>
=C2=A0.../redis/redis-7.0.13/CVE-2023-45145.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 72 -----<br>
=C2=A0.../0001-src-Do-not-reset-FINAL_LIBS.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../0006-Define-correct-gregs-for-RISCV32.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0.../CVE-2024-31227.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2024-31228.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2024-31449.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2024-46981.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2024-51741.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../CVE-2025-21605.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2025-27151.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2025-32023.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2025-46817.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2025-46818.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2025-46819.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2025-48367.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2025-49844.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../GNU_SOURCE-7.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<=
br>
=C2=A0.../hiredis-use-default-CC-if-it-is-set.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0.../init-redis-server=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br=
>
=C2=A0...Makefile-to-use-environment-build-setting.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../oe-use-libc-malloc.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../{redis-7.0.13 =3D&gt; redis-7.0.15}/redis.conf=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../{redis-7.0.13 =3D&gt; redis-7.0.15}/redis.service=C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../redis/redis/CVE-2023-45145.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 72 -----<br>
=C2=A0.../redis/redis/CVE-2024-31228.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 68 ----<br>
=C2=A0.../redis/redis/CVE-2024-31449.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 49 ---<br>
=C2=A0.../redis/redis/CVE-2024-46981.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 39 ---<br>
=C2=A0.../redis/{<a href=3D"http://redis_6.2.12.bb" rel=3D"noreferrer" targ=
et=3D"_blank">redis_6.2.12.bb</a> =3D&gt; <a href=3D"http://redis_6.2.21.bb=
" rel=3D"noreferrer" target=3D"_blank">redis_6.2.21.bb</a>}=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 11 +-<br>
=C2=A0.../redis/{<a href=3D"http://redis_7.0.13.bb" rel=3D"noreferrer" targ=
et=3D"_blank">redis_7.0.13.bb</a> =3D&gt; <a href=3D"http://redis_7.0.15.bb=
" rel=3D"noreferrer" target=3D"_blank">redis_7.0.15.bb</a>}=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0.../recipes-extended/rsyslog/rsyslog/rsyslog.conf=C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2206.0.bb" r=
el=3D"noreferrer" target=3D"_blank">rsyslog_8.2206.0.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
=C2=A0.../scsirastools/<a href=3D"http://scsirastools_1.6.6.bb" rel=3D"nore=
ferrer" target=3D"_blank">scsirastools_1.6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-extended/tmux/<a href=3D"http://tmux_3.1c.bb" rel=3D"=
noreferrer" target=3D"_blank">tmux_3.1c.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0.../wxwidgets/wxwidgets/CVE-2024-58249.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 177 ++++++++++<br>
=C2=A0.../recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.1.5.bb" =
rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.1.5.bb</a>=C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0meta-oe/recipes-gnome/pyxdg/<a href=3D"http://pyxdg_0.27.bb" rel=3D"n=
oreferrer" target=3D"_blank">pyxdg_0.27.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../fontforge/fontforge/CVE-2020-25690-1.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 81 +++++<br>
=C2=A0.../fontforge/fontforge/CVE-2020-25690-2.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 32 ++<br>
=C2=A0.../fontforge/fontforge/CVE-2024-25081-25082.patch | 181 +++++++++++<=
br>
=C2=A0.../fontforge/<a href=3D"http://fontforge_20190801.bb" rel=3D"norefer=
rer" target=3D"_blank">fontforge_20190801.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0.../jasper/jasper/CVE-2023-51257.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 40 +++<br>
=C2=A0.../jasper/jasper/CVE-2025-8835.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 170 ++++++++++<br>
=C2=A0.../jasper/jasper/CVE-2025-8836.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 78 +++++<br>
=C2=A0.../jasper/jasper/CVE-2025-8837.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 63 ++++<br>
=C2=A0meta-oe/recipes-graphics/jasper/<a href=3D"http://jasper_2.0.33.bb" r=
el=3D"noreferrer" target=3D"_blank">jasper_2.0.33.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A07 +-<br>
=C2=A0.../spir/<a href=3D"http://spirv-shader-generator_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">spirv-shader-generator_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-graphics/tigervnc/<a href=3D"http://tigervnc_1.11.0.bb" r=
el=3D"noreferrer" target=3D"_blank">tigervnc_1.11.0.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A03 +<br>
=C2=A0meta-oe/recipes-graphics/vdpau/<a href=3D"http://libvdpau_1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libvdpau_1.5.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../xorg-driver/<a href=3D"http://xf86-video-armsoc_1.4.1.bb" rel=3D"=
noreferrer" target=3D"_blank">xf86-video-armsoc_1.4.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../audiofile/<a href=3D"http://audiofile_0.3.6.bb" rel=3D"noreferrer=
" target=3D"_blank">audiofile_0.3.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +-<br>
=C2=A0...0001-test-sign.cpp-Fix-C-narrowing-errors.patch |=C2=A0 41 +++<br>
=C2=A0...4-Always-check-the-number-of-coefficients.patch |=C2=A0 =C2=A01 +<=
br>
=C2=A0.../audiofile/files/CVE-2018-13440.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 36 +++<br>
=C2=A0.../audiofile/files/CVE-2018-17059.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 35 ++<br>
=C2=A0.../audiofile/files/CVE-2019-13147.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 31 ++<br>
=C2=A0.../audiofile/files/CVE-2022-24599.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 50 +++<br>
=C2=A0.../recipes-multimedia/audiofile/files/run-ptest=C2=A0 =C2=A0|=C2=A0 =
14 +<br>
=C2=A0.../audiofile/files/test-for-CVE-2015-7747.patch=C2=A0 =C2=A0| 166 ++=
++++++++<br>
=C2=A0.../consolation/<a href=3D"http://consolation_0.0.8.bb" rel=3D"norefe=
rrer" target=3D"_blank">consolation_0.0.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../exiv2/exiv2/CVE-2021-29458.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../exiv2/exiv2/CVE-2021-29623.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 29 ++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-32617.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 129 ++++++++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-32815.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 36 +++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-34334-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 36 +++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-34334-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 322 +++++++++++++++++++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-34334-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 35 ++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-34334-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 25 ++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-34335-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 43 +++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-34335-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 57 ++++<br>
=C2=A0meta-oe/recipes-support/exiv2/<a href=3D"http://exiv2_0.27.3.bb" rel=
=3D"noreferrer" target=3D"_blank">exiv2_0.27.3.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 28 +-<br>
=C2=A0.../gradm/0001-make-Define-SBINDIR-flag.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 69 ++++<br>
=C2=A0.../gradm/<a href=3D"http://gradm_3.1-201903191516.bb" rel=3D"norefer=
rer" target=3D"_blank">gradm_3.1-201903191516.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta-oe/recipes-support/iksemel/<a href=3D"http://iksemel_1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">iksemel_1.5.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../imagemagick/files/imagemagick-ptest.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 128 ++++++++<br>
=C2=A0.../recipes-support/imagemagick/files/run-ptest=C2=A0 =C2=A0 |=C2=A0 =
43 +++<br>
=C2=A0.../imagemagick/<a href=3D"http://imagemagick_7.0.10.bb" rel=3D"noref=
errer" target=3D"_blank">imagemagick_7.0.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0.../libraw/libraw/CVE-2023-1729.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 25 ++<br>
=C2=A0.../libraw/libraw/CVE-2025-43961-43962.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 104 ++++++<br>
=C2=A0.../libraw/libraw/CVE-2025-43963.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 36 +++<br>
=C2=A0.../libraw/libraw/CVE-2025-43964.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 25 ++<br>
=C2=A0meta-oe/recipes-support/libraw/<a href=3D"http://libraw_0.20.2.bb" re=
l=3D"noreferrer" target=3D"_blank">libraw_0.20.2.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 17 +-<br>
=C2=A0.../libssh/libssh/CVE-2025-8114.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 50 +++<br>
=C2=A0meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb" rel=
=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0meta-oe/recipes-support/links/links.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0...-config-nspr-config.in-don-t-pass-LDFLAGS.patch |=C2=A0 30 ++<br>
=C2=A0meta-oe/recipes-support/nspr/<a href=3D"http://nspr_4.29.bb" rel=3D"n=
oreferrer" target=3D"_blank">nspr_4.29.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-support/poco/poco/CVE-2023-52389.patch | 122 +++++++<br>
=C2=A0meta-oe/recipes-support/poco/<a href=3D"http://poco_1.11.2.bb" rel=3D=
"noreferrer" target=3D"_blank">poco_1.11.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../unicode-ucd/<a href=3D"http://unicode-ucd_14.0.0.bb" rel=3D"noref=
errer" target=3D"_blank">unicode-ucd_14.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../recipes-support/xrdp/xrdp/CVE-2022-23468.patch |=C2=A0 34 ++<br>
=C2=A0.../recipes-support/xrdp/xrdp/CVE-2022-23477.patch |=C2=A0 38 +++<br>
=C2=A0.../recipes-support/xrdp/xrdp/CVE-2022-23478.patch |=C2=A0 85 +++++<b=
r>
=C2=A0.../recipes-support/xrdp/xrdp/CVE-2022-23479.patch |=C2=A0 83 +++++<b=
r>
=C2=A0.../xrdp/xrdp/CVE-2022-23480-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 356 +++++++++++++++++++++<br>
=C2=A0.../xrdp/xrdp/CVE-2022-23480-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 54 ++++<br>
=C2=A0.../recipes-support/xrdp/xrdp/CVE-2022-23481.patch |=C2=A0 46 +++<br>
=C2=A0.../recipes-support/xrdp/xrdp/CVE-2022-23483.patch |=C2=A0 65 ++++<br=
>
=C2=A0.../recipes-support/xrdp/xrdp/CVE-2022-23484.patch |=C2=A0 31 ++<br>
=C2=A0.../recipes-support/xrdp/xrdp/CVE-2022-23493.patch |=C2=A0 33 ++<br>
=C2=A0meta-oe/recipes-support/xrdp/xrdp/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 13 +<br>
=C2=A0.../xrdp/{<a href=3D"http://xrdp_0.9.18.bb" rel=3D"noreferrer" target=
=3D"_blank">xrdp_0.9.18.bb</a> =3D&gt; <a href=3D"http://xrdp_0.9.18.1.bb" =
rel=3D"noreferrer" target=3D"_blank">xrdp_0.9.18.1.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 47 ++-<br>
=C2=A0.../recipes-extended/logcheck/<a href=3D"http://logcheck_1.3.23.bb" r=
el=3D"noreferrer" target=3D"_blank">logcheck_1.3.23.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A03 +<br>
=C2=A0.../recipes-devtools/python/python-django.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
=C2=A0.../python/<a href=3D"http://python3-behave_1.2.6.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-behave_1.2.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python3-django-3.2.25/CVE-2024-39329.patch=C2=A0 =C2=A0 =C2=A0| 1=
14 +++++++<br>
=C2=A0.../python3-django-3.2.25/CVE-2024-39330.patch=C2=A0 =C2=A0 =C2=A0| 1=
84 +++++++++++<br>
=C2=A0.../python3-django-3.2.25/CVE-2024-41991.patch=C2=A0 =C2=A0 =C2=A0| 1=
43 +++++++++<br>
=C2=A0.../python3-django-3.2.25/CVE-2024-53907.patch=C2=A0 =C2=A0 =C2=A0| 1=
24 +++++++<br>
=C2=A0.../python3-django-3.2.25/CVE-2024-56374.patch=C2=A0 =C2=A0 =C2=A0| 3=
08 ++++++++++++++++++<br>
=C2=A0.../python3-django-3.2.25/CVE-2025-26699.patch=C2=A0 =C2=A0 =C2=A0| 1=
06 ++++++<br>
=C2=A0.../python3-django-3.2.25/CVE-2025-32873.patch=C2=A0 =C2=A0 =C2=A0| 1=
10 +++++++<br>
=C2=A0.../python3-django-3.2.25/CVE-2025-57833.patch=C2=A0 =C2=A0 =C2=A0| 1=
10 +++++++<br>
=C2=A0.../python/python3-django/CVE-2024-27351.patch=C2=A0 =C2=A0 =C2=A0| 1=
49 +++++++++<br>
=C2=A0.../python/python3-django/CVE-2024-39329.patch=C2=A0 =C2=A0 =C2=A0| 1=
11 +++++++<br>
=C2=A0.../python/python3-django/CVE-2024-39330.patch=C2=A0 =C2=A0 =C2=A0| 1=
81 +++++++++++<br>
=C2=A0.../python/python3-django/CVE-2024-56374.patch=C2=A0 =C2=A0 =C2=A0| 3=
15 ++++++++++++++++++<br>
=C2=A0.../python/python3-django/CVE-2025-26699.patch=C2=A0 =C2=A0 =C2=A0| 1=
07 +++++++<br>
=C2=A0.../python/python3-django/CVE-2025-32873.patch=C2=A0 =C2=A0 =C2=A0| 1=
07 +++++++<br>
=C2=A0.../python/python3-django/CVE-2025-57833.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 95 ++++++<br>
=C2=A0.../python/<a href=3D"http://python3-django_2.2.28.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_2.2.28.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0.../python/<a href=3D"http://python3-django_3.2.23.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_3.2.23.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 -<br>
=C2=A0.../python/<a href=3D"http://python3-django_3.2.25.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_3.2.25.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 23 ++<br>
=C2=A0.../python/<a href=3D"http://python3-django_4.2.17.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_4.2.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 -<br>
=C2=A0.../python/<a href=3D"http://python3-django_4.2.26.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_4.2.26.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 +<br>
=C2=A0.../recipes-httpd/monkey/<a href=3D"http://monkey_1.6.9.bb" rel=3D"no=
referrer" target=3D"_blank">monkey_1.6.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0.../recipes-webadmin/cockpit/<a href=3D"http://cockpit_220.bb" rel=3D=
"noreferrer" target=3D"_blank">cockpit_220.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0173 files changed, 6620 insertions(+), 455 deletions(-)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp/r=
un-ptest<br>
=C2=A0create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-a=
v/run-ptest<br>
=C2=A0create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-i=
gd/run-ptest<br>
=C2=A0create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/r=
un-ptest<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2022-1253.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp/=
CVE-2019-20503.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/spice/usbredir/CVE=
-2021-3700.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-=
19518.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-08=
48-CVE-2015-4588.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-46=
95.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-46=
96.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-90=
11.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-20=
23-41056.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-20=
23-45145.patch<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/0006-Define-correct-gregs-for-RISCV32.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2024-31227.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2024-31228.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2024-31449.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2024-46981.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2024-51741.patch (94%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2025-21605.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2025-27151.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2025-32023.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2025-46817.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2025-46818.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2025-46819.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2025-48367.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/CVE-2025-49844.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/GNU_SOURCE-7.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/hiredis-use-default-CC-if-it-is-set.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/init-redis-server (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/oe-use-libc-malloc.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/redis.conf (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.0.13 =3D&gt; redis-7.0=
.15}/redis.service (100%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2023-4514=
5.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-3122=
8.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-3144=
9.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-4698=
1.patch<br>
=C2=A0rename meta-oe/recipes-extended/redis/{<a href=3D"http://redis_6.2.12=
.bb" rel=3D"noreferrer" target=3D"_blank">redis_6.2.12.bb</a> =3D&gt; <a hr=
ef=3D"http://redis_6.2.21.bb" rel=3D"noreferrer" target=3D"_blank">redis_6.=
2.21.bb</a>} (88%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{<a href=3D"http://redis_7.0.13=
.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.0.13.bb</a> =3D&gt; <a hr=
ef=3D"http://redis_7.0.15.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.=
0.15.bb</a>} (90%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2=
024-58249.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
020-25690-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
020-25690-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
024-25081-25082.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2023-51=
257.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2025-88=
35.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2025-88=
36.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2025-88=
37.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0001-te=
st-sign.cpp-Fix-C-narrowing-errors.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-201=
8-13440.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-201=
8-17059.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-201=
9-13147.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-202=
2-24599.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/run-pte=
st<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/test-fo=
r-CVE-2015-7747.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29623=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32617=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32815=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334=
-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334=
-4.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/gradm/gradm/0001-make-Defi=
ne-SBINDIR-flag.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/imagemag=
ick-ptest.sh<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/run-ptes=
t<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2023-172=
9.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2025-439=
61-43962.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2025-439=
63.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2025-439=
64.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-811=
4.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nspr/nspr/0001-config-nspr=
-config.in-don-t-pass-LDFLAGS.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2023-52389.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/run-ptest<br>
=C2=A0rename meta-oe/recipes-support/xrdp/{<a href=3D"http://xrdp_0.9.18.bb=
" rel=3D"noreferrer" target=3D"_blank">xrdp_0.9.18.bb</a> =3D&gt; <a href=
=3D"http://xrdp_0.9.18.1.bb" rel=3D"noreferrer" target=3D"_blank">xrdp_0.9.=
18.1.bb</a>} (64%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/CVE-2024-39329.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/CVE-2024-39330.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/CVE-2024-41991.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/CVE-2024-53907.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/CVE-2024-56374.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/CVE-2025-26699.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/CVE-2025-32873.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/CVE-2025-57833.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/CVE-2024-27351.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/CVE-2024-39329.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/CVE-2024-39330.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/CVE-2024-56374.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/CVE-2025-26699.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/CVE-2025-32873.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/CVE-2025-57833.patch<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-django_3.2.23.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
django_3.2.23.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-django_3.2.25.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
django_3.2.25.bb</a><br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-django_4.2.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
django_4.2.17.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-django_4.2.26.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
django_4.2.26.bb</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122459): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122459" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122459</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116693874/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116693874/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000efc60206459c478b--

