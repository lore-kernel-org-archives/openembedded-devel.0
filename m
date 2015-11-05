Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0630F770F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 05:05:58 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so75481384pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 21:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=uLpPj9ZlxPTImeZ4/B7mxdVE1f02EeXBqdiO2T3G5xk=;
	b=GO8r6nl1GTDrFWCJSoTDX3anoumBArq9pzkDyGXUyzGpmwqpV7/MTy/u8s0aVAGRoN
	7gp2FybLBP5FkOX/rfg5V+oe2HeFW6bwD+LRwc95g536OVHJGTaG3Tn9t/G2PtbUg2iB
	IczwdbxnN2d9gMVXkuo3IkIiGoa2fDp6UPQwPMI6k3CriPFjM7teow4cfNlcMK3DfCu5
	6lzn6oqOzxC1HvV0pq8kYhAbJXW5FjLmmqs77kD3QDqvvCQc2/uV8jDh+k2Ee/AdmdEx
	C7YVZ/bA7wFSSlg1q58Ewyr20MuzHeeXnBbVfGX5mDutUiprNdznSu1nb+UwmwZJzhxu
	AwdA==
X-Received: by 10.67.3.200 with SMTP id by8mr6893607pad.56.1446699958623;
	Wed, 04 Nov 2015 21:05:58 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	d13sm5181531pbu.20.2015.11.04.21.05.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Nov 2015 21:05:58 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 23:05:54 -0600
Message-Id: <1446699955-7624-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
Subject: [meta-python][PATCH v2 1/2] python-html5lib: import recipe from meta-openstack
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
X-List-Received-Date: Thu, 05 Nov 2015 05:05:59 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

This recipe is needed for GateOne.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../recipes-devtools/python/python-html5lib_0.999.bb      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-html5lib_0.999.bb

diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.999.bb b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
new file mode 100644
index 0000000..34a8b30
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "HTML parser based on the WHATWG HTML specifcation"
+HOMEPAGE = "https://github.com/html5lib/html5lib-python"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
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
-- 
2.6.2.11.gb05c2f9


