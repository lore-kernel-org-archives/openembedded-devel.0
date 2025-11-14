Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F4CCE7A89
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:30:28 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13410.1763109025996671029
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f1ctLlDt;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63fca769163so1589133d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763109025; x=1763713825; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fWbNc5PyWOriJcuGZpJNSr6XOet1izlr4pZHXxAaMv4=;
        b=f1ctLlDtAm5I9iSkI56ng+420iHqOMYjrcIvrUPtup+pNpkiqi+0Qia4qVV7H8Fj7Q
         MohrJ39b6SFlQhFxd6qaFPmCeJ06q/zKhLL0wSM/Yezroiz2bVN7zPDgrCMQ7wiSje1j
         6R+Z4vOAPWE5ZYQJfD3bO1/Q+Ni/5ewkyXiR7SqukYJ7A3XEIxadS+7z/sv/MyDHSnAT
         fYPk6KEKY9ugLZdc2MSlTDbEAEtTC7n/ASa9G9y/G8nhF0RW+EAXrNDQPMgpivUKYCbv
         q1+Qe1aVFQ2FK+Oy6xpocafsgwMdhvf/UvrgCFpfNz2gbgOnVJDV0lMl95W3LNO+PtxM
         OFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763109025; x=1763713825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWbNc5PyWOriJcuGZpJNSr6XOet1izlr4pZHXxAaMv4=;
        b=KncSTvbA3TWhWdKUXc8NbTSAKEK0jPlI/JQq1Oqhn2aPZFhpE/zwXwfKInAuo4GXSi
         Aq/fZEpYgnM1MlpapWW4Sq7Re6LIB6Yrf9u50pzNA8rJAkdMagGxDUtxnOizbJPEmM9C
         h9lj/TIVd3y3nHSvln7TXUtzg2iGERrmWDLyTDwXoogMMxkc7eyogCKWfbYIb+vd00W3
         zroRUvT1bAFrvmo2q44Norxaw94eI3gVJQf+iYE8MCp/pJqsHnwAVasvrsDelqS81PYG
         LKlGbRFbTC/LRh8V2GFEcuBqWz8O6y7sTKiTH8d4Nkcpp4aYqUQajRFrmSvteuwd+v7y
         5D/w==
X-Gm-Message-State: AOJu0Ywqn2XQwkGhNNGJoNSNFHEP8eXunouvb4N4PlRlX2UcRV7KGsTu
	pgOQPU1UWRefiX4lOwgU1nQAYUTza6atmDJ295fCwfVx5Za7zBqO7Su+AJcfIfXe/NpQZhX97ZP
	rdL6MEl+REnuxLpHRm78PEwlUYREHfCk=
X-Gm-Gg: ASbGncuCsUD2jsfaKZxiYKFhbVbNGNRXdlZ3YkZiw1Mvsy+uGVzsmlHlRHtEtF2mVEo
	VBGvcnhoUjpqfCkPY2fN9thRGGJ6xYi/5HMkxtVzLSBQmfu89zz00N46S8x+PcmYocTMUnTh9Ho
	kDMOeB35ql1Iey71AciFOBaaIMDMZvBiVIXk/D8iIs5flSz5EzOL8s5xFuosiOYms9XiscAuLQp
	bQGynGnmgRWr0ZaXkBfiGGt9Vi+I2j8GYLI/vgpmV5VRnk53hMdAkr9fHdKxwsTlOilzamK4Xvt
	hOg7O9RbciR2PtscFZXJxtuowXoCTtHqIM8sb6Ffdb6DVMQdC01Mmd3pOX4czGLqkM/WUw6wQ6a
	1BNG1ORzH328UZeQXS7LARkbGv1SPsv+Ln14RhP72dHMmRw==
X-Google-Smtp-Source: AGHT+IHxWRdQQvCvPGg4mTGTtn9n22FnAt1bhcX9LmBowdoreXOyQL141fxQx39C7Wh5c4GhqYzK0aCHNZDtxu4g9Tg=
X-Received: by 2002:a05:690e:154e:10b0:63f:a162:a108 with SMTP id
 956f58d0204a3-641e74a4a9dmr1555810d50.8.1763109024747; Fri, 14 Nov 2025
 00:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20251113203415.327455-1-skandigraun@gmail.com>
In-Reply-To: <20251113203415.327455-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Nov 2025 00:29:58 -0800
X-Gm-Features: AWmQ_bl_Ne3G8AwKK8GFxIHW4Bv_lkz-ViR3F6d6xzsJqx5Pqw_5dGToSWVjsqU
Message-ID: <CAMKF1srnOgQ49cCM+h7Lj+u-JmLekRZ3ejNF-Rzac4Yd=p=Fzw@mail.gmail.com>
Subject: Re: [oe] Kirkstone Pull Request Nov 13th
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001ed462064389cfc5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121700

--0000000000001ed462064389cfc5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

applied now thanks

