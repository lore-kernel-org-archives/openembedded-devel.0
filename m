Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 163DC7318A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:50:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10229209"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Aug 2016 15:50:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 442C9430CD06
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 15:50:35 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 24 Aug 2016 15:50:34 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 03:50:30 -0400
Message-ID: <1472025030-1519-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 442C9430CD06.A46BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] lua: 5.3.2 -> 5.3.3
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
X-List-Received-Date: Wed, 24 Aug 2016 07:50:40 -0000
Content-Type: text/plain

1) Upgrade lua from 5.3.2 to 5.3.3.
2) Modify LIC_FILES_CHKSUM, since the date in it has been changed, But the LICENSE has not been changed.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/lua/{lua_5.3.2.bb => lua_5.3.3.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/lua/{lua_5.3.2.bb => lua_5.3.3.bb} (82%)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb b/meta-oe/recipes-devtools/lua/lua_5.3.3.bb
similarity index 82%
rename from meta-oe/recipes-devtools/lua/lua_5.3.2.bb
rename to meta-oe/recipes-devtools/lua/lua_5.3.3.bb
index 07a1a43..a57f7e9 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=68fc2aa2b751a37ff265524ddf026d7f"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=10ffd57d574c60d5b4d6189544e205a9"
 HOMEPAGE = "http://www.lua.org/"
 
 PR = "r0"
@@ -15,10 +15,10 @@ SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
             file://run-ptest \
            ', '', d)}"
 
-SRC_URI[tarballsrc.md5sum] = "33278c2ab5ee3c1a875be8d55c1ca2a1"
-SRC_URI[tarballsrc.sha256sum] = "c740c7bb23a936944e1cc63b7c3c5351a8976d7867c5252c8854f7b2af9da68f"
-SRC_URI[tarballtest.md5sum] = "a2b7ab1b8ff82a0145376e233ef30a4a"
-SRC_URI[tarballtest.sha256sum] = "56909863a3713dee3709b3dbd0c868237e4f5c9ea1744f5bf0ba8bafa6c4ed32"
+SRC_URI[tarballsrc.md5sum] = "703f75caa4fdf4a911c1a72e67a27498"
+SRC_URI[tarballsrc.sha256sum] = "5113c06884f7de453ce57702abaac1d618307f33f6789fa870e87a59d772aca2"
+SRC_URI[tarballtest.md5sum] = "76f4fb07f2a4970d554645ac26df86df"
+SRC_URI[tarballtest.sha256sum] = "13154abc20976196119db531b4169ce1ce511755879d40b4192e4173291287e5"
 
 inherit pkgconfig binconfig ptest
 
-- 
2.7.4




