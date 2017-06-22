Return-Path: <pauldotknopf@gmail.com>
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5B93A77ECB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 12:39:07 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id y47so9949074oty.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 05:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ahHqBh4mlWMGe+N5RLBGHm5lBfkcByFkO2VjFBBs8LY=;
	b=sLccdR/zXMUyX+hUo2CcRvHfU2xUbLmp/ask+leBlcuKPBVk7Ui82Fcz5KOaiwyvre
	JzkqIRSbK6ePz4SAxZsRBy0mziOAgkQaexn6LuXtUjMgnKrdb5T6q9MePtqKPbM8CO+U
	lgmznjKHXmz9CWayODGymL0I6TEy3klr3IzYweL3VskDLevOVWSd9ZQkxIHj7cN9+A81
	w3XwgxZlodtuVz/CbWwpX/EIQ8mpP2tLBFIh0XQuzExk7V+JgHCo91AocGHy0lDp9zcm
	ZA3YASzAKPaSCiRaD44D0cqazGqhP27RCkfMdbO93wLPA6l+PP4+efw9gUB7+/2ZwJW8
	nT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ahHqBh4mlWMGe+N5RLBGHm5lBfkcByFkO2VjFBBs8LY=;
	b=pF9o9fsVg/tZqMwFt7M4xd98JEy8whE2rzPhkhz+kd5T7vRxnKG+ursdfdiUJZFFVg
	JNmHxUvxprY83+8mlhQWJ/4Vub/xBtlbbQDrACHDUStifHem6Nz8HpYCzpp7jDpWwyiz
	+B/WIknbDm8WWvaC0rGEaFyDzVIjJHCV3di7FaUjm5f2JiuUiglM67tkKtJMelZyVzyR
	C0YRzjBxaYIXng1PpBo5SiRzBBWjzy7efiARB6YIe56EzgcPES9d4O6YxeSgpdHRKRQw
	KM/hqIiSzgtCszUWk6P9C92JPBSD5NMzIpGI/8Kgn0XGOtgZ1Z/lzRfzKlu7gl1Yq2WK
	d0NA==
X-Gm-Message-State: AKS2vOxwwWeIyi/7/ULoqXHw0etw6txL8tPM18h7hpLxs1HrQ2x+Q7YR
	VnkjVhk3EwVv0tk6bhzTlbvPNfcem3lc
X-Received: by 10.157.32.76 with SMTP id n70mr1443711ota.151.1498135148687;
	Thu, 22 Jun 2017 05:39:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.139.150 with HTTP; Thu, 22 Jun 2017 05:39:08 -0700 (PDT)
From: Paul Knopf <pauldotknopf@gmail.com>
Date: Thu, 22 Jun 2017 08:39:08 -0400
Message-ID: <CAKmWj-0oR4i4QK7mVT2iy4yyS57ULJizNEzv9cSP3U0qthjFCQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-qt5 issue with populate_sdk on meta-toolchain-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Jun 2017 12:39:08 -0000
Content-Type: text/plain; charset="UTF-8"

Using master (3ae86cb32edd1449f702e0a094929ae9b21ce191), running this
command gives me problems.

bitbake meta-toolchain-qt5 -c populate_sdk

I get the following error.

ERROR: meta-toolchain-qt5-1.0-r0 do_populate_sdk: Could not invoke dnf.
Command
'/home/connor/Repos/Clear/recipes/build/tmp/work/corei7-64-poky-linux/meta-toolchain-qt5/1.0-r0/recipe-sysroot-native/usr/bin/dnf
-y -c
/home/connor/Repos/Clear/recipes/build/tmp/work/corei7-64-poky-linux/meta-toolchain-qt5/1.0-r0/sdk/image/etc/dnf/dnf.conf
--setopt=reposdir=/home/connor/Repos/Clear/recipes/build/tmp/work/corei7-64-poky-linux/meta-toolchain-qt5/1.0-r0/sdk/image/etc/yum.repos.d
--repofrompath=oe-repo,/home/connor/Repos/Clear/recipes/build/tmp/work/corei7-64-poky-linux/meta-toolchain-qt5/1.0-r0/oe-rootfs-repo
--installroot=/home/connor/Repos/Clear/recipes/build/tmp/work/corei7-64-poky-linux/meta-toolchain-qt5/1.0-r0/sdk/image
--setopt=logdir=/home/connor/Repos/Clear/recipes/build/tmp/work/corei7-64-poky-linux/meta-toolchain-qt5/1.0-r0/temp
--nogpgcheck install nativesdk-packagegroup-qt5-toolchain-host
nativesdk-packagegroup-sdk-host
packagegroup-cross-canadian-intel-corei7-64' returned 1:
Added oe-repo repo from
file:///home/connor/Repos/Clear/recipes/build/tmp/work/corei7-64-poky-linux/meta-toolchain-qt5/1.0-r0/oe-rootfs-repo
Last metadata expiration check: 0:00:00 ago on Thu Jun 22 12:34:46 2017 UTC.
Dependencies resolved.
================================================================================
 Package                         Arch             Version         Repository

 Size
