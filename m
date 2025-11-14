Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3D7CDE032
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:30:18 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13577.1763109012251288320
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AqJIl6Fz;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63f996d4e1aso1543514d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763109011; x=1763713811; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dvcVd814jSIigWqNxKS1sg0Bo3ebFnuvbo75HnbI4c4=;
        b=AqJIl6FzDuQCYmK2+2lbVmAMmKUGdypf9nxtaxYv+sbvRh8JBlUlRW8wAgGXLggIwT
         hkRxLSCBRnjfZ7HvkiqL6AIb+jl2pvyIgQNzKbB9pCI+SsBa3WpYKV5n+sbqtWjgvsQ7
         1JhRO4Uz6+i2c4gQ8mxnEWBlKSIC279CEIk3FeGcARK8rNMVdCwoyPnt3j165tZB2KYY
         wJpiGJHolU291RfhbppZUXXv39hZjm2yuNy8ANS1NsHccPRV31xmv7Y8Q7s/E6MEtlRS
         ZN1VyTp+ZcH+d5DbwUHXsbBYyL9mMpgG9+g3uB73TDr/lZpZPogF4UkygLnG7z20Rvd5
         8Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763109011; x=1763713811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvcVd814jSIigWqNxKS1sg0Bo3ebFnuvbo75HnbI4c4=;
        b=DQV29horh/J2neNEq9A1wVoj2hYuOc6loVLblJV2OL0kAZTeKetfFmK6U9DBan/sRy
         jIzgJVdH4P7VVvBdvfFm0x6oH23z89RGZLq4E7jLQ+kv25yeP9G/A+dDS9ONWS5PfTVx
         5AV9Ol6FLva/kwCHx5aQfcoB/PXAfT6edpo+f68c8C3cZePV6uj+nEvvjHQsTcmL9ZR7
         PDgF6izCOqN6L6httN6kZsvRVBDafZwQMIK4fvjLzfgQoNsxBjAlWJ0w7U6UzM2Ei2wW
         +YBHqRVxhNKhQnAIx2Gbhp31W1wS2shaOlvULAU67w8rA98qLlsb7no5ZLO6IbUen7og
         de5g==
X-Gm-Message-State: AOJu0YzypUd6LWmHa5ZlTNoogXoQ8X1jtlXP6oP5vsN45k1RFpA8W0H5
	+T1/yApAX+0JRg8tFUT/kPvcPj1CXXcHH08s8z1oAlhWngY8Sz8OfxdmAAZDbVuIfcIpHXPHfWK
	7O1/C/fFYK71w1yPIHM2VdfC10wkkEAw=
X-Gm-Gg: ASbGnctpfLGzJ/Dtpo8UyyGTt3hXtuH9cF5au6aPEz12YXX27H+tK3cl2Snw2TWMNuj
	sS5Eh1rpvFZ6MIL0TMqf9oq6+E6zaMWvNOBeg1BDy0ng67lE/dhWT3hjv9qlQntziVUWFYzPP7Y
	MNxxeMWkbP77NrUyx69EL1yNKHEBpPvfGn2M4hmsl8GqQsLHU8ZafvMn7w8To1xaNXj7j0oiTsy
	10P86CW3WHRkpVQNApUdvQgyqUeG+Deg+CsVEfxaFQc/5pRWik3ar8tWBc76tAgKPwYy3Ba6U7c
	spEbmeFDO3MqflYFCD2njnAL7Libc1Vd65tmjYiNuQEcoDaU91NYngsIokMEBtDHTWLQ8RzCI9j
	NZdio+UzFF463Udi49yzn+uupr48ZqTY/vBc=
X-Google-Smtp-Source: AGHT+IHWde6ao/T4fdP8LV9H/J3weOa188Wzpj882a9RjKpnwCcONC+RGrROQ3Bp6GEbKcjXuHXMX2P7PdZnlAmwBis=
X-Received: by 2002:a05:690e:1598:10b0:63f:a103:5d3d with SMTP id
 956f58d0204a3-641e76ca8eemr1608923d50.45.1763109010996; Fri, 14 Nov 2025
 00:30:10 -0800 (PST)
MIME-Version: 1.0
References: <1877AB3D4A623B33.930811@lists.openembedded.org> <1ece86ba-ded3-4409-8b05-9531c050f201@gmail.com>
In-Reply-To: <1ece86ba-ded3-4409-8b05-9531c050f201@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Nov 2025 00:29:44 -0800
X-Gm-Features: AWmQ_bnm_yqG6HIXaqOejGmgy2J6-J6wxSmP7Pklnwaxxp5-lrjaVtkTHH9C-i8
Message-ID: <CAMKF1spk9GO_pz1wBicKb1EYX=oT4Yermitf+yQkpVxkDgygSw@mail.gmail.com>
Subject: Re: [oe] Kirkstone Pull Request Nov 13th
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004d0267064389ce56"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121699

--0000000000004d0267064389ce56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is really helpful. I think we could automate it for other releases too=
.

