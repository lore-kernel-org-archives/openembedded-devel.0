Return-Path: <bhargav_das@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A28EC7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 18:14:39 +0000 (UTC)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web10.2242.1683224072622472908
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 11:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: bhargav_das@mentor.com)
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="4896957"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 04 May 2023 10:14:32 -0800
IronPort-SDR: ztxV6jReEN4/tkxRK2nCnMbgYalkJ7TeDKP4wxU2pUnVza3nVF0ev+ujOIkVUd0ZUZ2VjQ9zKr
 xtO/b1/bmDsN8Jmbld7SSI4mJgrPgZeCbj6eElQTJOSs/kPk7EkJ0SjZu+GN/XFZuwU/EKUvpn
 C4FUl15OW0h2WVd64FKk0oFvuBZE8bTZsiKlAePi0YMlanHwQpM/pd+l44GI3EERSPv5A3outW
 f0GzWkUJMsxG/cOUJv7wmXuej5uVHMjrcYhIWE6e7jddgh6JEWb/lwaenz5DFyNCvy69G3I5EM
 p2U=
From: Bhargav Das <bhargav_das@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Bhargav Das <bhargav.das@siemens.com>
Subject: [meta-python][PATCH] python3-libevdev: Add recipe for python libevdev module.
Date: Thu, 4 May 2023 23:43:56 +0530
Message-ID: <20230504181356.58122-1-bhargav_das@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: svr-orw-mbx-10.mgc.mentorg.com (147.34.90.210) To
 svr-orw-mbx-13.mgc.mentorg.com (147.34.90.213)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 18:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102312

From: Bhargav Das <bhargav.das@siemens.com>

Signed-off-by: Bhargav Das <bhargav.das@siemens.com>
---
 .../python/python3-libevdev_0.11.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-libevdev_0.11.bb

diff --git a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb b/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
new file mode 100644
index 000000000..c728cd0ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "python-libevdev is a Python wrapper around the libevdev C library."
+HOMEPAGE = "https://gitlab.freedesktop.org/libevdev/python-libevdev"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] = "34b48098c1fba26de79a0d67a17a588a"
+SRC_URI[sha256sum] = "e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e560169508f560f"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "libevdev"
-- 
2.25.1


