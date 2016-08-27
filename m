Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 45B4670030
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 06:35:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10343556"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2016 14:35:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 64CB742EB271
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 14:35:37 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sat, 27 Aug 2016 14:35:37 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 27 Aug 2016 02:35:32 -0400
Message-ID: <1472279732-1331-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 64CB742EB271.A7075
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] mailcap: 2.1.45 -> 2.1.46
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
X-List-Received-Date: Sat, 27 Aug 2016 06:35:45 -0000
Content-Type: text/plain

Upgrade mailcap from 2.1.45 to 2.1.46.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../mailcap/{mailcap_2.1.45.bb => mailcap_2.1.46.bb}              | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.45.bb => mailcap_2.1.46.bb} (83%)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.45.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
similarity index 83%
rename from meta-oe/recipes-support/mailcap/mailcap_2.1.45.bb
rename to meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
index 911360f..7d87a5f 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.45.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
@@ -12,12 +12,12 @@ by several applications e.g. to determine MIME types for filenames."
 
 SECTION = "System Environment/Base"
 
-SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BPN}-r2-1-45.tar.gz"
-SRC_URI[md5sum] = "2320a77b2fc82078c9d6a59b29234bc8"
-SRC_URI[sha256sum] = "a73e2f93625475014066f414873cb9f0a4b1189942d94fade9a03e59be3745b7"
+SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BPN}-r2-1-46.tar.gz"
+SRC_URI[md5sum] = "eee03824bf86480dc1db20be4f78237f"
+SRC_URI[sha256sum] = "309059163fa3ef368f8a43fc38f7a45d9345fd725970d5b437ba175a0ee7ebc9"
 LICENSE = "PD & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
-S = "${WORKDIR}/${BPN}-r2-1-45"
+S = "${WORKDIR}/${BPN}-r2-1-46"
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
 }
-- 
2.7.4




