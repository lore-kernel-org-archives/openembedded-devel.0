Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CBE0F73DB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 07:43:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t487h7iC002284
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 May 2015 00:43:07 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 8 May 2015 00:43:07 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 May 2015 15:42:25 +0800
Message-ID: <1431070955-7100-10-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 10/20] orrery: fix PN -> BPN for multilib
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
X-List-Received-Date: Fri, 08 May 2015 07:43:06 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index e6cbffc..b3372b1 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://projects.openmoko.org/frs/download.php/923/orrery_2.7_clean.ta
 SRC_URI[md5sum]    = "bd62a33e7554ee1030313dfcdefcda8b"
 SRC_URI[sha256sum] = "645166a5e05b2064ab630534a514697fc47b681951e7fe1d635c259cbdf7a5e6"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 do_configure_prepend() {
     # fix DSO issue with binutils-2.22
-- 
1.7.9.5


