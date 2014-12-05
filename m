Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B98AF65D34
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 02:00:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44533829"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2014 09:56:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB51xk5i029250
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Dec 2014 09:59:47 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 5 Dec 2014 10:00:06 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Dec 2014 09:59:56 +0800
Message-ID: <1417744796-29096-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-gnome][PATCH] libidl: Upgrade to 0.8.14
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Dec 2014 02:00:14 -0000
Content-Type: text/plain

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../libidl/{libidl-native_0.8.13.bb => libidl-native_0.8.14.bb}       | 4 ++--
 .../recipes-gnome/libidl/{libidl_0.8.13.bb => libidl_0.8.14.bb}       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/libidl/{libidl-native_0.8.13.bb => libidl-native_0.8.14.bb} (43%)
 rename meta-gnome/recipes-gnome/libidl/{libidl_0.8.13.bb => libidl_0.8.14.bb} (61%)

diff --git a/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.13.bb b/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
similarity index 43%
rename from meta-gnome/recipes-gnome/libidl/libidl-native_0.8.13.bb
rename to meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
index 834f4af..a27da5e 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.13.bb
+++ b/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
@@ -6,5 +6,5 @@ PR = "r1"
 
 DEPENDS = "bison-native glib-2.0-native"
 
-SRC_URI[md5sum] = "b43b289a859eb38a710f70622c46e571"
-SRC_URI[sha256sum] = "bccc7e10dae979518ff012f8464e47ec4b3558a5456a94c8679653aa0b262b71"
+SRC_URI[md5sum] = "bb8e10a218fac793a52d404d14adedcb"
+SRC_URI[sha256sum] = "c5d24d8c096546353fbc7cedf208392d5a02afe9d56ebcc1cccb258d7c4d2220"
diff --git a/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb b/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
similarity index 61%
rename from meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb
rename to meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
index d658cf8..86dfcf2 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb
+++ b/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
@@ -9,5 +9,5 @@ PR = "r1"
 BINCONFIG_GLOB = "*-config-2"
 inherit autotools pkgconfig binconfig
 
-SRC_URI[md5sum] = "b43b289a859eb38a710f70622c46e571"
-SRC_URI[sha256sum] = "bccc7e10dae979518ff012f8464e47ec4b3558a5456a94c8679653aa0b262b71"
+SRC_URI[md5sum] = "bb8e10a218fac793a52d404d14adedcb"
+SRC_URI[sha256sum] = "c5d24d8c096546353fbc7cedf208392d5a02afe9d56ebcc1cccb258d7c4d2220"
-- 
1.8.3.1


