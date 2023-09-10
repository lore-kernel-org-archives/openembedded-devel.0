Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558A2EE14D8
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 13:18:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.35735.1694351904146920212
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 06:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Sx6pyRWe;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so37932935e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694351902; x=1694956702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNfeQhZS1TOxJtKqdN7pNUyVeyNZScVYEekCU8zTSC0=;
        b=Sx6pyRWeJvHr2txaGQgxy61cLIWaBQF9tO3hJ4sZXLYFtvSao32wTabg0PtY2ZAtmG
         LuMxYNRQvNBfc/T1yVSZ3lS/8/GAdQPvjZ+S96vMS2ciEIUQtWhVqZrPGQ0X+c2CvlLC
         o8lYAQXnsSHlItTyXO2UTMc1Eia5F8SaHfgzn5Hhi0VadlXYLdQWprPyxlX3NrQEi6YY
         YQ2JPKyI5Wcl31B0gkt9KyF7PBcpvA2JTn5DEam+h1vcim0GBF226svyJUiQo76k3arW
         UXlsoMiikFrBXLYOOWTXRJJao+ok1ISk0+duVkUxv6oVDSGX+bw4LkNAfQgJelTOhQVJ
         y20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694351902; x=1694956702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNfeQhZS1TOxJtKqdN7pNUyVeyNZScVYEekCU8zTSC0=;
        b=Fx27EjcDuP3kzgAMRDa6J3MyU2kzMiMfqAi6tCC7VJlYHJ2HSGYBQJWaGHYKGWxloc
         j+mtMmORdtj6ImJuVIZEgHVvAbuHDuXEcxK/GKd4As2uKoefT1sSab5cD/khLZ/31N8H
         iPzk6LkuAsJsrX8ComAENNCf7FQsFfdEWcX6TCAP1gmlfHeCEp9zV3p9xSAogFtkR6Bl
         3/q9zcjC17w8nDYF7nKpsKCoLFiOvnrXEJQ9UJxcz5w+B+RChLqKsSPJov+gKma+/k0C
         AXRdShwq7IVbH9N+a7B/j2KqNYlPZuz5Za7hoQcsaaHJ9MIlEiYww8usQMiHkkbWXBv2
         QhDQ==
X-Gm-Message-State: AOJu0Ywpff7kwL6GvaVeMPcGSia3+s4DS0Z0RvQOV/brfFMBb3NCmwvd
	ZeRKYnD7JAbCTSFTfRHRcQrogAlzNj0=
X-Google-Smtp-Source: AGHT+IFBfOQhb3SRSCaLUDsbjlyWUHF7TJAPlkZnPgCFydgJyyUbm4WdnqMX7dOKRXUzoskZvSWoIQ==
X-Received: by 2002:a05:600c:215:b0:401:b53e:6c56 with SMTP id 21-20020a05600c021500b00401b53e6c56mr5984456wmi.3.1694351901533;
        Sun, 10 Sep 2023 06:18:21 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d62d0000000b0031980294e9fsm7308782wrv.116.2023.09.10.06.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 06:18:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 0/4] Bump Protobuf / gRPC
Date: Sun, 10 Sep 2023 15:18:14 +0200
Message-Id: <20230910131818.1538524-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 13:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104822

Hi,

This is a follow-up on Xiangyu Chen serie:
https://lists.openembedded.org/g/openembedded-devel/message/101848

I have rebased and added the gRPC bump patch to fix a remaining error.

Changelog with v1:
 - Removed the gRPC CVE patch already merged in 1.56.2

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
 .../grpc/grpc/0001-fix-CVE-2023-32732.patch   |  81 -----
 .../grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb}   |   7 +-
 ...ot-compile-the-code-which-was-genera.patch | 147 ++++++++
 .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++++++++
 .../protobuf/protobuf-c_1.4.1.bb              |   6 +-
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  15 +-
 ...protobuf_3.21.12.bb => protobuf_4.22.2.bb} |  11 +-
 11 files changed, 554 insertions(+), 253 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb} (90%)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb => protobuf_4.22.2.bb} (86%)

-- 
2.34.1


