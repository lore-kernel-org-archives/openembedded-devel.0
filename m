Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55553C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 19:31:57 +0000 (UTC)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web10.17881.1676228354887591543
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 10:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: bhargav_das@mentor.com)
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="97835227"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 12 Feb 2023 10:59:14 -0800
IronPort-SDR: 2G1qFIcbOqgqi5M4JgT0SndQtn6b9BGcMed66M+6z3a9kSBbVz/joSJggIazExWwTrgY8cwqcJ
 fosm/i8ZSthjGEAzHcUrrp3ninwAB37/gUDVYjROA8CNtXYNEJ4K2Zs85yS6FdvyfRI4AqZPVO
 4YixaPyS0TG7/skXvs2j70UJJwMPg4paeopE+1HkRVlnAZ03sYpftGN0jH85Mqxh5POiGGXfNu
 poFADqzjglywYBU7Xnmoth6MCHZoOhTPVjN0SyVqVLS3KOv/Uo2Ut/FMeIcThkEhysts/5VVQz
 Hc8=
From: bhargav_das@mentor.com
To: <openembedded-devel@lists.openembedded.org>
CC: <bhargav.das@siemens.com>, Bhargav Das <bhargav_das@mentor.com>
Subject: [PATCH] python3-daemon_2.3.2.bb: add python-daemon recipe for python3
Date: Mon, 13 Feb 2023 00:28:50 +0530
Message-ID: <20230212185850.2856474-1-bhargav_das@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-10.mgc.mentorg.com (147.34.90.210) To
 svr-orw-mbx-13.mgc.mentorg.com (147.34.90.213)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 19:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101060

python-daemon was part of meta-python2 this has now been updated to
python3 and v2.3.2

Signed-off-by: Bhargav Das <bhargav_das@mentor.com>
---
 .../python/python3-daemon_2.3.2.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-daemon_2.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-daemon_2.3.2.bb b/meta-python/recipes-devtools/python/python3-daemon_2.3.2.bb
new file mode 100644
index 000000000..49b094fce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-daemon_2.3.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Library to implement a well-behaved Unix daemon process"
+HOMEPAGE = "https://pagure.io/python-daemon/"
+SECTION = "devel/python"
+
+DEPENDS += "${PYTHON_PN}-docutils-native"
+RDEPENDS:${PN} = "${PYTHON_PN}-docutils \
+                  ${PYTHON_PN}-lockfile (>= 0.10) \
+                  ${PYTHON_PN}-resource \
+"
+
+LICENSE = "Apache-2.0 & GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://README;md5=a3a94c615dc969a70525f1eebbacf235"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "b7397fe73d516dc14921500a1245b41c"
+SRC_URI[sha256sum] = "3deeb808e72b6b89f98611889e11cc33754f5b2c1517ecfa1aaf25f402051fb5"
+
+PYPI_PACKAGE = "python-daemon"
-- 
2.25.1


