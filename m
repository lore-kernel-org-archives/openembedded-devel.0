Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29229C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:12 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.46792.1673191267234787307
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y0vKh/JJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id o66so5170688oia.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTXZhlOEZhDsD4Q676seIaK+ApbuvzkZRYqqn/Xa6nY=;
        b=Y0vKh/JJEQAzD3GRyMIyNuTrzExKNYoDHcjs9k/zY2TgY6RZ3ggRDS+Z7Mf4jVFmcP
         V28BYk5iKWSb2SCHbkfcLdY4xgmRZYtB/GWx76aUusC4wQuaNkgpZM0HmINl2FTtpmjf
         5moPPqMiF22PxFXeix8dB5unUJmt/gMD13fONCymP+WwCIR/kDUctxp6E9xh4JkXt3U3
         YKyU0/bUXnB+Nsz7ZlDPQsPoaIi6EZ06ZzR1bK9d559Ul+RKe1w2FkbR3SWRvxjcE/3a
         i679EkdDlvE+192vElcE/SMg7OhltXGK3Ac8Tml6o9RIhZ5MJJE2pRmnykI956lehNb+
         t5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTXZhlOEZhDsD4Q676seIaK+ApbuvzkZRYqqn/Xa6nY=;
        b=dNr7XPUf4T2o81H8u5KM9dYOFAnV+uolO8c8CuxDs0Lf4EsZBLz0i5IeCa0SdKeGAN
         9FxLwyZjrLG3r9rjWKfR0t/hzesvf15S6SgHnVyhy/nf/c0WywpBHaMQi3YnPq1sAd+O
         GNF5ZxGAa0J46FxjKGTunRVHXyDZJ8uUimZTERRU8SwFDHC0sGK/hvJ7fPR0TAbCg6H9
         V3BF98ZxJynlnjatVgqthyUjyVNEBk0NJcI/D0BR/M/gZPltb9YZeB1FdFPrzd1K7apS
         7Omkh8lsp6E0CSYjPEyhjdJp51Vx/4ScjisNwdZdDoQ6UrYwXnbIVXbitjeAumBZWAIt
         Uxxw==
X-Gm-Message-State: AFqh2kqzl/BDhnCzwVAKygB79K1Wpoxknuqna5pyjxG2W55IxxJLw0BX
	MUcL40iNeX60dwn7w69bblKnTcBbuBU=
X-Google-Smtp-Source: AMrXdXtvDJ3CVWRoY72TDhmn9pslBdjAZBWAcHLZbO6F35Y9WZcskxFE+1m04V4f/qiANWrnK8EYgg==
X-Received: by 2002:a05:6808:d4b:b0:35b:ae91:db53 with SMTP id w11-20020a0568080d4b00b0035bae91db53mr46473085oik.42.1673191266287;
        Sun, 08 Jan 2023 07:21:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 00/26] Patch review Jan 8th
Date: Sun,  8 Jan 2023 10:20:35 -0500
Message-Id: <cover.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100445

Please have comments back by Tuesday.

The following changes since commit c354f92778c1d4bcd3680af7e0fb0d1414de2344:

  chrony: Remove the libcap and nss PACKAGECONFIGs (2022-11-18 10:11:45 -0500)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/langdale-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/langdale-nut

Alexander Stein (1):
  dool: Add patch to fix rebuild

Archana Polampalli (1):
  Nodejs - Upgrade to 16.18.1

Chen Pei (1):
  botan: upgrade 2.19.2 -> 2.19.3

Chen Qi (3):
  xfce4-verve-plugin: fix do_configure faiure about missing libpcre
  networkmanager: fix dhcpcd PACKAGECONFIG
  networkmanager: install config files into correct place

Kai Kang (2):
  freeradius: fix multilib systemd service start failure
  postfix: fix multilib conflict of sample-main.cf

