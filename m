Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66796C27C76
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 15:13:36 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.15227.1674918808128811314
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Jan 2023 07:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FZ4l6wB4;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-16346330067so10138578fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Jan 2023 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWGgwH094hVDq9OPaAApoujeFYfS9v7E7HsCi/Hr418=;
        b=FZ4l6wB4PV9Dfb5QKxqNervPzB9D8fTdc6kU+zNMxXLjabjSuiiMFTeXtd7SNL0G9N
         FR2T0ZlUSssXVrGNxjJwNniK7hCK92nMttSAU2ZclRP7oDLTk6DVw7TKoes5f1Jybwf+
         17jJCJIszebFcwwpSFg+Pcj/HAZcv0z6BXeAb4t3ZLFfYNxKI5njNQWH4zMTMCTqW8AC
         Rz8rnF+jUemPbMxbTbJ8wCRT9I0tXniwFDi13Dfz8j1a9v7USEAMpzfc2Ea6Tc2mszj3
         iXHPkbdIEOK6U/Sacxo+4K2tqK3HWhrWHi1TPH7Rde0tClevebo0wPYX1JVf3CF06ue5
         UwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EWGgwH094hVDq9OPaAApoujeFYfS9v7E7HsCi/Hr418=;
        b=oGWDWlBGH/b7Zmp0sQfD3bunFbfQn0Qulk3+Pxfnmm84LPgupS57tg2r386qyHL7pc
         VOiGCQlFKP/bO6zs/nWPfXm1wH7RLOMj+qtR+4y4jssmbGJ6CmxB4vOxoGT0uu36OYBO
         vfvn4R9KXlfimFiz/m0paEzBAR9k/4u4ZxOx1ES+Pgaz0vy4ghWcQcmrwSscP4UOdNzy
         pyXMzQMLwXdBzUfoW0XVZUq88Isw4InptOAvAjADpShNgwbdJFAWS1z/7JnuZz2dpMZG
         4CtDW9p8eWWnnXW2SQ2QtgsIt02NWIjnuulezwr0j9giG60Ic4B0H2239opfScxJkbHp
         QETw==
X-Gm-Message-State: AFqh2krYUJS2LcGtClK9pNzeLjsZsIt8nowaJ4W2+p64VMeFaSe1+0yW
	5lxYaY3gCQPvz2dcYNNubYk=
X-Google-Smtp-Source: AMrXdXty8ATzCdw+WAXm471riqhjARi7g1VAA+mZNfwPoS5CdVBYJWjI7H70geO5+QHUv39A7Q6Oww==
X-Received: by 2002:a05:6870:6389:b0:15e:b02b:9da7 with SMTP id t9-20020a056870638900b0015eb02b9da7mr23849331oap.13.1674918807261;
        Sat, 28 Jan 2023 07:13:27 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:f329:fc42:2781:4396? ([2600:1700:9190:ba10:f329:fc42:2781:4396])
        by smtp.gmail.com with ESMTPSA id k14-20020a056870350e00b0014813cc4a51sm1927431oah.29.2023.01.28.07.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 07:13:26 -0800 (PST)
Message-ID: <e1cde7e4-9ddf-50b3-80a3-933aebdb3e34@gmail.com>
Date: Sat, 28 Jan 2023 10:13:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Langdale merge request: Jan 28th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Jan 2023 15:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100827

The following changes since commit c354f92778c1d4bcd3680af7e0fb0d1414de2344:

   chrony: Remove the libcap and nss PACKAGECONFIGs (2022-11-18 10:11:45 
-0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to f8cb46d803190bb02085c8a7d20957a71d32f311:

   perfetto: Do not pass TUNE_CCARGS to native/host compiler (2023-01-23 
10:15:33 -0500)

----------------------------------------------------------------
Alexander Stein (1):
       dool: Add patch to fix rebuild

Archana Polampalli (1):
       Nodejs - Upgrade to 16.18.1

Armin Kuster (1):
       Revert "waf-samba.bbclass: point PYTHON_CONFIG to target 
python3-config"

Changqing Li (2):
       redis: 7.0.5 -> 7.0.7
       redis: 6.2.7 -> 6.2.8

Chee Yang Lee (4):
       zsh: Fix CVE-2021-45444
       fwupd: Fix CVE-2022-3287
       redis: Upgrade to 7.0.8
       redis: Upgrade to 6.2.9

Chen Pei (1):
       botan: upgrade 2.19.2 -> 2.19.3

Chen Qi (4):
       xfce4-verve-plugin: fix do_configure faiure about missing libpcre
       networkmanager: fix dhcpcd PACKAGECONFIG
       networkmanager: install config files into correct place
       networkmanager: fix /etc/resolv.conf handling

Hermes Zhang (1):
       kernel_add_regdb: Change the task order

Kai Kang (2):
       freeradius: fix multilib systemd service start failure
       postfix: fix multilib conflict of sample-main.cf

Khem Raj (10):
       gnome-text-editor: Add missing libpcre build time depenedency
       ettercap: Add missing dependency on libpcre
       imapfilter: Upgrade to 2.7.6
       aufs-util: Fix build with large file support enabled systems
       volume-key: Inherit python3targetconfig
       audit: Inherit python3targetconfig
       waf-samba.bbclass: point PYTHON_CONFIG to target python3-config
       fontforge: Inherit python3targetconfig
       sshpass: Use SPDX identified string for GPLv2
       perfetto: Do not pass TUNE_CCARGS to native/host compiler

Markus Volk (2):
       blueman: add RDEPEND on python3-fcntl
       perfetto: pass TUNE_CCARGS to use machine tune

Martin Jansa (1):
       nss: fix SRC_URI

Mathieu Dubois-Briand (2):
       nss: Add missing CVE product
       nss: Whitelist CVEs related to libnssdbm

Omkar Patil (1):
       ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3

Preeti Sachan (1):
       fluidsynth: update SRC_URI to remove non-existing 2.2.x branch

Samuli Piippo (1):
       protobuf: stage protoc binary to sysroot

Wang Mingyu (4):
       audit: upgrade 3.0.8 -> 3.0.9
       colord: upgrade 1.4.5 -> 1.4.6
       smcroute: upgrade 2.5.5 -> 2.5.6
       openwsman: upgrade 2.7.1 -> 2.7.2

Yi Zhao (2):
       ostree: fix selinux policy rebuild error on first deployment
       strongswan: upgrade 5.9.8 -> 5.9.9

  ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} |   2 +-
  .../0001-libau-Do-not-build-LFS-version-of-readdir.patch        | 32 ++++
  meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb       | 1 +
  .../recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb   | 1 +
  meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc    | 2 +-
  meta-networking/classes/kernel_wireless_regdb.bbclass           | 2 +-
  meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb   | 1 +
  .../recipes-connectivity/freeradius/files/radiusd.service       | 3 +-
  .../recipes-connectivity/freeradius/freeradius_3.0.21.bb        | 30 ++++
  .../networkmanager/networkmanager_1.40.0.bb                     | 16 +-
  meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb    | 2 +-
  meta-networking/recipes-daemons/postfix/postfix.inc             | 2 +-
  meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb    | 1 +
  .../smcroute/{smcroute_2.5.5.bb => smcroute_2.5.6.bb} |   2 +-
  .../strongswan/{strongswan_5.9.8.bb => strongswan_5.9.9.bb} |   2 +-
  meta-oe/recipes-bsp/fwupd/fwupd/CVE-2022-3287.patch             | 218 
