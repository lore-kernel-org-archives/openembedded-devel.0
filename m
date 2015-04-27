Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 717A865CD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 06:34:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3R6YcCJ011626
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Apr 2015 23:34:38 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 26 Apr 2015 23:34:38 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Apr 2015 14:34:37 +0800
Message-ID: <1430116477-7760-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] phpmyadmin: upgrade to 4.4.4
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
X-List-Received-Date: Mon, 27 Apr 2015 06:34:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.3.4.bb => phpmyadmin_4.4.4.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.3.4.bb => phpmyadmin_4.4.4.bb} (88%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.3.4.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.4.bb
similarity index 88%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.3.4.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.4.bb
index 76068e2..c021c92 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.3.4.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "f811243e241ee81defb97e014ca713ef"
-SRC_URI[sha256sum] = "91258e07e04e25c5e49284b194ebff8ffa807ad38832fbe802cc6af3f7cb96d3"
+SRC_URI[md5sum] = "912eeb8634bf99a7538a6fb4cad9135c"
+SRC_URI[sha256sum] = "bad1583fa3ef9534bc412822f873635c4b7f90488f17567d7ab0e2ea9bbd338c"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
2.1.0


