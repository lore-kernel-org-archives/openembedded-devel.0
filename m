Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16106CAC5B0
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.9930.1758801819043484301
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ONN1npAA;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b33d785db6fso170657366b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801817; x=1759406617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfaf7zKWsRkJb42hWzgjMBApu0POCzjc0HZ9TnBp14A=;
        b=ONN1npAA6NQRfL6eRSyZZtU6CnsFyQORSh+iPKrAtq/wPfkZVC923HxJQdLyQvrstd
         wPmT4KV+DlZ/HLva9520cGIuHdEKH6Hhwne8Au/uRO254lFXl5Ezskchau9HryKrzLcD
         pOsfv/64tGPIcQfUK3fuVOl9UmEUvCUItTOjVu/GVrtYOOhr4/SvtMtOXr8DiygnJN1e
         +DfuD9vPT84lbqutj8SYrLs70+gp9LL2W7B1AnsaoFMRqkBxcbymZSjSWoEAVTYQO/el
         uzGG63tPlq7Vu6AJcdw3VyMD2PwSsoDqP4eMEkx65dZ9DxOyoaxz5CxRVPux7r1I5eCJ
         hX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801817; x=1759406617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfaf7zKWsRkJb42hWzgjMBApu0POCzjc0HZ9TnBp14A=;
        b=O2eYHS/I6gOppdUdxyqauBsJuUECOdtGNfo+NwopF7+3XQ07I0HbhEyzd9l4+igtZm
         H8fwpSaF5ueRGNKDkNsEDcPDfKvRWecwGjbH74Xa7Q5F3vy5jylrPgtOV/Bs3juzi9eq
         0+pogcDir/PflLGPZ1Z+tMGVmUYL+dMCA4hwq2gidk26lR9JEbaQIOzeQ+gef+Q28pHk
         NK8p25OkcPGhji3e8V7w/18oZfzcyXxbHhRl58W0/SJZMU0qBcJ6d1hFrX2eFkpcp2Zn
         +QC26eZjDAS59j1TG88NH8Tl7loAMyHW0UZW8Mkp47ny+Tez2xt4BS/V6w8dMsUYWUWh
         89IQ==
X-Gm-Message-State: AOJu0YwbAe947CjzwN8nixj66WotadHAbgvT/MczJGUYXLJaemSomVod
	J6WkCbodNmZ36hTEkm+2y97klSByOjpiALMjU307XdzQ6ZVpSnL/owNBbiDyY0NA
X-Gm-Gg: ASbGncvSE38ILVvIi2R6Btv3ivVnTuHxS8nD/2f6HmhjkXerc6AL7NjBh6WFj7eVT96
	3gIYkY1bkDDrdnxlf14Dfmx1RlV8fpXoFGKV2NubbcUGIdci9mJQP+f7kW/Sph+Ihl8mE6yQMuO
	2/o0NN2gOxqzjR/xKNC/KbGvnlyZHd/Cv4/qZ/mJrCpRbSBh2xJiuOZ27cOo/u63TeIK3VXC1rB
	LjGtowY090wuDutSzO3B6fxu/Jf5o3fYsZOAOW4qwF+y3m4n9aUfZ8bOv8yC4b8hi5xlPpwfutS
	I6Oa2x2gl90tmWrBeBcFPshkvI9rbgR9LQKVgrC0yHdToYwAzzvJ9ozRiJx6Odxv5Cb5WM0t5qs
	le8uHQ9rpmk7JbsDFhaB7ac3Yvb467/w=
X-Google-Smtp-Source: AGHT+IG+4ahV/4dVMoqmOk/KC8FIQt2DyhEQN3UhEcWB3s63AIgIgQfuRR0Doq6yJX8ysLLH2pCyGQ==
X-Received: by 2002:a17:907:9447:b0:b29:b4ac:d2a6 with SMTP id a640c23a62f3a-b34b74f4c74mr377349366b.18.1758801817058;
        Thu, 25 Sep 2025 05:03:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 00/21] Cherry-picks from Master Batch C
Date: Thu, 25 Sep 2025 14:03:12 +0200
Message-ID: <20250925120334.1670367-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119860

This is my third batch of cherry picks from master branch, that I find to be
appropriate to be in Kirkstone branch.

These include assorted recipe fixes (REQUIRED_DISTRO_FEATURES, LICENSE, DEPENDS...), and recipe
version updates. As with previous batches, I did spend time on reviewing the changelogs and commits
for the recipe updates looking for backwards incompatible changes.

This batch has so far survived a "bitbake world" build for arm, aarch64, x86 and x86-64.

Your review and comments on this batch would be very helpful.

Thank you.

---

Gyorgy Sarvari (3):
  ibus: missing installed file w/ gtk2 PACKAGECONFIG
  keybinder: set correct license
  libdvbcsa: set correct LICENSE

