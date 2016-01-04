Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B88D96B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 06:22:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2180293"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 14:22:55 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id DD11C4066D28
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 14:22:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 14:22:41 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 22:22:39 -0800
Message-ID: <1451888559-31632-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1451873503-5364-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1451873503-5364-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: DD11C4066D28.A0081
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v3] xterm: 308 -> 320
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
X-List-Received-Date: Mon, 04 Jan 2016 06:22:56 -0000
Content-Type: text/plain

Upgrade xterm from 308 to 320.

Modify LIC_FILES_CHKSUM,since the date in it has been changed, But the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_308.bb => xterm_320.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_308.bb => xterm_320.bb} (77%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_308.bb b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
similarity index 77%
rename from meta-oe/recipes-graphics/xorg-app/xterm_308.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_320.bb
index 9198ca2..c8140d1 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_308.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
@@ -2,12 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=540cf18ccc16bc3c5fea40d2ab5d8d51"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=ee6435019d00b884cde8d7ba2b318ff0"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 
-SRC_URI[md5sum] = "1ec76c1a79a70de4f82c24c527ef4626"
-SRC_URI[sha256sum] = "c5bf7377a5bf35e34b7e3a4ab6c848fbc89e8901dd98f8b237662a72bdbfe372"
+SRC_URI[md5sum] = "0d7f0e6390d132ae59876b3870e5783d"
+SRC_URI[sha256sum] = "a60dbb574334c081425fa30f011cd9f571e3be7a91e2a84e252461798bce24a7"
 
 EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
-- 
1.9.1




