Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 602BE7772F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 19:28:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Aug 2017 12:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,437,1498546800"; d="scan'208";a="304943882"
Received: from wrath.jf.intel.com ([10.54.70.9])
	by fmsmga004.fm.intel.com with ESMTP; 27 Aug 2017 12:28:07 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Aug 2017 12:28:03 -0700
Message-Id: <20170827192803.17611-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [meta-python][PATCH] python-subprocess32: add recipe for v3.2.7
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
X-List-Received-Date: Sun, 27 Aug 2017 19:28:06 -0000

A backport of the subprocess module from Python 3.2 for use on 2.x

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-devtools/python/python-subprocess32_3.2.7.bb  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-subprocess32_3.2.7.bb

diff --git a/meta-python/recipes-devtools/python/python-subprocess32_3.2.7.bb b/meta-python/recipes-devtools/python/python-subprocess32_3.2.7.bb
new file mode 100644
index 000000000..f43706923
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-subprocess32_3.2.7.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A backport of the subprocess module from Python 3.2 for use on 2.x"
+DESCRIPTION = "This is a backport of the subprocess standard library module \
+from Python 3.2 - 3.5 for use on Python 2. It includes bugfixes and some new \
+features.  On POSIX systems it is guaranteed to be reliable when used in \
+threaded applications. It includes timeout support from Python 3.3 and the \
+run() API from 3.5 but otherwise matches 3.2's API."
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d3e62baa8fb96b11a59d3f2cd335d5c0"
+
+SRC_URI[md5sum] = "824c801e479d3e916879aae3e9c15e16"
+SRC_URI[sha256sum] = "1e450a4a4c53bf197ad6402c564b9f7a53539385918ef8f12bdf430a61036590"
+
+inherit pypi setuptools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.13.5


