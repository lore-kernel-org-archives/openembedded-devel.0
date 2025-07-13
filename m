Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16489C83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 18:27:45 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.61747.1752431260529094447
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 11:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lw8XbLtX;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e8600c87293so2809446276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752431260; x=1753036060; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lf2DYLUWmeRLo/mWYKFNHVdBLvutkLCTU531joZqYNo=;
        b=Lw8XbLtXCJ8ClA7/dh7dd5Dvn12wkY4N3Zkas80q++UxMrEvMQuZ3T4QuoI/N50hJh
         r69hRjdHsPTAcMKHq7Lvqqb8Y8f7L/Ttv7rWQy3RLGOWBcOHAZ/QG8UWBw0pwZIoosXQ
         idTheWVbpa2bzNKTgkM3roopol/Y0A9zqx9074eQ2MUWIDSCG+ZI9wdaqXt3bS5QvZWf
         W/hcC2lniKJy/d2HzIT5W02OXY2DlCUEWdlx1Ssg5ZPNqACaKDq/daKevKVxmssDRjOH
         VKOZpYlNMKZ7brj+tF57RpFgLNzIdQ31dWVu49mPQe1/aOFnQX7hB0k0ymiVqXCs3out
         BipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752431260; x=1753036060;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lf2DYLUWmeRLo/mWYKFNHVdBLvutkLCTU531joZqYNo=;
        b=hHadeglVMKPXXsGuf1wvsKgDav/o0xWYkGP2tMK7G7cy48FWDyBXERsaD+ctT8fZ7q
         9+MdjeLcr5LmmWJRPRON575+GoY6MUCOBzCxuhYN1mdkTTXqXr3aQVZZXcgGSyAuKmbB
         Pe9JyqxU3AiyeFdwvLPd8HoTT5FYWWueQiCFOM/A1XSPUVlpeG/D5iRHBK5DtbLENCjq
         Ki2zxF2WuWzO7AJ1xhGrbuAO7Hu5m5By2wM/z7TaBrba3hR7TnPFmfdZJarQw8uFbZQt
         SGoQubULXad30RGsotxeoLmMeuundPHL7B0jozxqPeHdrR/tvY3SB55CLGVZTtfvATVE
         p/vg==
X-Forwarded-Encrypted: i=1; AJvYcCU/x8uRIf5pcQVT6PZ1bPWoYPtm72IpvZnmGr0kWAQq9TJ8cXtPaobuLZdiLuIe051eWied1nxjpOfxx4yKFYuZdAU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwkOwkbbxDkuYK1Jm4AEV7GDoDqzpn6Pu2LIunOC+dBtLI1Z/Mm
	MSbokUykZKYIlw7dZnV2wVhvln+Ec7GmlER7WIih8a4X2+IJHHsJnSh8
X-Gm-Gg: ASbGncsb7grtwYDrIIFjUkJpzHXwYvXmRQksniA6c1OUlAAQNbzg8JQhnmfhIo8b3su
	EFM/kSwMAFtb2nZGJ1QSNGJWK7en4RwY0nL2a/jK8OHIPNdV/g2xCxwZ7HlqRtxppn+OBZIK1Pg
	NIUGwW/6721J8QQZ2QmyIYEflgBH52bxNfatgScdmQyIW7aUzriAhvj0agYPLkdqykSQjr4VNPF
	OBzvo0fTfaYx7pTBAsqXd7bTNLjMzJPWVlvJefaPkgEEX0hoVvNyTpDj/smRbiO/EEQRVgEte3G
	FabLRk0t5GoE6aTGU331b+eqP4fb3e45HJAQHmwgMX5Fp4wBFG1YtgBjshpt5rw3ijMW6EA/nek
	S8Hj8dGOBgg2koU6kGZ6aQ/6dlOFY43cOd/i9lwYaslpM34A8n40znBllGxuMEbLhjqzlXTiMAC
	zIlTGA3ZQQ
X-Google-Smtp-Source: AGHT+IG1qxFKUdQquu3uQ5/R7IK1xmmIYYNAT6lWUxiR3dw+7DmmP0zxutO92z9J2IzMd/P+iL45xA==
X-Received: by 2002:a05:6902:5007:b0:e8b:4149:72e8 with SMTP id 3f1490d57ef6-e8b85afb592mr8437154276.31.1752431259538;
        Sun, 13 Jul 2025 11:27:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:d272:10bb:f60d:8951? ([2600:1700:45dd:7000:d272:10bb:f60d:8951])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8b7ae2a448sm2484674276.10.2025.07.13.11.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 11:27:39 -0700 (PDT)
Message-ID: <7038bb2d-09ba-48d0-9e58-0e7049d10707@gmail.com>
Date: Sun, 13 Jul 2025 14:27:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: July 13th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 18:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118514

The following changes since commit 727811eaf256b88fd135be99559f2cbf14c82fce:

   imagemagick: guard sed operations in do_install for optional files 
