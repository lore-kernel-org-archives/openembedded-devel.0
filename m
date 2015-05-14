Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E095E73F4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 07:14:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4E7EQMG021759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 May 2015 00:14:26 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 14 May 2015 00:14:26 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 May 2015 15:14:18 +0800
Message-ID: <6544c19034b06d0b4502b6fc7b2404452739584a.1431587286.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431587286.git.yi.zhao@windriver.com>
References: <cover.1431587286.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 1/3] p7zip: fix PN -> BPN for multilib
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
X-List-Received-Date: Thu, 14 May 2015 07:14:28 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
index 8905ae9..be706e1 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
 SRC_URI[md5sum] = "bd6caaea567dc0d995c990c5cc883c89"
 SRC_URI[sha256sum] = "49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782"
 
-S = "${WORKDIR}/${PN}_${PV}"
+S = "${WORKDIR}/${BPN}_${PV}"
 
 do_install() {
     install -d ${D}${bindir}
-- 
1.7.9.5


