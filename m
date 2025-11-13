Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985A2CD98D2
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 20:39:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2789.1763066334937064153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 12:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FqA4Wai6;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47790b080e4so10995e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 12:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763066333; x=1763671133; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHXDcVw52dSNyoa4bBKx/R3c5+bflNJfiRvn4h8wzwo=;
        b=FqA4Wai68JuoMEsFOJhHOD2kHe1Ra9VshrOGQT8ZYwT8IRqaSq3CvcG1AjY3pYTNdC
         84oF8nYu/RsMddIQVmTfV/1zn6c5WcrClNbESnbF9v45qEUoWHkKD5Dtyc9822cEO0qz
         oylf5+FXNkBUokYG+TI3+UZWiRsRahmlFy/20hj+4ctNYjMVEY+Lur2wJ1nDlsS9/vkN
         CPH/+Ww/78vgZmM/d2Vy5PyhxYvvgPKOUc9phinLdA4QbqZZYddvyWH0f2sseCgoGfkY
         VwK9ZdnUlsMofsRXRKqD7ZH9TNspY8c8CzPycUjWXYA76NPn3Y3ctQX8p4r1bciZXORz
         Kf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763066333; x=1763671133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHXDcVw52dSNyoa4bBKx/R3c5+bflNJfiRvn4h8wzwo=;
        b=YtyskV+DbEgIyevaR4o76hUztE0HiHM7Uu54812203CVKqxp7UUJoDX5HHf4Iopafe
         54krcvEpjEBOvR0Rq5Zju1LSGKhdn9uqmzzahbbqbOlfviji97w0HkNCpvgRnv3b0t8T
         tdZoTlQHjSK0ZPvkV8i9fAquifxeSPwycQ7TM+wJqO7GoE1R6AJUNOfF54lu2u28SXH3
         s57g/qvvypjHC4e/iyOZD3J61T4hP5prL2loV3UpGf9aXqJYpPlCiytc7UH70lI3hm2Z
         VvQU2Sg1IoKY7CCJGKBHd0JYxaWhvCxvOEtP/QaHncTae+L4MotdQP/YqKiZUFGQV+mQ
         +pMg==
X-Gm-Message-State: AOJu0YwkVE+MAK/US4ae6cq3kHKHeJctaSjF8lSg456Ufti57Wjh30j2
	r+HHJH823F4YwRGjj+YN3PV5Cb5iYCeeITJHmU5wKmEvZsxzNMkBoSqlLfCUGahT
X-Gm-Gg: ASbGncvZFIij+eYx9lclLFgljq9ZgLTdOhntoQW3zC+0B3XmTHpNoTjYOhvW4YoWNfn
	Q8iEaA2s9VetHYSimHgishxGHY7Z8NAbR6BuP+2OhpwdiXoVyC159Seat2AD7pAHIwSM5Oqjg7w
	9fx8zvn8R2KfmnCC+2AEVPIL9xIej04UrsH47IbW+JMirmF7E7DsI2knvR5CpN/CyMCKTTWrR7z
	9en4tQS7n+kdgDYEho4uTFH56mYffShrjZD6oCUwRVwsibdJPusVZ0mxxlKJqetYiSogUps4OXM
	UfW6HZgP4q+M/j+dNNUNG1DhTjiIJzY4ujXqloxauuTdQnjU5qpXYqPuANMlb2OKnJfJjWi1fH9
	CowjNELG1JvluYfYrZElxQ7JF9Znm/vpmuyumhIXQ6R8iQLXjFlXTQak8C31APKR5dePkgoMXHl
	rz9zGb+pYHDqk7oyU2Tn8=
X-Google-Smtp-Source: AGHT+IEPwH5Nh5SW2uXGrg8h478klP2MyJrUh17ac0Fum1FRfp0pBMRgmfVa1KB+IYAHwLzU2TQvsA==
X-Received: by 2002:a05:600c:3556:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-4778fea30aemr7317945e9.22.1763066333016;
        Thu, 13 Nov 2025 12:38:53 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bae2a09sm29862415e9.0.2025.11.13.12.38.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 12:38:52 -0800 (PST)
Message-ID: <1ece86ba-ded3-4409-8b05-9531c050f201@gmail.com>
Date: Thu, 13 Nov 2025 21:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] Kirkstone Pull Request Nov 13th
To: openembedded-devel@lists.openembedded.org
References: <1877AB3D4A623B33.930811@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1877AB3D4A623B33.930811@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 20:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121657

You might have noticed that I have included ptest results in this PR's
description - I intend to make this a regular thing for Kirkstone
releases for now. These tests were compiled and executed using the
default toolchain, on qemux86-64.

From the next release I plan to attach the ptest logs to the actual
workflow execution, but for now it is only hosted on my own server (it
won't stay there forever, but I plan to keep the link alive at least
until the next release, or so).

The current set includes all ptest-enabled recipes, except for 6:

psqlodbc
python3-execnet
libnet-dns-sec-perl-ptest
libnet-ssleay-perl-ptest
nftables-ptest
clutter-1.0-ptest

These are not working as they should, usually they are missing some
RDEPENDS, and they also require some arcane settings which I couldn't
yet figure out completely. I plan to spend more time on these also in
the near future, but if anyone would like to fix any of them up, that
would help a lot really.

In case you would like to have the tests executed on a different
toolchain/target combination also, I'm open for that - but if it doesn't
work out of the box, I might need some help with the fixup.

Just as I closed my previous email: if you have any question or
comments, please let me know. Thank you.

