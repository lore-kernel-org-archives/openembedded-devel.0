Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0FE731D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:13:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2188286"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 18:13:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9FBD641887CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:12:59 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 18:16:30 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jan 2016 13:12:37 +0300
Message-ID: <1451902358-1844-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1451902358-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1451902358-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: 9FBD641887CD.A0538
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][jethro][PATCH 3/4] python-six: Error fix for recipes depend on python-six
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
X-List-Received-Date: Mon, 04 Jan 2016 10:13:11 -0000
Content-Type: text/plain

If you bitbake recipes which depends on python-six such as
python-cryptography. And also your network is not very well.
Error will occur as following:
   Download error on https://pypi.python.org/simple/six/:
   [Errno -5] No address associated with hostname -- Some packages may not be found!
    Couldn't find index page for 'six' (maybe misspelled?)
    No local packages or download links found for six
So add do_compile_append() to fix it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-six_1.9.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-six_1.9.0.bb b/meta-python/recipes-devtools/python/python-six_1.9.0.bb
index aa96dc9..c6575f3 100644
--- a/meta-python/recipes-devtools/python/python-six_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python-six_1.9.0.bb
@@ -6,3 +6,11 @@ SRC_URI[md5sum] = "476881ef4012262dfc8adc645ee786c4"
 SRC_URI[sha256sum] = "e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5"
 
 inherit pypi
+
+do_compile_append() {
+    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
+    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
+}
+do_install_append() {
+    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
+}
-- 
1.8.4.2




