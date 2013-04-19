Received: from mail-ye0-f171.google.com ([209.85.213.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UTGhs-0001In-Bq
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 21:10:55 +0200
Received: by mail-ye0-f171.google.com with SMTP id r10so668361yen.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=PL1l+rlf9G2OpE/HZX9GaV6cwXsF6+Eo+yqFfXXfIC4=;
	b=yGaAcArbTALj6j5pNZ0EfZbv8hHQyKemMEeySAuuuwa8JKrTUmquJFow+0jxUMBwco
	1+ohAVFKs5BY7i4S3DKc51anKKAP7qpZq28TtiLArM2c7qfxR7eU0hXyljOy6FSg+OGT
	QgQzknY15272rcIGAkOumM66eCUN7W/GkPvpgLw1YV4KtOpHQDX/HY9ThXyGWbIpNWj5
	L1XAE2v5KnL+goVGd89pF7yPk5FzSz8AUxKAHOm/7e+i+i6LClc3HDKQVene4yT+dPNP
	01Yt7xUAIzWBvxtD8YAXuUgj+Q9hfScjoTLPs+oX5kAosEWkkbzRAHpeitlMB/Rs22ul
	qBcg==
X-Received: by 10.236.142.207 with SMTP id i55mr11878356yhj.99.1366397592085; 
	Fri, 19 Apr 2013 11:53:12 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id e63sm26333734yhg.27.2013.04.19.11.53.09
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 11:53:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Apr 2013 15:52:49 -0300
Message-Id: <1366397569-8464-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH] p910nd: Fix the lock directory use
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
X-List-Received-Date: Fri, 19 Apr 2013 19:11:03 -0000

The original code uses a subdir inside of /var/lock which is hard for
us to manage as it may be running in tmpfs; we did change it for avoid
the subdir so it just works.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../p910nd/p910nd/fix-var-lock.patch               | 30 ++++++++++++++++++++++
 meta-oe/recipes-support/p910nd/p910nd_0.95.bb      |  5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/p910nd/p910nd/fix-var-lock.patch

diff --git a/meta-oe/recipes-support/p910nd/p910nd/fix-var-lock.patch b/meta-oe/recipes-support/p910nd/p910nd/fix-var-lock.patch
new file mode 100644
index 0000000..aa84e18
--- /dev/null
+++ b/meta-oe/recipes-support/p910nd/p910nd/fix-var-lock.patch
@@ -0,0 +1,30 @@
+Use /var/lock instead of /var/lock/subsys
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: p910nd/p910nd.8
+===================================================================
+--- p910nd.orig/p910nd.8	2011-11-14 22:41:41.904615879 +0100
++++ p910nd/p910nd.8	2011-11-14 22:49:52.299047607 +0100
+@@ -83,7 +83,7 @@
+ .SH "SEE ALSO"
+ printcap(5), hosts_access(5)
+ .SH FILES
+-/var/run/p9100d.pid, /var/lock/subsys/p9100d, /etc/hosts.allow, /etc/hosts.deny
++/var/run/p9100d.pid, /var/lock/p9100d, /etc/hosts.allow, /etc/hosts.deny
+ .SH COPYRIGHT
+ .I p910nd
+ is under the GNU Public License Version 2
+Index: p910nd/p910nd.c
+===================================================================
+--- p910nd.orig/p910nd.c	2011-11-14 22:47:41.986401420 +0100
++++ p910nd/p910nd.c	2011-11-14 22:49:27.274923524 +0100
+@@ -122,7 +122,7 @@
+ #ifdef		LOCKFILE_DIR
+ #define		LOCKFILE	LOCKFILE_DIR "/p910%cd"
+ #else
+-#define		LOCKFILE	"/var/lock/subsys/p910%cd"
++#define		LOCKFILE	"/var/lock/p910%cd"
+ #endif
+ #ifndef		PRINTERFILE
+ #define         PRINTERFILE     "/dev/lp%c"
diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
index 6880e1c..5ebbb29 100644
--- a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
@@ -4,9 +4,10 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2 \
+           file://fix-var-lock.patch"
 
 SRC_URI[md5sum] = "c7ac6afdf7730ac8387a8e87198d4491"
 SRC_URI[sha256sum] = "7d78642c86dc247fbdef1ff85c56629dcdc6b2a457c786420299e284fffcb029"
-- 
1.8.1



