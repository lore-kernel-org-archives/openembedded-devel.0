Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Se6oI-0004Jp-D6
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 17:45:43 +0200
Received: by ghbz2 with SMTP id z2so2436320ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=/f0GxrQQ1HNSWTav6sW30udcZsUAfN9Jar9eaMzgSu8=;
	b=p5xYARAaIbK5CeVO3bD+hAMJRKyx2ocBg78KzJYZMI/b+xVSxfxR93mfqX9l7NRNz8
	5YX5SdrqZN1OYCRIHn3UO60REx68kMNctyy15jnaoYFBkVtq6a7uXGiy+Rrpk7TOFqqd
	f3u7z8zH32gOwSRkBQ7qiZ6kutVziqxxUWV9mCzW6h7GmeAECw7BQ+ZCZuSKn1j213Sz
	Hqkl0SOaJ+XmBoQttlGnJoxg1HSBDttlW0Wvjb9ymwnJUP1/b6/e/LKoVP3TRHm2CnY7
	mCgvMX/77PztcPo/fXl45EnXRMzGYF+I6VZr7W1nOHoMe92NTMcdI7cNtuWWlDZdmsbb
	S+HQ==
Received: by 10.236.46.132 with SMTP id r4mr21376771yhb.29.1339428908551;
	Mon, 11 Jun 2012 08:35:08 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id c12sm26056214ann.15.2012.06.11.08.35.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jun 2012 08:35:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jun 2012 12:34:56 -0300
Message-Id: <5c52e769ac49b8f283659530cf3d959c2280db48.1339428767.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1339428767.git.otavio@ossystems.com.br>
References: <cover.1339428767.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1339428767.git.otavio@ossystems.com.br>
References: <cover.1339428767.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/3] owfs: add init script for owfs
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
X-List-Received-Date: Mon, 11 Jun 2012 15:45:44 -0000

owfs has the capability of use an FUSE based service and it seems
logical to init it during system boot; this adds the required init
script for it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/owfs/owfs/owfs      |   59 ++++++++++++++++++++++++++
 meta-oe/recipes-extended/owfs/owfs_2.8p15.bb |    9 +++-
 2 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100755 meta-oe/recipes-extended/owfs/owfs/owfs

diff --git a/meta-oe/recipes-extended/owfs/owfs/owfs b/meta-oe/recipes-extended/owfs/owfs/owfs
new file mode 100755
index 0000000..766bbbb
--- /dev/null
+++ b/meta-oe/recipes-extended/owfs/owfs/owfs
@@ -0,0 +1,59 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/bin
+
+DAEMON="owfs"
+
+test -f /usr/bin/${DAEMON} || exit 0
+
+if test -f /etc/default/${DAEMON} ; then
+. /etc/default/${DAEMON}
+else
+:
+fi
+
+if [ "$START_OWFS" != "yes" ] 
+then  
+	exit 0
+fi
+
+startdaemon(){
+	echo -n "Starting ${DAEMON}: "
+	start-stop-daemon --start -x /usr/bin/${DAEMON} --  ${CMDLINE} --pid_file /var/run/${DAEMON}.pid
+	echo "done"
+}
+
+stopdaemon(){
+	echo -n "Stopping ${DAEMON}: "
+	start-stop-daemon --stop -p /var/run/${DAEMON}.pid
+        echo "done"
+}
+										
+
+
+case "$1" in
+  start)
+	startdaemon
+	;;
+  stop)
+	stopdaemon
+	;;
+  force-reload)
+	stopdaemon
+	startdaemon
+	;;
+  restart)
+	stopdaemon
+	startdaemon
+	;;
+  reload)
+	stopdaemon
+	startdaemon
+	;;
+  *)
+	echo "Usage: ${DAEMON} { start | stop | restart | reload }" >&2
+	exit 1
+	;;
+esac
+																						
+exit 0
diff --git a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
index d7c5040..2a00276 100644
--- a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
+++ b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
@@ -8,9 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "fuse virtual/libusb0"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
+           file://owfs \
            file://owhttpd \
            file://owserver "
 SRC_URI[md5sum] = "24ec3d04ded1b199831f03e70d9e2f1f"
@@ -36,6 +37,7 @@ EXTRA_OECONF = " \
 do_install_prepend() {
         install -d ${D}${sysconfdir}/default/
         install -d ${D}${sysconfdir}/init.d/
+        install -m 0755 ${WORKDIR}/owfs ${D}${sysconfdir}/init.d/owfs
         install -m 0755 ${WORKDIR}/owhttpd ${D}${sysconfdir}/init.d/owhttpd
         install -m 0755 ${WORKDIR}/owserver ${D}${sysconfdir}/init.d/owserver
 }
@@ -64,9 +66,10 @@ FILES_libowcapi = "${libdir}/libowcapi-*"
 FILES_libow = "${libdir}/libow-*"
 FILES_libownet = "${libdir}/libownet-*"
 
-INITSCRIPT_PACKAGES = "owhttpd owserver"
+INITSCRIPT_PACKAGES = "owfs owhttpd owserver"
+INITSCRIPT_NAME_owfs = "owfs"
 INITSCRIPT_NAME_owserver = "owserver"
 INITSCRIPT_NAME_owhttpd = "owhttpd"
+INITSCRIPT_PARAMS_owfs = "defaults 20"
 INITSCRIPT_PARAMS_owserver = "defaults 20"
 INITSCRIPT_PARAMS_owhttpd = "defaults 21"
-
-- 
1.7.2.5



