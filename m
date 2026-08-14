Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8A5C5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:56 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24474.1786747545604733265
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tK6qTG5r;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1099356a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747545; x=1787352345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTBkA5wXrTjlYWONRwzsOI1uQq7gg6W/TvxQasJlPoY=;
        b=tK6qTG5rjteJ/GhqSvYHYiu/DliLl+kQC6Rq624klhtEaPC8Lby3BCvFtFEMzwrZqa
         AoYt48TFJeqlytspmi53k+BvTBlQxWz94QvCqR7XJwiarTXLrC1/o+qVyG+O8GOc1e7G
         18qek8kw4nsNDxxW48v2BnXIpmsEDT2vKkSfBrxd9DeeDrRcVZRu+28YFEpSg6zTah8g
         1+DHWKOq6h6Cfoat9dyjYk/HikMKKdMuGcMDXZTKjbgemfsFkVHHHU83gvfPXj4qbcJS
         74zCNfWag/LFF8jrLJhjuN7+36DCgr7coPHiYx54Of2XOp5jEklmglf13xXKa5C6+lzd
         JH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747545; x=1787352345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTBkA5wXrTjlYWONRwzsOI1uQq7gg6W/TvxQasJlPoY=;
        b=QXSqatQRUfAr2ZrYJv++N2taECw40nS0ku2P4Ej8mWMPh5p2YqRZ9nLYS1dxw4sxn4
         92AaYwQhacZaBGVyFwFTnj220dJHvEfLfjUWBTirWjYU2yrvL7IFq3QV3cjvxnruhmi1
         s1BsP8UtSl2P532KkHYX3YSag3tIJmK1s2+f/XnaJCze5nOQg44/vJHAZ83u2f6lfqOT
         JALgWLyedsXp3LInATJuQlb6jaf64lXk54UFY51+jpJTCy3yHlfYHOjdANRX4J71z0RW
         TyzyjJrn9tVGjEbtApY7Yd3k8C+HkyBX9twEcee9jgoFno+LU6bpJT3I95fSvFkrkbhp
         PchA==
X-Gm-Message-State: AOJu0Yw7FF+Ly7DCkNcrvFgzVHrQBG1AK2w/zNgiKRq3/4d6a9Im3dJ0
	KGFCjQh6ts93MtfGqWwbPFVpvalpnjzwWHSZaTDdmQIEEP/tjzWC/7EG+SMxgw==
X-Gm-Gg: AR+sD10nQpnmD/RraxNTFoLVBOvsYEagwRc3lspMPKODy3L5GAy165YyeCsjisLTjaZ
	nxcSrEEkIaudjXdBFOFqnWF8hM8XZVZJ2eRifCcBTKcDcd6xKU5W+tiKVUr8QVp5k/oudgterCt
	nhYX9T9LzTTleqhfYIqxisnp4aVJ5/8jwiV1n5R8lKngH2qpdiBujXwE1CBUWbQpWJMgh7aVwIZ
	uNRJVwWLEW3e0iqGKDt54rGGsaKQibDrVObeFz6SsU1UZdgIotNyODpOzV09FsH0VY484J8a+7T
	T1zi6GGIR5DEHt2U1DKggjhjR15Ox/XJCzgNA9Gotj8j2NN75pDb054L++MDdITL4dXCY4x9egS
	cHo59ay7Nk1YeK49wGFClbbXs78bLi0AstS3VqMTcbsbf11ukJMWCq6Qk375uzDLGQw7Com8zr5
	ar9VUV7X+n8dDpg1XXRYRfGYjNTwFPn8JE0KybL9xNru5weBt+BFkID79+2dPlGvXxWjmhFhwHy
	lOUwrXe02FXoWA+g/cnLMjmrwn+UIYELrIeGHjGk7dyvCql9e6qKTIe8aX2f4+sfVc9if5M3kEV
	dlcr+DPNbcEZDdS+MAkSfhxUofgfu6EzMkIw/N1nDDQtmfaRlHJQkwZpfkuvJ1EdDuN7G8F9tBO
	pK4u71m1b0/mvB4BThXKNA7WMSsQJFMmpexHdv/+SrSJzag==
X-Received: by 2002:a17:90b:1d45:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3933b7c3b71mr10672434a91.1.1786747544921;
        Fri, 14 Aug 2026 15:45:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 001/109] xorg-docs: upgrade 1.7.2 -> 1.7.3
Date: Fri, 14 Aug 2026 15:43:47 -0700
Message-ID: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129065

Upstream 1.7.3 is a documentation-content release: it refreshes the
MAINTAINERS file (Xnest and Xft pick up new maintainers), drops the
"All rights reserved" phrasing from Oracle copyright notices, and
updates the gitlab CI templates and build-system boilerplate.  Upstream
also switched the release tarball compression from bzip2 to xz for this
release, so SRC_URI_EXT is set to "xz".  general/License.xml is
unchanged, so LIC_FILES_CHKSUM stays as-is.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../xorg-doc/{xorg-docs_1.7.2.bb => xorg-docs_1.7.3.bb}       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-doc/{xorg-docs_1.7.2.bb => xorg-docs_1.7.3.bb} (60%)

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.2.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.3.bb
similarity index 60%
rename from meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.2.bb
rename to meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.3.bb
index 4cef981bc8..0bd399795e 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.2.bb
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-docs_1.7.3.bb
@@ -4,4 +4,6 @@ SUMMARY = "Documentation for the X Window System"
 
 LIC_FILES_CHKSUM = "file://general/License.xml;md5=f2677c20a4066714e233e9bbd8659aa2"
 
-SRC_URI[sha256sum] = "2391b8af472626c12d3c3814b5e7a0ea43c3a96eda94255b7ed8bdff0fbf08e3"
+SRC_URI_EXT = "xz"
+
+SRC_URI[sha256sum] = "28a2f2eeb5d9ff58b85961ff3ed7baaaf1ffa132e2a81f8b2bb97cb499bcddef"

