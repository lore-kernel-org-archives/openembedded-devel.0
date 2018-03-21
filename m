Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7B32B7894E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:36:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38026080"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:36:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6E56248AE76C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:36:24 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:36:14 +0800
Message-ID: <1521603377-34881-9-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 6E56248AE76C.A71B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-dbus: 1.2.4 -> 1.2.6
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
X-List-Received-Date: Wed, 21 Mar 2018 03:36:27 -0000
Content-Type: text/plain

1.Upgrade python-dbus from 1.2.4 ro 1.2.6.
2.Update the checksum of LIC_FILES_CHKSUM, since the following content is appended to COPYING.

	The dbus-gmain/ subdirectory is under a different license: see dbus-gmain/COPYING for details.

3.Add "file://dbus-gmain/COPYING;md5=05c3eacd50f69bb1d58afec460baad57" to LIC_FILES_CHKSUM, sice 
dbus-gmain/subdirectory is under lincese of AFL-2.1 or GPLv2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-dbus_1.2.4.bb => python-dbus_1.2.6.bb}        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dbus_1.2.4.bb => python-dbus_1.2.6.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python-dbus_1.2.4.bb b/meta-python/recipes-devtools/python/python-dbus_1.2.6.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-dbus_1.2.4.bb
rename to meta-python/recipes-devtools/python/python-dbus_1.2.6.bb
index 271b559..0f18ccc 100644
--- a/meta-python/recipes-devtools/python/python-dbus_1.2.4.bb
+++ b/meta-python/recipes-devtools/python/python-dbus_1.2.6.bb
@@ -1,15 +1,16 @@
 SUMMARY = "Python bindings for the DBus inter-process communication system"
 SECTION = "devel/python"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0b83047ce9e948b67c0facc5f233476a"
+LICENSE = "MIT & AFL-2.1 | GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b03240518994df6d8c974675675e5ca4 \
+		    file://dbus-gmain/COPYING;md5=05c3eacd50f69bb1d58afec460baad57 "
 DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "7372a588c83a7232b4e08159bfd48fe5"
-SRC_URI[sha256sum] = "e2f1d6871f74fba23652e51d10873e54f71adab0525833c19bad9e99b1b2f9cc"
+SRC_URI[md5sum] = "1ce1ddf2582060f8f971652ea54cc17e"
+SRC_URI[sha256sum] = "32f29c17172cdb9cb61c68b1f1a71dfe7351506fc830869029c47449bd04faeb"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
-- 
2.7.4




