Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB9626B7CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:08:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA788GYp007361
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:08:16 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 00:08:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Nov 2014 16:08:07 +0800
Message-ID: <06e2571377af5fb4d98337d213fc5108f7404ff4.1415347548.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415347548.git.hongxu.jia@windriver.com>
References: <cover.1415347548.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] pimd: add do_install to pimd
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
X-List-Received-Date: Fri, 07 Nov 2014 08:08:17 -0000
Content-Type: text/plain

The previous do_install is empty and do nothing.

Unset variables datadir and mandir, use pimd's default set.
So it could install doc files correctly.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
index da097ce..f032361 100644
--- a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
+++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
@@ -8,3 +8,10 @@ SRC_URI[md5sum] = "a12448bc7c9bfcebf51a13ebf1ffa962"
 SRC_URI[sha256sum] = "01016940543a0a6131d4e6c91b595d47e187012c59a298eec14c3dbc38564b3a"
 
 CFLAGS += "-I ${S}/include "
+
+do_install() {
+	unset datadir
+	unset mandir
+	oe_runmake 'DESTDIR=${D}' install
+}
+
-- 
1.9.1


