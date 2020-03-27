Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.21978.1585340774976754798
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2020 13:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02RKQD1T000006
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2020 13:26:14 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Mar 2020
 13:26:13 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 37E6D900276;
 Fri, 27 Mar 2020 13:26:13 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-psutil: upgrade 5.6.7 -> 5.7.0
Date: Fri, 27 Mar 2020 13:26:13 -0700
Message-ID: <20200327202613.132996-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-psutil.inc         | 4 ++--
 .../{python3-psutil_5.6.7.bb => python3-psutil_5.7.0.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.6.7.bb => python3-psutil_5.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index bf49d9863..dfb33e8dc 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 
-SRC_URI[md5sum] = "b2c94e0368fc6e6f237a7252f8e85ca2"
-SRC_URI[sha256sum] = "ffad8eb2ac614518bbe3c0b8eb9dffdb3a8d2e3a7d5da51c5b974fb723a5c5aa"
+SRC_URI[md5sum] = "ed7b0f11ed214bcabbe76b7cf52f3ae3"
+SRC_URI[sha256sum] = "685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e"
 
 PACKAGES =+ "${PN}-tests"
 
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.6.7.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.6.7.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
-- 
2.17.1

