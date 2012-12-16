Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIi1-0005nD-AQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1964823eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=T+Rxve6GFinUSbvFQ19cbMQ+kVj2pBCeDJVcHWoC6PQ=;
	b=D24CUWq7CBOGXqyoONZhfVNNBKlaP9QbQCf4PLacKQhoPMs2iYPpCUj/KvWCcPvlMd
	p3SsPrjeYohNuu3/nXG1RZZSA4pQs0RjSbh3WXzPmm1gaM6dmnUouK3gU1AQi8fz8ZMs
	dZhkXBPXFLe+xNKAYd6K0YgwlmEMG1e15dA0hivqGdfIFHu+XBUm9CSbzR4C6UxaKipM
	J/1W0Uhqe+/0drHmHD49twAt3rDmtw2/C2y6L1CSHG1dd1blR7FjRFHnR0p1GgTBM+dc
	dxrR3aNZjaoYF+tnEmjdIBs35d6UOkk6cMN8W5FK6IsxDQ5KjPzT1J7gvxQWyJcJASLq
	GzrQ==
Received: by 10.14.184.131 with SMTP id s3mr33703470eem.38.1355680706356;
	Sun, 16 Dec 2012 09:58:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm23878939eek.0.2012.12.16.09.58.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:54 +0100
Message-Id: <1a1ac8512e7548a5b490471155767dbe99bf7514.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/26] samba: Fix build on Fedora 17
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Ting Liu <b28495@freescale.com>

* Fedora 17 has /bin/perl, this causes samba build to put perl interpreter
  path as /bin/perl But we set perl location for target as /usr/bin/perl

* This mismatch of perl path causes failure of rootfs image creation:
  | error: Failed dependencies:
  | 	/bin/perl is needed by samba-3.6.8-r3.ppce5500

* MJ: fixed whitespaces

Signed-off-by: Ting Liu <b28495@freescale.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc      | 7 ++++---
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index d39a84a..416334a 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -84,11 +84,12 @@ do_install_append() {
 	install -d ${D}/var/log/samba
 	install -d ${D}/var/spool/samba
 
-        # Install other stuff not installed by "make install"
-        install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}${libdir}/libnss_winbind.so.2
-        install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${libdir}/libnss_wins.so.2
+	# Install other stuff not installed by "make install"
+	install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}${libdir}/libnss_winbind.so.2
+	install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${libdir}/libnss_wins.so.2
 
 	rmdir ${D}${base_sbindir}
+	sed -i -e '1s,#!.*perl,#!${USRBINPATH}/env perl,' ${D}${bindir}/findsmb
 }
 
 
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 4750ecb..5722cb6 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.8.0.2



