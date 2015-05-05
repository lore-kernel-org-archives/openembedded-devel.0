Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9416C73C7D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 15:12:49 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so196291911pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=7GI537CuTCm4xOGr9w41Qq5wyW/vhs4zYPcoCioHVhc=;
	b=M3E896JqIMoOQ/ASJ2ifg7zZ3oNID7wengrb3WHN+gTZWi3A+7rOoXHw26ZCG08lfG
	MTcDlmakQCZwSQY1cG8tpW8lacq6JW2+RCz2Y7QVqjZSR9tt0dzKYVae47KLvNkRL9Bl
	Po1BbQKn6U9zGQlwlWHCfMmn+cay4GCEhXxTGf+WHYlf4k/6LPBw1L4mDeMIhghE7RSf
	x/LB/foijZHmmgrVE1BTgNMgq69cvYkEghnQUDNjHnvRdhPDemTFqZMmX8AneJ6II9Tx
	EQ7KcI6WMANU63glqE7RxBVNx98kXXpziQUmSpx8LjTSixvmRmKdzMhgK3TJxsIIFKNV
	vTlg==
X-Received: by 10.70.56.98 with SMTP id z2mr51849219pdp.120.1430838750567;
	Tue, 05 May 2015 08:12:30 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	da2sm16154020pbb.57.2015.05.05.08.12.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 08:12:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 08:12:23 -0700
Message-Id: <1430838743-21460-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] udisks: Fix QA warnings
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
X-List-Received-Date: Tue, 05 May 2015 15:12:49 -0000

WARNING: QA Issue: udisks rdepends on lvm2, but it isn't a build dependency? [build-deps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index e306e89..7db3ce1 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -37,3 +37,5 @@ RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "udisks-daemon.service"
 SYSTEMD_AUTO_ENABLE = "disable"
+
+RDEPENDS_${PN} = " lvm2"
-- 
2.3.5