================================================================================
Installing:
 nativesdk-packagegroup-qt5-toolchain-host
                                 x86_64_nativesdk 1.0-r0          oe-repo
5.5 k
 nativesdk-packagegroup-sdk-host x86_64_nativesdk 1.0-r12         oe-repo
5.7 k
 packagegroup-cross-canadian-intel-corei7-64
                                 x86_64_nativesdk 1.0-r0          oe-repo
5.5 k
Installing dependencies:
 binutils-cross-canadian-x86-64  x86_64_nativesdk 2.28-r0         oe-repo
 12 M
 gcc-cross-canadian-x86-64       x86_64_nativesdk 6.3.0-r0        oe-repo
 25 M
 gdb-cross-canadian-x86-64       x86_64_nativesdk 7.12.1-r0       oe-repo
2.3 M
 meta-environment-intel-corei7-64
                                 x86_64_nativesdk 1.0-r8          oe-repo
 10 k
 nativesdk-autoconf              x86_64_nativesdk 2.69-r11        oe-repo
513 k
 nativesdk-automake              x86_64_nativesdk 1.15-r0         oe-repo
377 k
 nativesdk-cmake                 x86_64_nativesdk 3.7.2-r0        oe-repo
7.2 M
 nativesdk-db                    x86_64_nativesdk 1:5.3.28-r1     oe-repo
548 k
 nativesdk-dnf                   x86_64_nativesdk 2.0.0+git0+f0093d672d-r0
                                                                  oe-repo
195 k
 nativesdk-dtc                   x86_64_nativesdk 1.4.2-r0        oe-repo
 70 k
 nativesdk-elfutils              x86_64_nativesdk 0.168-r0        oe-repo
150 k
 nativesdk-flex                  x86_64_nativesdk 2.6.0-r0        oe-repo
133 k
 nativesdk-gnu-config            x86_64_nativesdk
20150728+git0+b576fa87c1-r0
                                                                  oe-repo
 32 k
 nativesdk-libarchive            x86_64_nativesdk 3.2.2-r0        oe-repo
299 k
 nativesdk-libasm1               x86_64_nativesdk 0.168-r0        oe-repo
 20 k
 nativesdk-libbz2-1              x86_64_nativesdk 1.0.6-r5        oe-repo
 37 k
 nativesdk-libc6                 x86_64_nativesdk 2.25-r0         oe-repo
1.7 M
 nativesdk-libcrypto1.0.2        x86_64_nativesdk 1.0.2k-r0       oe-repo
986 k
 nativesdk-libcurl4              x86_64_nativesdk 7.53.1-r0       oe-repo
174 k
 nativesdk-libdw1                x86_64_nativesdk 0.168-r0        oe-repo
257 k
 nativesdk-libelf1               x86_64_nativesdk 0.168-r0        oe-repo
 50 k
 nativesdk-libexpat1             x86_64_nativesdk 2.2.0-r0        oe-repo
 68 k
 nativesdk-libffi6               x86_64_nativesdk 3.2.1-r0        oe-repo
 23 k
 nativesdk-libgcc1               x86_64_nativesdk 6.3.0-r0        oe-repo
 48 k
 nativesdk-libglib-2.0-0         x86_64_nativesdk 1:2.50.3-r0     oe-repo
1.2 M
 nativesdk-libgmp10              x86_64_nativesdk 6.1.2-r0        oe-repo
249 k
 nativesdk-libmpc3               x86_64_nativesdk 1.0.3-r0        oe-repo
 49 k
 nativesdk-libmpfr4              x86_64_nativesdk 3.1.5-r0        oe-repo
