Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PEA1H-0001em-Hs
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 01:19:04 +0100
Received: by pvc7 with SMTP id 7so768371pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 17:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ze8E7wygoINDYLkYxqmKuIQ5gZBPveBP8zsIjmsIr60=;
	b=Xk+5DC5BdNqz4tykvmvV9uLVnGnWt2NNsqTZ9b9CydogrWMRPiKlGKmOR1gJIdbaTT
	o9zihFfkcQKtoQL3WNoYbhE9KICKb1ZGNVVOZmN268UNV8/EgNPg7/5XU+XVxYBqKZek
	i07lqeNIJ5PraH9TVkvTAd9J2zz5HPwqFURk0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eTWPNQbDjVYbK5HaTWdvApWA2EwA7RUvki9cUKztstXp/aVqBegKl910pwi2DWa34E
	TqAWslZJqw4YgRkxxqf5pqmTW68jz8C1opOG9qNmLfDfGfaJ8mE88SLtut8fBo0LxjsJ
	vXsvANKtT1xthdEI98HWLgRUxBYtc/jm9mQ9U=
Received: by 10.142.48.14 with SMTP id v14mr1145776wfv.359.1288916287246;
	Thu, 04 Nov 2010 17:18:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w14sm713479wfd.6.2010.11.04.17.18.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 17:18:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Nov 2010 17:17:50 -0700
Message-Id: <1288916270-21459-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] task-arago-toolchain: Exclude from World build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Nov 2010 00:19:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/tasks/task-arago-toolchain-dvsdk-target.bb |    1 +
 recipes/tasks/task-arago-toolchain-gst-target.bb   |    1 +
 recipes/tasks/task-arago-toolchain-target.bb       |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/tasks/task-arago-toolchain-dvsdk-target.bb b/recipes/tasks/task-arago-toolchain-dvsdk-target.bb
index c143255..a8d3884 100644
--- a/recipes/tasks/task-arago-toolchain-dvsdk-target.bb
+++ b/recipes/tasks/task-arago-toolchain-dvsdk-target.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Target packages for a standalone Arago SDK or external toolchain"
 ALLOW_EMPTY = "1"
 PR = "r18"
+EXCLUDE_FROM_WORLD = "1"
 
 PACKAGES = "${PN}"
 
diff --git a/recipes/tasks/task-arago-toolchain-gst-target.bb b/recipes/tasks/task-arago-toolchain-gst-target.bb
index 3c6c2b9..ced1708 100644
--- a/recipes/tasks/task-arago-toolchain-gst-target.bb
+++ b/recipes/tasks/task-arago-toolchain-gst-target.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Target packages for a standalone Arago SDK or external toolchain"
 ALLOW_EMPTY = "1"
 PR = "r24"
+EXCLUDE_FROM_WORLD = "1"
 
 PACKAGES = "${PN}"
 
diff --git a/recipes/tasks/task-arago-toolchain-target.bb b/recipes/tasks/task-arago-toolchain-target.bb
index 496910e..8fb5182 100644
--- a/recipes/tasks/task-arago-toolchain-target.bb
+++ b/recipes/tasks/task-arago-toolchain-target.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Target packages for a standalone Arago SDK or external toolchain"
 ALLOW_EMPTY = "1"
 PR = "r3"
+EXCLUDE_FROM_WORLD = "1"
 
 PACKAGES = "${PN}"
 
-- 
1.7.1



