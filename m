Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FA3CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 17:46:21 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3214.1792086371837921171
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 10:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R4WNH9N2;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8a83d2706fdso23743657b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 10:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792086371; cv=none;
        d=google.com; s=arc-20260327;
        b=ZhTGo71Gv5+4ndcm7DPyBwcVq3NUJXxuhqE5XFacXXCZNHOCfQV1CEUem4cwiZc/03
         kj3hLU06P0/pBjdP6Mg29toUO1r0DZ4Bf9FDa6LIm/g63vIwTtst0y9rtAoZ3Y1PMdcR
         l5Soa4V+tQo3qsNzrsLghlgcT4Yopjb3WG5Dp5B5rBG4f7rUsLsMKjLzKMSGUg8LFRj2
         pV81c9nh4O6xgRbqCTVOZnd+WwQ21chDsw2HY60IZv159Mo5NZWoqTgJu9eR6ZFBw+sJ
         ZUrEOZqsHQH5Jgc0uWM4UWBfAPC4xZKhMd94UMc1cRXwfTrWI8ZIihzT0G7JFkblUNgf
         wyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CMDV/ulJAk2IWZclG2JFS3rVnfDGGwEr/NXoPh86Ers=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=GM9ajAjGB6LqRoYEDpWvP7pmefYnVRxDYVUpsnx5ydHnyL1pL8XcSEABiRj6wb1ZAy
         FjmyEHG0Dp0yT7kZOWzkih/Idwwx5bm/6AyzovNe8TF4F5IEirvHlsiPeLh2k3laiwAl
         0StEnOD/HXqsub2j0O2aUojPPfw4d0onASTlQvZDkCUGKcEvAUt9NhNHGfez3/Pzzv0F
         3vMxhBQYhKVYCL0BeaFc4qSag/hFUEgMNwoHgaibrcTH7l8pkTMP4hpZ8S1FncCUzOPw
         gklNZyytm+k8iBdx7rtnpkHYfl2rNTHcJ7IcTLyTbCRRtzopajGKNu/2Ajh2tOO9VLmm
         6eMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792086371; x=1792691171; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMDV/ulJAk2IWZclG2JFS3rVnfDGGwEr/NXoPh86Ers=;
        b=R4WNH9N20q/qn7nUT32WusJm0zi+n4D8oPrSe2qtS02L5a+/Uesva4Yo95Pg9PcJ1s
         GtEQ/0udrWson+bjTT3Lu07tf+82BDPZFc7/7FQf48iXVEqEKBgNedxlgeqVlLSTLZEq
         syjFMd5+yXaD6VyfidMs71z1h/lxemycE4NgTs94Ql6Z4E3k6nQU49QsD1acPaBhka60
         orgxcf1YjOpV+j5efHMsiiLZEkDbYooSl6d90Az4I2pLInTENIDNljAbzwxxrsfviuLe
         BJSD75B8sUo+e0TfygstBVtwUOg+4IRmOqfcDmshey0Q9uFrqIs5MBZ5a+X26TL0z5/Q
         Ichg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792086371; x=1792691171;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CMDV/ulJAk2IWZclG2JFS3rVnfDGGwEr/NXoPh86Ers=;
        b=TYWUtxNRCeZxOujrQKUeM3O/ahgx7Y7AOIIm4FCGYg9apz7sqN9sJtB7C05j7NO6Vr
         d2+RSxbRQHgmpKp2FEwb7U5rcOlw1iD+t3jh6+zxsaxXUz1PQoFViepp27mh9WbYcR61
         RuGX5L+TRWuXCuvdzjoEtphlwDDX18sGj2FkgKKZFO1cC2k5+raCMl5zp0A1cZqdzL2f
         Gh8qQOBlo3wzUzGK7Me3z4/jysT8Jetkn01N+A5zckJXsoNUJyVmpALyG1nYU/yrUdrN
         euITIjACZegDL+EFN32i3MG1wFWgvuxZtm6OFdWeWQYzSg3aUTJ0O/eL40+t1t5Gkv/b
         qPUw==
X-Gm-Message-State: AFq9FYI1yPH5KuVP/YkthRhmHP/0M+8M61cFW47BDk937RkILyHb4nss
	FbO6TUOM69ZYeivDb+vk611TMmjDECF3SmTANYF8e0uZUUtckmmU0j4pzHjBbLbaQI2fDnxhLta
	nx5BTRlOMpa8thjWyg4yEmtHofAhY1qpbGOK1
X-Gm-Gg: AYBFou3I+YRLx6jbhjuWrGUPF3xNpSWcpg7mf1OtfBSYkly/QL8O3/go3J2sH1l3LYh
	fDCh6q41DDrwEQzykS/mC9UN6t4yWipTRBWlHrEQ/pHzG57eBfViCFQvyY0EtXeWzsj9gC4aB9E
	2WK84uXPcXpIigwKyD0mv39LrXLZEkNEVbYD/bLursRNsEdkDmJx6QeFr+UzpM+V/aoc/rKS8pA
	4wg1/dUyy/BwylVLsY+/9ESmNwPjcZj4h4EC8q2TIap7CNpv79E/N+kKpHiDrgVb/NUQ0lXCIII
	5N/5UqB68WlkYfZGDoTeHb2C0p35xVtSXGkeM1HLZuZcST3I9pV12bQkqebtC4nAOO3ZItAOjrv
	6uYrNa7C3W0DM3qtVSsOSBTBbMU+1DTCOAHNuaGaKicY2fUh6rWs/6kC//BMjrHRBEu1churUbK
	OgpF12j6I/kCb0fc8eUiX9r/KKMBNQu+LXThqvkAOjcmmLsfsXVKTKfVqzJM1Hhhq5Ku/lsoeK6
	MxkkS3KaVZLSGsEgLG6bPqnhmlilpBlzqq0lmukKMp7Q9m2LAgVs45i6M1itrIzqErr5AHbAVBY
	nmmLOlTORNSf+0OWhs8=
