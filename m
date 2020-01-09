Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 71F107FE3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 09:12:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,413,1571673600"; d="scan'208";a="81538374"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 17:12:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 39D8D4CE1C9E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 17:03:39 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 17:12:39 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 9 Jan 2020 17:12:49 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Jan 2020 05:16:14 -0800
Message-ID: <1578575774-86089-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578575774-86089-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578575774-86089-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 39D8D4CE1C9E.A605E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libplist: upgrade 2.0.0 -> 2.1.0
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
X-List-Received-Date: Thu, 09 Jan 2020 09:12:39 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libimobiledevice/{libplist_2.0.0.bb => libplist_2.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libimobiledevice/{libplist_2.0.0.bb => libplist_2.1.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.0.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/libimobiledevice/libplist_2.0.0.bb
rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
index 43c1fd5ca..48dec47a8 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.0.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "libxml2 glib-2.0 swig python"
 
 inherit autotools pkgconfig pythonnative
 
-SRCREV = "62ec804736435fa34e37e66e228e17e2aacee1d7"
+SRCREV = "3df02d4d0e9008771e8622fdc10de8333b3f0d85"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https \
            "
 
-- 
2.17.1




