Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1348177FC3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I69UK4023087
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 23:09:30 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:10 -0400
Message-ID: <8ca447f73095dd7c940593da58461db7a801a754.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500357921.git.hongxu.jia@windriver.com>
References: <cover.1500357921.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] python3-requests-ftp: add recipe 0.3.1
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:30 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python3-requests-ftp_0.3.1.bb  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
new file mode 100644
index 0000000..3f99ed6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "FTP Transport Adapter for Requests"
+HOMEPAGE = "http://github.com/Lukasa/requests-ftp"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6683a23c9968b97709441dc884d46df6"
+
+SRC_URI[md5sum] = "1a52ad1219e696b5abd5449d1ccc0294"
+SRC_URI[sha256sum] = "7504ceb5cba8a5c0135ed738596820a78c5f2be92d79b29f96ba99b183d8057a"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    python3-requests \
+"
+
-- 
2.8.1


