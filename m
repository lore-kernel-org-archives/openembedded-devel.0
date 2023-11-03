Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395D9C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:15:46 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.52432.1699020937641322268
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 07:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjUuBUvg;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1e9c9d181d6so1192404fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699020937; x=1699625737; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bU5W1wapFfE18Ey9uCaCakLj1ZM9mqdZfiqDO1/1gfQ=;
        b=mjUuBUvg3hOgQKaLzrE/GP9d9Ob3cD0f4A1Ts0pvqtKOvOuCoqt32o0H75j0+WdiMR
         hc/djrCfK/lEqpc0alrqnSxtjczV8CR5/oCti13p6zI1z4JDvYB1p/LE+V76Gn/sJoOd
         mZnxViP0XOrDgsETtuMlKt4Fdm+U7a9L90xo+F9xnYSyxC1DtWk/CVfPyvaFFCgn9asx
         mYeZQTJyWGhrIVFP8wz/8ZpsgY2holH2kV3r6vSjoXvEjCHRMgzd3NEQf4qS841L8ozM
         MCxZxBEpniky5NCHKPkGm1yObOg2pmzaS1pffQK9bTkzUbuN4m2T9OWSwKpXZjdYy0GK
         KCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699020937; x=1699625737;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bU5W1wapFfE18Ey9uCaCakLj1ZM9mqdZfiqDO1/1gfQ=;
        b=N9pqHekdw0pmarEPUNIrfyWLhoqMOVCdytZhr8baWvKs2veFqxBTantVc31xnM0SyM
         /PAE5JcfU7mAQfvnTZNcUp34C7e4Lmc9d1y8u7YX93mYQmXvbtEzTmKliFpzLf7TRX3y
         UCOLHqc/lwvfZTzhgawYMvXHPlxVclsA09ab91GxoBdN41inGcLSMS6yGRAMGBGMhphj
         x+kek99vGRuR5R9u27txwBYkSKE4Qf+4o3r3d2uHoEFeT8cYrOPHiELcDtWDo/spOB4J
         3xwSbDm79Ykp+hmrOyK0pNvm5QMYvDQiWQ6tWgHnr32M8us0Bc75YD7Gqt6xuYxWuvek
         a78Q==
X-Gm-Message-State: AOJu0Yy0oQq9pu5GDQXZI4Q7NMZZW9kfEpEq3vrfOMDv+omBHEZottN1
	o3pE/5lweyJ6/fZ3dDeVtggnPJDXgC5NUw==
X-Google-Smtp-Source: AGHT+IG3mE0bVweSo7DONl+UOOFW7d6W2kVpDZPY1wx8jH73/T0XRwLrro3MP0xhIlMCgiX+fkHeAA==
X-Received: by 2002:a05:6870:1d05:b0:1e9:cdeb:1611 with SMTP id pa5-20020a0568701d0500b001e9cdeb1611mr29447459oab.26.1699020936117;
        Fri, 03 Nov 2023 07:15:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:cad2:13bf:c8a:49d6? ([2600:1700:9190:ba10:cad2:13bf:c8a:49d6])
        by smtp.gmail.com with ESMTPSA id oh16-20020a0568702c9000b001e9a253afa3sm311057oab.49.2023.11.03.07.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 07:15:35 -0700 (PDT)
Message-ID: <004d205c-a698-4ac0-9f53-ebec64828ea8@gmail.com>
Date: Fri, 3 Nov 2023 10:15:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: nanbield merge request: Nov 3rd
Autocrypt: addr=akuster808@gmail.com; keydata=
 xsDNBGNNaZMBDAC6/Mhpw3EGOOTPtIpcUHT4lI974zN/QqccMPxH4oyBPRJbjVImYs9avXwV
 Ae9xoWKMM/vocEZWm6SOESZSGf+7l05Eo6MxU50cIQh0/bcOcdDAtFRDk4pZIL6X7vGzvFe6
 17tfNwKrTPgDFSSvq6XLUOqukInaVMHPeZum5GNnfuJswSDEQdxGTgudLWhCYwwoJ1AsVhg1
 nJXjQLOGUHFAZPYMhTak5jFXwG+CFzJ1OPpoAfcjQGYEYY5k5Yr1dESl/zgZSwwRLAAXo6JZ
 lm1rdd0c54XG4ah6fvZkd8r05uBVvbvmrdw5OohqqWzMq7RB9DAsszLvOaxN1epwUYnpkQ6x
 yYRBQxt766hLxtW6+bIXUZdinUsc0cD+MlLfynTzpT3eJPhvU9EtpTkA7hlFtHrhENRlT5rE
 F1ZCGykIhg5J/BL/JO3AISgliu0pPLg9r6tgZKu8r2LBf05LJ1vT2P1wVwlzpAdgHKAmTDF8
 MFEASfeJ4o9TrVFGbt8+cA0AEQEAAc0hYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFpbC5j
 b20+wsEHBBMBCAAxFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZQCGwMECwkIBwUVCAkK
 CwUWAgMBAAAKCRB5KfJxvOuR703oDAC4coUucV3gE+pNQAJcNWqIQwZHiwxbMy2fBgvTP0bx
 TQj6ZFl4tkiXGydUy9c2lcOj4XfaJuG85Z24IIJE0d8hWZMOZkSv5bmyB/NxbM5xRnPkHb6M
 n58wMSRCfNj/fsOoJE9nj5s41ktg1CA9QFBl9Dt0/8J/Mq+TxOKqYvzL4L8KEIw9nsi/yHQX
 ukXDwI2V01hTPZ6P7a4cZsjuvzCVN/WK2N3LzoVhQZHOOHGgx3h8XmsXMZ2ZxKjIdFTO2gFS
 48zXa4+LW/ZyJIUlnBIUdSnpS826wSq6Zn3TyvLJrFD3KSviX0N48htIfiYFJmTcGdDU+Zqr
 wKnPQWdZXgWLsv+3deGZ8z0UCdt3n/OSwRML3gFfYd7QBLazXIkFyplFmgOLwXkf+YifwSbu
 P3KTOpYN9bcl1Og2zU1dPTEg7RndDAvRUUA+XWrp7VM5gZgc0UFRNkrf4CZhxuMwATCJQVPj
 aII+TOxThBkx6NJqXD3tvlNozjLy4fLNZd8sAsrOwM0EY01plAEMAJ5IoQo1AbOAoMYUytqx
 zi1uOQa+ak48yVg4llEs55D9h9ANFEY8C5CyEYyXYKjHCgepUUHDRKIMIMxxzYLKDkd8bgvt
 +cmi1Jj36Wrzrf9qGFq5SvGL66IoUBCTsN64UexxbnNWMDF8qO2aXLvJZtfFJfYGc1ATDw8i
 96pv+FpjE3N76RdYRSFv5UGRqSKhT6jGlVMHb+Z/h1BOIsEBmbtgCozzJ45zhOY9635B4D7w
 i6CB2Aau3/FycPrKk/ZvkSq28tGYWwuhr/fvfvowg+IeClP1oCdKbaWsEwkGTN/PsRM8dPPe
 n07jesJUgpiHCUTF9oY3wJ1a86otszmWbvtJieM7vOxP3YnzF/VVFgDhTzRS0VqAjNRNOMoF
 E7ENS8o7uj7jrrGPuuM9cOhuDqqHwla3Rh0VX+W0//8qGZJ61oGV9paoGUb4PoRqC8ZpLrMB
 Z+f1VQ4iH7rzSQTOLEqGMZ+A34266TtKZKgmBxyqgNFd1HEeO4PD46ycLpnZAQARAQABwsD2
 BBgBCAAgFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZUCGwwACgkQeSnycbzrke+SWgv/
 QvvX84fAHEl7dkhla/oPdqY2bULh+hOxpo3WZmFhHi+41z2GhOJ78S3mY3yD+O7rdXkQIgIu
 bZDOIBMJc0lY/qKfXGpFOg5b8/hW3pYdjmUP1NQmdFK4XRLRL4OhLttgxVgO2yqDtlt9x1o3
 RLgTSJNsy/gQzUJw4m1zYs9qPRz7xglHwrn0OdDwgk6UofiS31cTZgz7txdNJ5pMNEOcjsaD
 KE+3jd6mAOz/VTG7mH3/5z0t+g9onQmfxBFpgxSM8HVtmjT4KWkqqUJzyXLtawbxhdv+fcUv
 5qUSr9ktwA8NJHmIHHcXBqiZLtLWFMJrdsgTFvjCXmTpm3ncsHS9L+JLVwIVCmUQUUCN1LhG
 itDSpYIEGrZObj82rX1wvxf/ZQ8VXS+owIR2F4yeeqPH/CyrPA1ASdtt+Am28/dJ2krr72at
 J++uLxA0cein1kjcosFDpQscnDcPzohnGyyjgEd6VwelZboIS1jt4lIa1badtV+cWMGMgM8W
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 14:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105864

The following changes since commit 278c3f75e32f38f71bb52d161fe06bcb6f6bdd2f:

   kernel-selftest: Build headers before compiling tests (2023-10-04 
07:52:49 -0700)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded nanbield-next

for you to fetch changes up to 1750c66ae8e4268c472c0b2b94748a59d6ef866d:

   emlog: Add PV (2023-11-01 08:16:30 -0400)

