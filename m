Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1B7C88CB8
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.3829.1686620456468378243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="120353232"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="120353232"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:54 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 853D6D29E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AA053BF4AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3691D20074724;
	Tue, 13 Jun 2023 10:40:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.26.3 -> 3.26.4
Date: Tue, 13 Jun 2023 09:40:11 +0800
Message-Id: <1686620422-29962-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--11.987900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeVk2Y4pEw4KntAY
	WUo4HSIkTJXHN8r/NGtaMorJtMi2CKXUs7kD79U2CTeoveN0UE3TlIO7ZQZ97+2lJX/+eKJIvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgGxx7vRUjbKhgW6bY8SOq3WjxY
	yRBa/qJShNCXvA0fw+jaPj0W1qn0Q7AFczfjr/7NZoIYm6U3ym6ygoTiUKfhwFJHyj4Rw3fihdU
	CZOMpQsbxdfpljB/Kw=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103240

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    chore(deps): bump cmake from 3.26.1 to 3.26.3
    chore(deps): update pre-commit hooks
    chore: remove unused requirements-deploy.txt
    chore(deps): bump pypa/cibuildwheel from 2.12.1 to 2.12.3
    chore(deps): update pre-commit hooks
    chore(deps): bump pypa/gh-action-pypi-publish from 1.8.5 to release/v1
    chore: only bump OpenSSL to 3.0.x (current LTS version)
    Update to CMake 3.26.4
    chore: use trusted publisher deployment
    chore(deps): update pre-commit hooks
    chore(deps): bump pypa/cibuildwheel from 2.12.3 to 2.13.0
    Update to OpenSSL 3.0.9
    fix(cross-compile): Fix download of arm64 CMake binaries

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.26.3.bb => python3-cmake_3.26.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.26.3.bb => python3-cmake_3.26.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.26.3.bb b/meta-python/recipes-devtools/python/python3-cmake_3.26.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.26.3.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.26.4.bb
index 8e924acd3..c66c77757 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.26.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.26.4.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "b54cde1f1c0573321b22382bd2ffaf5d08f65188572d128cd4867fb9669723c5"
+SRC_URI[sha256sum] = "d45b30b9ce7280829888c78650177ab525df2b6785e1a5b3d82b4c147d828c0e"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