On Thu, Nov 13, 2025 at 12:34=E2=80=AFPM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Hello,
>
> This new Kirkstone Pull Request contains many CVE and ptest
> fixes - thank you all who contributed to this release.
>
> arm build logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192952986=
43/job/55175680474
> aarch64
> <https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19295298=
643/job/55175680474aarch64>
> build logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192954369=
72/job/55176140854
> x86
> <https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19295436=
972/job/55176140854x86>
> build logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192954399=
84/job/55176150598
> x86-64
> <https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19295439=
984/job/55176150598x86-64>
> build logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192605395=
12/job/55064120322
> YP compatibility check logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192954475=
03/job/55176174138
> ptest build and run results (x86-64, gcc+glibc):
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192971057=
71
> ptest logs (change the placeholders): sarvari $dot me $slash yocto $slash
> ptest-kirkstone-2025-11.tar.gz
>
> Please let me know if you have any questions or comments.
>
> Thank you
>
> ---
>
> The following changes since commit
> 96fbc156364fd78530d2bfbe1b8a77789f52997d:
>
>   collectd: set working SRC_URI (2025-10-02 15:16:50 +0200)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib
> stable/kirkstone-nut
>
> for you to fetch changes up to 07ac1890c843b374c27e150f1a2e53ad3db2a8e4:
>
>   libssh: fix CVE-2025-8277 (2025-11-11 08:50:50 +0100)
>
> ----------------------------------------------------------------
> Alexandre Truong (1):
>       evince: Update status for CVE-2011-0433 and CVE-2011-5244
>
> Archana Polampalli (2):
>       tcpreplay: fix CVE-2025-9157
>       tcpreplay: fix CVE-2025-51006
>
> Changqing Li (1):
>       keyutils: fix ptest failed since "+++ Can't Determine Endianness"
>
> Chen Qi (1):
>       frr: add CVE_PRODUCT
>
> Derek Straka (1):
>       python3-typeguard: update ptest dependencies
>
> Divya Chellam (3):
>       mariadb: fix CVE-2025-21490
>       jq: fix CVE-2025-9403
>       mariadb: fix CVE-2025-30722
>
> Gyorgy Sarvari (86):
>       ace: ignore CVE-2009-1147
>       apache2: ignore irrelevant CVEs
>       civetweb: patch CVE-2020-27304
>       dovecot: patch CVE-2022-30550
>       dovecot: patch CVE-2021-33515
>       botan: patch CVE-2022-43705
>       botan: patch CVE-2024-39312
>       botan: patch CVE-2024-50382 and CVE-2024-50383
>       iperf2: ignore irrelevant CVEs
>       zlog: patch CVE-2021-43521
>       zchunk: patch CVE-2023-46228
>       webmin: patch CVE-2017-15644, CVE-2017-15645 and CVE-2017-15646
>       webmin: patch CVE-2017-17089
>       webmin: patch CVE-2019-15642
>       webmin: patch CVE-2022-0824
>       webmin: patch CVE-2022-0829
>       apache2: ignore CVE-2025-3891
>       faad2: patch CVE-2021-32272
>       faad2: patch CVE-2021-32273
>       faad2: patch CVE-2021-32274 and CVE-2021-32277
>       faad2: patch CVE-2021-32278
>       cli11: fix ptests
>       fmt: fix ptests
>       function2: fix ptests
>       kernel-selftest: fix ptest
>       keyutils: add missing ptest dependencies
>       libdbi-perl: fix ptests
>       libjcat: fix ptests
>       libmanette: fix ptests
>       libxml++-5.0: fix ptests
>       pv: fix ptests
>       sdbus-c++: fix ptest script output
>       python3-ujson: fix run-ptest script
>       python3-soupsieve: fix ptests
>       python3-betamax: fix ptests
>       python3-yarl: fix ptests (and make it compatible with current pytho=
n)
>       cryptsetup: extend licenses with Apache and CC0
>       zchunk: add ptest support
>       wavpack: patch CVE-2016-10169
>       netkit-telnet: patch CVE-2022-39028
>       renderdoc: patch CVE-2023-33863, CVE-2023-33864 and CVE-2023-33865
>       squid: patch CVE-2021-46784
>       squid: patch CVE-2022-41317
>       squid: patch CVE-2022-41318
>       squid: patch CVE-2023-46724
>       squid: patch CVE-2025-59362
>       squid: fix esi PACKAGECONFIG
>       python3-py-cpuinfo: fix ptests
>       python3-requests-toolbelt: disable tests with expired certificate
>       python3-pint: fix ptests
>       python3-gevent: fix syntax error in cve patch
>       python3-gunicorn: add patch work with geventlet
>       klibc: patch CVE-2021-31870
>       klibc: patch CVE-2021-31871
>       klibc: patch CVE-2021-31872
>       klibc: patch CVE-2021-31873
>       gattlib: ignore CVE-2019-6498
>       iptraf-ng: patch CVE-2024-52949
>       keepalived: patch CVE-2021-44225
>       libxml-libxml-perl: fix ptests
>       libunix-statgrab: fix ptests
>       libtest-harness-perl: fix ptests
>       python3-scapy: fix ptests
>       freediameter: fix run-ptest reporting
>       net-snmp: fix ptests
>       sshfs-fuse: fix ptests
>       fuse3: fix ptests
>       libopenmpt: fix ptests
>       libauthen-sasl-perl: fix ptest
>       libconfig-autoconf-perl: fix ptests
>       libcrypt-openssl-guess-perl: fix ptests
>       libdbd-sqlite-perl: fix ptests
>       libfile-slurper-perl: fix ptests
>       libmime-types-perl: fix ptests
>       libencode-perl: fix ptests
>       mongodb: add tzdata to runtime dependencies
>       poco: fix ptests
>       ostree: fix ptests
>       libxml++: fix ptests
>       python3-aspectlib: fix ptests
>       libnet-dns-perl: fix ptests
>       gimp: ignore CVE-2007-3741
>       inotify-tools: add PASS/FAIL status to run-ptest script
>       gimp: patch CVE-2022-30067
>       gimp: patch CVE-2022-32990
>       poco: remove mongodb from ptest RDEPENDS
>
> Khem Raj (4):
>       libteam: Add missing dependencies revealed by ptests
>       oprofile: Fix failing ptests
>       python3-whoosh: Fix an intermittent ptest
>       openl2tp: Fix ptests
>
> Nikhil R (1):
>       inotify-tools: add ptest support for inotify-tools
>
> Ninette Adhikari (3):
>       xsp: CVE status update for CVE-2006-2658
>       st: Update status for CVE-2017-16224
>       influxdb: Update CVE status for CVE-2019-10329
>
> Peter Marko (6):
>       emlog: set CVE_PRODUCT
>       squid: mark CVE-2025-54574 as patched
>       dash: set CVE_PRODUCT
>       id3lib: mark CVE-2007-4460 as fixed
>       hostapd: patch CVE-2025-24912
>       hostapd: patch CVE-2022-37660
>
> Praveen Kumar (2):
>       yasm: fix CVE-2024-22653
>       cjson: upgrade 1.7.18 -> 1.7.19
>
> Rajeshkumar Ramasamy (3):
>       open-vm-tools: fix CVE-2025-41244
>       libssh: fix CVE-2025-4878
>       libssh: fix CVE-2025-8277
>
> Sana Kazi (1):
>       cryptsetup: Update the license field
>
> Saravanan (2):
>       udisks2: fix CVE-2025-8067
>       fio: fix CVE-2025-10823
>
> Soumya Sambu (3):
>       iniparser: Fix CVE-2025-0633
>       python3-pillow: Fix CVE-2024-28219
>       python3-aiohttp: Fix CVE-2024-23829
>
> Vijay Anusuri (11):
>       vorbis-tools: Fix CVE-2023-43361
>       redis: Fix CVE-2025-27151
>       redis: Fix CVE-2025-32023
>       redis: Fix CVE-2025-48367
>       redis: Fix CVE-2025-46817
>       redis: Fix CVE-2025-46818
>       redis: Fix CVE-2025-46819
>       redis: Fix CVE-2025-49844
>       proftpd: Fix CVE-2023-48795
>       unbound: Fix for CVE-2022-30698 and CVE-2022-30699
>       unbound: Fix CVE-2022-3204
>
> Wentao Zhang (1):
>       jemalloc: include the missing shell scripts and source the
> corresponds shell scripts for some test cases.
>
> Yi Zhao (1):
>       mbedtls: upgrade 2.28.9 -> 2.28.10
>
> Yogita Urade (2):
>       poppler: fix CVE-2025-43718
>       poppler: fix CVE-2025-52885
>
> Zhang Peng (2):
>       frr: fix CVE-2024-31949
>       opensc: fix CVE-2023-5992
>
> simoneScaravati (1):
>       fbida: fix make fbpdf build optional
>
> virendra thakur (1):
>       imagemagick: Fix CVE-2022-28463
>
>  .../sshfs-fuse/sshfs-fuse/run-ptest                |    9 +
>  .../sshfs-fuse/sshfs-fuse_3.7.3.bb                 |    2 +
>  .../recipes-support/fuse/fuse3/run-ptest           |    1 +
>  .../recipes-support/fuse/fuse3_3.10.5.bb           |    3 +
>  .../recipes-gimp/gimp/gimp/CVE-2022-30067.patch    |   64 +
>  .../recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch  |   97 +
>  .../recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch  |  178 ++
>  .../recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch  |   35 +
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb       |   10 +-
>  meta-gnome/recipes-gnome/evince/evince_42.3.bb     |    4 +
>  .../klibc/files/CVE-2021-31870.patch               |   45 +
>  .../klibc/files/CVE-2021-31871.patch               |   34 +
>  .../klibc/files/CVE-2021-31872.patch               |   70 +
>  .../klibc/files/CVE-2021-31873.patch               |   43 +
>  meta-initramfs/recipes-devtools/klibc/klibc.inc    |    4 +
>  .../libopenmpt/libopenmpt_0.6.2.bb                 |    1 +
>  ...issing-include-utf8.h-to-codec_skeleton.c.patch |   28 +
>  .../vorbis-tools/vorbis-tools/CVE-2023-43361.patch |   57 +
>  .../vorbis-tools/vorbis-tools_1.4.2.bb             |    3 +-
>  .../0001-Sanitize-upload-filename-like-URL.patch   |   27 +
>  ...-example-Upload-to-temporary-directory-an.patch |   90 +
>  .../recipes-connectivity/civetweb/civetweb_git.bb  |    2 +
>  .../{mbedtls_2.28.9.bb =3D> mbedtls_2.28.10.bb}      |    4 +-
>  .../keepalived/keepalived/CVE-2021-44225.patch     |   41 +
>  .../recipes-daemons/keepalived/keepalived_2.2.2.bb |    1 +
>  .../proftpd/files/CVE-2023-48795.patch             |  751 +++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.7c.bb      |    1 +
>  ...correct-and-unnecessary-xmlSetFeature-cal.patch |   35 +
>  .../squid/files/CVE-2021-46784.patch               |  133 ++
>  .../squid/files/CVE-2022-41317.patch               |   26 +
>  .../squid/files/CVE-2022-41318.patch               |   45 +
>  .../squid/files/CVE-2023-46724.patch               |   41 +
>  .../squid/files/CVE-2023-5824.patch                |    2 +-
>  .../squid/files/CVE-2025-59362.patch               |   51 +
>  .../recipes-daemons/squid/squid_4.15.bb            |    6 +
>  .../python/python3-scapy/run-ptest                 |    7 +
>  .../recipes-devtools/python/python3-scapy_2.4.5.bb |   13 +
>  .../netkit-telnet/files/CVE-2022-39028.patch       |   72 +
>  .../netkit-telnet/netkit-telnet_0.17.bb            |    1 +
>  .../recipes-protocols/freediameter/files/run-ptest |    2 +-
>  .../recipes-protocols/frr/frr/CVE-2024-31949.patch |  153 ++
>  meta-networking/recipes-protocols/frr/frr_8.2.2.bb |    3 +
>  .../recipes-protocols/net-snmp/net-snmp_5.9.3.bb   |    6 +-
>  .../recipes-protocols/openl2tp/openl2tp/run-ptest  |    7 +-
>  .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |    1 +
>  ...ndling-passdbs-with-identical-driver-args.patch |  137 ++
>  ...tp-server-connection-Fix-STARTTLS-command.patch |   76 +
>  .../recipes-support/dovecot/dovecot_2.3.14.bb      |    2 +
>  .../open-vm-tools/CVE-2025-41244.patch             |  124 ++
>  .../open-vm-tools/open-vm-tools_11.3.5.bb          |    1 +
>  .../tcpreplay/tcpreplay/CVE-2025-51006.patch       |   97 +
>  .../tcpreplay/tcpreplay/CVE-2025-9157.patch        |   44 +
>  .../recipes-support/tcpreplay/tcpreplay_4.4.4.bb   |    4 +-
>  .../unbound/unbound/CVE-2022-30698_30699.patch     |  627 ++++++
>  .../unbound/unbound/CVE-2022-3204.patch            |  221 ++
>  .../recipes-support/unbound/unbound_1.15.0.bb      |    2 +
>  .../meta-python/recipes-dbs/mongodb/mongodb_git.bb |    1 +
>  .../recipes-benchmark/fio/fio/CVE-2025-10823.patch |   37 +
>  meta-oe/recipes-benchmark/fio/fio_3.30.bb          |    2 +
>  meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb  |    3 +
>  meta-oe/recipes-connectivity/ace/ace_6.5.12.bb     |    3 +
>  .../recipes-connectivity/gattlib/gattlib_git.bb    |    3 +
>  .../hostapd/hostapd/CVE-2022-37660-01.patch        |  249 +++
>  .../hostapd/hostapd/CVE-2022-37660-02.patch        |  111 +
>  .../hostapd/hostapd/CVE-2022-37660-03.patch        |  762 +++++++
>  .../hostapd/hostapd/CVE-2022-37660-04.patch        |   85 +
>  .../hostapd/hostapd/CVE-2025-24912-01.patch        |   79 +
>  .../hostapd/hostapd/CVE-2025-24912-02.patch        |   70 +
>  .../recipes-connectivity/hostapd/hostapd_2.10.bb   |    6 +
>  meta-oe/recipes-core/emlog/emlog.inc               |    2 +
>  meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest |    4 +
>  meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb  |    7 +
>  .../libxml/libxml++/libxml++_ptest.patch           |   78 -
>  meta-oe/recipes-core/libxml/libxml++/run-ptest     |    5 +-
>  meta-oe/recipes-core/libxml/libxml++_2.42.1.bb     |   12 +-
>  .../sdbus-c++/sdbus-c++-1.0.0/run-ptest            |   12 +-
>  ...lue-barriers-to-avoid-compiler-induced-si.patch |   67 +
>  ...0001-Address-various-name-constraint-bugs.patch |  749 +++++++
>  ...cate_Store_In_Memory-c-tor-that-takes-a-v.patch |   31 +
>  ...ediates-can-sign-their-own-OCSP-responses.patch |   36 +
>  ...-validation-of-authority-of-delegation-re.patch |  106 +
>  .../botan/botan/0004-review-comments.patch         |   28 +
>  meta-oe/recipes-crypto/botan/botan_2.19.1.bb       |    9 +-
>  .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb  |    6 +-
>  meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb    |    3 +
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |    2 +
>  .../recipes-dbs/mysql/mariadb/CVE-2025-21490.patch |   96 +
>  .../recipes-dbs/mysql/mariadb/CVE-2025-30722.patch |  176 ++
>  .../cjson/cjson/CVE-2025-57052.patch               |   33 -
>  .../cjson/{cjson_1.7.18.bb =3D> cjson_1.7.19.bb}     |    3 +-
>  .../iptraf/iptraf-ng/CVE-2024-52949.patch          |  218 ++
>  meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb |    1 +
>  meta-oe/recipes-devtools/jemalloc/files/run-ptest  |   29 +-
>  .../recipes-devtools/jemalloc/jemalloc_5.2.1.bb    |    7 +-
>  meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch |   49 +
>  meta-oe/recipes-devtools/jq/jq_git.bb              |    1 +
>  meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb |    6 +-
>  .../yasm/yasm/CVE-2024-22653.patch                 |   32 +
>  meta-oe/recipes-devtools/yasm/yasm_git.bb          |    1 +
>  meta-oe/recipes-extended/ostree/ostree/run-ptest   |   13 +-
>  ...rent-locales-in-remote-gpg-list-keys-test.patch |  102 +
>  meta-oe/recipes-extended/ostree/ostree_2021.6.bb   |    2 +
>  .../redis/redis-7.0.13/CVE-2025-27151.patch        |   32 +
>  .../redis/redis-7.0.13/CVE-2025-32023.patch        |  215 ++
>  .../redis/redis-7.0.13/CVE-2025-46817.patch        |  101 +
>  .../redis/redis-7.0.13/CVE-2025-46818.patch        |  283 +++
>  .../redis/redis-7.0.13/CVE-2025-46819.patch        |  161 ++
>  .../redis/redis-7.0.13/CVE-2025-48367.patch        |  111 +
>  .../redis/redis-7.0.13/CVE-2025-49844.patch        |   35 +
>  meta-oe/recipes-extended/redis/redis_7.0.13.bb     |    7 +
>  ...uffer-overflow-at-zlog_conf_build_with_fi.patch |   25 +
>  meta-oe/recipes-extended/zlog/zlog_1.2.15.bb       |    4 +-
>  .../libjcat/install_missing_ptest_binary.patch     |   25 +
>  meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb    |    5 +
>  meta-oe/recipes-graphics/fbida/fbida_2.14.bb       |    5 +
>  .../files/0007-make-fbpdf-build-optional.patch     |  102 +
>  .../renderdoc/CVE-2023-33863-33864-33865-1.patch   |   71 +
>  .../renderdoc/CVE-2023-33863-33864-33865-2.patch   |   72 +
>  .../renderdoc/CVE-2023-33863-33864-33865-3.patch   |  160 ++
>  .../renderdoc/CVE-2023-33863-33864-33865-4.patch   |   28 +
>  .../renderdoc/CVE-2023-33863-33864-33865-5.patch   |   40 +
>  .../recipes-graphics/renderdoc/renderdoc_1.13.bb   |   12 +-
>  meta-oe/recipes-graphics/suckless/st_0.8.5.bb      |    3 +
>  .../kernel-selftest/kernel-selftest.bb             |    2 +-
>  .../kernel-selftest/kernel-selftest/run-ptest      |    8 +-
>  meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb  |    9 +-
>  .../0001-Check-return-value-of-ltp_data.patch      |   31 +
>  ...-SBR-frame-length-to-960-and-1024-samples.patch |   87 +
>  ...001-fix-heap-buffer-overflow-in-mp4read.c.patch |   37 +
>  ...ix-stack-buffer-overflow-in-stringin-ftyp.patch |   28 +
>  meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb    |    7 +-
>  meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb  |    3 +
>  .../wavpack/wavpack/CVE-2016-10169.patch           |   27 +
>  .../recipes-multimedia/wavpack/wavpack_4.60.1.bb   |    4 +-
>  meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb      |    3 +
>  ...ox.inc.sh-update-regex-for-getting-endian.patch |   35 +
>  .../recipes-security/keyutils/keyutils_1.6.1.bb    |    3 +-
>  meta-oe/recipes-shells/dash/dash_0.5.11.5.bb       |    2 +
>  meta-oe/recipes-support/cli11/cli11/run-ptest      |    5 +
>  meta-oe/recipes-support/cli11/cli11_1.9.1.bb       |   11 +-
>  meta-oe/recipes-support/fmt/fmt/run-ptest          |    5 +
>  meta-oe/recipes-support/fmt/fmt_8.1.1.bb           |   10 +-
>  .../recipes-support/function2/function2/run-ptest  |    3 +
>  .../recipes-support/function2/function2_4.2.0.bb   |    9 +-
>  .../imagemagick/files/CVE-2022-28463.patch         |   26 +
>  .../imagemagick/imagemagick_7.0.10.bb              |    1 +
>  .../iniparser/iniparser/CVE-2025-0633.patch        |   38 +
>  meta-oe/recipes-support/iniparser/iniparser_4.1.bb |    1 +
>  .../inotify-tools/inotify-tools/run-ptest          |   15 +
>  .../inotify-tools/inotify-tools_3.22.1.0.bb        |   16 +-
>  .../libmanette/libmanette/run-ptest                |   10 +
>  .../recipes-support/libmanette/libmanette_0.2.6.bb |    7 +-
>  .../libssh/libssh/CVE-2025-4878-1.patch            | 2196
> ++++++++++++++++++++
>  .../libssh/libssh/CVE-2025-4878-2.patch            |   33 +
>  .../libssh/libssh/CVE-2025-8277-1.patch            |   57 +
>  .../libssh/libssh/CVE-2025-8277-2.patch            |   50 +
>  .../libssh/libssh/CVE-2025-8277-3.patch            |   50 +
>  meta-oe/recipes-support/libssh/libssh_0.8.9.bb     |    5 +
>  meta-oe/recipes-support/libteam/libteam_1.31.bb    |    8 +-
>  .../opensc/files/CVE-2023-5992-0001.patch          |  359 ++++
>  .../opensc/files/CVE-2023-5992-0002.patch          |  269 +++
>  .../opensc/files/CVE-2023-5992-0003.patch          |   41 +
>  .../opensc/files/CVE-2023-5992-0004.patch          |  109 +
>  .../opensc/files/CVE-2023-5992-0005.patch          |   63 +
>  .../opensc/files/CVE-2023-5992-0006.patch          |  118 ++
>  .../opensc/files/CVE-2023-5992-0007.patch          |   50 +
>  .../opensc/files/CVE-2023-5992-0008.patch          |   37 +
>  .../opensc/files/CVE-2023-5992-0009.patch          |  123 ++
>  .../opensc/files/CVE-2023-5992-0010.patch          |   75 +
>  meta-oe/recipes-support/opensc/opensc_0.22.0.bb    |   10 +
>  ...se-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch |   26 +
>  meta-oe/recipes-support/poco/poco/run-ptest        |   18 +-
>  meta-oe/recipes-support/poco/poco_1.11.2.bb        |   20 +-
>  .../poppler/poppler/CVE-2025-43718.patch           |   31 +
>  .../poppler/poppler/CVE-2025-52885.patch           |   30 +
>  meta-oe/recipes-support/poppler/poppler_22.04.0.bb |    2 +
>  meta-oe/recipes-support/pv/pv_1.6.20.bb            |    2 +-
>  .../udisks/udisks2/CVE-2025-8067.patch             |   37 +
>  meta-oe/recipes-support/udisks/udisks2_2.9.4.bb    |    4 +-
>  ...overflow-errors-in-malformed-zchunk-files.patch |  105 +
>  meta-oe/recipes-support/zchunk/zchunk/run-ptest    |  139 ++
>  meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb     |   14 +-
>  .../libauthen/libauthen-sasl-perl_2.16.bb          |    4 +
>  .../files/0001-correct-libperl-regex.patch         |   42 +
>  .../libconfig/libconfig-autoconf-perl_0.319.bb     |   16 +-
>  .../libcrypt/libcrypt-openssl-guess-perl_0.15.bb   |    1 +
>  .../recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb  |    3 +
>  .../recipes-perl/libencode/libencode-perl_3.17.bb  |    2 +
>  .../libfile/libfile-slurper-perl_0.013.bb          |    5 +
>  .../libmime/libmime-types-perl_2.17.bb             |    2 +-
>  meta-perl/recipes-perl/libnet/files/run-ptest      |    6 +
>  .../recipes-perl/libnet/libnet-dns-perl_1.33.bb    |   11 +-
>  .../libstatgrab/libunix-statgrab_0.112.bb          |    4 +
>  .../libtest/libtest-harness-perl_3.44.bb           |   12 +
>  .../libxml/libxml-libxml-perl_2.0134.bb            |    2 +
>  .../python/python3-aiohttp/CVE-2024-23829.patch    |  344 +++
>  .../python/python3-aiohttp_3.8.6.bb                |    1 +
>  .../0001-fix-failing-ptests.patch                  |   54 +
>  .../python/python3-aspectlib_1.5.2.bb              |    1 +
>  .../fix-direct-calls-to-test-fixtures.patch        |   41 +
>  .../python/python3-betamax/fix-failing-ptest.patch |   44 +
>  .../python/python3-betamax/run-ptest               |    6 +
>  .../python/python3-betamax_0.8.1.bb                |    2 +
>  .../python/python3-gevent/CVE-2023-41419.patch     |    2 +-
>  ...ventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch |   54 +
>  .../python/python3-gunicorn_20.1.0.bb              |    3 +-
>  .../python/python3-pillow/CVE-2024-28219.patch     |   43 +
>  .../python/python3-pillow_9.4.0.bb                 |    1 +
>  .../recipes-devtools/python/python3-pint/run-ptest |    3 +-
>  .../recipes-devtools/python/python3-pint_0.19.1.bb |    6 +-
>  .../python/python3-py-cpuinfo_8.0.0.bb             |    1 +
>  .../python/python3-requests-toolbelt/run-ptest     |    2 +-
>  .../update_tests_for_latest_libxml.patch           |  162 ++
>  .../python/python3-soupsieve_2.3.1.bb              |    1 +
>  .../python/python3-typeguard_2.13.3.bb             |    1 +
>  .../python/python3-ujson/run-ptest                 |    2 +-
>  ...terminstic-test_minimize_dfa-test-as-XFAI.patch |   29 +
>  .../python/python3-whoosh_2.7.4.bb                 |    2 +
>  ...square-bracket-handling-in-URL-netloc-882.patch |  138 ++
>  .../recipes-devtools/python/python3-yarl_1.7.2.bb  |    3 +-
>  .../recipes-httpd/apache2/apache2_2.4.65.bb        |   21 +
>  ...-permissions-check-when-saving-allowed-cr.patch |   25 +
>  ...Escape-potentially-malicious-HTTP-headers.patch |   53 +
>  .../0001-Foreign-module-may-need-a-check.patch     |   27 +
>  .../0001-HTML-escape-command-description.patch     |   29 +
>  ...t-names-cannot-contact-special-characters.patch |   26 +
>  .../recipes-webadmin/webmin/webmin_1.850.bb        |    7 +-
>  227 files changed, 13948 insertions(+), 198 deletions(-)
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-30067.patc=
h
>  create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch
>  create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch
>  create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch
>  create mode 100644
> meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31870.patch
>  create mode 100644
> meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31871.patch
>  create mode 100644
> meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31872.patch
>  create mode 100644
> meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31873.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-m=
issing-include-utf8.h-to-codec_skeleton.c.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-433=
61.patch
>  create mode 100644
> meta-networking/recipes-connectivity/civetweb/civetweb/0001-Sanitize-uplo=
ad-filename-like-URL.patch
>  create mode 100644
> meta-networking/recipes-connectivity/civetweb/civetweb/0002-handle_form-e=
xample-Upload-to-temporary-directory-an.patch
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb
> =3D> mbedtls_2.28.10.bb} (96%)
>  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2021-44225.patc=
h
>  create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/0001-ESI-Drop-incorrect-and-u=
nnecessary-xmlSetFeature-cal.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2021-46784.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2022-41317.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2022-41318.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46724.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
>  create mode 100644
> meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
>  create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-pa=
ssdbs-with-identical-driver-args.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0001-lib-smtp-smtp-server=
-connection-Fix-STARTTLS-command.patch
>  create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-4124=
4.patch
>  create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.patch
>  create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2022-30698_30699.patc=
h
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2022-3204.patch
>  create mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patc=
h
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-01.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-02.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-03.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-04.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
>  create mode 100644 meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest
>  delete mode 100644
> meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
>  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-=
compiler-induced-si.patch
>  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-b=
ugs.patch
>  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0001-add-Certificate_Store_In_Memory-c=
-tor-that-takes-a-v.patch
>  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0002-FIX-intermediates-can-sign-their-=
own-OCSP-responses.patch
>  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0003-FIX-missing-validation-of-authori=
ty-of-delegation-re.patch
>  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0004-review-comments.patch
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-21490.patc=
h
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30722.patc=
h
>  delete mode 100644
> meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
>  rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb =3D> cjson_1.7.19=
.bb}
> (85%)
>  create mode 100644
> meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024-52949.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch
>  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.pat=
ch
>  create mode 100644
> meta-oe/recipes-extended/ostree/ostree/tests-account-for-different-locale=
s-in-remote-gpg-list-keys-test.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-27151.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-32023.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46817.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46818.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46819.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-48367.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-49844.patch
>  create mode 100644
> meta-oe/recipes-extended/zlog/zlog/0001-Fix-stack-buffer-overflow-at-zlog=
_conf_build_with_fi.patch
>  create mode 100644
> meta-oe/recipes-gnome/libjcat/libjcat/install_missing_ptest_binary.patch
>  create mode 100644
> meta-oe/recipes-graphics/fbida/files/0007-make-fbpdf-build-optional.patch
>  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-1=
.patch
>  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-2=
.patch
>  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-3=
.patch
>  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-4=
.patch
>  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-5=
.patch
>  create mode 100644
> meta-oe/recipes-multimedia/faad2/faad2/0001-Check-return-value-of-ltp_dat=
a.patch
>  create mode 100644
> meta-oe/recipes-multimedia/faad2/faad2/0001-Restrict-SBR-frame-length-to-=
960-and-1024-samples.patch
>  create mode 100644
> meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-m=
p4read.c.patch
>  create mode 100644
> meta-oe/recipes-multimedia/faad2/faad2/0001-mp4read.c-fix-stack-buffer-ov=
erflow-in-stringin-ftyp.patch
>  create mode 100644
> meta-oe/recipes-multimedia/wavpack/wavpack/CVE-2016-10169.patch
>  create mode 100644
> meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-=
regex-for-getting-endian.patch
>  create mode 100644 meta-oe/recipes-support/cli11/cli11/run-ptest
>  create mode 100644 meta-oe/recipes-support/fmt/fmt/run-ptest
>  create mode 100644 meta-oe/recipes-support/function2/function2/run-ptest
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
>  create mode 100644
> meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch
>  create mode 100644
> meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
>  create mode 100644 meta-oe/recipes-support/libmanette/libmanette/run-pte=
st
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-4878-1.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-4878-2.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0001.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0002.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0003.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0004.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0005.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0006.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0007.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0008.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0009.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0010.patch
>  create mode 100644
> meta-oe/recipes-support/poco/poco/0001-fix-test-Use-96-bit-IV-with-aes-25=
6-gcm-to-fix-4347.patch
>  create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch
>  create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2025-8067.patch
>  create mode 100644
> meta-oe/recipes-support/zchunk/zchunk/0001-Handle-overflow-errors-in-malf=
ormed-zchunk-files.patch
>  create mode 100644 meta-oe/recipes-support/zchunk/zchunk/run-ptest
>  create mode 100644
> meta-perl/recipes-perl/libconfig/files/0001-correct-libperl-regex.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23829.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aspectlib/0001-fix-failing-pt=
ests.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-betamax/fix-direct-calls-to-t=
est-fixtures.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-betamax/fix-failing-ptest.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-gunicorn/eventlet-worker-ALRE=
ADY_HANDLED-WSGI_LOCAL.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2024-28219.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-soupsieve/update_tests_for_la=
test_libxml.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determin=
stic-test_minimize_dfa-test-as-XFAI.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-yarl/0001-Correct-square-brac=
ket-handling-in-URL-netloc-882.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Add-missing-permissions=
-check-when-saving-allowed-cr.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Escape-potentially-mali=
cious-HTTP-headers.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Foreign-module-may-need=
-a-check.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-HTML-escape-command-des=
cription.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Object-names-cannot-con=
tact-special-characters.patch
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121656):
> https://lists.openembedded.org/g/openembedded-devel/message/121656
> Mute This Topic: https://lists.openembedded.org/mt/116281359/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001ed462064389cfc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">applied now thanks</div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13, 20=
25 at 12:34=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
This new Kirkstone Pull Request contains many CVE and ptest <br>
fixes - thank you all who contributed to this release.<br>
<br>
arm build logs: <a href=3D"https://github.com/OldManYellsAtCloud/meta-oe-te=
st/actions/runs/19295298643/job/55175680474aarch64" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/actions/ru=
ns/19295298643/job/55175680474<br>
aarch64</a> build logs: <a href=3D"https://github.com/OldManYellsAtCloud/me=
ta-oe-test/actions/runs/19295436972/job/55176140854x86" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/action=
s/runs/19295436972/job/55176140854<br>
x86</a> build logs: <a href=3D"https://github.com/OldManYellsAtCloud/meta-o=
e-test/actions/runs/19295439984/job/55176150598x86-64" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/actions=
/runs/19295439984/job/55176150598<br>
x86-64</a> build logs: <a href=3D"https://github.com/OldManYellsAtCloud/met=
a-oe-test/actions/runs/19260539512/job/55064120322" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/actions/ru=
ns/19260539512/job/55064120322</a><br>
YP compatibility check logs: <a href=3D"https://github.com/OldManYellsAtClo=
ud/meta-oe-test/actions/runs/19295447503/job/55176174138" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/acti=
ons/runs/19295447503/job/55176174138</a><br>
ptest build and run results (x86-64, gcc+glibc): <a href=3D"https://github.=
com/OldManYellsAtCloud/meta-oe-test/actions/runs/19297105771" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/=
actions/runs/19297105771</a><br>
ptest logs (change the placeholders): sarvari $dot me $slash yocto $slash p=
test-kirkstone-2025-11.tar.gz<br>
<br>
Please let me know if you have any questions or comments.<br>
<br>
Thank you<br>
<br>
---<br>
<br>
The following changes since commit 96fbc156364fd78530d2bfbe1b8a77789f52997d=
:<br>
<br>
=C2=A0 collectd: set working SRC_URI (2025-10-02 15:16:50 +0200)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembe=
dded-contrib</a> stable/kirkstone-nut<br>
<br>
for you to fetch changes up to 07ac1890c843b374c27e150f1a2e53ad3db2a8e4:<br=
>
<br>
=C2=A0 libssh: fix CVE-2025-8277 (2025-11-11 08:50:50 +0100)<br>
<br>
----------------------------------------------------------------<br>
Alexandre Truong (1):<br>
=C2=A0 =C2=A0 =C2=A0 evince: Update status for CVE-2011-0433 and CVE-2011-5=
244<br>
<br>
Archana Polampalli (2):<br>
=C2=A0 =C2=A0 =C2=A0 tcpreplay: fix CVE-2025-9157<br>
=C2=A0 =C2=A0 =C2=A0 tcpreplay: fix CVE-2025-51006<br>
<br>
Changqing Li (1):<br>
=C2=A0 =C2=A0 =C2=A0 keyutils: fix ptest failed since &quot;+++ Can&#39;t D=
etermine Endianness&quot;<br>
<br>
Chen Qi (1):<br>
=C2=A0 =C2=A0 =C2=A0 frr: add CVE_PRODUCT<br>
<br>
Derek Straka (1):<br>
=C2=A0 =C2=A0 =C2=A0 python3-typeguard: update ptest dependencies<br>
<br>
Divya Chellam (3):<br>
=C2=A0 =C2=A0 =C2=A0 mariadb: fix CVE-2025-21490<br>
=C2=A0 =C2=A0 =C2=A0 jq: fix CVE-2025-9403<br>
=C2=A0 =C2=A0 =C2=A0 mariadb: fix CVE-2025-30722<br>
<br>
Gyorgy Sarvari (86):<br>
=C2=A0 =C2=A0 =C2=A0 ace: ignore CVE-2009-1147<br>
=C2=A0 =C2=A0 =C2=A0 apache2: ignore irrelevant CVEs<br>
=C2=A0 =C2=A0 =C2=A0 civetweb: patch CVE-2020-27304<br>
=C2=A0 =C2=A0 =C2=A0 dovecot: patch CVE-2022-30550<br>
=C2=A0 =C2=A0 =C2=A0 dovecot: patch CVE-2021-33515<br>
=C2=A0 =C2=A0 =C2=A0 botan: patch CVE-2022-43705<br>
=C2=A0 =C2=A0 =C2=A0 botan: patch CVE-2024-39312<br>
=C2=A0 =C2=A0 =C2=A0 botan: patch CVE-2024-50382 and CVE-2024-50383<br>
=C2=A0 =C2=A0 =C2=A0 iperf2: ignore irrelevant CVEs<br>
=C2=A0 =C2=A0 =C2=A0 zlog: patch CVE-2021-43521<br>
=C2=A0 =C2=A0 =C2=A0 zchunk: patch CVE-2023-46228<br>
=C2=A0 =C2=A0 =C2=A0 webmin: patch CVE-2017-15644, CVE-2017-15645 and CVE-2=
017-15646<br>
=C2=A0 =C2=A0 =C2=A0 webmin: patch CVE-2017-17089<br>
=C2=A0 =C2=A0 =C2=A0 webmin: patch CVE-2019-15642<br>
=C2=A0 =C2=A0 =C2=A0 webmin: patch CVE-2022-0824<br>
=C2=A0 =C2=A0 =C2=A0 webmin: patch CVE-2022-0829<br>
=C2=A0 =C2=A0 =C2=A0 apache2: ignore CVE-2025-3891<br>
=C2=A0 =C2=A0 =C2=A0 faad2: patch CVE-2021-32272<br>
=C2=A0 =C2=A0 =C2=A0 faad2: patch CVE-2021-32273<br>
=C2=A0 =C2=A0 =C2=A0 faad2: patch CVE-2021-32274 and CVE-2021-32277<br>
=C2=A0 =C2=A0 =C2=A0 faad2: patch CVE-2021-32278<br>
=C2=A0 =C2=A0 =C2=A0 cli11: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 fmt: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 function2: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 kernel-selftest: fix ptest<br>
=C2=A0 =C2=A0 =C2=A0 keyutils: add missing ptest dependencies<br>
=C2=A0 =C2=A0 =C2=A0 libdbi-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libjcat: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libmanette: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libxml++-5.0: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 pv: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 sdbus-c++: fix ptest script output<br>
=C2=A0 =C2=A0 =C2=A0 python3-ujson: fix run-ptest script<br>
=C2=A0 =C2=A0 =C2=A0 python3-soupsieve: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 python3-betamax: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 python3-yarl: fix ptests (and make it compatible with =
current python)<br>
=C2=A0 =C2=A0 =C2=A0 cryptsetup: extend licenses with Apache and CC0<br>
=C2=A0 =C2=A0 =C2=A0 zchunk: add ptest support<br>
=C2=A0 =C2=A0 =C2=A0 wavpack: patch CVE-2016-10169<br>
=C2=A0 =C2=A0 =C2=A0 netkit-telnet: patch CVE-2022-39028<br>
=C2=A0 =C2=A0 =C2=A0 renderdoc: patch CVE-2023-33863, CVE-2023-33864 and CV=
E-2023-33865<br>
=C2=A0 =C2=A0 =C2=A0 squid: patch CVE-2021-46784<br>
=C2=A0 =C2=A0 =C2=A0 squid: patch CVE-2022-41317<br>
=C2=A0 =C2=A0 =C2=A0 squid: patch CVE-2022-41318<br>
=C2=A0 =C2=A0 =C2=A0 squid: patch CVE-2023-46724<br>
=C2=A0 =C2=A0 =C2=A0 squid: patch CVE-2025-59362<br>
=C2=A0 =C2=A0 =C2=A0 squid: fix esi PACKAGECONFIG<br>
=C2=A0 =C2=A0 =C2=A0 python3-py-cpuinfo: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 python3-requests-toolbelt: disable tests with expired =
certificate<br>
=C2=A0 =C2=A0 =C2=A0 python3-pint: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 python3-gevent: fix syntax error in cve patch<br>
=C2=A0 =C2=A0 =C2=A0 python3-gunicorn: add patch work with geventlet<br>
=C2=A0 =C2=A0 =C2=A0 klibc: patch CVE-2021-31870<br>
=C2=A0 =C2=A0 =C2=A0 klibc: patch CVE-2021-31871<br>
=C2=A0 =C2=A0 =C2=A0 klibc: patch CVE-2021-31872<br>
=C2=A0 =C2=A0 =C2=A0 klibc: patch CVE-2021-31873<br>
=C2=A0 =C2=A0 =C2=A0 gattlib: ignore CVE-2019-6498<br>
=C2=A0 =C2=A0 =C2=A0 iptraf-ng: patch CVE-2024-52949<br>
=C2=A0 =C2=A0 =C2=A0 keepalived: patch CVE-2021-44225<br>
=C2=A0 =C2=A0 =C2=A0 libxml-libxml-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libunix-statgrab: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libtest-harness-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 python3-scapy: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 freediameter: fix run-ptest reporting<br>
=C2=A0 =C2=A0 =C2=A0 net-snmp: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 sshfs-fuse: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 fuse3: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libopenmpt: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libauthen-sasl-perl: fix ptest<br>
=C2=A0 =C2=A0 =C2=A0 libconfig-autoconf-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libcrypt-openssl-guess-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libdbd-sqlite-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libfile-slurper-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libmime-types-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libencode-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 mongodb: add tzdata to runtime dependencies<br>
=C2=A0 =C2=A0 =C2=A0 poco: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 ostree: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libxml++: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 python3-aspectlib: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 libnet-dns-perl: fix ptests<br>
=C2=A0 =C2=A0 =C2=A0 gimp: ignore CVE-2007-3741<br>
=C2=A0 =C2=A0 =C2=A0 inotify-tools: add PASS/FAIL status to run-ptest scrip=
t<br>
=C2=A0 =C2=A0 =C2=A0 gimp: patch CVE-2022-30067<br>
=C2=A0 =C2=A0 =C2=A0 gimp: patch CVE-2022-32990<br>
=C2=A0 =C2=A0 =C2=A0 poco: remove mongodb from ptest RDEPENDS<br>
<br>
Khem Raj (4):<br>
=C2=A0 =C2=A0 =C2=A0 libteam: Add missing dependencies revealed by ptests<b=
r>
=C2=A0 =C2=A0 =C2=A0 oprofile: Fix failing ptests<br>
=C2=A0 =C2=A0 =C2=A0 python3-whoosh: Fix an intermittent ptest<br>
=C2=A0 =C2=A0 =C2=A0 openl2tp: Fix ptests<br>
<br>
Nikhil R (1):<br>
=C2=A0 =C2=A0 =C2=A0 inotify-tools: add ptest support for inotify-tools<br>
<br>
Ninette Adhikari (3):<br>
=C2=A0 =C2=A0 =C2=A0 xsp: CVE status update for CVE-2006-2658<br>
=C2=A0 =C2=A0 =C2=A0 st: Update status for CVE-2017-16224<br>
=C2=A0 =C2=A0 =C2=A0 influxdb: Update CVE status for CVE-2019-10329<br>
<br>
Peter Marko (6):<br>
=C2=A0 =C2=A0 =C2=A0 emlog: set CVE_PRODUCT<br>
=C2=A0 =C2=A0 =C2=A0 squid: mark CVE-2025-54574 as patched<br>
=C2=A0 =C2=A0 =C2=A0 dash: set CVE_PRODUCT<br>
=C2=A0 =C2=A0 =C2=A0 id3lib: mark CVE-2007-4460 as fixed<br>
=C2=A0 =C2=A0 =C2=A0 hostapd: patch CVE-2025-24912<br>
=C2=A0 =C2=A0 =C2=A0 hostapd: patch CVE-2022-37660<br>
<br>
Praveen Kumar (2):<br>
=C2=A0 =C2=A0 =C2=A0 yasm: fix CVE-2024-22653<br>
=C2=A0 =C2=A0 =C2=A0 cjson: upgrade 1.7.18 -&gt; 1.7.19<br>
<br>
Rajeshkumar Ramasamy (3):<br>
=C2=A0 =C2=A0 =C2=A0 open-vm-tools: fix CVE-2025-41244<br>
=C2=A0 =C2=A0 =C2=A0 libssh: fix CVE-2025-4878<br>
=C2=A0 =C2=A0 =C2=A0 libssh: fix CVE-2025-8277<br>
<br>
Sana Kazi (1):<br>
=C2=A0 =C2=A0 =C2=A0 cryptsetup: Update the license field<br>
<br>
Saravanan (2):<br>
=C2=A0 =C2=A0 =C2=A0 udisks2: fix CVE-2025-8067<br>
=C2=A0 =C2=A0 =C2=A0 fio: fix CVE-2025-10823<br>
<br>
Soumya Sambu (3):<br>
=C2=A0 =C2=A0 =C2=A0 iniparser: Fix CVE-2025-0633<br>
=C2=A0 =C2=A0 =C2=A0 python3-pillow: Fix CVE-2024-28219<br>
=C2=A0 =C2=A0 =C2=A0 python3-aiohttp: Fix CVE-2024-23829<br>
<br>
Vijay Anusuri (11):<br>
=C2=A0 =C2=A0 =C2=A0 vorbis-tools: Fix CVE-2023-43361<br>
=C2=A0 =C2=A0 =C2=A0 redis: Fix CVE-2025-27151<br>
=C2=A0 =C2=A0 =C2=A0 redis: Fix CVE-2025-32023<br>
=C2=A0 =C2=A0 =C2=A0 redis: Fix CVE-2025-48367<br>
=C2=A0 =C2=A0 =C2=A0 redis: Fix CVE-2025-46817<br>
=C2=A0 =C2=A0 =C2=A0 redis: Fix CVE-2025-46818<br>
=C2=A0 =C2=A0 =C2=A0 redis: Fix CVE-2025-46819<br>
=C2=A0 =C2=A0 =C2=A0 redis: Fix CVE-2025-49844<br>
=C2=A0 =C2=A0 =C2=A0 proftpd: Fix CVE-2023-48795<br>
=C2=A0 =C2=A0 =C2=A0 unbound: Fix for CVE-2022-30698 and CVE-2022-30699<br>
=C2=A0 =C2=A0 =C2=A0 unbound: Fix CVE-2022-3204<br>
<br>
Wentao Zhang (1):<br>
=C2=A0 =C2=A0 =C2=A0 jemalloc: include the missing shell scripts and source=
 the corresponds shell scripts for some test cases.<br>
