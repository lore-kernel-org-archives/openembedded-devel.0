Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.2877.1599035634288317421
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46602 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDODH-0004fH-Tc; Wed, 02 Sep 2020 11:33:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-robotframework: Upgrade 3.2.1 -> 3.2.2
Date: Wed,  2 Sep 2020 11:33:40 +0300
Message-Id: <20200902083342.22101-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902083342.22101-1-leon.anavi@konsulko.com>
References: <20200902083342.22101-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.2, a new minor release with some bug fixes,
Libdoc enhancements and official Python 3.9 support. For more
details please visit:
https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-3.2.2.rst

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...obotframework_3.2.1.bb => python3-robotframework_3.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_3.2.1.bb => python3-robotframework_3.2.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
index a5e3a2a4f..10f031c7b 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
-SRC_URI[md5sum] = "ac8aaad885e48c6b6cd5461be5b8149f"
-SRC_URI[sha256sum] = "d693e6d06b17f48669e2a8c4cb6c1f0d56e5f1a74835d18b8ea2118da7bf2d79"
+SRC_URI[md5sum] = "ac6b77c223821856e8ac077acf5a7c1d"
+SRC_URI[sha256sum] = "a0786a916d0572bd9d6afe26e95c6021e3df5dcafa0ece6b302e36366e58c24e"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.17.1

