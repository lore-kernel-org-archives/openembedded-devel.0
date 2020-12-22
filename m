Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.529.1608674267064566408
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 13:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39252 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1krpf5-0006qW-8X; Tue, 22 Dec 2020 23:57:45 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pymongo: Upgrade 3.11.0 -> 3.11.2
Date: Tue, 22 Dec 2020 23:57:27 +0200
Message-Id: <20201222215727.25166-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222215727.25166-1-leon.anavi@konsulko.com>
References: <20201222215727.25166-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.11.2:

- Fixed a memory leak caused by failing SDAM monitor checks on
  Python 3 (PYTHON-2433).
- Fixed a regression that changed the string representation of
  BulkWriteError (PYTHON-2438).
- Fixed a bug that made it impossible to use
  bson.codec_options.CodecOptions.with_options() and
  with_options() on some early versions of Python 3.4 and
  Python 3.5 due to a bug in the standard library implementation
  of collections.namedtuple._asdict() (PYTHON-2440).
- Fixed a bug that resulted in a TypeError exception when a
  PyOpenSSL socket was configured with a timeout of None
  (PYTHON-2443).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymongo_3.11.0.bb => python3-pymongo_3.11.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.0.bb => python3-pymongo_3.11.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
index 635de22d20..5372ac0ff1 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
@@ -8,8 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "5d166c8f9500c83314deadebb95b6fd5"
-SRC_URI[sha256sum] = "076a7f2f7c251635cf6116ac8e45eefac77758ee5a77ab7bd2f63999e957613b"
+SRC_URI[sha256sum] = "c2b67881392a9e85aa108e75f62cdbe372d5a3f17ea5f8d3436dcf4662052f14"
 
 inherit pypi setuptools3
 
-- 
2.17.1

