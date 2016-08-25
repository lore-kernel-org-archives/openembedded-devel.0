Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 418E265CBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 02:15:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10256946"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Aug 2016 10:15:23 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id F2B3F42EB206
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 10:15:20 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 25 Aug 2016 10:15:20 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 22:15:16 -0400
Message-ID: <1472091316-2026-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: F2B3F42EB206.A6F61
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] openldap: 2.4.43 -> 2.4.44
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
X-List-Received-Date: Thu, 25 Aug 2016 02:15:29 -0000
Content-Type: text/plain

1)Upgrade openldap from 2.4.43 to 2.4.44.
2)Modify LIC_FILES_CHKSUM, since the date in it has been changed, But the LICENSE has not been changed.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../openldap/{openldap_2.4.43.bb => openldap_2.4.44.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.43.bb => openldap_2.4.44.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.43.bb b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.43.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.44.bb
index 8618365..d33b010 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9d845a25aef97da753144f1dacbf680c \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c933fba6d89fda89f58df1e086e3f2e7 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
 "
 SECTION = "libs"
@@ -26,8 +26,8 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://thread_stub.patch \
 "
 
-SRC_URI[md5sum] = "49ca65e27891fcf977d78c10f073c705"
-SRC_URI[sha256sum] = "34d78e5598a2b0360d26a9050fcdbbe198c65493b013bb607839d5598b6978c8"
+SRC_URI[md5sum] = "693ac26de86231f8dcae2b4e9d768e51"
+SRC_URI[sha256sum] = "d7de6bf3c67009c95525dde3a0212cc110d0a70b92af2af8e3ee800e81b88400"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.7.4




