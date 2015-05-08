Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F274572A2D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 07:43:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t487hE39002287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 May 2015 00:43:14 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 8 May 2015 00:43:13 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 May 2015 15:42:27 +0800
Message-ID: <1431070955-7100-12-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 12/20] mime-support: fix PN -> BPN for multilib
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
X-List-Received-Date: Fri, 08 May 2015 07:43:13 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mime-support/mime-support_3.48.bb              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
index 7f8b40a..d617b66 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
@@ -8,11 +8,11 @@ RDEPENDS_${PN} = "perl"
 RRECOMMENDS_${PN} = "file"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 FILES_${PN} += " ${libdir}/mime"
 
-docdir_append = "/${PN}"
+docdir_append = "/${BPN}"
 
 do_install () {
     install -d ${D}${sysconfdir}
-- 
1.7.9.5


