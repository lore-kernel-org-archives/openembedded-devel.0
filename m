Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14689.1611077880847705742
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux5-0001eq-69; Tue, 19 Jan 2021 19:38:00 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-pymysql: Upgrade 0.10.1 -> 1.0.2
Date: Tue, 19 Jan 2021 19:37:44 +0200
Message-Id: <20210119173746.24694-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119173746.24694-1-leon.anavi@konsulko.com>
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.2:

- Fix user, password, host, database are still positional
  arguments. All arguments of connect() are now keyword-only.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymysql_0.10.1.bb => python3-pymysql_1.0.2.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_0.10.1.bb => python3-pymysql_1.0.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
index 15ace44ac..36e2921ae 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
@@ -8,8 +8,7 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[md5sum] = "4a1fe973afbbdd78928650118ce8ff68"
-SRC_URI[sha256sum] = "263040d2779a3b84930f7ac9da5132be0fefcd6f453a885756656103f8ee1fdd"
+SRC_URI[sha256sum] = "816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36"
 
 PYPI_PACKAGE = "PyMySQL"
 inherit pypi setuptools3
-- 
2.17.1

