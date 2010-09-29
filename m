Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0ypD-0004ro-5s
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 17:44:07 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 46B8E491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 17:43:55 +0200 (CEST)
Received: from localhost.localdomain ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 29 Sep 2010 17:43:55 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 17:43:03 +0200
Message-Id: <1285774983-31373-1-git-send-email-t.fromm@dresearch.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285765693.4578.14.camel@mattotaupa>
References: <1285765693.4578.14.camel@mattotaupa>
X-OriginalArrivalTime: 29 Sep 2010 15:43:55.0080 (UTC)
	FILETIME=[1F83A480:01CB5FED]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] linux-libc-headers (2.6.24): Add falloc.h to kernel exported headers
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
X-List-Received-Date: Wed, 29 Sep 2010 15:44:08 -0000

upstream: OE-only
This adds include/linux/falloc.h to the list of files exported by the kernel 
to the C library. The include file is required for building e.g. a recent 
util-linux-ng against 2.6.24.

Starting from 2.6.25 a similar patch has been accepted upstream (the mainline 
kernel). For 2.6.24, however, falloc.h is not exported although it's present.

Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
---
 .../linux-libc-headers/files/export_falloc_h.patch |   10 ++++++++++
 .../linux-libc-headers_2.6.24.bb                   |    1 +
 2 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux-libc-headers/files/export_falloc_h.patch

diff --git a/recipes/linux-libc-headers/files/export_falloc_h.patch b/recipes/linux-libc-headers/files/export_falloc_h.patch
new file mode 100644
index 0000000..5860e88
--- /dev/null
+++ b/recipes/linux-libc-headers/files/export_falloc_h.patch
@@ -0,0 +1,10 @@
+--- a/include/linux/Kbuild	2010-09-27 16:04:29.000000000 +0200
++++ b/include/linux/Kbuild	2010-09-27 15:59:06.000000000 +0200
+@@ -61,6 +61,7 @@
+ header-y += elf.h
+ header-y += elf-em.h
+ header-y += fadvise.h
++header-y += falloc.h
+ header-y += fd.h
+ header-y += fdreg.h
+ header-y += fib_rules.h
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
index b90c478..6db6fd1 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
@@ -6,6 +6,7 @@ PR = "r5"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
+           file://export_falloc_h.patch \
            file://unifdef.patch"
 
 S = "${WORKDIR}/linux-${PV}"
-- 
1.7.0.4



