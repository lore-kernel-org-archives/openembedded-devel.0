Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 37BD07F523
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 09:00:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="79439182"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 17:00:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3C9D74CE1C95
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:51:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 17:00:17 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2019 07:28:13 -0800
Message-ID: <1575300494-101612-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575300494-101612-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575300494-101612-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3C9D74CE1C95.A844E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-dbus: upgrade 1.2.12 -> 1.2.14
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
X-List-Received-Date: Mon, 02 Dec 2019 09:00:17 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python-dbus_1.2.12.bb => python-dbus_1.2.14.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dbus_1.2.12.bb => python-dbus_1.2.14.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python-dbus_1.2.12.bb b/meta-python/recipes-devtools/python/python-dbus_1.2.14.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python-dbus_1.2.12.bb
rename to meta-python/recipes-devtools/python/python-dbus_1.2.14.bb
index f08fa20..b89d7d2 100644
--- a/meta-python/recipes-devtools/python/python-dbus_1.2.12.bb
+++ b/meta-python/recipes-devtools/python/python-dbus_1.2.14.bb
@@ -9,8 +9,8 @@ DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "428b7a9e7e2d154a7ceb3e13536283e4"
-SRC_URI[sha256sum] = "cdd4de2c4f5e58f287b12013ed7b41dee81d503c8d0d2397c5bd2fb01badf260"
+SRC_URI[md5sum] = "c8739234fca9fba26368d1a337abe830"
+SRC_URI[sha256sum] = "b10206ba3dd641e4e46411ab91471c88e0eec1749860e4285193ee68df84ac31"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
-- 
2.7.4




