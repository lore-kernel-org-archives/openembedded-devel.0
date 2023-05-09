Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C55C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 10:15:11 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.28138.1683627309792876936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 03:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Zc5r9YY8;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-559e2051d05so81772057b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 03:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683627309; x=1686219309;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhKogZAhGsf541/FYzDKMI09oTl2TVUq0MaCfTHMdxk=;
        b=Zc5r9YY8fDjtxPxTgtOzsyMHtsz8f8i9ke3iyPAGaqLJGxUIVNi+q69O2kCfCA0L+F
         mEiHPLMyS+P/bn+dzupFTLN/A6KrvampcchJd2f3ApoN7k59nb+tYQEmEpdjW6oMkMQR
         wj6uXm1lOzdXMtQLYUxGXFs9yCKd5viKcnrBbqZffSyOpZGftznfwVpU1dbeusGUNSw6
         QuARSrGEbuUibo1xXIY/C3PndBWLWdT0s2cyrdlHjp2Qp21JuyY19+QzqHXS9wKPM6TI
         o3cf4BPwafVnukDMR3VHYrLS6Mqacmhfti/hfl8lLWawObmcEE+iU/Kdb6bksrjBW7eu
         JkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683627309; x=1686219309;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhKogZAhGsf541/FYzDKMI09oTl2TVUq0MaCfTHMdxk=;
        b=iQhaFFhelbTvo6w+6nMI+Lh1SDK6OLvWdoRHl5e9r71HYCQl8TprpYbINl8YCWZHt6
         44y0kdyxLoqYAFcHpJ90ELgoV80Qb/3IfWwscCICZ8MzVROgLKhxnu4h35m/yC74w5Ij
         VFZf1hxjyPa5BS0GyauMMeA48IDtLwaeLi39gkyR4JAv122lCwmoDPckWkUwuCCAGEgL
         3t1MWHdoXAZejTLpuvYPil/QYjrAAB497CwBhi1CN8EV/5Xv5Z2GSzkN9swWzO95FJWs
         96375npiG+nA2t7GX2NSHqoSaSJZlVlA51f+3RsWOTEdvSJ3RdZqeU/W/I1iJbsTTGx1
         VfaA==
X-Gm-Message-State: AC+VfDzTZBG74JTk7PXJaDgQwMG8Duq7FVwOEJyUMmXnGGZDNfQ8LV1Q
	3l/siGuPhyR2S/V5O4Mm0UsrFYoaI6c=
X-Google-Smtp-Source: ACHHUZ7aze6hi3sq2f+33Mk8o/cJTWPKzGHE7wjE1bmGEE/56Nts3tVN6FeD8YTDU0cmCTzRAQntSg==
X-Received: by 2002:a81:8348:0:b0:55b:f05b:d68 with SMTP id t69-20020a818348000000b0055bf05b0d68mr17501335ywf.20.1683627308504;
        Tue, 09 May 2023 03:15:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:183a:1604:2591:7a1e? ([2600:1700:9190:ba10:183a:1604:2591:7a1e])
        by smtp.gmail.com with ESMTPSA id o185-20020a8173c2000000b00555d2944284sm3126281ywc.67.2023.05.09.03.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 03:15:07 -0700 (PDT)
Message-ID: <48a1ba96-95c4-450c-87f0-7dfb9eaa6220@gmail.com>
Date: Tue, 9 May 2023 06:15:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickeldore merge request: May 9th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 10:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102495

The following changes since commit 2d89a469e5f6a209fdc50bf447cd645929e4b735:

   meta-openemnedded: Add myself as mickledore maintainer (2023-04-09 
08:52:55 -0700)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 54b177f4acb3048d21a68f180fc183d0fdf47a94:

   meta-networking/licenses/netperf: remove unused license (2023-05-08 
08:03:30 -0400)

----------------------------------------------------------------
Arsalan H. Awan (1):
       meta-networking/licenses/netperf: remove unused license

Bartosz Golaszewski (2):
       python3-gpiod: add missing run-time dependencies
       libgpiod: install the libgpiosim header

Bergin, Peter (1):
       freediameter: fix typo and old overide syntax

Bhargav Das (2):
       tslib: Add native & nativestdk package support
       pointercal: Add native & nativestdk package support

Jasper Orschulko (1):
       python3-gcovr: Add missing runtime dependency

