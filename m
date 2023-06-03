Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7FAC7EE24
	for <webhook@archiver.kernel.org>; Sat,  3 Jun 2023 11:52:14 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.10217.1685793132643126836
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jun 2023 04:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=F3WPPrLz;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-bad102ce9eeso3306156276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jun 2023 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685793132; x=1688385132;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNb7YbSgXLq6D7yFZsmiKfR/l+pO5hA/IXOhdbIQSS0=;
        b=F3WPPrLzDytnmSs62/dlxvujzyjNIX3ZK+Dbi1oLvb5UnUGvt1WfMY1McoGvnKewLA
         xZGqEe3kmvLUHRNgybr7FvlQzvAHJb7E9cdXUh9fQ4Ii6rI7TWuFjUekivXREthrN97N
         oEBFcu1X2sRzyIR/OeU+laZKx62SNVO0g2db9DWN+4561TJOQ7Np+XLh/VqP5RGew3MZ
         6PmKhW7r3bHKzb2OkfrLCdjhnnspMRTUniUQduGNvSb00EzImoEPiMJZ2oZl7kz6stQn
         PaoJ0bGZBhmPZProP91FMUMVUjCptQ8bpNZUnxRZxUvvTs/zA/7Z3dGNUhaUlNIqQuzT
         b8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685793132; x=1688385132;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bNb7YbSgXLq6D7yFZsmiKfR/l+pO5hA/IXOhdbIQSS0=;
        b=j9qqlDJfL0KqM1JgUDGLPe0W/L29aRwRWmVOpjI27TH9ViKmrm2rRv3Zz3Et2S9or1
         dN034olMpR5/+4XolOpJiBvoMCWuAyvEJWaV4YfuXypUkLp034wkX4TRFZEJjjIHdYki
         dFiVAFI4m+2YZWdi+6+W9UnEcGdJWR61cNbI10R8mdlTIubF3PhXCUMDKGYIRgEKTrFH
         EofVtzVcejnhhaPrXTR2yl9H+EcIXica+Oub7/4f8RrhWG1r9PU/7xKPAGBkMNFTBt1R
         mvO3CQ29RkqB1QqILIO97C35PMuWORSDNvf82vV9y7F3wiEL60okAQA7md9IVa/gbTRp
         DFeQ==
X-Gm-Message-State: AC+VfDwgD8HtNRpExnGfrSeg5PO32/IsjOQnJkOPo+8BXAdb8VSrAgGg
	Vv3wInXt+N9x00P1N1aBLi57CAb4KnU=
X-Google-Smtp-Source: ACHHUZ7OO5IYuplvdnG4rQAUZirflLMxSY13Ub0w432NzBuQvXdvXhgmMyGSeZIvb+BhFMh8a13eHA==
X-Received: by 2002:a81:718a:0:b0:569:1ff9:58d3 with SMTP id m132-20020a81718a000000b005691ff958d3mr3442273ywc.1.1685793131471;
        Sat, 03 Jun 2023 04:52:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:e536:f41a:fd0c:cd9e? ([2600:1700:9190:ba10:e536:f41a:fd0c:cd9e])
        by smtp.gmail.com with ESMTPSA id x186-20020a817cc3000000b00545a081849esm1444137ywc.46.2023.06.03.04.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jun 2023 04:52:10 -0700 (PDT)
Message-ID: <a549e0da-b974-9e18-2d4f-45e5d6af53a8@gmail.com>
Date: Sat, 3 Jun 2023 07:52:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickledore merge request: June 3rd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Jun 2023 11:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103104

