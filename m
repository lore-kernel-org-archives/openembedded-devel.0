Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6901.1593768643114965793
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1o-0007av-VN; Fri, 03 Jul 2020 12:30:41 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-robotframework: Upgrade 3.0.4 -> 3.2.1
Date: Fri,  3 Jul 2020 12:30:16 +0300
Message-Id: <20200703093020.3514-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
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

Suppy zip as the correct extention for download in variable
PYPI_PACKAGE_EXT. Upgrade to release 3.2.1, for details have a
look at the release notes:
https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-3.2.1.rst

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...botframework_3.0.4.bb => python3-robotframework_3.2.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_3.0.4.bb => python3-robotframework_3.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb b/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
index 0628f92d98..a5e3a2a4f2 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "ee753415645ff4831ff0d366a0467fe7"
-SRC_URI[sha256sum] = "ab94257cbd848dfca7148e092d233a12853cc7e840ce8231af9cbb5e7f51aa47"
+PYPI_PACKAGE_EXT = "zip"
+SRC_URI[md5sum] = "ac8aaad885e48c6b6cd5461be5b8149f"
+SRC_URI[sha256sum] = "d693e6d06b17f48669e2a8c4cb6c1f0d56e5f1a74835d18b8ea2118da7bf2d79"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.17.1

