Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABF0C79652
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 12:09:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8CC9BrN012048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 05:09:11 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 12 Sep 2018 05:09:10 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Sep 2018 05:09:10 -0700
Message-ID: <20180912120910.14424-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] snappy: modify cmake variable to generate shared library
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
X-List-Received-Date: Wed, 12 Sep 2018 12:09:10 -0000
Content-Type: text/plain

FILES_${PN}-xxx under packages-split/ depend on FILES_${PN}.
But the FILES_${PN} is empty. This is because snappy doesn't
generate shared library by default.

So we should modify cmake variable to generate shared library.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta-oe/recipes-extended/snappy/snappy_1.1.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
index 70223be49..9f37c5fc2 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
@@ -20,3 +20,6 @@ inherit cmake pkgconfig
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"
 TARGET_CFLAGS += "-fPIC"
+
+EXTRA_OECMAKE += '-DBUILD_SHARED_LIBS="ON" \
+                  '
-- 
2.11.0