+++++++++++++++++++++++
  meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb                        | 4 +-
  .../recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb} |   2 +-
  .../oe-npm-cache                                                | 0
  ...oe-cache-native_16.14.bb => nodejs-oe-cache-native_16.18.bb} |   0
  ...g-native-binaries.patch => 0001-Using-native-binaries.patch} |  40 
+++--
  .../nodejs/0002-Install-both-binaries-and-use-libdir.patch      | 96 
----------
  .../nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch | 151 
----------------
  .../nodejs/{nodejs_16.14.2.bb => nodejs_16.18.1.bb} |   8 +-
  meta-oe/recipes-devtools/perfetto/perfetto.bb                   | 25 +--
  meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb            | 2 +
  .../openwsman/{openwsman_2.7.1.bb => openwsman_2.7.2.bb} |   2 +-
  ...1-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch | 44 +++++
  meta-oe/recipes-extended/ostree/ostree_2022.5.bb                | 1 +
  .../redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch   | 20 ++-
  .../redis/redis/0006-Define-correct-gregs-for-RISCV32.patch     | 15 +-
  .../recipes-extended/redis/{redis_6.2.7.bb => redis_6.2.9.bb} |   2 +-
  .../recipes-extended/redis/{redis_7.0.5.bb => redis_7.0.8.bb} |   2 +-
  meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb        | 2 +-
  meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb        | 2 +-
  .../recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb} |   4 +-
  meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch           | 60 
+++++++
  meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch           | 140 
+++++++++++++++
  meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch           | 77 
++++++++
  meta-oe/recipes-shells/zsh/zsh_5.8.bb                           | 6 +-
  meta-oe/recipes-support/colord/colord.inc                       | 4 +-
  meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch | 261 
++++++++++++++++++++++++++++
  meta-oe/recipes-support/dool/dool_1.1.0.bb                      | 1 +
  .../imapfilter/{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb} |   8 +-
  meta-oe/recipes-support/nss/nss_3.74.bb                         | 8 +-
  .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb     | 1 +
  46 files changed, 973 insertions(+), 332 deletions(-)
  rename 
meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb 
=> ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)
  create mode 100644 
meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Do-not-build-LFS-version-of-readdir.patch
  rename meta-networking/recipes-support/smcroute/{smcroute_2.5.5.bb => 
smcroute_2.5.6.bb} (90%)
  rename meta-networking/recipes-support/strongswan/{strongswan_5.9.8.bb 
=> strongswan_5.9.9.bb} (99%)
  create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/CVE-2022-3287.patch
  rename meta-oe/recipes-crypto/botan/{botan_2.19.2.bb => 
botan_2.19.3.bb} (93%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 => 
nodejs-oe-cache-16.18}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb => 
nodejs-oe-cache-native_16.18.bb} (100%)
  rename 
meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.patch 
=> 0001-Using-native-binaries.patch} (70%)
  delete mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
  delete mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
  rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb => 
nodejs_16.18.1.bb} (94%)
  rename meta-oe/recipes-extended/openwsman/{openwsman_2.7.1.bb => 
openwsman_2.7.2.bb} (98%)
  create mode 100644 
meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
  rename meta-oe/recipes-extended/redis/{redis_6.2.7.bb => 
redis_6.2.9.bb} (96%)
  rename meta-oe/recipes-extended/redis/{redis_7.0.5.bb => 
redis_7.0.8.bb} (96%)
  rename meta-oe/recipes-security/audit/{audit_3.0.8.bb => 
audit_3.0.9.bb} (97%)
  create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
  create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
  create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
  create mode 100644 
meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
  rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.5.bb => 
imapfilter_2.7.6.bb} (60%)