<br>
Yi Zhao (1):<br>
=C2=A0 =C2=A0 =C2=A0 mbedtls: upgrade 2.28.9 -&gt; 2.28.10<br>
<br>
Yogita Urade (2):<br>
=C2=A0 =C2=A0 =C2=A0 poppler: fix CVE-2025-43718<br>
=C2=A0 =C2=A0 =C2=A0 poppler: fix CVE-2025-52885<br>
<br>
Zhang Peng (2):<br>
=C2=A0 =C2=A0 =C2=A0 frr: fix CVE-2024-31949<br>
=C2=A0 =C2=A0 =C2=A0 opensc: fix CVE-2023-5992<br>
<br>
simoneScaravati (1):<br>
=C2=A0 =C2=A0 =C2=A0 fbida: fix make fbpdf build optional<br>
<br>
virendra thakur (1):<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2022-28463<br>
<br>
=C2=A0.../sshfs-fuse/sshfs-fuse/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 +<br>
=C2=A0.../sshfs-fuse/<a href=3D"http://sshfs-fuse_3.7.3.bb" rel=3D"noreferr=
er" target=3D"_blank">sshfs-fuse_3.7.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../recipes-support/fuse/fuse3/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../recipes-support/fuse/<a href=3D"http://fuse3_3.10.5.bb" rel=3D"no=
referrer" target=3D"_blank">fuse3_3.10.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +<br>
=C2=A0.../recipes-gimp/gimp/gimp/CVE-2022-30067.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A064 +<br>
=C2=A0.../recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch=C2=A0 |=C2=A0 =C2=
=A097 +<br>
=C2=A0.../recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch=C2=A0 |=C2=A0 178 +=
+<br>
=C2=A0.../recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch=C2=A0 |=C2=A0 =C2=
=A035 +<br>
=C2=A0meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.30.bb" rel=
=3D"noreferrer" target=3D"_blank">gimp_2.10.30.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A010 +-<br>
=C2=A0meta-gnome/recipes-gnome/evince/<a href=3D"http://evince_42.3.bb" rel=
=3D"noreferrer" target=3D"_blank">evince_42.3.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 4 +<br>
=C2=A0.../klibc/files/CVE-2021-31870.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A045 +<br>
=C2=A0.../klibc/files/CVE-2021-31871.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A034 +<br>
=C2=A0.../klibc/files/CVE-2021-31872.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A070 +<br>
=C2=A0.../klibc/files/CVE-2021-31873.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A043 +<br>
=C2=A0meta-initramfs/recipes-devtools/klibc/klibc.inc=C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 4 +<br>
=C2=A0.../libopenmpt/<a href=3D"http://libopenmpt_0.6.2.bb" rel=3D"noreferr=
er" target=3D"_blank">libopenmpt_0.6.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0...issing-include-utf8.h-to-codec_skeleton.c.patch |=C2=A0 =C2=A028 +=
<br>
=C2=A0.../vorbis-tools/vorbis-tools/CVE-2023-43361.patch |=C2=A0 =C2=A057 +=
<br>
=C2=A0.../vorbis-tools/<a href=3D"http://vorbis-tools_1.4.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">vorbis-tools_1.4.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +-<br>
=C2=A0.../0001-Sanitize-upload-filename-like-URL.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A027 +<br>
=C2=A0...-example-Upload-to-temporary-directory-an.patch |=C2=A0 =C2=A090 +=
<br>
=C2=A0.../recipes-connectivity/civetweb/<a href=3D"http://civetweb_git.bb" =
rel=3D"noreferrer" target=3D"_blank">civetweb_git.bb</a>=C2=A0 |=C2=A0 =C2=
=A0 2 +<br>
=C2=A0.../{<a href=3D"http://mbedtls_2.28.9.bb" rel=3D"noreferrer" target=
=3D"_blank">mbedtls_2.28.9.bb</a> =3D&gt; <a href=3D"http://mbedtls_2.28.10=
.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.10.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-<br>
=C2=A0.../keepalived/keepalived/CVE-2021-44225.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A041 +<br>
=C2=A0.../recipes-daemons/keepalived/<a href=3D"http://keepalived_2.2.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">keepalived_2.2.2.bb</a> |=C2=A0 =C2=
=A0 1 +<br>
=C2=A0.../proftpd/files/CVE-2023-48795.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 751 +++++++<br>
=C2=A0.../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7c.bb" rel=
=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 1 +<br>
=C2=A0...correct-and-unnecessary-xmlSetFeature-cal.patch |=C2=A0 =C2=A035 +=
<br>
=C2=A0.../squid/files/CVE-2021-46784.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 133 ++<br>
=C2=A0.../squid/files/CVE-2022-41317.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A026 +<br>
=C2=A0.../squid/files/CVE-2022-41318.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A045 +<br>
=C2=A0.../squid/files/CVE-2023-46724.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A041 +<br>
=C2=A0.../squid/files/CVE-2023-5824.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../squid/files/CVE-2025-59362.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A051 +<br>
=C2=A0.../recipes-daemons/squid/<a href=3D"http://squid_4.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">squid_4.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 6 +<br>
=C2=A0.../python/python3-scapy/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-scapy_2.4.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-scapy_2.4.5.bb</a> |=C2=A0 =
=C2=A013 +<br>
=C2=A0.../netkit-telnet/files/CVE-2022-39028.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A072 +<br>
=C2=A0.../netkit-telnet/<a href=3D"http://netkit-telnet_0.17.bb" rel=3D"nor=
eferrer" target=3D"_blank">netkit-telnet_0.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0.../recipes-protocols/freediameter/files/run-ptest |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../recipes-protocols/frr/frr/CVE-2024-31949.patch |=C2=A0 153 ++<br>
=C2=A0meta-networking/recipes-protocols/frr/<a href=3D"http://frr_8.2.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">frr_8.2.2.bb</a> |=C2=A0 =C2=A0 3 +<b=
r>
=C2=A0.../recipes-protocols/net-snmp/<a href=3D"http://net-snmp_5.9.3.bb" r=
el=3D"noreferrer" target=3D"_blank">net-snmp_5.9.3.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A0 6 +-<br>
=C2=A0.../recipes-protocols/openl2tp/openl2tp/run-ptest=C2=A0 |=C2=A0 =C2=
=A0 7 +-<br>
=C2=A0.../recipes-protocols/openl2tp/<a href=3D"http://openl2tp_1.8.bb" rel=
=3D"noreferrer" target=3D"_blank">openl2tp_1.8.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 1 +<br>
=C2=A0...ndling-passdbs-with-identical-driver-args.patch |=C2=A0 137 ++<br>
=C2=A0...tp-server-connection-Fix-STARTTLS-command.patch |=C2=A0 =C2=A076 +=
<br>
=C2=A0.../recipes-support/dovecot/<a href=3D"http://dovecot_2.3.14.bb" rel=
=3D"noreferrer" target=3D"_blank">dovecot_2.3.14.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../open-vm-tools/CVE-2025-41244.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 124 ++<br>
=C2=A0.../open-vm-tools/<a href=3D"http://open-vm-tools_11.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">open-vm-tools_11.3.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0.../tcpreplay/tcpreplay/CVE-2025-51006.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A097 +<br>
=C2=A0.../tcpreplay/tcpreplay/CVE-2025-9157.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A044 +<br>
=C2=A0.../recipes-support/tcpreplay/<a href=3D"http://tcpreplay_4.4.4.bb" r=
el=3D"noreferrer" target=3D"_blank">tcpreplay_4.4.4.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A0 4 +-<br>
=C2=A0.../unbound/unbound/CVE-2022-30698_30699.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 627 ++++++<br>
=C2=A0.../unbound/unbound/CVE-2022-3204.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 221 ++<br>
=C2=A0.../recipes-support/unbound/<a href=3D"http://unbound_1.15.0.bb" rel=
=3D"noreferrer" target=3D"_blank">unbound_1.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../meta-python/recipes-dbs/mongodb/<a href=3D"http://mongodb_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">mongodb_git.bb</a> |=C2=A0 =C2=A0 1 +=
<br>
=C2=A0.../recipes-benchmark/fio/fio/CVE-2025-10823.patch |=C2=A0 =C2=A037 +=
<br>
=C2=A0meta-oe/recipes-benchmark/fio/<a href=3D"http://fio_3.30.bb" rel=3D"n=
oreferrer" target=3D"_blank">fio_3.30.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0meta-oe/recipes-benchmark/iperf2/<a href=3D"http://iperf2_2.0.13.bb" =
rel=3D"noreferrer" target=3D"_blank">iperf2_2.0.13.bb</a>=C2=A0 |=C2=A0 =C2=
=A0 3 +<br>
=C2=A0meta-oe/recipes-connectivity/ace/<a href=3D"http://ace_6.5.12.bb" rel=
=3D"noreferrer" target=3D"_blank">ace_6.5.12.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 3 +<br>
=C2=A0.../recipes-connectivity/gattlib/<a href=3D"http://gattlib_git.bb" re=
l=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 3 +<br>
=C2=A0.../hostapd/hostapd/CVE-2022-37660-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 249 +++<br>
=C2=A0.../hostapd/hostapd/CVE-2022-37660-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 111 +<br>
=C2=A0.../hostapd/hostapd/CVE-2022-37660-03.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 762 +++++++<br>
=C2=A0.../hostapd/hostapd/CVE-2022-37660-04.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A085 +<br>
=C2=A0.../hostapd/hostapd/CVE-2025-24912-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A079 +<br>
=C2=A0.../hostapd/hostapd/CVE-2025-24912-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A070 +<br>
=C2=A0.../recipes-connectivity/hostapd/<a href=3D"http://hostapd_2.10.bb" r=
el=3D"noreferrer" target=3D"_blank">hostapd_2.10.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A0 6 +<br>
=C2=A0meta-oe/recipes-core/emlog/emlog.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest |=C2=A0 =C2=A0 4 +=
<br>
=C2=A0meta-oe/recipes-core/libxml/libxml++-<a href=3D"http://5.0_5.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">5.0_5.0.1.bb</a>=C2=A0 |=C2=A0 =C2=A0 =
7 +<br>
=C2=A0.../libxml/libxml++/libxml++_ptest.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A078 -<br>
=C2=A0meta-oe/recipes-core/libxml/libxml++/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 5 +-<br>
=C2=A0meta-oe/recipes-core/libxml/libxml++_<a href=3D"http://2.42.1.bb" rel=
=3D"noreferrer" target=3D"_blank">2.42.1.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A012 +-<br>
=C2=A0.../sdbus-c++/sdbus-c++-1.0.0/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A012 +-<br>
=C2=A0...lue-barriers-to-avoid-compiler-induced-si.patch |=C2=A0 =C2=A067 +=
<br>
=C2=A0...0001-Address-various-name-constraint-bugs.patch |=C2=A0 749 ++++++=
+<br>
=C2=A0...cate_Store_In_Memory-c-tor-that-takes-a-v.patch |=C2=A0 =C2=A031 +=
<br>
=C2=A0...ediates-can-sign-their-own-OCSP-responses.patch |=C2=A0 =C2=A036 +=
<br>
=C2=A0...-validation-of-authority-of-delegation-re.patch |=C2=A0 106 +<br>
=C2=A0.../botan/botan/0004-review-comments.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A028 +<br>
=C2=A0meta-oe/recipes-crypto/botan/<a href=3D"http://botan_2.19.1.bb" rel=
=3D"noreferrer" target=3D"_blank">botan_2.19.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 9 +-<br>
=C2=A0.../recipes-crypto/cryptsetup/<a href=3D"http://cryptsetup_2.4.3.bb" =
rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.4.3.bb</a>=C2=A0 |=C2=A0 =
=C2=A0 6 +-<br>
=C2=A0meta-oe/recipes-dbs/influxdb/<a href=3D"http://influxdb_1.8.10.bb" re=
l=3D"noreferrer" target=3D"_blank">influxdb_1.8.10.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 3 +<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../recipes-dbs/mysql/mariadb/CVE-2025-21490.patch |=C2=A0 =C2=A096 +=
<br>
=C2=A0.../recipes-dbs/mysql/mariadb/CVE-2025-30722.patch |=C2=A0 176 ++<br>
=C2=A0.../cjson/cjson/CVE-2025-57052.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A033 -<br>
=C2=A0.../cjson/{<a href=3D"http://cjson_1.7.18.bb" rel=3D"noreferrer" targ=
et=3D"_blank">cjson_1.7.18.bb</a> =3D&gt; <a href=3D"http://cjson_1.7.19.bb=
" rel=3D"noreferrer" target=3D"_blank">cjson_1.7.19.bb</a>}=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 3 +-<br>
=C2=A0.../iptraf/iptraf-ng/CVE-2024-52949.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 218 ++<br>
=C2=A0meta-oe/recipes-devtools/iptraf/<a href=3D"http://iptraf-ng_1.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">iptraf-ng_1.2.1.bb</a> |=C2=A0 =C2=A0=
 1 +<br>
=C2=A0meta-oe/recipes-devtools/jemalloc/files/run-ptest=C2=A0 |=C2=A0 =C2=
=A029 +-<br>
=C2=A0.../recipes-devtools/jemalloc/<a href=3D"http://jemalloc_5.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">jemalloc_5.2.1.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 7 +-<br>
=C2=A0meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch |=C2=A0 =C2=A049 +=
<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_git.bb" rel=3D"noref=
errer" target=3D"_blank">jq_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0meta-oe/recipes-devtools/perl/<a href=3D"http://libdbi-perl_1.643.bb"=
 rel=3D"noreferrer" target=3D"_blank">libdbi-perl_1.643.bb</a> |=C2=A0 =C2=
=A0 6 +-<br>
=C2=A0.../yasm/yasm/CVE-2024-22653.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A032 +<br>
=C2=A0meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yasm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0meta-oe/recipes-extended/ostree/ostree/run-ptest=C2=A0 =C2=A0|=C2=A0 =
=C2=A013 +-<br>
=C2=A0...rent-locales-in-remote-gpg-list-keys-test.patch |=C2=A0 102 +<br>
=C2=A0meta-oe/recipes-extended/ostree/<a href=3D"http://ostree_2021.6.bb" r=
el=3D"noreferrer" target=3D"_blank">ostree_2021.6.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A0 2 +<br>
=C2=A0.../redis/redis-7.0.13/CVE-2025-27151.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A032 +<br>
=C2=A0.../redis/redis-7.0.13/CVE-2025-32023.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 215 ++<br>
=C2=A0.../redis/redis-7.0.13/CVE-2025-46817.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 101 +<br>
=C2=A0.../redis/redis-7.0.13/CVE-2025-46818.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 283 +++<br>
=C2=A0.../redis/redis-7.0.13/CVE-2025-46819.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 161 ++<br>
=C2=A0.../redis/redis-7.0.13/CVE-2025-48367.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 111 +<br>
=C2=A0.../redis/redis-7.0.13/CVE-2025-49844.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A035 +<br>
=C2=A0meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.0.13.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_7.0.13.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 7 +<br>
=C2=A0...uffer-overflow-at-zlog_conf_build_with_fi.patch |=C2=A0 =C2=A025 +=
<br>
=C2=A0meta-oe/recipes-extended/zlog/<a href=3D"http://zlog_1.2.15.bb" rel=
=3D"noreferrer" target=3D"_blank">zlog_1.2.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 4 +-<br>
=C2=A0.../libjcat/install_missing_ptest_binary.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A025 +<br>
=C2=A0meta-oe/recipes-gnome/libjcat/<a href=3D"http://libjcat_0.1.11.bb" re=
l=3D"noreferrer" target=3D"_blank">libjcat_0.1.11.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 5 +<br>
=C2=A0meta-oe/recipes-graphics/fbida/<a href=3D"http://fbida_2.14.bb" rel=
=3D"noreferrer" target=3D"_blank">fbida_2.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 5 +<br>
=C2=A0.../files/0007-make-fbpdf-build-optional.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 102 +<br>
=C2=A0.../renderdoc/CVE-2023-33863-33864-33865-1.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A071 +<br>
=C2=A0.../renderdoc/CVE-2023-33863-33864-33865-2.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A072 +<br>
=C2=A0.../renderdoc/CVE-2023-33863-33864-33865-3.patch=C2=A0 =C2=A0|=C2=A0 =
160 ++<br>
=C2=A0.../renderdoc/CVE-2023-33863-33864-33865-4.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A028 +<br>
=C2=A0.../renderdoc/CVE-2023-33863-33864-33865-5.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A040 +<br>
=C2=A0.../recipes-graphics/renderdoc/<a href=3D"http://renderdoc_1.13.bb" r=
el=3D"noreferrer" target=3D"_blank">renderdoc_1.13.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A012 +-<br>
=C2=A0meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.5.bb" rel=
=3D"noreferrer" target=3D"_blank">st_0.8.5.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 3 +<br>
=C2=A0.../kernel-selftest/<a href=3D"http://kernel-selftest.bb" rel=3D"nore=
ferrer" target=3D"_blank">kernel-selftest.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../kernel-selftest/kernel-selftest/run-ptest=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 8 +-<br>
=C2=A0meta-oe/recipes-kernel/oprofile/<a href=3D"http://oprofile_1.4.0.bb" =
rel=3D"noreferrer" target=3D"_blank">oprofile_1.4.0.bb</a>=C2=A0 |=C2=A0 =
=C2=A0 9 +-<br>
=C2=A0.../0001-Check-return-value-of-ltp_data.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A031 +<br>
=C2=A0...-SBR-frame-length-to-960-and-1024-samples.patch |=C2=A0 =C2=A087 +=
<br>
=C2=A0...001-fix-heap-buffer-overflow-in-mp4read.c.patch |=C2=A0 =C2=A037 +=
<br>
=C2=A0...ix-stack-buffer-overflow-in-stringin-ftyp.patch |=C2=A0 =C2=A028 +=
<br>
=C2=A0meta-oe/recipes-multimedia/faad2/<a href=3D"http://faad2_2.8.8.bb" re=
l=3D"noreferrer" target=3D"_blank">faad2_2.8.8.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 7 +-<br>
=C2=A0meta-oe/recipes-multimedia/id3lib/<a href=3D"http://id3lib_3.8.3.bb" =
rel=3D"noreferrer" target=3D"_blank">id3lib_3.8.3.bb</a>=C2=A0 |=C2=A0 =C2=
=A0 3 +<br>
=C2=A0.../wavpack/wavpack/CVE-2016-10169.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A027 +<br>
=C2=A0.../recipes-multimedia/wavpack/<a href=3D"http://wavpack_4.60.1.bb" r=
el=3D"noreferrer" target=3D"_blank">wavpack_4.60.1.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A0 4 +-<br>
=C2=A0meta-oe/recipes-multimedia/xsp/<a href=3D"http://xsp_1.0.0-8.bb" rel=
=3D"noreferrer" target=3D"_blank">xsp_1.0.0-8.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 3 +<br>
=C2=A0...ox.inc.sh-update-regex-for-getting-endian.patch |=C2=A0 =C2=A035 +=
<br>
=C2=A0.../recipes-security/keyutils/<a href=3D"http://keyutils_1.6.1.bb" re=
l=3D"noreferrer" target=3D"_blank">keyutils_1.6.1.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 3 +-<br>
=C2=A0meta-oe/recipes-shells/dash/<a href=3D"http://dash_0.5.11.5.bb" rel=
=3D"noreferrer" target=3D"_blank">dash_0.5.11.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0meta-oe/recipes-support/cli11/cli11/run-ptest=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 5 +<br>
=C2=A0meta-oe/recipes-support/cli11/<a href=3D"http://cli11_1.9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">cli11_1.9.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A011 +-<br>
=C2=A0meta-oe/recipes-support/fmt/fmt/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 5 +<br>
=C2=A0meta-oe/recipes-support/fmt/<a href=3D"http://fmt_8.1.1.bb" rel=3D"no=
referrer" target=3D"_blank">fmt_8.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A010 +-<br>
=C2=A0.../recipes-support/function2/function2/run-ptest=C2=A0 |=C2=A0 =C2=
=A0 3 +<br>
=C2=A0.../recipes-support/function2/<a href=3D"http://function2_4.2.0.bb" r=
el=3D"noreferrer" target=3D"_blank">function2_4.2.0.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A0 9 +-<br>
=C2=A0.../imagemagick/files/CVE-2022-28463.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A026 +<br>
=C2=A0.../imagemagick/<a href=3D"http://imagemagick_7.0.10.bb" rel=3D"noref=
errer" target=3D"_blank">imagemagick_7.0.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0.../iniparser/iniparser/CVE-2025-0633.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A038 +<br>
=C2=A0meta-oe/recipes-support/iniparser/<a href=3D"http://iniparser_4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">iniparser_4.1.bb</a> |=C2=A0 =C2=A0 1=
 +<br>
=C2=A0.../inotify-tools/inotify-tools/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A015 +<br>
=C2=A0.../inotify-tools/<a href=3D"http://inotify-tools_3.22.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">inotify-tools_3.22.1.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A016 +-<br>
=C2=A0.../libmanette/libmanette/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +<br>
=C2=A0.../recipes-support/libmanette/<a href=3D"http://libmanette_0.2.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">libmanette_0.2.6.bb</a> |=C2=A0 =C2=
=A0 7 +-<br>
=C2=A0.../libssh/libssh/CVE-2025-4878-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2196 ++++++++++++++++++++<br>
=C2=A0.../libssh/libssh/CVE-2025-4878-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A033 +<br>
=C2=A0.../libssh/libssh/CVE-2025-8277-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A057 +<br>
=C2=A0.../libssh/libssh/CVE-2025-8277-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A050 +<br>
=C2=A0.../libssh/libssh/CVE-2025-8277-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A050 +<br>
=C2=A0meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb" rel=
=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 5 +<br>
=C2=A0meta-oe/recipes-support/libteam/<a href=3D"http://libteam_1.31.bb" re=
l=3D"noreferrer" target=3D"_blank">libteam_1.31.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 8 +-<br>
=C2=A0.../opensc/files/CVE-2023-5992-0001.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 359 ++++<br>
=C2=A0.../opensc/files/CVE-2023-5992-0002.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 269 +++<br>
=C2=A0.../opensc/files/CVE-2023-5992-0003.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A041 +<br>
=C2=A0.../opensc/files/CVE-2023-5992-0004.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 109 +<br>
=C2=A0.../opensc/files/CVE-2023-5992-0005.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A063 +<br>
=C2=A0.../opensc/files/CVE-2023-5992-0006.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 118 ++<br>
=C2=A0.../opensc/files/CVE-2023-5992-0007.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A050 +<br>
=C2=A0.../opensc/files/CVE-2023-5992-0008.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A037 +<br>
=C2=A0.../opensc/files/CVE-2023-5992-0009.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 123 ++<br>
=C2=A0.../opensc/files/CVE-2023-5992-0010.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A075 +<br>
=C2=A0meta-oe/recipes-support/opensc/<a href=3D"http://opensc_0.22.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opensc_0.22.0.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A010 +<br>
=C2=A0...se-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch |=C2=A0 =C2=A026 +=
<br>
=C2=A0meta-oe/recipes-support/poco/poco/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A018 +-<br>
=C2=A0meta-oe/recipes-support/poco/<a href=3D"http://poco_1.11.2.bb" rel=3D=
"noreferrer" target=3D"_blank">poco_1.11.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A020 +-<br>
=C2=A0.../poppler/poppler/CVE-2025-43718.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A031 +<br>
=C2=A0.../poppler/poppler/CVE-2025-52885.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A030 +<br>
=C2=A0meta-oe/recipes-support/poppler/<a href=3D"http://poppler_22.04.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">poppler_22.04.0.bb</a> |=C2=A0 =C2=A0=
 2 +<br>
=C2=A0meta-oe/recipes-support/pv/<a href=3D"http://pv_1.6.20.bb" rel=3D"nor=
eferrer" target=3D"_blank">pv_1.6.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../udisks/udisks2/CVE-2025-8067.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A037 +<br>
=C2=A0meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.9.4.bb" re=
l=3D"noreferrer" target=3D"_blank">udisks2_2.9.4.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 4 +-<br>
=C2=A0...overflow-errors-in-malformed-zchunk-files.patch |=C2=A0 105 +<br>
=C2=A0meta-oe/recipes-support/zchunk/zchunk/run-ptest=C2=A0 =C2=A0 |=C2=A0 =
139 ++<br>
=C2=A0meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">zchunk_1.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A014 +-<br>
=C2=A0.../libauthen/<a href=3D"http://libauthen-sasl-perl_2.16.bb" rel=3D"n=
oreferrer" target=3D"_blank">libauthen-sasl-perl_2.16.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +<br>
=C2=A0.../files/0001-correct-libperl-regex.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A042 +<br>
=C2=A0.../libconfig/<a href=3D"http://libconfig-autoconf-perl_0.319.bb" rel=
=3D"noreferrer" target=3D"_blank">libconfig-autoconf-perl_0.319.bb</a>=C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A016 +-<br>
=C2=A0.../libcrypt/<a href=3D"http://libcrypt-openssl-guess-perl_0.15.bb" r=
el=3D"noreferrer" target=3D"_blank">libcrypt-openssl-guess-perl_0.15.bb</a>=
=C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../recipes-perl/libdb/<a href=3D"http://libdbd-sqlite-perl_1.68.bb" =
rel=3D"noreferrer" target=3D"_blank">libdbd-sqlite-perl_1.68.bb</a>=C2=A0 |=
=C2=A0 =C2=A0 3 +<br>
=C2=A0.../recipes-perl/libencode/<a href=3D"http://libencode-perl_3.17.bb" =
rel=3D"noreferrer" target=3D"_blank">libencode-perl_3.17.bb</a>=C2=A0 |=C2=
=A0 =C2=A0 2 +<br>
=C2=A0.../libfile/<a href=3D"http://libfile-slurper-perl_0.013.bb" rel=3D"n=
oreferrer" target=3D"_blank">libfile-slurper-perl_0.013.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
=C2=A0.../libmime/<a href=3D"http://libmime-types-perl_2.17.bb" rel=3D"nore=
ferrer" target=3D"_blank">libmime-types-perl_2.17.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0meta-perl/recipes-perl/libnet/files/run-ptest=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 6 +<br>
=C2=A0.../recipes-perl/libnet/<a href=3D"http://libnet-dns-perl_1.33.bb" re=
l=3D"noreferrer" target=3D"_blank">libnet-dns-perl_1.33.bb</a>=C2=A0 =C2=A0=
 |=C2=A0 =C2=A011 +-<br>
=C2=A0.../libstatgrab/<a href=3D"http://libunix-statgrab_0.112.bb" rel=3D"n=
oreferrer" target=3D"_blank">libunix-statgrab_0.112.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +<br>
=C2=A0.../libtest/<a href=3D"http://libtest-harness-perl_3.44.bb" rel=3D"no=
referrer" target=3D"_blank">libtest-harness-perl_3.44.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A012 +<br>
=C2=A0.../libxml/<a href=3D"http://libxml-libxml-perl_2.0134.bb" rel=3D"nor=
eferrer" target=3D"_blank">libxml-libxml-perl_2.0134.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../python/python3-aiohttp/CVE-2024-23829.patch=C2=A0 =C2=A0 |=C2=A0 =
344 +++<br>
=C2=A0.../python/<a href=3D"http://python3-aiohttp_3.8.6.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-aiohttp_3.8.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0.../0001-fix-failing-ptests.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A054 +<br>
=C2=A0.../python/<a href=3D"http://python3-aspectlib_1.5.2.bb" rel=3D"noref=
errer" target=3D"_blank">python3-aspectlib_1.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0.../fix-direct-calls-to-test-fixtures.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A041 +<br>
=C2=A0.../python/python3-betamax/fix-failing-ptest.patch |=C2=A0 =C2=A044 +=
<br>
=C2=A0.../python/python3-betamax/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +<br>
=C2=A0.../python/<a href=3D"http://python3-betamax_0.8.1.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-betamax_0.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../python/python3-gevent/CVE-2023-41419.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0...ventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch |=C2=A0 =C2=A054 +=
<br>
=C2=A0.../python/<a href=3D"http://python3-gunicorn_20.1.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-gunicorn_20.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-<br>
=C2=A0.../python/python3-pillow/CVE-2024-28219.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A043 +<br>
=C2=A0.../python/<a href=3D"http://python3-pillow_9.4.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pillow_9.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../recipes-devtools/python/python3-pint/run-ptest |=C2=A0 =C2=A0 3 +=
-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pint_0.19.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a> |=C2=A0 =
=C2=A0 6 +-<br>
=C2=A0.../python/<a href=3D"http://python3-py-cpuinfo_8.0.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-py-cpuinfo_8.0.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../python/python3-requests-toolbelt/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../update_tests_for_latest_libxml.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 162 ++<br>
=C2=A0.../python/<a href=3D"http://python3-soupsieve_2.3.1.bb" rel=3D"noref=
errer" target=3D"_blank">python3-soupsieve_2.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0.../python/<a href=3D"http://python3-typeguard_2.13.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-typeguard_2.13.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../python/python3-ujson/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0...terminstic-test_minimize_dfa-test-as-XFAI.patch |=C2=A0 =C2=A029 +=
<br>
=C2=A0.../python/<a href=3D"http://python3-whoosh_2.7.4.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-whoosh_2.7.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0...square-bracket-handling-in-URL-netloc-882.patch |=C2=A0 138 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-yarl_1.7.2.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-yarl_1.7.2.bb</a>=C2=A0 |=C2=
=A0 =C2=A0 3 +-<br>
=C2=A0.../recipes-httpd/apache2/<a href=3D"http://apache2_2.4.65.bb" rel=3D=
"noreferrer" target=3D"_blank">apache2_2.4.65.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A021 +<br>
=C2=A0...-permissions-check-when-saving-allowed-cr.patch |=C2=A0 =C2=A025 +=
<br>
=C2=A0...Escape-potentially-malicious-HTTP-headers.patch |=C2=A0 =C2=A053 +=
<br>
=C2=A0.../0001-Foreign-module-may-need-a-check.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A027 +<br>
=C2=A0.../0001-HTML-escape-command-description.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A029 +<br>
=C2=A0...t-names-cannot-contact-special-characters.patch |=C2=A0 =C2=A026 +=
<br>
=C2=A0.../recipes-webadmin/webmin/<a href=3D"http://webmin_1.850.bb" rel=3D=
"noreferrer" target=3D"_blank">webmin_1.850.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 7 +-<br>
=C2=A0227 files changed, 13948 insertions(+), 198 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-30067.p=
atch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-1=
.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-2=
.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-3=
.patch<br>
=C2=A0create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-20=
21-31870.patch<br>
=C2=A0create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-20=
21-31871.patch<br>
=C2=A0create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-20=
21-31872.patch<br>
=C2=A0create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-20=
21-31873.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vo=
rbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vo=
rbis-tools/CVE-2023-43361.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/civetweb/cive=
tweb/0001-Sanitize-upload-filename-like-URL.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/civetweb/cive=
tweb/0002-handle_form-example-Upload-to-temporary-directory-an.patch<br>
=C2=A0rename meta-networking/recipes-connectivity/mbedtls/{<a href=3D"http:=
//mbedtls_2.28.9.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.9.bb=
</a> =3D&gt; <a href=3D"http://mbedtls_2.28.10.bb" rel=3D"noreferrer" targe=
t=3D"_blank">mbedtls_2.28.10.bb</a>} (96%)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/keepalived/keepali=
ved/CVE-2021-44225.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-=
2023-48795.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/0001-E=
SI-Drop-incorrect-and-unnecessary-xmlSetFeature-cal.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
21-46784.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
22-41317.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
22-41318.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
23-46724.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
25-59362.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files=
/CVE-2022-39028.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024=
-31949.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
01-auth-Fix-handling-passdbs-with-identical-driver-args.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
01-lib-smtp-smtp-server-connection-Fix-STARTTLS-command.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/open-vm-tools/open=
-vm-tools/CVE-2025-41244.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tcpreplay/tcprepla=
y/CVE-2025-51006.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tcpreplay/tcprepla=
y/CVE-2025-9157.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2022-30698_30699.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2022-3204.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
022-37660-01.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
022-37660-02.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
022-37660-03.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
022-37660-04.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
025-24912-01.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
025-24912-02.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest=
<br>
=C2=A0delete mode 100644 meta-oe/recipes-core/libxml/libxml++/libxml++_ptes=
t.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-Add-more-v=
alue-barriers-to-avoid-compiler-induced-si.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-Address-va=
rious-name-constraint-bugs.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-add-Certif=
icate_Store_In_Memory-c-tor-that-takes-a-v.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/botan/botan/0002-FIX-interm=
ediates-can-sign-their-own-OCSP-responses.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/botan/botan/0003-FIX-missin=
g-validation-of-authority-of-delegation-re.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/botan/botan/0004-review-com=
ments.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-21490.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30722.p=
atch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-5705=
2.patch<br>
=C2=A0rename meta-oe/recipes-devtools/cjson/{<a href=3D"http://cjson_1.7.18=
.bb" rel=3D"noreferrer" target=3D"_blank">cjson_1.7.18.bb</a> =3D&gt; <a hr=
ef=3D"http://cjson_1.7.19.bb" rel=3D"noreferrer" target=3D"_blank">cjson_1.=
7.19.bb</a>} (85%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024=
-52949.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch=
<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/ostree/ostree/tests-accou=
nt-for-different-locales-in-remote-gpg-list-keys-test.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-20=
25-27151.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-20=
25-32023.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-20=
25-46817.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-20=
25-46818.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-20=
25-46819.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-20=
25-48367.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-20=
25-49844.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-Fix-stack-=
buffer-overflow-at-zlog_conf_build_with_fi.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-gnome/libjcat/libjcat/install_miss=
ing_ptest_binary.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fbida/files/0007-make-fbp=
df-build-optional.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2=
023-33863-33864-33865-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2=
023-33863-33864-33865-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2=
023-33863-33864-33865-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2=
023-33863-33864-33865-4.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2=
023-33863-33864-33865-5.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-Check-=
return-value-of-ltp_data.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-Restri=
ct-SBR-frame-length-to-960-and-1024-samples.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-fix-he=
ap-buffer-overflow-in-mp4read.c.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-mp4rea=
d.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack/CVE-201=
6-10169.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-security/keyutils/files/0001-tests=
-toolbox.inc.sh-update-regex-for-getting-endian.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/cli11/cli11/run-ptest<br>
=C2=A0create mode 100644 meta-oe/recipes-support/fmt/fmt/run-ptest<br>
=C2=A0create mode 100644 meta-oe/recipes-support/function2/function2/run-pt=
est<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022=
-28463.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/iniparser/iniparser/CVE-20=
25-0633.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tool=
s/run-ptest<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libmanette/libmanette/run-=
ptest<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-487=
8-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-487=
8-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-827=
7-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-827=
7-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-827=
7-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0001.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0002.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0003.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0004.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0005.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0006.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0007.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0008.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0009.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992=
-0010.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-test-Us=
e-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-4=
3718.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-5=
2885.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2025-80=
67.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-Handle-=
overflow-errors-in-malformed-zchunk-files.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/zchunk/zchunk/run-ptest<br=
>
=C2=A0create mode 100644 meta-perl/recipes-perl/libconfig/files/0001-correc=
t-libperl-regex.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2024-23829.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aspect=
lib/0001-fix-failing-ptests.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-betama=
x/fix-direct-calls-to-test-fixtures.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-betama=
x/fix-failing-ptest.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-gunico=
rn/eventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2024-28219.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-soupsi=
eve/update_tests_for_latest_libxml.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-whoosh=
/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-yarl/0=
001-Correct-square-bracket-handling-in-URL-netloc-882.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
Add-missing-permissions-check-when-saving-allowed-cr.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
Escape-potentially-malicious-HTTP-headers.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
Foreign-module-may-need-a-check.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
HTML-escape-command-description.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
Object-names-cannot-contact-special-characters.patch<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121656): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121656" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121656</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116281359/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116281359/1997914</a><br>
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

--0000000000001ed462064389cfc5--

