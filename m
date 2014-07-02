Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A37546AC7A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:57:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s626vkL5013461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:57:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:57:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:56:36 -0700
Message-ID: <1404284261-42377-10-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gpe] [PATCH 09/74] minilite: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 06:57:50 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-graphics/minilite/minilite_0.50.bb     |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb b/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
index 81095be..90960a2 100644
--- a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
+++ b/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
@@ -8,7 +8,7 @@ DEPENDS = "libgpewidget"
 
 inherit gpe
 
-SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz \
+SRC_URI = "${GPE_MIRROR}/${BP}.tar.gz \
            file://makefile-fix.patch"
 SRC_URI[md5sum] = "d81cecf269ad7bab0da960e6e7228332"
 SRC_URI[sha256sum] = "2b299425203246090a4949e034f1d0efb3ff99cd1591d0e16c57370a530b361e"
-- 
1.7.9.5


