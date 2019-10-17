Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE797F35D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 03:24:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9H3O9SJ003456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 20:24:09 -0700 (PDT)
Received: from localhost (128.224.158.241) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 16 Oct 2019 20:24:08 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Oct 2019 11:24:05 +0800
Message-ID: <20191017032405.14893-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.158.241]
Subject: [meta-networking][PATCH] ipvsadm: install initscript to /etc/init.d
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
X-List-Received-Date: Thu, 17 Oct 2019 03:24:08 -0000
Content-Type: text/plain

Move initscript from /etc/rc.d/init.d to /etc/init.d

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
index 22cb88ac1..b375ca94e 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
@@ -34,7 +34,9 @@ do_compile() {
 }
 
 do_install() {
-    sed -i -e "s;SBIN\t\t= \$(BUILD_ROOT)/sbin;SBIN\t\t= \$(BUILD_ROOT)/$base_sbindir;" ${S}/Makefile
+    sed -i -e "s;SBIN\t\t= \$(BUILD_ROOT)/sbin;SBIN\t\t= \$(BUILD_ROOT)$base_sbindir;" \
+        -e "s;INIT\t\t= \$(BUILD_ROOT)/etc/rc.d/init.d;INIT\t\t= \$(BUILD_ROOT)${sysconfdir}/init.d;" \
+        ${S}/Makefile
     oe_runmake 'BUILD_ROOT=${D}' install
 }
 
-- 
2.17.1


