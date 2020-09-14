Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.60143.1600089350256378200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKi-0000ED-LZ; Mon, 14 Sep 2020 16:15:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-pymysql: Upgrade 0.10.0 -> 0.10.1
Date: Mon, 14 Sep 2020 16:15:29 +0300
Message-Id: <20200914131536.6072-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.10.1:

- Fix missing import of ProgrammingError.
- Fix auth switch request handling.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymysql_0.10.0.bb => python3-pymysql_0.10.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_0.10.0.bb => python3-pymysql_0.10.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
index 895c47b03..15ace44ac 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[md5sum] = "d08058b1592724d5808c43f56050f245"
-SRC_URI[sha256sum] = "e14070bc84e050e0f80bf6063e31d276f03a0bb4d46b9eca2854566c4ae19837"
+SRC_URI[md5sum] = "4a1fe973afbbdd78928650118ce8ff68"
+SRC_URI[sha256sum] = "263040d2779a3b84930f7ac9da5132be0fefcd6f453a885756656103f8ee1fdd"
 
 PYPI_PACKAGE = "PyMySQL"
 inherit pypi setuptools3
-- 
2.17.1

