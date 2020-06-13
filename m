Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.14436.1592073297724759638
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 11:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePpvwtTP;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id g10so10756340wmh.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2020 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CSUIzc7UWP/ACI3lOr+YeZMa/uEv3terOQ7tJZTb+aY=;
        b=ePpvwtTP+OnCN6WwYRGcdSfN3FiHEv5CQ7cwsXke1y99t1fJvFl9xZFbP49uOmrVPs
         uekElmsit/XB7Z/t3uELzmPMfVFIp8yMUyVxFGplAX/LcSy9kMkcJ8/EAAiJtfipsCes
         SwQN6kevIro7Lrl/wuOoTL7NpAIxrYaCpgxIE8eRA1oT+tImRCumoKOZilL6wJYKlhgr
         3NiDS1bwNXMQE4snA62CCAHlGPvnRNve93BNQQaCnW0GmT6uiCIc4czi9pHWbi4mqgEe
         EuVsCYfeBq6MXWDf/Z85x4FXLCWQxfo/ACqX8A6S7MScjHtn8hVEIb3ZRdkzPd7xJCzC
         bhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CSUIzc7UWP/ACI3lOr+YeZMa/uEv3terOQ7tJZTb+aY=;
        b=QK6epZ+e1m5h9QwKf1Ut6Z397bKLNkdhbiA1dxlt24DQFg2SKBH3gx3UfLQhyXUgcT
         Lz9doiQKjG60iGK0LE5X/skWgWTCQq8f8835Y4CfpcwTIBUNZfdXUAzWGiNxtMLE9GeF
         W43sIj8Nddu3JUdQWOFcwezB/NEmjQUWfp54oiITAHSAG2+w1F9ol5Bc5rDiD7pErptD
         LzqnDZk4hMKSFUKxvqY4yc0jsI9Yqbq9HQGaaMEl32esDzH0Hd7VOiKITo/rmArwe502
         t2nFpJI3VLo0m+FAbhnI3YdSia0CeHWtnhxBOyjQMYLcbXmvtXKAA31NhOko57Hy46/q
         VcnQ==
X-Gm-Message-State: AOAM532GvOLu+7lJfsXpbjNNQYnk/QD54QuRCkiP1Ls18oMKFMM4tLIV
	DQp/1eM2F892BEsLNw4c5Zmwf6/v
X-Google-Smtp-Source: ABdhPJxJecpv4NdegXPvMIVkLVs1sv/2lFIXlrAq1DIxMbVXQnnLfWKPlP8Vl0FsYZgSJzKpda60QQ==
X-Received: by 2002:a1c:2044:: with SMTP id g65mr5339974wmg.16.1592073296006;
        Sat, 13 Jun 2020 11:34:56 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id b201sm14421533wmb.36.2020.06.13.11.34.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jun 2020 11:34:55 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [meta-oe] [PATCH] packagegroup-boot: drop recipe
Date: Sat, 13 Jun 2020 20:36:45 +0200
Message-Id: <20200613183645.22689-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

It's duplicated to packagegroup-core-boot in OE, let's drop it.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 .../packagegroups/packagegroup-boot.bb        | 32 -------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-boot.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
deleted file mode 100644
index b5e7b99cc..000000000
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Basic task to get a device booting"
-
-PR = "r58"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-inherit packagegroup
-
-#
-# those ones can be set in machine config to supply packages needed to get machine booting
-#
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
-
-# Make sure we build the kernel
-DEPENDS = "virtual/kernel"
-
-#
-# minimal set of packages - needed to boot
-#
-RDEPENDS_${PN} = "\
-    base-files \
-    base-passwd \
-    busybox \
-    netbase \
-    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
-    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS} \
-"
-
-RRECOMMENDS_${PN} = "\
-    kernel \
-    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS} \
-"
-- 
2.27.0

