Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14969.1586454714108965281
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 10:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40078 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jMbLD-0004dI-MC; Thu, 09 Apr 2020 20:51:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python2][PATCH] python-requests: Upgrade to 2.23.0
Date: Thu,  9 Apr 2020 20:51:36 +0300
Message-Id: <1586454696-12728-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
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

Upgrade python-requests to version 2.23.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python-requests_2.22.0.bb => python-requests_2.23.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python-requests_2.22.0.bb => python-requests_2.23.0.bb} (79%)

diff --git a/recipes-devtools/python/python-requests_2.22.0.bb b/recipes-devtools/python/python-requests_2.23.0.bb
similarity index 79%
rename from recipes-devtools/python/python-requests_2.22.0.bb
rename to recipes-devtools/python/python-requests_2.23.0.bb
index 25d4840..52df65c 100644
--- a/recipes-devtools/python/python-requests_2.22.0.bb
+++ b/recipes-devtools/python/python-requests_2.23.0.bb
@@ -5,12 +5,12 @@ your POST data. Keep-alive and HTTP connection pooling are 100% automatic, \
 thanks to urllib3."
 HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a8d5a1d1c2d53025e2282c511033f6f7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
 
-SRC_URI[md5sum] = "ee28bee2de76e9198fc41e48f3a7dd47"
-SRC_URI[sha256sum] = "11e007a8a2aa0323f5a921e9e6a2d7e4e67d9877e85773fba9ba6419025cbeb4"
+SRC_URI[md5sum] = "abfdc28db1065bbd0bc32592ac9d27a6"
+SRC_URI[sha256sum] = "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6"
 
 inherit pypi setuptools
 
-- 
2.7.4