----------------------------------------------------------------
Ahmad Fatoum (1):
       signing.bbclass: don't export OPENSSL environment variables globally

Akash Hadke (1):
       libeigen: Update GPL-3.0-only to GPL-2.0-only

Andrew Jeffery (1):
       mdio-tools: Add virtual/kernel dependency to avoid stale SPDX 
reference

Beniamin Sandu (2):
       libnet: upgrade version v1.2 -> v1.3
       mbedtls: upgrade 3.4.1 -> 3.5.0

Benjamin Bara (1):
       libvpx: upgrade 1.13.0 -> 1.13.1

Carlos Alberto Lopez Perez (1):
       libbacktrace: Update version and enable shared library.

Charles Perry (2):
       libosip2: add recipe
       libexosip2: add recipe

Chen Qi (1):
       libblockdev: fix QA error in case of multilib

Chi Xu (1):
       re2: Add ptest support

Christophe Vu-Brugier (4):
       libnvme: upgrade 1.5 -> 1.6
       nvme-cli: upgrade 2.5 -> 2.6
       libnvme: apply patch already upstream to fix build with musl
       exfatprogs: upgrade 1.2.1 -> 1.2.2

Clément Péron (3):
       Revert "protobuf: stage protoc binary to sysroot"
       proj: Upgrade to 9.3.0 release
       pcapplusplus: Add recipe for 23.09 release

Daniel Klauer (1):
       graphviz: Fix build to not use $prefix as search dir

Daniel McGregor (1):
       python3-pylint: allow native build

David Pierret (3):
       libtext: add ptest
       cjson: Add ptest
       python3-rapidjson: add missing ptest dependency

Denys Zagorui (1):
       libbpf: add arm, powerpc and mips64 to COMPATIBLE_HOST

Etienne Cordonnier (1):
       uutils-coreutils: upgrade 0.0.21 -> 0.0.22

Fabien Thomas (10):
       meta-filesystems/layer.conf : Add meta-networking dependency
       Add static-passwd and static-group files
       Add static-passwd and static-group files
       Add static-passwd and static-group files
       Add static-passwd and static-group files
       Add static-passwd and static-group files
       Add static-passwd and static-group files
       Add static-passwd and static-group files
       klibc/klibc.inc : Add DEBUG_PREFIX_MAP flag.
       samba.bb : Disable ad-dc by default

Fabio Estevam (1):
       edid-decode: Upgrade to latest master

Gianfranco Costamagna (8):
       dlt-daemon: Make it work without systemd
       dlt-daemon: Enable experimental coredumphandler feature
       dlt-daemon: update patch 544.patch
       dlt-daemon: do not disable dlt-system build when systemd is set 
to off
       dlt-daemon: Add an additional fix for non-systemd builds
       cpprestsdk: fix typo in comment, tag is actually 2.0.18
       vbxguestdrivers: upgrade 7.0.10 -> 7.0.12
       cpulimit: add DESCRIPTION field

Jeffrey Pautler (1):
       bolt: change product name used for CVE checking

Joe Slater (2):
       nginx: add configure option
       python3-pynacl: add RCONFLICTS with python3-nacl

Johannes Kauffmann (1):
       open62541: add Backport status and link to patch

Jose Quaresma (4):
       ostree: Upgrade 2023.5 -> 2023.6
       ostree: drop trivial-httpd-cmdline
       ostree: add ed25519-openssl
       ostree: Upgrade 2023.6 -> 2023.7

Jörg Sommer (1):
       collectd: Use https in SRC_URI, add HOMEPAGE

Khem Raj (26):
       python3-pyroute2: Add missing dependency on sqlite3 for ptests
       python3-pylint: Upgrade to 3.0.0
       python3-lz4: use python3-unittest-automake-output
       minicoredumber: Fix ptest reporting
       images: Inherit from core-image-base
       images: Delete layer specific base images
       images: Rename <layer>-image to <layer>-image-all
       images: Rename ptest images to rhyme with oe-core ptest images
       ptest-image: Switch to using core-image-minimal
       stressapptest: Upgrade to 1.0.11 release
       klibc: Upgrade to 2.0.13 release
       libnvme: Fix test builds on musl
       kernel-selftest: Build bpf tests again
       ptest-packagelists-meta-oe: Add kernel-selftest to x86/x86-64 images
       kernel-selftest: Copy the .config from kernel build
       kernel-selftest: Use clang options when clang is available
       libnet-idn-encode: Fix build with perl 2.38 and gcc13
       poco: Fix data race when create POSIX thread
       static-group: Match nogroup id to base-passwd from core.
       gutenprint: Upgrade to 5.3.4
       meta-perl: Add libtext-diff-perl to fast ptest list
       leveldb: Upgrade to 1.23 plus latest git
       meta-python: Add python3-rapidjson to PTESTS_FAST_META_PYTHON
       leveldb: Print uint64_t with PRI64
       network-manager-applet,networkmanager-openvpn, networkmanager: 
Apply linker versioning patch when using lld only
       emlog: Add PV

Lei Maohui (1):
       gexiv2: Fix do_package QA issue when usrmerge enabled.

Leon Anavi (1):
       sip: upgrade 6.7.11 -> 6.7.12

Luca Fancellu (5):
       linuxptp: update linuxptp recipe to 4.1
       linuxptp: install default configuration file in sysconfdir
       linuxptp: add systemd services
       linuxptp: Drop unneeded downstream patches
       linuxptp: Use templates for the systemd services

Marek Vasut (2):
       lvgl: lv-drivers: Allow empty package
       lvgl: Allow empty package

Markus Volk (15):
       pugixml: Update 1.13 -> 1.14
       pipewire: Upgrade 0.3.80 -> 0.3.81
       gnome-control-center: Fix polkit gettext issue
       libdecor: Upgrade 0.1.99 -> 0.2.0
       wireplumber: Upgrade 0.4.14 -> 0.4.15
       pipewire: Update 0.3.81 -> 0.3.83
       gnome-software: Update 45.0 -> 45.1
       gnome-calendar: Update 45.0 -> 45.1
       gnome-disk-utility: Update 44.0 -> 45.0
       gnome-control-center: Update 45.0 -> 45.1
       eog: Update 45.0 -> 45.1
       gnome-remote-desktop: Update 45.0 -> 45.1
       gnome-shell: Add missing dependency on pipewire
       gnome-shell: Remove deprecated libcroco dependency
       openbox: Drop deprecated libcroco dependency

Martin Jansa (5):
       opencv: Fix build with protobuf v22 and dnn enabled
       nodejs: update to latest v20 version 20.8.1
       nodejs: Revert io_uring support from bundled libuv-1.46.0
       opencv: refresh protobuf-v22 compatibility patch with backported 
version
       leveldb: prevent installing gtest

Martin Maurer (1):
       libqmi: Upgrade 1.32.4 -> 1.34.0

Matthias Klein (1):
       paho-mqtt-c: upgrade 1.3.12 -> 1.3.13

Mickael RAMILISON (1):
       python3-rapidjson: add ptest

Pawel Langowski (1):
       recipes-connectivity: Add tayga recipe

Peter Kjellerstedt (2):
       libwebsockets: Support building for native
       mosquitto: Support building for native again

Petr Gotthard (2):
       libmbim: upgrade 1.28.4 -> 1.30.0
       modemmanager: upgrade 1.20.6 -> 1.22.0

Philip-Dylan Gleonec (1):
       cukinia: Fix license field

Richard Purdie (4):
       meta-python: Drop broken BBCLASSEXTEND variants
       meta-oe: Drop broken BBCLASSEXTEND variants
       meta-networking: Drop broken BBCLASSEXTEND variants
       meta-perl: Drop broken BBCLASSEXTEND variants

Sam Van Den Berge (1):
       netdata: Upgrade 1.36.1 -> 1.43.0

Thomas Roos (1):
       python3-boto3, python3-botocore: remove recipes

Tim Orling (2):
       po4a: remove old recipe
       debsums: remove old recipe

Tom Hochstein (1):
       libcamera: Avoid build break in signature recalculation

Trevor Gamblin (5):
       python-git-pw: add from meta-patchtest
       python3-py-cpuinfo: disable broken ptests
       python3-arrow: add from meta-patchtest
       python3-pytest-mock: disable broken ptests
       meta-python: update ptests status for py-cpuinfo, pytest-mock

