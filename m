Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35B136093F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 09:38:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7H9cWqN032255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:38:32 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 17 Aug 2018 02:38:31 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Aug 2018 17:38:30 +0800
Message-ID: <1534498710-392479-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ipvsadm: fix usrmerge install path
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
X-List-Received-Date: Fri, 17 Aug 2018 09:38:31 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update SBIN to fix below error when
usrmerge enabled in DISTRO_FEATURES.

ERROR: QA Issue: ipvsadm-dbg package is not obeying usrmerge distro feature. /sbin should be relocated to /usr. [usrmerge]

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
index 58407a1..4f3c16d 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
@@ -34,6 +34,7 @@ do_compile() {
 }
 
 do_install() {
+    sed -i -e "s;SBIN\t\t= \$(BUILD_ROOT)/sbin;SBIN\t\t= \$(BUILD_ROOT)/$base_sbindir;" ${S}/Makefile
     oe_runmake 'BUILD_ROOT=${D}' install
 }
 
-- 
2.7.4


