Return-Path: <hieu2.nguyen@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3497FC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 03:40:16 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.3612.1737085210606634012
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 19:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: hieu2.nguyen@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 17 Jan 2025 12:40:07 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: hieu2.nguyen@lge.com
Received: from unknown (HELO hieu2-nguyen-worker-2204.bee-live.svc.cluster.local) (10.185.60.37)
	by 156.147.1.121 with ESMTP; 17 Jan 2025 12:40:07 +0900
X-Original-SENDERIP: 10.185.60.37
X-Original-MAILFROM: hieu2.nguyen@lge.com
From: hieu2.nguyen@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	Hieu Van Nguyen <hieu2.nguyen@lge.com>
Subject: [meta-oe][scarthgap] gphoto2: Fix contains reference to TMPDIR [buildpaths] warning
Date: Fri, 17 Jan 2025 12:39:58 +0900
Message-Id: <20250117033958.1309072-1-hieu2.nguyen@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 03:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114917

From: Hieu Van Nguyen <hieu2.nguyen@lge.com>

Remove ${RECIPE_SYSROOT} path from ${B}/config.h to fix the QA warning:
WARNING: gphoto2-2.5.28-r0 do_package_qa: QA Issue: File /usr/bin/gphoto2 in package gphoto2 contains reference to TMPDIR [buildpaths]

Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
---
 meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
index 513845194d..1dc2a1fc34 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
@@ -19,3 +19,6 @@ EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
                  --without-cdk \
 "
 
+do_configure:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${B}/config.h
+}
-- 
2.34.1