On 11/13/25 21:34, Gyorgy Sarvari via lists.openembedded.org wrote:
> Hello,
>
> This new Kirkstone Pull Request contains many CVE and ptest 
> fixes - thank you all who contributed to this release.
>
> arm build logs: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19295298643/job/55175680474
> aarch64 build logs: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19295436972/job/55176140854
> x86 build logs: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19295439984/job/55176150598
> x86-64 build logs: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19260539512/job/55064120322
> YP compatibility check logs: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19295447503/job/55176174138
> ptest build and run results (x86-64, gcc+glibc): https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/19297105771
> ptest logs (change the placeholders): sarvari $dot me $slash yocto $slash ptest-kirkstone-2025-11.tar.gz
>
> Please let me know if you have any questions or comments.
>
> Thank you
>
> ---
>
> The following changes since commit 96fbc156364fd78530d2bfbe1b8a77789f52997d:
>
>   collectd: set working SRC_URI (2025-10-02 15:16:50 +0200)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut
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
>       python3-yarl: fix ptests (and make it compatible with current python)
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
>       jemalloc: include the missing shell scripts and source the corresponds shell scripts for some test cases.
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
>  .../{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb}      |    4 +-
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
>  .../cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb}     |    3 +-
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
>  .../libssh/libssh/CVE-2025-4878-1.patch            | 2196 ++++++++++++++++++++
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
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-30067.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch
>  create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31870.patch
>  create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31871.patch
>  create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31872.patch
>  create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31873.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
>  create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-Sanitize-upload-filename-like-URL.patch
>  create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0002-handle_form-example-Upload-to-temporary-directory-an.patch
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb} (96%)
>  create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2021-44225.patch
>  create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch
>  create mode 100644 meta-networking/recipes-daemons/squid/files/0001-ESI-Drop-incorrect-and-unnecessary-xmlSetFeature-cal.patch
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2021-46784.patch
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2022-41317.patch
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2022-41318.patch
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-46724.patch
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
>  create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
>  create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
>  create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
>  create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-lib-smtp-smtp-server-connection-Fix-STARTTLS-command.patch
>  create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch
>  create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2022-30698_30699.patch
>  create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2022-3204.patch
>  create mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-01.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-02.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-03.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-04.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
>  create mode 100644 meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest
>  delete mode 100644 meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-bugs.patch
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-add-Certificate_Store_In_Memory-c-tor-that-takes-a-v.patch
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/0002-FIX-intermediates-can-sign-their-own-OCSP-responses.patch
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/0003-FIX-missing-validation-of-authority-of-delegation-re.patch
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/0004-review-comments.patch
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-21490.patch
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30722.patch
>  delete mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
>  rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb} (85%)
>  create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024-52949.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch
>  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch
>  create mode 100644 meta-oe/recipes-extended/ostree/ostree/tests-account-for-different-locales-in-remote-gpg-list-keys-test.patch
>  create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-27151.patch
>  create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-32023.patch
>  create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46817.patch
>  create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46818.patch
>  create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46819.patch
>  create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-48367.patch
>  create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-49844.patch
>  create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_fi.patch
>  create mode 100644 meta-oe/recipes-gnome/libjcat/libjcat/install_missing_ptest_binary.patch
>  create mode 100644 meta-oe/recipes-graphics/fbida/files/0007-make-fbpdf-build-optional.patch
>  create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-1.patch
>  create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-2.patch
>  create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-3.patch
>  create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-4.patch
>  create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-5.patch
>  create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-Check-return-value-of-ltp_data.patch
>  create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-Restrict-SBR-frame-length-to-960-and-1024-samples.patch
>  create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-mp4read.c.patch
>  create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-mp4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch
>  create mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack/CVE-2016-10169.patch
>  create mode 100644 meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
>  create mode 100644 meta-oe/recipes-support/cli11/cli11/run-ptest
>  create mode 100644 meta-oe/recipes-support/fmt/fmt/run-ptest
>  create mode 100644 meta-oe/recipes-support/function2/function2/run-ptest
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
>  create mode 100644 meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch
>  create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
>  create mode 100644 meta-oe/recipes-support/libmanette/libmanette/run-ptest
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4878-1.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4878-2.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0001.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0002.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0003.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0004.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0005.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0006.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0007.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0008.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0009.patch
>  create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0010.patch
>  create mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-test-Use-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
>  create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2025-8067.patch
>  create mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-Handle-overflow-errors-in-malformed-zchunk-files.patch
>  create mode 100644 meta-oe/recipes-support/zchunk/zchunk/run-ptest
>  create mode 100644 meta-perl/recipes-perl/libconfig/files/0001-correct-libperl-regex.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23829.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-aspectlib/0001-fix-failing-ptests.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-betamax/fix-direct-calls-to-test-fixtures.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-betamax/fix-failing-ptest.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-gunicorn/eventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2024-28219.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-soupsieve/update_tests_for_latest_libxml.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-yarl/0001-Correct-square-bracket-handling-in-URL-netloc-882.patch
>  create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Add-missing-permissions-check-when-saving-allowed-cr.patch
>  create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Escape-potentially-malicious-HTTP-headers.patch
>  create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Foreign-module-may-need-a-check.patch
>  create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-HTML-escape-command-description.patch
>  create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Object-names-cannot-contact-special-characters.patch
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121656): https://lists.openembedded.org/g/openembedded-devel/message/121656
> Mute This Topic: https://lists.openembedded.org/mt/116281359/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


