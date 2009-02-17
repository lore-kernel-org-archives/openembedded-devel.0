Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LZS2d-00010J-Pp
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Feb 2009 16:39:23 +0100
Received: from localhost.localdomain (unknown [192.168.1.116])
	by mail.altell.local (Postfix) with ESMTP id 70AF56819B;
	Tue, 17 Feb 2009 18:36:27 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2009 18:36:27 +0300
Message-Id: <1234884987-18223-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.1.3
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH] busybox-1.13.2: fix parallel build failing on appletlib
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
X-List-Received-Date: Tue, 17 Feb 2009 15:39:24 -0000

libbb/appletlib.o depends on generated headers, build can fail with

libbb/appletlib.c:53:27: error: applet_tables.h: No such file or directory

if that dependency is not taken into account
---
 .../busybox-appletlib-dependency.patch             |   11 +++++++++++
 packages/busybox/busybox_1.13.2.bb                 |    3 ++-
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 packages/busybox/busybox-1.13.2/busybox-appletlib-dependency.patch

diff --git a/packages/busybox/busybox-1.13.2/busybox-appletlib-dependency.patch b/packages/busybox/busybox-1.13.2/busybox-appletlib-dependency.patch
new file mode 100644
index 0000000..85a61e8
--- /dev/null
+++ b/packages/busybox/busybox-1.13.2/busybox-appletlib-dependency.patch
@@ -0,0 +1,11 @@
+--- a/libbb/Kbuild	2008-11-09 20:28:09.000000000 +0300
++++ b/libbb/Kbuild	2009-02-17 17:41:48.718747865 +0300
+@@ -147,3 +147,8 @@ lib-$(CONFIG_PGREP) += xregcomp.o
+ lib-$(CONFIG_PKILL) += xregcomp.o
+ lib-$(CONFIG_DEVFSD) += xregcomp.o
+ lib-$(CONFIG_FEATURE_FIND_REGEX) += xregcomp.o
++
++libbb/appletlib.o: include/usage_compressed.h include/applet_tables.h
++
++include/usage_compressed.h include/applet_tables.h:
++        $(Q)$(MAKE) $(build)=applets $@
diff --git a/packages/busybox/busybox_1.13.2.bb b/packages/busybox/busybox_1.13.2.bb
index e8f37a0..cc2cb2b 100644
--- a/packages/busybox/busybox_1.13.2.bb
+++ b/packages/busybox/busybox_1.13.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r15"
+PR = "r16"
 
 SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
@@ -13,6 +13,7 @@ SRC_URI = "\
   file://udhcpc-fix-nfsroot.patch;patch=1 \
   file://B921600.patch;patch=1 \
   file://get_header_tar.patch;patch=1 \
+  file://busybox-appletlib-dependency.patch;patch=1 \
   file://find-touchscreen.sh \
   file://busybox-cron \
   file://busybox-httpd \
-- 
1.6.1.3


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



