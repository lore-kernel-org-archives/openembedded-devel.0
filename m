Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.18245.1596201781966125844
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1Uzz-000741-Ph; Fri, 31 Jul 2020 16:23:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/15] python3-pymongo: Upgrade 3.10.1 -> 3.11.0
Date: Fri, 31 Jul 2020 16:22:20 +0300
Message-Id: <20200731132230.20031-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.11.0:

- Added support for MongoDB 4.4.
- Fixed a bug in change streams that could cause PyMongo to miss
  some change documents when resuming a stream that was started
  without a resume token and whose first batch did not contain any
  change documents.
- Fixed an bug where using gevent.Timeout to timeout an operation
  could lead to a deadlock.

For more details:
https://pymongo.readthedocs.io/en/3.11.0/changelog.html

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymongo_3.10.1.bb => python3-pymongo_3.11.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.10.1.bb => python3-pymongo_3.11.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
index f69ca53cf..635de22d2 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "e31b9c0190c9eaf1f792d0277b2a8ebe"
-SRC_URI[sha256sum] = "993257f6ca3cde55332af1f62af3e04ca89ce63c08b56a387cdd46136c72f2fa"
+SRC_URI[md5sum] = "5d166c8f9500c83314deadebb95b6fd5"
+SRC_URI[sha256sum] = "076a7f2f7c251635cf6116ac8e45eefac77758ee5a77ab7bd2f63999e957613b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

