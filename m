Return-Path: <wangmy@cn.fujitsu.com>
X-Greylist: delayed 578 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Feb 2020 09:46:32 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2D3605B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 09:46:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83150276"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Feb 2020 17:37:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C473050A9975
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 17:27:29 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 11 Feb 2020 17:36:59 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 11 Feb 2020 17:37:06 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Feb 2020 09:21:32 -0800
Message-ID: <1581441693-85373-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581441693-85373-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581441693-85373-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C473050A9975.AFF40
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xterm: upgrade 351 -> 353
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
X-List-Received-Date: Tue, 11 Feb 2020 09:46:32 -0000
Content-Type: text/plain

Copyright updated: 1996-2018,2019 -> 1999-2019,2020

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-app/{xterm_351.bb => xterm_353.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_351.bb => xterm_353.bb} (81%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_351.bb b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
similarity index 81%
rename from meta-oe/recipes-graphics/xorg-app/xterm_351.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_353.bb
index 40ee555db..6de704d0b 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_351.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
@@ -2,14 +2,14 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=c7faceb872d90115e7c0ad90e90c390d"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[md5sum] = "a07edfbee2e2f4c6a9ddbf834fa4bbec"
-SRC_URI[sha256sum] = "760a8a10221c9c9744afd86db87c7ad95bbf9be4f5f525fecf39125f0d2a6e16"
+SRC_URI[md5sum] = "247c30ebfa44623f3a2d100e0cae5c7f"
+SRC_URI[sha256sum] = "e521d3ee9def61f5d5c911afc74dd5c3a56ce147c7071c74023ea24cac9bb768"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
-- 
2.17.1




