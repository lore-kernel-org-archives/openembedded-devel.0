Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web12.42252.1598620049970684431
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 06:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136, mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id 34040C;
	Fri, 28 Aug 2020 15:07:19 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doCf9BDcvCQl; Fri, 28 Aug 2020 15:07:19 +0200 (CEST)
Received: from ymir.suse.de (unknown [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 0FA267;
	Fri, 28 Aug 2020 15:07:19 +0200 (CEST)
From: jubalh@iodoru.org
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [PATCH 1/1] jasper: Use new repo URL
Date: Fri, 28 Aug 2020 15:07:25 +0200
Message-Id: <20200828130726.19916-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.16.4

The official repo is now https://github.com/jasper-software/jasper.
https://github.com/mdadams/jasper will forward there.

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb
index e121ae946..e2bc9645f 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Jpeg 2000 implementation"
-HOMEPAGE = "https://github.com/mdadams/jasper"
+HOMEPAGE = "https://github.com/jasper-software/jasper"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
-SRC_URI = "git://github.com/mdadams/jasper.git;protocol=https"
+SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https"
 SRCREV = "7d8cfd8ac16d1af9b51e5ccd781e898f0fbf57cc"
 
 S = "${WORKDIR}/git"
-- 
2.16.4

