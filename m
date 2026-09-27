Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C875AC98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:55:40 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43777.1790538936655830516
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sF4A0nXu;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so2149552eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 12:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790538936; x=1791143736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thkgaQObw1I8p4U+3LQG/929L+L8HC8keb3QSehhLDY=;
        b=sF4A0nXuCmfWQN0WAK3qSlCliHxzhWZErnbcYxRbRtC7oSSVCNDhe0VizvaV3g4Png
         V8caGpxdqMeK5drWytwJbSs5x0hCI1A8YI4LNpKwE0kwqzEw07TTLRS+cbu72OKR8u23
         J7yGjHtSuKfupW8c/jWCXu9eW7guTfBKNCY3zsCM/GGsO/OWoEJzX4aMzacCIWSFPtWx
         WuB9/VJZHmcxqg4AoLicGz522LR/Bwz50C4OGTEGyKecG/RlKZSpwiGZikX3iR/WwWFj
         fgK74LoSi9vzjDIdIHWax3bvxFrpWfokgC+PNTmGUMmd1uBSMpuWyB5BmNlUA0GMrLob
         z2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790538936; x=1791143736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thkgaQObw1I8p4U+3LQG/929L+L8HC8keb3QSehhLDY=;
        b=ZcqQNdE6ON9riYPfAmYQR0WWCqba8PXluAjUSDGrCtdgz6o0Goi4HvrGKfMGGHafX7
         Djm+vrwFEwD5TLCVkZL3bjsl1GTEphUrZUdEx10blO1KGy1ad6+VzgTEYzbsrsys+O0X
         J0zw9vuz9XT9LK/HnjkKq6DHXhFzkP2UP4cmmUa8m4HMr384EqHcR198eo4v/L+a3DGg
         Gg+1ceH2xM3TC74TKgKusqbHXdHhF+18entA8rsuSSs+u6vXplEbljpw8SolqXAN0jAS
         e0NTHLBsTlIDw+9pcyVZl2bVCnvokiR5RnTBbAsJvoJr4G6F6d5MO7AFPBI0i0/Jjg+o
         9pgg==
X-Gm-Message-State: AFq9FYJSYJNmQ6l+L61gsN9/h+XA64Ddd4AlFronbkUfVFAolshe/0L7
	eDOIq4ZtA1loWT2XzdihOHirE2JHkqlU57zcogDiuIn/MDMlwTiVfDFqWoVJvs2T
X-Gm-Gg: AYBFou2VCUyltbH09+G36w8CGLoxVXtRNeQ5Mr31YKYMDfu1scwBM/q0kpXjUdXszwY
	xmeNpTD4a1fI6qWR4IVyObJU261pzeTTGThGeTwhzkQoWeqFhF6G3Ft9jc+h0gUAb3rN7E2J9yg
	IbxCWuIDh+7wEOuGMWBqc7MXIYD6rnTfYO+Dv4CPB+LUBydY+8F2mU3e17dpkH/h9/wLVcGXd1O
	+gGNkgIkheWpCKP0kN2FQG5uXoKWER1Kt3hI7JjtzjPe2rxjl3o+eU9CYuUOKkCApYud/Q5Bn2N
	7tzJtWjqqX61U7NvzNPxqIbX51SaeasCWDnhqEuqxWcNfo1nZJbqd+PPCaBZXu0gFtyfxeSarqI
	CqiPxs8qTUja5fUsKc+i76RUjawgBdYHsinaLMONp9pjGGvV1yC7mxtU+IcjHSp4vED2W4Fj7A5
	594MX+f1lIyGdxbWHmSfPNFXydhiVM3CdCGNdYzRf98iIoBWpO4NrZ3BUp6uMLLUoH/HxP3y0iv
	izspyy6pPe/31NOIkFdDBS1KXctzNxYiwRHUQ+zlAXjkvSB2VVtHRabnNNX+tO9Sgx2jPBGTiUU
	K4LIJCk6vNkPloSmhUIiRS44BR5q7mqc00ZRk4MuUXWFAITsl+Z+fIAehIsMDQRMwv2BfttBUxG
	esnX7bDj1ISRDQgDImA6hZ3m6B3xWMZpCRe29VhswFa80hzzJewGh5WRNhr6nkYpTSUILXe/k+q
	UYK7nqJsaCHWrH4YCsjjkL4uqS/kNOKht2Qzr6kw==
X-Received: by 2002:a05:7301:78c6:b0:33b:edf8:1919 with SMTP id 5a478bee46e88-342707b407dmr7660811eec.13.1790538935876;
        Sun, 27 Sep 2026 12:55:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-342c9c245a7sm14932928eec.11.2026.09.27.12.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:55:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/2] python3-filelock: upgrade 3.32.4 -> 4.0.4
Date: Sun, 27 Sep 2026 12:55:31 -0700
Message-ID: <20260927195531.101194-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927195531.101194-1-khem.raj@oss.qualcomm.com>
References: <20260927195531.101194-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 19:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130379

Add python3-crypt to RDEPENDS: the library now imports hashlib
(_identity.py, pulled in by "import filelock" through the soft and
strict locks).

Changelog: https://github.com/tox-dev/filelock/blob/4.0.4/docs/changelog.rst

4.0.4
- Hostnames differing only past their first 253 escaped characters now
  publish distinct soft-lock owners.

4.0.3
- Skip the fork-safety audit hook on CPython 3.10/3.11, where it broke
  thread creation under coverage or a debugger.

4.0.2
- Fix OS lock leaks, double closes and false deadlocks from concurrent
  acquire()/release() on thread_local=False locks.
- Async read-write locks give each asyncio task its own hold.

4.0.1
- Validate poll_interval at construction, on the setter and on acquire().

4.0.0 (breaking)
- SoftReadWriteLock uses a new on-disk generation-log protocol under
  <path>.rw that earlier releases do not see; all participants on a lock
  path must be upgraded together. It now requires os.link.
- SoftReadWriteLock exposes a generation fencing token, reports lost
  holds through on_compromise, and no longer deadlocks when a holder on
  another host dies mid-transition.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-filelock_3.32.4.bb => python3-filelock_4.0.4.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.32.4.bb => python3-filelock_4.0.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb b/meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb
index e3642b2087..23cc4484c8 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "2bde2e4cf732e0153406d8a7bc80620ecf5e621fe0d25e41143c4e3b4733ff30"
+SRC_URI[sha256sum] = "90999ed63a26ccf86b93b959ab10cf1017f422d816be454ed54cbed263e71ab5"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -21,6 +21,7 @@ DEPENDS += "\
 
 RDEPENDS:${PN} += " \
     python3-core \
+    python3-crypt \
     python3-logging \
     python3-asyncio \
 "

