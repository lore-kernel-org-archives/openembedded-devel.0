Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 79553606BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:10:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172095"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:10:44 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6E1A441887FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:10:23 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:10:23 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:10:21 -0800
Message-ID: <1451873421-5185-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 6E1A441887FC.AE9D8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] mailcap: 2.1.44 -> 2.1.45
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
X-List-Received-Date: Mon, 04 Jan 2016 02:10:43 -0000
Content-Type: text/plain

Upgrade mailcap from 2.1.44 to 2.1.45.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../mailcap/{mailcap_2.1.44.bb => mailcap_2.1.45.bb}              | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.44.bb => mailcap_2.1.45.bb} (83%)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.44.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.45.bb
similarity index 83%
rename from meta-oe/recipes-support/mailcap/mailcap_2.1.44.bb
rename to meta-oe/recipes-support/mailcap/mailcap_2.1.45.bb
index 4b9ddb2..911360f 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.44.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.45.bb
@@ -12,12 +12,12 @@ by several applications e.g. to determine MIME types for filenames."
 
 SECTION = "System Environment/Base"
 
-SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BPN}-r2-1-44.tar.gz"
-SRC_URI[md5sum] = "e7de2a5dfaa126d5e0a081af7d908906"
-SRC_URI[sha256sum] = "644da071f918a33e11d1f8db8334010dd325108209d302f800816f4a177ee2e6"
+SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BPN}-r2-1-45.tar.gz"
+SRC_URI[md5sum] = "2320a77b2fc82078c9d6a59b29234bc8"
+SRC_URI[sha256sum] = "a73e2f93625475014066f414873cb9f0a4b1189942d94fade9a03e59be3745b7"
 LICENSE = "PD & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
-S = "${WORKDIR}/${BPN}-r2-1-44"
+S = "${WORKDIR}/${BPN}-r2-1-45"
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
 }
-- 
1.9.1




