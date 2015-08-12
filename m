Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA27976863
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:45:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7C7jqcK009828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 00:45:52 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Wed, 12 Aug 2015 00:45:51 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Aug 2015 15:45:36 +0800
Message-ID: <a70d108c3c4b2395bfc680aba31e61bea5b30c58.1439365242.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1439365242.git.yi.zhao@windriver.com>
References: <cover.1439365242.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 3/3] uim: use _remove operator to drop silent rules
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
X-List-Received-Date: Wed, 12 Aug 2015 07:45:51 -0000
Content-Type: text/plain

When MACHINE=qemux86-64 and enable multilib, lib32-uim fails to build
because CONFIGUREOPTS isn't expanded correctly.

See similar issue:
http://lists.openembedded.org/pipermail/openembedded-core/2013-November/086510.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/uim/uim_1.3.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.3.1.bb b/meta-oe/recipes-support/uim/uim_1.3.1.bb
index 01657df..2232405 100644
--- a/meta-oe/recipes-support/uim/uim_1.3.1.bb
+++ b/meta-oe/recipes-support/uim/uim_1.3.1.bb
@@ -31,7 +31,7 @@ EXTRA_OECONF += "--disable-emacs \
                  --without-mana \
                  --without-eb"
 
-CONFIGUREOPTS_class-target := "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-silent-rules', ' ')}"
+CONFIGUREOPTS_remove_class-target = "--disable-silent-rules"
 
 PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-fep uim-common uim-anthy libuim0 libuim-dev"
 
-- 
1.7.9.5


