Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A18BE60112
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 11:22:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKBM15M004611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 03:22:01 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 20 Nov 2015 03:22:00 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 19:22:04 +0800
Message-ID: <1448018524-16308-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lmsensors: allow lmsensors-isatools to be empty
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
X-List-Received-Date: Fri, 20 Nov 2015 11:22:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

isadump and isaset are only built on x86 machines,
so allow lmsensors-isatools to be empty.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index 62ea131..364eb9e 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -131,3 +131,7 @@ RDEPENDS_${PN}-pwmconfig = "${PN}-fancontrol"
 FILES_${PN}-isatools = "${sbindir}/isa*"
 FILES_${PN}-isatools-dbg = "${sbindir}/.debug/isa*"
 FILES_${PN}-isatools-doc = "${mandir}/man8/isa*"
+
+# isadump and isaset are only built on x86 machines,
+# so allow it to be empty.
+ALLOW_EMPTY_${PN}-isatools = "1"
-- 
2.3.5


