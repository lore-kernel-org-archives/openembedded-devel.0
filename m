Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3097F28F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 07:50:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x847oTOF006198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Sep 2019 00:50:29 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 4 Sep 2019 00:50:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Sep 2019 16:16:28 +0800
Message-ID: <1567584988-120128-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netcf: Fix do_configure failed when multilib
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
X-List-Received-Date: Wed, 04 Sep 2019 07:50:29 -0000
Content-Type: text/plain

Fixed do_configure failed:
$ bitbake lib32-netcf

cp: cannot stat '/path/to/lib32-recipe-sysroot/usr/share/gnulib': No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/netcf/netcf_0.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index 0f49d60..c57e7d4 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -16,7 +16,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "release-(?P<pver>(\d+(\.\d+)+))"
 
 DEPENDS += "augeas libnl libxslt libxml2"
 
-do_configure[depends] += "gnulib:do_populate_sysroot"
+do_configure[depends] += "${MLPREFIX}gnulib:do_populate_sysroot"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


