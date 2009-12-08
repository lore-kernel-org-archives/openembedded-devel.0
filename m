Received: from compulab.co.il ([67.18.134.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NI83n-0003ph-Id
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 22:57:34 +0100
Received: from [62.90.235.247] (helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NI82A-00064g-7u
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 15:55:50 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 4E4DF9A0366
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Dec 2009 23:55:49 +0200 (IST)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3Ma+nn8atXrG; Tue,  8 Dec 2009 23:55:48 +0200 (IST)
Received: from droid.compulab.local (droid.compulab.local [10.1.1.77])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 5F9BC9A034C;
	Tue,  8 Dec 2009 23:55:48 +0200 (IST)
Received: from droid.compulab.local (localhost [127.0.0.1])
	by droid.compulab.local (8.14.0/8.14.0) with ESMTP id nB8Lthj5022585;
	Tue, 8 Dec 2009 23:55:43 +0200
Received: (from mike@localhost)
	by droid.compulab.local (8.14.0/8.14.0/Submit) id nB8LBJ1x022425;
	Tue, 8 Dec 2009 23:11:19 +0200
X-Authentication-Warning: droid.compulab.local: mike set sender to
	mike@compulab.co.il using -f
From: Mike Rapoport <mike@compulab.co.il>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Dec 2009 23:11:13 +0200
Message-Id: <4e6f8f6a5fc70000e8ef1757d9ecf507c49a68bc.1260305960.git.mike@compulab.co.il>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <cover.1260305960.git.mike@compulab.co.il>
References: <cover.1260305960.git.mike@compulab.co.il>
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
Subject: [PATCH 4/5] angstrom-led-config: Add LED setup for the cm-t35 and bump PR.
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
X-List-Received-Date: Tue, 08 Dec 2009 21:57:34 -0000

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 recipes/angstrom/angstrom-led-config.bb          |    2 +-
 recipes/angstrom/angstrom-led-config/cm-t35/leds |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 recipes/angstrom/angstrom-led-config/cm-t35/leds

diff --git a/recipes/angstrom/angstrom-led-config.bb b/recipes/angstrom/angstrom-led-config.bb
index 2dbfd01..a0373ed 100644
--- a/recipes/angstrom/angstrom-led-config.bb
+++ b/recipes/angstrom/angstrom-led-config.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Configuration files for runtime LED configuration" 
 
 #PV = "${DISTRO_VERSION}"
-PR = "r6"
+PR = "r7"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit update-rc.d
diff --git a/recipes/angstrom/angstrom-led-config/cm-t35/leds b/recipes/angstrom/angstrom-led-config/cm-t35/leds
new file mode 100644
index 0000000..4d24396
--- /dev/null
+++ b/recipes/angstrom/angstrom-led-config/cm-t35/leds
@@ -0,0 +1,2 @@
+#file format: name trigger
+cm-t35:green heartbeat
-- 
1.6.4.4



