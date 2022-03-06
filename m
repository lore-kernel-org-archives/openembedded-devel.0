Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785F9C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 14:34:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.15366.1646577274650894073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 06:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.201, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 008DE1BF207;
	Sun,  6 Mar 2022 14:34:31 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][dunfell][PATCH] postgresql: Update to 12.10
Date: Sun,  6 Mar 2022 06:34:01 -0800
Message-Id: <20220306143401.3170227-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 14:34:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95816

This is a bugfix only release. Full release notes are available at:
https://www.postgresql.org/docs/release/12.10/

LIC_FILES_CHKSUM changed for updated copyright years.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../postgresql/{postgresql_12.9.bb => postgresql_12.10.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.9.bb => postgresql_12.10.bb} (51%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.10.bb
similarity index 51%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.10.bb
index b4c23ced2..bb409a151 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.10.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=255f15687738db8068fbe9b938c90217"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=75af6e3eeec4a06cdd2e578673236fc3"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -8,4 +8,4 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[sha256sum] = "89fda2de33ed04a98548e43f3ee5f15b882be17505d631fe0dd1a540a2b56dce"
+SRC_URI[sha256sum] = "83dd192e6034951192b9a86dc19cf3717a8b82120e2f11a0a36723c820d2b257"
-- 
2.34.1


