Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB7B360702
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 07:16:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3E7Ghte014181
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 00:16:44 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Apr 2014 00:16:43 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Apr 2014 15:16:39 +0800
Message-ID: <2201d43b35ff3c7007ccbd3805b2d4ec0d0b9193.1397459226.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397459226.git.Chong.Lu@windriver.com>
References: <cover.1397459226.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mariadb: add perl to RDEPENDS
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
X-List-Received-Date: Mon, 14 Apr 2014 07:16:43 -0000
Content-Type: text/plain

Perl doesn't be installed in small image, but mariadb-server, mariadb-client and
mariadb-leftovers need it in runtime, so we add perl to RDEPENDS.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index 37a0f0c..e474b3c 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -116,6 +116,10 @@ FILES_${PN} = " "
 RDEPENDS_${PN} = "${PN}-client ${PN}-server"
 ALLOW_EMPTY_${PN} = "1"
 
+RDEPENDS_${PN}-client = "perl"
+RDEPENDS_${PN}-server = "perl"
+RDEPENDS_${PN}-leftovers = "perl"
+
 FILES_libmysqlclient = "\
     ${libdir}/libmysqlclient.so.* \
     ${libdir}/plugin/*.so.*"
-- 
1.8.1.2


