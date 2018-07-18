Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF9CC78493
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I7VhMt001620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:43 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:42 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:25 +0800
Message-ID: <1531899089-395618-6-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] pps-tools: 0.0.0+gitX -> 1.0.2
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:42 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../pps-tools/{pps-tools_git.bb => pps-tools_1.0.2.bb}               | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/pps-tools/{pps-tools_git.bb => pps-tools_1.0.2.bb} (82%)

diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_git.bb b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
similarity index 82%
rename from meta-oe/recipes-support/pps-tools/pps-tools_git.bb
rename to meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
index 8bf9036..106be35 100644
--- a/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
+++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
@@ -4,12 +4,13 @@ HOMEPAGE = "http://linuxpps.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PV = "0.0.0+git${SRCPV}"
-SRCREV = "0deb9c7e135e9380a6d09e9d2e938a146bb698c8"
+SRCREV = "cb48b7ecf7079ceba7081c78d4e61e507b0e8d2d"
 SRC_URI = "git://github.com/ago/pps-tools.git"
 
 S = "${WORKDIR}/git"
 
+RDEPENDS_pps-tools = "bash"
+
 do_install() {
         install -d ${D}${bindir} ${D}${includedir} \
                    ${D}${includedir}/sys
-- 
2.7.4


