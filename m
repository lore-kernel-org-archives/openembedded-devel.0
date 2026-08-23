Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99F5C5DF9D
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:38 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13150.1787485958356814574
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Tvuv0zLa;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso19029795ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485958; x=1788090758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tibE0Yc3rZlyWDkZ47VnIQHws/e7lcqq6+Dx4xWhOew=;
        b=Tvuv0zLah0oEakYazV52rbb9P9poTDsEQ7TiHCfkRUuy8uGGYyfWtJKNnzICTD2IHS
         1vgV5QLmoIWcLwsy8mZu8fLmRjM0FdZc4OW/1zPErfQgJPNsaAhBSQA4vrIA1VJHdKvY
         SS20hh3hq4fQ9nP4KiksCoVcX0HG1jWxc4ZErz58rR8Ycp2ekABz6We1+rK3LGSAU3fA
         ft5QXs+ykT0vitsoBXwfrSg94AJsT5fLniOE6pEKxq0nwUXzEUov4mDgMpH0ZBoxoxVQ
         Lyu5FNzaRquDo35GqiHwLRaVg7F3z2y6vrqwQfQ7bF1rlot4w/LhX1xywdVJsPA+IVnr
         Lm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485958; x=1788090758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tibE0Yc3rZlyWDkZ47VnIQHws/e7lcqq6+Dx4xWhOew=;
        b=UVFZltc7bNr2t7rZUu0fWdWb49a0ZsYkgJO6v11V3DKuUAUxklVnnzc+hLyS18Jk6n
         OdQQ0BN1noLAsWpGL5G6Bo6er6ye/IaWotTnIYEPBJggH6xgzaN2fOiq1dx336jC7/Fr
         mXVv2O40+/QQn8mph/rkrT8K9qHPE3XKpV90uIdtnI+2pSyXz5WnHNU+BB+yXq+Xfgxn
         YGjDghnkvnfFkSo6RKyLXB4OEZFf58UvtUXfD8hEhQ4qkdgaLkhTsMw6CHgKINUG3iAt
         UAxMEX8wUL+kUCpgdRO/HPxMVx/z1QMRNxBQ3ifntEeodrM0FGvEhMHt317ZCC1OHiYf
         En3A==
X-Gm-Message-State: AFuF++nsF0khxzbrfSVeFnuRaMsFnKb3gMJyNUztCQKDKBorR02YoTmd
	fDzgYF/LqGvuoRrykoPM6Fmyn35qACmYZiX/zYMg+baxqxbCCz/4zOcmsIDfug==
X-Gm-Gg: AR+sD10vmCQqG1ASLDD2ACy0niPHNt+Tls/TkpfNuoZbblWE/utcyB3j9DTDxbBoifD
	faQUW6sBUV++I5svWArS7CiKtxY//HNnOWY1E3KO9w5rEl02+p3BaShf2GzBSpJcFqZBjHFABea
	UOe04UERiWb2L8GBkr+zTyTxYMsKy8YM08hI9rCc4RNDw02PdrAyWosy/a+MZmC/fvQgqUR4NMo
	mK3X+2EZBW9lZjLzK89Vx+S1lKb5HeyRm1mZSldnRO+m9kGEGubJMzkN5aRugWbPzCIGIVC1g+m
	s8tVtRCnEpDrnZ/WFJJ4PePtkyvxcK37fV5e8RncnSW3hX1ipnP0l/ZMCLWu08t5eZZ8I7eWgNA
	rXBvihq/VhhKDW+SFywmcUchWWm3dJuKSLOwAV5MG/0UTZ2lZeA5NX8kFXL/5LmIa6WGz1vLtmX
	fMqiMy38UGrEJ7N0xMwtynFU7cT2Rp2m4ivrX7dXKuo7/IGzm82mWIWewDK+fRR38JfjGf+XTui
	g==
X-Received: by 2002:a17:90b:5303:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-395c354cbffmr34125613a91.3.1787485957683;
        Sun, 23 Aug 2026 04:52:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 12/20] python3-filelock: set CVE_PRODUCT
Date: Sun, 23 Aug 2026 23:51:50 +1200
Message-ID: <20260823115158.1582363-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129446

From: Devansh Patel <devanshp@cisco.com>

The inherited python:filelock mapping does not identify the tox-dev source packaged by this recipe, so filelock CVEs are missed.

Use tox-dev:filelock to match the source identity used by NVD and CNA.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 43fd2c88f1ab439bd933af2a7bf1c7b0db3e77dd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index 6f1a32ef8f..9308674f9a 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -5,6 +5,8 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
+CVE_PRODUCT = "tox-dev:filelock"
+
 SRC_URI += "file://run-ptest"
 SRC_URI[sha256sum] = "b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694"
 