Khem Raj (7):
  ibus: Point python interpreter to target location
  dracut: Do not undefine _FILE_OFFSET_BITS
  libdc1394: upgrade 2.2.6 -> 2.2.7
  libdvdcss: upgrade 1.4.2 -> 1.4.3
  libdvbpsi: upgrade 1.3.0 -> 1.3.3
  libmediaart-2.0: upgrade 1.9.5 -> 1.9.6
  dhcp-relay: Pass cross configure flags to bind build

Mingli Yu (2):
  ibus: add opengl related check
  gssdp: check opengl is enabled or not

Peter Kjellerstedt (1):
  autossh: Correct the license information

Peter Marko (1):
  opusfile: patch CVE-2022-47021

Wang Mingyu (1):
  colord-gtk: upgrade 0.3.0 -> 0.3.1

Yi Zhao (2):
  grubby: fix syntax for ALTERNATIVE
  dhcp-relay: upgrade 4.4.3 -> 4.4.3-P1

Zhang Xiao (1):
  dhcp-relay: dev subpackage conflicts with bind-dev

alperak (2):
  libupnp: upgrade 1.14.6 -> 1.14.18
  opencore-amr: upgrade 0.1.3 -> 0.1.6

wangmy (1):
  zenity: upgrade 3.42.0 -> 3.42.1

 .../{zenity_3.42.0.bb => zenity_3.42.1.bb}    |   2 +-
 ...olord-gtk_0.3.0.bb => colord-gtk_0.3.1.bb} |   2 +-
 meta-gnome/recipes-support/ibus/ibus.bb       |   7 +-
 meta-gnome/recipes-support/ibus/ibus.inc      |   3 +
 .../keybinder/keybinder_3.0.bb                |   2 +-
 ...stall-Do-not-undef-_FILE_OFFSET_BITS.patch |  32 +++++
 .../recipes-devtools/dracut/dracut_056.bb     |   1 +
 .../recipes-devtools/grubby/grubby_git.bb     |   2 +-
 .../gupnp/gssdp_1.4.0.1.bb                    |   6 +-
 ...ead_mutexattr_gettype-pthread_mutexa.patch |  42 ------
 .../{libupnp_1.14.6.bb => libupnp_1.14.18.bb} |   3 +-
 ...{libdc1394_2.2.6.bb => libdc1394_2.2.7.bb} |   3 +-
 .../libdvbcsa/libdvbcsa_1.1.0.bb              |   2 +-
 ...{libdvbpsi_1.3.0.bb => libdvbpsi_1.3.3.bb} |   3 +-
 ...ore-amr_0.1.3.bb => opencore-amr_0.1.6.bb} |   6 +-
 .../opusfile/opusfile/CVE-2022-47021.patch    |  44 +++++++
 .../opusfile/opusfile_0.12.bb                 |   2 +
 ...{libdvdcss_1.4.2.bb => libdvdcss_1.4.3.bb} |   3 +-
 ...-2.0_1.9.5.bb => libmediaart-2.0_1.9.6.bb} |   2 +-
 .../autossh/autossh_1.4g.bb                   |   5 +-
 ...p-relay_4.4.3.bb => dhcp-relay_4.4.3p1.bb} |  20 ++-
 .../dhcp/files/CVE-2022-2928.patch            | 120 ------------------
 .../dhcp/files/CVE-2022-2929.patch            |  40 ------
 23 files changed, 120 insertions(+), 232 deletions(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.42.0.bb => zenity_3.42.1.bb} (88%)
 rename meta-gnome/recipes-support/colord-gtk/{colord-gtk_0.3.0.bb => colord-gtk_0.3.1.bb} (89%)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.6.bb => libupnp_1.14.18.bb} (87%)
 rename meta-multimedia/recipes-multimedia/libdc1394/{libdc1394_2.2.6.bb => libdc1394_2.2.7.bb} (84%)
 rename meta-multimedia/recipes-multimedia/libdvbpsi/{libdvbpsi_1.3.0.bb => libdvbpsi_1.3.3.bb} (75%)
 rename meta-multimedia/recipes-multimedia/opencore-amr/{opencore-amr_0.1.3.bb => opencore-amr_0.1.6.bb} (59%)
 create mode 100644 meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
 rename meta-multimedia/recipes-multimedia/vlc/{libdvdcss_1.4.2.bb => libdvdcss_1.4.3.bb} (76%)
 rename meta-multimedia/recipes-support/libmediaart/{libmediaart-2.0_1.9.5.bb => libmediaart-2.0_1.9.6.bb} (90%)
 rename meta-networking/recipes-connectivity/dhcp/{dhcp-relay_4.4.3.bb => dhcp-relay_4.4.3p1.bb} (78%)
 delete mode 100644 meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
 delete mode 100644 meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch


