Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAEB260800
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 01:15:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7M1FkeJ020146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 18:15:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 21 Aug 2018 18:15:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Aug 2018 09:15:45 +0800
Message-ID: <1534900545-60263-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] postgresql: Upgrade 10.4 -> 10.5
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
X-List-Received-Date: Wed, 22 Aug 2018 01:15:46 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-dbs/postgresql/{postgresql_10.4.bb => postgresql_10.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_10.4.bb => postgresql_10.5.bb} (52%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_10.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb
similarity index 52%
rename from meta-oe/recipes-dbs/postgresql/postgresql_10.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb
index 26c44a4..acd3d85 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_10.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb
@@ -6,5 +6,5 @@ SRC_URI += "\
     file://not-check-libperl.patch \
 "
 
-SRC_URI[md5sum] = "8e8770c289b3e0bdb779b5b171593479"
-SRC_URI[sha256sum] = "1b60812310bd5756c62d93a9f93de8c28ea63b0df254f428cd1cf1a4d9020048"
+SRC_URI[md5sum] = "a5fe5fdff2d6c28f65601398be0950df"
+SRC_URI[sha256sum] = "6c8e616c91a45142b85c0aeb1f29ebba4a361309e86469e0fb4617b6a73c4011"
-- 
2.7.4


