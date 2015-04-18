Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 391527226D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2015 15:22:23 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YjUZa-0003wY-Aa from Dmitry_Eremin@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2015 08:22:22 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Sat, 18 Apr 2015 16:22:20 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 18 Apr 2015 18:22:19 +0300
Message-ID: <1429370539-13459-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] lksctp-tools: make -utils and -ptest recommend sctp kernel module
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
X-List-Received-Date: Sat, 18 Apr 2015 15:22:26 -0000
Content-Type: text/plain

Neither -utils nor -ptest packages make sense w/o actual kernel support
for SCTP protocol. Make both packages RRECOMMEND kernel-module-sctp.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
index c07b3c6..7477349 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -60,3 +60,6 @@ FILES_${PN}-dev += " \
 "
 
 FILES_${PN}-utils = "${bindir}/*"
+
+RRECOMMENDS_${PN}-utils += "kernel-module-sctp"
+RRECOMMENDS_${PN}-ptest += "kernel-module-sctp"
-- 
2.1.4


