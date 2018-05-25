Return-Path: <Noor_Ahsan@mentor.com>
X-Greylist: delayed 978 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 May 2018 12:11:52 UTC
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3772A74926
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 12:11:52 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1fMBJn-0002el-76 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 May 2018 04:55:35 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (147.34.91.1) by
	svr-orw-fem-04.mgc.mentorg.com (147.34.97.41) with Microsoft SMTP
	Server id 14.3.224.2; Fri, 25 May 2018 04:55:34 -0700
From: Noor Ahsan <noor_ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 May 2018 16:55:31 +0500
Message-ID: <1527249332-31097-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/1] radvd: Fix missing yacc error.
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
X-List-Received-Date: Fri, 25 May 2018 12:11:53 -0000
Content-Type: text/plain

* Following error apprear in do configure. Fix it by adding bison-native in DEPENDS.
  ../radvd-2.17/ylwrap: line 176: yacc: command not found

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta-networking/recipes-daemons/radvd/radvd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index bff693c..06d16a4 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -8,7 +8,7 @@ addresses and some other parameters. They also can \
 choose a default router based on these advertisements."
 HOMEPAGE = "http://www.litech.org/radvd/"
 SECTION = "net"
-DEPENDS = "flex-native libdaemon"
+DEPENDS = "flex-native bison-native libdaemon "
 
 # License is BSD-Style (with advertising clause) but also has an additional 0th clause
 LICENSE = "radvd"
-- 
2.7.4


