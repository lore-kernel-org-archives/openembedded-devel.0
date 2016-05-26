Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 46412601F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2016 06:07:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6924952"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 May 2016 14:07:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1D17842B6715
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2016 14:07:02 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 26 May 2016 14:07:01 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1456740022-15405-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 1D17842B6715.AAC8E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][jethro][PATCH] daemontools: Warning Fix
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
Date: Thu, 26 May 2016 06:07:14 -0000
X-Original-Date: Mon, 29 Feb 2016 13:00:22 +0300
X-List-Received-Date: Thu, 26 May 2016 06:07:14 -0000
Content-Type: text/plain

WARNING: File '.../usr/bin/chkshsgr' from daemontools-native was already stripped,
    this will prevent future debugging!

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/daemontools/daemontools_0.76.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index 161f92f..fb74c56 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
            file://0001-error.h-include-errno.h-instead-of-extern-int.diff \
            file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff "
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI_append_class-target = "file://cross-compile.patch"
 
 SRC_URI[md5sum] = "1871af2453d6e464034968a0fbcb2bfc"
-- 
1.8.4.2




