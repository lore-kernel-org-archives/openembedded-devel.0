Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 762DA7C7A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 08:13:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74880537"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 16:13:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 070B44CDFCE9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 16:13:03 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 16:13:06 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 17:12:40 +0900
Message-ID: <20190905081240.41457-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 070B44CDFCE9.A1A7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-dbus: upgrade 1.2.8 -> 1.2.10
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
X-List-Received-Date: Thu, 05 Sep 2019 08:13:06 -0000
Content-Type: text/plain

License File dbus-gmain/COPYING content changed:
	Add SPDX-License-Identifier.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../python/{python-dbus_1.2.8.bb => python-dbus_1.2.10.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dbus_1.2.8.bb => python-dbus_1.2.10.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python-dbus_1.2.8.bb b/meta-python/recipes-devtools/python/python-dbus_1.2.10.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python-dbus_1.2.8.bb
rename to meta-python/recipes-devtools/python/python-dbus_1.2.10.bb
index b3f724054..9907ea953 100644
--- a/meta-python/recipes-devtools/python/python-dbus_1.2.8.bb
+++ b/meta-python/recipes-devtools/python/python-dbus_1.2.10.bb
@@ -3,14 +3,14 @@ SECTION = "devel/python"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT & AFL-2.1 | GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b03240518994df6d8c974675675e5ca4 \
-		    file://dbus-gmain/COPYING;md5=05c3eacd50f69bb1d58afec460baad57 "
+		    file://dbus-gmain/COPYING;md5=99fece6728a80737c8fd3e7c734c17c4 "
 DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "7379db774c10904f27e7e2743d90fb43"
-SRC_URI[sha256sum] = "abf12bbb765e300bf8e2a1b2f32f85949eab06998dbda127952c31cb63957b6f"
+SRC_URI[md5sum] = "5d21d5ae6423f0e41caa3400af44edac"
+SRC_URI[sha256sum] = "d4332bbd4a0054fa4010b259c293b84d461bbd9d7a8ef528157d151c0398d886"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
-- 
2.17.1