(2025-06-23 17:03:24 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943:

   xfce4 update HOMEPAGEs (2025-07-10 20:29:57 -0400)

----------------------------------------------------------------
Archana Polampalli (1):
       tcpreplay: fix CVE-2024-22654

Changqing Li (3):
       libblockdev: fix CVE-2025-6019
       udisks2: Hardening measure of CVE-2025-6019
       phpmyadmin: upgrade 5.2.1 -> 5.2.2

Chen Qi (2):
       protobuf: upgrade from 4.25.3 to 4.25.8
       python3-protobuf: upgrade from 4.25.3 to 4.25.8

Guocai He (3):
       python3-pylint: correct the SRC_URI
       libconfig: correct the SRC_URI
       logcheck: correct the SRC_URI

Hitendra Prajapati (1):
       libssh: fix CVE-2025-5318

J. S. (1):
       xfce4 update HOMEPAGEs

Martin Jansa (1):
       python3-h5py: backport fixes for incompatible-pointer-types issues

Roland Kovacs (1):
       jq-1.7.1: Backport multiple CVE fixes

Vijay Anusuri (1):
       wireshark: upgrade 4.2.9 -> 4.2.12

  .../tcpreplay/tcpreplay/CVE-2024-22654-0001.patch               | 90 ++++
  .../tcpreplay/tcpreplay/CVE-2024-22654-0002.patch               | 35 ++
  meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb    | 2 +
  .../wireshark/{wireshark_4.2.9.bb => wireshark_4.2.12.bb} |   8 +-
  meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch             | 233 
++++++++
  meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch             | 79 +++
  meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch             | 45 ++
  meta-oe/recipes-devtools/jq/jq_1.7.1.bb                         | 3 +
  ...1-Add-recursion-check-when-parsing-unknown-fields-in-J.patch | 794 
----------------------------
  .../protobuf/{protobuf_4.25.3.bb => protobuf_4.25.8.bb} |   3 +-
  meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch  | 31 ++
  meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb       | 1 +
  meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb           | 2 +-
  meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch       | 31 ++
  meta-oe/recipes-support/libssh/libssh_0.10.6.bb                 | 1 +
  meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch      | 51 ++
  meta-oe/recipes-support/udisks/udisks2_2.10.1.bb                | 1 +
  meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb           | 2 +-
  .../0001-Properly-cast-arguments-to-H5Lunpack_elink_val.patch   | 25 +
  .../python3-h5py/0002-Use-libc.stdint-instead-of-numpy.patch    | 25 +
  meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb      | 8 +-
  .../{python3-protobuf_4.25.3.bb => python3-protobuf_4.25.8.bb} |   2 +-
  meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb     | 2 +-
  .../phpmyadmin/{phpmyadmin_5.2.1.bb => phpmyadmin_5.2.2.bb} |   4 +-
  .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb                  | 2 +-
  .../recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb | 2 +-
  .../calculator/xfce4-calculator-plugin_0.7.2.bb                 | 2 +-
  .../recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb | 2 +-
  .../recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb | 2 +-
  .../cpugraph/xfce4-cpugraph-plugin_1.2.8.bb                     | 2 +-
  .../datetime/xfce4-datetime-plugin_0.8.3.bb                     | 2 +-
  .../diskperf/xfce4-diskperf-plugin_2.7.0.bb                     | 2 +-
  meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb | 2 +-
  .../recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb | 2 +-
  .../recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb   | 2 +-
  .../mailwatch/xfce4-mailwatch-plugin_1.3.1.bb                   | 2 +-
  .../recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb     | 2 +-
  .../recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb | 2 +-
  .../recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb    | 2 +-
  .../recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb   | 2 +-
  .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb | 2 +-
  .../smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb           | 2 +-
  .../systemload/xfce4-systemload-plugin_1.3.2.bb                 | 2 +-
  .../time-out/xfce4-time-out-plugin_1.1.3.bb                     | 2 +-
  .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb     | 2 +-
  .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb     | 2 +-
  .../recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb | 2 +-
  .../weather/xfce4-weather-plugin_0.11.1.bb                      | 2 +-
  meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb   | 2 +-
  .../archive/thunar-archive-plugin_0.5.2.bb                      | 2 +-
  .../xfce4-power-manager/xfce4-power-manager_4.18.1.bb           | 2 +-
  51 files changed, 697 insertions(+), 835 deletions(-)
  create mode 100644 
meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0001.patch
  create mode 100644 
meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0002.patch
  rename meta-networking/recipes-support/wireshark/{wireshark_4.2.9.bb 
=> wireshark_4.2.12.bb} (92%)
  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
  delete mode 100644 
meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
  rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.3.bb => 
protobuf_4.25.8.bb} (97%)
  create mode 100644 
meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch
  create mode 100644 
meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-h5py/0001-Properly-cast-arguments-to-H5Lunpack_elink_val.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-h5py/0002-Use-libc.stdint-instead-of-numpy.patch
  rename meta-python/recipes-devtools/python/{python3-protobuf_4.25.3.bb 
=> python3-protobuf_4.25.8.bb} (93%)
  rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.2.1.bb => 
phpmyadmin_5.2.2.bb} (91%)

