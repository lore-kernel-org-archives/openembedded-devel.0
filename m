Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECF410F930F
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 23:34:10 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1366.1775000041026607615
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 16:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Swrwlj2c;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64f48a5c3d8so10293325d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 16:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775000040; cv=none;
        d=google.com; s=arc-20240605;
        b=cwgCBHe8fTrqCw2vrifdtp83hDrpXVMakmdPplvMu04lmgb1Pg5nvYdH9xCZbeEWhK
         fwLwuygnoO610F5LmJI7VMzpeokCFpi31eXHXWPM3hbz0LUt7YUxZAP/YcU6iBRpD6YF
         n+mOS+1ykR59+c3gz4O7XM9F/pdVDviDX5P8Brd9t+cB6usITI4xpikefeiIJRJBoUMA
         henVPo2Lai2bWFDAPQdRG5IdMR7gP6EQsmKdsJDFoI9FsDGKG2jJkZQWoLJydePWs6Ij
         FoSj+bAgX/Q4C32mATC8eFCsO+JhcF2C1Xn1d628pIRq1P+Sd8RcGVtf1XdBdS+HGFcw
         y1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VLHYehj8Fp4VgL/TxeLAGORdi2+gTUd7gUkdaFXBZWc=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=M4y2CEC5ejDZUVe3K8XGg8CpjDWVk7hHg4uyo6W6uzw2vM82XKwqyGiuolsugJ2sg/
         yYyVAFnKywxvQm0o5JIr4/gc0N/r0RV+LvoXrOXvQefYoQLV0fvop4EYrGHruHCaX0nC
         yPLbUJsFVdcOfRhHNEiQk/pLDnyGTYSC9M4JKykU7BFQDRa3HTunMJUx45VnMKHdGP2R
         VzXMl/esb9mA4Yn+r8HGbrno2PTeb7si9kkPyd2Mwhmh3IIaALROV8IJ/jJhfWNnl2sE
         cPCatNst8LlpbYIm+YrVRO5brW5/0Jjs1E0iWVqlbf/Zd5Vgi0QRObCYvnxhn7b/DXdI
         YlDQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775000040; x=1775604840; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VLHYehj8Fp4VgL/TxeLAGORdi2+gTUd7gUkdaFXBZWc=;
        b=Swrwlj2cS/lAhoX2V8w3kEkCfzepgWNgSIibHmRzq2/M19/p9TWk7X3Efa8NPxyR+P
         7LSveStwHdk7toyOYI7FlHPc0Fi3ogny09J9sKXA26AODk380BQwxlAZRuSLPWaIBHg+
         TmR4eZlupedt5FZ+gEs3eIfbBHnTSWR7W4w4LPCAn4q7AlL5NHF4A1VKpjLfifL4ozah
         JWqIZtpC4iE+mc+IYLpzpiFThqi1RuAnPgMgxpWrkVFRMesNpBZmL59lHmSsVsfOeEMV
         MT0pOOjCOKooDlJm8fCX0PDSvkpLVxdJbxb+W+O929bfArCerbeeZUCp8FQV4kV/NhXH
         lB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775000040; x=1775604840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLHYehj8Fp4VgL/TxeLAGORdi2+gTUd7gUkdaFXBZWc=;
        b=olIK45WjnNbQWi8Ank9L2S0WQkzfTN+B/U8Z5A1BEMCyxVu3AE6SJvma3Sv2B30uXW
         jLLrSLsPykGAswZOW2BoRXyX+gxGDN+Xl0/+Yug98E7sHoMn4uJX4feBOZAVZ9KWvKqL
         xTZDoMqZOLPSUjTJ9g7nEyXUJCe1m9R06g/8v7BSxe4SbYO0yFAa2arnZmck5NVPitU9
         +zUpMBTmpskBwoDGNKK1FV0iPqv1rysMCeR4FZNtUbbQY7NQCdErre96ic43VHF0QuDP
         M+VJHUXR6XN/V9ETYh8cQ5pGMXU7inHURoE0MpPDHS31Kph+tSIAkaTE9rDjwsL0HoIN
         qwSA==
X-Gm-Message-State: AOJu0Yyg3/xGS969QNhh2VuTUOT6NBNkX31ahKxqz/3WxwD9l7b/UlYJ
	ls+jZWYbYkSzzNLrHfVi0dsGI+cgTcO4te1ZEjzZHEgvD/QKldt2U4RFEpG1WQoWy8ax+Hykz1L
	jWVZntJ46s0oas/umNxCR2M/tHx5DbRU=
X-Gm-Gg: ATEYQzx0c9oByLzuazqCIiI9NCrSpk8k9f7KTUQgcZrh45BqgmE3lWYfGvv2I8vwLs9
	6/nQkHIylqMbiK3fSNtQvVkRDLrd9ukwhjoBrSNTjX81tGbhXJ5z5tXjFFjFHI1rrak8fRNtNDs
	nCLJuYNsI0jcL3+c54hzcS1FKwkdpL5Nn8zxl7Q3cjsxZo3dyawS1u1uUm+itremoz+PBZp0tsD
	epIHkbx3WT1cfrlI+jq3qB/5vwsKkaCGtlwXogzQ4TOw343t2CqE2mf/L7dutVFdPnquOF0kJ9I
	1WR/GVqwa3TmJY0PzfOfA7tx1hCS2vEfm3f0ouur+ZzZm0K6j004DNRhEftV12aydftsp4CAKgb
	iRCryEvVwvX71YveaHmgdlzzN
X-Received: by 2002:a05:690e:d59:b0:650:314f:1108 with SMTP id
 956f58d0204a3-650314f1416mr459824d50.59.1775000039862; Tue, 31 Mar 2026
 16:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260331043818.3061342-1-skandigraun@gmail.com>
In-Reply-To: <20260331043818.3061342-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Mar 2026 16:33:33 -0700
X-Gm-Features: AQROBzAE_OvELIt6sqvPUP4snxmu260UsSZq0HBep44xyK60hZSGPY5VyB5fw5w
Message-ID: <CAMKF1spkU=84SypGio7USi+vqVMTo0D_Op3Qd-xXpgDZhXxD=A@mail.gmail.com>
Subject: Re: [oe] Kirkstone pull request 31st March
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000da370d064e5a66c4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 23:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125893

--000000000000da370d064e5a66c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Gyorgy, seems good. Merged now.

On Mon, Mar 30, 2026 at 9:38=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Today's Kirkstone PR brings a handful CVE fixes - thanks to all
> contributors!
>
> Artifacts:
> World build qemuarm:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/237071435=
35
> World build qemuarm64:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/237108233=
27
> World build qemux86:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/237072925=
42
> World build qemux86-64:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/237278715=
56
> YP layer compatibility:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/237071989=
38
> Ptest execution (logs available at the link):
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/237349454=
82
>
> As expected, one testcase has failed from python3-django_2 ptests.
>
> Since a new patch has arrived on the ML already, it means that this is no=
t
> the final PR
> for Kirkstone yet - the next one will be, however. New patches will be
> accepted for a
> few more weeks.
> The last Kirkstone PR is planned to be sent either about a week after the
> last Kirkston
> Yocto release, or soon after Wrynose is released - whichever comes later.
>
> Just reply to this message in case of any questions or comments.
>
> Thank you,
> Gyorgy
>
>
>
> The following changes since commit
> 8a598a2bc9199a4fbb9008a32ab143fb509a0933:
>
>   poppler: mark CVE-2022-38171 patched (2026-02-15 15:30:54 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib
> stable/kirkstone-nut
>
> for you to fetch changes up to 9d8ef26a9693e2c70ae34abe1a753873d42ec588:
>
>   libssh: Fix CVE-2026-0964 (2026-03-29 11:11:33 +0200)
>
> ----------------------------------------------------------------
> Ankur Tyagi (1):
>       dovecot: ignore CVE-2025-30189
>
> Aviv Daum (1):
>       lldpd: fix xml PACKAGECONFIG dependency
>
> Chen Qi (1):
>       iperf3: remove incorrect CVE_PRODUCT setting
>
> Gyorgy Sarvari (42):
>       cups-filters: patch CVE-2025-64503
>       dante: patch CVE-2024-54662
>       protobuf: ignore CVE-2026-0994
>       fontforge: patch CVE-2025-15269
>       fontforge: patch CVE-2025-15270
>       fontforge: patch CVE-2025-15275
>       fontforge: patch CVE-2025-15279
>       libconfuse: patch CVE-2022-40320
>       keepalived: patch CVE-2024-41184
>       webmin: patch CVE-2025-67738
>       quagga: patch CVE-2017-3224
>       quagga: ignore CVE-2021-44038
>       ndpi: ignore CVE-2025-25066
>       python3-werkzeug: ignore CVE-2026-27199
>       streamripper: ignore CVE-2020-37065
>       gnome-shell: ignore CVE-2021-3982
>       dovecot: patch CVE-2021-29157
>       emacs: patch CVE-2022-48337
>       exiv2: patch CVE-2021-37615 and CVE-2021-37616
>       exiv2: patch CVE-2021-37618
>       exiv2: patch CVE-2021-37619
>       exiv2: patch CVE-2021-37620
>       exiv2: patch CVE-2021-37621
>       exiv2: patch CVE-2021-37622
>       opem-vm-tools: ignore multiple CVEs
>       memcached: patch CVE-2023-46852
>       memcached: patch CVE-2023-46853
>       netdata: patch CVE-2023-22497
>       gimp: ignore irrelevant CVEs
>       lmdb: patch CVE-2026-22185
>       vlc: ignore CVE-2026-26227 and CVE-2026-26228
>       gimp: patch CVE-2023-44441
>       gimp: patch CVE-2023-44442
>       gimp: patch CVE-2023-44443 and CVE-2023-44444
>       gimp: patch CVE-2025-14422
>       exiv2: patch CVE-2026-25884
>       exiv2: patch CVE-2026-27596
>       ettercap: patch CVE-2026-3603
>       hiawatha: fix SRC_URI
>       postgresql: upgrade 14.21 -> 14.22
>       capnproto: patch CVE-2026-32239 and CVE-2026-32240
>       libde265: patch CVE-2025-61147
>
> Hitendra Prajapati (4):
>       wireshark: Fix multiple CVEs
>       postgresql: upgrade 14.20 -> 14.21
>       python3-cbor2: patch CVE-2025-68131
>       wireshark: fix CVE-2025-5601
>
> Martin Jansa (1):
>       freeglut: return x11 to REQUIRED_DISTRO_FEATURES
>
> Nitin Wankhade (6):
>       imagemagick: Fix CVE-2025-43965
>       imagemagick: Fix CVE-2025-66628
>       imagemagick: Fix CVE-2025-68618
>       imagemagick: Fix CVE-2026-22770
>       imagemagick: Fix CVE-2026-23874
>       imagemagick: Fix CVE-2026-23876
>
> Peter Marko (3):
>       nginx: patch CVE-2026-1642
>       fcgi: add follow-up patch for CVE-2025-23016
>       nginx: apply patchs for CVE-2025-23419 and CVE-2026-1642 to all
> versions
>
> Vijay Anusuri (6):
>       libssh: Fix CVE-2026-3731
>       mariadb: Fix CVE-2025-13699
>       giflib: Fix CVE-2026-23868
>       libssh: Fix CVE-2026-0966
>       libssh: Update CVE-2026-0966-2.patch
>       libssh: Fix CVE-2026-0964
>
> Zahir Hussain (1):
>       rocksdb: Add an option to set static library
>
>  .../recipes-gimp/gimp/gimp/CVE-2023-44441.patch    |  61 +++
>  .../recipes-gimp/gimp/gimp/CVE-2023-44442.patch    |  28 ++
>  .../gimp/gimp/CVE-2023-44443_CVE-2023-44444.patch  |  47 ++
>  .../recipes-gimp/gimp/gimp/CVE-2025-14422.patch    |  66 +++
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb       |   7 +
>  .../recipes-gnome/gnome-shell/gnome-shell_42.9.bb  |   2 +
>  .../libde265/libde265/CVE-2025-61147.patch         |  84 ++++
>  .../recipes-multimedia/libde265/libde265_1.0.5.bb  |   1 +
>  .../streamripper/streamripper_1.64.6.bb            |   3 +
>  .../recipes-multimedia/vlc/vlc_3.0.17.4.bb         |   3 +
>  .../keepalived/keepalived/CVE-2024-41184-1.patch   | 100 ++++
>  .../keepalived/keepalived/CVE-2024-41184-2.patch   |  88 ++++
>  .../keepalived/keepalived/CVE-2024-41184-3.patch   |  94 ++++
>  .../keepalived/keepalived/CVE-2024-41184-4.patch   |  33 ++
>  .../recipes-daemons/keepalived/keepalived_2.2.2.bb |   4 +
>  .../recipes-daemons/lldpd/lldpd_1.0.8.bb           |   2 +-
>  .../dante/dante/CVE-2024-54662.patch               |  71 +++
>  .../recipes-protocols/dante/dante_1.4.1.bb         |   3 +-
>  .../quagga/files/CVE-2017-3224.patch               |  90 ++++
>  .../recipes-protocols/quagga/quagga.inc            |   3 +-
>  .../recipes-protocols/quagga/quagga_1.2.4.bb       |   1 +
>  .../dovecot/dovecot/CVE-2021-29157.patch           | 152 ++++++
>  .../recipes-support/dovecot/dovecot_2.3.14.bb      |   4 +
>  .../ettercap/ettercap/CVE-2026-3606.patch          |  48 ++
>  .../recipes-support/ettercap/ettercap_0.8.3.1.bb   |   4 +-
>  .../libconfuse/libconfuse/CVE-2022-40320.patch     |  40 ++
>  .../recipes-support/libconfuse/libconfuse_3.3.bb   |   4 +-
>  .../memcached/memcached/CVE-2023-46852.patch       |  68 +++
>  .../memcached/memcached/CVE-2023-46853.patch       | 114 +++++
>  .../recipes-support/memcached/memcached_1.6.15.bb  |   2 +
>  meta-networking/recipes-support/ntopng/ndpi_4.2.bb |   3 +
>  .../open-vm-tools/open-vm-tools_11.3.5.bb          |  10 +
>  .../wireshark/files/CVE-2024-8645.patch            |  88 ++++
>  .../wireshark/files/CVE-2025-13945.patch           | 339 ++++++++++++++
>  .../wireshark/files/CVE-2025-5601.patch            |  68 +++
>  .../wireshark/files/CVE-2026-0960.patch            |  43 ++
>  .../recipes-support/wireshark/wireshark_3.4.16.bb  |   4 +
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb    |   2 -
>  .../recipes-dbs/lmdb/files/CVE-2026-22185.patch    |  29 ++
>  meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb            |   1 +
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |   2 +
>  .../mysql/mariadb/CVE-2025-13699-1.patch           |  90 ++++
>  .../mysql/mariadb/CVE-2025-13699-2.patch           | 173 +++++++
>  ...ure.ac-bypass-autoconf-2.69-version-check.patch |   4 +-
>  .../{postgresql_14.20.bb =3D> postgresql_14.22.bb}   |   4 +-
>  .../rocksdb/files/static_library_as_option.patch   |  72 +++
>  meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb      |   4 +-
>  .../capnproto/CVE-2026-32239_CVE-2026-32240.patch  | 160 +++++++
>  .../recipes-devtools/capnproto/capnproto_0.9.2.bb  |   1 +
>  .../giflib/giflib/CVE-2026-23868.patch             |  34 ++
>  meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb    |   1 +
>  .../recipes-devtools/protobuf/protobuf_3.19.6.bb   |   3 +
>  .../fontforge/fontforge/CVE-2025-15269.patch       |  35 ++
>  .../fontforge/fontforge/CVE-2025-15270.patch       |  44 ++
>  .../fontforge/fontforge/CVE-2025-15275.patch       |  33 ++
>  .../fontforge/fontforge/CVE-2025-15279-1.patch     |  41 ++
>  .../fontforge/fontforge/CVE-2025-15279-2.patch     |  34 ++
>  .../fontforge/fontforge_20190801.bb                |   5 +
>  .../recipes-graphics/freeglut/freeglut_3.2.1.bb    |   4 +-
>  meta-oe/recipes-printing/cups/cups-filters.inc     |   1 +
>  .../cups/cups-filters/CVE-2025-64503.patch         |  43 ++
>  meta-oe/recipes-support/emacs/emacs_27.2.bb        |   1 +
>  .../emacs/files/CVE-2022-48337.patch               | 108 +++++
>  .../exiv2/exiv2/CVE-2021-37615-1.patch             |  80 ++++
>  .../exiv2/exiv2/CVE-2021-37615-2.patch             | 142 ++++++
>  .../exiv2/exiv2/CVE-2021-37618.patch               |  32 ++
>  .../exiv2/exiv2/CVE-2021-37619.patch               |  37 ++
>  .../exiv2/exiv2/CVE-2021-37620-1.patch             |  26 ++
>  .../exiv2/exiv2/CVE-2021-37620-2.patch             | 306 +++++++++++++
>  .../exiv2/exiv2/CVE-2021-37621-1.patch             |  25 +
>  .../exiv2/exiv2/CVE-2021-37621-2.patch             | 187 ++++++++
>  .../exiv2/exiv2/CVE-2021-37622-1.patch             |  25 +
>  .../exiv2/exiv2/CVE-2021-37622-2.patch             |  25 +
>  .../exiv2/exiv2/CVE-2026-25884.patch               |  25 +
>  .../exiv2/exiv2/CVE-2026-27596-1.patch             |  58 +++
>  .../exiv2/exiv2/CVE-2026-27596-2.patch             |  24 +
>  meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb      |  13 +
>  .../imagemagick/files/CVE-2025-43965.patch         |  21 +
>  .../imagemagick/files/CVE-2025-66628.patch         |  23 +
>  .../imagemagick/files/CVE-2025-68618.patch         |  95 ++++
>  .../imagemagick/files/CVE-2026-22770.patch         |  37 ++
>  .../imagemagick/files/CVE-2026-23874.patch         |  36 ++
>  .../imagemagick/files/CVE-2026-23876.patch         |  63 +++
>  .../imagemagick/imagemagick_7.0.10.bb              |   6 +
>  .../libssh/libssh/CVE-2026-0964.patch              |  46 ++
>  .../libssh/libssh/CVE-2026-0966-1.patch            |  38 ++
>  .../libssh/libssh/CVE-2026-0966-2.patch            |  62 +++
>  .../libssh/libssh/CVE-2026-3731.patch              |  44 ++
>  meta-oe/recipes-support/libssh/libssh_0.8.9.bb     |   4 +
>  .../python/python3-cbor2/CVE-2025-68131.patch      | 507
> +++++++++++++++++++++
>  .../recipes-devtools/python/python3-cbor2_5.4.2.bb |   1 +
>  .../python/python3-werkzeug_2.1.2.bb               |   2 +-
>  .../recipes-httpd/hiawatha/hiawatha_10.12.bb       |   2 +-
>  .../recipes-httpd/nginx/files/CVE-2026-1642.patch  |  46 ++
>  meta-webserver/recipes-httpd/nginx/nginx.inc       |   2 +
>  meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |   2 -
>  ...VE-2025-23016.patch =3D> CVE-2025-23016-01.patch} |   0
>  .../fcgi/fcgi/CVE-2025-23016-02.patch              |  83 ++++
>  meta-webserver/recipes-support/fcgi/fcgi_git.bb    |   3 +-
>  .../netdata/netdata/CVE-2023-22497.patch           | 120 +++++
>  .../recipes-webadmin/netdata/netdata_1.34.1.bb     |   4 +-
>  .../webmin/files/CVE-2025-67738.patch              |  37 ++
>  .../recipes-webadmin/webmin/webmin_1.850.bb        |   1 +
>  103 files changed, 4981 insertions(+), 20 deletions(-)
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44441.patc=
h
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44442.patc=
h
>  create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44443_CVE-2023-44444.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patc=
h
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
>  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.pa=
tch
>  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.pa=
tch
>  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.pa=
tch
>  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.pa=
tch
>  create mode 100644
> meta-networking/recipes-protocols/dante/dante/CVE-2024-54662.patch
>  create mode 100644
> meta-networking/recipes-protocols/quagga/files/CVE-2017-3224.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/CVE-2021-29157.patch
>  create mode 100644
> meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
>  create mode 100644
> meta-networking/recipes-support/libconfuse/libconfuse/CVE-2022-40320.patc=
h
>  create mode 100644
> meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch
>  create mode 100644
> meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2024-8645.patch
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2025-13945.patch
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2025-5601.patch
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch
>  create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
>  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-1.patch
>  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-2.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.20.bb =3D>
> postgresql_14.22.bb} (71%)
>  create mode 100644
> meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
>  create mode 100644
> meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-3224=
0.patch
>  create mode 100644
> meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
>  create mode 100644
> meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64503.patch
>  create mode 100644
> meta-oe/recipes-support/emacs/files/CVE-2022-48337.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-2.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37618.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37619.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-2.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-2.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-2.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2025-43965.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2025-66628.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2025-68618.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2026-22770.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2026-23874.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2026-23876.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
>  rename meta-webserver/recipes-support/fcgi/fcgi/{CVE-2025-23016.patch =
=3D>
> CVE-2025-23016-01.patch} (100%)
>  create mode 100644
> meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-02.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/netdata/netdata/CVE-2023-22497.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125872):
> https://lists.openembedded.org/g/openembedded-devel/message/125872
> Mute This Topic: https://lists.openembedded.org/mt/118591833/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000da370d064e5a66c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Gyorgy, seems good. Merged now.</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Mar 30, 2026 at 9:38=E2=80=AFPM Gyorgy Sarvari via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a=
 href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Today&#39;s Kirkstone PR brings a handful CVE fixes - thanks to all =
