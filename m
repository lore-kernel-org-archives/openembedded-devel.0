Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyehH-00080k-UK
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 09:59:23 +0200
Received: by eekb57 with SMTP id b57so1125055eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 00:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=0mX+/wHflPdoPFyhCUY8mKtZNHBn6Dt/H8btGJCj1LM=;
	b=CuNc6f9yDQ3Q6YzRmWgqryNDYG1+CRm+xVIPcYNRbxtdHxpkcU4W3LZrTj2XeqGtL0
	Fdtb7qUDHVlFOihaQjDQMD7dZWWRMEKKeaCHivhOZRfFVxGtlNHIDO3u6iCqJI+zcSKL
	DKHHcqWGDAdWSaQuOkG5Cy/H9x/1AzEYkXUUGUCS2aJu9nupUcAIIE9hhRE9o7TMFAv8
	ZxqPbUCavj1jbj/M3nSRsMdRG5T9ZFOXgssUTBzTmRp9/ulwRDOzVBro2WHlRZ/yiK9/
	gsrNN9NH1Lqf8cfGHrtRVnV9zTvvRxupgqycqmGizh83x3WGbV1XDvl6VwHSqI8rcwUM
	5iuw==
Received: by 10.14.215.197 with SMTP id e45mr16433227eep.36.1344325658551;
	Tue, 07 Aug 2012 00:47:38 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id g46sm53450022eep.15.2012.08.07.00.47.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 00:47:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 09:47:29 +0200
Message-Id: <1344325650-21076-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkbFx9s/XpAprHVTUgvp97CjW+qD37RpPSbLtzl4GVIJr2MA5oG86IyaaLebMU1riDncaAD
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/2] orc: update to 0.4.16
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
X-List-Received-Date: Tue, 07 Aug 2012 07:59:24 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/orc/orc_0.4.14.bb |    6 ------
 meta-oe/recipes-devtools/orc/orc_0.4.16.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/orc/orc_0.4.14.bb
 create mode 100644 meta-oe/recipes-devtools/orc/orc_0.4.16.bb

diff --git a/meta-oe/recipes-devtools/orc/orc_0.4.14.bb b/meta-oe/recipes-devtools/orc/orc_0.4.14.bb
deleted file mode 100644
index 639fd4f..0000000
--- a/meta-oe/recipes-devtools/orc/orc_0.4.14.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require orc.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[orc.md5sum] = "6b3ff209e9763ebe40e152538884bd71"
-SRC_URI[orc.sha256sum] = "6b0c536984871954364976516ea0328e2dcd856111726a23e609504ba2b12313"
diff --git a/meta-oe/recipes-devtools/orc/orc_0.4.16.bb b/meta-oe/recipes-devtools/orc/orc_0.4.16.bb
new file mode 100644
index 0000000..bb193ab
--- /dev/null
+++ b/meta-oe/recipes-devtools/orc/orc_0.4.16.bb
@@ -0,0 +1,6 @@
+require orc.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[orc.md5sum] = "e482932e544c847761449b106ecbc483"
+SRC_URI[orc.sha256sum] = "700e4edba20a0ed42164b645da26ce515b883d4c4633b222302f1e541f2a58ab"
-- 
1.7.10



