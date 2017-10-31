Return-Path: <Alexey_Firago@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F19FD6069C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 20:47:07 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e9dRE-0003MG-Vp from Alexey_Firago@mentor.com ;
	Tue, 31 Oct 2017 13:47:08 -0700
Received: from localhost.localdomain (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 31 Oct 2017 20:47:07 +0000
From: Alexey Firago <alexey_firago@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Oct 2017 23:47:02 +0300
Message-ID: <1509482823-26267-2-git-send-email-alexey_firago@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509482823-26267-1-git-send-email-alexey_firago@mentor.com>
References: <1509482823-26267-1-git-send-email-alexey_firago@mentor.com>
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH 1/2] glflags: Build native version
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
X-List-Received-Date: Tue, 31 Oct 2017 20:47:08 -0000
Content-Type: text/plain

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index 0e85b3f..28b652a 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -19,3 +19,5 @@ EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTAL
 PACKAGES =+ "${PN}-bash-completion"
 FILES_${PN}-bash-completion += "${bindir}/gflags_completions.sh"
 RDEPENDS_${PN}-bash-completion = "bash bash-completion"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


