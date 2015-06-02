Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A57D757C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2015 05:46:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t525kY1q002828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:46:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 1 Jun 2015 22:46:33 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Jun 2015 13:40:29 +0800
Message-ID: <1433223629-24818-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433223629-24818-1-git-send-email-rongqing.li@windriver.com>
References: <1433223629-24818-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2][meta-networking] nftables: create nftables recipe under meta-networking
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

http://netfilter.org/projects/nftables/index.html

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../nftables/files/fix-to-generate-ntf.8.patch     | 26 ++++++++++++++++++++++
 .../recipes-filter/nftables/nftables_0.4.bb        | 17 ++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-filter/nftables/files/fix-to-generate-ntf.8.patch
 create mode 100644 meta-networking/recipes-filter/nftables/nftables_0.4.bb

diff --git a/meta-networking/recipes-filter/nftables/files/fix-to-generate-ntf.8.patch b/meta-networking/recipes-filter/nftables/files/fix-to-generate-ntf.8.patch
new file mode 100644
index 0000000..f5d7438
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/files/fix-to-generate-ntf.8.patch
@@ -0,0 +1,26 @@
+[PATCH] disable to make ntf.8 man
+
+Upstream-Statue: Pending
+
+$DB2MAN do not support the xinclude parameter whether it is
+docbook2x-man or other, so disable to make ntf.8 man
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ doc/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index a92de7f..537c36b 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -1,5 +1,5 @@
+ if BUILD_MAN
+-man_MANS = nft.8
++#man_MANS = nft.8
+ endif
+ 
+ if BUILD_PDF
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-filter/nftables/nftables_0.4.bb b/meta-networking/recipes-filter/nftables/nftables_0.4.bb
new file mode 100644
index 0000000..d183d91
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables_0.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Netfilter Tables userspace utillites"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
+SECTION = "console/network"
+
+DEPENDS = "libmnl libnftnl readline gmp"
+RRECOMMENDS_${PN} += "kernel-module-nf-tables \
+    "
+
+SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
+           file://fix-to-generate-ntf.8.patch \
+          "
+
+SRC_URI[md5sum] = "09b686c489ff10db670ca60dbed7ff43"
+SRC_URI[sha256sum] = "f6ca69b75c68915f9f3a3972274ec68354dfbbcfc0b9fc55c813a0525c351d3c"
+
+inherit autotools pkgconfig
-- 
1.9.1


