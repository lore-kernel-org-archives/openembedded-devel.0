Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE75C5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:46 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17464.1786726374738619330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Jhgh5PN2;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52d5bfa4bafso12076091cf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726373; x=1787331173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZekhD6Is0RsL4V0iZ0CxGuwiY6MLeNXndHK5qtOirZ0=;
        b=Jhgh5PN269k3IOFZyje0V/xVakF8gBeSuYHhwDhYeXwhWDaNLR667eQAQrnIfICGRt
         0Mi16R2Lynhqkrf0mVdT0O8dVg4Ya4nG/0SwSDZJObaINmoe5rE6lpOFssVm7V+L/fmK
         I0hWf5YjoveljeYQID+f2tI9pauawkTnhgtG0Hpq70pxgD52/YDZ8l1k5RzTDD7roNZI
         rYVBCOFvLzyis+AxUL09sTbpKF9X8f70q7gYMIr7MwALtgsqBMZiML0iohYiXL8dmAHC
         CNXlhgyMijrMcrMtSZDEZypjnuTJg2iCiThtcto/XVJZj4dZcTDElPHJ9h1Byw9GbVZw
         LlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726373; x=1787331173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZekhD6Is0RsL4V0iZ0CxGuwiY6MLeNXndHK5qtOirZ0=;
        b=I0lOvc4A+uurpNf15MIRkXejL3ESO8e5zu62AW6YLEfk3emI9/ERJquoTUvJZLF4xi
         G42KtCZNyT3EnLxXQLvB0NMxLkcuKPN+/e2YptaXxLd8wj8Xa9J/g9H54ddEfRR5Rx3a
         xy/s0fcGWJiU3f30VZjcgxXEQbKsYBH61v+NNmV+qkDexsaS6KoiZ3J0ZXSfI2otGGS3
         HGotHfNh+TU04Mt5/b4bkyzAayxekQhKintBnktrrcxFQTcZwsH81EYulS/5homNlVkN
         JDomTmR263gwy487ez7TMyK8EtHNbw/n5l7ktyncbc5QyIJ6X3mJFi/0DrQI+dg1FqBy
         3SMQ==
X-Gm-Message-State: AOJu0Yw/G/DOaQHTeDshoJ6M3NG9HwCz5E6tS98DtsqmD0YBbyhXm716
	VA8Zrj/YhJ7LOgy2Vow84CcPOlRev6TmCglxpBS/3Yc11GWdDBIWDK6MNn2Oct/H81Mk7pI8FAg
	FykQ6uyE=
X-Gm-Gg: AR+sD10x13Q+ceztialKTv5hk8lZUWu/7p78j5WnFCXv7WGeXrNDB3lna+MRCONZFS9
	MClLaFsikF2uqyaXXf3IQE6hqRW9NuNsJRZkYJ9p/8DD/IJaWGd/5850gPY6uFO610242lbxn58
	m1iD6ysQPTqTyMiAfgxripheyd1MEhK3rLQb2YGxVVCqZwSLXCzJs+o3h+eYouZmhDMuNBgB+s1
	t63QlKVmFmieuo9UQTB3vf18Kv3GN+xh041pdCJIxOPc+y0GOo3kflhlFVxBVSeyKwvZzkp4nhH
	f3AmOX0yljEgkY++9yJLNkwqnsn0aCjRxgKo/rjgqGo2/9ApFbrMtAfUOqySAht20bsTl8Tx30h
	UdVvnI9fLei5kfXm6UI+VXsefAs7c0w0BN9xfVc23e5BCfhu6AVzT90T/duSVfnaKw5TpYylv1J
	R3nkNv2tkOm5WKgonrMkDbhe0GNvv8FCEPddunP/oNhcOVWZlS7/L9Af5znLekENsR
X-Received: by 2002:ac8:58c1:0:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d8530d77dmr71478371cf.5.1786726373268;
        Fri, 14 Aug 2026 09:52:53 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d840437f0sm24576591cf.18.2026.08.14.09.52.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:52:52 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][PATCH 00/10] add bitbake-registry configs for master branch
Date: Fri, 14 Aug 2026 12:52:40 -0400
Message-ID: <20260814165250.590784-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129054