185 k
 nativesdk-libncurses5           x86_64_nativesdk 6.0+20161126-r0 oe-repo
 73 k
 nativesdk-libncursesw5          x86_64_nativesdk 6.0+20161126-r0 oe-repo
 96 k
 nativesdk-libopkg1              x86_64_nativesdk 1:0.3.4-r0      oe-repo
 79 k
 nativesdk-libpcre1              x86_64_nativesdk 8.40-r0         oe-repo
100 k
 nativesdk-libpixman-1-0         x86_64_nativesdk 1:0.34.0-r0     oe-repo
277 k
 nativesdk-libpython3.5m1.0      x86_64_nativesdk 3.5.2-r1.0      oe-repo
957 k
 nativesdk-libreadline7          x86_64_nativesdk 7.0-r0          oe-repo
150 k
 nativesdk-libsdl-1.2-0          x86_64_nativesdk 1.2.15-r3       oe-repo
157 k
 nativesdk-libsolv               x86_64_nativesdk 0.6.26-r0       oe-repo
342 k
 nativesdk-libssl1.0.2           x86_64_nativesdk 1.0.2k-r0       oe-repo
176 k
 nativesdk-libssp0               x86_64_nativesdk 6.3.0-r0        oe-repo
 11 k
 nativesdk-libstdc++6            x86_64_nativesdk 6.3.0-r0        oe-repo
456 k
 nativesdk-libtinfo5             x86_64_nativesdk 6.0+20161126-r0 oe-repo
 68 k
 nativesdk-libtool               x86_64_nativesdk 2.4.6-r0        oe-repo
509 k
 nativesdk-libx11-6              x86_64_nativesdk 1:1.6.4-r0      oe-repo
750 k
 nativesdk-libxau6               x86_64_nativesdk 1:1.0.8-r0      oe-repo
 12 k
 nativesdk-libxcb1               x86_64_nativesdk 1.12-r0         oe-repo
 50 k
 nativesdk-libxdmcp6             x86_64_nativesdk 1:1.1.2-r0      oe-repo
 16 k
 nativesdk-libxext6              x86_64_nativesdk 1:1.3.3-r0      oe-repo
 33 k
 nativesdk-libxrandr2            x86_64_nativesdk 1:1.5.1-r0      oe-repo
 23 k
 nativesdk-libxrender1           x86_64_nativesdk 1:0.9.10-r0     oe-repo
 24 k
 nativesdk-libz1                 x86_64_nativesdk 1.2.11-r0       oe-repo
 54 k
 nativesdk-m4                    x86_64_nativesdk 1.4.18-r0       oe-repo
117 k
 nativesdk-makedevs              x86_64_nativesdk 1.0.1-r0        oe-repo
 14 k
 nativesdk-openssl               x86_64_nativesdk 1.0.2k-r0       oe-repo
240 k
 nativesdk-openssl-conf          x86_64_nativesdk 1.0.2k-r0       oe-repo
 10 k
 nativesdk-opkg                  x86_64_nativesdk 1:0.3.4-r0      oe-repo
 17 k
 nativesdk-pkgconfig             x86_64_nativesdk 0.29.1+git0+87152c05be-r0
                                                                  oe-repo
224 k
 nativesdk-postinst-intercept    x86_64_nativesdk 1.0-r0          oe-repo
8.3 k
 nativesdk-pseudo                x86_64_nativesdk 1.8.2-r0        oe-repo
1.5 M
 nativesdk-python3-argparse      x86_64_nativesdk 3.5.2-r1.0      oe-repo
 91 k
 nativesdk-python3-codecs        x86_64_nativesdk 3.5.2-r1.0      oe-repo
1.1 M
 nativesdk-python3-compression   x86_64_nativesdk 3.5.2-r1.0      oe-repo
207 k
 nativesdk-python3-core          x86_64_nativesdk 3.5.2-r1.0      oe-repo
355 k
 nativesdk-python3-crypt         x86_64_nativesdk 3.5.2-r1.0      oe-repo
 37 k
 nativesdk-python3-datetime      x86_64_nativesdk 3.5.2-r1.0      oe-repo
139 k
 nativesdk-python3-enum          x86_64_nativesdk 3.5.2-r1.0      oe-repo
 20 k
 nativesdk-python3-fcntl         x86_64_nativesdk 3.5.2-r1.0      oe-repo
 14 k
 nativesdk-python3-html          x86_64_nativesdk 3.5.2-r1.0      oe-repo
128 k
 nativesdk-python3-importlib     x86_64_nativesdk 3.5.2-r1.0      oe-repo
