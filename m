Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA63F606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 03:29:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S3TQOZ014728
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 20:29:26 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 20:29:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 11:22:10 +0800
Message-ID: <1561692130-26121-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] turbostat: set PACKAGE_ARCH as MACHINE_ARCH
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
X-List-Received-Date: Fri, 28 Jun 2019 03:29:26 -0000
Content-Type: text/plain

This recipe depends on 'virtual/kernel', so it should
be MACHINE_ARCH.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
index 3f25e6f..5f6588d 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -20,6 +20,7 @@ SRC_URI += "\
             file://COPYING \
             "
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "virtual/kernel"
 
 # This looks in S, so we better make sure there's
-- 
2.7.4