Wang Mingyu (84):
       dnf-plugin-tui: create symlinks from /usr/ to /.
       c-ares: upgrade 1.19.1 -> 1.20.1
       adw-gtk3: upgrade 4.9 -> 5.1
       ctags: upgrade 6.0.20230917.0 -> 6.0.20231001.0
       dialog: upgrade 1.3-20230209 -> 1.3-20231002
       freerdp: upgrade 2.11.1 -> 2.11.2
       gnome-backgrounds: upgrade 44.0 -> 45.0
       gnome-calculator: upgrade 45.0 -> 45.0.2
       gnome-font-viewer: upgrade 44.0 -> 45.0
       ipc-run: upgrade 20220807.0 -> 20231003.0
       libbytesize: upgrade 2.9 -> 2.10
       libcoap: upgrade 4.3.3 -> 4.3.4
       libyang: upgrade 2.1.111 -> 2.1.128
       lvgl: upgrade 8.3.9 -> 8.3.10
       metacity: upgrade 3.46.1 -> 3.50.0
       nautilus: upgrade 45.0 -> 45.1
       ceres-solver: upgrade 2.1.0 -> 2.2.0
       python3-eth-abi: upgrade 3.0.1 -> 4.2.1
       python3-mypy: upgrade 1.5.1 -> 1.6.1
       python3-pylint: upgrade 3.0.0 -> 3.0.1
       python3-aiodns: upgrade 3.0.0 -> 3.1.1
       python3-aiohttp: upgrade 3.8.5 -> 3.8.6
       python3-astroid: upgrade 3.0.0 -> 3.0.1
       python3-bitarray: upgrade 2.8.1 -> 2.8.2
       python3-bitstruct: upgrade 8.17.0 -> 8.18.0
       python3-blinker: upgrade 1.6.2 -> 1.6.3
       python3-charset-normalizer: upgrade 3.2.0 -> 3.3.0
       python3-cmake: upgrade 3.27.5 -> 3.27.7
       python3-coverage: upgrade 7.3.1 -> 7.3.2
       python3-croniter: upgrade 1.4.1 -> 2.0.1
       python3-dbus-fast: upgrade 1.85.0 -> 2.12.0
       python3-email-validator: upgrade 1.3.1 -> 2.0.0
       python3-engineio: upgrade 4.7.1 -> 4.8.0
       python3-eth-typing: upgrade 3.4.0 -> 3.5.0
       python3-eth-utils: upgrade 2.2.1 -> 2.2.2
       python3-executing: upgrade 1.2.0 -> 2.0.0
       python3-flask-babel: upgrade 3.1.0 -> 4.0.0
       python3-flask-jwt-extended: upgrade 4.5.2 -> 4.5.3
       python3-google-api-python-client: upgrade 2.101.0 -> 2.104.0
       python3-googleapis-common-protos: upgrade 1.60.0 -> 1.61.0
       python3-google-auth: upgrade 2.23.1 -> 2.23.3
       python3-h5py: upgrade 3.9.0 -> 3.10.0
       python3-huey: upgrade 2.4.5 -> 2.5.0
       python3-imageio: upgrade 2.31.3 -> 2.31.5
       python3-ipython: upgrade 8.15.0 -> 8.16.1
       python3-jedi: upgrade 0.19.0 -> 0.19.1
       python3-meson-python: upgrade 0.13.1 -> 0.14.0
       python3-msgpack: upgrade 1.0.6 -> 1.0.7
       python3-platformdirs: upgrade 3.10.0 -> 3.11.0
       python3-prompt-toolkit: upgrade 3.0.36 -> 3.0.39
       python3-protobuf: upgrade 4.24.3 -> 4.24.4
       python3-pycares: upgrade 4.3.0 -> 4.4.0
       python3-pycodestyle: upgrade 2.11.0 -> 2.11.1
       python3-pydantic: upgrade 2.4.1 -> 2.4.2
       python3-pyephem: upgrade 4.1.4 -> 4.1.5
       python3-pytest-timeout: upgrade 2.1.0 -> 2.2.0
       python3-rapidjson: upgrade 1.11 -> 1.12
       python3-regex: upgrade 2023.8.8 -> 2023.10.3
       python3-rich: upgrade 13.5.3 -> 13.6.0
       python3-schedule: upgrade 1.2.0 -> 1.2.1
       python3-semver: upgrade 3.0.1 -> 3.0.2
       python3-simplejson: upgrade 3.19.1 -> 3.19.2
       python3-socketio: upgrade 5.9.0 -> 5.10.0
       python3-sqlalchemy: upgrade 2.0.21 -> 2.0.22
       python3-stack-data: upgrade 0.6.2 -> 0.6.3
       python3-texttable: upgrade 1.6.7 -> 1.7.0
       python3-traitlets: upgrade 5.10.1 -> 5.11.2
       python3-types-psutil: upgrade 5.9.5.16 -> 5.9.5.17
       python3-tzlocal: upgrade 5.0.1 -> 5.1
       python3-web3: upgrade 6.10.0 -> 6.11.1
       python3-websocket-client: upgrade 1.6.3 -> 1.6.4
       python3-xlsxwriter: upgrade 3.1.3 -> 3.1.8
       python3-xxhash: upgrade 3.3.0 -> 3.4.1
       python3-zeroconf: upgrade 0.112.0 -> 0.119.0
       python3-zopeinterface: upgrade 6.0 -> 6.1
       rdma-core: upgrade 47.0 -> 48.0
       redis: upgrade 7.2.1 -> 7.2.2
       remmina: upgrade 1.4.32 -> 1.4.33
       tesseract: upgrade 5.3.2 -> 5.3.3
       thingsboard-gateway: upgrade 3.3 -> 3.4.1
       tio: upgrade 2.6 -> 2.7
       wireshark: upgrade 4.0.8 -> 4.0.10
       xterm: upgrade 384 -> 387
       zchunk: upgrade 1.3.1 -> 1.3.2

