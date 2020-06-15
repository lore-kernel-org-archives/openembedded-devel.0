Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.22782.1592239768571788596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 09:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43974 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jksIY-0003ws-9I; Mon, 15 Jun 2020 19:49:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python-kconfiglib.inc: Remove
Date: Mon, 15 Jun 2020 19:49:18 +0300
Message-Id: <20200615164918.822-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-1.0
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

Remove inc file because the recipe python3-kconfiglib has been
alredy consolidated in a single file. I forgot to delete the
inc file in the previous commit.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python-kconfiglib.inc | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-kconfiglib.inc

diff --git a/meta-python/recipes-devtools/python/python-kconfiglib.inc b/meta-python/recipes-devtools/python/python-kconfiglib.inc
deleted file mode 100644
index 3dc4961c8..000000000
--- a/meta-python/recipes-devtools/python/python-kconfiglib.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "Kconfiglib is a Kconfig implementation in Python"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c"
-
-SRC_URI[md5sum] = "4ad68618824d4bad1d1de1d7eb838bba"
-SRC_URI[sha256sum] = "bed2cc2216f538eca4255a83a4588d8823563cdd50114f86cf1a2674e602c93c"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

