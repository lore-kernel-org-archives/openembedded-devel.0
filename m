Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A1B89762B4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 15:05:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10846983"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2016 23:05:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 70D61404240C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 23:05:49 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sun, 11 Sep 2016 23:05:49 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 11 Sep 2016 11:05:30 -0400
Message-ID: <1473606330-1638-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 70D61404240C.A38B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-dbus: 1.2.0 -> 1.2.4
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
X-List-Received-Date: Sun, 11 Sep 2016 15:05:59 -0000
Content-Type: text/plain

Upgrade python-dbus from 1.2.0 to 1.2.4.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../python/{python-dbus_1.2.0.bb => python-dbus_1.2.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dbus_1.2.0.bb => python-dbus_1.2.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python-dbus_1.2.0.bb b/meta-python/recipes-devtools/python/python-dbus_1.2.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python-dbus_1.2.0.bb
rename to meta-python/recipes-devtools/python/python-dbus_1.2.4.bb
index 95ba920..271b559 100644
--- a/meta-python/recipes-devtools/python/python-dbus_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-dbus_1.2.4.bb
@@ -8,8 +8,8 @@ DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "b09cd2d1a057cc432ce944de3fc06bf7"
-SRC_URI[sha256sum] = "e12c6c8b2bf3a9302f75166952cbe41d6b38c3441bbc6767dbd498942316c6df"
+SRC_URI[md5sum] = "7372a588c83a7232b4e08159bfd48fe5"
+SRC_URI[sha256sum] = "e2f1d6871f74fba23652e51d10873e54f71adab0525833c19bad9e99b1b2f9cc"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
-- 
2.7.4




