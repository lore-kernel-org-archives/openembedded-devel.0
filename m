Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14646.1592822185265691579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJoM-0005ty-2Z; Mon, 22 Jun 2020 13:36:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-lrparsing: Consolidate in a single file
Date: Mon, 22 Jun 2020 13:35:42 +0300
Message-Id: <20200622103542.27830-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-lrparsing.inc                | 16 ----------------
 .../python/python3-lrparsing_1.0.16.bb         | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-lrparsing.inc

diff --git a/meta-python/recipes-devtools/python/python-lrparsing.inc b/meta-python/recipes-devtools/python/python-lrparsing.inc
deleted file mode 100644
index d125151cd..000000000
--- a/meta-python/recipes-devtools/python/python-lrparsing.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Python LR parsing library"
-SECTION = "devel/python"
-LICENSE = "AGPL-3.0"
-LIC_FILES_CHKSUM = "file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788"
-
-HOMEPAGE = "http://lrparsing.sourceforge.net/"
-BUGTRACKER = "https://sourceforge.net/p/lrparsing/tickets/"
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lrparsing/files/"
-UPSTREAM_CHECK_REGEX = "lrparsing-(?P<pver>\d+(\.\d+)+)"
-SRC_URI = "${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz"
-SRC_URI[md5sum] = "34357d69bce87654d792cd8f02d148b2"
-SRC_URI[sha256sum] = "b45afda44001dc5ba632934f74c043d40cce653f1a7526cfbcb68f6be055b8d7"
-
-S = "${WORKDIR}/lrparsing-${PV}"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
index 21a80cde1..85a54af30 100644
--- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
@@ -1,2 +1,18 @@
+SUMMARY = "Python LR parsing library"
+SECTION = "devel/python"
+LICENSE = "AGPL-3.0"
+LIC_FILES_CHKSUM = "file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788"
+
+HOMEPAGE = "http://lrparsing.sourceforge.net/"
+BUGTRACKER = "https://sourceforge.net/p/lrparsing/tickets/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lrparsing/files/"
+UPSTREAM_CHECK_REGEX = "lrparsing-(?P<pver>\d+(\.\d+)+)"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz"
+SRC_URI[md5sum] = "34357d69bce87654d792cd8f02d148b2"
+SRC_URI[sha256sum] = "b45afda44001dc5ba632934f74c043d40cce653f1a7526cfbcb68f6be055b8d7"
+
 inherit setuptools3
-require python-lrparsing.inc
+
+S = "${WORKDIR}/lrparsing-${PV}"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