X-Received: by 2002:a05:690c:6d81:b0:8b0:ce9f:2993 with SMTP id
 00721157ae682-8b0ce9f2e02mr13385967b3.5.1792086370311; Thu, 15 Oct 2026
 10:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Oct 2026 10:45:43 -0700
X-Gm-Features: AclHuK9lSMiyL3omQHUOTn8Nz2-lKsGkE6kJaL2nwvHbMjoEY7fC0r9XQS160_w
Message-ID: <CAMKF1srnFkeSBAMmf9LhcrwgdDg=tPLCHGwx1=tOqxC6kXYypQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/82] Blacksail pull request
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008262e2065de49f2e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 17:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131007

--0000000000008262e2065de49f2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Ankur, looks good, the patches in this patchset are not having
[blacksail] tag in subject line, please fix that piece next time. I have
installed this PR

-Khem

On Wed, Oct 14, 2026 at 10:42=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Please merge these changes in blacksail. Tested locally and on autobuilde=
r.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1860
>
> The following changes since commit
> ca3cf5fe14bed658890bac643cced054932fcb51:
>
>   fuse3: Fix ptest for the new test runner (2026-10-01 20:41:15 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib ankurt/blacksail
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dankurt/bl=
acksail
>
> for you to fetch changes up to a9d69bc066bf9498397db27902c287dd666fdfd4:
>
>   lvgl-demo-fb: fix SRCREV (2026-10-14 09:26:03 +1300)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (74):
>   readme: update maintainer
>   libwebsockets: patch CVE-2026-19773
>   capnproto: ignore CVE-2026-59704
>   civetweb: ignore CVE-2026-5789
>   dovecot: ignore already fixed CVEs
>   eject: ignore CVE-2026-28065
>   gpsd: patch CVE-2026-58459
>   bcc: correct CVE_PRODUCT mapping
>   dool: patch CVE-2026-56651
>   dool: patch CVE-2026-56652
>   haveged: ignore CVE-2026-41054
>   gpm: ignore CVE-2025-4558
>   gerbera: ignore CVE-2025-23386
>   libde265: patch CVE-2026-49295
>   libde265: patch CVE-2026-49337
>   libde265: patch CVE-2026-49346
>   libde265: patch CVE-2026-54240 and CVE-2026-54241
>   hdf5: patch CVE-2026-17572
>   hdf5: patch CVE-2026-17573
>   hdf5: patch CVE-2026-17574
>   hdf5: patch CVE-2026-19025
>   iniparser: mark CVE-2025-0633 pached
>   jq: ignore already fixed CVEs
>   libiec61850: mark CVE-2024-45969 patched
>   libnfs: patch CVE-2026-53689
>   libnfs: patch CVE-2026-57918
>   libssh: ignore CVE-2025-14821
>   libssh: mark CVEs patched
>   libssh: ignore CVE-2026-59851
>   miniupnpd: patch CVE-2026-107159
>   libyang: patch CVE-2026-41401
>   tinyproxy: patch CVE-2026-31842
>   tinyproxy: patch CVE-2026-54387
>   tinyproxy: patch CVE-2026-55202
>   wolfssl: mark CVEs patched
>   python3-gunicorn: mark CVE-2024-1135 patched
>   pgpool2: upgrade 4.7.2 -> 4.7.3
>   smarty: upgrade 5.8.4 -> 5.8.5
>   python3-astroid: upgrade 4.3.2 -> 4.3.3
>   python3-django: upgrade 6.0.8 -> 6.0.9
>   python3-django: upgrade 5.2.17 -> 5.2.18
>   python3-tzdata: upgrade 2026.4 -> 2026.5
>   python3-werkzeug: upgrade 3.1.8 -> 3.1.9
>   python3-zeroconf: upgrade 0.151.3 -> 0.151.5
>   swagger-ui: upgrade 5.33.0 -> 5.33.1
>   openvpn: ignore CVE-2026-84256
>   openvpn: patch CVE-2026-88964
>   openvpn: patch CVE-2026-84790
>   python3-eventlet: mark CVE-2023-29483 fixed
>   cjson: patch CVE-2026-87933
>   smarty: mark CVE-2026-82531 patched
>   ntopng: patch CVE-2026-84990
>   ntopng: patch CVE-2026-86090 and CVE-2026-86091
>   sngrep: patch CVE-2026-90558
>   strongswan: patch CVE-2026-78123
>   strongswan: patch CVE-2026-78124
>   strongswan: patch CVE-2026-78126
>   strongswan: patch CVE-2026-78127
>   strongswan: patch CVE-2026-78129
>   strongswan: patch CVE-2026-78133
>   strongswan: patch CVE-2026-78131
>   strongswan: patch CVE-2026-78130
>   strongswan: patch CVE-2026-78132
>   strongswan: patch CVE-2026-78135
>   strongswan: patch CVE-2026-78134
>   tesseract: patch CVE-2026-88052
>   tesseract: patch CVE-2026-88048
>   tesseract: patch CVE-2026-88049
>   tesseract: patch CVE-2026-88050
>   tesseract: patch CVE-2026-88047
>   tesseract: patch CVE-2026-88051
>   tesseract: patch CVE-2026-88054
>   gpsd: patch CVE-2026-60122
>   lvgl-demo-fb: fix SRCREV
>
> Bastian Krause (1):
>   pcsc-lite: create pcscd user and group also via useradd
>
> Markus Volk (5):
>   Revert "libpwquality: remove recipe (moved to oe-core)"
>   Revert "gnome-shell-extensions: upgrade 50.3 -> 51.0"
>   Revert "gnome-shell: upgrade 50.4 -> 51.0"
>   Revert "mutter: upgrade 50.4 -> 51.0"
>   apache2: fix build with OpenSSL 4
>
> Peter Marko (2):
>   libwebsockets: patch CVE-2026-78161
>   nginx: set status for CVE-2026-90439
>
>  README.md                                     |   2 +-
>  meta-filesystems/README.md                    |  10 +-
>  meta-gnome/README.md                          |  10 +-
>  ...51.0.bb =3D> gnome-shell-extensions_50.3.bb} |   2 +-
>  ...ver-Fix-build-failure-with-libical-4.patch |  44 ++
>  ...nome-shell_51.0.bb =3D> gnome-shell_50.4.bb} |   7 +-
>  .../mutter/{mutter_51.0.bb =3D> mutter_50.4.bb} |  17 +-
>  meta-initramfs/README.md                      |   8 +-
>  meta-multimedia/README.md                     |  10 +-
>  .../gerbera/gerbera_3.3.0.bb                  |   2 +
>  .../libde265/libde265/CVE-2026-49295.patch    |  41 +
>  .../libde265/libde265/CVE-2026-49337.patch    |  53 ++
>  .../libde265/libde265/CVE-2026-49346.patch    | 102 +++
>  .../CVE-2026-54240-CVE-2026-54241.patch       | 426 +++++++++++
>  .../libde265/libde265_1.0.19.bb               |   7 +-
>  meta-networking/README.md                     |   8 +-
>  .../civetweb/civetweb_1.16.bb                 |   1 +
>  .../libiec61850/libiec61850_1.6.2.1.bb        |   2 +
>  .../miniupnpd/files/CVE-2026-107159.patch     |  78 ++
>  .../miniupnpd/miniupnpd_2.3.11.bb             |   1 +
>  .../wolfssl/wolfssl_5.9.4.bb                  |   2 +
>  .../recipes-support/dovecot/dovecot_2.4.5.bb  |   8 +
>  .../ntopng/files/CVE-2026-84990.patch         |  53 ++
>  .../files/CVE-2026-86090-CVE-2026-86091.patch |  67 ++
>  .../recipes-support/ntopng/ntopng_6.6.bb      |   2 +
>  .../openvpn/openvpn/CVE-2026-84790.patch      | 361 +++++++++
>  .../openvpn/openvpn/CVE-2026-88964.patch      |  78 ++
>  .../recipes-support/openvpn/openvpn_2.7.7.bb  |   3 +
>  .../{pgpool2_4.7.2.bb =3D> pgpool2_4.7.3.bb}    |   2 +-
>  .../sngrep/sngrep/CVE-2026-90558.patch        |  84 +++
>  .../recipes-support/sngrep/sngrep_1.8.4.bb    |   4 +-
>  .../strongswan/CVE-2026-78123.patch           |  51 ++
>  .../strongswan/CVE-2026-78124.patch           |  34 +
>  .../strongswan/CVE-2026-78126.patch           |  37 +
>  .../strongswan/CVE-2026-78127.patch           | 115 +++
>  .../strongswan/CVE-2026-78129.patch           | 155 ++++
>  .../strongswan/CVE-2026-78130.patch           |  49 ++
>  .../strongswan/CVE-2026-78131.patch           |  86 +++
>  .../strongswan/CVE-2026-78132.patch           |  75 ++
>  .../strongswan/CVE-2026-78133.patch           | 620 +++++++++++++++
>  .../strongswan/CVE-2026-78134.patch           | 712 ++++++++++++++++++
>  .../strongswan/CVE-2026-78135.patch           |  72 ++
>  .../strongswan/strongswan_6.0.7.bb            |  14 +-
>  .../tinyproxy/tinyproxy/CVE-2026-31842.patch  |  33 +
>  .../tinyproxy/tinyproxy/CVE-2026-54387.patch  |  37 +
>  .../tinyproxy/tinyproxy/CVE-2026-55202.patch  | 107 +++
>  .../tinyproxy/tinyproxy_1.11.3.bb             |   3 +
>  meta-oe/README.md                             |   8 +-
>  .../recipes-devtools/bcc/bcc_0.37.0.bb        |   2 +
>  .../libnfs/libnfs/CVE-2026-53689.patch        |  34 +
>  .../libnfs/libnfs/CVE-2026-57918.patch        |  34 +
>  .../libnfs/libnfs_6.0.2.bb                    |   2 +
>  .../libwebsockets/CVE-2026-19773.patch        |  31 +
>  .../libwebsockets/CVE-2026-78161.patch        |  45 ++
>  .../libwebsockets/libwebsockets_4.5.8.bb      |   2 +
>  .../packagegroups/packagegroup-meta-oe.bb     |   1 +
>  .../capnproto/capnproto_1.5.0.bb              |   1 +
>  .../cjson/cjson/CVE-2026-87933.patch          | 110 +++
>  .../recipes-devtools/cjson/cjson_1.7.19.bb    |   1 +
>  meta-oe/recipes-devtools/jq/jq_1.8.2.bb       |   4 +
>  .../haveged/haveged_1.9.26.bb                 |   2 +
>  ...-Use-setuptools-instead-of-distutils.patch |  78 ++
>  ...02-Makefile.am-respect-PYTHONSITEDIR.patch |  26 +
>  .../libpwquality/libpwquality_1.4.5.bb        |  39 +
>  .../libyang/libyang/CVE-2026-41401.patch      |  43 ++
>  .../libyang/libyang_3.13.6.bb                 |   1 +
>  .../lvgl/lvgl-demo-fb_9.5.0.bb                |   2 +-
>  .../tesseract/tesseract/CVE-2026-88047.patch  | 225 ++++++
>  .../tesseract/tesseract/CVE-2026-88048.patch  | 227 ++++++
>  .../tesseract/tesseract/CVE-2026-88049.patch  | 315 ++++++++
>  .../tesseract/tesseract/CVE-2026-88050.patch  | 209 +++++
>  .../tesseract/tesseract/CVE-2026-88051.patch  | 184 +++++
>  .../tesseract/tesseract/CVE-2026-88052.patch  | 165 ++++
>  .../tesseract/tesseract/CVE-2026-88054.patch  | 274 +++++++
>  .../tesseract/tesseract_5.5.3.bb              |  11 +-
>  .../gpsd/gpsd/CVE-2026-58459-1.patch          |  48 ++
>  .../gpsd/gpsd/CVE-2026-58459-2.patch          |  46 ++
>  .../gpsd/gpsd/CVE-2026-58459-3.patch          |  58 ++
>  .../gpsd/gpsd/CVE-2026-60122.patch            |  45 ++
>  .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |   4 +
>  .../dool/dool/CVE-2026-56651.patch            |  47 ++
>  .../dool/dool/CVE-2026-56652.patch            |  35 +
>  meta-oe/recipes-support/dool/dool_1.3.8.bb    |   5 +-
>  meta-oe/recipes-support/eject/eject_2.1.5.bb  |   2 +
>  meta-oe/recipes-support/gpm/gpm_git.bb        |   2 +
>  .../hdf5/files/CVE-2026-17572.patch           | 253 +++++++
>  .../hdf5/files/CVE-2026-17573.patch           |  53 ++
>  .../hdf5/files/CVE-2026-17574.patch           |  65 ++
>  .../hdf5/files/CVE-2026-19025.patch           | 112 +++
>  meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   4 +
>  .../iniparser/iniparser_4.2.6.bb              |   2 +
>  .../recipes-support/libssh/libssh_0.11.5.bb   |   9 +
>  .../pcsc-lite/pcsc-lite_2.5.1.bb              |   5 +-
>  .../{smarty_5.8.4.bb =3D> smarty_5.8.5.bb}      |   3 +-
>  meta-perl/README.md                           |  10 +-
>  meta-python/README.md                         |  12 +-
>  ...roid_4.3.2.bb =3D> python3-astroid_4.3.3.bb} |   2 +-
>  ...ngo_5.2.17.bb =3D> python3-django_5.2.18.bb} |   2 +-
>  ...jango_6.0.8.bb =3D> python3-django_6.0.9.bb} |   2 +-
>  .../python/python3-eventlet_0.41.2.bb         |   2 +
>  .../python/python3-gunicorn_26.2.0.bb         |   2 +
>  ...ata_2026.4.bb =3D> python3-tzdata_2026.5.bb} |   2 +-
>  ...eug_3.1.8.bb =3D> python3-werkzeug_3.1.9.bb} |   2 +-
>  ...0.151.3.bb =3D> python3-zeroconf_0.151.5.bb} |   2 +-
>  meta-webserver/README.md                      |  10 +-
>  ...gger-ui_5.33.0.bb =3D> swagger-ui_5.33.1.bb} |   2 +-
>  ...mod_md-Add-OpenSSL-4.0-compatibility.patch |  47 ++
>  .../recipes-httpd/apache2/apache2_2.4.68.bb   |   1 +
>  .../recipes-httpd/nginx/nginx_1.30.5.bb       |   2 +
>  meta-xfce/README.md                           |  11 +-
>  110 files changed, 6601 insertions(+), 79 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-shell/{
> gnome-shell-extensions_51.0.bb =3D> gnome-shell-extensions_50.3.bb} (85%)
>  create mode 100644
> meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calendar-server-Fix=
-build-failure-with-libical-4.patch
>  rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_51.0.bb =3D>
> gnome-shell_50.4.bb} (86%)
>  rename meta-gnome/recipes-gnome/mutter/{mutter_51.0.bb =3D> mutter_50.4.=
bb}
> (85%)
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-54240-CVE-2=
026-54241.patch
>  create mode 100644
> meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patc=
h
>  create mode 100644
> meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
>  create mode 100644
> meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-8609=
1.patch
>  create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2026-84790.patch
>  create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2026-88964.patch
>  rename meta-networking/recipes-support/pgpool2/{pgpool2_4.7.2.bb =3D>
> pgpool2_4.7.3.bb} (95%)
>  create mode 100644
> meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patc=
h
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-55202.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.p=
atch
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-78161.p=
atch
>  create mode 100644
> meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch
>  create mode 100644
> meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-o=
f-distutils.patch
>  create mode 100644
> meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTH=
ONSITEDIR.patch
>  create mode 100644 meta-oe/recipes-extended/libpwquality/
> libpwquality_1.4.5.bb
>  create mode 100644
> meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88049.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
>  create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56651.patc=
h
>  create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56652.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.pat=
ch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.pat=
ch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.pat=
ch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19025.pat=
ch
>  rename meta-oe/recipes-support/smarty/{smarty_5.8.4.bb =3D> smarty_5.8.5=
.bb}
> (90%)
>  rename meta-python/recipes-devtools/python/{python3-astroid_4.3.2.bb =3D=
>
> python3-astroid_4.3.3.bb} (89%)
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.17.bb =3D=
>
> python3-django_5.2.18.bb} (61%)
>  rename meta-python/recipes-devtools/python/{python3-django_6.0.8.bb =3D>
> python3-django_6.0.9.bb} (75%)
>  rename meta-python/recipes-devtools/python/{python3-tzdata_2026.4.bb =3D=
>
> python3-tzdata_2026.5.bb} (86%)
>  rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.8.bb =
=3D>
> python3-werkzeug_3.1.9.bb} (91%)
>  rename meta-python/recipes-devtools/python/{python3-zeroconf_0.151.3.bb
> =3D> python3-zeroconf_0.151.5.bb} (88%)
>  rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.0.bb
> =3D> swagger-ui_5.33.1.bb} (94%)
>  create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-=
compatibility.patch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130920):
> https://lists.openembedded.org/g/openembedded-devel/message/130920
> Mute This Topic: https://lists.openembedded.org/mt/121765065/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008262e2065de49f2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Ankur, looks good, the patches in this patchset are=
 not having [blacksail] tag in subject line, please fix that piece next tim=