Yi Zhao (6):
       samba: upgrade 4.18.6 -> 4.18.8
       samba: use external cmocka instead of bundled cmocka
       libtevent: fix ptest
       libldb: add ptest
       conntrack-tools: upgrade 1.4.7 -> 1.4.8
       nftables: upgrade 1.0.8 -> 1.0.9

  meta-filesystems/conf/layer.conf |    2 +-
  meta-filesystems/files/static-passwd-meta-filesystems |    3 +
  ...{meta-filesystems-image.bb => meta-filesystems-image-all.bb} |    2 +-
  .../recipes-filesystems/images/meta-filesystems-image-base.bb |    7 -
  .../exfatprogs/{exfatprogs_1.2.1.bb => exfatprogs_1.2.2.bb} |    2 +-
  ...nome-remote-desktop_45.0.bb => gnome-remote-desktop_45.1.bb} |    2 +-
  meta-gnome/files/static-passwd-meta-gnome |    1 +
  ...h => 0001-linker-scripts-Do-not-export-_IO_stdin_used.patch} |    0
  .../network-manager-applet/network-manager-applet_1.32.0.bb |    2 +-
  meta-gnome/recipes-gnome/eog/{eog_45.0.bb => eog_45.1.bb} |    2 +-
  meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb |    8 +
  .../{gnome-backgrounds_44.0.bb => gnome-backgrounds_45.0.bb} |    2 +-
  .../{gnome-calculator_45.0.bb => gnome-calculator_45.0.2.bb} |    2 +-
  .../{gnome-calendar_45.0.bb => gnome-calendar_45.1.bb} |    2 +-
  ...nome-control-center_45.0.bb => gnome-control-center_45.1.bb} |    4 +-
  .../{gnome-disk-utility_44.0.bb => gnome-disk-utility_45.0.bb} |    2 +-
  .../{gnome-font-viewer_44.0.bb => gnome-font-viewer_45.0.bb} |    2 +-
  meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb |    5 +-
  .../{gnome-software_45.0.bb => gnome-software_45.1.bb} |    2 +-
  .../metacity/{metacity_3.46.1.bb => metacity_3.50.0.bb} |    2 +-
  .../nautilus/{nautilus_45.0.bb => nautilus_45.1.bb} |    2 +-
  ...1-fcntl-Fix-build-failure-for-some-architectures-with-.patch | 34 -
  .../files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch |    6 +-
  .../recipes-devtools/klibc/files/armv4-fix-v4bx.patch |    4 +-
  .../klibc/{klcc-cross_2.0.10.bb => klcc-cross_2.0.13.bb} |    0
  ...libc-static-utils_2.0.10.bb => klibc-static-utils_2.0.13.bb} |    0
  .../klibc/{klibc-utils_2.0.10.bb => klibc-utils_2.0.13.bb} |    0
  meta-initramfs/recipes-devtools/klibc/klibc.inc |    4 +-
  .../recipes-devtools/klibc/{klibc_2.0.10.bb => klibc_2.0.13.bb} |    0
  meta-multimedia/files/static-group-meta-multimedia |    2 +
  meta-multimedia/files/static-passwd-meta-multimedia |    2 +
  .../{meta-multimedia-image.bb => meta-multimedia-image-all.bb} |    2 +-
  .../recipes-multimedia/images/meta-multimedia-image-base.bb |    7 -
  .../recipes-multimedia/images/multimedia-libcamera-image.bb |    2 +-
  meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb |    7 +-
  .../pipewire/{pipewire_0.3.80.bb => pipewire_0.3.83.bb} |    2 +-
  .../{wireplumber_0.4.14.bb => wireplumber_0.4.15.bb} |    4 +-
  meta-networking/files/static-group-meta-networking              | 14 +
  meta-networking/files/static-passwd-meta-networking             | 19 +
  ...1-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch | 87 +
  ...1-aesce-do-not-specify-an-arch-version-when-enabling-c.patch | 33 -
  ...2-aesce-use-correct-target-attribute-when-building-wit.patch | 34 -
  .../mbedtls/{mbedtls_3.4.1.bb => mbedtls_3.5.0.bb} |    5 +-
  .../recipes-connectivity/mosquitto/mosquitto_2.0.18.bb |    2 +-
  ...h => 0001-linker-scripts-Do-not-export-_IO_stdin_used.patch} |    0
  .../networkmanager/networkmanager-openvpn_1.10.2.bb |    2 +-
  .../networkmanager/networkmanager_1.44.0.bb |    2 +-
  .../recipes-connectivity/samba/samba/cmocka-uintptr_t.patch     | 51 -
  .../samba/{samba_4.18.6.bb => samba_4.18.8.bb} |    9 +-
  .../recipes-connectivity/tayga/files/0001-include-sys-uio.patch | 18 +
  meta-networking/recipes-connectivity/tayga/files/tayga.conf     | 103 +
  meta-networking/recipes-connectivity/tayga/files/tayga.service  | 12 +
  meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb       | 21 +
  .../{meta-networking-image.bb => meta-networking-image-all.bb} |    2 +-
  .../recipes-core/images/meta-networking-image-base.bb |    7 -
  .../libcoap/{libcoap_4.3.3.bb => libcoap_4.3.4.bb} |    2 +-
  .../{conntrack-tools_1.4.7.bb => conntrack-tools_1.4.8.bb} |    4 +-
  .../nftables/{nftables_1.0.8.bb => nftables_1.0.9.bb} |    5 +-
  .../open62541/0001-fix-build-do-not-install-git-files.patch |    2 +-
  meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb  | 15 +
  .../libldb/cmocka-fix-musl-libc-conflicting-types-error.patch   | 45 -
  meta-networking/recipes-support/libldb/libldb/run-ptest         | 17 +
  meta-networking/recipes-support/libldb/libldb_2.7.2.bb          | 14 +-
  meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb      | 15 +
  .../cmocka-fix-musl-libc-conflicting-types-error.patch          | 45 -
  meta-networking/recipes-support/libtevent/libtevent/run-ptest   | 17 +
  meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb   | 20 +-
  meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.0.bb |    2 +-
  .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb |    2 +-
  .../rdma-core/{rdma-core_47.0.bb => rdma-core_48.0.bb} |    2 +-
  .../wireshark/{wireshark_4.0.8.bb => wireshark_4.0.10.bb} |    2 +-
  meta-oe/classes/signing.bbclass                                 | 12 +-
  meta-oe/conf/include/ptest-packagelists-meta-oe.inc |    6 +-
  ...{thingsboard-gateway_3.3.bb => thingsboard-gateway_3.4.1.bb} |    2 +-
  .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend |    2 +-
  .../perl-layer/recipes-support/debsums/debsums_2.2.2.bb         | 56 -
  meta-oe/files/static-group-meta-oe |    8 +
  meta-oe/files/static-passwd-meta-oe                             | 11 +
  .../stressapptest/0001-configure-Add-with-cpu.patch             | 37 -
  .../0002-Replace-lfs64-functions-and-defines.patch              | 103 -
  ...3-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch | 43 -
  .../stressapptest/stressapptest/libcplusplus-compat.patch       | 28 -
  .../stressapptest/stressapptest/read_sysfs_for_cachesize.patch  | 72 -
  .../{stressapptest_1.0.9.bb => stressapptest_1.0.11.bb} |   12 +-
  meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb |    2 +-
  .../recipes-bsp/nvme-cli/{nvme-cli_2.5.bb => nvme-cli_2.6.bb} |    2 +-
  .../libmbim/{libmbim_1.28.4.bb => libmbim_1.30.0.bb} |    4 +-
  ...1-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch | 33 -
  .../libnet/{libnet_1.2.bb => libnet_1.3.bb} |    5 +-
  .../libqmi/{libqmi_1.32.4.bb => libqmi_1.34.0.bb} |    4 +-
  .../recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb |    3 +
  .../linuxptp/linuxptp/0001-include-string.h-for-strncpy.patch |    8 +-
  ...1-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch | 42 -
  .../linuxptp/linuxptp/0002-linuxptp-Use-CC-in-incdefs.sh.patch  | 34 +
  .../linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch            | 26 -
  .../linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch    | 37 -
  .../linuxptp/linuxptp/systemd/phc2sys@.service.in               | 13 +
  .../linuxptp/linuxptp/systemd/ptp4l@.service.in                 | 11 +
  meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb         | 33 -
  meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb           | 62 +
  .../{modemmanager_1.20.6.bb => modemmanager_1.22.0.bb} |    4 +-
  .../{paho-mqtt-c_1.3.12.bb => paho-mqtt-c_1.3.13.bb} |    2 +-
  meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb | 21 +
  meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb |    2 -
  meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb |    2 -
  meta-oe/recipes-core/emlog/emlog.inc |    2 +-
  .../images/{meta-oe-image.bb => meta-oe-image-all.bb} |    2 +-
  meta-oe/recipes-core/images/meta-oe-image-base.bb |    7 -
  .../{meta-oe-ptest-all-image.bb => meta-oe-image-ptest-all.bb} |    4 +-
  ...{meta-oe-ptest-fast-image.bb => meta-oe-image-ptest-fast.bb} |    2 +-
  .../images/{meta-oe-ptest-image.bb => meta-oe-image-ptest.bb} |    3 +-
  .../recipes-core/uutils-coreutils/uutils-coreutils-crates.inc   | 162 +-
  .../{uutils-coreutils_0.0.21.bb => uutils-coreutils_0.0.22.bb} |    2 +-
  .../0001-CMakeLists.txt-fix-googletest-related-options.patch    | 55 +
  .../leveldb/0001-Fix-printing-64-bit-integer-types.patch        | 43 +
  .../recipes-dbs/leveldb/{leveldb_1.22.bb => leveldb_1.23.bb} |   10 +-
  meta-oe/recipes-devtools/cjson/cjson/run-ptest |    8 +
  meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb                  | 24 +-
  .../ctags/{ctags_6.0.20230917.0.bb => ctags_6.0.20231001.0.bb} |    2 +-
  meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb |    4 +-
  meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb |    2 +-
  .../nodejs/0001-Revert-io_uring-changes-from-libuv-1.46.0.patch | 3414 
+++++++++++++++++++++++++++
  .../nodejs/0002-Revert-io_uring-changes-from-libuv-1.45.0.patch | 1803 
