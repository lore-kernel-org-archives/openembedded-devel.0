Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.15899.1593011804027218288
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo78m-00035d-OO; Wed, 24 Jun 2020 18:16:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-netifaces: Consolidate in a single file
Date: Wed, 24 Jun 2020 18:16:20 +0300
Message-Id: <20200624151628.547-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
References: <20200624151628.547-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-netifaces.inc     | 10 ----------
 .../python/python3-netifaces_0.10.9.bb               | 12 ++++++++++--
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-netifaces.inc

diff --git a/meta-python/recipes-devtools/python/python-netifaces.inc b/meta-python/recipes-devtools/python/python-netifaces.inc
deleted file mode 100644
index daccc4fba..000000000
--- a/meta-python/recipes-devtools/python/python-netifaces.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Portable network interface information for Python"
-SECTION = "devel/python"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
-
-SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
-SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
index 69d5c674c..7edb7e7fb 100644
--- a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
+++ b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
@@ -1,2 +1,10 @@
-require python-netifaces.inc
-inherit setuptools3
+DESCRIPTION = "Portable network interface information for Python"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
+
+SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
+SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
+
+inherit pypi setuptools3
-- 
2.17.1

