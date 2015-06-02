Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9D1757C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2015 05:46:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t525kWjK016784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:46:33 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 1 Jun 2015 22:46:32 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Jun 2015 13:40:28 +0800
Message-ID: <1433223629-24818-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2][meta-networking] libnftnl: create recipe under meta-networking
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
X-List-Received-Date: Tue, 02 Jun 2015 05:46:35 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

libnftnl is needed by nftable, so add it

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-filter/libnftnl/libnftnl_1.0.3.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl_1.0.3.bb

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.3.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.3.bb
new file mode 100644
index 0000000..eea71e2
--- /dev/null
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Library for low-level interaction with nftables Netlink's API over libmnl"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
+SECTION = "libs/network"
+DEPENDS = "libmnl"
+
+SRC_URI = "http://netfilter.org/projects/libnftnl/files/${BP}.tar.bz2  \
+          "
+
+SRC_URI[md5sum] = "203701a73cc3c51ca751d7cb2e176250"
+SRC_URI[sha256sum] = "cf0ae7eab6a6866192a1fbd6b370a8a2cbe2066fe3975ab44939fd50747c27f7"
+
+inherit autotools pkgconfig
-- 
1.9.1


