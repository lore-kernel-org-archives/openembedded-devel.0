Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.38443.1599227246404039793
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kEC3o-0000aK-Ev; Fri, 04 Sep 2020 16:47:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-hyperframe: Consolidate in a single file
Date: Fri,  4 Sep 2020 16:47:08 +0300
Message-Id: <20200904134713.13164-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904134713.13164-1-leon.anavi@konsulko.com>
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
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
 .../python-hyperframe/python-hyperframe.inc           | 10 ----------
 .../python-hyperframe/python3-hyperframe_5.2.0.bb     | 11 +++++++++--
 2 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc

diff --git a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc b/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
deleted file mode 100644
index 0066bf8e6..000000000
--- a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "HTTP/2 framing layer for Python"
-HOMEPAGE = "https://github.com/python-hyper/hyperframe"
-LICENSE = "MIT"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
-
-SRC_URI[md5sum] = "6919183242feb26d8bce3b4cba81defd"
-SRC_URI[sha256sum] = "a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f"
-
-inherit pypi
diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
index f10fb6df1..e5ef1ff38 100644
--- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
+++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
@@ -1,3 +1,10 @@
-require python-hyperframe.inc
+DESCRIPTION = "HTTP/2 framing layer for Python"
+HOMEPAGE = "https://github.com/python-hyper/hyperframe"
+LICENSE = "MIT"
 
-inherit setuptools3
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
+
+SRC_URI[md5sum] = "6919183242feb26d8bce3b4cba81defd"
+SRC_URI[sha256sum] = "a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f"
+
+inherit pypi setuptools3
-- 
2.17.1

