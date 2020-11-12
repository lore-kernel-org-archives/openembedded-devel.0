Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.2547.1605178597628216401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 02:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39606 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kdAHH-0006p6-Rc; Thu, 12 Nov 2020 12:56:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cmd2: Upgrade 1.3.11 -> 1.4.0
Date: Thu, 12 Nov 2020 12:56:14 +0200
Message-Id: <20201112105618.23773-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.0:

- Fixed tab completion crash on Windows
- Changed how multiline doc string help is formatted to match
  style of other help messages

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.3.11.bb => python3-cmd2_1.4.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.11.bb => python3-cmd2_1.4.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
index 3b2aa5b744..dfe493bd2a 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "7e3dbe0aefa331e80f515d3c41cc3b8c"
-SRC_URI[sha256sum] = "826a288ee6d9c4ec1184e64e9566c09d3b73be8f4283c1898fa4332f1daf8dbf"
+SRC_URI[md5sum] = "520afccc1d46f833d117a23fab76ed8f"
+SRC_URI[sha256sum] = "e59fa932418603af4e046a96c8985812b05af8a73bfd9d7a386cd1b02c6ab687"
 
 inherit pypi setuptools3
 
-- 
2.17.1