116 k
 nativesdk-python3-io            x86_64_nativesdk 3.5.2-r1.0      oe-repo
343 k
 nativesdk-python3-lang          x86_64_nativesdk 3.5.2-r1.0      oe-repo
329 k
 nativesdk-python3-logging       x86_64_nativesdk 3.5.2-r1.0      oe-repo
156 k
 nativesdk-python3-math          x86_64_nativesdk 3.5.2-r1.0      oe-repo
 61 k
 nativesdk-python3-mime          x86_64_nativesdk 3.5.2-r1.0      oe-repo
 18 k
 nativesdk-python3-netclient     x86_64_nativesdk 3.5.2-r1.0      oe-repo
514 k
 nativesdk-python3-pickle        x86_64_nativesdk 3.5.2-r1.0      oe-repo
162 k
 nativesdk-python3-re            x86_64_nativesdk 3.5.2-r1.0      oe-repo
 47 k
 nativesdk-python3-reprlib       x86_64_nativesdk 3.5.2-r1.0      oe-repo
8.2 k
 nativesdk-python3-selectors     x86_64_nativesdk 3.5.2-r1.0      oe-repo
 20 k
 nativesdk-python3-shell         x86_64_nativesdk 3.5.2-r1.0      oe-repo
 66 k
 nativesdk-python3-signal        x86_64_nativesdk 3.5.2-r1.0      oe-repo
9.1 k
 nativesdk-python3-stringold     x86_64_nativesdk 3.5.2-r1.0      oe-repo
 14 k
 nativesdk-python3-subprocess    x86_64_nativesdk 3.5.2-r1.0      oe-repo
 69 k
 nativesdk-python3-textutils     x86_64_nativesdk 3.5.2-r1.0      oe-repo
109 k
 nativesdk-python3-threading     x86_64_nativesdk 3.5.2-r1.0      oe-repo
 61 k
 nativesdk-qemu                  x86_64_nativesdk 2.8.0-r0        oe-repo
 34 M
 nativesdk-qemu-helper           x86_64_nativesdk 1.0-r9          oe-repo
 30 k
 nativesdk-qtbase-tools          x86_64_nativesdk 5.8.0+git0+49dc9aa409-r0
                                                                  oe-repo
7.2 M
 nativesdk-qttools-tools         x86_64_nativesdk 5.8.0+git0+30c10900ad-r0
                                                                  oe-repo
3.1 M
 nativesdk-shadow                x86_64_nativesdk 4.2.1-r0        oe-repo
553 k
 nativesdk-unfs3                 x86_64_nativesdk 0.9.22.r497-r0  oe-repo
 51 k
 nativesdk-update-alternatives-opkg
                                 x86_64_nativesdk 0.3.4+git0+1a708fd73d-r0
                                                                  oe-repo
8.9 k
 nativesdk-util-linux            x86_64_nativesdk 2.29.1-r0       oe-repo
1.2 M
Installing weak dependencies:
 nativesdk-ca-certificates       x86_64_nativesdk 20161130-r0     oe-repo
402 k
 nativesdk-ncurses-terminfo-base x86_64_nativesdk 6.0+20161126-r0 oe-repo
 15 k
 nativesdk-python3-readline      x86_64_nativesdk 3.5.2-r1.0      oe-repo
 24 k

Transaction Summary
================================================================================
Install  98 Packages

Total size: 110 M
Installed size: 327 M
Running transaction check
Transaction check succeeded.
Running transaction test
Error: Transaction check error:
  file /opt/poky/2.3/sysroots/x86_64-pokysdk-linux/environment-setup.d
conflicts between attempted installs of
nativesdk-cmake-3.7.2-r0.x86_64_nativesdk and
nativesdk-qtbase-tools-5.8.0+git0+49dc9aa409-r0.x86_64_nativesdk

Error Summary
-------------


ERROR: meta-toolchain-qt5-1.0-r0 do_populate_sdk: Function failed:
do_populate_sdk
ERROR: Logfile of failure stored in:
/home/connor/Repos/Clear/recipes/build/tmp/work/corei7-64-poky-linux/meta-toolchain-qt5/1.0-r0/temp/log.do_populate_sdk.4843
ERROR: Task
(/home/connor/Repos/Clear/recipes/build/../meta-qt5/recipes-qt/meta/meta-toolchain-qt5.bb:do_populate_sdk)
failed with exit code '1'

Any ideas?

