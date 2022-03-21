Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC10FC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 01:21:39 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.25199.1647825699356668365
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 18:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22L1LbZZ017195
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 18:21:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22L1LbG1016841
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 18:21:37 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 20 Mar 2022 18:21:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 20 Mar 2022 18:21:36 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 20 Mar 2022 18:21:36 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] syslog-ng: update from 3.31.2 to 3.26.1
Date: Sun, 20 Mar 2022 18:21:36 -0700
Message-ID: <20220321012136.188270-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220321012136.188270-1-Randy.MacLeod@windriver.com>
References: <20220321012136.188270-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 01:21:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96101

Drop two patches that are upstream now:
   90459087f scl: fix wrong ownership during installation
   c1054d3f6 python: s/python/python3/ shebang (exclude tests)

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...-wrong-ownership-during-installation.patch | 30 -----------
 ...5-.py-s-python-python3-exclude-tests.patch | 53 -------------------
 ...yslog-ng_3.31.2.bb => syslog-ng_3.36.1.bb} |  5 +-
 3 files changed, 1 insertion(+), 87 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0002-scl-fix-wrong-ownership-during-installation.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0005-.py-s-python-python3-exclude-tests.patch
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.31.2.bb => syslog-ng_3.36.1.bb} (95%)

diff --git a/meta-oe/recipes-support/syslog-ng/files/0002-scl-fix-wrong-ownership-during-installation.patch b/meta-oe/recipes-support/syslog-ng/files/0002-scl-fix-wrong-ownership-during-installation.patch
deleted file mode 100644
index b2683350b..000000000
--- a/meta-oe/recipes-support/syslog-ng/files/0002-scl-fix-wrong-ownership-during-installation.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7a8c458b7acf4732af74317f8a535077eb451b1e Mon Sep 17 00:00:00 2001
-From: Ming Liu <ming.liu@windriver.com>
-Date: Thu, 17 Jul 2014 05:37:08 -0400
-Subject: [PATCH] scl: fix wrong ownership during installation
-
-The ownership of build user is preserved for some target files, fixed it by
-adding --no-same-owner option to tar when extracting files.
-
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
-
-Upstream-Status: Backport [9045908]
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- scl/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scl/Makefile.am b/scl/Makefile.am
-index 940a467..3c19e50 100644
---- a/scl/Makefile.am
-+++ b/scl/Makefile.am
-@@ -51,7 +51,7 @@ scl-install-data-local:
- 		fi; \
- 	done
- 	$(mkinstalldirs) $(DESTDIR)/$(scldir)
--	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) && tar xf -)
-+	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) && tar xf - --no-same-owner)
- 	chmod -R u+rwX $(DESTDIR)/$(scldir)
- 
- scl-uninstall-local:
diff --git a/meta-oe/recipes-support/syslog-ng/files/0005-.py-s-python-python3-exclude-tests.patch b/meta-oe/recipes-support/syslog-ng/files/0005-.py-s-python-python3-exclude-tests.patch
deleted file mode 100644
index a8be7d81d..000000000
--- a/meta-oe/recipes-support/syslog-ng/files/0005-.py-s-python-python3-exclude-tests.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b64fcc414316592968f181c85447cfd01d1e461e Mon Sep 17 00:00:00 2001
-From: Yi Fan Yu <yifan.yu@windriver.com>
-Date: Thu, 15 Apr 2021 13:48:19 -0400
-Subject: [PATCH] *.py: s/python/python3/ (exclude tests)
-
-As stated by https://github.com/syslog-ng/syslog-ng/pull/3603
-python2 is EOL.
-
-Fix all shebangs calling python instead of python3
-except the tests.
-
-(correcting lib/merge-grammar.py)
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-(adding the rest)
-Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/3647]
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- contrib/scripts/config-graph-json-to-dot.py | 2 +-
- lib/merge-grammar.py                        | 2 +-
- modules/python/pylib/setup.py               | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/contrib/scripts/config-graph-json-to-dot.py b/contrib/scripts/config-graph-json-to-dot.py
-index 4955c81..0351a9a 100755
---- a/contrib/scripts/config-graph-json-to-dot.py
-+++ b/contrib/scripts/config-graph-json-to-dot.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- import json, sys
- 
- j = None
-diff --git a/lib/merge-grammar.py b/lib/merge-grammar.py
-index 7313ff5..459712d 100755
---- a/lib/merge-grammar.py
-+++ b/lib/merge-grammar.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #############################################################################
- # Copyright (c) 2010-2017 Balabit
- #
-diff --git a/modules/python/pylib/setup.py b/modules/python/pylib/setup.py
-index 23bb5cc..a2fa05e 100755
---- a/modules/python/pylib/setup.py
-+++ b/modules/python/pylib/setup.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #############################################################################
- # Copyright (c) 2015-2016 Balabit
- #
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
similarity index 95%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
index 92b66e9ce..40bbfe495 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
@@ -22,12 +22,9 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://volatiles.03_syslog-ng \
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
-           file://0002-scl-fix-wrong-ownership-during-installation.patch \
-           file://0005-.py-s-python-python3-exclude-tests.patch \
 "
 
-SRC_URI[md5sum] = "69ef4dc5628d5e603e9e4a1b937592f8"
-SRC_URI[sha256sum] = "2eeb8e0dbbcb556fdd4e50bc9f29bc8c66c9b153026f87caa7567bd3139c186a"
+SRC_URI[sha256sum] = "90a25c9767fe749db50f118ddfc92ec71399763d2ecd5ad4f11ff5eea049e60b"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
-- 
2.31.1


