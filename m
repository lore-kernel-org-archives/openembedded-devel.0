Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5185DC54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.44964.1674653488006792407
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OU8ZuoWI;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id r1-20020a4a3701000000b004f2b4f8200eso3141516oor.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPZxer+ZqJwyKmrcxLATKcPfcvqJuwoRdv5SsOFg8aM=;
        b=OU8ZuoWIi5YdC1GSETUyaUaHLxDfgNhH1bd1f2XDFneprF1pEJzSLq0PJNyL3MSwsn
         CWldzuDVtKShmxsdm4RSGWKYmHpbPhjPmtInfobUVNbch5qaAZTzrA8txRxRMNxF/xy9
         F+FtvG/S+3nRmMHqzG6aGP+of9s7BDErwJlQPOsvBygiTXup5sFoV925Xl+OnMtpTWcv
         lfvyccPQKM2lRT6VnbNLwANiS4XGYjlljBerwbqpVqfTS88S9nO1i0DsGfPmW8caOas7
         gqS1cIwqwIF57H3g7xgdF3P+aEmXgiaWQCCc5JKTTGTXjA7IaonwPbzZNk2t2rWHQslH
         ghfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPZxer+ZqJwyKmrcxLATKcPfcvqJuwoRdv5SsOFg8aM=;
        b=vBfOWWpv8pRE4MiAV42reSrBi796a24yIlFJN4jPBwb8qVQEk2OiiFfSujO+WwbFMT
         Ap+FnRHke8wzrTR67GPqwTnlDEEjNREaw+/oHDb2QMyPaRImQ0eylQMFV+ZOB0055Ti/
         /lcIS1rWldZsnCUNVAyuCZ91DRyqpFg0pjvIztt/BEbiqsuYzoDIxSHYSEj2qKX/D2SK
         E6gDwlcs9S++o+keyw9KBuvVjGfWOSC+AvYXiN0/FVEVnRPM2VlPo7dzdzPzrMQBG568
         VHTcedFldAetuJZPYR6ZA9HNIqjiP8LWEW95W6BWdU9CRSimx7rvZBlzig7YZedQdLo8
         4MQg==
X-Gm-Message-State: AFqh2kqfz7kKfHpky3+JnrfkNLIKvedtbYEBbF9B94rrlHCG6RWA3HBG
	oDmeN/x/Iah2SSjy22R/aTDFbEkM5/Q=
X-Google-Smtp-Source: AMrXdXsC0Xy7SFF7RCUWiZ8SnOguJ3wnd84oAaDiMdpejV9iYgaerw7b/Cfq4s74TtF38UwDfP1THQ==
X-Received: by 2002:a4a:1843:0:b0:4f2:8fa2:acda with SMTP id 64-20020a4a1843000000b004f28fa2acdamr13702588ooo.5.1674653486991;
        Wed, 25 Jan 2023 05:31:26 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 00/41] Patch review 
Date: Wed, 25 Jan 2023 08:30:42 -0500
Message-Id: <cover.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100735

Please review and have comments back by Friday.

The following changes since commit c354f92778c1d4bcd3680af7e0fb0d1414de2344:

  chrony: Remove the libcap and nss PACKAGECONFIGs (2022-11-18 10:11:45 -0500)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/langdale-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/langdale-nut

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

 ...5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} |   2 +-
 ...-Do-not-build-LFS-version-of-readdir.patch |  32 +++
 .../recipes-utils/aufs-util/aufs-util_git.bb  |   1 +
 .../gnome-text-editor_42.2.bb                 |   1 +
 .../fluidsynth/fluidsynth.inc                 |   2 +-
 .../classes/kernel_wireless_regdb.bbclass     |   2 +-
 .../blueman/blueman_2.3.4.bb                  |   1 +
 .../freeradius/files/radiusd.service          |   3 +-
 .../freeradius/freeradius_3.0.21.bb           |  30 ++
 .../networkmanager/networkmanager_1.40.0.bb   |  16 +-
 .../sshpass/sshpass_1.09.bb                   |   2 +-
 .../recipes-daemons/postfix/postfix.inc       |   2 +-
 .../ettercap/ettercap_0.8.3.1.bb              |   1 +
 .../{smcroute_2.5.5.bb => smcroute_2.5.6.bb}  |   2 +-
 ...trongswan_5.9.8.bb => strongswan_5.9.9.bb} |   2 +-
 .../fwupd/fwupd/CVE-2022-3287.patch           | 218 +++++++++++++++
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb      |   4 +-
 .../{botan_2.19.2.bb => botan_2.19.3.bb}      |   2 +-
 .../oe-npm-cache                              |   0
 ....14.bb => nodejs-oe-cache-native_16.18.bb} |   0
 ...patch => 0001-Using-native-binaries.patch} |  40 +--
 ...Install-both-binaries-and-use-libdir.patch |  96 -------
 ...5-add-openssl-legacy-provider-option.patch | 151 ----------
 .../{nodejs_16.14.2.bb => nodejs_16.18.1.bb}  |   8 +-
 meta-oe/recipes-devtools/perfetto/perfetto.bb |  25 +-
 .../protobuf/protobuf_3.21.5.bb               |   2 +
 ...{openwsman_2.7.1.bb => openwsman_2.7.2.bb} |   2 +-
 ...uild-selinux-policy-on-first-deploym.patch |  44 +++
 .../recipes-extended/ostree/ostree_2022.5.bb  |   1 +
 ...006-Define-correct-gregs-for-RISCV32.patch |  20 +-
 ...006-Define-correct-gregs-for-RISCV32.patch |  15 +-
 .../redis/{redis_6.2.7.bb => redis_6.2.9.bb}  |   2 +-
 .../redis/{redis_7.0.5.bb => redis_7.0.8.bb}  |   2 +-
 .../volume_key/volume-key_0.3.12.bb           |   2 +-
 .../fontforge/fontforge_20220308.bb           |   2 +-
 .../audit/{audit_3.0.8.bb => audit_3.0.9.bb}  |   4 +-
 .../zsh/zsh/CVE-2021-45444_1.patch            |  60 ++++
 .../zsh/zsh/CVE-2021-45444_2.patch            | 140 ++++++++++
 .../zsh/zsh/CVE-2021-45444_3.patch            |  77 ++++++
 meta-oe/recipes-shells/zsh/zsh_5.8.bb         |   6 +-
 meta-oe/recipes-support/colord/colord.inc     |   4 +-
 .../dool/dool/0001-Fix-rename-in-docs.patch   | 261 ++++++++++++++++++
 meta-oe/recipes-support/dool/dool_1.1.0.bb    |   1 +
 ...mapfilter_2.7.5.bb => imapfilter_2.7.6.bb} |   8 +-
 meta-oe/recipes-support/nss/nss_3.74.bb       |   8 +-
 .../verve/xfce4-verve-plugin_2.0.1.bb         |   1 +
 46 files changed, 973 insertions(+), 332 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Do-not-build-LFS-version-of-readdir.patch
 rename meta-networking/recipes-support/smcroute/{smcroute_2.5.5.bb => smcroute_2.5.6.bb} (90%)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.8.bb => strongswan_5.9.9.bb} (99%)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/CVE-2022-3287.patch
 rename meta-oe/recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb} (93%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 => nodejs-oe-cache-16.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb => nodejs-oe-cache-native_16.18.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.patch => 0001-Using-native-binaries.patch} (70%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb => nodejs_16.18.1.bb} (94%)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.7.1.bb => openwsman_2.7.2.bb} (98%)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
 rename meta-oe/recipes-extended/redis/{redis_6.2.7.bb => redis_6.2.9.bb} (96%)
 rename meta-oe/recipes-extended/redis/{redis_7.0.5.bb => redis_7.0.8.bb} (96%)
 rename meta-oe/recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb} (97%)
 create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
 create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
 create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
 create mode 100644 meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb} (60%)

-- 
2.25.1