On Thu, Nov 13, 2025 at 12:38=E2=80=AFPM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> You might have noticed that I have included ptest results in this PR's
> description - I intend to make this a regular thing for Kirkstone
> releases for now. These tests were compiled and executed using the
> default toolchain, on qemux86-64.
>
> From the next release I plan to attach the ptest logs to the actual
> workflow execution, but for now it is only hosted on my own server (it
> won't stay there forever, but I plan to keep the link alive at least
> until the next release, or so).
>
> The current set includes all ptest-enabled recipes, except for 6:
>
> psqlodbc
> python3-execnet
> libnet-dns-sec-perl-ptest
> libnet-ssleay-perl-ptest
> nftables-ptest
> clutter-1.0-ptest
>
> These are not working as they should, usually they are missing some
> RDEPENDS, and they also require some arcane settings which I couldn't
> yet figure out completely. I plan to spend more time on these also in
> the near future, but if anyone would like to fix any of them up, that
> would help a lot really.
>
> In case you would like to have the tests executed on a different
> toolchain/target combination also, I'm open for that - but if it doesn't
> work out of the box, I might need some help with the fixup.
>
> Just as I closed my previous email: if you have any question or
> comments, please let me know. Thank you.
>
> On 11/13/25 21:34, Gyorgy Sarvari via lists.openembedded.org wrote:
> > Hello,
> >
> > This new Kirkstone Pull Request contains many CVE and ptest
> > fixes - thank you all who contributed to this release.
> >
> > arm build logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192952986=
43/job/55175680474
> > aarch64 build logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192954369=
72/job/55176140854
> > x86 build logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192954399=
84/job/55176150598
> > x86-64 build logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192605395=
12/job/55064120322
> > YP compatibility check logs:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192954475=
03/job/55176174138
> > ptest build and run results (x86-64, gcc+glibc):
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/192971057=
71
> > ptest logs (change the placeholders): sarvari $dot me $slash yocto
> $slash ptest-kirkstone-2025-11.tar.gz
> >
> > Please let me know if you have any questions or comments.
> >
> > Thank you
> >
> > ---
> >
> > The following changes since commit
> 96fbc156364fd78530d2bfbe1b8a77789f52997d:
> >
> >   collectd: set working SRC_URI (2025-10-02 15:16:50 +0200)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/meta-openembedded-contrib
> stable/kirkstone-nut
> >
> > for you to fetch changes up to 07ac1890c843b374c27e150f1a2e53ad3db2a8e4=
:
> >
> >   libssh: fix CVE-2025-8277 (2025-11-11 08:50:50 +0100)
> >
> > ----------------------------------------------------------------
> > Alexandre Truong (1):
> >       evince: Update status for CVE-2011-0433 and CVE-2011-5244
> >
> > Archana Polampalli (2):
> >       tcpreplay: fix CVE-2025-9157
> >       tcpreplay: fix CVE-2025-51006
> >
> > Changqing Li (1):
> >       keyutils: fix ptest failed since "+++ Can't Determine Endianness"
> >
> > Chen Qi (1):
> >       frr: add CVE_PRODUCT
> >
> > Derek Straka (1):
> >       python3-typeguard: update ptest dependencies
> >
> > Divya Chellam (3):
> >       mariadb: fix CVE-2025-21490
> >       jq: fix CVE-2025-9403
> >       mariadb: fix CVE-2025-30722
> >
> > Gyorgy Sarvari (86):
> >       ace: ignore CVE-2009-1147
> >       apache2: ignore irrelevant CVEs
> >       civetweb: patch CVE-2020-27304
> >       dovecot: patch CVE-2022-30550
> >       dovecot: patch CVE-2021-33515
> >       botan: patch CVE-2022-43705
> >       botan: patch CVE-2024-39312
> >       botan: patch CVE-2024-50382 and CVE-2024-50383
> >       iperf2: ignore irrelevant CVEs
> >       zlog: patch CVE-2021-43521
> >       zchunk: patch CVE-2023-46228
> >       webmin: patch CVE-2017-15644, CVE-2017-15645 and CVE-2017-15646
> >       webmin: patch CVE-2017-17089
> >       webmin: patch CVE-2019-15642
> >       webmin: patch CVE-2022-0824
> >       webmin: patch CVE-2022-0829
> >       apache2: ignore CVE-2025-3891
> >       faad2: patch CVE-2021-32272
> >       faad2: patch CVE-2021-32273
> >       faad2: patch CVE-2021-32274 and CVE-2021-32277
> >       faad2: patch CVE-2021-32278
> >       cli11: fix ptests
> >       fmt: fix ptests
> >       function2: fix ptests
> >       kernel-selftest: fix ptest
> >       keyutils: add missing ptest dependencies
> >       libdbi-perl: fix ptests
> >       libjcat: fix ptests
> >       libmanette: fix ptests
> >       libxml++-5.0: fix ptests
> >       pv: fix ptests
> >       sdbus-c++: fix ptest script output
> >       python3-ujson: fix run-ptest script
> >       python3-soupsieve: fix ptests
> >       python3-betamax: fix ptests
> >       python3-yarl: fix ptests (and make it compatible with current
> python)
> >       cryptsetup: extend licenses with Apache and CC0
> >       zchunk: add ptest support
> >       wavpack: patch CVE-2016-10169
> >       netkit-telnet: patch CVE-2022-39028
> >       renderdoc: patch CVE-2023-33863, CVE-2023-33864 and CVE-2023-3386=
5
> >       squid: patch CVE-2021-46784
> >       squid: patch CVE-2022-41317
> >       squid: patch CVE-2022-41318
> >       squid: patch CVE-2023-46724
> >       squid: patch CVE-2025-59362
> >       squid: fix esi PACKAGECONFIG
> >       python3-py-cpuinfo: fix ptests
> >       python3-requests-toolbelt: disable tests with expired certificate
> >       python3-pint: fix ptests
> >       python3-gevent: fix syntax error in cve patch
> >       python3-gunicorn: add patch work with geventlet
> >       klibc: patch CVE-2021-31870
> >       klibc: patch CVE-2021-31871
> >       klibc: patch CVE-2021-31872
> >       klibc: patch CVE-2021-31873
> >       gattlib: ignore CVE-2019-6498
> >       iptraf-ng: patch CVE-2024-52949
> >       keepalived: patch CVE-2021-44225
> >       libxml-libxml-perl: fix ptests
> >       libunix-statgrab: fix ptests
> >       libtest-harness-perl: fix ptests
> >       python3-scapy: fix ptests
> >       freediameter: fix run-ptest reporting
> >       net-snmp: fix ptests
> >       sshfs-fuse: fix ptests
> >       fuse3: fix ptests
> >       libopenmpt: fix ptests
> >       libauthen-sasl-perl: fix ptest
> >       libconfig-autoconf-perl: fix ptests
> >       libcrypt-openssl-guess-perl: fix ptests
> >       libdbd-sqlite-perl: fix ptests
> >       libfile-slurper-perl: fix ptests
> >       libmime-types-perl: fix ptests
> >       libencode-perl: fix ptests
> >       mongodb: add tzdata to runtime dependencies
> >       poco: fix ptests
> >       ostree: fix ptests
> >       libxml++: fix ptests
> >       python3-aspectlib: fix ptests
> >       libnet-dns-perl: fix ptests
> >       gimp: ignore CVE-2007-3741
> >       inotify-tools: add PASS/FAIL status to run-ptest script
> >       gimp: patch CVE-2022-30067
> >       gimp: patch CVE-2022-32990
> >       poco: remove mongodb from ptest RDEPENDS
> >
> > Khem Raj (4):
> >       libteam: Add missing dependencies revealed by ptests
> >       oprofile: Fix failing ptests
> >       python3-whoosh: Fix an intermittent ptest
> >       openl2tp: Fix ptests
> >
> > Nikhil R (1):
> >       inotify-tools: add ptest support for inotify-tools
> >
> > Ninette Adhikari (3):
> >       xsp: CVE status update for CVE-2006-2658
> >       st: Update status for CVE-2017-16224
> >       influxdb: Update CVE status for CVE-2019-10329
> >
> > Peter Marko (6):
> >       emlog: set CVE_PRODUCT
> >       squid: mark CVE-2025-54574 as patched
> >       dash: set CVE_PRODUCT
> >       id3lib: mark CVE-2007-4460 as fixed
> >       hostapd: patch CVE-2025-24912
> >       hostapd: patch CVE-2022-37660
> >
> > Praveen Kumar (2):
> >       yasm: fix CVE-2024-22653
> >       cjson: upgrade 1.7.18 -> 1.7.19
> >
> > Rajeshkumar Ramasamy (3):
> >       open-vm-tools: fix CVE-2025-41244
> >       libssh: fix CVE-2025-4878
> >       libssh: fix CVE-2025-8277
> >
> > Sana Kazi (1):
> >       cryptsetup: Update the license field
> >
> > Saravanan (2):
> >       udisks2: fix CVE-2025-8067
> >       fio: fix CVE-2025-10823
> >
> > Soumya Sambu (3):
> >       iniparser: Fix CVE-2025-0633
> >       python3-pillow: Fix CVE-2024-28219
> >       python3-aiohttp: Fix CVE-2024-23829
> >
> > Vijay Anusuri (11):
> >       vorbis-tools: Fix CVE-2023-43361
> >       redis: Fix CVE-2025-27151
> >       redis: Fix CVE-2025-32023
> >       redis: Fix CVE-2025-48367
> >       redis: Fix CVE-2025-46817
> >       redis: Fix CVE-2025-46818
> >       redis: Fix CVE-2025-46819
> >       redis: Fix CVE-2025-49844
> >       proftpd: Fix CVE-2023-48795
> >       unbound: Fix for CVE-2022-30698 and CVE-2022-30699
> >       unbound: Fix CVE-2022-3204
> >
> > Wentao Zhang (1):
> >       jemalloc: include the missing shell scripts and source the
> corresponds shell scripts for some test cases.
> >
> > Yi Zhao (1):
> >       mbedtls: upgrade 2.28.9 -> 2.28.10
> >
> > Yogita Urade (2):
> >       poppler: fix CVE-2025-43718
> >       poppler: fix CVE-2025-52885
> >
> > Zhang Peng (2):
> >       frr: fix CVE-2024-31949
> >       opensc: fix CVE-2023-5992
> >
> > simoneScaravati (1):
> >       fbida: fix make fbpdf build optional
> >
> > virendra thakur (1):
> >       imagemagick: Fix CVE-2022-28463
> >
> >  .../sshfs-fuse/sshfs-fuse/run-ptest                |    9 +
> >  .../sshfs-fuse/sshfs-fuse_3.7.3.bb                 |    2 +
> >  .../recipes-support/fuse/fuse3/run-ptest           |    1 +
> >  .../recipes-support/fuse/fuse3_3.10.5.bb           |    3 +
> >  .../recipes-gimp/gimp/gimp/CVE-2022-30067.patch    |   64 +
> >  .../recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch  |   97 +
> >  .../recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch  |  178 ++
> >  .../recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch  |   35 +
> >  meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb       |   10 +-
> >  meta-gnome/recipes-gnome/evince/evince_42.3.bb     |    4 +
> >  .../klibc/files/CVE-2021-31870.patch               |   45 +
> >  .../klibc/files/CVE-2021-31871.patch               |   34 +
> >  .../klibc/files/CVE-2021-31872.patch               |   70 +
> >  .../klibc/files/CVE-2021-31873.patch               |   43 +
> >  meta-initramfs/recipes-devtools/klibc/klibc.inc    |    4 +
> >  .../libopenmpt/libopenmpt_0.6.2.bb                 |    1 +
> >  ...issing-include-utf8.h-to-codec_skeleton.c.patch |   28 +
> >  .../vorbis-tools/vorbis-tools/CVE-2023-43361.patch |   57 +
> >  .../vorbis-tools/vorbis-tools_1.4.2.bb             |    3 +-
> >  .../0001-Sanitize-upload-filename-like-URL.patch   |   27 +
> >  ...-example-Upload-to-temporary-directory-an.patch |   90 +
> >  .../recipes-connectivity/civetweb/civetweb_git.bb  |    2 +
> >  .../{mbedtls_2.28.9.bb =3D> mbedtls_2.28.10.bb}      |    4 +-
> >  .../keepalived/keepalived/CVE-2021-44225.patch     |   41 +
> >  .../recipes-daemons/keepalived/keepalived_2.2.2.bb |    1 +
> >  .../proftpd/files/CVE-2023-48795.patch             |  751 +++++++
> >  .../recipes-daemons/proftpd/proftpd_1.3.7c.bb      |    1 +
> >  ...correct-and-unnecessary-xmlSetFeature-cal.patch |   35 +
> >  .../squid/files/CVE-2021-46784.patch               |  133 ++
> >  .../squid/files/CVE-2022-41317.patch               |   26 +
> >  .../squid/files/CVE-2022-41318.patch               |   45 +
> >  .../squid/files/CVE-2023-46724.patch               |   41 +
> >  .../squid/files/CVE-2023-5824.patch                |    2 +-
> >  .../squid/files/CVE-2025-59362.patch               |   51 +
> >  .../recipes-daemons/squid/squid_4.15.bb            |    6 +
> >  .../python/python3-scapy/run-ptest                 |    7 +
> >  .../recipes-devtools/python/python3-scapy_2.4.5.bb |   13 +
> >  .../netkit-telnet/files/CVE-2022-39028.patch       |   72 +
> >  .../netkit-telnet/netkit-telnet_0.17.bb            |    1 +
> >  .../recipes-protocols/freediameter/files/run-ptest |    2 +-
> >  .../recipes-protocols/frr/frr/CVE-2024-31949.patch |  153 ++
> >  meta-networking/recipes-protocols/frr/frr_8.2.2.bb |    3 +
> >  .../recipes-protocols/net-snmp/net-snmp_5.9.3.bb   |    6 +-
> >  .../recipes-protocols/openl2tp/openl2tp/run-ptest  |    7 +-
> >  .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |    1 +
> >  ...ndling-passdbs-with-identical-driver-args.patch |  137 ++
> >  ...tp-server-connection-Fix-STARTTLS-command.patch |   76 +
> >  .../recipes-support/dovecot/dovecot_2.3.14.bb      |    2 +
> >  .../open-vm-tools/CVE-2025-41244.patch             |  124 ++
> >  .../open-vm-tools/open-vm-tools_11.3.5.bb          |    1 +
> >  .../tcpreplay/tcpreplay/CVE-2025-51006.patch       |   97 +
> >  .../tcpreplay/tcpreplay/CVE-2025-9157.patch        |   44 +
> >  .../recipes-support/tcpreplay/tcpreplay_4.4.4.bb   |    4 +-
> >  .../unbound/unbound/CVE-2022-30698_30699.patch     |  627 ++++++
> >  .../unbound/unbound/CVE-2022-3204.patch            |  221 ++
> >  .../recipes-support/unbound/unbound_1.15.0.bb      |    2 +
> >  .../meta-python/recipes-dbs/mongodb/mongodb_git.bb |    1 +
> >  .../recipes-benchmark/fio/fio/CVE-2025-10823.patch |   37 +
> >  meta-oe/recipes-benchmark/fio/fio_3.30.bb          |    2 +
> >  meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb  |    3 +
> >  meta-oe/recipes-connectivity/ace/ace_6.5.12.bb     |    3 +
> >  .../recipes-connectivity/gattlib/gattlib_git.bb    |    3 +
> >  .../hostapd/hostapd/CVE-2022-37660-01.patch        |  249 +++
> >  .../hostapd/hostapd/CVE-2022-37660-02.patch        |  111 +
> >  .../hostapd/hostapd/CVE-2022-37660-03.patch        |  762 +++++++
> >  .../hostapd/hostapd/CVE-2022-37660-04.patch        |   85 +
> >  .../hostapd/hostapd/CVE-2025-24912-01.patch        |   79 +
> >  .../hostapd/hostapd/CVE-2025-24912-02.patch        |   70 +
> >  .../recipes-connectivity/hostapd/hostapd_2.10.bb   |    6 +
> >  meta-oe/recipes-core/emlog/emlog.inc               |    2 +
> >  meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest |    4 +
> >  meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb  |    7 +
> >  .../libxml/libxml++/libxml++_ptest.patch           |   78 -
> >  meta-oe/recipes-core/libxml/libxml++/run-ptest     |    5 +-
> >  meta-oe/recipes-core/libxml/libxml++_2.42.1.bb     |   12 +-
> >  .../sdbus-c++/sdbus-c++-1.0.0/run-ptest            |   12 +-
> >  ...lue-barriers-to-avoid-compiler-induced-si.patch |   67 +
> >  ...0001-Address-various-name-constraint-bugs.patch |  749 +++++++
> >  ...cate_Store_In_Memory-c-tor-that-takes-a-v.patch |   31 +
> >  ...ediates-can-sign-their-own-OCSP-responses.patch |   36 +
> >  ...-validation-of-authority-of-delegation-re.patch |  106 +
> >  .../botan/botan/0004-review-comments.patch         |   28 +
> >  meta-oe/recipes-crypto/botan/botan_2.19.1.bb       |    9 +-
> >  .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb  |    6 +-
> >  meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb    |    3 +
> >  meta-oe/recipes-dbs/mysql/mariadb.inc              |    2 +
> >  .../recipes-dbs/mysql/mariadb/CVE-2025-21490.patch |   96 +
> >  .../recipes-dbs/mysql/mariadb/CVE-2025-30722.patch |  176 ++
> >  .../cjson/cjson/CVE-2025-57052.patch               |   33 -
> >  .../cjson/{cjson_1.7.18.bb =3D> cjson_1.7.19.bb}     |    3 +-
> >  .../iptraf/iptraf-ng/CVE-2024-52949.patch          |  218 ++
> >  meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb |    1 +
> >  meta-oe/recipes-devtools/jemalloc/files/run-ptest  |   29 +-
> >  .../recipes-devtools/jemalloc/jemalloc_5.2.1.bb    |    7 +-
> >  meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch |   49 +
> >  meta-oe/recipes-devtools/jq/jq_git.bb              |    1 +
> >  meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb |    6 +-
> >  .../yasm/yasm/CVE-2024-22653.patch                 |   32 +
> >  meta-oe/recipes-devtools/yasm/yasm_git.bb          |    1 +
> >  meta-oe/recipes-extended/ostree/ostree/run-ptest   |   13 +-
> >  ...rent-locales-in-remote-gpg-list-keys-test.patch |  102 +
> >  meta-oe/recipes-extended/ostree/ostree_2021.6.bb   |    2 +
> >  .../redis/redis-7.0.13/CVE-2025-27151.patch        |   32 +
> >  .../redis/redis-7.0.13/CVE-2025-32023.patch        |  215 ++
> >  .../redis/redis-7.0.13/CVE-2025-46817.patch        |  101 +
> >  .../redis/redis-7.0.13/CVE-2025-46818.patch        |  283 +++
> >  .../redis/redis-7.0.13/CVE-2025-46819.patch        |  161 ++
> >  .../redis/redis-7.0.13/CVE-2025-48367.patch        |  111 +
> >  .../redis/redis-7.0.13/CVE-2025-49844.patch        |   35 +
> >  meta-oe/recipes-extended/redis/redis_7.0.13.bb     |    7 +
> >  ...uffer-overflow-at-zlog_conf_build_with_fi.patch |   25 +
> >  meta-oe/recipes-extended/zlog/zlog_1.2.15.bb       |    4 +-
> >  .../libjcat/install_missing_ptest_binary.patch     |   25 +
> >  meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb    |    5 +
> >  meta-oe/recipes-graphics/fbida/fbida_2.14.bb       |    5 +
> >  .../files/0007-make-fbpdf-build-optional.patch     |  102 +
> >  .../renderdoc/CVE-2023-33863-33864-33865-1.patch   |   71 +
> >  .../renderdoc/CVE-2023-33863-33864-33865-2.patch   |   72 +
> >  .../renderdoc/CVE-2023-33863-33864-33865-3.patch   |  160 ++
> >  .../renderdoc/CVE-2023-33863-33864-33865-4.patch   |   28 +
> >  .../renderdoc/CVE-2023-33863-33864-33865-5.patch   |   40 +
> >  .../recipes-graphics/renderdoc/renderdoc_1.13.bb   |   12 +-
> >  meta-oe/recipes-graphics/suckless/st_0.8.5.bb      |    3 +
> >  .../kernel-selftest/kernel-selftest.bb             |    2 +-
> >  .../kernel-selftest/kernel-selftest/run-ptest      |    8 +-
> >  meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb  |    9 +-
> >  .../0001-Check-return-value-of-ltp_data.patch      |   31 +
> >  ...-SBR-frame-length-to-960-and-1024-samples.patch |   87 +
> >  ...001-fix-heap-buffer-overflow-in-mp4read.c.patch |   37 +
> >  ...ix-stack-buffer-overflow-in-stringin-ftyp.patch |   28 +
> >  meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb    |    7 +-
> >  meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb  |    3 +
> >  .../wavpack/wavpack/CVE-2016-10169.patch           |   27 +
> >  .../recipes-multimedia/wavpack/wavpack_4.60.1.bb   |    4 +-
> >  meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb      |    3 +
> >  ...ox.inc.sh-update-regex-for-getting-endian.patch |   35 +
> >  .../recipes-security/keyutils/keyutils_1.6.1.bb    |    3 +-
> >  meta-oe/recipes-shells/dash/dash_0.5.11.5.bb       |    2 +
> >  meta-oe/recipes-support/cli11/cli11/run-ptest      |    5 +
> >  meta-oe/recipes-support/cli11/cli11_1.9.1.bb       |   11 +-
> >  meta-oe/recipes-support/fmt/fmt/run-ptest          |    5 +
> >  meta-oe/recipes-support/fmt/fmt_8.1.1.bb           |   10 +-
> >  .../recipes-support/function2/function2/run-ptest  |    3 +
> >  .../recipes-support/function2/function2_4.2.0.bb   |    9 +-
> >  .../imagemagick/files/CVE-2022-28463.patch         |   26 +
> >  .../imagemagick/imagemagick_7.0.10.bb              |    1 +
> >  .../iniparser/iniparser/CVE-2025-0633.patch        |   38 +
> >  meta-oe/recipes-support/iniparser/iniparser_4.1.bb |    1 +
> >  .../inotify-tools/inotify-tools/run-ptest          |   15 +
> >  .../inotify-tools/inotify-tools_3.22.1.0.bb        |   16 +-
> >  .../libmanette/libmanette/run-ptest                |   10 +
> >  .../recipes-support/libmanette/libmanette_0.2.6.bb |    7 +-
> >  .../libssh/libssh/CVE-2025-4878-1.patch            | 2196
> ++++++++++++++++++++
> >  .../libssh/libssh/CVE-2025-4878-2.patch            |   33 +
> >  .../libssh/libssh/CVE-2025-8277-1.patch            |   57 +
> >  .../libssh/libssh/CVE-2025-8277-2.patch            |   50 +
> >  .../libssh/libssh/CVE-2025-8277-3.patch            |   50 +
> >  meta-oe/recipes-support/libssh/libssh_0.8.9.bb     |    5 +
> >  meta-oe/recipes-support/libteam/libteam_1.31.bb    |    8 +-
> >  .../opensc/files/CVE-2023-5992-0001.patch          |  359 ++++
> >  .../opensc/files/CVE-2023-5992-0002.patch          |  269 +++
> >  .../opensc/files/CVE-2023-5992-0003.patch          |   41 +
> >  .../opensc/files/CVE-2023-5992-0004.patch          |  109 +
> >  .../opensc/files/CVE-2023-5992-0005.patch          |   63 +
> >  .../opensc/files/CVE-2023-5992-0006.patch          |  118 ++
> >  .../opensc/files/CVE-2023-5992-0007.patch          |   50 +
> >  .../opensc/files/CVE-2023-5992-0008.patch          |   37 +
> >  .../opensc/files/CVE-2023-5992-0009.patch          |  123 ++
> >  .../opensc/files/CVE-2023-5992-0010.patch          |   75 +
> >  meta-oe/recipes-support/opensc/opensc_0.22.0.bb    |   10 +
> >  ...se-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch |   26 +
> >  meta-oe/recipes-support/poco/poco/run-ptest        |   18 +-
> >  meta-oe/recipes-support/poco/poco_1.11.2.bb        |   20 +-
> >  .../poppler/poppler/CVE-2025-43718.patch           |   31 +
> >  .../poppler/poppler/CVE-2025-52885.patch           |   30 +
> >  meta-oe/recipes-support/poppler/poppler_22.04.0.bb |    2 +
> >  meta-oe/recipes-support/pv/pv_1.6.20.bb            |    2 +-
> >  .../udisks/udisks2/CVE-2025-8067.patch             |   37 +
> >  meta-oe/recipes-support/udisks/udisks2_2.9.4.bb    |    4 +-
> >  ...overflow-errors-in-malformed-zchunk-files.patch |  105 +
> >  meta-oe/recipes-support/zchunk/zchunk/run-ptest    |  139 ++
> >  meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb     |   14 +-
> >  .../libauthen/libauthen-sasl-perl_2.16.bb          |    4 +
> >  .../files/0001-correct-libperl-regex.patch         |   42 +
> >  .../libconfig/libconfig-autoconf-perl_0.319.bb     |   16 +-
> >  .../libcrypt/libcrypt-openssl-guess-perl_0.15.bb   |    1 +
> >  .../recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb  |    3 +
> >  .../recipes-perl/libencode/libencode-perl_3.17.bb  |    2 +
> >  .../libfile/libfile-slurper-perl_0.013.bb          |    5 +
> >  .../libmime/libmime-types-perl_2.17.bb             |    2 +-
> >  meta-perl/recipes-perl/libnet/files/run-ptest      |    6 +
> >  .../recipes-perl/libnet/libnet-dns-perl_1.33.bb    |   11 +-
> >  .../libstatgrab/libunix-statgrab_0.112.bb          |    4 +
> >  .../libtest/libtest-harness-perl_3.44.bb           |   12 +
> >  .../libxml/libxml-libxml-perl_2.0134.bb            |    2 +
> >  .../python/python3-aiohttp/CVE-2024-23829.patch    |  344 +++
> >  .../python/python3-aiohttp_3.8.6.bb                |    1 +
> >  .../0001-fix-failing-ptests.patch                  |   54 +
> >  .../python/python3-aspectlib_1.5.2.bb              |    1 +
> >  .../fix-direct-calls-to-test-fixtures.patch        |   41 +
> >  .../python/python3-betamax/fix-failing-ptest.patch |   44 +
> >  .../python/python3-betamax/run-ptest               |    6 +
> >  .../python/python3-betamax_0.8.1.bb                |    2 +
> >  .../python/python3-gevent/CVE-2023-41419.patch     |    2 +-
> >  ...ventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch |   54 +
> >  .../python/python3-gunicorn_20.1.0.bb              |    3 +-
> >  .../python/python3-pillow/CVE-2024-28219.patch     |   43 +
> >  .../python/python3-pillow_9.4.0.bb                 |    1 +
> >  .../recipes-devtools/python/python3-pint/run-ptest |    3 +-
> >  .../recipes-devtools/python/python3-pint_0.19.1.bb |    6 +-
> >  .../python/python3-py-cpuinfo_8.0.0.bb             |    1 +
> >  .../python/python3-requests-toolbelt/run-ptest     |    2 +-
> >  .../update_tests_for_latest_libxml.patch           |  162 ++
> >  .../python/python3-soupsieve_2.3.1.bb              |    1 +
> >  .../python/python3-typeguard_2.13.3.bb             |    1 +
> >  .../python/python3-ujson/run-ptest                 |    2 +-
> >  ...terminstic-test_minimize_dfa-test-as-XFAI.patch |   29 +
> >  .../python/python3-whoosh_2.7.4.bb                 |    2 +
> >  ...square-bracket-handling-in-URL-netloc-882.patch |  138 ++
> >  .../recipes-devtools/python/python3-yarl_1.7.2.bb  |    3 +-
> >  .../recipes-httpd/apache2/apache2_2.4.65.bb        |   21 +
> >  ...-permissions-check-when-saving-allowed-cr.patch |   25 +
> >  ...Escape-potentially-malicious-HTTP-headers.patch |   53 +
> >  .../0001-Foreign-module-may-need-a-check.patch     |   27 +
> >  .../0001-HTML-escape-command-description.patch     |   29 +
> >  ...t-names-cannot-contact-special-characters.patch |   26 +
> >  .../recipes-webadmin/webmin/webmin_1.850.bb        |    7 +-
> >  227 files changed, 13948 insertions(+), 198 deletions(-)
> >  create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-30067.patch
> >  create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch
> >  create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch
> >  create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch
> >  create mode 100644
> meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31870.patch
> >  create mode 100644
> meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31871.patch
> >  create mode 100644
> meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31872.patch
> >  create mode 100644
> meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31873.patch
> >  create mode 100644
> meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-m=
issing-include-utf8.h-to-codec_skeleton.c.patch
> >  create mode 100644
> meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-433=
61.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/civetweb/civetweb/0001-Sanitize-uplo=
ad-filename-like-URL.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/civetweb/civetweb/0002-handle_form-e=
xample-Upload-to-temporary-directory-an.patch
> >  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb
> =3D> mbedtls_2.28.10.bb} (96%)
> >  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2021-44225.patc=
h
> >  create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch
> >  create mode 100644
> meta-networking/recipes-daemons/squid/files/0001-ESI-Drop-incorrect-and-u=
nnecessary-xmlSetFeature-cal.patch
> >  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2021-46784.patch
> >  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2022-41317.patch
> >  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2022-41318.patch
> >  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46724.patch
> >  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
> >  create mode 100644
> meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
> >  create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
> >  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-pa=
ssdbs-with-identical-driver-args.patch
> >  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0001-lib-smtp-smtp-server=
-connection-Fix-STARTTLS-command.patch
> >  create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-4124=
4.patch
> >  create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.patch
> >  create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch
> >  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2022-30698_30699.patc=
h
> >  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2022-3204.patch
> >  create mode 100644
> meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
> >  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-01.patch
> >  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-02.patch
> >  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-03.patch
> >  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-04.patch
> >  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
> >  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
> >  create mode 100644 meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest
> >  delete mode 100644
> meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-=
compiler-induced-si.patch
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-b=
ugs.patch
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0001-add-Certificate_Store_In_Memory-c=
-tor-that-takes-a-v.patch
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0002-FIX-intermediates-can-sign-their-=
own-OCSP-responses.patch
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0003-FIX-missing-validation-of-authori=
ty-of-delegation-re.patch
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/0004-review-comments.patch
> >  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-21490.patch
> >  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30722.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
> >  rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb =3D>
> cjson_1.7.19.bb} (85%)
> >  create mode 100644
> meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024-52949.patch
> >  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch
> >  create mode 100644
> meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch
> >  create mode 100644
> meta-oe/recipes-extended/ostree/ostree/tests-account-for-different-locale=
s-in-remote-gpg-list-keys-test.patch
> >  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-27151.patch
> >  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-32023.patch
> >  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46817.patch
> >  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46818.patch
> >  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46819.patch
> >  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-48367.patch
> >  create mode 100644
> meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-49844.patch
> >  create mode 100644
> meta-oe/recipes-extended/zlog/zlog/0001-Fix-stack-buffer-overflow-at-zlog=
_conf_build_with_fi.patch
> >  create mode 100644
> meta-oe/recipes-gnome/libjcat/libjcat/install_missing_ptest_binary.patch
> >  create mode 100644
> meta-oe/recipes-graphics/fbida/files/0007-make-fbpdf-build-optional.patch
> >  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-1=
.patch
> >  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-2=
.patch
> >  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-3=
.patch
> >  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-4=
.patch
> >  create mode 100644
> meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-5=
.patch
> >  create mode 100644
> meta-oe/recipes-multimedia/faad2/faad2/0001-Check-return-value-of-ltp_dat=
a.patch
> >  create mode 100644
> meta-oe/recipes-multimedia/faad2/faad2/0001-Restrict-SBR-frame-length-to-=
960-and-1024-samples.patch
> >  create mode 100644
> meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-m=
p4read.c.patch
> >  create mode 100644
> meta-oe/recipes-multimedia/faad2/faad2/0001-mp4read.c-fix-stack-buffer-ov=
erflow-in-stringin-ftyp.patch
> >  create mode 100644
> meta-oe/recipes-multimedia/wavpack/wavpack/CVE-2016-10169.patch
> >  create mode 100644
> meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-=
regex-for-getting-endian.patch
> >  create mode 100644 meta-oe/recipes-support/cli11/cli11/run-ptest
> >  create mode 100644 meta-oe/recipes-support/fmt/fmt/run-ptest
> >  create mode 100644 meta-oe/recipes-support/function2/function2/run-pte=
st
> >  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
> >  create mode 100644
> meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch
> >  create mode 100644
> meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
> >  create mode 100644
> meta-oe/recipes-support/libmanette/libmanette/run-ptest
> >  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-4878-1.patch
> >  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-4878-2.patch
> >  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
> >  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
> >  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0001.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0002.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0003.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0004.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0005.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0006.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0007.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0008.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0009.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-5992-0010.patch
> >  create mode 100644
> meta-oe/recipes-support/poco/poco/0001-fix-test-Use-96-bit-IV-with-aes-25=
6-gcm-to-fix-4347.patch
> >  create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch
> >  create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
> >  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2025-8067.patch
> >  create mode 100644
> meta-oe/recipes-support/zchunk/zchunk/0001-Handle-overflow-errors-in-malf=
ormed-zchunk-files.patch
> >  create mode 100644 meta-oe/recipes-support/zchunk/zchunk/run-ptest
> >  create mode 100644
> meta-perl/recipes-perl/libconfig/files/0001-correct-libperl-regex.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23829.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-aspectlib/0001-fix-failing-pt=
ests.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-betamax/fix-direct-calls-to-t=
est-fixtures.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-betamax/fix-failing-ptest.pat=
ch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-gunicorn/eventlet-worker-ALRE=
ADY_HANDLED-WSGI_LOCAL.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2024-28219.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-soupsieve/update_tests_for_la=
test_libxml.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determin=
stic-test_minimize_dfa-test-as-XFAI.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-yarl/0001-Correct-square-brac=
ket-handling-in-URL-netloc-882.patch
> >  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Add-missing-permissions=
-check-when-saving-allowed-cr.patch
> >  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Escape-potentially-mali=
cious-HTTP-headers.patch
> >  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Foreign-module-may-need=
-a-check.patch
> >  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-HTML-escape-command-des=
cription.patch
> >  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Object-names-cannot-con=
tact-special-characters.patch
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121657):
> https://lists.openembedded.org/g/openembedded-devel/message/121657
> Mute This Topic: https://lists.openembedded.org/mt/116281359/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004d0267064389ce56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is really=C2=A0helpful. I think we could automate it =
for other releases too.</div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13, 2025 at 12:38=
=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">You might have noticed =
that I have included ptest results in this PR&#39;s<br>
description - I intend to make this a regular thing for Kirkstone<br>
releases for now. These tests were compiled and executed using the<br>
default toolchain, on qemux86-64.<br>
<br>
From the next release I plan to attach the ptest logs to the actual<br>
workflow execution, but for now it is only hosted on my own server (it<br>
won&#39;t stay there forever, but I plan to keep the link alive at least<br=
>
until the next release, or so).<br>
<br>
The current set includes all ptest-enabled recipes, except for 6:<br>
<br>
psqlodbc<br>
python3-execnet<br>
libnet-dns-sec-perl-ptest<br>
libnet-ssleay-perl-ptest<br>
nftables-ptest<br>
clutter-1.0-ptest<br>
<br>
These are not working as they should, usually they are missing some<br>
RDEPENDS, and they also require some arcane settings which I couldn&#39;t<b=
r>
yet figure out completely. I plan to spend more time on these also in<br>
the near future, but if anyone would like to fix any of them up, that<br>
would help a lot really.<br>
<br>
In case you would like to have the tests executed on a different<br>
toolchain/target combination also, I&#39;m open for that - but if it doesn&=
#39;t<br>
work out of the box, I might need some help with the fixup.<br>
<br>
Just as I closed my previous email: if you have any question or<br>
comments, please let me know. Thank you.<br>
<br>
On 11/13/25 21:34, Gyorgy Sarvari via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; Hello,<br>
&gt;<br>
&gt; This new Kirkstone Pull Request contains many CVE and ptest <br>
&gt; fixes - thank you all who contributed to this release.<br>
&gt;<br>
&gt; arm build logs: <a href=3D"https://github.com/OldManYellsAtCloud/meta-=
oe-test/actions/runs/19295298643/job/55175680474" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs=
/19295298643/job/55175680474</a><br>
&gt; aarch64 build logs: <a href=3D"https://github.com/OldManYellsAtCloud/m=
eta-oe-test/actions/runs/19295436972/job/55176140854" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/actions/=
runs/19295436972/job/55176140854</a><br>
&gt; x86 build logs: <a href=3D"https://github.com/OldManYellsAtCloud/meta-=
oe-test/actions/runs/19295439984/job/55176150598" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs=
/19295439984/job/55176150598</a><br>
&gt; x86-64 build logs: <a href=3D"https://github.com/OldManYellsAtCloud/me=
ta-oe-test/actions/runs/19260539512/job/55064120322" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/actions/r=
uns/19260539512/job/55064120322</a><br>
&gt; YP compatibility check logs: <a href=3D"https://github.com/OldManYells=
AtCloud/meta-oe-test/actions/runs/19295447503/job/55176174138" rel=3D"noref=
errer" target=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test=
/actions/runs/19295447503/job/55176174138</a><br>
&gt; ptest build and run results (x86-64, gcc+glibc): <a href=3D"https://gi=
thub.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19297105771" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-=
test/actions/runs/19297105771</a><br>
&gt; ptest logs (change the placeholders): sarvari $dot me $slash yocto $sl=
ash ptest-kirkstone-2025-11.tar.gz<br>
&gt;<br>
&gt; Please let me know if you have any questions or comments.<br>
&gt;<br>
&gt; Thank you<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; The following changes since commit 96fbc156364fd78530d2bfbe1b8a77789f5=
2997d:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0collectd: set working SRC_URI (2025-10-02 15:16:50 +0200)<=
br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.openembedded.org/meta-openembe=
dded-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/met=
a-openembedded-contrib</a> stable/kirkstone-nut<br>
&gt;<br>
&gt; for you to fetch changes up to 07ac1890c843b374c27e150f1a2e53ad3db2a8e=
4:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0libssh: fix CVE-2025-8277 (2025-11-11 08:50:50 +0100)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Alexandre Truong (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0evince: Update status for CVE-2011-0433 and =
CVE-2011-5244<br>
&gt;<br>
&gt; Archana Polampalli (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcpreplay: fix CVE-2025-9157<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcpreplay: fix CVE-2025-51006<br>
&gt;<br>
&gt; Changqing Li (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0keyutils: fix ptest failed since &quot;+++ C=
an&#39;t Determine Endianness&quot;<br>
&gt;<br>
&gt; Chen Qi (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0frr: add CVE_PRODUCT<br>
&gt;<br>
&gt; Derek Straka (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-typeguard: update ptest dependencies=
<br>
&gt;<br>
&gt; Divya Chellam (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mariadb: fix CVE-2025-21490<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0jq: fix CVE-2025-9403<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mariadb: fix CVE-2025-30722<br>
&gt;<br>
&gt; Gyorgy Sarvari (86):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ace: ignore CVE-2009-1147<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apache2: ignore irrelevant CVEs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0civetweb: patch CVE-2020-27304<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dovecot: patch CVE-2022-30550<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dovecot: patch CVE-2021-33515<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0botan: patch CVE-2022-43705<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0botan: patch CVE-2024-39312<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0botan: patch CVE-2024-50382 and CVE-2024-503=
83<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0iperf2: ignore irrelevant CVEs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0zlog: patch CVE-2021-43521<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0zchunk: patch CVE-2023-46228<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0webmin: patch CVE-2017-15644, CVE-2017-15645=
 and CVE-2017-15646<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0webmin: patch CVE-2017-17089<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0webmin: patch CVE-2019-15642<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0webmin: patch CVE-2022-0824<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0webmin: patch CVE-2022-0829<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apache2: ignore CVE-2025-3891<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0faad2: patch CVE-2021-32272<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0faad2: patch CVE-2021-32273<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0faad2: patch CVE-2021-32274 and CVE-2021-322=
77<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0faad2: patch CVE-2021-32278<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cli11: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0function2: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel-selftest: fix ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0keyutils: add missing ptest dependencies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libdbi-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libjcat: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libmanette: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxml++-5.0: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pv: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sdbus-c++: fix ptest script output<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-ujson: fix run-ptest script<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-soupsieve: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-betamax: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-yarl: fix ptests (and make it compat=
ible with current python)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cryptsetup: extend licenses with Apache and =
CC0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0zchunk: add ptest support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wavpack: patch CVE-2016-10169<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0netkit-telnet: patch CVE-2022-39028<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0renderdoc: patch CVE-2023-33863, CVE-2023-33=
864 and CVE-2023-33865<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0squid: patch CVE-2021-46784<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0squid: patch CVE-2022-41317<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0squid: patch CVE-2022-41318<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0squid: patch CVE-2023-46724<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0squid: patch CVE-2025-59362<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0squid: fix esi PACKAGECONFIG<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-py-cpuinfo: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-requests-toolbelt: disable tests wit=
h expired certificate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pint: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-gevent: fix syntax error in cve patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-gunicorn: add patch work with gevent=
let<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0klibc: patch CVE-2021-31870<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0klibc: patch CVE-2021-31871<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0klibc: patch CVE-2021-31872<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0klibc: patch CVE-2021-31873<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gattlib: ignore CVE-2019-6498<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0iptraf-ng: patch CVE-2024-52949<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0keepalived: patch CVE-2021-44225<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxml-libxml-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libunix-statgrab: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libtest-harness-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-scapy: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0freediameter: fix run-ptest reporting<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0net-snmp: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sshfs-fuse: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fuse3: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libopenmpt: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libauthen-sasl-perl: fix ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libconfig-autoconf-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libcrypt-openssl-guess-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libdbd-sqlite-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libfile-slurper-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libmime-types-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libencode-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mongodb: add tzdata to runtime dependencies<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0poco: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ostree: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxml++: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-aspectlib: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libnet-dns-perl: fix ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gimp: ignore CVE-2007-3741<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inotify-tools: add PASS/FAIL status to run-p=
test script<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gimp: patch CVE-2022-30067<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gimp: patch CVE-2022-32990<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0poco: remove mongodb from ptest RDEPENDS<br>
&gt;<br>
&gt; Khem Raj (4):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libteam: Add missing dependencies revealed b=
y ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oprofile: Fix failing ptests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-whoosh: Fix an intermittent ptest<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0openl2tp: Fix ptests<br>
&gt;<br>
&gt; Nikhil R (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inotify-tools: add ptest support for inotify=
-tools<br>
&gt;<br>
&gt; Ninette Adhikari (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xsp: CVE status update for CVE-2006-2658<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0st: Update status for CVE-2017-16224<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0influxdb: Update CVE status for CVE-2019-103=
29<br>
&gt;<br>
&gt; Peter Marko (6):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0emlog: set CVE_PRODUCT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0squid: mark CVE-2025-54574 as patched<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dash: set CVE_PRODUCT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0id3lib: mark CVE-2007-4460 as fixed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hostapd: patch CVE-2025-24912<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hostapd: patch CVE-2022-37660<br>
&gt;<br>
&gt; Praveen Kumar (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0yasm: fix CVE-2024-22653<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cjson: upgrade 1.7.18 -&gt; 1.7.19<br>
&gt;<br>
&gt; Rajeshkumar Ramasamy (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0open-vm-tools: fix CVE-2025-41244<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libssh: fix CVE-2025-4878<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libssh: fix CVE-2025-8277<br>
&gt;<br>
&gt; Sana Kazi (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cryptsetup: Update the license field<br>
&gt;<br>
&gt; Saravanan (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0udisks2: fix CVE-2025-8067<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fio: fix CVE-2025-10823<br>
&gt;<br>
&gt; Soumya Sambu (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0iniparser: Fix CVE-2025-0633<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pillow: Fix CVE-2024-28219<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-aiohttp: Fix CVE-2024-23829<br>
&gt;<br>
&gt; Vijay Anusuri (11):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vorbis-tools: Fix CVE-2023-43361<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0redis: Fix CVE-2025-27151<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0redis: Fix CVE-2025-32023<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0redis: Fix CVE-2025-48367<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0redis: Fix CVE-2025-46817<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0redis: Fix CVE-2025-46818<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0redis: Fix CVE-2025-46819<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0redis: Fix CVE-2025-49844<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0proftpd: Fix CVE-2023-48795<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unbound: Fix for CVE-2022-30698 and CVE-2022=
-30699<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unbound: Fix CVE-2022-3204<br>
&gt;<br>
&gt; Wentao Zhang (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0jemalloc: include the missing shell scripts =
and source the corresponds shell scripts for some test cases.<br>
&gt;<br>
&gt; Yi Zhao (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mbedtls: upgrade 2.28.9 -&gt; 2.28.10<br>
&gt;<br>
&gt; Yogita Urade (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0poppler: fix CVE-2025-43718<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0poppler: fix CVE-2025-52885<br>
&gt;<br>
&gt; Zhang Peng (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0frr: fix CVE-2024-31949<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0opensc: fix CVE-2023-5992<br>
&gt;<br>
&gt; simoneScaravati (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fbida: fix make fbpdf build optional<br>
&gt;<br>
&gt; virendra thakur (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0imagemagick: Fix CVE-2022-28463<br>
&gt;<br>
&gt;=C2=A0 .../sshfs-fuse/sshfs-fuse/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 +<br>
&gt;=C2=A0 .../sshfs-fuse/<a href=3D"http://sshfs-fuse_3.7.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">sshfs-fuse_3.7.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 .../recipes-support/fuse/fuse3/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../recipes-support/fuse/<a href=3D"http://fuse3_3.10.5.bb" rel=
=3D"noreferrer" target=3D"_blank">fuse3_3.10.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 .../recipes-gimp/gimp/gimp/CVE-2022-30067.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A064 +<br>
&gt;=C2=A0 .../recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch=C2=A0 |=C2=A0 =
=C2=A097 +<br>
&gt;=C2=A0 .../recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch=C2=A0 |=C2=A0 =
178 ++<br>
&gt;=C2=A0 .../recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch=C2=A0 |=C2=A0 =
=C2=A035 +<br>
&gt;=C2=A0 meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.30.bb" =
rel=3D"noreferrer" target=3D"_blank">gimp_2.10.30.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A010 +-<br>
&gt;=C2=A0 meta-gnome/recipes-gnome/evince/<a href=3D"http://evince_42.3.bb=
" rel=3D"noreferrer" target=3D"_blank">evince_42.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 4 +<br>
&gt;=C2=A0 .../klibc/files/CVE-2021-31870.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A045 +<br>
&gt;=C2=A0 .../klibc/files/CVE-2021-31871.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A034 +<br>
&gt;=C2=A0 .../klibc/files/CVE-2021-31872.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A070 +<br>
&gt;=C2=A0 .../klibc/files/CVE-2021-31873.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A043 +<br>
&gt;=C2=A0 meta-initramfs/recipes-devtools/klibc/klibc.inc=C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 4 +<br>
&gt;=C2=A0 .../libopenmpt/<a href=3D"http://libopenmpt_0.6.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">libopenmpt_0.6.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 ...issing-include-utf8.h-to-codec_skeleton.c.patch |=C2=A0 =C2=
=A028 +<br>
&gt;=C2=A0 .../vorbis-tools/vorbis-tools/CVE-2023-43361.patch |=C2=A0 =C2=
=A057 +<br>
&gt;=C2=A0 .../vorbis-tools/<a href=3D"http://vorbis-tools_1.4.2.bb" rel=3D=
"noreferrer" target=3D"_blank">vorbis-tools_1.4.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +-<br>
&gt;=C2=A0 .../0001-Sanitize-upload-filename-like-URL.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A027 +<br>
&gt;=C2=A0 ...-example-Upload-to-temporary-directory-an.patch |=C2=A0 =C2=
=A090 +<br>
&gt;=C2=A0 .../recipes-connectivity/civetweb/<a href=3D"http://civetweb_git=
.bb" rel=3D"noreferrer" target=3D"_blank">civetweb_git.bb</a>=C2=A0 |=C2=A0=
 =C2=A0 2 +<br>
&gt;=C2=A0 .../{<a href=3D"http://mbedtls_2.28.9.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mbedtls_2.28.9.bb</a> =3D&gt; <a href=3D"http://mbedtls_2.28=
.10.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.10.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-<br>
&gt;=C2=A0 .../keepalived/keepalived/CVE-2021-44225.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A041 +<br>
&gt;=C2=A0 .../recipes-daemons/keepalived/<a href=3D"http://keepalived_2.2.=
2.bb" rel=3D"noreferrer" target=3D"_blank">keepalived_2.2.2.bb</a> |=C2=A0 =
=C2=A0 1 +<br>
&gt;=C2=A0 .../proftpd/files/CVE-2023-48795.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 751 +++++++<br>
&gt;=C2=A0 .../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7c.bb"=
 rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 ...correct-and-unnecessary-xmlSetFeature-cal.patch |=C2=A0 =C2=
=A035 +<br>
&gt;=C2=A0 .../squid/files/CVE-2021-46784.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 133 ++<br>
&gt;=C2=A0 .../squid/files/CVE-2022-41317.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A026 +<br>
&gt;=C2=A0 .../squid/files/CVE-2022-41318.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A045 +<br>
&gt;=C2=A0 .../squid/files/CVE-2023-46724.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A041 +<br>
&gt;=C2=A0 .../squid/files/CVE-2023-5824.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 .../squid/files/CVE-2025-59362.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A051 +<br>
&gt;=C2=A0 .../recipes-daemons/squid/<a href=3D"http://squid_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">squid_4.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 6 +<br>
&gt;=C2=A0 .../python/python3-scapy/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-scapy_2.4.=
5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scapy_2.4.5.bb</a> |=C2=
=A0 =C2=A013 +<br>
&gt;=C2=A0 .../netkit-telnet/files/CVE-2022-39028.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A072 +<br>
&gt;=C2=A0 .../netkit-telnet/<a href=3D"http://netkit-telnet_0.17.bb" rel=
=3D"noreferrer" target=3D"_blank">netkit-telnet_0.17.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../recipes-protocols/freediameter/files/run-ptest |=C2=A0 =C2=
=A0 2 +-<br>
&gt;=C2=A0 .../recipes-protocols/frr/frr/CVE-2024-31949.patch |=C2=A0 153 +=
+<br>
&gt;=C2=A0 meta-networking/recipes-protocols/frr/<a href=3D"http://frr_8.2.=
2.bb" rel=3D"noreferrer" target=3D"_blank">frr_8.2.2.bb</a> |=C2=A0 =C2=A0 =
3 +<br>
&gt;=C2=A0 .../recipes-protocols/net-snmp/<a href=3D"http://net-snmp_5.9.3.=
bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.3.bb</a>=C2=A0 =C2=A0=
|=C2=A0 =C2=A0 6 +-<br>
&gt;=C2=A0 .../recipes-protocols/openl2tp/openl2tp/run-ptest=C2=A0 |=C2=A0 =
=C2=A0 7 +-<br>
&gt;=C2=A0 .../recipes-protocols/openl2tp/<a href=3D"http://openl2tp_1.8.bb=
" rel=3D"noreferrer" target=3D"_blank">openl2tp_1.8.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 ...ndling-passdbs-with-identical-driver-args.patch |=C2=A0 137 +=
+<br>
&gt;=C2=A0 ...tp-server-connection-Fix-STARTTLS-command.patch |=C2=A0 =C2=
=A076 +<br>
&gt;=C2=A0 .../recipes-support/dovecot/<a href=3D"http://dovecot_2.3.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">dovecot_2.3.14.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 .../open-vm-tools/CVE-2025-41244.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 124 ++<br>
&gt;=C2=A0 .../open-vm-tools/<a href=3D"http://open-vm-tools_11.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">open-vm-tools_11.3.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../tcpreplay/tcpreplay/CVE-2025-51006.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A097 +<br>
&gt;=C2=A0 .../tcpreplay/tcpreplay/CVE-2025-9157.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A044 +<br>
&gt;=C2=A0 .../recipes-support/tcpreplay/<a href=3D"http://tcpreplay_4.4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">tcpreplay_4.4.4.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A0 4 +-<br>
&gt;=C2=A0 .../unbound/unbound/CVE-2022-30698_30699.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 627 ++++++<br>
&gt;=C2=A0 .../unbound/unbound/CVE-2022-3204.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 221 ++<br>
&gt;=C2=A0 .../recipes-support/unbound/<a href=3D"http://unbound_1.15.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">unbound_1.15.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 .../meta-python/recipes-dbs/mongodb/<a href=3D"http://mongodb_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">mongodb_git.bb</a> |=C2=A0 =C2=
=A0 1 +<br>
&gt;=C2=A0 .../recipes-benchmark/fio/fio/CVE-2025-10823.patch |=C2=A0 =C2=
=A037 +<br>
&gt;=C2=A0 meta-oe/recipes-benchmark/fio/<a href=3D"http://fio_3.30.bb" rel=
=3D"noreferrer" target=3D"_blank">fio_3.30.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 meta-oe/recipes-benchmark/iperf2/<a href=3D"http://iperf2_2.0.13=
.bb" rel=3D"noreferrer" target=3D"_blank">iperf2_2.0.13.bb</a>=C2=A0 |=C2=
=A0 =C2=A0 3 +<br>
&gt;=C2=A0 meta-oe/recipes-connectivity/ace/<a href=3D"http://ace_6.5.12.bb=
" rel=3D"noreferrer" target=3D"_blank">ace_6.5.12.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 .../recipes-connectivity/gattlib/<a href=3D"http://gattlib_git.b=
b" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 .../hostapd/hostapd/CVE-2022-37660-01.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 249 +++<br>
&gt;=C2=A0 .../hostapd/hostapd/CVE-2022-37660-02.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 111 +<br>
&gt;=C2=A0 .../hostapd/hostapd/CVE-2022-37660-03.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 762 +++++++<br>
&gt;=C2=A0 .../hostapd/hostapd/CVE-2022-37660-04.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A085 +<br>
&gt;=C2=A0 .../hostapd/hostapd/CVE-2025-24912-01.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A079 +<br>
&gt;=C2=A0 .../hostapd/hostapd/CVE-2025-24912-02.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A070 +<br>
&gt;=C2=A0 .../recipes-connectivity/hostapd/<a href=3D"http://hostapd_2.10.=
bb" rel=3D"noreferrer" target=3D"_blank">hostapd_2.10.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A0 6 +<br>
&gt;=C2=A0 meta-oe/recipes-core/emlog/emlog.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest |=C2=A0 =C2=
=A0 4 +<br>
&gt;=C2=A0 meta-oe/recipes-core/libxml/libxml++-<a href=3D"http://5.0_5.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">5.0_5.0.1.bb</a>=C2=A0 |=C2=A0 =
=C2=A0 7 +<br>
&gt;=C2=A0 .../libxml/libxml++/libxml++_ptest.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A078 -<br>
&gt;=C2=A0 meta-oe/recipes-core/libxml/libxml++/run-ptest=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 5 +-<br>
&gt;=C2=A0 meta-oe/recipes-core/libxml/libxml++_<a href=3D"http://2.42.1.bb=
" rel=3D"noreferrer" target=3D"_blank">2.42.1.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A012 +-<br>
&gt;=C2=A0 .../sdbus-c++/sdbus-c++-1.0.0/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A012 +-<br>
&gt;=C2=A0 ...lue-barriers-to-avoid-compiler-induced-si.patch |=C2=A0 =C2=
=A067 +<br>
&gt;=C2=A0 ...0001-Address-various-name-constraint-bugs.patch |=C2=A0 749 +=
++++++<br>
&gt;=C2=A0 ...cate_Store_In_Memory-c-tor-that-takes-a-v.patch |=C2=A0 =C2=
=A031 +<br>
&gt;=C2=A0 ...ediates-can-sign-their-own-OCSP-responses.patch |=C2=A0 =C2=
=A036 +<br>
&gt;=C2=A0 ...-validation-of-authority-of-delegation-re.patch |=C2=A0 106 +=
<br>
&gt;=C2=A0 .../botan/botan/0004-review-comments.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A028 +<br>
&gt;=C2=A0 meta-oe/recipes-crypto/botan/<a href=3D"http://botan_2.19.1.bb" =
rel=3D"noreferrer" target=3D"_blank">botan_2.19.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 9 +-<br>
&gt;=C2=A0 .../recipes-crypto/cryptsetup/<a href=3D"http://cryptsetup_2.4.3=
.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.4.3.bb</a>=C2=A0 |=
=C2=A0 =C2=A0 6 +-<br>
&gt;=C2=A0 meta-oe/recipes-dbs/influxdb/<a href=3D"http://influxdb_1.8.10.b=
b" rel=3D"noreferrer" target=3D"_blank">influxdb_1.8.10.bb</a>=C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 .../recipes-dbs/mysql/mariadb/CVE-2025-21490.patch |=C2=A0 =C2=
=A096 +<br>
&gt;=C2=A0 .../recipes-dbs/mysql/mariadb/CVE-2025-30722.patch |=C2=A0 176 +=
+<br>
&gt;=C2=A0 .../cjson/cjson/CVE-2025-57052.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A033 -<br>
&gt;=C2=A0 .../cjson/{<a href=3D"http://cjson_1.7.18.bb" rel=3D"noreferrer"=
 target=3D"_blank">cjson_1.7.18.bb</a> =3D&gt; <a href=3D"http://cjson_1.7.=
19.bb" rel=3D"noreferrer" target=3D"_blank">cjson_1.7.19.bb</a>}=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 3 +-<br>
&gt;=C2=A0 .../iptraf/iptraf-ng/CVE-2024-52949.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 218 ++<br>
&gt;=C2=A0 meta-oe/recipes-devtools/iptraf/<a href=3D"http://iptraf-ng_1.2.=
1.bb" rel=3D"noreferrer" target=3D"_blank">iptraf-ng_1.2.1.bb</a> |=C2=A0 =
=C2=A0 1 +<br>
&gt;=C2=A0 meta-oe/recipes-devtools/jemalloc/files/run-ptest=C2=A0 |=C2=A0 =
=C2=A029 +-<br>
&gt;=C2=A0 .../recipes-devtools/jemalloc/<a href=3D"http://jemalloc_5.2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">jemalloc_5.2.1.bb</a>=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 7 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch |=C2=A0 =C2=
=A049 +<br>
&gt;=C2=A0 meta-oe/recipes-devtools/jq/<a href=3D"http://jq_git.bb" rel=3D"=
noreferrer" target=3D"_blank">jq_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 meta-oe/recipes-devtools/perl/<a href=3D"http://libdbi-perl_1.64=
3.bb" rel=3D"noreferrer" target=3D"_blank">libdbi-perl_1.643.bb</a> |=C2=A0=
 =C2=A0 6 +-<br>
&gt;=C2=A0 .../yasm/yasm/CVE-2024-22653.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A032 +<br>
&gt;=C2=A0 meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">yasm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 meta-oe/recipes-extended/ostree/ostree/run-ptest=C2=A0 =C2=A0|=
=C2=A0 =C2=A013 +-<br>
&gt;=C2=A0 ...rent-locales-in-remote-gpg-list-keys-test.patch |=C2=A0 102 +=
<br>
&gt;=C2=A0 meta-oe/recipes-extended/ostree/<a href=3D"http://ostree_2021.6.=
bb" rel=3D"noreferrer" target=3D"_blank">ostree_2021.6.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 .../redis/redis-7.0.13/CVE-2025-27151.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A032 +<br>
&gt;=C2=A0 .../redis/redis-7.0.13/CVE-2025-32023.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 215 ++<br>
&gt;=C2=A0 .../redis/redis-7.0.13/CVE-2025-46817.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 101 +<br>
&gt;=C2=A0 .../redis/redis-7.0.13/CVE-2025-46818.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 283 +++<br>
&gt;=C2=A0 .../redis/redis-7.0.13/CVE-2025-46819.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 161 ++<br>
&gt;=C2=A0 .../redis/redis-7.0.13/CVE-2025-48367.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 111 +<br>
&gt;=C2=A0 .../redis/redis-7.0.13/CVE-2025-49844.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A035 +<br>
&gt;=C2=A0 meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.0.13.bb=
" rel=3D"noreferrer" target=3D"_blank">redis_7.0.13.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 7 +<br>
&gt;=C2=A0 ...uffer-overflow-at-zlog_conf_build_with_fi.patch |=C2=A0 =C2=
=A025 +<br>
&gt;=C2=A0 meta-oe/recipes-extended/zlog/<a href=3D"http://zlog_1.2.15.bb" =
rel=3D"noreferrer" target=3D"_blank">zlog_1.2.15.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
&gt;=C2=A0 .../libjcat/install_missing_ptest_binary.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A025 +<br>
&gt;=C2=A0 meta-oe/recipes-gnome/libjcat/<a href=3D"http://libjcat_0.1.11.b=
b" rel=3D"noreferrer" target=3D"_blank">libjcat_0.1.11.bb</a>=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 meta-oe/recipes-graphics/fbida/<a href=3D"http://fbida_2.14.bb" =
rel=3D"noreferrer" target=3D"_blank">fbida_2.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 .../files/0007-make-fbpdf-build-optional.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 102 +<br>
&gt;=C2=A0 .../renderdoc/CVE-2023-33863-33864-33865-1.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A071 +<br>
&gt;=C2=A0 .../renderdoc/CVE-2023-33863-33864-33865-2.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A072 +<br>
&gt;=C2=A0 .../renderdoc/CVE-2023-33863-33864-33865-3.patch=C2=A0 =C2=A0|=
=C2=A0 160 ++<br>
&gt;=C2=A0 .../renderdoc/CVE-2023-33863-33864-33865-4.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A028 +<br>
&gt;=C2=A0 .../renderdoc/CVE-2023-33863-33864-33865-5.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A040 +<br>
&gt;=C2=A0 .../recipes-graphics/renderdoc/<a href=3D"http://renderdoc_1.13.=
bb" rel=3D"noreferrer" target=3D"_blank">renderdoc_1.13.bb</a>=C2=A0 =C2=A0=
|=C2=A0 =C2=A012 +-<br>
&gt;=C2=A0 meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">st_0.8.5.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 .../kernel-selftest/<a href=3D"http://kernel-selftest.bb" rel=3D=
"noreferrer" target=3D"_blank">kernel-selftest.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 .../kernel-selftest/kernel-selftest/run-ptest=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 8 +-<br>
&gt;=C2=A0 meta-oe/recipes-kernel/oprofile/<a href=3D"http://oprofile_1.4.0=
.bb" rel=3D"noreferrer" target=3D"_blank">oprofile_1.4.0.bb</a>=C2=A0 |=C2=
=A0 =C2=A0 9 +-<br>
&gt;=C2=A0 .../0001-Check-return-value-of-ltp_data.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A031 +<br>
&gt;=C2=A0 ...-SBR-frame-length-to-960-and-1024-samples.patch |=C2=A0 =C2=
=A087 +<br>
&gt;=C2=A0 ...001-fix-heap-buffer-overflow-in-mp4read.c.patch |=C2=A0 =C2=
=A037 +<br>
&gt;=C2=A0 ...ix-stack-buffer-overflow-in-stringin-ftyp.patch |=C2=A0 =C2=
=A028 +<br>
&gt;=C2=A0 meta-oe/recipes-multimedia/faad2/<a href=3D"http://faad2_2.8.8.b=
b" rel=3D"noreferrer" target=3D"_blank">faad2_2.8.8.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 7 +-<br>
&gt;=C2=A0 meta-oe/recipes-multimedia/id3lib/<a href=3D"http://id3lib_3.8.3=
.bb" rel=3D"noreferrer" target=3D"_blank">id3lib_3.8.3.bb</a>=C2=A0 |=C2=A0=
 =C2=A0 3 +<br>
&gt;=C2=A0 .../wavpack/wavpack/CVE-2016-10169.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A027 +<br>
&gt;=C2=A0 .../recipes-multimedia/wavpack/<a href=3D"http://wavpack_4.60.1.=
bb" rel=3D"noreferrer" target=3D"_blank">wavpack_4.60.1.bb</a>=C2=A0 =C2=A0=
|=C2=A0 =C2=A0 4 +-<br>
&gt;=C2=A0 meta-oe/recipes-multimedia/xsp/<a href=3D"http://xsp_1.0.0-8.bb"=
 rel=3D"noreferrer" target=3D"_blank">xsp_1.0.0-8.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 ...ox.inc.sh-update-regex-for-getting-endian.patch |=C2=A0 =C2=
=A035 +<br>
&gt;=C2=A0 .../recipes-security/keyutils/<a href=3D"http://keyutils_1.6.1.b=
b" rel=3D"noreferrer" target=3D"_blank">keyutils_1.6.1.bb</a>=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 3 +-<br>
&gt;=C2=A0 meta-oe/recipes-shells/dash/<a href=3D"http://dash_0.5.11.5.bb" =
rel=3D"noreferrer" target=3D"_blank">dash_0.5.11.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 meta-oe/recipes-support/cli11/cli11/run-ptest=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 meta-oe/recipes-support/cli11/<a href=3D"http://cli11_1.9.1.bb" =
rel=3D"noreferrer" target=3D"_blank">cli11_1.9.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A011 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/fmt/fmt/run-ptest=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 meta-oe/recipes-support/fmt/<a href=3D"http://fmt_8.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">fmt_8.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +-<br>
&gt;=C2=A0 .../recipes-support/function2/function2/run-ptest=C2=A0 |=C2=A0 =
=C2=A0 3 +<br>
&gt;=C2=A0 .../recipes-support/function2/<a href=3D"http://function2_4.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">function2_4.2.0.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A0 9 +-<br>
&gt;=C2=A0 .../imagemagick/files/CVE-2022-28463.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A026 +<br>
&gt;=C2=A0 .../imagemagick/<a href=3D"http://imagemagick_7.0.10.bb" rel=3D"=
noreferrer" target=3D"_blank">imagemagick_7.0.10.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../iniparser/iniparser/CVE-2025-0633.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A038 +<br>
&gt;=C2=A0 meta-oe/recipes-support/iniparser/<a href=3D"http://iniparser_4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">iniparser_4.1.bb</a> |=C2=A0 =C2=
=A0 1 +<br>
&gt;=C2=A0 .../inotify-tools/inotify-tools/run-ptest=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A015 +<br>
&gt;=C2=A0 .../inotify-tools/<a href=3D"http://inotify-tools_3.22.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">inotify-tools_3.22.1.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A016 +-<br>
&gt;=C2=A0 .../libmanette/libmanette/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +<br>
&gt;=C2=A0 .../recipes-support/libmanette/<a href=3D"http://libmanette_0.2.=
6.bb" rel=3D"noreferrer" target=3D"_blank">libmanette_0.2.6.bb</a> |=C2=A0 =
=C2=A0 7 +-<br>
&gt;=C2=A0 .../libssh/libssh/CVE-2025-4878-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2196 ++++++++++++++++++++<br>
&gt;=C2=A0 .../libssh/libssh/CVE-2025-4878-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A033 +<br>
&gt;=C2=A0 .../libssh/libssh/CVE-2025-8277-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A057 +<br>
&gt;=C2=A0 .../libssh/libssh/CVE-2025-8277-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A050 +<br>
&gt;=C2=A0 .../libssh/libssh/CVE-2025-8277-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A050 +<br>
&gt;=C2=A0 meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb=
" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 meta-oe/recipes-support/libteam/<a href=3D"http://libteam_1.31.b=
b" rel=3D"noreferrer" target=3D"_blank">libteam_1.31.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 8 +-<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0001.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 359 ++++<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0002.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 269 +++<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0003.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A041 +<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0004.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 109 +<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0005.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A063 +<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0006.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 118 ++<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0007.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A050 +<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0008.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A037 +<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0009.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 123 ++<br>
&gt;=C2=A0 .../opensc/files/CVE-2023-5992-0010.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A075 +<br>
&gt;=C2=A0 meta-oe/recipes-support/opensc/<a href=3D"http://opensc_0.22.0.b=
b" rel=3D"noreferrer" target=3D"_blank">opensc_0.22.0.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A010 +<br>
&gt;=C2=A0 ...se-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch |=C2=A0 =C2=
=A026 +<br>
&gt;=C2=A0 meta-oe/recipes-support/poco/poco/run-ptest=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A018 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/poco/<a href=3D"http://poco_1.11.2.bb" r=
el=3D"noreferrer" target=3D"_blank">poco_1.11.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A020 +-<br>
&gt;=C2=A0 .../poppler/poppler/CVE-2025-43718.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A031 +<br>
&gt;=C2=A0 .../poppler/poppler/CVE-2025-52885.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A030 +<br>
&gt;=C2=A0 meta-oe/recipes-support/poppler/<a href=3D"http://poppler_22.04.=
0.bb" rel=3D"noreferrer" target=3D"_blank">poppler_22.04.0.bb</a> |=C2=A0 =
=C2=A0 2 +<br>
&gt;=C2=A0 meta-oe/recipes-support/pv/<a href=3D"http://pv_1.6.20.bb" rel=
=3D"noreferrer" target=3D"_blank">pv_1.6.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 .../udisks/udisks2/CVE-2025-8067.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A037 +<br>
&gt;=C2=A0 meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.9.4.b=
b" rel=3D"noreferrer" target=3D"_blank">udisks2_2.9.4.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 4 +-<br>
&gt;=C2=A0 ...overflow-errors-in-malformed-zchunk-files.patch |=C2=A0 105 +=
<br>
&gt;=C2=A0 meta-oe/recipes-support/zchunk/zchunk/run-ptest=C2=A0 =C2=A0 |=
=C2=A0 139 ++<br>
&gt;=C2=A0 meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1.2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">zchunk_1.2.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A014 +-<br>
&gt;=C2=A0 .../libauthen/<a href=3D"http://libauthen-sasl-perl_2.16.bb" rel=
=3D"noreferrer" target=3D"_blank">libauthen-sasl-perl_2.16.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +<br>
&gt;=C2=A0 .../files/0001-correct-libperl-regex.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A042 +<br>
&gt;=C2=A0 .../libconfig/<a href=3D"http://libconfig-autoconf-perl_0.319.bb=
" rel=3D"noreferrer" target=3D"_blank">libconfig-autoconf-perl_0.319.bb</a>=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A016 +-<br>
&gt;=C2=A0 .../libcrypt/<a href=3D"http://libcrypt-openssl-guess-perl_0.15.=
bb" rel=3D"noreferrer" target=3D"_blank">libcrypt-openssl-guess-perl_0.15.b=
b</a>=C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../recipes-perl/libdb/<a href=3D"http://libdbd-sqlite-perl_1.68=
.bb" rel=3D"noreferrer" target=3D"_blank">libdbd-sqlite-perl_1.68.bb</a>=C2=
=A0 |=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 .../recipes-perl/libencode/<a href=3D"http://libencode-perl_3.17=
.bb" rel=3D"noreferrer" target=3D"_blank">libencode-perl_3.17.bb</a>=C2=A0 =
|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 .../libfile/<a href=3D"http://libfile-slurper-perl_0.013.bb" rel=
=3D"noreferrer" target=3D"_blank">libfile-slurper-perl_0.013.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 .../libmime/<a href=3D"http://libmime-types-perl_2.17.bb" rel=3D=
"noreferrer" target=3D"_blank">libmime-types-perl_2.17.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 meta-perl/recipes-perl/libnet/files/run-ptest=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 6 +<br>
&gt;=C2=A0 .../recipes-perl/libnet/<a href=3D"http://libnet-dns-perl_1.33.b=
b" rel=3D"noreferrer" target=3D"_blank">libnet-dns-perl_1.33.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A011 +-<br>
&gt;=C2=A0 .../libstatgrab/<a href=3D"http://libunix-statgrab_0.112.bb" rel=
=3D"noreferrer" target=3D"_blank">libunix-statgrab_0.112.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +<br>
&gt;=C2=A0 .../libtest/<a href=3D"http://libtest-harness-perl_3.44.bb" rel=
=3D"noreferrer" target=3D"_blank">libtest-harness-perl_3.44.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A012 +<br>
&gt;=C2=A0 .../libxml/<a href=3D"http://libxml-libxml-perl_2.0134.bb" rel=
=3D"noreferrer" target=3D"_blank">libxml-libxml-perl_2.0134.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 .../python/python3-aiohttp/CVE-2024-23829.patch=C2=A0 =C2=A0 |=
=C2=A0 344 +++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-aiohttp_3.8.6.bb" rel=3D"no=
referrer" target=3D"_blank">python3-aiohttp_3.8.6.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../0001-fix-failing-ptests.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A054 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-aspectlib_1.5.2.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-aspectlib_1.5.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../fix-direct-calls-to-test-fixtures.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A041 +<br>
&gt;=C2=A0 .../python/python3-betamax/fix-failing-ptest.patch |=C2=A0 =C2=
=A044 +<br>
&gt;=C2=A0 .../python/python3-betamax/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-betamax_0.8.1.bb" rel=3D"no=
referrer" target=3D"_blank">python3-betamax_0.8.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 .../python/python3-gevent/CVE-2023-41419.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 ...ventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch |=C2=A0 =C2=
=A054 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-gunicorn_20.1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-gunicorn_20.1.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-<br>
&gt;=C2=A0 .../python/python3-pillow/CVE-2024-28219.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A043 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pillow_9.4.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-pillow_9.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../recipes-devtools/python/python3-pint/run-ptest |=C2=A0 =C2=
=A0 3 +-<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-pint_0.19.=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a> |=C2=
=A0 =C2=A0 6 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-py-cpuinfo_8.0.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-py-cpuinfo_8.0.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../python/python3-requests-toolbelt/run-ptest=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 .../update_tests_for_latest_libxml.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 162 ++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-soupsieve_2.3.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-soupsieve_2.3.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-typeguard_2.13.3.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-typeguard_2.13.3.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 .../python/python3-ujson/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 ...terminstic-test_minimize_dfa-test-as-XFAI.patch |=C2=A0 =C2=
=A029 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-whoosh_2.7.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-whoosh_2.7.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 ...square-bracket-handling-in-URL-netloc-882.patch |=C2=A0 138 +=
+<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-yarl_1.7.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-yarl_1.7.2.bb</a>=C2=A0 |=
=C2=A0 =C2=A0 3 +-<br>
&gt;=C2=A0 .../recipes-httpd/apache2/<a href=3D"http://apache2_2.4.65.bb" r=
el=3D"noreferrer" target=3D"_blank">apache2_2.4.65.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A021 +<br>
&gt;=C2=A0 ...-permissions-check-when-saving-allowed-cr.patch |=C2=A0 =C2=
=A025 +<br>
&gt;=C2=A0 ...Escape-potentially-malicious-HTTP-headers.patch |=C2=A0 =C2=
=A053 +<br>
&gt;=C2=A0 .../0001-Foreign-module-may-need-a-check.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A027 +<br>
&gt;=C2=A0 .../0001-HTML-escape-command-description.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A029 +<br>
&gt;=C2=A0 ...t-names-cannot-contact-special-characters.patch |=C2=A0 =C2=
=A026 +<br>
&gt;=C2=A0 .../recipes-webadmin/webmin/<a href=3D"http://webmin_1.850.bb" r=
el=3D"noreferrer" target=3D"_blank">webmin_1.850.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 7 +-<br>
&gt;=C2=A0 227 files changed, 13948 insertions(+), 198 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-30=
067.patch<br>
&gt;=C2=A0 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32=
990-1.patch<br>
&gt;=C2=A0 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32=
990-2.patch<br>
&gt;=C2=A0 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32=
990-3.patch<br>
&gt;=C2=A0 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/C=
VE-2021-31870.patch<br>
&gt;=C2=A0 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/C=
VE-2021-31871.patch<br>
&gt;=C2=A0 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/C=
VE-2021-31872.patch<br>
&gt;=C2=A0 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/C=
VE-2021-31873.patch<br>
&gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-too=
ls/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch=
<br>
&gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-too=
ls/vorbis-tools/CVE-2023-43361.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/civetweb=
/civetweb/0001-Sanitize-upload-filename-like-URL.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/civetweb=
/civetweb/0002-handle_form-example-Upload-to-temporary-directory-an.patch<b=
r>
&gt;=C2=A0 rename meta-networking/recipes-connectivity/mbedtls/{<a href=3D"=
http://mbedtls_2.28.9.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28=
.9.bb</a> =3D&gt; <a href=3D"http://mbedtls_2.28.10.bb" rel=3D"noreferrer" =
target=3D"_blank">mbedtls_2.28.10.bb</a>} (96%)<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-daemons/keepalived/ke=
epalived/CVE-2021-44225.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-daemons/proftpd/files=
/CVE-2023-48795.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-daemons/squid/files/0=
001-ESI-Drop-incorrect-and-unnecessary-xmlSetFeature-cal.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-daemons/squid/files/C=
VE-2021-46784.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-daemons/squid/files/C=
VE-2022-41317.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-daemons/squid/files/C=
VE-2022-41318.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-daemons/squid/files/C=
VE-2023-46724.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-daemons/squid/files/C=
VE-2025-59362.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/=
files/CVE-2022-39028.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE=
-2024-31949.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/dovecot/dovec=
ot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/dovecot/dovec=
ot/0001-lib-smtp-smtp-server-connection-Fix-STARTTLS-command.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/open-vm-tools=
/open-vm-tools/CVE-2025-41244.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/tcpreplay/tcp=
replay/CVE-2025-51006.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/tcpreplay/tcp=
replay/CVE-2025-9157.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/unbound/unbou=
nd/CVE-2022-30698_30699.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/unbound/unbou=
nd/CVE-2022-3204.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10=
823.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/=
CVE-2022-37660-01.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/=
CVE-2022-37660-02.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/=
CVE-2022-37660-03.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/=
CVE-2022-37660-04.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/=
CVE-2025-24912-01.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/=
CVE-2025-24912-02.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-core/libxml/libxml++-5.0/run-=
ptest<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-core/libxml/libxml++/libxml++=
_ptest.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-Add-m=
ore-value-barriers-to-avoid-compiler-induced-si.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-Addre=
ss-various-name-constraint-bugs.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-add-C=
ertificate_Store_In_Memory-c-tor-that-takes-a-v.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/0002-FIX-i=
ntermediates-can-sign-their-own-OCSP-responses.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/0003-FIX-m=
issing-validation-of-authority-of-delegation-re.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/0004-revie=
w-comments.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-21=
490.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30=
722.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025=
-57052.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-devtools/cjson/{<a href=3D"http://cjson_1=
.7.18.bb" rel=3D"noreferrer" target=3D"_blank">cjson_1.7.18.bb</a> =3D&gt; =
<a href=3D"http://cjson_1.7.19.bb" rel=3D"noreferrer" target=3D"_blank">cjs=
on_1.7.19.bb</a>} (85%)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE=
-2024-52949.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.=
patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2024-2=
2653.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/ostree/ostree/tests-=
account-for-different-locales-in-remote-gpg-list-keys-test.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/C=
VE-2025-27151.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/C=
VE-2025-32023.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/C=
VE-2025-46817.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/C=
VE-2025-46818.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/C=
VE-2025-46819.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/C=
VE-2025-48367.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/C=
VE-2025-49844.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-Fix-s=
tack-buffer-overflow-at-zlog_conf_build_with_fi.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-gnome/libjcat/libjcat/install=
_missing_ptest_binary.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/fbida/files/0007-mak=
e-fbpdf-build-optional.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/=
CVE-2023-33863-33864-33865-1.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/=
CVE-2023-33863-33864-33865-2.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/=
CVE-2023-33863-33864-33865-3.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/=
CVE-2023-33863-33864-33865-4.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/=
CVE-2023-33863-33864-33865-5.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-C=
heck-return-value-of-ltp_data.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-R=
estrict-SBR-frame-length-to-960-and-1024-samples.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-f=
ix-heap-buffer-overflow-in-mp4read.c.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-m=
p4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack/CV=
E-2016-10169.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-security/keyutils/files/0001-=
tests-toolbox.inc.sh-update-regex-for-getting-endian.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/cli11/cli11/run-ptest=
<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/fmt/fmt/run-ptest<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/function2/function2/r=
un-ptest<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE=
-2022-28463.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/iniparser/iniparser/C=
VE-2025-0633.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify=
-tools/run-ptest<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libmanette/libmanette=
/run-ptest<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
5-4878-1.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
5-4878-2.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
5-8277-1.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
5-8277-2.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
5-8277-3.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0001.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0002.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0003.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0004.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0005.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0006.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0007.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0008.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0009.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023=
-5992-0010.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-te=
st-Use-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2=
025-43718.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2=
025-52885.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-20=
25-8067.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-Ha=
ndle-overflow-errors-in-malformed-zchunk-files.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/zchunk/zchunk/run-pte=
st<br>
&gt;=C2=A0 create mode 100644 meta-perl/recipes-perl/libconfig/files/0001-c=
orrect-libperl-regex.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-a=
iohttp/CVE-2024-23829.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-a=
spectlib/0001-fix-failing-ptests.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-b=
etamax/fix-direct-calls-to-test-fixtures.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-b=
etamax/fix-failing-ptest.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-g=
unicorn/eventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-p=
illow/CVE-2024-28219.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-s=
oupsieve/update_tests_for_latest_libxml.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-w=
hoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-y=
arl/0001-Correct-square-bracket-handling-in-URL-netloc-882.patch<br>
&gt;=C2=A0 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/=
0001-Add-missing-permissions-check-when-saving-allowed-cr.patch<br>
&gt;=C2=A0 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/=
0001-Escape-potentially-malicious-HTTP-headers.patch<br>
&gt;=C2=A0 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/=
0001-Foreign-module-may-need-a-check.patch<br>
&gt;=C2=A0 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/=
0001-HTML-escape-command-description.patch<br>
&gt;=C2=A0 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/=
0001-Object-names-cannot-contact-special-characters.patch<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121657): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121657" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121657</a><br>
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

--0000000000004d0267064389ce56--

