Received: from compulab.co.il ([67.18.134.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NGDVY-0008RU-1s
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Dec 2009 16:22:19 +0100
Received: from [62.90.235.247] (helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NGDTy-00034k-Fb
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Dec 2009 09:20:38 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 2D66B9A0359
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2009 17:20:33 +0200 (IST)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4phbPvWN5cda; Thu,  3 Dec 2009 17:20:31 +0200 (IST)
Received: from droid.compulab.local (droid.compulab.local [10.1.1.77])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id DAE249A034C;
	Thu,  3 Dec 2009 17:20:31 +0200 (IST)
Received: from droid.compulab.local (localhost [127.0.0.1])
	by droid.compulab.local (8.14.0/8.14.0) with ESMTP id nB3FGHWK006622;
	Thu, 3 Dec 2009 17:16:17 +0200
Received: (from mike@localhost)
	by droid.compulab.local (8.14.0/8.14.0/Submit) id nB3FGG6r006621;
	Thu, 3 Dec 2009 17:16:16 +0200
X-Authentication-Warning: droid.compulab.local: mike set sender to
	mike@compulab.co.il using -f
From: Mike Rapoport <mike@compulab.co.il>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Dec 2009 17:16:15 +0200
Message-Id: <1259853375-6588-1-git-send-email-mike@compulab.co.il>
X-Mailer: git-send-email 1.6.4.4
X-ACL-Warn: {
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - compulab.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 67.18.134.219
X-SA-Exim-Mail-From: mike@compulab.co.il
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] task-beagleboard-demo: add e-wm-menu
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
X-List-Received-Date: Thu, 03 Dec 2009 15:22:19 -0000

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 recipes/tasks/task-beagleboard-demo.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/tasks/task-beagleboard-demo.bb b/recipes/tasks/task-beagleboard-demo.bb
index ca26baa..f9867af 100644
--- a/recipes/tasks/task-beagleboard-demo.bb
+++ b/recipes/tasks/task-beagleboard-demo.bb
@@ -5,6 +5,7 @@ PR = "r15"
 inherit task 
 
 ECONFIG ?= "places e-wm-config-angstrom e-wm-config-angstrom-touchscreen e-wm-config-angstrom-widescreen e-wm-config-default"
+EMENU ?= "e-wm-menu"
 
 RDEPENDS_${PN} = "\
     task-proper-tools \
@@ -15,7 +16,7 @@ RDEPENDS_${PN} = "\
     angstrom-zeroconf-audio \
     angstrom-led-config \ 
     gpe-scap \
-    mime-support e-wm ${ECONFIG} \
+    mime-support e-wm ${ECONFIG} ${EMENU} \
     xterm xmms \
     firefox midori \
     gecko-mediaplayer-firefox-hack \
-- 
1.6.4.4