Khem Raj (20):
       fwupd: Do not emit build time paths into generated headers
       libcereal: Fix TMPDIR leaking into debug_str section
       libtimezonemap: Point to a working SRC_URI
       unixODBC: Update SRC_URI to use updated location of tarball
       unicode-ucd: Update license URI to reflect renamed license
       libx86: Point to working SRC_URI
       ctapi-common: Point to working SRC_URI locations
       netkit-ftp: Update to debian patch 34
       nicstat: Use SOURCEFORGE_MIRROR in SRC_URI
       rp-pppoe: Point SRC_URI to valid location
       ttf-mplus: Point to valid download location for SRC_URI
       ttf-lklug: Point SRC_URI to a working location
       radiusclient-ng: Point SRC_URI to archive.ubuntu.com
       httpfs2: Do not use S during compile/install tasks
       p910nd: Switch to using github for SRC_URI
       mosh: Point SRC_URI to https://mosh.org/
       debootstrap: Update SRC_URI to point to valid URL
       debootstrap: Use DEBIAN_MIRROR for SRC_URI
       ttf-gentium: Switch to debian archive mirror for SRC_URI
       nfacct: Update SRC_URI to point to valid URL

Markus Volk (1):
       polkit: update SRC_URI

Martin Jansa (2):
       lirc: fix do_install with multilib
       dleyna-{server,renderer}: fix dev-so QA issue with multilib

Peter Marko (1):
       ntp: whitelist CVE-2019-11331

Petr Gotthard (1):
       gensio: fix QA issue: non -staticdev package with .a libraries

Valeria Petrov (1):
       apache2: upgrade 2.4.56 -> 2.4.57

Virendra Thakur (2):
       p7zip: fix for CVE-2018-5996
       p7zip: Fix for CVE-2016-9296

Wang Mingyu (3):
       redis: upgrade 7.0.10 -> 7.0.11
       hdf5: Fix install conflict when enable multilib.
       php: upgrade 8.2.4 -> 8.2.5

Yogita Urade (1):
       dlt-daemon: fix CVE-2023-26257

  .../recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb           | 9 +-
  meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb | 3 +-
  .../recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb          | 2 +-
  .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
  meta-networking/licenses/netperf                                | 43 
------
  meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb           | 8 +-
  meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb    | 7 +-
  .../recipes-protocols/freediameter/freediameter_1.4.0.bb        | 2 +-
  .../recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb  | 3 +-
  meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb     | 2 +-
  meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb             | 2 +
  .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb        | 6 +-
  ...1-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch | 41 +++++
  meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb                        | 1 +
  meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb                | 2 +
  meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb             | 2 +
  meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb                 | 2 +-
  meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb     | 3 +-
  meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb     | 2 +-
  meta-oe/recipes-devtools/php/{php_8.2.4.bb => php_8.2.5.bb} |   2 +-
  .../dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch            | 34 +++++
  meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb        | 1 +
  meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb               | 4 +-
  meta-oe/recipes-extended/nicstat/nicstat_1.95.bb                | 2 +-
  meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch        | 27 ++++
  meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch        | 227 
++++++++++++++++++++++++++++
  meta-oe/recipes-extended/p7zip/p7zip_16.02.bb                   | 2 +
  meta-oe/recipes-extended/polkit/polkit_122.bb                   | 2 +-
  .../recipes-extended/redis/{redis_7.0.10.bb => redis_7.0.11.bb} |   2 +-
  meta-oe/recipes-graphics/tslib/tslib_1.22.bb                    | 2 +
  meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb          | 2 +-
  .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb              | 5 +-
  meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb             | 3 +-
  meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb     | 7 +-
  meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb                     | 3 +-
  .../libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch | 38 +++++
  meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb            | 1 +
  meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb                | 6 +
  meta-oe/recipes-support/p910nd/p910nd_0.97.bb                   | 19 ++-
  meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb       | 6 +-
  meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb             | 2 +-
  meta-python/recipes-devtools/python/python3-gcovr_6.0.bb        | 2 +-
  meta-python/recipes-devtools/python/python3-gpiod_2.0.bb        | 6 +-
  ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 31 ++++
  .../apache2/{apache2_2.4.56.bb => apache2_2.4.57.bb} |   3 +-
  45 files changed, 476 insertions(+), 105 deletions(-)
  delete mode 100644 meta-networking/licenses/netperf
  create mode 100644 
meta-oe/recipes-bsp/fwupd/fwupd/0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch
  rename meta-oe/recipes-devtools/php/{php_8.2.4.bb => php_8.2.5.bb} (99%)
  create mode 100644 
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch
  create mode 100644 
meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
  create mode 100644 
meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
  rename meta-oe/recipes-extended/redis/{redis_7.0.10.bb => 
redis_7.0.11.bb} (96%)
  create mode 100644 
meta-oe/recipes-support/libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch
  create mode 100644 
meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb => 
apache2_2.4.57.bb} (98%)


