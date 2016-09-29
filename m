Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3AE560235
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 01:44:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T1iDOW021723
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 18:44:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 28 Sep 2016 18:44:12 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Sep 2016 09:44:16 +0800
Message-ID: <1475113456-16308-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] webmin: ensure correct PERLLIB path
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
X-List-Received-Date: Thu, 29 Sep 2016 01:44:14 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
index 3fc083a..d96c0f2 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
@@ -109,6 +109,9 @@ do_install() {
     export no_pam=1
     mkdir -p $tempdir
     ${S}/../setup.sh
+
+    # Ensure correct PERLLIB path
+    sed -i -e 's#${D}##g' ${D}${sysconfdir}/webmin/start
 }
 
 INITSCRIPT_NAME = "webmin"
-- 
2.8.3


