Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF43C27C44
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 20:56:12 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.68176.1717361771500015566
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jun 2024 13:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g5ICmNWL;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dfa48f505a3so3757325276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717361770; x=1717966570; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71dqtdjBp16LD8J7fO9FCTHgpahuBOfGNfqv7Eu1g6w=;
        b=g5ICmNWLVoJ/GF+IiOGoPOGSlDrsAVt1TRNQOXx7hD+ZioON0G+FHc8dm0sab8VhdV
         dNLrz9+qn8cvrKj8n2+9z5+m8GykQs7JxaZoOsEyQTMLNutW9Aty99pR5hAko4WZdVdX
         klAiawG3K4/2/CoWM5BHFpkIahs+XcBTywFwzHQ9E9YszRgWOiYrmRIFqto1mNrOj87h
         EEhUDlvtFQ7CP/qSW27H3gDxA0yh6eiHF9YPZRUt0slpVcb83yNe9ZK6qwhXsDvk+vFv
         ZYQhHU/6pREgPkdvmbSTe7swPB/zyj9642yzrK3uJhPoK/UmXhcpLwSbYzeSs6ObcPnc
         Xpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717361770; x=1717966570;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71dqtdjBp16LD8J7fO9FCTHgpahuBOfGNfqv7Eu1g6w=;
        b=Xyro7j8jmvUKvY0pzOaKJN/XL1q3LRvv/yWRxBhKuBr/FGlU+pEqQN/qVRanT8Yndr
         bdjr0x4TX/NNAMGq0yTm5RCA2lQCd0lrdv8MYi4bgXr5MBri1sKF+K29ibypnXEasHxF
         tpoGz4qbpSI4hDujLFHE/4lyF8+DY1NbUwgfCXH82NyOgsr2SGWxseJytL2CBylU04FS
         1a8alfynXR37mckNLaLtRfWZalU14ZKRH/+v4DIq6JxbdC+IrOyMLejHK7KWUkeRDfs4
         W0YdL6KhWIJYzVnG5+XUSSYLzoxgLjdcl4rsWvmoJDrnLLQGX5NwYqWp6bJj3QRAIOXw
         qT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZWw3khipvqfFLqYUOzUU60jkHyz1rw1APfS9sFXNDFT9xwE7Qkgly3hlf9gvdlsnY6lHmlpuFHSCnR6FtTZku1KjgemG1V8pNn3+hS4jRujZjJABT6WGbgw==
X-Gm-Message-State: AOJu0YyAIIwC4MttZgGDsEe94wn9OCVdKSjUBDmj24NqKMHd5c89fLuZ
	F79Rv843/5uAIx20Gf5POwQJaM/JRjr948iNHzJrptIu+nJycf7G
X-Google-Smtp-Source: AGHT+IExvTPAXFyHFDp1k79CVa8g+5d2vsmaVBhkO6bsF+9DN03Rjc9FeLvBK0FXzWL6IZTgb80mAA==
X-Received: by 2002:a25:8203:0:b0:de4:738b:c2e4 with SMTP id 3f1490d57ef6-dfa73c451b3mr6707531276.28.1717361770469;
        Sun, 02 Jun 2024 13:56:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000::29? ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa6f11d729sm1349324276.50.2024.06.02.13.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 13:56:09 -0700 (PDT)
Message-ID: <3c8e03bc-511f-4669-8062-c00d49a86140@gmail.com>
Date: Sun, 2 Jun 2024 16:56:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Scarthgap merge request: June 2nd
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 20:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110664

The following changes since commit 6de0ab744341ad61b0661aa28d78dc6767ce0786:

   nodejs-oe-cache: fix offline install of dependencies (2024-05-22 
12:44:19 -0700)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 4a7bb77f7ebe0ac8be5bab5103d8bd993e17e18d:

   pcapplusplus: Fix build with gcc14 (2024-06-02 14:57:06 -0400)

----------------------------------------------------------------
Changqing Li (1):
       fuse3: remove sysv init script and install fuse kernel module 
explictly

Khem Raj (1):
       pcapplusplus: Fix build with gcc14

Markus Volk (1):
       flatpak: update 1.15.6 -> 1.15.8

Martin Jansa (1):
       libdeflate: fix build with -mcpu=cortex-a76+crypto without 
-march=armv8.2-a+crypto

Mikko Rapeli (1):
       fwupd: fix uefi capsule update build error

Peter Marko (1):
       gnome-shell: correct regression with glib-2.0 2.78.5

Soumya Sambu (1):
       php: Upgrade to 8.2.18

Wang Mingyu (1):
       postgresql: upgrade 16.2 -> 16.3

Yi Zhao (2):
       libtevent: upgrade 0.16.0 -> 0.16.1
       samba: upgrade 4.19.5 -> 4.19.6

Yoann Congal (1):
       squid: workaround a build failure with native gcc10

  meta-filesystems/recipes-support/fuse/fuse3/fuse3.conf          | 1 +
  meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb           | 15 
++++++++
  .../0002-screencast-Correct-expected-bus-name-for-streams.patch | 38 
+++++++++++++++++++
  meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb        | 1 +
  .../samba/{samba_4.19.5.bb => samba_4.19.6.bb} |  2 +-
  meta-networking/recipes-daemons/squid/squid_6.9.bb              | 5 +++
  .../libtevent/{libtevent_0.16.0.bb => libtevent_0.16.1.bb} |  2 +-
  meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb                       | 2 +-
  .../pcapplusplus/0001-initialize-timespec-variable.patch        | 35 
++++++++++++++++++
  ...1-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch | 34 
+++++++++++++++++
  meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb | 5 ++-
  .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
  meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch    | 2 +-
  .../postgresql/{postgresql_16.2.bb => postgresql_16.3.bb} |  2 +-
  .../php/php/0001-ext-opcache-config.m4-enable-opcache.patch     | 21 
++++++-----
  meta-oe/recipes-devtools/php/{php_8.2.16.bb => php_8.2.18.bb} |  2 +-
  .../0001-meson.build-require-for-native-wayland-scanner.patch   | 28 
--------------
  .../flatpak/0001-meson.build-require-native-gtkdoc.patch        | 33 
-----------------
  .../flatpak/{flatpak_1.15.6.bb => flatpak_1.15.8.bb} |  6 +--
  ...1-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch | 57 
+++++++++++++++++++++++++++++
  meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb          | 5 ++-
  21 files changed, 215 insertions(+), 83 deletions(-)
  create mode 100644 meta-filesystems/recipes-support/fuse/fuse3/fuse3.conf
  create mode 100644 
meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-streams.patch
  rename meta-networking/recipes-connectivity/samba/{samba_4.19.5.bb => 
samba_4.19.6.bb} (99%)
  rename meta-networking/recipes-support/libtevent/{libtevent_0.16.0.bb 
=> libtevent_0.16.1.bb} (95%)
  create mode 100644 
meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
  create mode 100644 
meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.2.bb => 
postgresql_16.3.bb} (86%)
  rename meta-oe/recipes-devtools/php/{php_8.2.16.bb => php_8.2.18.bb} (99%)
  delete mode 100644 
meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-require-for-native-wayland-scanner.patch
  delete mode 100644 
meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-require-native-gtkdoc.patch
  rename meta-oe/recipes-extended/flatpak/{flatpak_1.15.6.bb => 
flatpak_1.15.8.bb} (92%)
  create mode 100644 
meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch


