Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.40989.1597663765685794348
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dKN-000361-AT; Mon, 17 Aug 2020 14:29:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-bcrypt: Upgrade 3.1.7 -> 3.2.0
Date: Mon, 17 Aug 2020 14:28:54 +0300
Message-Id: <20200817112901.28914-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817112901.28914-1-leon.anavi@konsulko.com>
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.0:

- Added typehints for library functions
- Dropped support for Python versions less than 3.6
- Shipped abi3 Windows wheels (requires pip >= 20)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bcrypt_3.1.7.bb => python3-bcrypt_3.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bcrypt_3.1.7.bb => python3-bcrypt_3.2.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb b/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
rename to meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
index 3b9cd52f2..360f14be1 100644
--- a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
 DEPENDS += "${PYTHON_PN}-cffi-native"
 
-SRC_URI[md5sum] = "5d6f93b575ce52470af37a8e7dce76fe"
-SRC_URI[sha256sum] = "0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42"
+SRC_URI[md5sum] = "fe31390dab603728f756cd3d6830c80a"
+SRC_URI[sha256sum] = "5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

