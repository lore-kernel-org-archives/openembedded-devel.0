Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.21413.1591972937318002326
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52426 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjksq-0006Jj-7h; Fri, 12 Jun 2020 17:42:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-kconfiglib: Consolidate in a single file
Date: Fri, 12 Jun 2020 17:41:59 +0300
Message-Id: <20200612144201.4536-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612144201.4536-1-leon.anavi@konsulko.com>
References: <20200612144201.4536-1-leon.anavi@konsulko.com>
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-kconfiglib_14.1.0.bb                | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
index ab0944ff7..ec09cfc58 100644
--- a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
@@ -1,2 +1,10 @@
-require python-kconfiglib.inc
+DESCRIPTION = "Kconfiglib is a Kconfig implementation in Python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c"
+
+SRC_URI[md5sum] = "4ad68618824d4bad1d1de1d7eb838bba"
+SRC_URI[sha256sum] = "bed2cc2216f538eca4255a83a4588d8823563cdd50114f86cf1a2674e602c93c"
+
 inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

