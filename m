Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89D746FA9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 00:46:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5D0kOOs001179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 17:46:25 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 12 Jun 2014 17:46:24 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 08:46:08 +0800
Message-ID: <1402620392-7425-4-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
References: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/14] vblade: inherit autotools-brokensep
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
X-List-Received-Date: Fri, 13 Jun 2014 00:46:29 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

It needs autotools-brokensep, otherwise do_install error:

install: cannot stat `vblade-20/vblade': No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-daemons/vblade/vblade_20.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vblade/vblade_20.bb b/meta-networking/recipes-daemons/vblade/vblade_20.bb
index 5b7c167..a2ebb5a 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_20.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_20.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${BPN}-${PV}.tgz \
 SRC_URI[md5sum] = "3c80e4a6bc7d66ae0c235b88cb44bd59"
 SRC_URI[sha256sum] = "c8fe2fc4f2fba8e07e5cfdf17335982584eef2cd5c78bf8b1db93f2b56e7121d"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_install() {
     install -D -m 0755 ${S}/vblade ${D}/${sbindir}/vblade
-- 
1.7.10.4


