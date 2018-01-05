Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EEF15787F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jan 2018 17:48:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w05HmCgM028341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Jan 2018 09:48:12 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 5 Jan 2018 09:48:12 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jan 2018 09:48:12 -0800
Message-ID: <20180105174812.107850-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] zile: update to 2.14
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
X-List-Received-Date: Fri, 05 Jan 2018 17:48:12 -0000
Content-Type: text/plain

Mostly minor build and documentation changes.
The COPYING file changes due to switching URLs from http to https.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-support/zile/{zile_2.4.11.bb => zile_2.4.14.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/zile/{zile_2.4.11.bb => zile_2.4.14.bb} (70%)

diff --git a/meta-oe/recipes-support/zile/zile_2.4.11.bb b/meta-oe/recipes-support/zile/zile_2.4.14.bb
similarity index 70%
rename from meta-oe/recipes-support/zile/zile_2.4.11.bb
rename to meta-oe/recipes-support/zile/zile_2.4.14.bb
index d663f44b9..515cf4136 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.11.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.14.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://zile.sourceforge.net/"
 DEPENDS = "ncurses bdwgc"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "http://ftp.gnu.org/gnu/zile/${BP}.tar.gz \
            file://remove-help2man.patch \
 "
 
-SRC_URI[md5sum] = "7a460ccec64e3bec2835697b2eae533c"
-SRC_URI[sha256sum] = "1fd27bbddc61491b1fbb29a345d0d344734aa9e80cfa07b02892eedf831fa9cc"
+SRC_URI[md5sum] = "c7d7eec93231c6878f255978d9747a73"
+SRC_URI[sha256sum] = "7a78742795ca32480f2bab697fd5e328618d9997d6f417cf1b14e9da9af26b74"
 
 inherit autotools pkgconfig
 
-- 
2.11.0


