Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 827186FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:58:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8L5wPPY003127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:58:25 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Sep 2016 22:58:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Sep 2016 13:41:05 +0800
Message-ID: <dab74fc374de3ef7dd9a6f3fa148e2f0ac203500.1474435724.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1474435724.git.jackie.huang@windriver.com>
References: <cover.1474435724.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/8 v2] libldb: fix for LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 21 Sep 2016 05:58:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Use the source files instead of common-licenses

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/libldb/libldb_1.1.27.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.27.bb b/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
index b92bf22..7b6e6e3 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
@@ -13,9 +13,9 @@ SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
 PACKAGECONFIG[ldap] = ",,openldap"
 SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-                    file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
-                    file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
+LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
+                    file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
+                    file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
 SRC_URI[md5sum] = "50a194dea128d062cf4b44c59130219b"
 SRC_URI[sha256sum] = "cdb8269cba09006ddf3766eb7721192b52ae3fdc8a6b95f4318b6b740b9d35ac"
-- 
2.8.3


