Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Mq2R7-0002Sf-Oi
	for openembedded-devel@openembedded.org; Tue, 22 Sep 2009 12:17:32 +0200
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Sep 2009 12:16:53 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Sep 2009 12:16:46 +0200
Received: from badebec ([87.1.143.167]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 22 Sep 2009 12:16:44 +0200
Received: by badebec with local (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Mq2QK-0003h9-Ss; Tue, 22 Sep 2009 12:16:40 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@openembedded.org
Date: Tue, 22 Sep 2009 12:16:16 +0200
Message-Id: <1253614576-13938-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.6.4.3
In-Reply-To: <20090920162132.6474fc69.ospite@studenti.unina.it>
References: <20090920162132.6474fc69.ospite@studenti.unina.it>
X-OriginalArrivalTime: 22 Sep 2009 10:16:45.0035 (UTC)
	FILETIME=[C96D7BB0:01CA3B6D]
X-SA-Exim-Connect-IP: 85.33.2.25
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: mickey@vanille-media.de
Subject: [PATCH] Fix the 'count' field in device_tables.
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
X-List-Received-Date: Tue, 22 Sep 2009 10:17:33 -0000

Line up to the new 'count' field semantics in makedevs, it now means "number
of device nodes to create" opposed to the old meaning "number of device nodes
to create as if the 'start' field was 0".

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
Mickey, Adrea,

Here is the changes to device table to keep the current behavior after the
proposed change to makedevs.

I don't know if other softwares use device_tables, is makedevs the only one?

Do you want me to post the whole patchset again for a clearer review and
to ease testing before applying? If so, Mickey you could discard the latest fix
to device_table-ezx.txt I've sent you recently, I'd split the changes relative
to this issue from the other unrelated fixes.

Regards,
   Antonio

 files/device_table-jlime.txt          |    2 +-
 files/device_table-minimal-add-md.txt |    2 +-
 files/device_table-minimal.txt        |    6 +++---
 files/device_table-slugos.txt         |   14 +++++++-------
 files/device_table-unslung.txt        |   12 ++++++------
 files/device_table_add-scsi.txt       |    2 +-
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/files/device_table-jlime.txt b/files/device_table-jlime.txt
index d8fbc8e..314ad62 100644
--- a/files/device_table-jlime.txt
+++ b/files/device_table-jlime.txt
@@ -4,7 +4,7 @@
 /dev/apm_bios	c	660	0	46	10	134	-	-	-
 /dev/fb0	c	600	0	0	29	0	-	-	-
 /dev/hda	b	660	0	6	3	0	-	-	-
-/dev/hda	b	660	0	6	3	1	1	1	20
+/dev/hda	b	660	0	6	3	1	1	1	19
 /dev/kmem	c	640	0	15	1	2	-	-	-
 /dev/mem	c	640	0	15	1	1	-	-	-
 /dev/null	c	666	0	0	1	3	-	-	-
diff --git a/files/device_table-minimal-add-md.txt b/files/device_table-minimal-add-md.txt
index a78ca76..b30fdc3 100644
--- a/files/device_table-minimal-add-md.txt
+++ b/files/device_table-minimal-add-md.txt
@@ -13,7 +13,7 @@
 /dev/apm_bios	c	660	0	46	10	134	-	-	-
 /dev/fb0	c	600	0	0	29	0	-	-	-
 /dev/hda	b	660	0	6	3	0	-	-	-
-/dev/hda	b	660	0	6	3	1	1	1	5
+/dev/hda	b	660	0	6	3	1	1	1	4
 /dev/kmem	c	640	0	15	1	2	-	-	-
 /dev/mem	c	640	0	15	1	1	-	-	-
 /dev/null	c	666	0	0	1	3	-	-	-
diff --git a/files/device_table-minimal.txt b/files/device_table-minimal.txt
index 891feb0..a474377 100644
--- a/files/device_table-minimal.txt
+++ b/files/device_table-minimal.txt
@@ -13,7 +13,7 @@
 /dev/apm_bios	c	660	0	46	10	134	-	-	-
 /dev/fb0	c	600	0	0	29	0	-	-	-
 /dev/hda	b	660	0	6	3	0	-	-	-
-/dev/hda	b	660	0	6	3	1	1	1	20
+/dev/hda	b	660	0	6	3	1	1	1	19
 /dev/kmem	c	640	0	15	1	2	-	-	-
 /dev/mem	c	640	0	15	1	1	-	-	-
 /dev/null	c	666	0	0	1	3	-	-	-
@@ -33,10 +33,10 @@
 /dev/event 	c	660	0	0	13	64	0	1	8
 
 /dev/mmcblk0	b	660	0	6	179	0	-	-	-
-/dev/mmcblk0p	b	660	0	6	179	1	1	1	8
+/dev/mmcblk0p	b	660	0	6	179	1	1	1	7
 
 # for older kernels before 2.6.22
 # mmc numbers are assigned dynamicly so if you have other dynamic assigned block devices it may be wrong
 #
 #/dev/mmcblk0    b       660     0       6       254     0       -       -       -
-#/dev/mmcblk0p   b       660     0       6       254     1       1       1       8
+#/dev/mmcblk0p   b       660     0       6       254     1       1       1       7
diff --git a/files/device_table-slugos.txt b/files/device_table-slugos.txt
index 17e8064..94b3c49 100644
--- a/files/device_table-slugos.txt
+++ b/files/device_table-slugos.txt
@@ -20,19 +20,19 @@
 /dev/ram	b	644	0	0	1	0	0	1	4
 /dev/random	c	644	0	0	1	8	-	-	-
 /dev/sda	b	664	0	0	8	0	-	-	-
-/dev/sda	b	664	0	0	8	1	1	1	10
+/dev/sda	b	664	0	0	8	1	1	1	9
 /dev/sdb	b	664	0	0	8	16	-	-	-
-/dev/sdb	b	664	0	0	8	17	1	1	5
+/dev/sdb	b	664	0	0	8	17	1	1	4
 /dev/sdc	b	664	0	0	8	32	-	-	-
-/dev/sdc	b	664	0	0	8	33	1	1	5
+/dev/sdc	b	664	0	0	8	33	1	1	4
 /dev/sdd        b       664     0       0       8       48      -       -	-
-/dev/sdd        b       664     0       0       8       49      1       1	5
+/dev/sdd	b	664	0	0	8	49	1	1	4
 /dev/sde        b       664     0       0       8       64      -       -	-
-/dev/sde        b       664     0       0       8       65      1       1	5
+/dev/sde	b	664	0	0	8	65	1	1	4
 /dev/sdf        b       664     0       0       8       80      -       -	-
-/dev/sdf        b       664     0       0       8       81      1       1	5
+/dev/sdf	b	664	0	0	8	81	1	1	4
 /dev/sdg        b       664     0       0       8       96      -       -	-
-/dev/sdg        b       664     0       0       8       97      1       1	5
+/dev/sdg	b	664	0	0	8	97	1	1	4
 /dev/tty	c	666	0	0	5	0	-	-	-
 /dev/tty	c	644	0	0	4	0	0	1	10
 /dev/ttyS	c	644	0	0	4	64	0	1	2
diff --git a/files/device_table-unslung.txt b/files/device_table-unslung.txt
index cd5d5f7..64a1dc1 100644
--- a/files/device_table-unslung.txt
+++ b/files/device_table-unslung.txt
@@ -20,7 +20,7 @@
 /dev/mem	c	640	0	0	1	1	-	-	-
 /dev/mtd	c	664	0	0	90	0	0	2	8
 /dev/mtdblock	b	644	0	0	31	0	0	1	8
-/dev/mtdr	c	664	0	0	90	0	1	2	8
+/dev/mtdr	c	664	0	0	90	0	1	2	7
 /dev/null	c	666	0	0	1	3	-	-	-
 /dev/pbuttons	c	664	0	0	60	0	-	-	-
 /dev/ppp	c	644	0	0	108	0	-	-	-
@@ -31,15 +31,15 @@
 /dev/rtc	c	644	0	0	10	135	-	-	-
 /dev/scd	b	664	0	0	11	0	0	1	4
 /dev/sda	b	664	0	0	8	0	-	-	-
-/dev/sda	b	664	0	0	8	1	1	1	16
+/dev/sda	b	664	0	0	8	1	1	1	15
 /dev/sdb	b	664	0	0	8	16	-	-	-
-/dev/sdb	b	664	0	0	8	17	1	1	16
+/dev/sdb	b	664	0	0	8	17	1	1	15
 /dev/sdc	b	664	0	0	8	32	-	-	-
-/dev/sdc	b	664	0	0	8	33	1	1	16
+/dev/sdc	b	664	0	0	8	33	1	1	15
 /dev/sdd	b	664	0	0	8	48	-	-	-
-/dev/sdd	b	664	0	0	8	49	1	1	16
+/dev/sdd	b	664	0	0	8	49	1	1	15
 /dev/sde	b	664	0	0	8	64	-	-	-
-/dev/sde	b	664	0	0	8	65	1	1	16
+/dev/sde	b	664	0	0	8	65	1	1	15
 /dev/st		c	664	0	0	9	0	0	1	4
 /dev/tty	c	666	0	0	5	0	-	-	-
 /dev/tty	c	644	0	0	4	0	0	1	10
diff --git a/files/device_table_add-scsi.txt b/files/device_table_add-scsi.txt
index 74d7725..b672cbb 100644
--- a/files/device_table_add-scsi.txt
+++ b/files/device_table_add-scsi.txt
@@ -1,2 +1,2 @@
 /dev/sda	b	660	0	6	8	0	-	-	-
-/dev/sda	b	660	0	6	8	1	1	1	16
+/dev/sda	b	660	0	6	8	1	1	1	15
-- 
1.6.4.3



