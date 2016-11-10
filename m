Return-Path: <Junxian.Xiao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C887719B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2016 02:32:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAA2WDjA007460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Nov 2016 18:32:13 -0800 (PST)
Received: from jxiao1-OptiPlex-990.wrs.com (128.224.162.155) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 18:32:12 -0800
From: "Junxian.Xiao" <Junxian.Xiao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Nov 2016 10:31:42 +0800
Message-ID: <1478745102-15521-2-git-send-email-Junxian.Xiao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-webserver][PATCH v2] apache2: include .load files in modules.d
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
X-List-Received-Date: Thu, 10 Nov 2016 02:32:12 -0000
Content-Type: text/plain

According to other Linux distributes like Ubuntu, the modules
are usually included by 'LoadModule' command in *.load files
in mods-enable directory, as *.conf files in this directory
are usually used for special configurations for each module.

Include *.load in apache2 top conf file to be compatible with
customer's normal usage habits.

Signed-off-by: Junxian.Xiao <Junxian.Xiao@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
index be24998..96f21dd 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
@@ -80,6 +80,7 @@ do_install_append() {
 
     # Ensure configuration file pulls in conf.d and modules.d
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
+    printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.load" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
     # match with that is in init script
     printf "\nPidFile /run/httpd.pid" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
-- 
2.7.4


