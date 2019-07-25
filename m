Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 596B07CE21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 06:31:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6P6VDQ7001858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Jul 2019 23:31:13 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 24 Jul 2019 23:31:12 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 25 Jul 2019 14:31:10 +0800
Message-ID: <1564036270-21074-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lmsensors: support package lmsensors
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
X-List-Received-Date: Thu, 25 Jul 2019 06:31:13 -0000
Content-Type: text/plain

Recipe lmsensors has multiple packages, but do not provide package lmsensors.
The fix will allow package lmsensors empty, and it runtime depends on other
sub packages. It is convenience for Yocto new user to install all of them
by specifying one package, especially the package name is the same with
recipe name

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
index c8e4565..b4fcfe3 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
@@ -70,6 +70,18 @@ do_install() {
 
 RPROVIDES_${PN}-dbg += "${PN}-libsensors-dbg ${PN}-sensors-dbg ${PN}-sensord-dbg ${PN}-isatools-dbg"
 
+ALLOW_EMPTY_${PN} = "1"
+RDEPENDS_${PN} += " \
+    ${PN}-libsensors \
+    ${PN}-sensors \
+    ${PN}-sensord \
+    ${PN}-fancontrol \
+    ${PN}-sensorsdetect \
+    ${PN}-sensorsconfconvert \
+    ${PN}-pwmconfig \
+    ${PN}-isatools \
+"
+
 # libsensors packages
 PACKAGES =+ "${PN}-libsensors ${PN}-libsensors-dev ${PN}-libsensors-staticdev ${PN}-libsensors-doc"
 
-- 
2.7.4


