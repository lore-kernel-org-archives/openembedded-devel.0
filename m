Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.5169.1626537631978676361
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jul 2021 09:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WAQZI7RT;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id y4so13362846pgl.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jul 2021 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PdPH9mYsER1ZH0yJyPnVivY1zDBmAWBfEdV1SVeAPLA=;
        b=WAQZI7RTEsGeqQwwmPdndHZsz6P9pGnpes2K3Y8GLP1oplVLYykyaf1vB3x3P0Xwfk
         GTwPvYu21VPuJ+i1fzInqvsrOQE10iXO3We0c/3Z3//RDQr9Q45P2dDsYHIAYEgKnzHm
         L7rVwpTlLDotPRySHUsfhspZLuArMbpCbtiH6Nh89BYNOZwTglrdqzs/PHPTcoo9S99s
         schg6xboG1k13bHCtiSlTFno51DCSET+JLz9YMPlpyNFASsrbZQWLF7U7oNjnlwW7djv
         8ODVbuAgK/8oz3C2odT5aYrfA73bbSZd3wQ5QiPrda2gTCRNgHqD3Vj9olhvvTR+8xDO
         55lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PdPH9mYsER1ZH0yJyPnVivY1zDBmAWBfEdV1SVeAPLA=;
        b=VsItWJGfBx+HjFZsJp0Lu5W2LaEVk7vDJ7JqT22OqZ7lOweMaqieJL4E0j61Nme4lD
         lOhh8fkOMeydIp43H0pfaV8r0JGD8C4yLld/jSB4/9Jl1HFpD2wk7kBacjcO4YQD7VEc
         e3H8YbudpInFrG2b0I20IVlyDqyqf8Zgx0DWshYKu8e5LeqxhNtKax+AcjOlo2woorbT
         O0dAP059SLjXZlnx+gx666dLoCE+tXhH2/OtJ8CaQZsZ+7fzJmlPHMa9kLhpF0TsipLw
         +Fo0Rq7T0i9sUpvFOzSLTJd5rtgIcbfKVBOgez7u2ZbqzJLbdZWKSegelB2iLZBYZBBt
         vhZw==
X-Gm-Message-State: AOAM532MotZzMmdzyOv+U4uJ3eGX35Sh+FmOhLlaeHQpz2PVJHn82AoB
	o4dI9SoauGjeEEcEomkC8dUiIAN07Iok0A==
X-Google-Smtp-Source: ABdhPJyHtYstjNFTTiKemEEugT/w1//IwcnQgAM1ldsLtgGcEGhnMteIO6qF9yRchOTNLxm2H+zMrA==
X-Received: by 2002:a63:3741:: with SMTP id g1mr10487523pgn.134.1626537631183;
        Sat, 17 Jul 2021 09:00:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8300])
        by smtp.gmail.com with ESMTPSA id i1sm13889866pfo.37.2021.07.17.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 09:00:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] fatresize: Disable building documentation files
Date: Sat, 17 Jul 2021 09:00:27 -0700
Message-Id: <20210717160027.9465-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs docbook-to-man tool and we do not have native version of this
recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-build-Do-not-build-.sgml-file.patch  | 27 +++++++++++++++++++
 .../fatresize/fatresize_1.1.0.bb              |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/fatresize/fatresize/0001-build-Do-not-build-.sgml-file.patch

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize/0001-build-Do-not-build-.sgml-file.patch b/meta-filesystems/recipes-utils/fatresize/fatresize/0001-build-Do-not-build-.sgml-file.patch
new file mode 100644
index 0000000000..c754f21d0d
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize/0001-build-Do-not-build-.sgml-file.patch
@@ -0,0 +1,27 @@
+From b16373da7e5a45cf92df83b39e2fdee939439c84 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jul 2021 08:55:42 -0700
+Subject: [PATCH] build: Do not build .sgml file
+
+It needs docbook-to-man tool which we do not have recipe for
+
+Upstream-Status: OE-Specific [needs native docbook-to-man tool]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2becb84..858df00 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -14,4 +14,4 @@ SUFFIXES = .1
+ CLEANFILES = $(man_MANS)
+ 
+ .sgml.1:
+-	docbook-to-man $< > $@
++	@echo "Needs docbook-to-man"
+-- 
+2.32.0
+
diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index 32406077da..ec7e7f968b 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -3,7 +3,9 @@ SECTION = "console/tools"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https"
+SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https \
+           file://0001-build-Do-not-build-.sgml-file.patch \
+          "
 SRCREV = "12da22087de2ec43f0fe5af1237389e94619c483"
 
 PV = "1.1.0"
-- 
2.32.0

