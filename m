Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3243.1591693894504976825
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 02:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiaI8-0004oW-OA; Tue, 09 Jun 2020 12:11:33 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-oauthlib: Upgrade 2.0.6 -> 3.1.0
Date: Tue,  9 Jun 2020 12:11:21 +0300
Message-Id: <20200609091121.23832-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609091121.23832-1-leon.anavi@konsulko.com>
References: <20200609091121.23832-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.1.0. The year in file LICENCE has been
updated therefore the checksum has been changed but it still
remains a BSD license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-oauthlib_2.0.6.bb => python3-oauthlib_3.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_2.0.6.bb => python3-oauthlib_3.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
index 73fd30cb3..fe27e8e50 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "A generic, spec-compliant, thorough implementation of the OAuth reque
 HOMEPAGE = "https://github.com/idan/oauthlib"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ba9ce41463615e082609806255bce1b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=abd2675e944a2011aed7e505290ba482"
 
-SRC_URI[md5sum] = "277a9a966cc8c72e492b4eeb41332445"
-SRC_URI[sha256sum] = "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1"
+SRC_URI[md5sum] = "43cb2b5bac983712ee55076b61181cc2"
+SRC_URI[sha256sum] = "bee41cc35fcca6e988463cacc3bcb8a96224f470ca547e697b604cc697b2f889"
 
 inherit pypi setuptools3
 
-- 
2.17.1

