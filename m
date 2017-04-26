Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BD26D77A3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 02:17:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18161459"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2017 10:17:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 763BA47E6342
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 10:17:36 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 26 Apr 2017 10:17:36 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 10:17:32 +0800
Message-ID: <1493173052-7115-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 763BA47E6342.A59CC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libedit: 20160903-3.1 -> 20170329-3.1
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
X-List-Received-Date: Wed, 26 Apr 2017 02:17:44 -0000
Content-Type: text/plain

Upgrade libedit from 20160903-3.1 to 20170329-3.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libedit/{libedit_20160903-3.1.bb => libedit_20170329-3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libedit/{libedit_20160903-3.1.bb => libedit_20170329-3.1.bb} (80%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20160903-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20170329-3.1.bb
similarity index 80%
rename from meta-oe/recipes-devtools/libedit/libedit_20160903-3.1.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20170329-3.1.bb
index 90b5a1d..fc24671 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20160903-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20170329-3.1.bb
@@ -15,7 +15,7 @@ FETCHCMD_wget += "-U bitbake"
 SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[md5sum] = "0467d27684c453a351fbcefebbcb16a3"
-SRC_URI[sha256sum] = "0ccbd2e7d46097f136fcb1aaa0d5bc24e23bb73f57d25bee5a852a683eaa7567"
+SRC_URI[md5sum] = "c57a0690e62ef523c083598730272cfd"
+SRC_URI[sha256sum] = "91f2d90fbd2a048ff6dad7131d9a39e690fd8a8fd982a353f1333dd4017dd4be"
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
2.7.4




