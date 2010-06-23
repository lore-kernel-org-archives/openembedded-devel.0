Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORF3n-0000Ih-8q
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 03:47:38 +0200
Received: by pvg3 with SMTP id 3so325880pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 18:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=QvtaBlUD2I/omGaIOBt1bA9uVEMkMSBGn2mKMVB2X5U=;
	b=a7Mwz6ASA0z8PF/NAwBBhRlNkm9qiAAONId5jh4L5FDAX8O7aR3PdgI1lBx3mm3QLX
	RmyE7LlBdxqwbAr6MSitBI1k5rT6VhPKimREuAkhBdGzYiodQRmFLjsDkwzC3TXWxvQm
	lSGdux8Fcf3OqOZasw/tXAcYLjYSEyoOg3g/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=A2Hje4ryrMve0vIHCtihzKGjX/vqBQIecj0PKgEuH+WRA6DMaP0YRLchqCJ8tydrqA
	8F3U+VOCMkMX2ez/IfmGmh2ax8D9IIMXADUC1q/FNuUSgkJfTvrrnNcQSU8aM9MxqlpO
	g+hMPrRnglHuMZLgXh75nTQSt/d0jhswAvSSY=
Received: by 10.114.187.40 with SMTP id k40mr6710929waf.30.1277257360402;
	Tue, 22 Jun 2010 18:42:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm50829025wam.21.2010.06.22.18.42.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Jun 2010 18:42:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jun 2010 18:42:34 -0700
Message-Id: <1277257355-29280-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gpm-1.99.7: Add recipe.
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
X-List-Received-Date: Wed, 23 Jun 2010 01:47:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gpm/gpm-1.99.7/init          |   32 ++++++++++++++++++++++++++++++++
 recipes/gpm/gpm-1.99.7/no-docs.patch |   18 ++++++++++++++++++
 recipes/gpm/gpm_1.99.7.bb            |   30 ++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gpm/gpm-1.99.7/init
 create mode 100644 recipes/gpm/gpm-1.99.7/no-docs.patch
 create mode 100644 recipes/gpm/gpm_1.99.7.bb

diff --git a/recipes/gpm/gpm-1.99.7/init b/recipes/gpm/gpm-1.99.7/init
new file mode 100644
index 0000000..f90fce9
--- /dev/null
+++ b/recipes/gpm/gpm-1.99.7/init
@@ -0,0 +1,32 @@
+#! /bin/sh  
+
+# Grab the common functions
+#. /etc/init.d/functions
+
+# FIXME: 
+# Add a configuration file for GPM here
+
+test -x /usr/sbin/gpm || exit 0
+
+case "$1" in
+  start)
+    if [ ! -p /dev/gpmdata ]; then
+    	mkfifo /dev/gpmdata
+    fi
+
+    echo "Starting GPM:" 
+    start-stop-daemon -S -x /usr/sbin/gpm -- -R -m /dev/psaux -t ps2
+    ;;
+  stop)
+    echo "Stopping GPM:" 
+    start-stop-daemon -K -x /usr/sbin/gpm
+    ;;
+  restart|force-reload) 
+    $0 stop
+    $0 start
+    ;;
+  *)
+    usage /etc/init.d/gpm
+esac
+
+exit 0
diff --git a/recipes/gpm/gpm-1.99.7/no-docs.patch b/recipes/gpm/gpm-1.99.7/no-docs.patch
new file mode 100644
index 0000000..f10217a
--- /dev/null
+++ b/recipes/gpm/gpm-1.99.7/no-docs.patch
@@ -0,0 +1,18 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+Index: gpm-1.99.7/Makefile.in
+===================================================================
+--- gpm-1.99.7.orig/Makefile.in	2008-07-24 03:36:35.000000000 -0700
++++ gpm-1.99.7/Makefile.in	2010-06-22 18:28:45.269507001 -0700
+@@ -19,7 +19,7 @@
+ # user-overridable flags, but it's also all the implicit rule looks at.
+ # missing ?
+ 
+-SUBDIRS = src doc contrib gpm2
++SUBDIRS = src
+ 
+ 
+ ### simple, but effective rules
diff --git a/recipes/gpm/gpm_1.99.7.bb b/recipes/gpm/gpm_1.99.7.bb
new file mode 100644
index 0000000..bc24472
--- /dev/null
+++ b/recipes/gpm/gpm_1.99.7.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "GPM (General Purpose Mouse) is a mouse server \
+for the console and xterm, with sample clients included \
+(emacs, etc)."
+SECTION = "console/utils"
+LICENSE = "GPL"
+DEPENDS = "ncurses"
+
+PR = "r0"
+
+SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
+	   file://no-docs.patch \
+	   file://init"
+
+inherit autotools update-rc.d
+
+INITSCRIPT_NAME = "gpm"
+INITSCRIPT_PARAMS = "defaults"
+
+#export LIBS = "-lm"
+
+do_install () {
+	oe_runmake 'ROOT=${D}' install
+	install -m 0644 src/headers/gpm.h ${D}${includedir}
+	install -d ${D}/${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
+	cd ${D}${libdir} && ln -sf libgpm.so.1.19.0 libgpm.so.1
+}
+SRC_URI[md5sum] = "9fdddf5f53cb11d40bb2bb671d3ac544"
+SRC_URI[sha256sum] = "6071378b24494e36ca3ef6377606e7e565040413c86704753a162d2180af32ee"
+
-- 
1.7.1