e. I have installed this PR<div><br></div><div>-Khem</div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Oct 14, 2026 at 10:42=E2=80=AFPM Ankur Tyagi via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;ankur.tyagi85=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com=
" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
Please merge these changes in blacksail. Tested locally and on autobuilder.=
<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1860" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1860</a><br>
<br>
The following changes since commit ca3cf5fe14bed658890bac643cced054932fcb51=
:<br>
<br>
=C2=A0 fuse3: Fix ptest for the new test runner (2026-10-01 20:41:15 -0700)=
<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> ankurt/blacksail<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Dankurt/blacksail" rel=3D"noreferrer" target=3D"_blank">https://git.o=
penembedded.org/meta-openembedded-contrib/log/?h=3Dankurt/blacksail</a><br>
<br>
for you to fetch changes up to a9d69bc066bf9498397db27902c287dd666fdfd4:<br=
>
<br>
=C2=A0 lvgl-demo-fb: fix SRCREV (2026-10-14 09:26:03 +1300)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (74):<br>
=C2=A0 readme: update maintainer<br>
=C2=A0 libwebsockets: patch CVE-2026-19773<br>
=C2=A0 capnproto: ignore CVE-2026-59704<br>
=C2=A0 civetweb: ignore CVE-2026-5789<br>
=C2=A0 dovecot: ignore already fixed CVEs<br>
=C2=A0 eject: ignore CVE-2026-28065<br>
=C2=A0 gpsd: patch CVE-2026-58459<br>
=C2=A0 bcc: correct CVE_PRODUCT mapping<br>
=C2=A0 dool: patch CVE-2026-56651<br>
=C2=A0 dool: patch CVE-2026-56652<br>
=C2=A0 haveged: ignore CVE-2026-41054<br>
=C2=A0 gpm: ignore CVE-2025-4558<br>
=C2=A0 gerbera: ignore CVE-2025-23386<br>
=C2=A0 libde265: patch CVE-2026-49295<br>
=C2=A0 libde265: patch CVE-2026-49337<br>
=C2=A0 libde265: patch CVE-2026-49346<br>
=C2=A0 libde265: patch CVE-2026-54240 and CVE-2026-54241<br>
=C2=A0 hdf5: patch CVE-2026-17572<br>
=C2=A0 hdf5: patch CVE-2026-17573<br>
=C2=A0 hdf5: patch CVE-2026-17574<br>
=C2=A0 hdf5: patch CVE-2026-19025<br>
=C2=A0 iniparser: mark CVE-2025-0633 pached<br>
=C2=A0 jq: ignore already fixed CVEs<br>
=C2=A0 libiec61850: mark CVE-2024-45969 patched<br>
=C2=A0 libnfs: patch CVE-2026-53689<br>
=C2=A0 libnfs: patch CVE-2026-57918<br>
=C2=A0 libssh: ignore CVE-2025-14821<br>
=C2=A0 libssh: mark CVEs patched<br>
=C2=A0 libssh: ignore CVE-2026-59851<br>
=C2=A0 miniupnpd: patch CVE-2026-107159<br>
=C2=A0 libyang: patch CVE-2026-41401<br>
=C2=A0 tinyproxy: patch CVE-2026-31842<br>
=C2=A0 tinyproxy: patch CVE-2026-54387<br>
=C2=A0 tinyproxy: patch CVE-2026-55202<br>
=C2=A0 wolfssl: mark CVEs patched<br>
=C2=A0 python3-gunicorn: mark CVE-2024-1135 patched<br>
=C2=A0 pgpool2: upgrade 4.7.2 -&gt; 4.7.3<br>
=C2=A0 smarty: upgrade 5.8.4 -&gt; 5.8.5<br>
=C2=A0 python3-astroid: upgrade 4.3.2 -&gt; 4.3.3<br>
=C2=A0 python3-django: upgrade 6.0.8 -&gt; 6.0.9<br>
=C2=A0 python3-django: upgrade 5.2.17 -&gt; 5.2.18<br>
=C2=A0 python3-tzdata: upgrade 2026.4 -&gt; 2026.5<br>
=C2=A0 python3-werkzeug: upgrade 3.1.8 -&gt; 3.1.9<br>
=C2=A0 python3-zeroconf: upgrade 0.151.3 -&gt; 0.151.5<br>
=C2=A0 swagger-ui: upgrade 5.33.0 -&gt; 5.33.1<br>
=C2=A0 openvpn: ignore CVE-2026-84256<br>
=C2=A0 openvpn: patch CVE-2026-88964<br>
=C2=A0 openvpn: patch CVE-2026-84790<br>
=C2=A0 python3-eventlet: mark CVE-2023-29483 fixed<br>
=C2=A0 cjson: patch CVE-2026-87933<br>
=C2=A0 smarty: mark CVE-2026-82531 patched<br>
=C2=A0 ntopng: patch CVE-2026-84990<br>
=C2=A0 ntopng: patch CVE-2026-86090 and CVE-2026-86091<br>
=C2=A0 sngrep: patch CVE-2026-90558<br>
=C2=A0 strongswan: patch CVE-2026-78123<br>
=C2=A0 strongswan: patch CVE-2026-78124<br>
=C2=A0 strongswan: patch CVE-2026-78126<br>
=C2=A0 strongswan: patch CVE-2026-78127<br>
=C2=A0 strongswan: patch CVE-2026-78129<br>
=C2=A0 strongswan: patch CVE-2026-78133<br>
=C2=A0 strongswan: patch CVE-2026-78131<br>
=C2=A0 strongswan: patch CVE-2026-78130<br>
=C2=A0 strongswan: patch CVE-2026-78132<br>
=C2=A0 strongswan: patch CVE-2026-78135<br>
=C2=A0 strongswan: patch CVE-2026-78134<br>
=C2=A0 tesseract: patch CVE-2026-88052<br>
=C2=A0 tesseract: patch CVE-2026-88048<br>
=C2=A0 tesseract: patch CVE-2026-88049<br>
=C2=A0 tesseract: patch CVE-2026-88050<br>
=C2=A0 tesseract: patch CVE-2026-88047<br>
=C2=A0 tesseract: patch CVE-2026-88051<br>
=C2=A0 tesseract: patch CVE-2026-88054<br>
=C2=A0 gpsd: patch CVE-2026-60122<br>
=C2=A0 lvgl-demo-fb: fix SRCREV<br>
<br>
Bastian Krause (1):<br>
=C2=A0 pcsc-lite: create pcscd user and group also via useradd<br>
<br>
Markus Volk (5):<br>
=C2=A0 Revert &quot;libpwquality: remove recipe (moved to oe-core)&quot;<br=
>
=C2=A0 Revert &quot;gnome-shell-extensions: upgrade 50.3 -&gt; 51.0&quot;<b=
r>
=C2=A0 Revert &quot;gnome-shell: upgrade 50.4 -&gt; 51.0&quot;<br>
=C2=A0 Revert &quot;mutter: upgrade 50.4 -&gt; 51.0&quot;<br>
=C2=A0 apache2: fix build with OpenSSL 4<br>
<br>
Peter Marko (2):<br>
=C2=A0 libwebsockets: patch CVE-2026-78161<br>
=C2=A0 nginx: set status for CVE-2026-90439<br>
<br>
=C2=A0README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta-filesystems/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0meta-gnome/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0...<a href=3D"http://51.0.bb" rel=3D"noreferrer" target=3D"_blank">51=
.0.bb</a> =3D&gt; <a href=3D"http://gnome-shell-extensions_50.3.bb" rel=3D"=
noreferrer" target=3D"_blank">gnome-shell-extensions_50.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...ver-Fix-build-failure-with-libical-4.patch |=C2=A0 44 ++<br>
=C2=A0...<a href=3D"http://nome-shell_51.0.bb" rel=3D"noreferrer" target=3D=
"_blank">nome-shell_51.0.bb</a> =3D&gt; <a href=3D"http://gnome-shell_50.4.=
bb" rel=3D"noreferrer" target=3D"_blank">gnome-shell_50.4.bb</a>} |=C2=A0 =
=C2=A07 +-<br>
=C2=A0.../mutter/{<a href=3D"http://mutter_51.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mutter_51.0.bb</a> =3D&gt; <a href=3D"http://mutter_50.4.bb" =
rel=3D"noreferrer" target=3D"_blank">mutter_50.4.bb</a>} |=C2=A0 17 +-<br>
=C2=A0meta-initramfs/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0meta-multimedia/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0.../gerbera/<a href=3D"http://gerbera_3.3.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gerbera_3.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../libde265/libde265/CVE-2026-49295.patch=C2=A0 =C2=A0 |=C2=A0 41 +<=
br>
=C2=A0.../libde265/libde265/CVE-2026-49337.patch=C2=A0 =C2=A0 |=C2=A0 53 ++=
<br>
=C2=A0.../libde265/libde265/CVE-2026-49346.patch=C2=A0 =C2=A0 | 102 +++<br>
=C2=A0.../CVE-2026-54240-CVE-2026-54241.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
26 +++++++++++<br>
=C2=A0.../libde265/<a href=3D"http://libde265_1.0.19.bb" rel=3D"noreferrer"=
 target=3D"_blank">libde265_1.0.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0meta-networking/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0.../civetweb/<a href=3D"http://civetweb_1.16.bb" rel=3D"noreferrer" t=
