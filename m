Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97900EEB583
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 09:35:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.13861.1694252123766168565
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 02:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PNFLXL7m;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-403012f27e1so5209035e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 02:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694252121; x=1694856921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpi4av69vDW/pmOo2EepZzFicVP0mMo483ZyvVzotbs=;
        b=PNFLXL7mIR9Dq8gLvNzj6FtDvuhRH4JJ6w/Aub+H7cSURaJyrhOx0tA4fKxKSYGDjJ
         u2+o6LnVot8ls4HXc3VlPH3TeW+jhumzjIZpTP+bUDmFyP+9+Yo7d8Q/2lIdL89lE0O5
         dTyVs2OdtYoZWpbXnNQ+VK8xH6h9EeAfrnkjvkhNAshkN477KHVWmiHkx3DaJvWeJoXR
         SUdcJyhQdcfj03LX5vIr24jt4XLg1ALm+srmP5LdhN/GPk5JK7p/K1I4s4imZTRbgWA5
         8V0qfVVycMNWhLuhPhK5Gz8fosPgp6o6+VMOBZ/b+BIHFU/qW9956b+5evbJosNJAjlj
         iSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694252121; x=1694856921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpi4av69vDW/pmOo2EepZzFicVP0mMo483ZyvVzotbs=;
        b=Ne052qTJyseKwO1b1KXXXkIh4IvVXK+u/2tKYoG19SOZgm8QhNcuMQ28P2N247s1rV
         vCY5IKD13oa4g1XdjBNGlI7tPSWD9BTBKE0up2v8cZ6R3Co39ZmuAEFBHI6+93pcJ4/R
         4FuFGlVhaEB5vzY+6t9CA+xID59C6elrhl6fv1E1ceyhyEIaQjM8LxbaD3yKyUxz4H7D
         mMcALW4L8ztiBNVSJvUB3bbIOCpnjNTketpeKvQJEXF9+WDN96MfUx2z0lDqZoKjjDiH
         J3VBUZ+isKYh1+7H26JzJyeJy78pYeoAPo36zj0HRpRyyWU0UbKJHPGDgnkG6ZTR+lHA
         R9yg==
X-Gm-Message-State: AOJu0YyZSyxa8isj3qGj1YU8w5uZd0H6mt1KsU+zltlAorAhkDcEO+Tb
	MoNGRnW4UtkjgfD9U3qvRmK/PuAE1AM=
X-Google-Smtp-Source: AGHT+IGTNfQfZAQgQloSFV62mT3cmBaaZ3OKrRgp7Gg45Pi5zoFtIjGMzMVMCUiTYDRbIxLpUdkzzA==
X-Received: by 2002:a7b:cd97:0:b0:3f6:9634:c8d6 with SMTP id y23-20020a7bcd97000000b003f69634c8d6mr4013657wmj.18.1694252121048;
        Sat, 09 Sep 2023 02:35:21 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c014300b003fefe70ec9csm7302565wmm.10.2023.09.09.02.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 02:35:19 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 0/4] Bump Protobuf / gRPC
Date: Sat,  9 Sep 2023 11:35:13 +0200
Message-Id: <20230909093517.444924-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 09:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104809

Hi,

This is a follow-up on Xiangyu Chen serie:
https://lists.openembedded.org/g/openembedded-devel/message/101848

I have rebased and added the gRPC bump patch to fix a remaining error.

Regards,
Clement

Clément Péron (1):
  devtools: grpc: bump to 1.56.2

Xiangyu Chen (3):
  protobuf: upgrade 3.21.12 -> 4.22.2
  protobuf-c: add support of protobuf 4.22.x
  mosh: add support of protobuf 4.22.x

 ...re.ac-add-support-of-protobuf-4.22.x.patch |  63 ++++
 .../recipes-connectivity/mosh/mosh_1.4.0.bb   |   7 +-
 ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch |  62 ----
 ...d-separate-export-for-plugin-targets.patch |  93 ------
 .../grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb}   |   6 +-
 ...ot-compile-the-code-which-was-genera.patch | 147 ++++++++
 .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++++++++
 .../protobuf/protobuf-c_1.4.1.bb              |   6 +-
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  15 +-
 ...protobuf_3.21.12.bb => protobuf_4.22.2.bb} |  11 +-
 10 files changed, 554 insertions(+), 171 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb} (92%)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb => protobuf_4.22.2.bb} (86%)

-- 
2.34.1