Khem Raj (8):
  gnome-text-editor: Add missing libpcre build time depenedency
  ettercap: Add missing dependency on libpcre
  imapfilter: Upgrade to 2.7.6
  aufs-util: Fix build with large file support enabled systems
  volume-key: Inherit python3targetconfig
  audit: Inherit python3targetconfig
  waf-samba.bbclass: point PYTHON_CONFIG to target python3-config
  fontforge: Inherit python3targetconfig

Markus Volk (1):
  blueman: add RDEPEND on python3-fcntl

Martin Jansa (1):
  nss: fix SRC_URI

Mathieu Dubois-Briand (2):
  nss: Add missing CVE product
  nss: Whitelist CVEs related to libnssdbm

Omkar Patil (1):
  ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3

Samuli Piippo (1):
  protobuf: stage protoc binary to sysroot

Wang Mingyu (3):
  audit: upgrade 3.0.8 -> 3.0.9
  colord: upgrade 1.4.5 -> 1.4.6
  smcroute: upgrade 2.5.5 -> 2.5.6

Yi Zhao (1):
  ostree: fix selinux policy rebuild error on first deployment

 ...5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} |   2 +-
 ...-Do-not-build-LFS-version-of-readdir.patch |  32 +++
 .../recipes-utils/aufs-util/aufs-util_git.bb  |   1 +
 .../gnome-text-editor_42.2.bb                 |   1 +
 meta-networking/classes/waf-samba.bbclass     |   1 +
 .../blueman/blueman_2.3.4.bb                  |   1 +
 .../freeradius/files/radiusd.service          |   3 +-
 .../freeradius/freeradius_3.0.21.bb           |  30 ++
 .../networkmanager/networkmanager_1.40.0.bb   |   6 +-
 .../recipes-daemons/postfix/postfix.inc       |   2 +-
 .../ettercap/ettercap_0.8.3.1.bb              |   1 +
 .../{smcroute_2.5.5.bb => smcroute_2.5.6.bb}  |   2 +-
 .../{botan_2.19.2.bb => botan_2.19.3.bb}      |   2 +-
 .../oe-npm-cache                              |   0
 ....14.bb => nodejs-oe-cache-native_16.18.bb} |   0
 ...patch => 0001-Using-native-binaries.patch} |  40 +--
 ...Install-both-binaries-and-use-libdir.patch |  96 -------
 ...5-add-openssl-legacy-provider-option.patch | 151 ----------
 .../{nodejs_16.14.2.bb => nodejs_16.18.1.bb}  |   8 +-
 .../protobuf/protobuf_3.21.5.bb               |   2 +
 ...uild-selinux-policy-on-first-deploym.patch |  44 +++
 .../recipes-extended/ostree/ostree_2022.5.bb  |   1 +
 .../volume_key/volume-key_0.3.12.bb           |   2 +-
 .../fontforge/fontforge_20220308.bb           |   2 +-
 .../audit/{audit_3.0.8.bb => audit_3.0.9.bb}  |   4 +-
 meta-oe/recipes-support/colord/colord.inc     |   4 +-
 .../dool/dool/0001-Fix-rename-in-docs.patch   | 261 ++++++++++++++++++
 meta-oe/recipes-support/dool/dool_1.1.0.bb    |   1 +
 ...mapfilter_2.7.5.bb => imapfilter_2.7.6.bb} |   8 +-
 meta-oe/recipes-support/nss/nss_3.74.bb       |   8 +-
 .../verve/xfce4-verve-plugin_2.0.1.bb         |   1 +
 31 files changed, 431 insertions(+), 286 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Do-not-build-LFS-version-of-readdir.patch
 rename meta-networking/recipes-support/smcroute/{smcroute_2.5.5.bb => smcroute_2.5.6.bb} (90%)
 rename meta-oe/recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb} (93%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 => nodejs-oe-cache-16.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb => nodejs-oe-cache-native_16.18.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.patch => 0001-Using-native-binaries.patch} (70%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb => nodejs_16.18.1.bb} (94%)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
 rename meta-oe/recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb} (97%)
 create mode 100644 meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb} (60%)

-- 
2.25.1