++++++++++++++
  .../nodejs/{nodejs_20.5.1.bb => nodejs_20.8.1.bb} |    6 +-
  .../perl/{ipc-run_20220807.0.bb => ipc-run_20231003.0.bb} |    2 +-
  meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb |    3 -
  .../pugixml/{pugixml_1.13.bb => pugixml_1.14.bb} |    4 +-
  meta-oe/recipes-devtools/sip/{sip_6.7.11.bb => sip_6.7.12.bb} |    2 +-
  meta-oe/recipes-extended/collectd/collectd_5.12.0.bb |    3 +-
  .../dialog/{dialog_1.3-20230209.bb => dialog_1.3-20231002.bb} |    2 +-
  meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch        | 80 +
  meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb       | 26 +-
  meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb |    9 +-
  .../0001-fix-pythondir-for-multilib-when-cross-compiling.patch  | 32 +
  meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb |    3 +-
  .../libyang/{libyang_2.1.111.bb => libyang_2.1.128.bb} |    2 +-
  .../ostree/{ostree_2023.5.bb => ostree_2023.7.bb} |   13 +-
  .../0001-src-Do-not-reset-FINAL_LIBS.patch |    0
  .../0006-Define-correct-gregs-for-RISCV32.patch |    0
  .../redis/{redis-7.2.1 => redis-7.2.2}/GNU_SOURCE-7.patch |    0
  .../hiredis-use-default-CC-if-it-is-set.patch |    0
  .../redis/{redis-7.2.1 => redis-7.2.2}/init-redis-server |    0
  .../lua-update-Makefile-to-use-environment-build-setting.patch |    0
  .../redis/{redis-7.2.1 => redis-7.2.2}/oe-use-libc-malloc.patch |    0
  .../redis/{redis-7.2.1 => redis-7.2.2}/redis.conf |    0
  .../redis/{redis-7.2.1 => redis-7.2.2}/redis.service |    0
  .../recipes-extended/redis/{redis_7.2.1.bb => redis_7.2.2.bb} |    2 +-
  .../gnome-themes/{adw-gtk3_4.9.bb => adw-gtk3_5.1.bb} |    2 +-
  ...1-Autotools-fix-do-not-put-prefix-based-paths-in-compi.patch | 58 +
  meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb |    1 +
  .../libdecor/{libdecor_0.1.99.bb => libdecor_0.2.0.bb} |    2 +-
  meta-oe/recipes-graphics/lvgl/lv-drivers.inc |    2 +
  meta-oe/recipes-graphics/lvgl/{lvgl_8.3.9.bb => lvgl_8.3.10.bb} |    4 +-
  meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb |    2 +-
  meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb |    2 +-
  .../tesseract/{tesseract_5.3.2.bb => tesseract_5.3.3.bb} |    2 +-
  meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb |    2 -
  meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb |    1 -
  .../recipes-graphics/xorg-app/{xterm_384.bb => xterm_387.bb} |    2 +-
  meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb       | 38 +-
  .../recipes-kernel/kernel-selftest/kernel-selftest/run-ptest    | 10 +-
  meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb |    2 +-
  meta-oe/recipes-kernel/minicoredumper/files/run-ptest |    4 +-
  meta-oe/recipes-multimedia/jack/jack_1.19.22.bb |    1 -
  .../webm/{libvpx_1.13.0.bb => libvpx_1.13.1.bb} |    2 +-
  .../recipes-navigation/proj/{proj_9.1.1.bb => proj_9.3.0.bb} |    2 +-
  meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb |    2 -
  .../gutenprint/{gutenprint_git.bb => gutenprint_5.3.4.bb} |   21 +-
  .../c-ares/{c-ares_1.19.1.bb => c-ares_1.20.1.bb} |    4 +-
  .../{ceres-solver_2.1.0.bb => ceres-solver_2.2.0.bb} |    4 +-
  meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb |    2 +-
  meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb |    1 +
  meta-oe/recipes-support/edid-decode/edid-decode_git.bb |    2 +-
  .../freerdp/{freerdp_2.11.1.bb => freerdp_2.11.2.bb} |    2 +-
  .../libbytesize/{libbytesize_2.9.bb => libbytesize_2.10.bb} |    4 +-
  meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb |    2 +-
  .../libnvme/0001-test-handle-POSIX-ioctl-prototype.patch        | 68 +
  .../recipes-support/libnvme/{libnvme_1.5.bb => libnvme_1.6.bb} |    6 +-
  .../opencv/opencv/fix-build-with-protobuf-v22.patch             | 203 ++
  meta-oe/recipes-support/opencv/opencv_4.8.0.bb |    3 +-
  .../poco/poco/0001-Fix-data-race-when-create-POSIX-thread.patch | 33 +
  meta-oe/recipes-support/poco/poco_1.12.4.bb |    1 +
  meta-oe/recipes-support/re2/re2/run-ptest |    3 +
  meta-oe/recipes-support/re2/re2_2023.03.01.bb                   | 16 +-
  .../remmina/{remmina_1.4.32.bb => remmina_1.4.33.bb} |    2 +-
  meta-oe/recipes-support/tio/{tio_2.6.bb => tio_2.7.bb} |    2 +-
  .../vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch   | 50 -
  .../{vboxguestdrivers_7.0.10.bb => vboxguestdrivers_7.0.12.bb} |    3 +-
  .../recipes-support/zchunk/{zchunk_1.3.1.bb => zchunk_1.3.2.bb} |    2 +-
  meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb |    2 +-
  meta-perl/conf/include/ptest-packagelists-meta-perl.inc |    1 +
  meta-perl/files/static-group-meta-perl |    1 +
  meta-perl/files/static-passwd-meta-perl |    1 +
  meta-perl/recipes-core/images/meta-perl-base.bb |    7 -
  .../images/{meta-perl-image.bb => meta-perl-image-all.bb} |    2 +-
  ...eta-perl-ptest-all-image.bb => meta-perl-image-ptest-all.bb} |    4 +-
  ...a-perl-ptest-fast-image.bb => meta-perl-image-ptest-fast.bb} |    2 +-
  .../{meta-perl-ptest-image.bb => meta-perl-image-ptest.bb} |    3 +-
  meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb |    1 -
  .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb |    2 +-
  meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb |    2 -
  meta-perl/recipes-perl/libnet/libnet-dns-perl_1.40.bb |    1 -
  ...use_uvchr_to_utf8_flags_instead_of_uvuni_to_utf8_flags.patch | 36 +
  meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb |    6 +-
  meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb |    2 -
  meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb |    1 -
  meta-perl/recipes-perl/libtext/libtext-diff-perl/run-ptest      | 19 +
  meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb        | 11 +-
  meta-perl/recipes-perl/po4a/po4a_0.49.bb                        | 33 -
  meta-python/conf/include/ptest-packagelists-meta-python.inc |    5 +-
  .../recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb |    2 +-
  .../images/{meta-python-image.bb => meta-python-image-all.bb} |    2 +-
  meta-python/recipes-core/images/meta-python-image-base.bb |    7 -
  ...python-ptest-all-image.bb => meta-python-image-ptest-all.bb} |    4 +-
  ...thon-ptest-fast-image.bb => meta-python-image-ptest-fast.bb} |    2 +-
  .../{meta-python-ptest-image.bb => meta-python-image-ptest.bb} |    3 +-
  .../python/{python3-aiodns_3.0.0.bb => python3-aiodns_3.1.1.bb} |    3 +-
  .../recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb |    2 -
  .../{python3-aiohttp_3.8.5.bb => python3-aiohttp_3.8.6.bb} |    2 +-
  meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb      | 13 +
  .../{python3-astroid_3.0.0.bb => python3-astroid_3.0.1.bb} |    4 +-
  meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb |    2 -
  meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb |    2 -
  .../{python3-bitarray_2.8.1.bb => python3-bitarray_2.8.2.bb} |    2 +-
  ...{python3-bitstruct_8.17.0.bb => python3-bitstruct_8.18.0.bb} |    2 +-
  .../{python3-blinker_1.6.2.bb => python3-blinker_1.6.3.bb} |    2 +-
  meta-python/recipes-devtools/python/python3-boto3_1.28.57.bb    | 16 -
  meta-python/recipes-devtools/python/python3-botocore_1.31.57.bb | 10 -
  meta-python/recipes-devtools/python/python3-can_4.2.2.bb |    2 -
  ...-normalizer_3.2.0.bb => python3-charset-normalizer_3.3.0.bb} |    2 +-
  .../python/{python3-cmake_3.27.5.bb => python3-cmake_3.27.7.bb} |    2 +-
  .../recipes-devtools/python/python3-covdefaults_2.3.0.bb |    2 -
  .../{python3-coverage_7.3.1.bb => python3-coverage_7.3.2.bb} |    2 +-
  .../{python3-croniter_1.4.1.bb => python3-croniter_2.0.1.bb} |    2 +-
  ...{python3-dbus-fast_1.85.0.bb => python3-dbus-fast_2.12.0.bb} |    2 +-
  meta-python/recipes-devtools/python/python3-dill_0.3.7.bb |    2 +
  ...mail-validator_1.3.1.bb => python3-email-validator_2.0.0.bb} |    2 +-
  .../{python3-engineio_4.7.1.bb => python3-engineio_4.8.0.bb} |    2 +-
  .../{python3-eth-abi_3.0.1.bb => python3-eth-abi_4.2.1.bb} |    4 +-
  ...{python3-eth-typing_3.4.0.bb => python3-eth-typing_3.5.0.bb} |    2 +-
  .../{python3-eth-utils_2.2.1.bb => python3-eth-utils_2.2.2.bb} |    2 +-
  .../{python3-executing_1.2.0.bb => python3-executing_2.0.0.bb} |    2 +-
  ...ython3-flask-babel_3.1.0.bb => python3-flask-babel_4.0.0.bb} |    2 +-
  ...wt-extended_4.5.2.bb => python3-flask-jwt-extended_4.5.3.bb} |    2 +-
  meta-python/recipes-devtools/python/python3-git-pw_2.5.0.bb     | 20 +
  ...t_2.101.0.bb => python3-google-api-python-client_2.104.0.bb} |    2 +-
  ...hon3-google-auth_2.23.1.bb => python3-google-auth_2.23.3.bb} |    2 +-
  ...tos_1.60.0.bb => python3-googleapis-common-protos_1.61.0.bb} |    2 +-
  .../python/{python3-h5py_3.9.0.bb => python3-h5py_3.10.0.bb} |    2 +-
  .../python/{python3-huey_2.4.5.bb => python3-huey_2.5.0.bb} |    2 +-
  .../{python3-imageio_2.31.3.bb => python3-imageio_2.31.5.bb} |    2 +-
  .../{python3-ipython_8.15.0.bb => python3-ipython_8.16.1.bb} |    2 +-
  .../python/{python3-jedi_0.19.0.bb => python3-jedi_0.19.1.bb} |    2 +-
  meta-python/recipes-devtools/python/python3-lz4/run-ptest |    2 +-
  meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb |    1 +
  meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb |    2 +
  ...n3-meson-python_0.13.1.bb => python3-meson-python_0.14.0.bb} |    2 +-
  .../{python3-msgpack_1.0.6.bb => python3-msgpack_1.0.7.bb} |    2 +-
  .../python/{python3-mypy_1.5.1.bb => python3-mypy_1.6.1.bb} |    4 +-
  meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb |    1 -
  ...n3-platformdirs_3.10.0.bb => python3-platformdirs_3.11.0.bb} |    2 +-
  ...rompt-toolkit_3.0.36.bb => python3-prompt-toolkit_3.0.39.bb} |    2 +-
  .../{python3-protobuf_4.24.3.bb => python3-protobuf_4.24.4.bb} |    2 +-
  .../python/python3-py-cpuinfo/0001-test_cli.py-disable.patch    | 32 +
  meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb |    8 +
  .../{python3-pycares_4.3.0.bb => python3-pycares_4.4.0.bb} |    2 +-
  ...hon3-pycodestyle_2.11.0.bb => python3-pycodestyle_2.11.1.bb} |    2 +-
  .../{python3-pydantic_2.4.1.bb => python3-pydantic_2.4.2.bb} |    2 +-
  .../python3-pylint/0001-pylint-remove-plugin-pickle-test.patch  | 53 -
  .../0001-pyproject.toml-Remove-hard-coded-dependencies.patch    | 26 -
  .../{python3-pylint_2.17.4.bb => python3-pylint_3.0.1.bb} |    7 +-
  meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb |    4 +
  meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb |    1 +
  .../0001-test_pytest_mock-skip-args-introspection-tests.patch   | 38 +
  .../recipes-devtools/python/python3-pytest-mock_3.11.1.bb |    2 +
  ...-pytest-timeout_2.1.0.bb => python3-pytest-timeout_2.2.0.bb} |    2 +-
  meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb |    2 -
  meta-python/recipes-devtools/python/python3-rapidjson/run-ptest |    3 +
  meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb   | 22 -
  meta-python/recipes-devtools/python/python3-rapidjson_1.12.bb   | 41 +
  .../{python3-regex_2023.8.8.bb => python3-regex_2023.10.3.bb} |    2 +-
  .../python/python3-robotframework-seriallibrary_0.4.3.bb |    2 -
  .../{python3-schedule_1.2.0.bb => python3-schedule_1.2.1.bb} |    2 +-
  .../python/{python3-semver_3.0.1.bb => python3-semver_3.0.2.bb} |    3 +-
  ...ython3-simplejson_3.19.1.bb => python3-simplejson_3.19.2.bb} |    2 +-
  meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb |    2 -
  .../{python3-socketio_5.9.0.bb => python3-socketio_5.10.0.bb} |    2 +-
  ...ython3-sqlalchemy_2.0.21.bb => python3-sqlalchemy_2.0.22.bb} |    2 +-
  ...{python3-stack-data_0.6.2.bb => python3-stack-data_0.6.3.bb} |    2 +-
  .../{python3-texttable_1.6.7.bb => python3-texttable_1.7.0.bb} |    2 +-
  meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb |    2 +
  ...{python3-traitlets_5.10.1.bb => python3-traitlets_5.11.2.bb} |    2 +-
  meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb |    2 -
  ...ypes-psutil_5.9.5.16.bb => python3-types-psutil_5.9.5.17.bb} |    2 +-
  .../python/{python3-tzlocal_5.0.1.bb => python3-tzlocal_5.1.bb} |    2 +-
  .../python/{python3-web3_6.10.0.bb => python3-web3_6.11.1.bb} |    2 +-
  ...socket-client_1.6.3.bb => python3-websocket-client_1.6.4.bb} |    2 +-
  ...{python3-xlsxwriter_3.1.3.bb => python3-xlsxwriter_3.1.8.bb} |    2 +-
  .../python/{python3-xxhash_3.3.0.bb => python3-xxhash_3.4.1.bb} |    2 +-
  ...{python3-zeroconf_0.112.0.bb => python3-zeroconf_0.119.0.bb} |    2 +-
  ...ython3-zopeinterface_6.0.bb => python3-zopeinterface_6.1.bb} |    2 +-
  .../{python3-pyephem_4.1.4.bb => python3-pyephem_4.1.5.bb} |    2 +-
  .../{python3-rich_13.5.3.bb => python3-rich_13.6.0.bb} |    2 +-
  meta-python/recipes-extended/pywbem/python3-pywbem_1.6.2.bb |    2 -
  meta-webserver/files/static-passwd-meta-webserver |    2 +
  .../{meta-webserver-image.bb => meta-webserver-image-all.bb} |    2 +-
  meta-webserver/recipes-core/images/meta-webserver-image-base.bb |    7 -
  .../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch | 39 +
  meta-webserver/recipes-httpd/nginx/nginx.inc |    3 +
  .../netdata/{netdata_1.36.1.bb => netdata_1.43.0.bb} |   12 +-
  310 files changed, 7030 insertions(+), 1460 deletions(-)
  create mode 100644 meta-filesystems/files/static-passwd-meta-filesystems
  rename 
