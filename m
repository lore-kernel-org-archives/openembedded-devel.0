Return-Path: <hieu2.nguyen@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D52EC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 04:46:56 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.4389.1737089210895757587
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 20:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: hieu2.nguyen@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 17 Jan 2025 13:46:48 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: hieu2.nguyen@lge.com
Received: from unknown (HELO hieu2-nguyen-worker-2204.bee-live.svc.cluster.local) (10.185.60.37)
	by 156.147.1.126 with ESMTP; 17 Jan 2025 13:46:47 +0900
X-Original-SENDERIP: 10.185.60.37
X-Original-MAILFROM: hieu2.nguyen@lge.com
From: hieu2.nguyen@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	Hieu Van Nguyen <hieu2.nguyen@lge.com>
Subject: [meta-oe][styhead] gphoto2: Fix /usr/bin/gphoto2 runtime error
Date: Fri, 17 Jan 2025 13:46:45 +0900
Message-Id: <20250117044645.2535390-1-hieu2.nguyen@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 04:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114918

From: Hieu Van Nguyen <hieu2.nguyen@lge.com>

After fixing the TMPDIR [buildpaths] warning, a segmentation fault while
running gphoto2 command.

It seems 'sed' is primarily designed for text processing. When running
'sed' on a binary, it may overwrite or corrupt critical parts of the
binary.
> root@qemux86-64:~# gphoto2 -v
> Segmentation fault

Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
---
 meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
index aba590aa02..1dc2a1fc34 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
@@ -19,8 +19,6 @@ EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
                  --without-cdk \
 "
 
-INSANE_SKIP:${PN} = "already-stripped"
-
-do_install:append() {
-	sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${bindir}/gphoto2
+do_configure:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${B}/config.h
 }
-- 
2.34.1


