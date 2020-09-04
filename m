Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.38442.1599227245537667990
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kEC3m-0000aK-P3; Fri, 04 Sep 2020 16:47:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-priority: Consolidate in a single file
Date: Fri,  4 Sep 2020 16:47:07 +0300
Message-Id: <20200904134713.13164-4-leon.anavi@konsulko.com>
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
 .../python-priority/python-priority.inc               | 10 ----------
 .../python-priority/python3-priority_1.3.0.bb         | 11 +++++++++--
 2 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-priority/python-priority.inc

diff --git a/meta-python/recipes-connectivity/python-priority/python-priority.inc b/meta-python/recipes-connectivity/python-priority/python-priority.inc
deleted file mode 100644
index aa93819bc..000000000
--- a/meta-python/recipes-connectivity/python-priority/python-priority.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "A pure-Python implementation of the HTTP/2 priority tree"
-HOMEPAGE = "https://github.com/python-hyper/priority"
-LICENSE = "MIT"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045"
-
-SRC_URI[md5sum] = "4f1ff52f7fa448e9d9cb46337ae86d1e"
-SRC_URI[sha256sum] = "6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe"
-
-inherit pypi
diff --git a/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb b/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
index fe756b56b..5d84571f9 100644
--- a/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
+++ b/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
@@ -1,3 +1,10 @@
-require python-priority.inc
+DESCRIPTION = "A pure-Python implementation of the HTTP/2 priority tree"
+HOMEPAGE = "https://github.com/python-hyper/priority"
+LICENSE = "MIT"
 
-inherit setuptools3
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045"
+
+SRC_URI[md5sum] = "4f1ff52f7fa448e9d9cb46337ae86d1e"
+SRC_URI[sha256sum] = "6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe"
+
+inherit pypi setuptools3
-- 
2.17.1

