Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD47CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:06:10 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.734.1778648709868652184
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 22:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hbUgAgH3;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-366330b6751so4198265a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 22:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778648709; x=1779253509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdEL8WXj2Dg8AqWMCxLxiONzsPqeWvqn1YusvonTc4I=;
        b=hbUgAgH3pjLcJ5YiisNYzZxxVEgD/yV3TUjngxsKPrHzBXGSPhetCDMpk+Gfnca49C
         xXd5sluUdc8f9ryU2cTP8njpWD288504+4mXhkag/4/lqwQup7TdO3Z8qrIGn2J5ZC9b
         HzG/tu85AVsa1Gyypd8EP6tbGr/rwY7caoxR07pBP/gwkPExO3jIJOTAwW6+SIV7WA05
         ADbEBE5glmoZYc9qYMT2aTm1RUn7oQX16EUnNVF7pvGrLQXfYDA7CmZTDRkYHl9g+Jj4
         PFey9rvuUadDY99GCuJMr7mQD3in5JKjMB/NqTQsot2LXrI4g9zhqpbqkTD+0w4qnTly
         SIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648709; x=1779253509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WdEL8WXj2Dg8AqWMCxLxiONzsPqeWvqn1YusvonTc4I=;
        b=IYXZJjbGyiYslCX/pN3I6VUaG2+0B3rXdaab4WfO4Ck6ObO2WKGusoH+I4g38543Yf
         CcstPbWEuscI3KQ6m4QRmD2eYuWIBzEKitBDhFeMqQjAxDBSksRhsgDXjsR8IQrv/7cQ
         wlSF7OOOe7FXbWrH4Ww/bpK3MELXHl+y4xf5gY7FmCDPVIC6ibF1RKffO8CrH3bxHVIT
         dntQxPORw0lNrolzaOwYgmiyOodOo8FaU41l6Q7F7BrCo5MgLrSfmsZeqMA9v9cPRKcX
         HjuEdy5QvnGXEsK9wkWPQymnAyRYgbih0hGSaqW6KE+sBVZSFvQQmBuYURKkJoS/ftMM
         wbsw==
X-Gm-Message-State: AOJu0Yz8d1AN3ektduWa4xJdmP8fnLKFm9682gM4ghGluWa9jmjKKdmq
	X+F6hCdaIrStZW4oZhKeCaKvRCZEzheor6Ha8ujSAhSfkVOrdWCmChV8aDWEpBgN
X-Gm-Gg: Acq92OFkhOma+pBvSDMotuoTJTwnLKnKZP1eW5f77IbnLAspKWNS2chDQ8c0NiZhdap
	ra9stHphdDiMVsZQd22pkZ8Keb0jBxh8bcpZqezwTv5OmHhFvII0pyXHwf1J8OAJFrJTPc+FZGc
	PLCKtz+s6aV1WL8OQcA1/+254fpBM+dnBZ1Ngg1Pirqg8DTxHSXvhiAEJ5Wbu9fIZlcLpaVwpzi
	OBXzzfVaGxrBhiJRjxtOaVC71cb47mH9wwhBoSoejZlquC9fg4/58CXhvahIbpmz9wcvHeENwIa
	0o3BBJlN/7cNd3kIXvdA9fai3Aa90B0a1D82g4sHQbFX5nv1EbGPomIfg4oq9dDaHdiDvk/hG7A
	Hq5+W3+EfoEnsRUGqhVQQRm3CvcEP9LOIYxlYziSNnwUtrFKjibGIKDYPNSCTZRO7d2cHuvxQYn
	G0Vo9u8XXWBiwksFT44bIQGUzXx/Or3lIq5r/aQlPL6i7I9lY=
X-Received: by 2002:a17:90b:54cc:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-368f77f0effmr1352133a91.6.1778648709047;
        Tue, 12 May 2026 22:05:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf5c58sm1696900a91.1.2026.05.12.22.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:05:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 6/8] lcms: patch CVE-2026-42798
Date: Wed, 13 May 2026 17:04:47 +1200
Message-ID: <20260513050450.3515182-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
References: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 05:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126949

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-42798

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../lcms/lcms/CVE-2026-42798.patch            | 38 +++++++++++++++++++
 meta-oe/recipes-support/lcms/lcms_2.16.bb     |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patch

diff --git a/meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patch b/meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patch
new file mode 100644
index 0000000000..1fc3b0ca6d
--- /dev/null
+++ b/meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patch
@@ -0,0 +1,38 @@
+From e5638450eafbe2e79b4dbbf9fcbc47998cf35427 Mon Sep 17 00:00:00 2001
+From: Marti Maria <marti.maria@littlecms.com>
+Date: Thu, 19 Feb 2026 08:48:50 +0100
+Subject: [PATCH] Fix for ParseCube integer overflow in LUT allocation
+
+thanks to @zerojackyi for reporting
+
+(cherry picked from commit 6a686019825a89b715d16671f18d049523354176)
+
+CVE: CVE-2026-42798
+Upstream-Status: Backport [https://github.com/mm2/Little-CMS/commit/6a686019825a89b715d16671f18d049523354176]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/cmscgats.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmscgats.c b/src/cmscgats.c
+index bccbf58..b099331 100644
+--- a/src/cmscgats.c
++++ b/src/cmscgats.c
+@@ -3128,7 +3128,16 @@ cmsBool ParseCube(cmsIT8* cube, cmsStage** Shaper, cmsStage** CLUT, char title[]
+ 
+             if (lut_size > 0) {
+ 
+-                int nodes = lut_size * lut_size * lut_size;
++                int nodes;
++                
++                /**
++                * Professional LUT‑generation tools (e.g., Nobe LutBake) list 65×65×65 as their highest supported size.                
++                */
++                if (lut_size > 65)
++                    return SynError(cube, "LUT size '%d' is over maximum of 65", lut_size);
++
++                nodes = lut_size * lut_size * lut_size;
++
+ 
+                 cmsFloat32Number* lut_table = _cmsMalloc(cube->ContextID, nodes * 3 * sizeof(cmsFloat32Number));
+                 if (lut_table == NULL) return FALSE;
diff --git a/meta-oe/recipes-support/lcms/lcms_2.16.bb b/meta-oe/recipes-support/lcms/lcms_2.16.bb
index 8a70572907..7544e83578 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.16.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.16.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz \
         file://CVE-2026-41254_1.patch \
         file://CVE-2026-41254_2.patch \
+        file://CVE-2026-42798.patch \
 "
 SRC_URI[sha256sum] = "d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51"
 