meta-filesystems/recipes-filesystems/images/{meta-filesystems-image.bb 
=> meta-filesystems-image-all.bb} (51%)
  delete mode 100644 
meta-filesystems/recipes-filesystems/images/meta-filesystems-image-base.bb
  rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.2.1.bb 
=> exfatprogs_1.2.2.bb} (91%)
  rename 
meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-remote-desktop/{gnome-remote-desktop_45.0.bb 
=> gnome-remote-desktop_45.1.bb} (91%)
  create mode 100644 meta-gnome/files/static-passwd-meta-gnome
  rename 
meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/{0001-linker-script-Do-not-export-_IO_stdin_used.patch 
=> 0001-linker-scripts-Do-not-export-_IO_stdin_used.patch} (100%)
  rename meta-gnome/recipes-gnome/eog/{eog_45.0.bb => eog_45.1.bb} (88%)
  rename 
meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_44.0.bb => 
gnome-backgrounds_45.0.bb} (76%)
  rename 
meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_45.0.bb => 
gnome-calculator_45.0.2.bb} (88%)
  rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_45.0.bb 
=> gnome-calendar_45.1.bb} (89%)
  rename 
meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_45.0.bb 
=> gnome-control-center_45.1.bb} (92%)
  rename 
meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_44.0.bb 
=> gnome-disk-utility_45.0.bb} (91%)
  rename 
meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_44.0.bb => 
gnome-font-viewer_45.0.bb} (82%)
  rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_45.0.bb 
=> gnome-software_45.1.bb} (93%)
  rename meta-gnome/recipes-gnome/metacity/{metacity_3.46.1.bb => 
metacity_3.50.0.bb} (91%)
  rename meta-gnome/recipes-gnome/nautilus/{nautilus_45.0.bb => 
nautilus_45.1.bb} (93%)
  delete mode 100644 
meta-initramfs/recipes-devtools/klibc/files/0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch
  rename meta-initramfs/recipes-devtools/klibc/{klcc-cross_2.0.10.bb => 
klcc-cross_2.0.13.bb} (100%)
  rename 
meta-initramfs/recipes-devtools/klibc/{klibc-static-utils_2.0.10.bb => 
klibc-static-utils_2.0.13.bb} (100%)
  rename meta-initramfs/recipes-devtools/klibc/{klibc-utils_2.0.10.bb => 
klibc-utils_2.0.13.bb} (100%)
  rename meta-initramfs/recipes-devtools/klibc/{klibc_2.0.10.bb => 
klibc_2.0.13.bb} (100%)
  create mode 100644 meta-multimedia/files/static-group-meta-multimedia
  create mode 100644 meta-multimedia/files/static-passwd-meta-multimedia
  rename 
meta-multimedia/recipes-multimedia/images/{meta-multimedia-image.bb => 
meta-multimedia-image-all.bb} (51%)
  delete mode 100644 
meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.80.bb 
=> pipewire_0.3.83.bb} (99%)
  rename 
meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.4.14.bb => 
wireplumber_0.4.15.bb} (98%)
  create mode 100644 meta-networking/files/static-group-meta-networking
  create mode 100644 meta-networking/files/static-passwd-meta-networking
  create mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
  delete mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
  delete mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.1.bb 
=> mbedtls_3.5.0.bb} (93%)
  rename 
meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/{0001-linker-script-Do-not-export-_IO_stdin_used.patch 
=> 0001-linker-scripts-Do-not-export-_IO_stdin_used.patch} (100%)
  delete mode 100644 
meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
  rename meta-networking/recipes-connectivity/samba/{samba_4.18.6.bb => 
samba_4.18.8.bb} (97%)
  create mode 100644 
meta-networking/recipes-connectivity/tayga/files/0001-include-sys-uio.patch
  create mode 100644 
meta-networking/recipes-connectivity/tayga/files/tayga.conf
  create mode 100644 
meta-networking/recipes-connectivity/tayga/files/tayga.service
  create mode 100644 
meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
  rename meta-networking/recipes-core/images/{meta-networking-image.bb 
=> meta-networking-image-all.bb} (51%)
  delete mode 100644 
meta-networking/recipes-core/images/meta-networking-image-base.bb
  rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.3.bb => 
libcoap_4.3.4.bb} (97%)
  rename 
meta-networking/recipes-filter/conntrack-tools/{conntrack-tools_1.4.7.bb 
=> conntrack-tools_1.4.8.bb} (95%)
  rename meta-networking/recipes-filter/nftables/{nftables_1.0.8.bb => 
nftables_1.0.9.bb} (93%)
  create mode 100644 
meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb
  delete mode 100644 
meta-networking/recipes-support/libldb/libldb/cmocka-fix-musl-libc-conflicting-types-error.patch
  create mode 100644 meta-networking/recipes-support/libldb/libldb/run-ptest
  create mode 100644 
meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb
  delete mode 100644 
meta-networking/recipes-support/libtevent/libtevent/cmocka-fix-musl-libc-conflicting-types-error.patch
  create mode 100644 
meta-networking/recipes-support/libtevent/libtevent/run-ptest
  rename meta-networking/recipes-support/rdma-core/{rdma-core_47.0.bb => 
rdma-core_48.0.bb} (96%)
  rename meta-networking/recipes-support/wireshark/{wireshark_4.0.8.bb 
=> wireshark_4.0.10.bb} (97%)
  rename 
meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.3.bb 
=> thingsboard-gateway_3.4.1.bb} (95%)
  delete mode 100644 
meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/debsums_2.2.2.bb
  create mode 100644 meta-oe/files/static-group-meta-oe
  create mode 100644 meta-oe/files/static-passwd-meta-oe
  delete mode 100644 
meta-oe/recipes-benchmark/stressapptest/stressapptest/0001-configure-Add-with-cpu.patch
  delete mode 100644 
