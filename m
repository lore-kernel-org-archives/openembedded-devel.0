Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CBA367FAB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 01:04:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; d="scan'208";a="80607017"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:04:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A905A4CE1C93
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 08:55:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:04:41 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 22 Dec 2019 22:16:01 -0800
Message-ID: <1577081761-126944-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A905A4CE1C93.A7120
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] krb5: upgrade 1.17 -> 1.17.1
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
X-List-Received-Date: Mon, 23 Dec 2019 01:04:39 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../krb5/{krb5_1.17.bb => krb5_1.17.1.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.17.bb => krb5_1.17.1.bb} (98%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
similarity index 98%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.17.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
index e27a4ae07..6164c8248 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
@@ -31,8 +31,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
 "
-SRC_URI[md5sum] = "3b729d89eb441150e146780c4138481b"
-SRC_URI[sha256sum] = "5a6e2284a53de5702d3dc2be3b9339c963f9b5397d3fbbc53beb249380a781f5"
+SRC_URI[md5sum] = "417d654c72526ac51466e7fe84608878"
+SRC_URI[sha256sum] = "3706d7ec2eaa773e0e32d3a87bf742ebaecae7d064e190443a3acddfd8afb181"
 
 CVE_PRODUCT = "kerberos"
 CVE_VERSION = "5-${PV}"
-- 
2.17.1




