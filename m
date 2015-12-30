Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC3860721
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 09:02:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2090548"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Dec 2015 17:02:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 062D240427FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 17:02:06 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 30 Dec 2015 17:05:31 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Dec 2015 12:01:50 +0300
Message-ID: <1451466110-1881-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: 062D240427FE.AB552
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-vcversioner: Error Fix for recipes depend on python-vcversioner.
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
X-List-Received-Date: Wed, 30 Dec 2015 09:02:21 -0000
Content-Type: text/plain

If you bitbake recipes which depends on python-vcversioner such as
python-jsonschema. And also your network is not very well.
Error will occur as following:
   Download error on https://pypi.python.org/simple/vcversioner/:
   [Errno -5] No address associated with hostname -- Some packages may not be found!
    Couldn't find index page for 'vcversioner' (maybe misspelled?)
    No local packages or download links found for vcversioner
So add do_compile_append() to fix it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-vcversioner_2.14.0.0.bb       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
index f7cd9bb..152034b 100644
--- a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
@@ -12,3 +12,12 @@ S = "${WORKDIR}/vcversioner-${PV}"
 
 inherit setuptools
 
+
+do_compile_append() {
+    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
+    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
+}
+
+do_install_append() {
+    install -m 0644 ${S}/vcversioner*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
+}
-- 
1.8.4.2




