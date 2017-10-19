Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD8F478312
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 01:45:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9J1jRc1003937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Oct 2017 18:45:27 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 18 Oct 2017 18:45:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Oct 2017 21:45:17 -0400
Message-ID: <1508377517-102153-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1508377517-102153-1-git-send-email-hongxu.jia@windriver.com>
References: <1508377517-102153-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2][meta-oe] libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
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
X-List-Received-Date: Thu, 19 Oct 2017 01:45:28 -0000
Content-Type: text/plain

While multilib enabled, if other recipe RDEPENDS python3-libreport,
it failed with:
...
ERROR: Nothing RPROVIDES 'lib32-python3-libreport'
...

Do not use python3-${PN} could fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/libreport/libreport_2.9.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
index 2fdfd7d..525437b 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
@@ -26,7 +26,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 
 inherit gettext autotools python3native pkgconfig
 
-RDEPENDS_${PN}-python3 += "${PN}"
+RDEPENDS_python3-libreport += "${PN}"
 
 do_patch[prefuncs] += "do_gen_version"
 do_gen_version() {
@@ -34,9 +34,9 @@ do_gen_version() {
     ./gen-version
 }
 
-PACKAGES += "python3-${PN}"
+PACKAGES += "python3-libreport"
 
 FILES_${PN} += "${datadir}/*"
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug"
-FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_python3-libreport = "${PYTHON_SITEPACKAGES_DIR}/*"
 
-- 
1.8.3.1


