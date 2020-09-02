Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5168.1599046102660593209
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 04:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46718 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDQw8-0000FC-BI; Wed, 02 Sep 2020 14:28:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-mccabe: Upgrade 0.2.1 -> 0.6.1
Date: Wed,  2 Sep 2020 14:28:03 +0300
Message-Id: <20200902112808.18547-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902112808.18547-1-leon.anavi@konsulko.com>
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.6.1:

- Add support for Python 3.6
- Fix handling for missing statement types
- Fix signature for PathGraphingAstVisitor.default to match the
  signature for ASTVisitor

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-mccabe_0.2.1.bb => python3-mccabe_0.6.1.bb}  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mccabe_0.2.1.bb => python3-mccabe_0.6.1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
rename to meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
index d3a9971e4..63a9e35ac 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
@@ -2,13 +2,15 @@ DESCRIPTION = "McCabe checker, plugin for flake8"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f"
 
-SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
-SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
+SRC_URI[md5sum] = "723df2f7b1737b8887475bac4c763e1e"
+SRC_URI[sha256sum] = "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
 
 inherit pypi setuptools3
 
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
 RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-cmd2 \
             ${PYTHON_PN}-pyparsing \
-- 
2.17.1

