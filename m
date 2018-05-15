Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBB87505A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 10:15:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39942891"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2018 18:16:00 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 93C6C4B34D47
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 18:15:57 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 15 May 2018 18:16:01 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 May 2018 18:15:18 +0800
Message-ID: <20180515101519.5413-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 93C6C4B34D47.A02DB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Hong Liu <hongl.fnst@cn.fujitsu.com>
Subject: [meta-oe][PATCH] lvm2: 2.02.171 -> 2.02.277
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
X-List-Received-Date: Tue, 15 May 2018 10:15:59 -0000
Content-Type: text/plain

Upgrade lvm2 from 2.02.171 to 2.02.277.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../lvm2/{libdevmapper_2.02.171.bb => libdevmapper_2.02.177.bb}       | 4 ++--
 meta-oe/recipes-support/lvm2/{lvm2_2.02.171.bb => lvm2_2.02.177.bb}   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.02.171.bb => libdevmapper_2.02.177.bb} (63%)
 rename meta-oe/recipes-support/lvm2/{lvm2_2.02.171.bb => lvm2_2.02.177.bb} (93%)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.171.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.177.bb
similarity index 63%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.02.171.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.02.177.bb
index b6ae902..211a472 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.171.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.177.bb
@@ -1,7 +1,7 @@
 require lvm2.inc
 
-SRC_URI[md5sum] = "153b7bb643eb26073274968e9026fa8f"
-SRC_URI[sha256sum] = "b815a711a2fabaa5c3dc1a4a284df0268bf0f325f0fc0f5c9530c9bbb54b9964"
+SRC_URI[md5sum] = "ee6cfbc5a0c5696ffae79dac04ee7a2b"
+SRC_URI[sha256sum] = "4025a23ec9b15c2cb7486d151c29dc953b75efc4d452cfe9dbbc7c0fac8e80f2"
 
 DEPENDS += "autoconf-archive-native"
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
similarity index 93%
rename from meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
index 84881e7..390970f 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
@@ -1,7 +1,7 @@
 require lvm2.inc
 
-SRC_URI[md5sum] = "153b7bb643eb26073274968e9026fa8f"
-SRC_URI[sha256sum] = "b815a711a2fabaa5c3dc1a4a284df0268bf0f325f0fc0f5c9530c9bbb54b9964"
+SRC_URI[md5sum] = "ee6cfbc5a0c5696ffae79dac04ee7a2b"
+SRC_URI[sha256sum] = "4025a23ec9b15c2cb7486d151c29dc953b75efc4d452cfe9dbbc7c0fac8e80f2"
 
 SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch"
 
-- 
2.7.4




