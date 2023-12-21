Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCC0C46CD2
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:06:30 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.925.1703181983118769472
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:06:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-35fd04ede25so4277345ab.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703181981; x=1703786781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yGNOunO+gVolVIlbFkEAI4uLfHNhFl2pGH/JvyEgv0=;
        b=P4STvCtJ15qRiqJL4G8YummSHbMCXsRBlYgIA06Lmdb0deaus+zQz9HA7Txj2EXjg6
         mgTqxOCriRshYifD9xuSTqTMhQZ2MnY/7D8Dq2CA8t7DKQL22/2KH53jGFRtlBfChmCj
         PNcIUDO6X0/H2t4Va+GD/tn+Gg0qF6ny1uvfY+oHZOhn/JxFY8NmhoWTKjOZb6zTyK1N
         MfoDSb0r2hD8SXe9D8qg4VICb0KnN2rj0xK8D3XeEEKDJ29BnuDqWJxnCyxnrgSJ99PU
         G0orDLfbr1uyz4KqlcJxIi3larql9rfO5/r2wx6lfd4UYoRK95BvBZHNV0pGTAaUhLlF
         UE9g==
X-Gm-Message-State: AOJu0YwMPkrOjjdJPP6+86V1Y3YKRoFadiOp4cUZwdZJgzhU0Oq/N9SF
	eM6INV3O05OJ0+VUq+5s/bTkQTF3DHG66w==
X-Google-Smtp-Source: AGHT+IGxFUc0mVq4+N11NKeGj90MtsM+O4ArCUJEGuFPyIwuCCovvZfNPlp4sYzorUYGs0SUZ7qAHQ==
X-Received: by 2002:a05:6e02:12e3:b0:35f:71ce:cccc with SMTP id l3-20020a056e0212e300b0035f71ceccccmr39599iln.7.1703181981345;
        Thu, 21 Dec 2023 10:06:21 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ck5-20020a056e02370500b0035d7c676117sm644927ilb.11.2023.12.21.10.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:06:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] gyp: update to the latest commit
Date: Thu, 21 Dec 2023 18:06:09 +0000
Message-Id: <20231221180609.3902636-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107726

NOTE: gyp is now idle, and support will be removed in future releases
https://chromium.googlesource.com/external/gyp/+/d6c5dd51dc3a60bf4ff32a5256713690a1a10376

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...01-Fix-for-Python-3.10-compatibility.patch | 36 -------------------
 meta-python/recipes-devtools/gyp/gyp_git.bb   |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch

diff --git a/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch b/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
deleted file mode 100644
index d1ac2c6b4..000000000
--- a/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From bfe579283e5fcab60172818bfe4e6e1d40c2bed0 Mon Sep 17 00:00:00 2001
-From: Kurt Kiefer <kurt.kiefer@arthrex.com>
-Date: Mon, 18 Oct 2021 11:21:14 -0700
-Subject: [PATCH] Fix for Python 3.10 compatibility
-
-The collections.abc module replaces collections for Python 3.10
-
-Signed-off-by: Kurt Kiefer <kurt.kiefer@arthrex.com>
----
-Upstream-Status: Pending
-
- pylib/gyp/common.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pylib/gyp/common.py b/pylib/gyp/common.py
-index b268d229..4f9cb0ec 100644
---- a/pylib/gyp/common.py
-+++ b/pylib/gyp/common.py
-@@ -4,7 +4,7 @@
- 
- from __future__ import with_statement
- 
--import collections
-+import collections.abc
- import errno
- import filecmp
- import os.path
-@@ -494,7 +494,7 @@ def uniquer(seq, idfun=None):
- 
- 
- # Based on http://code.activestate.com/recipes/576694/.
--class OrderedSet(collections.MutableSet):
-+class OrderedSet(collections.abc.MutableSet):
-   def __init__(self, iterable=None):
-     self.end = end = []
-     end += [None, end, end]         # sentinel node for doubly linked list
diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
index 38906de75..0f94a4476 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
 SECTION = "devel"
 
 SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https;branch=master \
-           file://0001-Fix-for-Python-3.10-compatibility.patch \
            "
-SRCREV = "caa60026e223fc501e8b337fd5086ece4028b1c6"
+SRCREV = "a03d7413becefc8d55c8aa3df58b55b9bd0e9052"
 
 S = "${WORKDIR}/git"
 PV = "0.1+git${SRCPV}"
-- 
2.34.1


