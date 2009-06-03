Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MBxFo-0000Jj-81
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 22:40:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5D2E54A7EC4;
	Wed,  3 Jun 2009 16:31:09 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14635-03; Wed,  3 Jun 2009 16:31:09 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 207DF493D8D; Wed,  3 Jun 2009 16:31:08 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id C139D4C81D4;
	Wed,  3 Jun 2009 16:31:05 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id B96301B48A0; Wed,  3 Jun 2009 16:31:05 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 16:31:03 -0400
Message-Id: <1244061064-25155-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1244060096.5049.60.camel@lenovo.internal.reciva.com>
References: <1244060096.5049.60.camel@lenovo.internal.reciva.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/2] busybox: let update-alternatives create all symlinks, and use INC_PR
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
X-List-Received-Date: Wed, 03 Jun 2009 20:40:08 -0000

Back in 2005, commit 5e01906b set this up; in f7f1ac27 the recipe
was changed to keep all the links in the package.

This changes it back, and also removes special treatment of the
links for crond, httpd, udhcpd, hwclock, and udhcpc.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/busybox/busybox-static_1.11.3.bb |    2 +-
 recipes/busybox/busybox.inc              |   46 ++++-------------------------
 recipes/busybox/busybox_1.11.3.bb        |    2 +-
 recipes/busybox/busybox_1.13.2.bb        |    2 +-
 recipes/busybox/busybox_1.2.1.bb         |    2 +-
 recipes/busybox/busybox_1.2.2.bb         |    2 +-
 recipes/busybox/busybox_1.3.1.bb         |    2 +-
 recipes/busybox/busybox_1.7.2.bb         |    2 +-
 recipes/busybox/busybox_1.9.2.bb         |    2 +-
 9 files changed, 15 insertions(+), 47 deletions(-)

diff --git a/recipes/busybox/busybox-static_1.11.3.bb b/recipes/busybox/busybox-static_1.11.3.bb
index 9529ab7..6523fa9 100644
--- a/recipes/busybox/busybox-static_1.11.3.bb
+++ b/recipes/busybox/busybox-static_1.11.3.bb
@@ -1,5 +1,5 @@
 require busybox_${PV}.bb
-PR = "r4"
+PR = "${INC_PR}.1"
 
 FILESPATH = "${FILE_DIRNAME}/busybox-${PV}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"
 S = "${WORKDIR}/busybox-${PV}"
diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 04f2cf4..e312147 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,6 +11,8 @@ LICENSE = "GPL"
 SECTION = "base"
 PRIORITY = "required"
 
+INC_PR = "r20"
+
 SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
   file://busybox-cron \