arget=3D"_blank">civetweb_1.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../libiec61850/<a href=3D"http://libiec61850_1.6.2.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">libiec61850_1.6.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../miniupnpd/files/CVE-2026-107159.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
78 ++<br>
=C2=A0.../miniupnpd/<a href=3D"http://miniupnpd_2.3.11.bb" rel=3D"noreferre=
r" target=3D"_blank">miniupnpd_2.3.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../wolfssl/<a href=3D"http://wolfssl_5.9.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">wolfssl_5.9.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-support/dovecot/<a href=3D"http://dovecot_2.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">dovecot_2.4.5.bb</a>=C2=A0 |=C2=A0 =C2=A0=
8 +<br>
=C2=A0.../ntopng/files/CVE-2026-84990.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 53 ++<br>
=C2=A0.../files/CVE-2026-86090-CVE-2026-86091.patch |=C2=A0 67 ++<br>
=C2=A0.../recipes-support/ntopng/<a href=3D"http://ntopng_6.6.bb" rel=3D"no=
referrer" target=3D"_blank">ntopng_6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0.../openvpn/openvpn/CVE-2026-84790.patch=C2=A0 =C2=A0 =C2=A0 | 361 ++=
+++++++<br>
=C2=A0.../openvpn/openvpn/CVE-2026-88964.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
78 ++<br>
=C2=A0.../recipes-support/openvpn/<a href=3D"http://openvpn_2.7.7.bb" rel=
=3D"noreferrer" target=3D"_blank">openvpn_2.7.7.bb</a>=C2=A0 |=C2=A0 =C2=A0=
3 +<br>
=C2=A0.../{<a href=3D"http://pgpool2_4.7.2.bb" rel=3D"noreferrer" target=3D=
"_blank">pgpool2_4.7.2.bb</a> =3D&gt; <a href=3D"http://pgpool2_4.7.3.bb" r=
el=3D"noreferrer" target=3D"_blank">pgpool2_4.7.3.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../sngrep/sngrep/CVE-2026-90558.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 84 +++<br>
=C2=A0.../recipes-support/sngrep/<a href=3D"http://sngrep_1.8.4.bb" rel=3D"=
noreferrer" target=3D"_blank">sngrep_1.8.4.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0.../strongswan/CVE-2026-78123.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 51 ++<br>
=C2=A0.../strongswan/CVE-2026-78124.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 34 +<br>
=C2=A0.../strongswan/CVE-2026-78126.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 37 +<br>
=C2=A0.../strongswan/CVE-2026-78127.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 115 +++<br>
=C2=A0.../strongswan/CVE-2026-78129.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 155 ++++<br>
=C2=A0.../strongswan/CVE-2026-78130.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 49 ++<br>
=C2=A0.../strongswan/CVE-2026-78131.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 86 +++<br>
=C2=A0.../strongswan/CVE-2026-78132.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 75 ++<br>
=C2=A0.../strongswan/CVE-2026-78133.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 620 +++++++++++++++<br>
=C2=A0.../strongswan/CVE-2026-78134.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 712 ++++++++++++++++++<br>
=C2=A0.../strongswan/CVE-2026-78135.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 72 ++<br>
=C2=A0.../strongswan/<a href=3D"http://strongswan_6.0.7.bb" rel=3D"noreferr=
er" target=3D"_blank">strongswan_6.0.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-31842.patch=C2=A0 |=C2=A0 33 +<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-54387.patch=C2=A0 |=C2=A0 37 +<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-55202.patch=C2=A0 | 107 +++<br>
=C2=A0.../tinyproxy/<a href=3D"http://tinyproxy_1.11.3.bb" rel=3D"noreferre=
r" target=3D"_blank">tinyproxy_1.11.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0meta-oe/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0.../recipes-devtools/bcc/<a href=3D"http://bcc_0.37.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">bcc_0.37.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +<br>
=C2=A0.../libnfs/libnfs/CVE-2026-53689.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 34 +<br>
=C2=A0.../libnfs/libnfs/CVE-2026-57918.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 34 +<br>
=C2=A0.../libnfs/<a href=3D"http://libnfs_6.0.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libnfs_6.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../libwebsockets/CVE-2026-19773.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 31 +<br>
=C2=A0.../libwebsockets/CVE-2026-78161.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 45 ++<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.5.8.bb" rel=3D"no=
referrer" target=3D"_blank">libwebsockets_4.5.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-oe.bb" rel=3D"n=
oreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../capnproto/<a href=3D"http://capnproto_1.5.0.bb" rel=3D"noreferrer=
" target=3D"_blank">capnproto_1.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../cjson/cjson/CVE-2026-87933.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 110 +++<br>
=C2=A0.../recipes-devtools/cjson/<a href=3D"http://cjson_1.7.19.bb" rel=3D"=
noreferrer" target=3D"_blank">cjson_1.7.19.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +<br>
=C2=A0.../haveged/<a href=3D"http://haveged_1.9.26.bb" rel=3D"noreferrer" t=
arget=3D"_blank">haveged_1.9.26.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0...-Use-setuptools-instead-of-distutils.patch |=C2=A0 78 ++<br>
=C2=A0...02-Makefile.am-respect-PYTHONSITEDIR.patch |=C2=A0 26 +<br>
=C2=A0.../libpwquality/<a href=3D"http://libpwquality_1.4.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">libpwquality_1.4.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 39 +<br>
=C2=A0.../libyang/libyang/CVE-2026-41401.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
43 ++<br>
=C2=A0.../libyang/<a href=3D"http://libyang_3.13.6.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libyang_3.13.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../lvgl/<a href=3D"http://lvgl-demo-fb_9.5.0.bb" rel=3D"noreferrer" =
target=3D"_blank">lvgl-demo-fb_9.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88047.patch=C2=A0 | 225 ++++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88048.patch=C2=A0 | 227 ++++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88049.patch=C2=A0 | 315 ++++++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88050.patch=C2=A0 | 209 +++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88051.patch=C2=A0 | 184 +++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88052.patch=C2=A0 | 165 ++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88054.patch=C2=A0 | 274 +++++++<br>
=C2=A0.../tesseract/<a href=3D"http://tesseract_5.5.3.bb" rel=3D"noreferrer=
" target=3D"_blank">tesseract_5.5.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 11 +-<br>
=C2=A0.../gpsd/gpsd/CVE-2026-58459-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 48 ++<br>
=C2=A0.../gpsd/gpsd/CVE-2026-58459-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 46 ++<br>
=C2=A0.../gpsd/gpsd/CVE-2026-58459-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 58 ++<br>
=C2=A0.../gpsd/gpsd/CVE-2026-60122.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 45 ++<br>
=C2=A0.../recipes-navigation/gpsd/<a href=3D"http://gpsd_3.27.5.bb" rel=3D"=
noreferrer" target=3D"_blank">gpsd_3.27.5.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +<br>
=C2=A0.../dool/dool/CVE-2026-56651.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 47 ++<br>
=C2=A0.../dool/dool/CVE-2026-56652.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 35 +<br>
=C2=A0meta-oe/recipes-support/dool/<a href=3D"http://dool_1.3.8.bb" rel=3D"=
noreferrer" target=3D"_blank">dool_1.3.8.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
5 +-<br>
=C2=A0meta-oe/recipes-support/eject/<a href=3D"http://eject_2.1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">eject_2.1.5.bb</a>=C2=A0 |=C2=A0 =C2=A02 =
+<br>
=C2=A0meta-oe/recipes-support/gpm/<a href=3D"http://gpm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">gpm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +<br>
=C2=A0.../hdf5/files/CVE-2026-17572.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 253 +++++++<br>
=C2=A0.../hdf5/files/CVE-2026-17573.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 53 ++<br>
=C2=A0.../hdf5/files/CVE-2026-17574.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 65 ++<br>
=C2=A0.../hdf5/files/CVE-2026-19025.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 112 +++<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">hdf5_2.0.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
4 +<br>
=C2=A0.../iniparser/<a href=3D"http://iniparser_4.2.6.bb" rel=3D"noreferrer=
" target=3D"_blank">iniparser_4.2.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.11.5.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.11.5.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A09 +<br>
=C2=A0.../pcsc-lite/<a href=3D"http://pcsc-lite_2.5.1.bb" rel=3D"noreferrer=
" target=3D"_blank">pcsc-lite_2.5.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0.../{<a href=3D"http://smarty_5.8.4.bb" rel=3D"noreferrer" target=3D"=
_blank">smarty_5.8.4.bb</a> =3D&gt; <a href=3D"http://smarty_5.8.5.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_5.8.5.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A03 +-<br>
=C2=A0meta-perl/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0meta-python/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0...<a href=3D"http://roid_4.3.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">roid_4.3.2.bb</a> =3D&gt; <a href=3D"http://python3-astroid_4.3.3.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-astroid_4.3.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ngo_5.2.17.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_5.2.17.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.18.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_5.2.18.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://jango_6.0.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">jango_6.0.8.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.9.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.9.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-eventlet_0.41.2.bb" rel=3D"noref=
errer" target=3D"_blank">python3-eventlet_0.41.2.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-gunicorn_26.2.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-gunicorn_26.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0...<a href=3D"http://ata_2026.4.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ata_2026.4.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.5.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-tzdata_2026.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://eug_3.1.8.bb" rel=3D"noreferrer" target=3D"_blan=
k">eug_3.1.8.bb</a> =3D&gt; <a href=3D"http://python3-werkzeug_3.1.9.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-werkzeug_3.1.9.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://0.151.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>0.151.3.bb</a> =3D&gt; <a href=3D"http://python3-zeroconf_0.151.5.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-zeroconf_0.151.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta-webserver/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0...<a href=3D"http://gger-ui_5.33.0.bb" rel=3D"noreferrer" target=3D"=
_blank">gger-ui_5.33.0.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.33.1.b=
b" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.33.1.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...mod_md-Add-OpenSSL-4.0-compatibility.patch |=C2=A0 47 ++<br>
=C2=A0.../recipes-httpd/apache2/<a href=3D"http://apache2_2.4.68.bb" rel=3D=
"noreferrer" target=3D"_blank">apache2_2.4.68.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.30.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.30.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +<br>
=C2=A0meta-xfce/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
=C2=A0110 files changed, 6601 insertions(+), 79 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-shell/{<a href=3D"http://gnome-=
shell-extensions_51.0.bb" rel=3D"noreferrer" target=3D"_blank">gnome-shell-=
extensions_51.0.bb</a> =3D&gt; <a href=3D"http://gnome-shell-extensions_50.=
3.bb" rel=3D"noreferrer" target=3D"_blank">gnome-shell-extensions_50.3.bb</=
a>} (85%)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0=
002-calendar-server-Fix-build-failure-with-libical-4.patch<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-shell/{<a href=3D"http://gnome-=
shell_51.0.bb" rel=3D"noreferrer" target=3D"_blank">gnome-shell_51.0.bb</a>=
 =3D&gt; <a href=3D"http://gnome-shell_50.4.bb" rel=3D"noreferrer" target=
=3D"_blank">gnome-shell_50.4.bb</a>} (86%)<br>
=C2=A0rename meta-gnome/recipes-gnome/mutter/{<a href=3D"http://mutter_51.0=
.bb" rel=3D"noreferrer" target=3D"_blank">mutter_51.0.bb</a> =3D&gt; <a hre=
f=3D"http://mutter_50.4.bb" rel=3D"noreferrer" target=3D"_blank">mutter_50.=
4.bb</a>} (85%)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2026-49295.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2026-49337.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2026-49346.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2026-54240-CVE-2026-54241.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/miniupnpd/fil=
es/CVE-2026-107159.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2=
026-84990.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2=
026-86090-CVE-2026-86091.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CV=
E-2026-84790.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CV=
E-2026-88964.patch<br>
=C2=A0rename meta-networking/recipes-support/pgpool2/{<a href=3D"http://pgp=
ool2_4.7.2.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.7.2.bb</a> =
=3D&gt; <a href=3D"http://pgpool2_4.7.3.bb" rel=3D"noreferrer" target=3D"_b=
lank">pgpool2_4.7.3.bb</a>} (95%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/sngrep/sngrep/CVE-=
2026-90558.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78123.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78124.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78126.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78127.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78129.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78130.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78131.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78132.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78133.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78134.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78135.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-31842.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-54387.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-55202.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-202=
6-53689.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-202=
6-57918.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-19773.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-78161.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2026-8793=
3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-U=
se-setuptools-instead-of-distutils.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libpwquality/files/0002-M=
akefile.am-respect-PYTHONSITEDIR.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libpwquality/<a href=3D"h=
ttp://libpwquality_1.4.5.bb" rel=3D"noreferrer" target=3D"_blank">libpwqual=
ity_1.4.5.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-=
41401.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88047.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88048.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88049.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88050.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88051.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88052.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88054.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-5845=
9-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-5845=
9-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-5845=
9-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-6012=
2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56651.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56652.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19025.=
patch<br>
=C2=A0rename meta-oe/recipes-support/smarty/{<a href=3D"http://smarty_5.8.4=
.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.8.4.bb</a> =3D&gt; <a hr=
ef=3D"http://smarty_5.8.5.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5=
.8.5.bb</a>} (90%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-astroid_4.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-astroid_4.3=
.2.bb</a> =3D&gt; <a href=3D"http://python3-astroid_4.3.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-astroid_4.3.3.bb</a>} (89%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.=
17.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.18.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_5.2.18.bb</a>} (61%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_6.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.8=
.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.9.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-django_6.0.9.bb</a>} (75%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tzdata_2026.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tzdata_2026=
.4.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-tzdata_2026.5.bb</a>} (86%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-werkzeug_3.1.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-werkzeug_3=
.1.8.bb</a> =3D&gt; <a href=3D"http://python3-werkzeug_3.1.9.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-werkzeug_3.1.9.bb</a>} (91%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-zeroconf_0.151.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-zeroconf=
_0.151.3.bb</a> =3D&gt; <a href=3D"http://python3-zeroconf_0.151.5.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-zeroconf_0.151.5.bb</a>} (88%)<br=
>
=C2=A0rename meta-webserver/recipes-devtools/swagger-ui/{<a href=3D"http://=
swagger-ui_5.33.0.bb" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.33.=
0.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.33.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">swagger-ui_5.33.1.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-=
mod_md-Add-OpenSSL-4.0-compatibility.patch<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130920): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130920" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130920</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121765065/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121765065/1997914</a><br>
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

--0000000000008262e2065de49f2e--

