Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7359E764D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:08:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6UK8S0l025257
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:08:28 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 30 Jul 2015 13:08:09 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Jul 2015 13:08:28 -0700
Message-ID: <1438286908-9638-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][ 1/1] ypbind-mt: add dependency but keep as broken
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
X-List-Received-Date: Thu, 30 Jul 2015 20:08:29 -0000
Content-Type: text/plain

We will need the conditional dependency on systemd.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-support/nis/ypbind-mt_2.2.bb           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
index 4f8bf48..6a9262a 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
@@ -15,7 +15,7 @@ of known secure NIS server (/etc/yp.conf) Binds to \
 the server which answered as first. \
 "
 HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
-DEPENDS = "yp-tools"
+DEPENDS = "yp-tools ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PROVIDES += "ypbind"
 
 PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
-- 
1.7.9.5