meta-oe/recipes-benchmark/stressapptest/stressapptest/0002-Replace-lfs64-functions-and-defines.patch
  delete mode 100644 
meta-oe/recipes-benchmark/stressapptest/stressapptest/0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch
  delete mode 100644 
meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch
  delete mode 100644 
meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch
  rename meta-oe/recipes-benchmark/stressapptest/{stressapptest_1.0.9.bb 
=> stressapptest_1.0.11.bb} (66%)
  rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.5.bb => 
nvme-cli_2.6.bb} (95%)
  rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.28.4.bb => 
libmbim_1.30.0.bb} (89%)
  delete mode 100644 
meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
  rename meta-oe/recipes-connectivity/libnet/{libnet_1.2.bb => 
libnet_1.3.bb} (78%)
  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.32.4.bb => 
libqmi_1.34.0.bb} (91%)
  delete mode 100644 
meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch
  create mode 100644 
meta-oe/recipes-connectivity/linuxptp/linuxptp/0002-linuxptp-Use-CC-in-incdefs.sh.patch
  delete mode 100644 
meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
  delete mode 100644 
meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
  create mode 100644 
meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.service.in
  create mode 100644 
meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.service.in
  delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
  create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
  rename 
meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.20.6.bb => 
modemmanager_1.22.0.bb} (95%)
  rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.12.bb 
=> paho-mqtt-c_1.3.13.bb} (95%)
  create mode 100644 
meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
  rename meta-oe/recipes-core/images/{meta-oe-image.bb => 
meta-oe-image-all.bb} (62%)
  delete mode 100644 meta-oe/recipes-core/images/meta-oe-image-base.bb
  rename meta-oe/recipes-core/images/{meta-oe-ptest-all-image.bb => 
meta-oe-image-ptest-all.bb} (84%)
  rename meta-oe/recipes-core/images/{meta-oe-ptest-fast-image.bb => 
meta-oe-image-ptest-fast.bb} (77%)
  rename meta-oe/recipes-core/images/{meta-oe-ptest-image.bb => 
meta-oe-image-ptest.bb} (96%)
  rename 
meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.0.21.bb => 
uutils-coreutils_0.0.22.bb} (92%)
  create mode 100644 
meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googletest-related-options.patch
  create mode 100644 
meta-oe/recipes-dbs/leveldb/leveldb/0001-Fix-printing-64-bit-integer-types.patch
  rename meta-oe/recipes-dbs/leveldb/{leveldb_1.22.bb => 
leveldb_1.23.bb} (79%)
  create mode 100644 meta-oe/recipes-devtools/cjson/cjson/run-ptest
  rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230917.0.bb => 
ctags_6.0.20231001.0.bb} (95%)
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-io_uring-changes-from-libuv-1.46.0.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0002-Revert-io_uring-changes-from-libuv-1.45.0.patch
  rename meta-oe/recipes-devtools/nodejs/{nodejs_20.5.1.bb => 
nodejs_20.8.1.bb} (95%)
  rename meta-oe/recipes-devtools/perl/{ipc-run_20220807.0.bb => 
ipc-run_20231003.0.bb} (93%)
  rename meta-oe/recipes-devtools/pugixml/{pugixml_1.13.bb => 
pugixml_1.14.bb} (86%)
  rename meta-oe/recipes-devtools/sip/{sip_6.7.11.bb => sip_6.7.12.bb} (83%)
  rename meta-oe/recipes-extended/dialog/{dialog_1.3-20230209.bb => 
dialog_1.3-20231002.bb} (92%)
  create mode 100644 
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
  create mode 100644 
meta-oe/recipes-extended/libblockdev/files/0001-fix-pythondir-for-multilib-when-cross-compiling.patch
  rename meta-oe/recipes-extended/libyang/{libyang_2.1.111.bb => 
libyang_2.1.128.bb} (96%)
  rename meta-oe/recipes-extended/ostree/{ostree_2023.5.bb => 
ostree_2023.7.bb} (93%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.1 => 
redis-7.2.2}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.1 => 
redis-7.2.2}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.1 => 
redis-7.2.2}/GNU_SOURCE-7.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.1 => 
redis-7.2.2}/hiredis-use-default-CC-if-it-is-set.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.1 => 
redis-7.2.2}/init-redis-server (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.1 => 
redis-7.2.2}/lua-update-Makefile-to-use-environment-build-setting.patch 
(100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.1 => 
redis-7.2.2}/oe-use-libc-malloc.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.1 => 
redis-7.2.2}/redis.conf (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.1 => 
redis-7.2.2}/redis.service (100%)
  rename meta-oe/recipes-extended/redis/{redis_7.2.1.bb => 
redis_7.2.2.bb} (96%)
  rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_4.9.bb => 
adw-gtk3_5.1.bb} (88%)
  create mode 100644 
meta-oe/recipes-graphics/graphviz/graphviz/0001-Autotools-fix-do-not-put-prefix-based-paths-in-compi.patch
  rename meta-oe/recipes-graphics/libdecor/{libdecor_0.1.99.bb => 
libdecor_0.2.0.bb} (94%)
  rename meta-oe/recipes-graphics/lvgl/{lvgl_8.3.9.bb => lvgl_8.3.10.bb} 
(94%)
  rename meta-oe/recipes-graphics/tesseract/{tesseract_5.3.2.bb => 
tesseract_5.3.3.bb} (91%)
  rename meta-oe/recipes-graphics/xorg-app/{xterm_384.bb => 
xterm_387.bb} (94%)
  rename meta-oe/recipes-multimedia/webm/{libvpx_1.13.0.bb => 
libvpx_1.13.1.bb} (96%)
  rename meta-oe/recipes-navigation/proj/{proj_9.1.1.bb => 
proj_9.3.0.bb} (90%)
  rename meta-oe/recipes-printing/gutenprint/{gutenprint_git.bb => 
gutenprint_5.3.4.bb} (82%)
  rename meta-oe/recipes-support/c-ares/{c-ares_1.19.1.bb => 
c-ares_1.20.1.bb} (78%)
  rename meta-oe/recipes-support/ceres-solver/{ceres-solver_2.1.0.bb => 
ceres-solver_2.2.0.bb} (94%)
  rename meta-oe/recipes-support/freerdp/{freerdp_2.11.1.bb => 
freerdp_2.11.2.bb} (98%)
  rename meta-oe/recipes-support/libbytesize/{libbytesize_2.9.bb => 
libbytesize_2.10.bb} (84%)
  create mode 100644 
meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
  rename meta-oe/recipes-support/libnvme/{libnvme_1.5.bb => 
libnvme_1.6.bb} (86%)
  create mode 100644 
meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch
  create mode 100644 
meta-oe/recipes-support/poco/poco/0001-Fix-data-race-when-create-POSIX-thread.patch
  create mode 100644 meta-oe/recipes-support/re2/re2/run-ptest
  rename meta-oe/recipes-support/remmina/{remmina_1.4.32.bb => 
remmina_1.4.33.bb} (96%)
  rename meta-oe/recipes-support/tio/{tio_2.6.bb => tio_2.7.bb} (91%)
  delete mode 100644 
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch
  rename 
meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.10.bb => 
vboxguestdrivers_7.0.12.bb} (96%)
  rename meta-oe/recipes-support/zchunk/{zchunk_1.3.1.bb => 
zchunk_1.3.2.bb} (93%)
  create mode 100644 meta-perl/files/static-group-meta-perl
  create mode 100644 meta-perl/files/static-passwd-meta-perl
  delete mode 100644 meta-perl/recipes-core/images/meta-perl-base.bb
  rename meta-perl/recipes-core/images/{meta-perl-image.bb => 
meta-perl-image-all.bb} (70%)
  rename meta-perl/recipes-core/images/{meta-perl-ptest-all-image.bb => 
meta-perl-image-ptest-all.bb} (84%)
  rename meta-perl/recipes-core/images/{meta-perl-ptest-fast-image.bb => 
meta-perl-image-ptest-fast.bb} (77%)
  rename meta-perl/recipes-core/images/{meta-perl-ptest-image.bb => 
meta-perl-image-ptest.bb} (96%)
  create mode 100644 
meta-perl/recipes-perl/libnet/libnet-idn-encode/Net-IDN-Encode-2.500-use_uvchr_to_utf8_flags_instead_of_uvuni_to_utf8_flags.patch
  create mode 100644 
meta-perl/recipes-perl/libtext/libtext-diff-perl/run-ptest
  delete mode 100644 meta-perl/recipes-perl/po4a/po4a_0.49.bb
  rename meta-python/recipes-core/images/{meta-python-image.bb => 
meta-python-image-all.bb} (65%)
  delete mode 100644 
meta-python/recipes-core/images/meta-python-image-base.bb
  rename meta-python/recipes-core/images/{meta-python-ptest-all-image.bb 
=> meta-python-image-ptest-all.bb} (85%)
  rename 
meta-python/recipes-core/images/{meta-python-ptest-fast-image.bb => 
meta-python-image-ptest-fast.bb} (77%)
  rename meta-python/recipes-core/images/{meta-python-ptest-image.bb => 
meta-python-image-ptest.bb} (96%)
  rename meta-python/recipes-devtools/python/{python3-aiodns_3.0.0.bb => 
python3-aiodns_3.1.1.bb} (74%)
  rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.5.bb 
