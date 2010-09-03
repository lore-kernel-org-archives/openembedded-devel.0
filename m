Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OrX1i-0004ZO-QS
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 16:14:10 +0200
Received: by mail-bw0-f47.google.com with SMTP id 12so1769485bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=C1d36OnVBojgFoVwI/6oE1EoBf8I0m5cP0qk12CFGnQ=;
	b=x/C4fmMUygEI6aU2wTPIIJXNbqcD7w5awYlK+X+TAdN2n6t3FHg2TnJYRI6QfLxZU8
	fqxeejTXeIGhgMlnlIknu0xQjSRCA0308YOsHL+y5GEiOpn4WQmvZv357kFkQR6i1ZNp
	OAA2tOhaebkPqVQZeou1DGLFT0oeNUJ7NR0/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=glsPxViecA/WTqMnZpduskJWGiTEDNjBBT0JhrC6AXWzOqySsMOHePogRE91rQZ/dL
	qXmpxAMUGqe00uLzPwjLWcDjPlgEuwdgwtwjNeyZknjVe8B3IhQcE7ZvHwetph09hxVj
	Yvci4UcUUauozzYEBlgLQDvaRmD55aroLjf9c=
Received: by 10.204.141.16 with SMTP id k16mr528158bku.177.1283523202351;
	Fri, 03 Sep 2010 07:13:22 -0700 (PDT)
Received: from localhost.localdomain (85-127-150-21.dynamic.xdsl-line.inode.at
	[85.127.150.21])
	by mx.google.com with ESMTPS id 11sm1500207bkj.23.2010.09.03.07.13.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Sep 2010 07:13:21 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Sep 2010 16:14:45 +0200
Message-Id: <1283523286-30999-2-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
References: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] x-load/igep0020.conf: Unbreak x-load for igep0020 machine.
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
X-List-Received-Date: Fri, 03 Sep 2010 14:14:20 -0000

* x-load is needed since e2b9225af36b2979b255634f79ceecea482601a7

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 conf/machine/igep0020.conf                         |    2 ++
 .../x-load-git/igep0020/remove-final-ldflags.patch |   11 +++++++++++
 recipes/x-load/x-load_git.bb                       |    7 ++++++-
 3 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 recipes/x-load/x-load-git/igep0020/remove-final-ldflags.patch

diff --git a/conf/machine/igep0020.conf b/conf/machine/igep0020.conf
index 55c1850..6295010 100644
--- a/conf/machine/igep0020.conf
+++ b/conf/machine/igep0020.conf
@@ -21,6 +21,8 @@ KERNEL_IMAGETYPE = "uImage"
 
 UBOOT_MACHINE = "omap3_igep0020b_config"
 
+XLOAD_MACHINE = "igep0020-flash_config"
+
 IMAGE_FSTYPES += "tar.bz2 ubi"
 
 # Guesswork
diff --git a/recipes/x-load/x-load-git/igep0020/remove-final-ldflags.patch b/recipes/x-load/x-load-git/igep0020/remove-final-ldflags.patch
new file mode 100644
index 0000000..c5ac09b
--- /dev/null
+++ b/recipes/x-load/x-load-git/igep0020/remove-final-ldflags.patch
@@ -0,0 +1,11 @@
+--- a/Makefile	2010-09-03 09:59:12.000000000 +0200
++++ b/Makefile	2010-09-03 10:43:46.650000018 +0200
+@@ -90,7 +90,7 @@
+  
+ x-load:	$(OBJS) $(LIBS) $(LDSCRIPT)
+ 		UNDEF_SYM=`$(OBJDUMP) -x $(LIBS) |sed  -n -e 's/.*\(__u_boot_cmd_.*\)/-u\1/p'|sort|uniq`;\
+- 		$(LD) $(LDFLAGS) $$UNDEF_SYM $(OBJS) \
++ 		$(LD) $$UNDEF_SYM $(OBJS) \
+ 			--start-group $(LIBS) --end-group $(PLATFORM_LIBS) \
+ 			-Map x-load.map -o x-load
+  
diff --git a/recipes/x-load/x-load_git.bb b/recipes/x-load/x-load_git.bb
index cbcbf17..eb4a2de 100644
--- a/recipes/x-load/x-load_git.bb
+++ b/recipes/x-load/x-load_git.bb
@@ -9,7 +9,7 @@ SRCREV_beagleboard = "1c9276af4d6a5b7014a7630a1abeddf3b3177563"
 
 PV = "1.42+${PR}+gitr${SRCREV}"
 PV_beagleboard = "1.44+${PR}+gitr${SRCREV}"
-PR ="r15"
+PR ="r16"
 PE = "1"
 
 SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master;protocol=git"
@@ -56,6 +56,11 @@ SRCREV_omapzoom36x = "251d92815500143aefdbe3b3558a0ce6daeaebdc"
 SRC_URI[uboot.md5sum] = "e68b30714d22ce2f926d2dd19f94a2be"
 SRC_URI[uboot.sha256sum] = "e7e5c87d939cc4c1f14d17ea0814b0bed97021c7afca3ef9053c896c2b5bdd6f"
 
+SRC_URI_igep0020 = "git://git.igep.es/pub/scm/x-loader.git;protocol=git \
+                    file://remove-final-ldflags.patch"
+SRCREV_igep0020 = "213d95fcadc54424c796259928d7c15c5a2945a0"
+PV_igep0020 = "1.43+${PR}+gitr${SRCREV}"
+
 S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.1



