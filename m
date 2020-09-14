Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.56410.1600074270272948681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52584 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHkPU-0007z1-Hn; Mon, 14 Sep 2020 12:04:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-texttable: Upgrade 1.6.2 -> 1.6.3
Date: Mon, 14 Sep 2020 12:04:12 +0300
Message-Id: <20200914090419.19171-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914090419.19171-1-leon.anavi@konsulko.com>
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 1.6.3:

- Improve int conversion

License-Update: Update copyright year to 2020.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-texttable_1.6.2.bb                 | 11 -----------
 .../python/python3-texttable_1.6.3.bb                 | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
deleted file mode 100644
index b507008f4..000000000
--- a/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "module for creating simple ASCII tables"
-HOMEPAGE = "https://github.com/foutaise/texttable/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=af37e32174857b1f2043245f3651c824"
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "763141f0bdf598cdc5cf780ed4d2eb94"
-SRC_URI[sha256sum] = "eff3703781fbc7750125f50e10f001195174f13825a92a45e9403037d539b4f4"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb
new file mode 100644
index 000000000..03ebd010e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb
@@ -0,0 +1,11 @@
+SUMMARY = "module for creating simple ASCII tables"
+HOMEPAGE = "https://github.com/foutaise/texttable/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "68e6b31d36f5c20221da7d5db3eca772"
+SRC_URI[sha256sum] = "ce0faf21aa77d806bbff22b107cc22cce68dc9438f97a2df32c93e9afa4ce436"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

