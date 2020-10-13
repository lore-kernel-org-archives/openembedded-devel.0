Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7578.1602579564815184778
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 01:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSG9T-0002BF-2l; Tue, 13 Oct 2020 11:59:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-passlib: Upgrade 1.7.2 -> 1.7.4
Date: Tue, 13 Oct 2020 11:59:10 +0300
Message-Id: <20201013085914.31580-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013085914.31580-1-leon.anavi@konsulko.com>
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 1.7.4:

- passlib.ext.django – updated tests to pass for Django 1.8-3.1;
  along with some internal refactoring of the test classes.
- CryptContext will now throw UnknownHashError when it can't
  identify a hash provided to methods such as CryptContext.verify().
  Previously it would throw a generic ValueError.

License-Update: Updated URLs, styling fixes, bumped copyright year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-passlib_1.7.2.bb => python3-passlib_1.7.4.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-passlib_1.7.2.bb => python3-passlib_1.7.4.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
index b347163aac..fd26f3a764 100644
--- a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
@@ -7,10 +7,10 @@ tasks, from verifying a hash found in /etc/shadow, to providing full-strength pa
 hashing for multi-user applications."
 HOMEPAGE = "https://foss.heptapod.net/python-libs/passlib/wikis/home"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c8449c5e10474d113ab787ed2753bafe"
 
-SRC_URI[md5sum] = "b908529cfd4c33057c244324c692eae7"
-SRC_URI[sha256sum] = "8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8"
+SRC_URI[md5sum] = "3a229cbd00dfb33e99885b43325e0591"
+SRC_URI[sha256sum] = "defd50f72b65c5402ab2c573830a6978e5f202ad0d984793c8dde2c4152ebe04"
 
 inherit pypi setuptools3
 
-- 
2.17.1