For every layer in the meta-openembedded repository, add a bitbake-registry
template for each of the "nodistro" and "poky" DISTRO configurations. These
templates are based on the default templates in the bitbake repository, but add
minimal dependencies required to support each layer. For example, the
meta-initramfs template only sets up the default layers along with itself, while
meta-networking adds meta-oe and meta-python as well. 

The first files (meta-oe and meta-python's configs) were created manually, then
Claude was used to assist in repeating the general design for other layers and
the poky distro configs.

Interactive setup can be used by running 'bitbake-setup <template_path_or_url>'
and following the prompts.

Example using '--non-interactive' flag against meta-networking with poky:

|(meta-openembedded) tgamblin@megalith ~/workspace/ypbuilds $ bitbake-setup init --non-interactive meta-python-nodistro-master/layers/meta-openembedded/meta-networking/bitbake-registry/meta-networking-poky-master.conf.json poky distro/poky machine/qemux86-64
|NOTE: Loading settings from /home/tgamblin/workspace/ypbuilds/settings.conf
|NOTE: Bitbake-setup is using /home/tgamblin/workspace/ypbuilds as top directory.
|NOTE: A site.conf file already exists. Please remove it if you would like to replace it with a default one
|NOTE: Reading configuration from local file
|    /home/tgamblin/workspace/ypbuilds/meta-python-nodistro-master/layers/meta-openembedded/meta-networking/bitbake-registry/meta-networking-poky-master.conf.json
|NOTE: Run 'bitbake-setup init --non-interactive /home/tgamblin/workspace/ypbuilds/meta-python-nodistro-master/layers/meta-openembedded/meta-networking/bitbake-registry/meta-networking-poky-master.conf.json poky di
|stro/poky machine/qemux86-64' to select this configuration non-interactively.
|
|NOTE: Setup directory /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master (as suggested by configuration) already exists, using the full name instead.
|
|Initializing a setup directory in
|    /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64
|Fetching layer/tool repositories into /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/layers
|    bitbake
|    openembedded-core
|    meta-yocto
|    meta-openembedded
|    yocto-docs
|
|Setting up bitbake configuration in
|    /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/build
|
|This bitbake configuration provides:
|    Poky - The Yocto Project testing distribution, with the meta-oe, meta-python and meta-networking layers added
|
|Usage instructions and additional information are in
|     /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/build/README
|
|To run builds, source the environment using
|    . /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/build/init-build-env
|
|Run 'bitbake-config-build enable-fragment <fragment-name>' to enable additional fragments or replace built-in ones (e.g. machine/<name> or distro/<name> to change MACHINE or DISTRO).
|
|The bitbake configuration files (local.conf, bblayers.conf and more) can be found in
|    /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/build/conf
|
|(meta-openembedded) tgamblin@megalith ~/workspace/ypbuilds $ . /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/build/init-build-env
|Poky - The Yocto Project testing distribution, with the meta-oe, meta-python and meta-networking layers added
|(meta-openembedded) tgamblin@megalith ~/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/build $ bitbake-layers show-layers
|NOTE: Starting bitbake server...
|layer                 path                                                                    priority
|========================================================================================================
|core                  /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/layers/openembedded-core/meta  5
|yoctobsp              /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/layers/meta-yocto/meta-yocto-bsp  5
|yocto                 /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/layers/meta-yocto/meta-poky  5
|openembedded-layer    /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/layers/meta-openembedded/meta-oe  5
|meta-python           /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/layers/meta-openembedded/meta-python  5
|networking-layer      /home/tgamblin/workspace/ypbuilds/meta-networking-poky-master-poky-distro_poky-machine_qemux86-64/layers/meta-openembedded/meta-networking  5

Trevor Gamblin (10):
  meta-oe: add bitbake-registry configs for nodistro, poky on master
    branch
  meta-python: add bitbake-registry configs for nodistro, poky on master
    branch
  meta-initramfs: add bitbake-registry configs for nodistro, poky on
    master branch
  meta-filesystems: add bitbake-registry configs for nodistro, poky on
    master branch
  meta-networking: add bitbake-registry configs for nodistro, poky on
    master branch
  meta-gnome: add bitbake-registry configs for nodistro, poky on master
    branch
  meta-multimedia: add bitbake-registry configs for nodistro, poky on
    master branch
  meta-perl: add bitbake-registry configs for nodistro, poky on master
    branch
  meta-webserver: add bitbake-registry configs for nodistro, poky on
    master branch
  meta-xfce: add bitbake-registry configs for nodistro, poky on master
    branch

 AI-Generated: Uses Claude Sonnet 5

 ...meta-filesystems-nodistro-master.conf.json | 59 +++++++++++++
 .../meta-filesystems-poky-master.conf.json    | 85 ++++++++++++++++++
 .../meta-gnome-nodistro-master.conf.json      | 59 +++++++++++++
 .../meta-gnome-poky-master.conf.json          | 85 ++++++++++++++++++
 .../meta-initramfs-nodistro-master.conf.json  | 56 ++++++++++++
 .../meta-initramfs-poky-master.conf.json      | 82 +++++++++++++++++
 .../meta-multimedia-nodistro-master.conf.json | 58 +++++++++++++
 .../meta-multimedia-poky-master.conf.json     | 84 ++++++++++++++++++
 .../meta-networking-nodistro-master.conf.json | 58 +++++++++++++
 .../meta-networking-poky-master.conf.json     | 84 ++++++++++++++++++
 .../meta-oe-nodistro-master.conf.json         | 56 ++++++++++++
 .../meta-oe-poky-master.conf.json             | 82 +++++++++++++++++
 .../meta-perl-nodistro-master.conf.json       | 57 ++++++++++++
 .../meta-perl-poky-master.conf.json           | 83 ++++++++++++++++++
 .../meta-python-nodistro-master.conf.json     | 57 ++++++++++++
 .../meta-python-poky-master.conf.json         | 83 ++++++++++++++++++
 .../meta-webserver-nodistro-master.conf.json  | 59 +++++++++++++
 .../meta-webserver-poky-master.conf.json      | 85 ++++++++++++++++++
 .../meta-xfce-nodistro-master.conf.json       | 61 +++++++++++++
 .../meta-xfce-poky-master.conf.json           | 87 +++++++++++++++++++
 20 files changed, 1420 insertions(+)
 create mode 100644 meta-filesystems/bitbake-registry/meta-filesystems-nodistro-master.conf.json
 create mode 100644 meta-filesystems/bitbake-registry/meta-filesystems-poky-master.conf.json
 create mode 100644 meta-gnome/bitbake-registry/meta-gnome-nodistro-master.conf.json
 create mode 100644 meta-gnome/bitbake-registry/meta-gnome-poky-master.conf.json
 create mode 100644 meta-initramfs/bitbake-registry/meta-initramfs-nodistro-master.conf.json
 create mode 100644 meta-initramfs/bitbake-registry/meta-initramfs-poky-master.conf.json
 create mode 100644 meta-multimedia/bitbake-registry/meta-multimedia-nodistro-master.conf.json
 create mode 100644 meta-multimedia/bitbake-registry/meta-multimedia-poky-master.conf.json
 create mode 100644 meta-networking/bitbake-registry/meta-networking-nodistro-master.conf.json
 create mode 100644 meta-networking/bitbake-registry/meta-networking-poky-master.conf.json
 create mode 100644 meta-oe/bitbake-registry/meta-oe-nodistro-master.conf.json
 create mode 100644 meta-oe/bitbake-registry/meta-oe-poky-master.conf.json
 create mode 100644 meta-perl/bitbake-registry/meta-perl-nodistro-master.conf.json
 create mode 100644 meta-perl/bitbake-registry/meta-perl-poky-master.conf.json
 create mode 100644 meta-python/bitbake-registry/meta-python-nodistro-master.conf.json
 create mode 100644 meta-python/bitbake-registry/meta-python-poky-master.conf.json
 create mode 100644 meta-webserver/bitbake-registry/meta-webserver-nodistro-master.conf.json
 create mode 100644 meta-webserver/bitbake-registry/meta-webserver-poky-master.conf.json
 create mode 100644 meta-xfce/bitbake-registry/meta-xfce-nodistro-master.conf.json
 create mode 100644 meta-xfce/bitbake-registry/meta-xfce-poky-master.conf.json

-- 
2.55.0


