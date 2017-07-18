Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D749D65D35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I69M1U013595
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 23:09:22 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:06 -0400
Message-ID: <63e072d5cacfefd80116235155c7e7adf59a057a.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500357921.git.hongxu.jia@windriver.com>
References: <cover.1500357921.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] python3-langtable: add recipe 0.0.37
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:22 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python3-langtable_0.0.37.bb             | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb
new file mode 100644
index 0000000..362ca1a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "langtable is used to guess reasonable defaults for locale,\
+keyboard, territory"
+HOMEPAGE = "https://github.com/mike-fabian/langtable/"
+LICENSE = "GPLv3+"
+SECTION = "devel/python"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+SRCREV = "3f001eef027ba69ef2fdb35c670b7da26b79b5e2"
+PV = "0.0.37+git${SRCPV}"
+SRC_URI = "git://github.com/mike-fabian/langtable.git;branch=master \
+"
+
+inherit setuptools3 python3native
+
+DISTUTILS_INSTALL_ARGS = "--prefix=${D}/${prefix} \
+    --install-data=${D}/${datadir}/langtable"
+
+FILES_${PN} += "${datadir}/*"
-- 
2.8.1


