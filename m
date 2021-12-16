Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC82CC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 21:18:19 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.390.1639689498055685958
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 13:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=py2xAwfZ;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639689498;
  x=1671225498;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NMo4FvYbKkcLyoU+jPBs1TNmJVlnI++hym6NJPiSoNg=;
  b=py2xAwfZcd/fL0ALTHD72CYTm1MpAWTOptm3lCwkJb1NcxZsdwshmuhe
   hL6gZZqLEfkQJWKSdlK5BOWitGvTGDZ2WKhZRDsjVtbQlR/WSM+SW+JRT
   ux52i6wTCHLkZV3YS6+aq35weU6ypYbmByKcR2rzbHu4cU7gBcVdzG3L+
   VEl0YpXuBHUv2KKciuSwgj1dh/aMx/ldtLTy7c9A3tsPIecXk8d2iK9P+
   LvwyevMSYgzGQpXb8dS+5xLoyudw8wsEIqSEZH3MpsPyKelXsLjo+QqbB
   FbveXFI9OwrccBYtUbJ+0FUQ/ZD/UdBhts9PACu3ciU7mKFsAidgZYK2B
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][dunfell][hardknott][PATCH] googletest: Switch branch from
 master to main
Date: Thu, 16 Dec 2021 22:18:10 +0100
Message-ID: <20211216211810.16556-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 21:18:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94410

The master branch has been renamed to main in the github repo.

Change-Id: I19e9ea3998cf22508425d87fceb64ae68fbff166
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-test/googletest/googletest_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index 898f23faf..35fe1bed0 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -11,7 +11,7 @@ PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
 SRCREV = "703bd9caab50b139428cea1aaff9974ebee5742e"
-SRC_URI = "git://github.com/google/googletest.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
 
 inherit cmake
 

