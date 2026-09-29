Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D684CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 07:07:44 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2363.1790665656493877035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 00:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VhgUE9gP;
 spf=pass (domain: gmail.com, ip: 74.125.225.141, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so21230055e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 00:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790665655; x=1791270455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WUZQEHl9VBlMzQycB49ngHetoI6+M5loDjdty2bJAM=;
        b=VhgUE9gPz92GL2LxEaZBcQmlJ15ehKDH2SSmxdSXNOuwR/p1XHzJ54087bjl7TIOpI
         8Bj57qQ18CoNds6DDFUN9eektnP7Gl/Ja5SD61NsZiftJEQncDQCmo5rd0wPecF5ifsh
         TC7vZ6DIdinnKipBYcDhY9l0TDOeXktkenQWxNa2+RsL9l/kBXPnBxWpLsGlaYlDgnWF
         kF+JIAqQY7ZSd3/eDaD5e23P2QDhFh2ZQQVmKctzYG25T78hx3m9GblgWrwQxmRW/biM
         VNDyavA50tpKPS9B567o/0g0JobWWrg0GM0kP9bhvM4g2nv3Vu0Ppes4oFfg29WjawDU
         o0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665655; x=1791270455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WUZQEHl9VBlMzQycB49ngHetoI6+M5loDjdty2bJAM=;
        b=wbwATmDDREZgdC9Vc1+qpKv7aAzmM7mf+tocfCYC9KyUc3qFBWb4FEI+5nHBAw7pOv
         UUCOVizIvqhxS37re1TDb4UJiovTja9whXq5Rasg1a+NPfOIvovi2LkwOJlb4/svivFb
         hjZJsnR6Nis6IBX2iXD8/6622lQh0OxdQGm0eGCV3Ijdz3oblyblJZ98qDXRN8ktEIxM
         rL5Y9Dat9Uf+IFct9Si7HM8vdJeVUzITnkNsAtzxGz5bBmh4swBLTDVRuZZzd10p85hq
         gny1tII8BjVXqmiadWK23nPRdFwGNea4mP/k+27SngC/0BwgW4RvFpeKfwTFKK5kfnBv
         SOxA==
X-Gm-Message-State: AFuF++nn5rjgGTJO8n1p3QbzO5lfB+5QTHX6Y835ZdSj/4JjaliU0fyb
	v4YIVI1kTHpJrmtSx5dG5rMl7+JJxfL0sOJ4RY7yYDoW8ZnT7EPZhLo0LsJD4Q==
X-Gm-Gg: AYBFou2YDRhAzONdpEidxDuCXS+tn6tvqCWrHWEPvggQTKiEvQirCr0g3Z0cccebUfd
	QRqZpimajrtCsDb90cHWins8/e8i9v9erLKLTAMxdsDAq4nu3Oi91UpQvLJyH1/8VwbwbVPtZrK
	BHYtL9WxtY8fP43dqNd20f0gNU9jH64qyHz98hJcEIRhvY2Cvg6VnFH+3GtNibp6OMzdExvvZaj
	v6dZVxFN1Iud9C5eo++lnP08DOvi35QtcOqOB3DhKgdZk7NDhwhiFDsopZoR0bog0SMy9Gj1VVH
	azAzRpHob1Z26Yib8K0BN71Ri/S23qjiN8FFoCVKnqVXkf1bSa/O3nFCSoC7DFJYIUD4pegCti4
	UMJ2mbDbLGaCp+Aom4SypLBh8ZT0EcIEZp5Vwi+3uA81o4+Fi/5fDp/x8SP7r2fBuLJicVXOObS
	srnokOS1PXIrggiDLM6UINjjb/kfvAYDr1r3nOWzxKjspWHcy9k72ZUhq5kBKOkfLUG9DA+UalT
	l9v8xwa5MhiGPjtHJDjLSt821PGNrww9Vl8fmVRWV8YlUNBmuOYZ6Yy/R3UK5dnKlYl
X-Received: by 2002:a05:600c:a15:b0:49f:e444:cc4c with SMTP id 5b1f17b1804b1-49ff06bdb00mr205259635e9.12.1790665654439;
        Tue, 29 Sep 2026 00:07:34 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm53918115e9.5.2026.09.29.00.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:07:33 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-asyncvarlink: add recipe
Date: Tue, 29 Sep 2026 08:07:12 +0100
Message-ID: <20260929070713.2220524-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 07:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130472

asyncio Varlink binding with file-descriptor passing; interfaces are
derived from annotated Python classes.

AI-Generated: Claude Opus 5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-asyncvarlink_0.3.2.bb      | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d9a91512763e..9d07fc44e27a 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -39,6 +39,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-asttokens \
     python3-async-timeout \
     python3-asyncio-glib \
+    python3-asyncvarlink \
     python3-attr \
     python3-autobahn \
     python3-automat \
diff --git a/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb b/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb
new file mode 100644
index 000000000000..66c69df5a8f5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb
@@ -0,0 +1,24 @@
+SUMMARY = "asyncio-compatible, type-driven Varlink implementation"
+DESCRIPTION = "An asyncio Varlink binding supporting file-descriptor passing, \
+with interfaces derived from annotated Python classes."
+HOMEPAGE = "https://github.com/helmutg/asyncvarlink"
+SECTION = "devel/python"
+
+LICENSE = "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
+
+SRC_URI = "git://github.com/helmutg/asyncvarlink.git;protocol=https;branch=main"
+SRCREV = "3e16139f72c7374f2ca3640045ef7162c98e7a4c"
+
+inherit python_flit_core ptest-python-pytest
+
+RDEPENDS:${PN} = "\
+    python3-asyncio \
+    python3-core \
+    python3-io \
+    python3-json \
+    python3-logging \
+"
+
+# tests/test_conversion.py:ConversionTests.test_invalid fails with less than ~2GB of RAM
+RDEPENDS:${PN}-ptest += "python3-hypothesis python3-netclient python3-unittest"

