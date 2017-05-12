Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 46A6960125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 05:49:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18776698"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 May 2017 13:49:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 81FC847B0CB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 13:49:09 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 12 May 2017 13:49:07 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 May 2017 13:48:47 +0800
Message-ID: <1494568127-60598-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 81FC847B0CB7.A9D51
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] lua: 5.3.3 -> 5.3.4
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
X-List-Received-Date: Fri, 12 May 2017 05:49:18 -0000
Content-Type: text/plain

1) Upgrade lua from 5.3.3 to 5.3.4.
2) License checksum changed,since the copyright years were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/lua/{lua_5.3.3.bb => lua_5.3.4.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/lua/{lua_5.3.3.bb => lua_5.3.4.bb} (81%)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.3.bb b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
similarity index 81%
rename from meta-oe/recipes-devtools/lua/lua_5.3.3.bb
rename to meta-oe/recipes-devtools/lua/lua_5.3.4.bb
index b7995c2..28d71fa 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.3.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=10ffd57d574c60d5b4d6189544e205a9"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=60aa5cfdbd40086501778d9b6ebf29ee"
 HOMEPAGE = "http://www.lua.org/"
 
 DEPENDS = "readline"
@@ -13,10 +13,10 @@ SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
             file://run-ptest \
            ', '', d)}"
 
-SRC_URI[tarballsrc.md5sum] = "703f75caa4fdf4a911c1a72e67a27498"
-SRC_URI[tarballsrc.sha256sum] = "5113c06884f7de453ce57702abaac1d618307f33f6789fa870e87a59d772aca2"
-SRC_URI[tarballtest.md5sum] = "76f4fb07f2a4970d554645ac26df86df"
-SRC_URI[tarballtest.sha256sum] = "13154abc20976196119db531b4169ce1ce511755879d40b4192e4173291287e5"
+SRC_URI[tarballsrc.md5sum] = "53a9c68bcc0eda58bdc2095ad5cdfc63"
+SRC_URI[tarballsrc.sha256sum] = "f681aa518233bc407e23acf0f5887c884f17436f000d453b2491a9f11a52400c"
+SRC_URI[tarballtest.md5sum] = "b14fe3748c1cb2d74e3acd1943629ba3"
+SRC_URI[tarballtest.sha256sum] = "b80771238271c72565e5a1183292ef31bd7166414cd0d43a8eb79845fa7f599f"
 
 inherit pkgconfig binconfig ptest
 
-- 
2.7.4




