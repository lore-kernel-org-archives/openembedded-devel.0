Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A65C77EA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 05:36:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5N5alKG015454
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 22:36:51 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Jun 2017 22:36:46 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 13:36:43 +0800
Message-ID: <d5b7d774922b8ff8074c77b5e917308a0867a231.1498195991.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498195991.git.jackie.huang@windriver.com>
References: <cover.1498195991.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] rdate: add new recipe
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
X-List-Received-Date: Fri, 23 Jun 2017 05:36:50 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

rdate is a tool for getting the date/time
from a remote machine.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-connectivity/rdate/rdate_1.5.bb            | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/rdate/rdate_1.5.bb

diff --git a/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
new file mode 100644
index 000000000..818f16a52
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Tool for getting the date/time from a remote machine."
+DESCRIPTION = "The rdate utility retrieves the date and time from \
+  another machine on your network, using the protocol described in RFC 868. \
+  If you run rdate as root, it will set your machine local time to the \
+  time of the machine that you queried. \
+"
+
+HOMEPAGE= "https://www.aelius.com/njh/rdate/"
+SECTION = "Applications/System"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI= "https://www.aelius.com/njh/${BPN}/${BP}.tar.gz"
+SRC_URI[md5sum] = "0a4f612480777fdf25264ac03c57eae6"
+SRC_URI[sha256sum] = "6e800053eaac2b21ff4486ec42f0aca7214941c7e5fceedd593fa0be99b9227d"
+
+inherit autotools
-- 
2.11.0