The following changes since commit c032fd0b1a9d444711103c2703dfa8e2964a3865:

   redis: upgrade 6.2.11 -> 6.2.12 (2023-05-16 07:32:31 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 928658212611ea457a5eacec48f0760e03269a24:

   gnulib: Update recipe name to 2018-12-18 (2023-05-31 10:50:50 -0400)

----------------------------------------------------------------
Alexander Amelkin (1):
       ipmitool: Update links

Chen Qi (1):
       frr: add CVE_PRODUCT

Joe Slater (1):
       bats: use baselib

Khem Raj (28):
       libencode-perl: Remove buildpaths from generated .exh files
       enca: Remove buildpaths from target scripts
       libirecovery: Add missing build dependency on readline
       fftw: Remove hardcoded sysroot into binaries
       lmdb: Pass CFLAGS to Makefile
       php: Remove buildpaths from scripts and generated headers
       uw-imap: Pass CFLAGS from environment
       libmad: Add a patch to pass cflags to build
       libpeas: Fix reference to TMPDIR in tests
       lirc: Define SH_PATH=/bin/sh
       mce-inject: Pass CFLAGS to make
       nbdkit: Remove buildpaths from binaries
       mpv: Remove references to builddir from mpv binary
       libnice: Remove buildpaths from binaries
       curlpp: Remove references to buildpaths e.g. TMPDIR
       unbound: Remove references to buildpaths
       uml-utilities: Fix references to TMPDIR
       openct: Fix buildpaths being emitted into generated types.h
       minifi-cpp: Remove references to buildpaths in generated files
       freerdp: Fix reference to TMPDIR in libfreerdp2.so
       nautilus: Fix buildpath QA errors
       cgdb: Fix buildpaths emitted into cgdb binary
       ibus: Point python interpreter to target location
       gimp: Fix buildpaths in binaries and scripts
       libgphoto2: Edit out sysroot from CC variable in configure
       vlan: Pass CFLAGS via CCFLAGS
       sgpio: Pass CFLAGS to make
       x265: Pass --debug-prefix-map to nasm

Ming Liu (2):
       libusbgx: drop hard-coded /usr/bin,/etc
       libusbgx: check scripts in /etc/usbgx.d

Mingli Yu (2):
       php: Link with libatomic on rv64
       minicoredumper: correct the sysvinit service file attribute

Wang Mingyu (3):
       postgresql: upgrade 15.2 -> 15.3
       php: upgrade 8.2.5 -> 8.2.6
       nautilus: upgrade 44.0 -> 44.1

schitrod=cisco.com@lists.openembedded.org (1):
       gnulib: Update recipe name to 2018-12-18

  ...1-configure-Keep-first-line-of-compiler-version-string.patch | 30 
+++++++
  ...1-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch | 34 
++++++++
  meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb                    | 4 +-
  .../nautilus/nautilus/0001-Replace-filename-with-basename.patch | 46 
+++++++++++
  .../nautilus/0001-initialize-GdkDragAction-action-to-0.patch    | 47 
-----------
  .../nautilus/{nautilus_44.0.bb => nautilus_44.1.bb} |   4 +-
  meta-gnome/recipes-support/ibus/ibus.bb                         | 2 +-
  meta-gnome/recipes-support/ibus/ibus.inc                        | 3 +
  meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb           | 4 +
  meta-networking/recipes-connectivity/vlan/vlan_1.9.bb           | 2 +-
  meta-networking/recipes-protocols/frr/frr_8.4.2.bb              | 2 +
  ...1-curlpp-config.in-Remove-references-to-absolute-build.patch | 40 
+++++++++
  meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb          | 3 +-
  .../0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch    | 38 
+++++++++
  .../nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch   | 39 
---------
  meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb        | 2 +-
  meta-networking/recipes-support/unbound/unbound_1.17.1.bb       | 4 +
  .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb        | 2 +-
  meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb   | 2 +-
  meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb                         | 4 +-
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 10 +--
  .../postgresql/{postgresql_15.2.bb => postgresql_15.3.bb} |   2 +-
  .../0001-cgdb-Do-not-search-for-cgdb.txt-in-build-dir.patch     | 34 
++++++++
  meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb                     | 3 +-
  meta-oe/recipes-devtools/php/{php_8.2.5.bb => php_8.2.6.bb} |  10 ++-
  meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb               | 2 +-
  meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb         | 6 ++
  meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb                | 1 +
  .../0001-cow.c-Replace-stat64-with-stat.patch                   | 34 
++++++++
  .../0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch  | 122 
++++++++++++++++++++++++++++
  .../recipes-extended/uml-utilities/uml-utilities_20040406.bb    | 2 +
  ...01-Remove-builddir-and-srcdir-paths-from-test-binaries.patch | 82 
+++++++++++++++++++
  meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb                 | 1 +
  .../0001-configure-Filter-out-buildpaths-from-CC.patch          | 48 
+++++++++++
  meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.30.bb           | 7 +-
  meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb              | 6 +-
  meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb   | 2 +-
  .../0001-configure-Respect-the-cflags-from-environment.patch    | 47 
+++++++++++
  meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb             | 1 +
  meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb                | 4 +
  .../enca/enca/0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch  | 30 
+++++++
  meta-oe/recipes-support/enca/enca_1.19.bb                       | 4 +-
  .../0001-agent-meson-Replace-filename-with-basename.patch       | 40 
+++++++++
  meta-oe/recipes-support/farsight/libnice_0.1.21.bb              | 3 +-
  meta-oe/recipes-support/fftw/fftw_3.3.10.bb                     | 1 +
  meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb               | 4 +
  .../gnulib/{gnulib_2018-03-07.03.bb => gnulib_2018-12-18.bb} |   0
  meta-oe/recipes-support/libusbgx/libusbgx/gadget-start          | 4 +
  meta-oe/recipes-support/libusbgx/libusbgx_git.bb                | 4 +-
  meta-oe/recipes-support/mcelog/mce-inject_git.bb                | 2 +-
  .../0001-m4-Just-emit-the-first-line-of-compiler-version.patch  | 31 
+++++++
  meta-oe/recipes-support/openct/openct_0.6.20.bb                 | 1 +
  meta-oe/recipes-test/bats/bats_1.9.0.bb                         | 8 +-
  meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb         | 6 +-
  54 files changed, 748 insertions(+), 126 deletions(-)
  create mode 100644 
meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
  create mode 100644 
meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
  create mode 100644 
meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-basename.patch
  delete mode 100644 
meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch
  rename meta-gnome/recipes-gnome/nautilus/{nautilus_44.0.bb => 
nautilus_44.1.bb} (88%)
  create mode 100644 
meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remove-references-to-absolute-build.patch
  create mode 100644 
meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch
  delete mode 100644 
meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_15.2.bb => 
postgresql_15.3.bb} (84%)
  create mode 100644 
meta-oe/recipes-devtools/cgdb/cgdb/0001-cgdb-Do-not-search-for-cgdb.txt-in-build-dir.patch
  rename meta-oe/recipes-devtools/php/{php_8.2.5.bb => php_8.2.6.bb} (96%)
  create mode 100644 
meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch
  create mode 100644 
meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch
  create mode 100644 
meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
  create mode 100644 
meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch
  create mode 100644 
meta-oe/recipes-multimedia/libmad/libmad/0001-configure-Respect-the-cflags-from-environment.patch
  create mode 100644 
meta-oe/recipes-support/enca/enca/0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch
  create mode 100644 
meta-oe/recipes-support/farsight/libnice/0001-agent-meson-Replace-filename-with-basename.patch
  rename meta-oe/recipes-support/gnulib/{gnulib_2018-03-07.03.bb => 
gnulib_2018-12-18.bb} (100%)
  create mode 100644 
meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of-compiler-version.patch


