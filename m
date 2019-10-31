Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BAD627F896
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 07:18:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77730872"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 15:17:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 565614CE1511
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 15:09:55 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 31 Oct 2019 15:17:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 15:18:03 +0800
Message-ID: <20191031071803.21651-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 565614CE1511.A643E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-javaobj-py3: upgrade 0.2.4 -> 0.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Oct 2019 07:18:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: The old version of the license file was deleted in the new version, so choose another file containing the license information for verification.


Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-javaobj-py3.inc  | 6 +++---
 ...hon-javaobj-py3_0.2.4.bb => python-javaobj-py3_0.3.0.bb} | 0
 ...n3-javaobj-py3_0.2.4.bb => python3-javaobj-py3_0.3.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-javaobj-py3_0.2.4.bb => python-javaobj-py3_0.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.2.4.bb => python3-javaobj-py3_0.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3.inc b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
index a0e802ca7..b10f00bba 100644
--- a/meta-python/recipes-devtools/python/python-javaobj-py3.inc
+++ b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
@@ -5,10 +5,10 @@ DESCRIPTION = "python-javaobj is a python library that provides functions\
  representation is a standard data interchange format in Java world."
 HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://javaobj.py;beginline=21;endline=33;md5=8b504419ce78f8133b21b4d4a89ef7e9"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e"
 
-SRC_URI[md5sum] = "f669bb8099380e3dd84db3d542aa5b68"
-SRC_URI[sha256sum] = "b8b0d310fd97e1c7914d7911ee9d3f4b3d84d2a674aa95a4b0da3d8f155fc1bb"
+SRC_URI[md5sum] = "1c6189a0d9aef51d74bfc52cd2953991"
+SRC_URI[sha256sum] = "a57469e4f0d0eeba7482ad9839595db6e99ca4ac6630a4c8064dda75a2182549"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3_0.2.4.bb b/meta-python/recipes-devtools/python/python-javaobj-py3_0.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-javaobj-py3_0.2.4.bb
rename to meta-python/recipes-devtools/python/python-javaobj-py3_0.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.4.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.4.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.3.0.bb
-- 
2.20.1




