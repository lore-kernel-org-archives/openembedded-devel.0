Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4426273D0B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 18:54:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6MIsBNX029071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 11:54:11 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 22 Jul 2015 11:54:11 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jul 2015 11:54:10 -0700
Message-ID: <1437591250-9247-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep as broken
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
X-List-Received-Date: Wed, 22 Jul 2015 18:54:12 -0000
Content-Type: text/plain

We will need the conditional dependency on systemd.  It is
not a good idea to use PNBLACKLIST in a recipe, and the
version here does not suppress lib32-ypbind-mt.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-support/nis/ypbind-mt_2.2.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
index 4f8bf48..359b020 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
@@ -15,10 +15,12 @@ of known secure NIS server (/etc/yp.conf) Binds to \
 the server which answered as first. \
 "
 HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
-DEPENDS = "yp-tools"
+DEPENDS = "yp-tools ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PROVIDES += "ypbind"
 
-PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
+python () {
+    raise bb.parse.SkipPackage("BROKEN: Depends on broken yp-tools")
+}
 
 SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
            file://ypbind-yocto.init \
-- 
1.7.9.5


