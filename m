Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0274C6D257
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 06:28:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V6StOf010933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 23:28:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 23:28:54 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2013 14:29:46 +0800
Message-ID: <1383200986-18674-5-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
References: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/5] bridge-utils: inherit update-alternatives to avoid duplicate code
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
X-List-Received-Date: Thu, 31 Oct 2013 06:28:54 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Inherit update-alternatives to avoid duplicate code.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-support/bridge-utils/bridge-utils.inc  |   14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
index bd96c6a..bcdc04a 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
@@ -11,7 +11,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz \
           file://bridge-utils-1.5-fix-incorrect-command-in-manual.patch \
 "
 
-inherit autotools
+inherit autotools update-alternatives
+
+ALTERNATIVE_${PN} = "brctl"
+ALTERNATIVE_PRIORITY[brctl] = "100"
+ALTERNATIVE_LINK_NAME[brctl] = "${sbindir}/brctl"
 
 EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
 
@@ -23,11 +27,3 @@ do_install_append () {
 }
 
 RRECOMMENDS_${PN} = "kernel-module-bridge"
-
-pkg_postinst_${PN} () {
-    update-alternatives --install ${sbindir}/brctl brctl brctl.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-    update-alternatives --remove brctl brctl.${PN}
-}
-- 
1.7.9.5


