Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 97D45766B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 03:58:13 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so49424084pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 19:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=wXTp18YYA2mHn7D4J8WH6o2GoDb4pSvzx7vEJTZLfzk=;
	b=XMhx/22/pDWXgIlxPHZW/Uk+Qg/R0HtVNBDRQa1eWwMMeJq7Q32E8XsWmC0MRDp/Wk
	tdbn7qcrYC/uDFewYg/KteRky0o0LsnJClT2cnsU3vtmUCAXZMN4I0JWRPkjArLsweyQ
	od1G5QKhN42nFJkBtLZU1CZWfzX8rw7NOkPYoJly1AnIAER/9wdLadfLHAmekx5iXWrJ
	W05EqiSJadtNp/jysujzCQHty55n7pCG+f0UrPctBZAOp9wz41n4N7PT5JuPcOxxsi2/
	aQ6oByg2N+cW3uti2tdDZ8j9Zuw8BOCbGzSx0i7z/Fq0hi5O2QS29csTwuD9EZhiWacD
	oY/w==
X-Received: by 10.66.124.135 with SMTP id mi7mr6805145pab.102.1446695894429;
	Wed, 04 Nov 2015 19:58:14 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	qn5sm4799710pac.41.2015.11.04.19.58.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Nov 2015 19:58:13 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 21:58:11 -0600
Message-Id: <1446695892-21744-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
Subject: [meta-python][PATCH 1/2] python-html5lib: import recipe from meta-openstack
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
X-List-Received-Date: Thu, 05 Nov 2015 03:58:15 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

This recipe is needed for GateOne.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../python/python-html5lib_0.999.bb                | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-html5lib_0.999.bb

diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.999.bb b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
new file mode 100644
index 0000000..9ad84e8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "HTML parser based on the WHATWG HTML specifcation"
+HOMEPAGE = "https://github.com/html5lib/html5lib-python"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
+
+PR = "r0"
+
+SRCNAME = "html5lib"
+SRC_URI = "http://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "acb8ba4d6db5637360a07859192eb7f8"
+SRC_URI[sha256sum] = "c3887f7e2875d7666107fa8bee761ff95b9391acdcc7cd1b5fd57a23b5fbc49e"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        python-pip \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
-- 
2.6.2.11.gb05c2f9


