Return-Path: <sofiane.hamam@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921E5C3601A
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 15:56:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.605.1743782206782757248
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 08:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xVLtpc8F;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so1514945e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743782205; x=1744387005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jU9wcnaUcuLQ0fnUsqFo9bkhTcdaGDd7C7TFXe3QZtY=;
        b=xVLtpc8FCiFjRQvhHQtnN8JAg4edArwYxQYTCeKfwA8vjiywrJR4T40Ik2q/535pD3
         Q5GJAqZrmaIie34rU/ycHr723Z1+0ypZrelyVZmBcRyCL5+rgwAU5eIe0YALg5zqxy8V
         SSi9+r5GFVG6XS2qk1d3wmWJisJFbptClAog4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743782205; x=1744387005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jU9wcnaUcuLQ0fnUsqFo9bkhTcdaGDd7C7TFXe3QZtY=;
        b=t9kw5IaFHB2iVbfjdTRB32OabzytoU4XzTdFQWiKd+NePjbD2xnX/OpbA8FkrUUOLH
         OWLshi7Dno8ZFBxkZxzsGzEdSctKCdveKnbGd54O82AwcLQ9gOBnn4GhACliiVnqhq2n
         l73udEhBdt4ZbcpAlvyLXFtvjsSz9fvEyZtUHTQvU1aCiiwT6apo0+VcUuUpXZDrt7jC
         alTzPUmvHV78Zc0IU6zStXDcRDwuWDBHgVPMuu1sf1QO/W6hlpeAim2Gj07UdTK6mJ4N
         DCZZxa12msu89n/r5VXw0nlXdsCgkcUeZ9RzATI1jPG4sDzZbk9F9rCteMe6e979Y0LZ
         a6kg==
X-Gm-Message-State: AOJu0YzSouzKvYFiE2ooCw4rZh78NBsqtVwzumYtHPfu6NTUoRczwPxm
	1KoD43vRNYa8OuCjjVFRCcRtZW3y7c9ZLh6PDa4nEFwhnSxov8LDDP8COOKRPgqFSS1egWMOqti
	O
X-Gm-Gg: ASbGncsN3YRGxXsXejT9KSXzKbbTPjotVFOaxgguAhcGLSFVDREbVPDQCnMxe1t7m0s
	u3VtvgQUgLD9v11aUPKSq11UKWnmZnuHKE05WeVC1zj9hCw27r5CtfPGSfhZNpXbv/PthQ+/LI4
	W1sjifTFmNaKGM1YStB+h+orMsWOTMM4ecoqa5rTfxtH5sgLPH3kNrduFyhXNDlFze+177SsDIC
	TVAPfUOyGZ1ReVVFRRJccrXfQ2HU2vAG1U1dlDvoGT7IyioFFARxtyvz9nKRn8NiQozzPXiKU5R
	JwjnGyutz/cRXab5iA2/sBpW8pem5+YzrsovcRuxYoVkm9t8nazFDi7eZbcCCvbq2GUiVhuXUS6
	hxMHvHnovSQ==
X-Google-Smtp-Source: AGHT+IE/uTGdwWNl9TTmVAAPW7EnDJJ+IsR3/rExPmnaVCpRNYU4O70c2wsBLDK/mFoa9TxgwQQnjQ==
X-Received: by 2002:a05:600c:3d98:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-43ed0bc78e8mr40739565e9.10.1743782204875;
        Fri, 04 Apr 2025 08:56:44 -0700 (PDT)
Received: from FRSMI25-BPYTOP.. (205.226.7.93.rev.sfr.net. [93.7.226.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d98bsm4671906f8f.76.2025.04.04.08.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 08:56:44 -0700 (PDT)
From: Sofiane HAMAM <sofiane.hamam@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] openocd : Fix non reproducible build
Date: Fri,  4 Apr 2025 17:56:32 +0200
Message-ID: <20250404155632.2767085-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 15:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116592

This package defines PKGBLDDATE as build timestamp which makes
it non reproducible. Use SOURCE_DATE_EPOCH if it is found, otherwise
use build timestamp. Following best practices, see :
https://reproducible-builds.org/docs/source-date-epoch/

Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 ...SOURCE_DATE_EPOCH-environment-variab.patch | 38 +++++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch
new file mode 100644
index 000000000..c0a1803a9
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch
@@ -0,0 +1,38 @@
+From 65969a2b73ce93db4c80f1706677351b0e57fa72 Mon Sep 17 00:00:00 2001
+From: Sofiane HAMAM <sofiane.hamam@smile.fr>
+Date: Fri, 28 Mar 2025 12:31:17 +0100
+Subject: [PATCH] Makefile.am: Use SOURCE_DATE_EPOCH environment variable
+
+This package defines PKGBLDDATE as build timestamp which makes
+it non reproducible. Use SOURCE_DATE_EPOCH if it is found, otherwise
+use build timestamp. Following best practices, see :
+https://reproducible-builds.org/docs/source-date-epoch/
+
+The patch is BSD compatible too.
+
+Change-Id: I26c1a00f2e8059ae31fe72a794b5962af5a84f44
+Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
+
+Upstream-Status: Submitted [https://review.openocd.org/c/openocd/+/8619]
+---
+ src/Makefile.am | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 6d79cd631..9ca697407 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -30,7 +30,10 @@ if RELEASE
+ else
+ %C%_libopenocd_la_CPPFLAGS += -DRELSTR=\"`$(top_srcdir)/guess-rev.sh $(top_srcdir)`\"
+ %C%_libopenocd_la_CPPFLAGS += -DGITVERSION=\"`cd $(top_srcdir) && git describe`\"
+-%C%_libopenocd_la_CPPFLAGS += -DPKGBLDDATE=\"`date +%F-%R`\"
++%C%_libopenocd_la_CPPFLAGS += -DPKGBLDDATE=\"`DATE_FMT=+%F-%R; \
++	SOURCE_DATE_EPOCH="$${SOURCE_DATE_EPOCH:-$$(date +%s)}"; \
++	date -u -d "@$$SOURCE_DATE_EPOCH" "$$DATE_FMT" 2>/dev/null || \
++	date -u -r "$$SOURCE_DATE_EPOCH" "$$DATE_FMT" 2>/dev/null || date -u "$$DATE_FMT"`\"
+ endif
+ 
+ # add default CPPFLAGS
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 559fe29ff..b1ce2ec16 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \
     git://github.com/msteveb/jimtcl.git;protocol=https;destsuffix=git/jimtcl;name=jimtcl;branch=master \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink;branch=master \
+    file://0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch \
 "
 
 SRCREV_FORMAT = "openocd"

