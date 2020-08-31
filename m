Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.48154.1598857433310606386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57066 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCdr5-0006cW-O7; Mon, 31 Aug 2020 10:03:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-hpack: Consolidate in a single file
Date: Mon, 31 Aug 2020 10:03:16 +0300
Message-Id: <20200831070318.6573-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831070318.6573-1-leon.anavi@konsulko.com>
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
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
 .../python-hpack/python-hpack.inc                     | 10 ----------
 .../python-hpack/python3-hpack_3.0.0.bb               | 11 +++++++++--
 2 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-hpack/python-hpack.inc

diff --git a/meta-python/recipes-connectivity/python-hpack/python-hpack.inc b/meta-python/recipes-connectivity/python-hpack/python-hpack.inc
deleted file mode 100644
index eccfa8c56..000000000
--- a/meta-python/recipes-connectivity/python-hpack/python-hpack.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Pure-Python HPACK header compression"
-HOMEPAGE = "https://github.com/python-hyper/hpack"
-LICENSE = "MIT"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
-
-SRC_URI[md5sum] = "556b0ae66180f54c2ce8029a0952088b"
-SRC_URI[sha256sum] = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2"
-
-inherit pypi
diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
index e196c55b3..742f34f2f 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
@@ -1,3 +1,10 @@
-require python-hpack.inc
+DESCRIPTION = "Pure-Python HPACK header compression"
+HOMEPAGE = "https://github.com/python-hyper/hpack"
+LICENSE = "MIT"
 
-inherit setuptools3
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
+
+SRC_URI[md5sum] = "556b0ae66180f54c2ce8029a0952088b"
+SRC_URI[sha256sum] = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2"
+
+inherit pypi setuptools3
-- 
2.17.1

