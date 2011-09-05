Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R0MlX-0003Gu-0t
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 02:10:19 +0200
Received: by bkbzu17 with SMTP id zu17so3838609bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2011 17:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5iXMqvRhDQLFIL4RctNtjGtPcttUuc+NocODL+JydSo=;
	b=lyqvTlVl+Nss6kszuA3mXpxp+HN+CAOt7ZECODP9GRADYEZ3Z4v69zPac2crCo+W1r
	/mG8FaJFPgz2IiVZrrILLkafJAZc81zTuX1WYrgbfC+aOqaIewxP3ClFOZ09Cn0iFbCf
	zpS63il6M6qWnUL4ESN26NxEzkYH6KVoHdJRg=
Received: by 10.204.13.81 with SMTP id b17mr1794441bka.278.1315181118775;
	Sun, 04 Sep 2011 17:05:18 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id j1sm2734275bks.3.2011.09.04.17.05.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Sep 2011 17:05:17 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Sep 2011 04:05:07 +0400
Message-Id: <1315181107-26857-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] nandlogical: corect oobblock/writesize patch
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
X-List-Received-Date: Mon, 05 Sep 2011 00:10:19 -0000

Somehow the oobblock-to-writesize.patch patch got damaged. Correct it.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../nandlogical/oobblock-to-writesize.patch        |   74 +++++++++++++-------
 1 files changed, 48 insertions(+), 26 deletions(-)

diff --git a/recipes-bsp/zaurus-utils/nandlogical/oobblock-to-writesize.patch b/recipes-bsp/zaurus-utils/nandlogical/oobblock-to-writesize.patch
index 23d011e..2d5aba8 100644
--- a/recipes-bsp/zaurus-utils/nandlogical/oobblock-to-writesize.patch
+++ b/recipes-bsp/zaurus-utils/nandlogical/oobblock-to-writesize.patch
@@ -6,29 +6,51 @@ Fix build against 2.6.24 kernel.
 Signed off by Stanislav Brabec <utx@penguin.cz>
 Signed off by Andrea Adami <andrea.adami@gmail.com>
 
---- a/nandlogical.c	2006-06-09 17:06:48.000000000 +0200
-+++ b/nandlogical.c	2011-08-05 11:17:28.000000000 +0200
-138c138
-< 	//ret = nand_read_raw(nand, oobuf, offset, nand->oobblock, nand->oobsize);
----
-> 	//ret = nand_read_raw(nand, oobuf, offset, nand->writesize, nand->oobsize);
-279,281c279,281
-< 	if (!(meminfo.oobsize == 64 && meminfo.oobblock == 2048) &&
-< 	    !(meminfo.oobsize == 16 && meminfo.oobblock == 512) &&
-< 	    !(meminfo.oobsize == 8 && meminfo.oobblock == 256)) {
----
-> 	if (!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
-> 	    !(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
-> 	    !(meminfo.oobsize == 8 && meminfo.writesize == 256)) {
-287c287
-< 	//printf("erasesize %x\noobblock %x\noobsize %x\nsize %x\n", meminfo.erasesize, meminfo.oobblock, meminfo.oobsize, meminfo.size);
----
-> 	//printf("erasesize %x\nwritesize %x\noobsize %x\nsize %x\n", meminfo.erasesize, meminfo.writesize, meminfo.oobsize, meminfo.size);
-292c292
-< 	oobbuf = (char *)malloc(meminfo.oobblock);
----
-> 	oobbuf = (char *)malloc(meminfo.writesize);
-300c300
-< 	bs = meminfo.oobblock;
----
-> 	bs = meminfo.writesize;
+Index: survive-1.1.0/nandlogical.c
+===================================================================
+--- survive-1.1.0.orig/nandlogical.c	2006-06-09 19:06:48.000000000 +0400
++++ survive-1.1.0/nandlogical.c	2011-09-05 04:00:37.000000000 +0400
+@@ -135,7 +135,7 @@
+ 	oob.start = offset;
+ 	ret = ioctl(fd, MEMREADOOB, &oob);
+ 
+-	//ret = nand_read_raw(nand, oobuf, offset, nand->oobblock, nand->oobsize);
++	//ret = nand_read_raw(nand, oobuf, offset, nand->writesize, nand->oobsize);
+ 	if (!ret) {
+     	    int log_no = nand_get_logical_no(oobbuf);
+ 	    if (((int)log_no >= 0) && (log_no < blocks)) {
+@@ -276,20 +276,20 @@
+ 	}
+ 
+ 	/* Make sure device page sizes are valid */
+-	if (!(meminfo.oobsize == 64 && meminfo.oobblock == 2048) &&
+-	    !(meminfo.oobsize == 16 && meminfo.oobblock == 512) &&
+-	    !(meminfo.oobsize == 8 && meminfo.oobblock == 256)) {
++	if (!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
++	    !(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
++	    !(meminfo.oobsize == 8 && meminfo.writesize == 256)) {
+ 	    fprintf(stderr, "Unknown flash (not normal NAND)\n");
+ 	    close(fd);
+ 	    exit(1);
+ 	}
+ 
+-	//printf("erasesize %x\noobblock %x\noobsize %x\nsize %x\n", meminfo.erasesize, meminfo.oobblock, meminfo.oobsize, meminfo.size);
++	//printf("erasesize %x\nwritesize %x\noobsize %x\nsize %x\n", meminfo.erasesize, meminfo.writesize, meminfo.oobsize, meminfo.size);
+ 	
+ 	blocks = NAND_LOGICAL_SIZE / meminfo.erasesize;
+ 	log2phy = (unsigned long *) malloc(blocks * sizeof(unsigned long));
+ 	readbuf = (char *)malloc(meminfo.erasesize);
+-	oobbuf = (char *)malloc(meminfo.oobblock);	
++	oobbuf = (char *)malloc(meminfo.writesize);
+ 	oob.ptr = oobbuf;
+ 
+ 	scan_logical(blocks, meminfo.erasesize);
+@@ -297,7 +297,7 @@
+ 	//printf("Start: %x\nEnd: %x\n", start_addr, length);
+ 	
+ 	end_addr = start_addr + length;
+-	bs = meminfo.oobblock;
++	bs = meminfo.writesize;
+ 
+ 	for (ofs = start_addr; ofs < end_addr ; ofs+=bs) {
+ 	    int new_logical_added = 0;
-- 
1.7.2.5



