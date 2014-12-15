Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5D072430
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:36:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBF9a2ir005413
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 01:36:02 -0800 (PST)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Dec 2014 01:36:02 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Dec 2014 17:36:00 +0800
Message-ID: <1418636161-30394-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] phpmyadmin: don't install patches
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
X-List-Received-Date: Mon, 15 Dec 2014 09:36:10 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Don't install local patch files to target.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
index 49ca7da..7cc3604 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
@@ -21,6 +21,8 @@ inherit allarch
 do_install() {
     install -d ${D}${datadir}/${BPN}
     cp -a * ${D}${datadir}/${BPN}
+    # Don't install patches to target
+    rm -rf ${D}${datadir}/${BPN}/patches
 
     install -d ${D}${sysconfdir}/apache2/conf.d
     install -m 0644 ${WORKDIR}/apache.conf ${D}${sysconfdir}/apache2/conf.d/phpmyadmin.conf
-- 
1.7.10.4


