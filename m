Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7254.1594201644125540812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jt6fi-0007zg-6N; Wed, 08 Jul 2020 12:47:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-pyconnman: Consolidate in a single file
Date: Wed,  8 Jul 2020 12:46:58 +0300
Message-Id: <20200708094659.27331-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708094659.27331-1-leon.anavi@konsulko.com>
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
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
 .../python-pyconnman/python-pyconnman.inc           | 12 ------------
 .../python-pyconnman/python3-pyconnman_0.2.0.bb     | 13 ++++++++++---
 2 files changed, 10 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
deleted file mode 100644
index 8517079bf..000000000
--- a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Python-based Network Connectivity Management"
-HOMEPAGE = "https://pypi.python.org/pypi/pyconnman/"
-LICENSE = "Apache-2.0"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI[md5sum] = "d60bdffbd9c920f005fdc5e05a8b94cd"
-SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
-
-inherit pypi
-
-RDEPENDS_${PN} = "connman"
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
index e0f3fdd75..b80c167bb 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
+++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
@@ -1,5 +1,12 @@
-require python-pyconnman.inc
+DESCRIPTION = "Python-based Network Connectivity Management"
+HOMEPAGE = "https://pypi.python.org/pypi/pyconnman/"
+LICENSE = "Apache-2.0"
 
-inherit setuptools3
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-RDEPENDS_${PN} += "python3-dbus python3-pprint"
+SRC_URI[md5sum] = "d60bdffbd9c920f005fdc5e05a8b94cd"
+SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "connman python3-dbus python3-pprint"
-- 
2.17.1

