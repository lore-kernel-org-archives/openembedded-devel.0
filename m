Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1974E6FF56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:06:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA9B6WZC015683
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Nov 2017 03:06:32 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 9 Nov 2017 03:06:31 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Nov 2017 19:04:52 +0800
Message-ID: <0361a1ae28b114f359d7cc1cd7ab3983939c69a0.1510225386.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1510225386.git.jackie.huang@windriver.com>
References: <cover.1510225386.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/3] iscsi-initiator-utils: check file existence before moving
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
X-List-Received-Date: Thu, 09 Nov 2017 11:06:31 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Check the file existence before moving to avoid the error:
| mv: cannot stat /<build_dir>/git/utils/fwparam_ibft/prom_lex.l:
| No such file or directory

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
index 50aadb6b6..95848d0b3 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
@@ -57,7 +57,9 @@ do_configure () {
 
 do_compile () {
     # Make sure we DO NOT regenerate prom_lex.c.
-    mv ${S}/utils/fwparam_ibft/prom_lex.l ${S}/utils/fwparam_ibft/prom_lex.l.unused
+    if [ -f ${S}/utils/fwparam_ibft/prom_lex.l ]; then
+        mv ${S}/utils/fwparam_ibft/prom_lex.l ${S}/utils/fwparam_ibft/prom_lex.l.unused
+    fi
     oe_runmake -C ${S} ${EXTRA_OEMAKE} user
 }
 
-- 
2.11.0


