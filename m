Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FF1C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 04:59:40 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.5549.1634619579169135162
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: qi.chen@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19J4xbh5010992
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:59:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19J4xO8S012441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:59:37 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Oct 2021 21:59:23 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 18 Oct 2021 21:59:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs: upgrade to
 2021.8.22
Date: Mon, 18 Oct 2021 21:59:23 -0700
Message-ID: <20211019045923.51357-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 04:59:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93456

This upgrade revolves a bunch of CVEs. See more details in:
https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp.

These CVEs cannot be reolved one by one. Upgrading the package
is the only reasonable way.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-ntfsprogs_2017.3.23.bb => ntfs-3g-ntfsprogs_2021.8.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2017.3.23.bb => ntfs-3g-ntfsprogs_2021.8.22.bb} (92%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
similarity index 92%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
index 6f5cb6cee..19b2d6ca2 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[md5sum] = "d97474ae1954f772c6d2fa386a6f462c"
-SRC_URI[sha256sum] = "3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5"
+SRC_URI[md5sum] = "90da343e78877d388eb34cefae6799ae"
+SRC_URI[sha256sum] = "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb"
 
 UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
 UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.33.0