=> python3-aiohttp_3.8.6.bb} (89%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
  rename meta-python/recipes-devtools/python/{python3-astroid_3.0.0.bb 
=> python3-astroid_3.0.1.bb} (87%)
  rename meta-python/recipes-devtools/python/{python3-bitarray_2.8.1.bb 
=> python3-bitarray_2.8.2.bb} (77%)
  rename 
meta-python/recipes-devtools/python/{python3-bitstruct_8.17.0.bb => 
python3-bitstruct_8.18.0.bb} (79%)
  rename meta-python/recipes-devtools/python/{python3-blinker_1.6.2.bb 
=> python3-blinker_1.6.3.bb} (83%)
  delete mode 100644 
meta-python/recipes-devtools/python/python3-boto3_1.28.57.bb
  delete mode 100644 
meta-python/recipes-devtools/python/python3-botocore_1.31.57.bb
  rename 
meta-python/recipes-devtools/python/{python3-charset-normalizer_3.2.0.bb 
=> python3-charset-normalizer_3.3.0.bb} (82%)
  rename meta-python/recipes-devtools/python/{python3-cmake_3.27.5.bb => 
python3-cmake_3.27.7.bb} (90%)
  rename meta-python/recipes-devtools/python/{python3-coverage_7.3.1.bb 
=> python3-coverage_7.3.2.bb} (83%)
  rename meta-python/recipes-devtools/python/{python3-croniter_1.4.1.bb 
=> python3-croniter_2.0.1.bb} (77%)
  rename 
meta-python/recipes-devtools/python/{python3-dbus-fast_1.85.0.bb => 
python3-dbus-fast_2.12.0.bb} (80%)
  rename 
meta-python/recipes-devtools/python/{python3-email-validator_1.3.1.bb => 
python3-email-validator_2.0.0.bb} (78%)
  rename meta-python/recipes-devtools/python/{python3-engineio_4.7.1.bb 
=> python3-engineio_4.8.0.bb} (82%)
  rename meta-python/recipes-devtools/python/{python3-eth-abi_3.0.1.bb 
=> python3-eth-abi_4.2.1.bb} (69%)
  rename 
meta-python/recipes-devtools/python/{python3-eth-typing_3.4.0.bb => 
python3-eth-typing_3.5.0.bb} (74%)
  rename meta-python/recipes-devtools/python/{python3-eth-utils_2.2.1.bb 
=> python3-eth-utils_2.2.2.bb} (81%)
  rename meta-python/recipes-devtools/python/{python3-executing_1.2.0.bb 
=> python3-executing_2.0.0.bb} (74%)
  rename 
meta-python/recipes-devtools/python/{python3-flask-babel_3.1.0.bb => 
python3-flask-babel_4.0.0.bb} (79%)
  rename 
meta-python/recipes-devtools/python/{python3-flask-jwt-extended_4.5.2.bb 
=> python3-flask-jwt-extended_4.5.3.bb} (80%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-git-pw_2.5.0.bb
  rename 
meta-python/recipes-devtools/python/{python3-google-api-python-client_2.101.0.bb 
=> python3-google-api-python-client_2.104.0.bb} (86%)
  rename 
meta-python/recipes-devtools/python/{python3-google-auth_2.23.1.bb => 
python3-google-auth_2.23.3.bb} (87%)
  rename 
meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.60.0.bb 
=> python3-googleapis-common-protos_1.61.0.bb} (79%)
  rename meta-python/recipes-devtools/python/{python3-h5py_3.9.0.bb => 
python3-h5py_3.10.0.bb} (92%)
  rename meta-python/recipes-devtools/python/{python3-huey_2.4.5.bb => 
python3-huey_2.5.0.bb} (78%)
  rename meta-python/recipes-devtools/python/{python3-imageio_2.31.3.bb 
=> python3-imageio_2.31.5.bb} (81%)
  rename meta-python/recipes-devtools/python/{python3-ipython_8.15.0.bb 
=> python3-ipython_8.16.1.bb} (88%)
  rename meta-python/recipes-devtools/python/{python3-jedi_0.19.0.bb => 
python3-jedi_0.19.1.bb} (83%)
  rename 
meta-python/recipes-devtools/python/{python3-meson-python_0.13.1.bb => 
python3-meson-python_0.14.0.bb} (85%)
  rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.6.bb 
=> python3-msgpack_1.0.7.bb} (83%)
  rename meta-python/recipes-devtools/python/{python3-mypy_1.5.1.bb => 
python3-mypy_1.6.1.bb} (74%)
  rename 
meta-python/recipes-devtools/python/{python3-platformdirs_3.10.0.bb => 
python3-platformdirs_3.11.0.bb} (88%)
  rename 
meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.36.bb => 
python3-prompt-toolkit_3.0.39.bb} (87%)
  rename meta-python/recipes-devtools/python/{python3-protobuf_4.24.3.bb 
=> python3-protobuf_4.24.4.bb} (92%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-py-cpuinfo/0001-test_cli.py-disable.patch
  rename meta-python/recipes-devtools/python/{python3-pycares_4.3.0.bb 
=> python3-pycares_4.4.0.bb} (85%)
  rename 
meta-python/recipes-devtools/python/{python3-pycodestyle_2.11.0.bb => 
python3-pycodestyle_2.11.1.bb} (76%)
  rename meta-python/recipes-devtools/python/{python3-pydantic_2.4.1.bb 
=> python3-pydantic_2.4.2.bb} (86%)
  delete mode 100644 
meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
  delete mode 100644 
meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
  rename meta-python/recipes-devtools/python/{python3-pylint_2.17.4.bb 
=> python3-pylint_3.0.1.bb} (88%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
  rename 
meta-python/recipes-devtools/python/{python3-pytest-timeout_2.1.0.bb => 
python3-pytest-timeout_2.2.0.bb} (77%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
  delete mode 100644 
meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
  create mode 100644 
meta-python/recipes-devtools/python/python3-rapidjson_1.12.bb
  rename meta-python/recipes-devtools/python/{python3-regex_2023.8.8.bb 
=> python3-regex_2023.10.3.bb} (79%)
  rename meta-python/recipes-devtools/python/{python3-schedule_1.2.0.bb 
=> python3-schedule_1.2.1.bb} (76%)
  rename meta-python/recipes-devtools/python/{python3-semver_3.0.1.bb => 
python3-semver_3.0.2.bb} (80%)
  rename 
meta-python/recipes-devtools/python/{python3-simplejson_3.19.1.bb => 
python3-simplejson_3.19.2.bb} (87%)
  rename meta-python/recipes-devtools/python/{python3-socketio_5.9.0.bb 
=> python3-socketio_5.10.0.bb} (89%)
  rename 
meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.21.bb => 
python3-sqlalchemy_2.0.22.bb} (87%)
  rename 
meta-python/recipes-devtools/python/{python3-stack-data_0.6.2.bb => 
python3-stack-data_0.6.3.bb} (83%)
  rename meta-python/recipes-devtools/python/{python3-texttable_1.6.7.bb 
=> python3-texttable_1.7.0.bb} (74%)
  rename 
meta-python/recipes-devtools/python/{python3-traitlets_5.10.1.bb => 
python3-traitlets_5.11.2.bb} (76%)
  rename 
meta-python/recipes-devtools/python/{python3-types-psutil_5.9.5.16.bb => 
python3-types-psutil_5.9.5.17.bb} (74%)
  rename meta-python/recipes-devtools/python/{python3-tzlocal_5.0.1.bb 
=> python3-tzlocal_5.1.bb} (78%)
  rename meta-python/recipes-devtools/python/{python3-web3_6.10.0.bb => 
python3-web3_6.11.1.bb} (85%)
  rename 
meta-python/recipes-devtools/python/{python3-websocket-client_1.6.3.bb 
=> python3-websocket-client_1.6.4.bb} (84%)
  rename 
meta-python/recipes-devtools/python/{python3-xlsxwriter_3.1.3.bb => 
python3-xlsxwriter_3.1.8.bb} (82%)
  rename meta-python/recipes-devtools/python/{python3-xxhash_3.3.0.bb => 
python3-xxhash_3.4.1.bb} (85%)
  rename 
meta-python/recipes-devtools/python/{python3-zeroconf_0.112.0.bb => 
python3-zeroconf_0.119.0.bb} (82%)
  rename 
meta-python/recipes-devtools/python/{python3-zopeinterface_6.0.bb => 
python3-zopeinterface_6.1.bb} (89%)
  rename 
meta-python/recipes-extended/python-pyephem/{python3-pyephem_4.1.4.bb => 
python3-pyephem_4.1.5.bb} (77%)
  rename 
meta-python/recipes-extended/python-rich/{python3-rich_13.5.3.bb => 
python3-rich_13.6.0.bb} (85%)
  create mode 100644 meta-webserver/files/static-passwd-meta-webserver
  rename meta-webserver/recipes-core/images/{meta-webserver-image.bb => 
meta-webserver-image-all.bb} (50%)
  delete mode 100644 
meta-webserver/recipes-core/images/meta-webserver-image-base.bb
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch
  rename meta-webserver/recipes-webadmin/netdata/{netdata_1.36.1.bb => 
netdata_1.43.0.bb} (88%)


