Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.12726.1589898641442497736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jb3GQ-0002nY-FN; Tue, 19 May 2020 17:30:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-absl: Upgrade to 0.9.0
Date: Tue, 19 May 2020 17:30:31 +0300
Message-Id: <20200519143031.18358-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.9.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-absl_0.7.0.bb => python3-absl_0.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.7.0.bb => python3-absl_0.9.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.7.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-absl_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
index c65a6d7da..a8f47ba4c 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/abseil/abseil-py.git"
-SRCREV ?= "e3ce504183c57fc4eca52fe84732c11cda99d131"
+SRCREV ?= "06edd9c20592cec39178b94240b5e86f32e19768"
 
 inherit setuptools3
 
-- 
2.17.1

