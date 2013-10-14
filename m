Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 837866CF08
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:21:13 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 15:20:11 +0100
Message-Id: <1381760413-15098-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1381760413-15098-1-git-send-email-ml@communistcode.co.uk>
References: <1381760413-15098-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCHv3 1/3] json-c: add 0.11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 14:21:14 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-support/json-c/json-c_0.11.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/json-c/json-c_0.11.bb

diff --git a/meta-oe/recipes-support/json-c/json-c_0.11.bb b/meta-oe/recipes-support/json-c/json-c_0.11.bb
new file mode 100644
index 0000000..e0391f5
--- /dev/null
+++ b/meta-oe/recipes-support/json-c/json-c_0.11.bb
@@ -0,0 +1,13 @@
+SUMMARY = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C"
+HOMEPAGE = "https://github.com/json-c/json-c/wiki"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
+
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${P}.tar.gz"
+
+SRC_URI[md5sum] = "aa02367d2f7a830bf1e3376f77881e98"
+SRC_URI[sha256sum] = "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983edbfac9149494448c"
+
+PARALLEL_MAKE = ""
+
+inherit autotools
-- 
1.8.4


