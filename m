Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7515C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 21:15:09 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.365.1639689308092727449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 13:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dM6kyt39;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639689308;
  x=1671225308;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Lby1nk1tzV6lpYsKBMW0UogLmcmZ+bo72iRBIIYCLBw=;
  b=dM6kyt39Iif663M26v2LnDwXXbEuk+2saXScRGKktzP9U4R9ht1YRE7F
   lV4ea8lI55ptTNTb8DcOBLB4DRSTB5+HWkIdOzHTKOf96Ne8ZS6G4gPh/
   6iUvRgxhcuSB6jvyMOj9e9MVN3JXE1q/aJELIOcb65hk2USvOgrj1T0Yw
   CtIwHjKSlWSTctx2Jm6mlO3P/JtyPrhxFAHr/hMz6QuNDFU3I4np8zGsH
   3TYzNslbnsGfd5hkCKRn6/1ddfYVGiPH4NyK/+w9njfy/ekcJ5Qo+fBk2
   uE+q66ixlZe50fIY5vGn546+LJiQdD0KWO+AoHKTZDknBl/QYUKZB7E0A
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][honister][PATCH] googletest: Switch branch from
 master to main
Date: Thu, 16 Dec 2021 22:15:03 +0100
Message-ID: <20211216211503.15003-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 21:15:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94409

The master branch has been renamed to main in the github repo.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-test/googletest/googletest_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index 2393f9b42..ff8191eff 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -10,7 +10,7 @@ PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
 SRCREV = "e2239ee6043f73722e7aa812a459f54a28552929"
-SRC_URI = "git://github.com/google/googletest.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
 
 inherit cmake
 

