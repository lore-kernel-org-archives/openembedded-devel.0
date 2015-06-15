Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA0275902
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 09:39:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5F9dgdC026841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 02:39:42 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 15 Jun 2015 02:39:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2015 17:32:42 +0800
Message-ID: <1434360762-18275-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] phpmyadmin: upgrade 4.4.9
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
X-List-Received-Date: Mon, 15 Jun 2015 09:39:44 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

upgrade to include CVE fixes:
	CVE-2015-3903
	CVE-2015-3902

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.4.4.bb => phpmyadmin_4.4.9.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.4.4.bb => phpmyadmin_4.4.9.bb} (88%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.4.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.9.bb
similarity index 88%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.4.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.9.bb
index c021c92..91a1cbf 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.4.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.9.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "912eeb8634bf99a7538a6fb4cad9135c"
-SRC_URI[sha256sum] = "bad1583fa3ef9534bc412822f873635c4b7f90488f17567d7ab0e2ea9bbd338c"
+SRC_URI[md5sum] = "d60d80fabe1b27023122228dcf7ee73e"
+SRC_URI[sha256sum] = "b9a31d6ec3e7abe708160ce8dbc364c029015256766bac6f68134b84a836d766"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
1.9.1


