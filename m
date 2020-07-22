Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.15990.1595414957819166233
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 03:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55352 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyCJF-0001ZT-JZ; Wed, 22 Jul 2020 13:49:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-pymysql: Upgrade 0.9.3 -> 0.10.0
Date: Wed, 22 Jul 2020 13:48:59 +0300
Message-Id: <20200722104905.15499-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 0.10.0:

- MariaDB ed25519 auth is supported.
- Python 3.4 support is dropped.
- Context manager interface is removed from Connection. It will
  be added with different meaning.
- MySQL warnings are not shown by default because many user report
  issue to PyMySQL issue tracker when they see warning. You need
  to call "SHOW WARNINGS" explicitly when you want to see warnings.
- Formatting of float object is changed from "3.14" to "3.14e0".
- Use cp1252 codec for latin1 charset.
- Fix decimal literal.
- TRUNCATED_WRONG_VALUE_FOR_FIELD, and ILLEGAL_VALUE_FOR_TYPE are
  now DataError instead of InternalError.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymysql_0.9.3.bb => python3-pymysql_0.10.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_0.9.3.bb => python3-pymysql_0.10.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb b/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
index 6a64ccb16..895c47b03 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[md5sum] = "e5d9183cc0a775ac29f9e0365cca6556"
-SRC_URI[sha256sum] = "d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7"
+SRC_URI[md5sum] = "d08058b1592724d5808c43f56050f245"
+SRC_URI[sha256sum] = "e14070bc84e050e0f80bf6063e31d276f03a0bb4d46b9eca2854566c4ae19837"
 
 PYPI_PACKAGE = "PyMySQL"
 inherit pypi setuptools3
-- 
2.17.1

