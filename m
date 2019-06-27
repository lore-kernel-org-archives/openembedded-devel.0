Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 856F77E9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 16:02:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5RG2emE004599
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2019 09:02:40 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 09:02:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 28 Jun 2019 00:02:35 +0800
Message-ID: <1561651356-12247-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561651356-12247-1-git-send-email-hongxu.jia@windriver.com>
References: <1561651356-12247-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 2/3] libauthen-radius-perl: ptest requires meta-networking to be present
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
X-List-Received-Date: Thu, 27 Jun 2019 16:02:39 -0000
Content-Type: text/plain

Since commit [d7ea637 recipes-devtools: Move back from
meta-networking to meta-perl] applied, but freeradius
locates in meta-networking

If meta-networking not present and ptest enable, skip it

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
index fb18fe2..7118dc0 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
@@ -34,6 +34,14 @@ RDEPENDS_${PN} += "\
     perl-module-io-select \
     perl-module-io-socket \
 "
-RDEPENDS_${PN}-ptest += "freeradius"
+RDEPENDS_${PN}-ptest += " \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'freeradius', '', d)} \
+"
 
 BBCLASSEXTEND = "native"
+
+python() {
+    if bb.utils.contains('PTEST_ENABLED', '1', 'True', 'False', d) and \
+       'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('ptest requires meta-networking to be present.')
+}
-- 
2.7.4


