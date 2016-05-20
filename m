Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 65E21700F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2016 02:26:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6726256"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 May 2016 10:26:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AD257418A734
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2016 10:26:03 +0800 (CST)
Received: from localhost.localdomain (10.167.226.24) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 20 May 2016 10:26:03 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1456615832-11562-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.24]
X-yoursite-MailScanner-ID: AD257418A734.ACBB5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] iptraf: Fix rootfs creation errors
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
Date: Fri, 20 May 2016 02:26:06 -0000
X-Original-Date: Sun, 28 Feb 2016 02:30:32 +0300
X-List-Received-Date: Fri, 20 May 2016 02:26:06 -0000
Content-Type: text/plain

fix errors as following:
       file /var/run from install of iptraf-3.0.0-r0.x86_64
       conflicts with file from package base-files-3.0.14-r89.ubinux_x86_64

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
index 25e6001..4d677ef 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
+++ b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
@@ -23,6 +23,10 @@ do_compile() {
     oe_runmake -C src all  
 }
 
+do_install_append() {
+    rm -r ${D}/${localstatedir}/run
+}
+
 do_install() {
     install -d ${D}${bindir}
     oe_runmake -C src install \
-- 
1.8.4.2




