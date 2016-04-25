Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 96EF071633
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:35:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5924299"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Apr 2016 17:35:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CFB58408D262
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 17:35:14 +0800 (CST)
Received: from localhost.localdomain (10.167.226.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 25 Apr 2016 17:35:14 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Apr 2016 02:35:12 -0700
Message-ID: <1461576912-2943-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <570B676B.1080905@mlbassoc.com>
References: <570B676B.1080905@mlbassoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.27]
X-yoursite-MailScanner-ID: CFB58408D262.ADEC7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] hwdata: add new recipe
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
X-List-Received-Date: Mon, 25 Apr 2016 09:35:29 -0000
Content-Type: text/plain

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/hwdata/hwdata_0.288.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.288.bb

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.288.bb b/meta-oe/recipes-support/hwdata/hwdata_0.288.bb
new file mode 100644
index 0000000..bac6618
--- /dev/null
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.288.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Hardware identification and configuration data"
+HOMEPAGE = "http://git.fedorahosted.org/git/hwdata.git"
+SECTION = "System/Base"
+
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
+
+SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "f3fa1c5edb66ce5b376d95e772b2d303"
+SRC_URI[sha256sum] = "56fc26275b102e538fcfcf9c1093a09f476a1ea8d4e0c733d3c578442923693d"
+
+do_compile() {
+}
+
+do_install() {
+    install -m 0744 -d ${D}${sysconfdir}/modprobe.d
+    install -m 0644 -p ${S}/blacklist.conf ${D}/${sysconfdir}/modprobe.d
+    install -m 0744 -d ${D}${datadir}/${PN}
+    install -m 0644 -p ${S}/*.ids ${D}${datadir}/${PN}
+    install -m 0644 -p ${S}/oui.txt ${D}${datadir}/${PN}
+}
-- 
1.9.1




