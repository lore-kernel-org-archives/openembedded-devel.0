Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E10087F8D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 01:39:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,388,1571673600"; d="scan'208";a="81257286"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 09:39:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E0B3649E9315
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 09:30:39 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 09:39:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 09:39:37 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 22:09:27 -0800
Message-ID: <1578031770-88411-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578031770-88411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578031770-88411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: E0B3649E9315.A1763
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pytest: upgrade 5.2.1 -> 5.3.2
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
X-List-Received-Date: Fri, 03 Jan 2020 01:39:36 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc         | 4 ++--
 .../python/{python-pytest_5.3.1.bb => python-pytest_5.3.2.bb} | 0
 .../{python3-pytest_5.3.1.bb => python3-pytest_5.3.2.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_5.3.1.bb => python-pytest_5.3.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.3.1.bb => python3-pytest_5.3.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index e35d56685..752d67e36 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
 
-SRC_URI[md5sum] = "06cdb939a1f45f6b82b304abb87c3e30"
-SRC_URI[sha256sum] = "f67403f33b2b1d25a6756184077394167fe5e2f9d8bdaab30707d19ccec35427"
+SRC_URI[md5sum] = "71a8eb2ab5efb76512d9a69bd6477034"
+SRC_URI[sha256sum] = "6b571215b5a790f9b41f19f3531c53a45cf6bb8ef2988bc1ff9afb38270b25fa"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    "
diff --git a/meta-python/recipes-devtools/python/python-pytest_5.3.1.bb b/meta-python/recipes-devtools/python/python-pytest_5.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_5.3.1.bb
rename to meta-python/recipes-devtools/python/python-pytest_5.3.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pytest_5.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.3.2.bb
-- 
2.17.1




