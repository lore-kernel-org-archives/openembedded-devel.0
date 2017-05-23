Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5149177E83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 07:01:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4N71lxA029902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 00:01:47 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 23 May 2017 00:01:46 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 May 2017 15:01:42 +0800
Message-ID: <575c4fac2e057d775e7e1b66ef63c54692b06060.1495522368.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1495522368.git.jackie.huang@windriver.com>
References: <cover.1495522368.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] ssiapi: add new recipe
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
X-List-Received-Date: Tue, 23 May 2017 07:01:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Intel Rapid Storage Technology enterprise with Linux OS* Standard
Storage Interface API Library. The library allows user to manage
storage devices including creating and managing Raid arrays on
systems with Intel chipset.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb

diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
new file mode 100644
index 000000000..5b951eb26
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Intel RSTe with Linux OS SSI API Library"
+
+DESCRIPTION = "Intel Rapid Storage Technology enterprise with Linux OS* Standard Storage Interface API Library. \
+The library allows user to manage storage devices including creating and managing Raid arrays on systems with Intel chipset."
+
+HOMEPAGE = "http://irstessi.sourceforge.net/"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0413ff365e0bd733c4869a6797551c6f"
+
+DEPENDS += "sg3-utils"
+
+SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz"
+SRC_URI[md5sum] = "02f16d7cbd30d28034093212906591f5"
+SRC_URI[sha256sum] = "e10d283b0f211afb8ebd0bde87c097769613d30a052cdf164753e35e803264c7"
+
+S ="${WORKDIR}/${BPN}.${PV}"
+
+inherit autotools-brokensep
+
+do_configure_prepend(){
+    ./autogen.sh
+}
+
+RDEPENDS_${PN} += "mdadm"
-- 
2.11.0