contributors!<br>
<br>
Artifacts:<br>
World build qemuarm: <a href=3D"https://github.com/OldManYellsAtCloud/meta-=
oe-test/actions/runs/23707143535" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23707143535</a>=
<br>
World build qemuarm64: <a href=3D"https://github.com/OldManYellsAtCloud/met=
a-oe-test/actions/runs/23710823327" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23710823327</=
a><br>
World build qemux86: <a href=3D"https://github.com/OldManYellsAtCloud/meta-=
oe-test/actions/runs/23707292542" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23707292542</a>=
<br>
World build qemux86-64: <a href=3D"https://github.com/OldManYellsAtCloud/me=
ta-oe-test/actions/runs/23727871556" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23727871556<=
/a><br>
YP layer compatibility: <a href=3D"https://github.com/OldManYellsAtCloud/me=
ta-oe-test/actions/runs/23707198938" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23707198938<=
/a><br>
Ptest execution (logs available at the link): <a href=3D"https://github.com=
/OldManYellsAtCloud/meta-oe-test/actions/runs/23734945482" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/act=
ions/runs/23734945482</a><br>
<br>
As expected, one testcase has failed from python3-django_2 ptests.<br>
<br>
Since a new patch has arrived on the ML already, it means that this is not =
the final PR <br>
for Kirkstone yet - the next one will be, however. New patches will be acce=
pted for a <br>
few more weeks.<br>
The last Kirkstone PR is planned to be sent either about a week after the l=
ast Kirkston <br>
Yocto release, or soon after Wrynose is released - whichever comes later.<b=
r>
<br>
Just reply to this message in case of any questions or comments.<br>
<br>
Thank you,<br>
Gyorgy<br>
<br>
<br>
<br>
The following changes since commit 8a598a2bc9199a4fbb9008a32ab143fb509a0933=
:<br>
<br>
=C2=A0 poppler: mark CVE-2022-38171 patched (2026-02-15 15:30:54 +0100)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembe=
dded-contrib</a> stable/kirkstone-nut<br>
<br>
for you to fetch changes up to 9d8ef26a9693e2c70ae34abe1a753873d42ec588:<br=
>
<br>
=C2=A0 libssh: Fix CVE-2026-0964 (2026-03-29 11:11:33 +0200)<br>
<br>
----------------------------------------------------------------<br>
Ankur Tyagi (1):<br>
=C2=A0 =C2=A0 =C2=A0 dovecot: ignore CVE-2025-30189<br>
<br>
Aviv Daum (1):<br>
=C2=A0 =C2=A0 =C2=A0 lldpd: fix xml PACKAGECONFIG dependency<br>
<br>
Chen Qi (1):<br>
=C2=A0 =C2=A0 =C2=A0 iperf3: remove incorrect CVE_PRODUCT setting<br>
<br>
Gyorgy Sarvari (42):<br>
=C2=A0 =C2=A0 =C2=A0 cups-filters: patch CVE-2025-64503<br>
=C2=A0 =C2=A0 =C2=A0 dante: patch CVE-2024-54662<br>
=C2=A0 =C2=A0 =C2=A0 protobuf: ignore CVE-2026-0994<br>
=C2=A0 =C2=A0 =C2=A0 fontforge: patch CVE-2025-15269<br>
=C2=A0 =C2=A0 =C2=A0 fontforge: patch CVE-2025-15270<br>
=C2=A0 =C2=A0 =C2=A0 fontforge: patch CVE-2025-15275<br>
=C2=A0 =C2=A0 =C2=A0 fontforge: patch CVE-2025-15279<br>
=C2=A0 =C2=A0 =C2=A0 libconfuse: patch CVE-2022-40320<br>
=C2=A0 =C2=A0 =C2=A0 keepalived: patch CVE-2024-41184<br>
=C2=A0 =C2=A0 =C2=A0 webmin: patch CVE-2025-67738<br>
=C2=A0 =C2=A0 =C2=A0 quagga: patch CVE-2017-3224<br>
=C2=A0 =C2=A0 =C2=A0 quagga: ignore CVE-2021-44038<br>
=C2=A0 =C2=A0 =C2=A0 ndpi: ignore CVE-2025-25066<br>
=C2=A0 =C2=A0 =C2=A0 python3-werkzeug: ignore CVE-2026-27199<br>
=C2=A0 =C2=A0 =C2=A0 streamripper: ignore CVE-2020-37065<br>
=C2=A0 =C2=A0 =C2=A0 gnome-shell: ignore CVE-2021-3982<br>
=C2=A0 =C2=A0 =C2=A0 dovecot: patch CVE-2021-29157<br>
=C2=A0 =C2=A0 =C2=A0 emacs: patch CVE-2022-48337<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-37615 and CVE-2021-37616<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-37618<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-37619<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-37620<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-37621<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2021-37622<br>
=C2=A0 =C2=A0 =C2=A0 opem-vm-tools: ignore multiple CVEs<br>
=C2=A0 =C2=A0 =C2=A0 memcached: patch CVE-2023-46852<br>
=C2=A0 =C2=A0 =C2=A0 memcached: patch CVE-2023-46853<br>
=C2=A0 =C2=A0 =C2=A0 netdata: patch CVE-2023-22497<br>
=C2=A0 =C2=A0 =C2=A0 gimp: ignore irrelevant CVEs<br>
=C2=A0 =C2=A0 =C2=A0 lmdb: patch CVE-2026-22185<br>
=C2=A0 =C2=A0 =C2=A0 vlc: ignore CVE-2026-26227 and CVE-2026-26228<br>
=C2=A0 =C2=A0 =C2=A0 gimp: patch CVE-2023-44441<br>
=C2=A0 =C2=A0 =C2=A0 gimp: patch CVE-2023-44442<br>
=C2=A0 =C2=A0 =C2=A0 gimp: patch CVE-2023-44443 and CVE-2023-44444<br>
=C2=A0 =C2=A0 =C2=A0 gimp: patch CVE-2025-14422<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2026-25884<br>
=C2=A0 =C2=A0 =C2=A0 exiv2: patch CVE-2026-27596<br>
=C2=A0 =C2=A0 =C2=A0 ettercap: patch CVE-2026-3603<br>
=C2=A0 =C2=A0 =C2=A0 hiawatha: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 postgresql: upgrade 14.21 -&gt; 14.22<br>
=C2=A0 =C2=A0 =C2=A0 capnproto: patch CVE-2026-32239 and CVE-2026-32240<br>
=C2=A0 =C2=A0 =C2=A0 libde265: patch CVE-2025-61147<br>
<br>
Hitendra Prajapati (4):<br>
=C2=A0 =C2=A0 =C2=A0 wireshark: Fix multiple CVEs<br>
=C2=A0 =C2=A0 =C2=A0 postgresql: upgrade 14.20 -&gt; 14.21<br>
=C2=A0 =C2=A0 =C2=A0 python3-cbor2: patch CVE-2025-68131<br>
=C2=A0 =C2=A0 =C2=A0 wireshark: fix CVE-2025-5601<br>
<br>
Martin Jansa (1):<br>
=C2=A0 =C2=A0 =C2=A0 freeglut: return x11 to REQUIRED_DISTRO_FEATURES<br>
<br>
Nitin Wankhade (6):<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2025-43965<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2025-66628<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2025-68618<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2026-22770<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2026-23874<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2026-23876<br>
<br>
Peter Marko (3):<br>
=C2=A0 =C2=A0 =C2=A0 nginx: patch CVE-2026-1642<br>
=C2=A0 =C2=A0 =C2=A0 fcgi: add follow-up patch for CVE-2025-23016<br>
=C2=A0 =C2=A0 =C2=A0 nginx: apply patchs for CVE-2025-23419 and CVE-2026-16=
42 to all versions<br>
<br>
Vijay Anusuri (6):<br>
=C2=A0 =C2=A0 =C2=A0 libssh: Fix CVE-2026-3731<br>
=C2=A0 =C2=A0 =C2=A0 mariadb: Fix CVE-2025-13699<br>
=C2=A0 =C2=A0 =C2=A0 giflib: Fix CVE-2026-23868<br>
=C2=A0 =C2=A0 =C2=A0 libssh: Fix CVE-2026-0966<br>
=C2=A0 =C2=A0 =C2=A0 libssh: Update CVE-2026-0966-2.patch<br>
=C2=A0 =C2=A0 =C2=A0 libssh: Fix CVE-2026-0964<br>
<br>
Zahir Hussain (1):<br>
=C2=A0 =C2=A0 =C2=A0 rocksdb: Add an option to set static library<br>
<br>
=C2=A0.../recipes-gimp/gimp/gimp/CVE-2023-44441.patch=C2=A0 =C2=A0 |=C2=A0 =
61 +++<br>
=C2=A0.../recipes-gimp/gimp/gimp/CVE-2023-44442.patch=C2=A0 =C2=A0 |=C2=A0 =
28 ++<br>
=C2=A0.../gimp/gimp/CVE-2023-44443_CVE-2023-44444.patch=C2=A0 |=C2=A0 47 ++=
<br>
=C2=A0.../recipes-gimp/gimp/gimp/CVE-2025-14422.patch=C2=A0 =C2=A0 |=C2=A0 =
66 +++<br>
=C2=A0meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.30.bb" rel=
=3D"noreferrer" target=3D"_blank">gimp_2.10.30.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A07 +<br>
=C2=A0.../recipes-gnome/gnome-shell/<a href=3D"http://gnome-shell_42.9.bb" =
rel=3D"noreferrer" target=3D"_blank">gnome-shell_42.9.bb</a>=C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0.../libde265/libde265/CVE-2025-61147.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 84 ++++<br>
=C2=A0.../recipes-multimedia/libde265/<a href=3D"http://libde265_1.0.5.bb" =
rel=3D"noreferrer" target=3D"_blank">libde265_1.0.5.bb</a>=C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../streamripper/<a href=3D"http://streamripper_1.64.6.bb" rel=3D"nor=
eferrer" target=3D"_blank">streamripper_1.64.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0.../recipes-multimedia/vlc/<a href=3D"http://vlc_3.0.17.4.bb" rel=3D"=
noreferrer" target=3D"_blank">vlc_3.0.17.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../keepalived/keepalived/CVE-2024-41184-1.patch=C2=A0 =C2=A0| 100 ++=
++<br>
=C2=A0.../keepalived/keepalived/CVE-2024-41184-2.patch=C2=A0 =C2=A0|=C2=A0 =
88 ++++<br>
=C2=A0.../keepalived/keepalived/CVE-2024-41184-3.patch=C2=A0 =C2=A0|=C2=A0 =
94 ++++<br>
=C2=A0.../keepalived/keepalived/CVE-2024-41184-4.patch=C2=A0 =C2=A0|=C2=A0 =
33 ++<br>
=C2=A0.../recipes-daemons/keepalived/<a href=3D"http://keepalived_2.2.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">keepalived_2.2.2.bb</a> |=C2=A0 =C2=
=A04 +<br>
=C2=A0.../recipes-daemons/lldpd/<a href=3D"http://lldpd_1.0.8.bb" rel=3D"no=
referrer" target=3D"_blank">lldpd_1.0.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../dante/dante/CVE-2024-54662.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 71 +++<br>
=C2=A0.../recipes-protocols/dante/<a href=3D"http://dante_1.4.1.bb" rel=3D"=
noreferrer" target=3D"_blank">dante_1.4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0.../quagga/files/CVE-2017-3224.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 90 ++++<br>
=C2=A0.../recipes-protocols/quagga/quagga.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0.../recipes-protocols/quagga/<a href=3D"http://quagga_1.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">quagga_1.2.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../dovecot/dovecot/CVE-2021-29157.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 152 ++++++<br>
=C2=A0.../recipes-support/dovecot/<a href=3D"http://dovecot_2.3.14.bb" rel=
=3D"noreferrer" target=3D"_blank">dovecot_2.3.14.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A04 +<br>
=C2=A0.../ettercap/ettercap/CVE-2026-3606.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 48 ++<br>
=C2=A0.../recipes-support/ettercap/<a href=3D"http://ettercap_0.8.3.1.bb" r=
el=3D"noreferrer" target=3D"_blank">ettercap_0.8.3.1.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
=C2=A0.../libconfuse/libconfuse/CVE-2022-40320.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 40 ++<br>
=C2=A0.../recipes-support/libconfuse/<a href=3D"http://libconfuse_3.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libconfuse_3.3.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +-<br>
=C2=A0.../memcached/memcached/CVE-2023-46852.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 68 +++<br>
=C2=A0.../memcached/memcached/CVE-2023-46853.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 114 +++++<br>
=C2=A0.../recipes-support/memcached/<a href=3D"http://memcached_1.6.15.bb" =
rel=3D"noreferrer" target=3D"_blank">memcached_1.6.15.bb</a>=C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0meta-networking/recipes-support/ntopng/<a href=3D"http://ndpi_4.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">ndpi_4.2.bb</a> |=C2=A0 =C2=A03 +<br>
=C2=A0.../open-vm-tools/<a href=3D"http://open-vm-tools_11.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">open-vm-tools_11.3.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br>
=C2=A0.../wireshark/files/CVE-2024-8645.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 88 ++++<br>
=C2=A0.../wireshark/files/CVE-2025-13945.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 339 ++++++++++++++<br>
=C2=A0.../wireshark/files/CVE-2025-5601.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 68 +++<br>
=C2=A0.../wireshark/files/CVE-2026-0960.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 43 ++<br>
=C2=A0.../recipes-support/wireshark/<a href=3D"http://wireshark_3.4.16.bb" =
rel=3D"noreferrer" target=3D"_blank">wireshark_3.4.16.bb</a>=C2=A0 |=C2=A0 =
=C2=A04 +<br>
=C2=A0meta-oe/recipes-benchmark/iperf3/<a href=3D"http://iperf3_3.15.bb" re=
l=3D"noreferrer" target=3D"_blank">iperf3_3.15.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 -<br>
=C2=A0.../recipes-dbs/lmdb/files/CVE-2026-22185.patch=C2=A0 =C2=A0 |=C2=A0 =
29 ++<br>
=C2=A0meta-oe/recipes-dbs/lmdb/<a href=3D"http://lmdb_0.9.29.bb" rel=3D"nor=
eferrer" target=3D"_blank">lmdb_0.9.29.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../mysql/mariadb/CVE-2025-13699-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 90 ++++<br>
=C2=A0.../mysql/mariadb/CVE-2025-13699-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 173 +++++++<br>
=C2=A0...ure.ac-bypass-autoconf-2.69-version-check.patch |=C2=A0 =C2=A04 +-=
<br>
=C2=A0.../{<a href=3D"http://postgresql_14.20.bb" rel=3D"noreferrer" target=
=3D"_blank">postgresql_14.20.bb</a> =3D&gt; <a href=3D"http://postgresql_14=
.22.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_14.22.bb</a>}=C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../rocksdb/files/static_library_as_option.patch=C2=A0 =C2=A0|=C2=A0 =
72 +++<br>
=C2=A0meta-oe/recipes-dbs/rocksdb/<a href=3D"http://rocksdb_6.20.3.bb" rel=
=3D"noreferrer" target=3D"_blank">rocksdb_6.20.3.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../capnproto/CVE-2026-32239_CVE-2026-32240.patch=C2=A0 | 160 +++++++=
<br>
=C2=A0.../recipes-devtools/capnproto/<a href=3D"http://capnproto_0.9.2.bb" =
rel=3D"noreferrer" target=3D"_blank">capnproto_0.9.2.bb</a>=C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../giflib/giflib/CVE-2026-23868.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 34 ++<br>
=C2=A0meta-oe/recipes-devtools/giflib/<a href=3D"http://giflib_5.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">giflib_5.2.2.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 +<br>
=C2=A0.../recipes-devtools/protobuf/<a href=3D"http://protobuf_3.19.6.bb" r=
el=3D"noreferrer" target=3D"_blank">protobuf_3.19.6.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A03 +<br>
=C2=A0.../fontforge/fontforge/CVE-2025-15269.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 35 ++<br>
=C2=A0.../fontforge/fontforge/CVE-2025-15270.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 44 ++<br>
=C2=A0.../fontforge/fontforge/CVE-2025-15275.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 33 ++<br>
=C2=A0.../fontforge/fontforge/CVE-2025-15279-1.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 41 ++<br>
=C2=A0.../fontforge/fontforge/CVE-2025-15279-2.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 34 ++<br>
=C2=A0.../fontforge/<a href=3D"http://fontforge_20190801.bb" rel=3D"norefer=
rer" target=3D"_blank">fontforge_20190801.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0.../recipes-graphics/freeglut/<a href=3D"http://freeglut_3.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">freeglut_3.2.1.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0meta-oe/recipes-printing/cups/cups-filters.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0.../cups/cups-filters/CVE-2025-64503.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 43 ++<br>
=C2=A0meta-oe/recipes-support/emacs/<a href=3D"http://emacs_27.2.bb" rel=3D=
"noreferrer" target=3D"_blank">emacs_27.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0.../emacs/files/CVE-2022-48337.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 108 +++++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37615-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 80 ++++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37615-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 142 ++++++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37618.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 ++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37619.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 37 ++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37620-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 26 ++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37620-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 306 +++++++++++++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37621-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 25 +<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37621-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 187 ++++++++<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37622-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 25 +<br>
=C2=A0.../exiv2/exiv2/CVE-2021-37622-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 25 +<br>
=C2=A0.../exiv2/exiv2/CVE-2026-25884.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27596-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 58 +++<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27596-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 24 +<br>
=C2=A0meta-oe/recipes-support/exiv2/<a href=3D"http://exiv2_0.27.3.bb" rel=
=3D"noreferrer" target=3D"_blank">exiv2_0.27.3.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 13 +<br>
=C2=A0.../imagemagick/files/CVE-2025-43965.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 21 +<br>
=C2=A0.../imagemagick/files/CVE-2025-66628.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 23 +<br>
=C2=A0.../imagemagick/files/CVE-2025-68618.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 95 ++++<br>
=C2=A0.../imagemagick/files/CVE-2026-22770.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 37 ++<br>
=C2=A0.../imagemagick/files/CVE-2026-23874.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 36 ++<br>
=C2=A0.../imagemagick/files/CVE-2026-23876.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 63 +++<br>
=C2=A0.../imagemagick/<a href=3D"http://imagemagick_7.0.10.bb" rel=3D"noref=
errer" target=3D"_blank">imagemagick_7.0.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0.../libssh/libssh/CVE-2026-0964.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 46 ++<br>
=C2=A0.../libssh/libssh/CVE-2026-0966-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 38 ++<br>
=C2=A0.../libssh/libssh/CVE-2026-0966-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 62 +++<br>
=C2=A0.../libssh/libssh/CVE-2026-3731.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 44 ++<br>
=C2=A0meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb" rel=
=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +<br>
=C2=A0.../python/python3-cbor2/CVE-2025-68131.patch=C2=A0 =C2=A0 =C2=A0 | 5=
07 +++++++++++++++++++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-cbor2_5.4.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-cbor2_5.4.2.bb</a> |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../python/<a href=3D"http://python3-werkzeug_2.1.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-werkzeug_2.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-httpd/hiawatha/<a href=3D"http://hiawatha_10.12.bb" rel=
=3D"noreferrer" target=3D"_blank">hiawatha_10.12.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-httpd/nginx/files/CVE-2026-1642.patch=C2=A0 |=C2=A0 46 ++=
<br>
=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">nginx_1.24.0.bb</a> |=C2=A0 =C2=A02 -=
<br>
=C2=A0...VE-2025-23016.patch =3D&gt; CVE-2025-23016-01.patch} |=C2=A0 =C2=
=A00<br>
=C2=A0.../fcgi/fcgi/CVE-2025-23016-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 83 ++++<br>
=C2=A0meta-webserver/recipes-support/fcgi/<a href=3D"http://fcgi_git.bb" re=
l=3D"noreferrer" target=3D"_blank">fcgi_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
=C2=A0.../netdata/netdata/CVE-2023-22497.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 120 +++++<br>
=C2=A0.../recipes-webadmin/netdata/<a href=3D"http://netdata_1.34.1.bb" rel=
=3D"noreferrer" target=3D"_blank">netdata_1.34.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A04 +-<br>
=C2=A0.../webmin/files/CVE-2025-67738.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 37 ++<br>
=C2=A0.../recipes-webadmin/webmin/<a href=3D"http://webmin_1.850.bb" rel=3D=
"noreferrer" target=3D"_blank">webmin_1.850.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0103 files changed, 4981 insertions(+), 20 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44441.p=
atch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44442.p=
atch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44443_C=
VE-2023-44444.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.p=
atch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2025-61147.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/keepalived/keepali=
ved/CVE-2024-41184-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/keepalived/keepali=
ved/CVE-2024-41184-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/keepalived/keepali=
ved/CVE-2024-41184-3.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/keepalived/keepali=
ved/CVE-2024-41184-4.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/dante/dante/CVE-=
2024-54662.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/quagga/files/CVE=
-2017-3224.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CV=
E-2021-29157.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/ettercap/ettercap/=
CVE-2026-3606.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/libconfuse/libconf=
use/CVE-2022-40320.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/memcached/memcache=
d/CVE-2023-46852.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/memcached/memcache=
d/CVE-2023-46853.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2024-8645.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2025-13945.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2025-5601.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2026-0960.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-1=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-2=
.patch<br>
=C2=A0rename meta-oe/recipes-dbs/postgresql/{<a href=3D"http://postgresql_1=
4.20.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_14.20.bb</a> =3D&g=
t; <a href=3D"http://postgresql_14.22.bb" rel=3D"noreferrer" target=3D"_bla=
nk">postgresql_14.22.bb</a>} (71%)<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_a=
s_option.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/CVE-2=
026-32239_CVE-2026-32240.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23=
868.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15269.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15270.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15275.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15279-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15279-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-202=
5-64503.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/emacs/files/CVE-2022-48337=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37618=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37619=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025=
-43965.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025=
-66628.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025=
-68618.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2026=
-22770.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2026=
-23874.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2026=
-23876.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
4.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
6-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
6-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-373=
1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
CVE-2025-68131.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
1642.patch<br>
=C2=A0rename meta-webserver/recipes-support/fcgi/fcgi/{CVE-2025-23016.patch=
 =3D&gt; CVE-2025-23016-01.patch} (100%)<br>
=C2=A0create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-=
23016-02.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/CV=
E-2023-22497.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2=
025-67738.patch<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125872): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125872" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125872</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118591833/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118591833/1997914</a><br>
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

--000000000000da370d064e5a66c4--

