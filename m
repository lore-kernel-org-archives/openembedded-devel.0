Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 94CE17D3A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 09:33:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,438,1557158400"; d="scan'208";a="70367870"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Jul 2019 17:33:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2FF084CDE647
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 17:33:29 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Jul 2019 17:33:31 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jul 2019 17:35:05 +0800
Message-ID: <20190701093505.22962-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 2FF084CDE647.A89EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] logwatch: upgrade 7.4.3 -> 7.5.1
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
X-List-Received-Date: Mon, 01 Jul 2019 09:33:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from logwatch_7.4.3.bb to logwatch_7.5.1.bb.

-License-Update: Copyright year updated to 2018.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../logwatch/{logwatch_7.4.3.bb => logwatch_7.5.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.4.3.bb => logwatch_7.5.1.bb} (92%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.5.1.bb
similarity index 92%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.5.1.bb
index 275a8f238..b6ab43ccf 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.5.1.bb
@@ -8,12 +8,12 @@ the package on many systems.\
 SECTION = "devel"
 HOMEPAGE = "http://www.logwatch.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f2566bb12b16d2d80d90ebc533261aa7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad199c8aca74e70f296f731ad9a1521c"
 RDEPENDS_${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "22bd22841caa45f12c605abc3e0c2b09"
-SRC_URI[sha256sum] = "1dbdc48d65e150f2dbb43f1e4f4700d94166e053b1c7bbbdedf4ad670283720e"
+SRC_URI[md5sum] = "3d14fa6e0fb56f890d2b3fd9cbc3162f"
+SRC_URI[sha256sum] = "9d4a00625065f25058f8966e7fb11f9f72db25507b4dd9c05f57e14447c33295"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.20.1




