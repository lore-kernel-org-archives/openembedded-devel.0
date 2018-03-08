Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5FB78968
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 16:52:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w28GqbPh011524
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Mar 2018 08:52:37 -0800 (PST)
Received: from localhost.localdomain (128.224.125.89) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 8 Mar 2018 08:52:02 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Mar 2018 18:54:57 +0200
Message-ID: <1520528098-8881-3-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520528098-8881-1-git-send-email-daniel.dragomir@windriver.com>
References: <1520528098-8881-1-git-send-email-daniel.dragomir@windriver.com>
MIME-Version: 1.0
Subject: [meta-python] [PATCH 3/4] python3-scapy: add recipe for 0.23 version
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
X-List-Received-Date: Thu, 08 Mar 2018 16:52:35 -0000
Content-Type: text/plain

Packet crafting/sending/sniffing, PCAP processing tool, based on
scapy with python3 compatibility.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta-python/recipes-devtools/python/python3-scapy_0.23.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-scapy_0.23.bb

diff --git a/meta-python/recipes-devtools/python/python3-scapy_0.23.bb b/meta-python/recipes-devtools/python/python3-scapy_0.23.bb
new file mode 100644
index 0000000..3e7baf4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scapy_0.23.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Packet crafting/sending/sniffing, PCAP processing tool,\
+based on scapy with python3 compatibility"
+SECTION = "devel/python"
+HOMEPAGE = "https://github.com/phaethon/scapy"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95ea6ecfc360eb47fe6f470ad736d7cd"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "scapy-python3"
+
+SRC_URI[md5sum] = "8642d09ca727e7e2b455223ae94059b7"
+SRC_URI[sha256sum] = "8760991a67162f43af4d9e64828bcefc100ba88859b75177ae9f7ace56e58186"
-- 
2.7.4


