Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.465.1593451164303290655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 10:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpxRC-0000w7-Kh; Mon, 29 Jun 2020 20:19:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-py: Upgrade 1.8.2 -> 1.9.0
Date: Mon, 29 Jun 2020 20:18:51 +0300
Message-Id: <20200629171853.18608-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629171853.18608-1-leon.anavi@konsulko.com>
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.9.0:

- Add type annotation stubs for the following modules:
  py.error
  py.iniconfig
  py.path (not including SVN paths)
  py.io
  py.xml

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-py_1.8.2.bb => python3-py_1.9.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-py_1.8.2.bb => python3-py_1.9.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-py_1.8.2.bb b/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-py_1.8.2.bb
rename to meta-python/recipes-devtools/python/python3-py_1.9.0.bb
index aea737853..794ec2a87 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.9.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://py.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "baa54e458875d68031c422abb2e47a5c"
-SRC_URI[sha256sum] = "f3b3a4c36512a4c4f024041ab51866f11761cc169670204b235f6b20523d4e6b"
+SRC_URI[md5sum] = "b80db4e61eef724f49feb4d20b649e62"
+SRC_URI[sha256sum] = "9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1

