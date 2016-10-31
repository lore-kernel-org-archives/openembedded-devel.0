Return-Path: <Junxian.Xiao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2865F60132
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 08:47:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9V8lZAO015549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 01:47:35 -0700 (PDT)
Received: from pek-idpbuild2.wrs.com (128.224.178.5) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Mon, 31 Oct 2016 01:47:34 -0700
From: "Junxian.Xiao" <Junxian.Xiao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 31 Oct 2016 16:47:01 +0800
Message-ID: <1477903622-19542-1-git-send-email-Junxian.Xiao@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] apache2: include .load files in modules.d
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
X-List-Received-Date: Mon, 31 Oct 2016 08:47:34 -0000
Content-Type: text/plain

Issue: LIN8-5007

According to other linux distributes like ubuntu, the modules
are usually included by 'LoadModule' command in *.load files
in mods-enable directory, and *.conf files in this directory
are for special configurations for each module.

The stucture of the files tree is not the same in yocto, so this
may be not the rule that we must follow. But still add *.load to
be compatible with customer's normal usage habits.

Signed-off-by: Junxian.Xiao <Junxian.Xiao@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.16.bb        |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
index 4aacff1..52127c2 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
@@ -81,6 +81,7 @@ do_install_append() {
 
     # Ensure configuration file pulls in conf.d and modules.d
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
+    printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.load" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
     # match with that is in init script
     printf "\nPidFile /run/httpd.pid" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
-- 
1.7.1


