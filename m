Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6837197F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 02:13:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="11230251"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Sep 2016 10:13:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id DD8CF4042406
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 10:13:52 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 22 Sep 2016 10:13:52 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Sep 2016 08:03:15 -0400
Message-ID: <1474459395-16379-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: DD8CF4042406.A51A7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] logwatch: 7.4.1 -> 7.4.3
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
X-List-Received-Date: Thu, 22 Sep 2016 02:13:57 -0000
Content-Type: text/plain

Upgrade logwatch from 7.4.1 to 7.4.3.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../logwatch/{logwatch_7.4.1.bb => logwatch_7.4.3.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.4.1.bb => logwatch_7.4.3.bb} (95%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb
similarity index 95%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb
index b121522..aea539e 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2566bb12b16d2d80d90ebc533261aa7"
 RDEPENDS_${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "a0c3d8721f877bdcd4a9089eb1b4691b"
-SRC_URI[sha256sum] = "35ec31f9fe981aaa727b144ab3ff2eb655997d8ccabaf66586458f5dfc3a56eb"
+SRC_URI[md5sum] = "22bd22841caa45f12c605abc3e0c2b09"
+SRC_URI[sha256sum] = "1dbdc48d65e150f2dbb43f1e4f4700d94166e053b1c7bbbdedf4ad670283720e"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.7.4




