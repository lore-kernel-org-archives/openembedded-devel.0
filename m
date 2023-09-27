Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CA9E810AA
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:48 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.13265.1695804167379207626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BXKLZ1b/;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50317080342so17846485e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804165; x=1696408965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SCleddFG2iLnpvE8c9I53YC+ADpf8t+Lyg6ToZ5HGAA=;
        b=BXKLZ1b/mM5HEl95HLIvG2qD9i1ZIK2roe+2QWXVLa7pYOYThpdFhMgN5D9p7mR1RI
         04AXU/8i4qWBqEP4xi5g5ojg3RtHkGdxYRPF3MZaYt1yYzu6OpJN8INC91wcdxYkSvQb
         rVS4pILg0c/nOeV32p/veb5csq5gZ3uSB+Krx5V2BpXdJ/Svk+zYgE69ChRIhStiqU78
         /At2BL/3r/AY43giOV6UtZXDurO7uYFoWsa4yIjmmcStZuv3hS0uw+MAt8gkMkFZtvAd
         AwPg+cxpgYSIJaYVZwKGfjxBTTMOp2zqxXiRWlKCACyMXkDcxjdPOCU8mhE8gp3csa9F
         f69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804165; x=1696408965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCleddFG2iLnpvE8c9I53YC+ADpf8t+Lyg6ToZ5HGAA=;
        b=rcwb0XPB8zhzKAE7rRd7HQw7Bce31jU3NyNO8fXkdQx+ZlgQ2cj3RPGiJ+Th4iHltP
         dfeHECNsBBrAwfFMvnxns1/3zze/dh4ZX1krpr47cXX0gpfAUutPJjhZ4b5VHIYRJKmm
         X1tJaxOcR70lL8fQ0Za5OaxmOotpxJSs/mXOpYE5KFSg4szme5cCjouvpczOzi666qMD
         gHk0T0K5ZHbBfz4py1rUrIS2xe4qszFVYhxgegraySxvXkC2+omCCf/WTJIrLm/mFe2w
         9LML5cm9aV16v52RHzz1+jeU4fDzSzy31ZGP2PDZPzQBUP0w1SExBog7qiv+YgaMzJ/w
         8PBQ==
X-Gm-Message-State: AOJu0YzeLnYrpphQjT3kWa9uMrf9R7L4XjvXJd7ndo6Q/ho/HCvejJQL
	k+/66H5WLJZBHFYzDvUHsS+e2Bhh9tc=
X-Google-Smtp-Source: AGHT+IHBVsFxt20RHt/JYPPoC1MlTjUpCXA07kR8QFXS2H1VBTKXKQd3Cat6VujC92bJBNCrglU+sQ==
X-Received: by 2002:a19:2d49:0:b0:503:ed9:58e3 with SMTP id t9-20020a192d49000000b005030ed958e3mr1118411lft.8.1695804164392;
        Wed, 27 Sep 2023 01:42:44 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm20008616wml.4.2023.09.27.01.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:42:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 0/9] Bump Protobuf / gRPC
Date: Wed, 27 Sep 2023 10:42:33 +0200
Message-Id: <20230927084242.1195772-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105175

Hi,

This is a follow-up on Xiangyu Chen serie:
https://lists.openembedded.org/g/openembedded-devel/message/101848

I have rebased and added the gRPC bump patch to fix a remaining error.

I tried this with qemux86-64 with glibc and qemuarm64 with musl.

Changelog with v2:
 - Bump protobuf to 4.23.4 to fix build with musl
 - Bump protobuf-c to next to support protobuf 4.23.x
 - Fix etcd-cpp-apiv3 with gRPC cross compiled
 - Fix mariadb with musl

Changelog with v1:
 - Removed the gRPC CVE patch already merged in 1.56.2

Regards,
Clement

Clément Péron (6):
  devtools: grpc: bump to 1.56.2
  etcd-cpp-apiv3: upgrade 0.14.3 -> 0.15.3
  etcd-cpp-apiv3: fix build when gRPC is cross compiled
  protobuf: upgrade 4.22.2 -> 4.23.4
  protobuf-c: bump to next release to support protobuf 4.23.x
  mariadb: add missing <cstdint> in rocksdb string_util.h

Xiangyu Chen (3):
  protobuf: upgrade 3.21.12 -> 4.22.2
  protobuf-c: add support of protobuf 4.22.x
  mosh: add support of protobuf 4.22.x

 ...re.ac-add-support-of-protobuf-4.22.x.patch |  63 +++++++++++
 .../recipes-connectivity/mosh/mosh_1.4.0.bb   |   7 +-
 ...-missing-includes-cstdint-and-cstdio.patch |  16 ++-
 ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch |  62 ----------
 ...d-separate-export-for-plugin-targets.patch |  93 ---------------
 .../grpc/grpc/0001-fix-CVE-2023-32732.patch   |  81 -------------
 .../grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb}   |   7 +-
 ...ot-compile-the-code-which-was-genera.patch | 106 ++++++++++++++++++
 .../protobuf/protobuf-c_1.4.1.bb              |   6 +-
 .../0001-Fix-linking-error-with-ld-gold.patch |  69 ------------
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  15 ++-
 ...protobuf_3.21.12.bb => protobuf_4.23.4.bb} |  19 +++-
 .../0001-cmake-fix-when-cross-compiling.patch |  66 +++++++++++
 ...iv3_0.14.3.bb => etcd-cpp-apiv3_0.15.3.bb} |   8 +-
 14 files changed, 290 insertions(+), 328 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb} (90%)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb => protobuf_4.23.4.bb} (78%)
 create mode 100644 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch
 rename meta-oe/recipes-extended/etcd/{etcd-cpp-apiv3_0.14.3.bb => etcd-cpp-apiv3_0.15.3.bb} (67%)

-- 
2.34.1


