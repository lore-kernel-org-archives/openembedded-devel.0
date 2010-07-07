Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1OWSAO-0000cm-Kp
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 12:48:43 +0200
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 4811346E7;
	Wed,  7 Jul 2010 14:32:56 +0400 (MSD)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1OWS1m-0006R4-LF; Wed, 07 Jul 2010 14:38:54 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jul 2010 14:38:54 +0400
Message-Id: <1278499134-24718-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <201007071352.09254.khimov@altell.ru>
References: <201007071352.09254.khimov@altell.ru>
X-Altell-MailScanner-ID: 4811346E7.10ECD
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] busybox: add suport for FEATURE_INDIVIDUAL setup
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
X-List-Received-Date: Wed, 07 Jul 2010 10:49:47 -0000
X-List-Received-Date: Wed, 07 Jul 2010 10:49:47 -0000

Where each applet is installed as a tiny binary linked against shared
libbusybox.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/busybox/busybox.inc |   74 ++++++++++++++++++++++++++++++++++++-------
 1 files changed, 62 insertions(+), 12 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index a5346bd..31e6cdc 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r30"
+INC_PR = "r31"
 
 SRC_URI = "\
   file://busybox-cron \
@@ -98,15 +98,35 @@ do_install () {
 
 	install -d ${D}${sysconfdir}/init.d
 
-	# Install /bin/busybox, and the /bin/sh link so the postinst script
-	# can run. Let update-alternatives handle the rest.
-	install -d ${D}${base_bindir}
-	if grep -q "CONFIG_FEATURE_SUID=y" ${WORKDIR}/defconfig; then
-		install -m 4755 ${S}/busybox ${D}${base_bindir}
+	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${WORKDIR}/defconfig; then
+		# Install /bin/busybox, and the /bin/sh link so the postinst script
+		# can run. Let update-alternatives handle the rest.
+		install -d ${D}${base_bindir}
+		if grep -q "CONFIG_FEATURE_SUID=y" ${WORKDIR}/defconfig; then
+			install -m 4755 ${S}/busybox ${D}${base_bindir}
+		else
+			install -m 0755 ${S}/busybox ${D}${base_bindir}
+		fi
+		ln -sf busybox ${D}${base_bindir}/sh
 	else
-		install -m 0755 ${S}/busybox ${D}${base_bindir}
+		install -d ${D}${base_bindir} ${D}${base_sbindir}
+		install -d ${D}${libdir} ${D}${bindir} ${D}${sbindir}
+		cat busybox.links | while read FILE; do
+			NAME=`basename "$FILE"`
+			install -m 0755 "0_lib/$NAME" "${D}$FILE.${PN}"
+		done
+		# add suid bit where needed
+		for i in `grep -E "APPLET.*_BB_SUID_((MAYBE|REQUIRE))" include/applets.h | grep -v _BB_SUID_DROP | cut -f 3 -d '(' | cut -f 1 -d ','`; do
+			find ${D} -name $i.${PN} -exec chmod a+s {} \;
+		done
+		install -m 0755 0_lib/libbusybox.so.${PV} ${D}${libdir}/libbusybox.so.${PV}
+		ln -sf sh.${PN} ${D}${base_bindir}/sh
+		ln -sf ln.${PN} ${D}${base_bindir}/ln
+		ln -sf test.${PN} ${D}${bindir}/test
+		if [ -f ${D}/linuxrc.${PN} ]; then
+			mv ${D}/linuxrc.${PN} ${D}/linuxrc
+		fi
 	fi
-	ln -sf busybox ${D}${base_bindir}/sh
 
 	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${PN}
@@ -144,12 +164,42 @@ pkg_postinst_${PN} () {
 	# so the update-alternatives script will get the utilities it needs
 	# (update-alternatives have no problem replacing links later anyway)
 	test -n 2> /dev/null || alias test='busybox test'
-	if test "x$D" = "x"; then while read link; do if test ! -h "$link"; then case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; /*) to="/bin/busybox";; esac; busybox ln -s $to $link; fi; done </etc/busybox.links; fi
+	ln --help >/dev/null 2>&1 || alias ln='busybox ln'
+	if test "x$D" = "x"; then
+		while read link; do
+			if test ! -h "$link"; then
+				if test -f "$link.busybox"; then
+					to="$link.busybox"
+				else
+					case "$link" in
+						/*/*/*) to="../../bin/busybox";;
+						/bin/*) to="busybox";;
+						/*/*) to="../bin/busybox";;
+						/*) to="/bin/busybox";;
+					esac
+				fi
+				ln -s $to $link
+			fi
+		done </etc/busybox.links
+	fi
 
 	# This adds the links, remember that this has to work when building an image too, hence the $D
-    set +e
-	while read link; do case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; /*) to="/bin/busybox";; esac; bn=`basename $link`; update-alternatives --install $link $bn $to 50; done <$D/etc/busybox.links
-    set -e
+	set +e
+	while read link; do
+		if test -f "$D$link.${PN}"; then
+			to="$link.${PN}"
+		else
+			case "$link" in
+				/*/*/*) to="../../bin/busybox";;
+				/bin/*) to="busybox";;
+				/*/*) to="../bin/busybox";;
+				/*) to="/bin/busybox";;
+			esac
+		fi
+		bn=`basename $link`
+		update-alternatives --install $link $bn $to 50
+	done <$D/etc/busybox.links
+	set -e
 }
 
 pkg_postinst_${PN}-mountall () {
-- 
1.5.6.5