@@ -71,64 +73,30 @@ do_install () {
 		mv busybox.links.new busybox.links
 	fi
 
-	unset CFLAGS CPPFLAGS CXXFLAGS
 	install -d ${D}${sysconfdir}/init.d
-	oe_runmake "PREFIX=${D}" install
-	cp -pPR ${S}/_install/* ${D}/
-
-	# Move everything to /busybox (not supposed to end up in any package)
-	install -d ${D}/busybox
-	ls ${D} -R
 
-	# Copy /bin and /sbin -- and /usr, if prefix is not "".
-	for i in ${D}${base_bindir} ${D}${base_sbindir} ${prefix:+${D}${prefix}}
-	do
-		if [ -d $i ]; then
-			cp -pPR $i ${D}/busybox/
-		fi
-	done
-	# Move the busybox binary back to /bin
+	# Install /bin/busybox, and the /bin/sh link so the postinst script
+	# can run. Let update-alternatives handle the rest.
 	install -d ${D}${base_bindir}
-	mv ${D}/busybox${base_bindir}/busybox ${D}${base_bindir}/
-	# Move back the sh symlink
-	test -h ${D}/busybox${base_bindir}/sh && mv ${D}/busybox${base_bindir}/sh ${D}${base_bindir}/
+	install -m 0755 ${S}/busybox ${D}${base_bindir}
+	ln -sf busybox ${D}${base_bindir}/sh
 
 	install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/
 	install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/
 	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
-		# Move crond back to /usr/sbin/crond
-		install -d ${D}${sbindir}
-		mv ${D}/busybox${sbindir}/crond ${D}${sbindir}/
-
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_HTTPD=y" ${WORKDIR}/defconfig; then
-		# Move httpd back to /usr/sbin/httpd
-		install -d ${D}${sbindir}
-		mv ${D}/busybox${sbindir}/httpd ${D}${sbindir}/
-
 		install -m 0755 ${WORKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/
 		install -d ${D}/srv/www
 	fi
 	if grep "CONFIG_APP_UDHCPD=y" ${WORKDIR}/defconfig; then
-		# Move udhcpd back to /usr/sbin/udhcpd
-		install -d ${D}${sbindir}
-		mv ${D}/busybox${sbindir}/udhcpd ${D}${sbindir}/
-
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
-		# Move hwclock back to /sbin/hwclock
-		install -d ${D}${base_sbindir}
-		mv ${D}/busybox${base_sbindir}/hwclock ${D}${base_sbindir}/
-
 		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_APP_UDHCPC=y" ${WORKDIR}/defconfig; then
-		# Move dhcpc back to /usr/sbin/udhcpc
-		install -d ${D}${base_sbindir}
-		mv ${D}/busybox${base_sbindir}/udhcpc ${D}${base_sbindir}/
-
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
 		install -m 0755 ${S}/examples/udhcp/simple.script ${D}${sysconfdir}/udhcpc.d/50default
diff --git a/recipes/busybox/busybox_1.11.3.bb b/recipes/busybox/busybox_1.11.3.bb
index bd03aa8..673fe15 100644
--- a/recipes/busybox/busybox_1.11.3.bb
+++ b/recipes/busybox/busybox_1.11.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r15"
+PR = "${INC_PR}.1"
 
 SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
index 96d0f0b..c1cc51b 100644
--- a/recipes/busybox/busybox_1.13.2.bb
+++ b/recipes/busybox/busybox_1.13.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r19"
+PR = "${INC_PR}.1"
 
 SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
diff --git a/recipes/busybox/busybox_1.2.1.bb b/recipes/busybox/busybox_1.2.1.bb
index 63a93df..3630a46 100644
--- a/recipes/busybox/busybox_1.2.1.bb
+++ b/recipes/busybox/busybox_1.2.1.bb
@@ -1,6 +1,6 @@
 require busybox.inc
 
-PR = "r19"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://wget-long-options.patch;patch=1 \
 	   file://df_rootfs.patch;patch=1 \
diff --git a/recipes/busybox/busybox_1.2.2.bb b/recipes/busybox/busybox_1.2.2.bb
index fe9d07e..43a15d0 100644
--- a/recipes/busybox/busybox_1.2.2.bb
+++ b/recipes/busybox/busybox_1.2.2.bb
@@ -1,6 +1,6 @@
 require busybox.inc
 
-PR = "r5"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/busybox/busybox_1.3.1.bb b/recipes/busybox/busybox_1.3.1.bb
index 2cdb81b..e0fd63b 100644
--- a/recipes/busybox/busybox_1.3.1.bb
+++ b/recipes/busybox/busybox_1.3.1.bb
@@ -1,6 +1,6 @@
 require busybox.inc
 
-PR = "r5"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/busybox/busybox_1.7.2.bb b/recipes/busybox/busybox_1.7.2.bb
index 87d336b..6af073f 100644
--- a/recipes/busybox/busybox_1.7.2.bb
+++ b/recipes/busybox/busybox_1.7.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r13"
+PR = "${INC_PR}.1"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
            file://busybox-cron \
diff --git a/recipes/busybox/busybox_1.9.2.bb b/recipes/busybox/busybox_1.9.2.bb
index e9aa820..64f9c62 100644
--- a/recipes/busybox/busybox_1.9.2.bb
+++ b/recipes/busybox/busybox_1.9.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r6"
+PR = "${INC_PR}.1"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
            file://udhcpscript.patch;patch=1 \
-- 
1.6.3



