Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11839.1597228056367720344
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 03:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53212 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5nyo-0001gR-7K; Wed, 12 Aug 2020 13:27:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-huey: Upgrade 2.2.0 -> 2.3.0
Date: Wed, 12 Aug 2020 13:27:23 +0300
Message-Id: <20200812102726.4376-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812102726.4376-1-leon.anavi@konsulko.com>
References: <20200812102726.4376-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade to release 2.3.0:

- Use monotonic clock for timing operations within the consumer.
- Ensure internal state is cleaned up on file-lock when released.
- Support passing around TaskException as a pickled value.
- Set the multiprocessing mode to "fork" on MacOS and Python 3.8
  or newer.
- Added option to enforce FIFO behavior when using Sqlite as
  storage.
- Added the on_shutdown handler to djhuey namespace.
- Ensure exception is set on AsyncResult in mini-huey.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_2.2.0.bb => python3-huey_2.3.0.bb}   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.2.0.bb => python3-huey_2.3.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
index cac6be954..f70a349fd 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
@@ -4,7 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
-SRC_URI[sha256sum] = "15cef4225f7ae200fbecf89a0fed13e389fd751d6c8e1d3b26562b7df953de0e"
+
+SRC_URI[md5sum] = "aa9f2a8f54cb68c62690c5e28589f49c"
+SRC_URI[sha256sum] = "76978840a875607cd77c283c4ebf3ea5071b2ec06a1ac428d63be0d88f1e7070"
 
 inherit pypi setuptools3
 
-- 
2.17.1

