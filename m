Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25F0C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 12:57:58 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.25604.1684501075817253995
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 05:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QilOntnH;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-561d611668eso40766577b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684501075; x=1687093075;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfryUO2J6W+4dd0qGvzbsTounRbVjJpU1ZWs2PpK0K4=;
        b=QilOntnHno0ZXUZQkNXhY0pqyC63Kf6BhKc0+/vMGsLutQkJuxCZRQ582rbOQ7ymiv
         PWnvVCvuMF0Tl+O896Q27XtAohom6DadQdRXuKLvP60dk8IiylR8ce8oj4wwzrVegOgn
         wKP7HxBLS1u24s6SAhZ9kc4Pjp85qfTJrrgdfE3QTrm5mzE0xgdq+cW7r9T51eY7FHld
         TgKyScDck7Fq5RcEDzZTwV9TnOeu8xUMy3aGTAoeQqZQl4hbpB17Z3QrkCJv2UdQ1fdz
         XpYEcuBCN47xts1drLqdYW8VU2bjioFXyMpuMT4Gdlo+x8v/O7qes8Fw4+g9XLPvj9Fh
         K8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684501075; x=1687093075;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jfryUO2J6W+4dd0qGvzbsTounRbVjJpU1ZWs2PpK0K4=;
        b=jB7tMM/PZ+wLCCxhiJHJoJi6/r8F0fxbWEJKrK32T8P/PrDhj/G21gsO1b3bbtKPtp
         9sWewhShGcwadLbAlyWFvsaEHYIjZu4R3avyvvqtAo3H9rBE7g5yNqZYQ4VsvjN7DqgR
         vGF1hvqhStHumVYPhf9VDmWIWrJY0H7ldtcTB8oBoxLrX34SjV5T4xBuYT0WS3mYs+JC
         +IFRq3rMNxn7RZI1Een94Cl1FNiNzKT8gTM2oAi09OHyDPbRQweWv2m94HpucU7mBz22
         Y/uFYmIx+XbTgwvSDzI/wMdFiCnPDtea5L4DX9mA19S/g9xvPPqQZUVzFSueerAYrq57
         X4jQ==
X-Gm-Message-State: AC+VfDzCBzd5mK7ETw4iiN2SXeNlFA1Ouv9soiAIorvYI1k+PhMdws14
	IK/N+tkURpYhavVib984kCI=
X-Google-Smtp-Source: ACHHUZ5AwTnuCCs0L1S/tVlAEJ5VBnqxEOTbUhCauYCMcygcD3kRxO0QP3MbCJSmFRifh+4llzAYAw==
X-Received: by 2002:a81:c247:0:b0:55a:20a1:4ba6 with SMTP id t7-20020a81c247000000b0055a20a14ba6mr1775814ywg.25.1684501074828;
        Fri, 19 May 2023 05:57:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:4d1d:cc38:139f:3d91? ([2600:1700:9190:ba10:4d1d:cc38:139f:3d91])
        by smtp.gmail.com with ESMTPSA id h15-20020a81b40f000000b0055aafcef659sm1145038ywi.5.2023.05.19.05.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 05:57:54 -0700 (PDT)
Message-ID: <400ca12b-5176-d872-3314-1dfed4de43e7@gmail.com>
Date: Fri, 19 May 2023 08:57:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickeldore merge request: May 19th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 12:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102672

The following changes since commit 54b177f4acb3048d21a68f180fc183d0fdf47a94:

   meta-networking/licenses/netperf: remove unused license (2023-05-08 
08:03:30 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to c032fd0b1a9d444711103c2703dfa8e2964a3865:

   redis: upgrade 6.2.11 -> 6.2.12 (2023-05-16 07:32:31 -0400)

----------------------------------------------------------------
Changqing Li (1):
       redis: upgrade 6.2.11 -> 6.2.12

Martin Jansa (14):
       libreport: add dependency on libarchive
       libxmlb: add missing dependency on glib-2.0 and xz
       geoclue: fix build without gobject-introspection-data
       appstream: fix build without gobject-introspection-data
       ostree: fix build without gobject-introspection-data
       rdfind: fix build with -Werror=return-type
       spice-gtk: respect gobject-introspection-data
       cpulimit: fix do_install with multilib
       libnfs: fix installed-vs-shipped issues with multilib
       btrfsmaintenance: install to ${datadir}/${BPN}
       libtomcrypt: pass LIBPATH to fix installed-vs-shipped with multilib
       nanopb: fix installed-vs-shipped with multilib
       nv-codec-headers: fix installed-vs-shipped with multilib
       zfs: fix installation paths for multilib

  meta-filesystems/recipes-filesystems/zfs/zfs_2.1.9.bb           | 36 
++++++++++------
  .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb      | 4 +-
  .../nv-codec-headers/nv-codec-headers_12.0.16.0.bb              | 2 +-
  meta-networking/recipes-support/spice/spice-gtk_0.42.bb         | 9 +++-
  ...1-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch | 67 
+++++++++++++++++++++++++++++
  .../meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb         | 6 ++-
  ...1-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch | 61 
++++++++++++++++++++++++++
  meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb             | 4 +-
  meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb        | 2 +-
  meta-oe/recipes-extended/libreport/libreport_2.17.8.bb          | 2 +-
  meta-oe/recipes-extended/ostree/ostree_2023.2.bb                | 3 ++
  .../recipes-extended/redis/{redis_6.2.11.bb => redis_6.2.12.bb} |  2 +-
  meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb                 | 2 +
  ...1-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch | 30 
+++++++++++++
  meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb             | 4 +-
  meta-oe/recipes-support/appstream/appstream_0.16.1.bb           | 2 +-
  meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb                | 4 +-
  .../rdfind/0001-configure.ac-fix-C-11-support-check.patch       | 37 
++++++++++++++++
  meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb                  | 1 +
  19 files changed, 251 insertions(+), 27 deletions(-)
  create mode 100644 
meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch
  create mode 100644 
meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch
  rename meta-oe/recipes-extended/redis/{redis_6.2.11.bb => 
redis_6.2.12.bb} (96%)
  create mode 100644 
meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch
  create mode 100644 
meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-11-support-check.patch


