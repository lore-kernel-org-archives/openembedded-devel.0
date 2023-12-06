Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D0EC10DCE
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:41:20 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.44261.1701895273985942836
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVpfNUtW;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-332c46d5988so225900f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 12:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701895272; x=1702500072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8YrVo2a8yISUkDOU3dKP7gZT1JBqGZpz/3snx5wYKQ=;
        b=kVpfNUtWcFt39aAG8Bz9gXkhhe040IcjvFRX1221RBJ2wMMJjpfYWs+c02SC80/hka
         C3lAg2CUYH+udP2cuIP8ncbvJPyaYz7z6dqlFEEUznyPPM91j+dgDnI/qOXjuB9TuWqL
         FW/97eun2EBicWgZE7L8OkdhziGJXUu5uS1UEGJqNGkMd+d7GSct+2ELubdxQDFEbqlH
         D1+Kee0DQzYdMkIBLF5a9b2Ge+VWm2L0ykL9ijzNGM2b6yOopVmdMh5H2O0cDwLRkjvn
         gtmmmMRdN2mGXbZ3arBQMEja90ZkAwb4bFsn8+7TjDI1R3HxvKHNWMF7ZtuXB5ni/H7u
         80Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701895272; x=1702500072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8YrVo2a8yISUkDOU3dKP7gZT1JBqGZpz/3snx5wYKQ=;
        b=uLUCqly0BqPfdc75WQ361Ote/aVdyr6GaMz+YfvflSd2zZNHYMYtp23awL9ZvJBSkz
         bGc9YGU08H1NWMFk9FYdv+RwtUTPT/ZUyIkiE7VM7S5IlX8eMHSSGeBT/jDNnKQL61Wt
         D5e9cQ0WxQGXkJxQtWXXPDl8347cxOXy7xHtd7l9iH6ntteWLyyOFbqDJg7pnr8CXd7+
         M7DyMjm1TuLwQgXCPkZqOtljjn3TDB7w3VjDf0sIfWQYGCJVX+DNpcPowwbX0weJTGNA
         i9v0PY894FWc76S1Qb+ZzlR0FAM9iwaIyGvbRkLLzGYJZtBnnHZg9iAb+widsCCxzIoI
         qVHw==
X-Gm-Message-State: AOJu0YznqpbJqxuP/XBoxXNxafBlxMzoHyBi/1bevL/AoEsxIApY6JDV
	FotqjZS7BBJj2utqxyNe/MWI+XmjOtOZFw==
X-Google-Smtp-Source: AGHT+IEOVvq919gB+18wTJdLZ2Es98rCeApO1eCMqZap3+ZUbYQfBhhwZ2PpwVWr52iDg6Rn6j0v1w==
X-Received: by 2002:adf:e28b:0:b0:333:3dd:6cc3 with SMTP id v11-20020adfe28b000000b0033303dd6cc3mr989751wri.21.1701895271617;
        Wed, 06 Dec 2023 12:41:11 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id b16-20020adfee90000000b0033340c12012sm535167wro.3.2023.12.06.12.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:41:11 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xbitmaps: upgrade 1.1.2 -> 1.1.3
Date: Wed,  6 Dec 2023 23:41:07 +0300
Message-Id: <20231206204107.458096-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 20:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107265

Changelog:

* Switch to XORG_DEFAULT_NOCODE_OPTIONS
* gitlab CI: stop requiring Signed-off-by in commits
* Build xz tarballs instead of bzip2
* gitlab CI: add a basic build test
* Update configure.ac bug URL for gitlab migration
* Update README for gitlab migration

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.2.bb  | 11 -----------
 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb  |  7 +++++++
 .../recipes-graphics/xorg-data/xorg-data-common.inc   |  6 +++---
 3 files changed, 10 insertions(+), 14 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.2.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.2.bb b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.2.bb
deleted file mode 100644
index 37183b12b..000000000
--- a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-data-common.inc
-
-SUMMARY = "Common X11 Bitmaps"
-LICENSE = "MIT"
-DEPENDS += "libxmu"
-RDEPENDS:${PN}-dev = ""
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=dbd075aaffa4a60a8d00696f2e4b9a8f"
-
-SRC_URI[md5sum] = "cedeef095918aca86da79a2934e03daf"
-SRC_URI[sha256sum] = "b9f0c71563125937776c8f1f25174ae9685314cbd130fb4c2efce811981e07ee"
diff --git a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb
new file mode 100644
index 000000000..5f4915297
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb
@@ -0,0 +1,7 @@
+require xorg-data-common.inc
+
+SUMMARY = "Common X11 Bitmaps"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=dbd075aaffa4a60a8d00696f2e4b9a8f"
+
+SRC_URI[sha256sum] = "ad6cad54887832a17d86c2ccfc5e52a1dfab090f8307b152c78b0e1529cd0f7a"
diff --git a/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
index 1c6408d0d..17fe00a9b 100644
--- a/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
+++ b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
@@ -2,10 +2,10 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/data"
 LICENSE = "MIT"
 
-XORG_PN = "${BPN}"
+DEPENDS = "util-macros-native virtual/libx11"
 
-SRC_URI = "${XORG_MIRROR}/individual/data/${BP}.tar.bz2"
-S = "${WORKDIR}/${XORG_PN}-${PV}"
+SRC_URI_EXT = "xz"
+SRC_URI = "${XORG_MIRROR}/individual/data/${BP}.tar.${SRC_URI_EXT}"
 
 inherit features_check autotools pkgconfig
 
-- 
2.25.1


