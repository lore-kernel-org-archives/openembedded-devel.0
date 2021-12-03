Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8E9C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 03:21:09 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.7305.1638501668515678154
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 19:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B33L6RG018578
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 2 Dec 2021 19:21:06 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1B33L5mQ008793
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Dec 2021 19:21:06 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 2 Dec 2021 19:21:05 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 2 Dec 2021 19:21:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ostree: workaround compile error with option gcc
 option -Og
Date: Fri, 3 Dec 2021 11:21:04 +0800
Message-ID: <20211203032104.4184784-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 03:21:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94188

While DEBUG_BUILD = "1" in local.conf, `-Og' is added to cfalgs by Yocto,
it broke ostree build with `-Werror=aggregate-return' (the
-Werror=aggregate-return is added by ostree configure.ac)

So remove -Og and use -O2 as workaround

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/ostree/ostree_2021.6.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
index 9e0f7bc7c..d2d5dc0aa 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
@@ -29,6 +29,14 @@ S = "${WORKDIR}/git"
 
 inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconfig ptest-gnome systemd
 
+# Workaround compile failure:
+# |../git/src/libotutil/zbase32.c:37:1: error: function returns an aggregate [-Werror=aggregate-return]
+# so remove -Og and use -O2 as workaround
+DEBUG_OPTIMIZATION:remove = "-Og"
+DEBUG_OPTIMIZATION:append = " -O2"
+BUILD_OPTIMIZATION:remove = "-Og"
+BUILD_OPTIMIZATION:append = " -O2"
+
 # Package configuration - match ostree defaults, but without rofiles-fuse
 # otherwise we introduce a dependendency on meta-filesystems
 PACKAGECONFIG ??= " \
-- 
2.27.0


