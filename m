Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8C8E731A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:24:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0F9O6YD005825
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 15 Jan 2016 01:24:06 -0800
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 15 Jan 2016 01:24:05 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jan 2016 17:23:52 +0800
Message-ID: <0becc2db969fd0629f9a22874b041b2f035925bd.1452848802.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452848802.git.yi.zhao@windriver.com>
References: <cover.1452848802.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 2/4 v2] espeak: fix host-user-contaminated
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
X-List-Received-Date: Fri, 15 Jan 2016 09:24:06 -0000
Content-Type: text/plain

Fix QA warning:
WARNING: QA Issue: espeak: /espeak/usr/share/espeak-data/mbrola_ph/de6_phtrans is owned by uid 1000,
which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/espeak/espeak_1.37.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/recipes-support/espeak/espeak_1.37.bb
index 86f2c7a..73aff55 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.37.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.37.bb
@@ -39,5 +39,5 @@ do_install() {
         rm -f ${S}/espeak-data/phon*
     fi
 
-    cp -prf ${S}/espeak-data/* ${D}${datadir}/espeak-data
+    cp -rf --preserve=mode,links ${S}/espeak-data/* ${D}${datadir}/espeak-data
 }
-- 
1.7.9.5


