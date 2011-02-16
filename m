Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ppeie-0000xP-98
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:34:48 +0100
Received: (qmail 19858 invoked by uid 503); 16 Feb 2011 11:16:18 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 16 Feb 2011 11:16:18 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Feb 2011 12:33:37 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Feb 2011 12:33:35 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:33:50 +0100
Message-Id: <1297852433-31160-6-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297852433-31160-1-git-send-email-eric@eukrea.com>
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12105394324504227150
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 06/10] busybox: add group to -passwd package
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
X-List-Received-Date: Wed, 16 Feb 2011 10:34:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Eric Bénard <eric@eukrea.com>
Acked-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/busybox/busybox.inc      |    6 +++++-
 recipes/busybox/busybox_1.1x.inc |    1 +
 recipes/busybox/files/group      |   12 ++++++++++++
 recipes/busybox/files/passwd     |    3 ---
 recipes/busybox/files/shadow     |    3 ---
 5 files changed, 18 insertions(+), 7 deletions(-)
 create mode 100644 recipes/busybox/files/group

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 9c0bddc..dc97c5f 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -19,6 +19,7 @@ SRC_URI = "\
   file://busybox-udhcpd \
   file://default.script file://simple.script \
   file://dhcp-hostname.patch \
+  file://group \
   file://hwclock.sh \
   file://hwclock-default \
   file://ifupdown-spurious-environ.patch \
@@ -56,7 +57,7 @@ RPROVIDES_${PN}-inetd = "inetd"
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-inetd = "${sysconfdir}/init.d/inetd.${PN} \
                      ${sysconfdir}/inetd.conf"
-FILES_${PN}-passwd = "${sysconfdir}/passwd.${PN}"
+FILES_${PN}-passwd = "${sysconfdir}/passwd.${PN} ${sysconfdir}/group.${PN}"
 FILES_${PN}-shadow = "${sysconfdir}/shadow.${PN}"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} \
                       ${sysconfdir}/default/busybox-syslog"
@@ -196,6 +197,7 @@ do_install () {
 
 	if grep -q "CONFIG_PASSWD=y" ${WORKDIR}/defconfig; then
 	    install -m 0644 ${WORKDIR}/passwd ${D}${sysconfdir}/passwd.${PN}
+	    install -m 0644 ${WORKDIR}/group ${D}${sysconfdir}/group.${PN}
 	    if grep -q "CONFIG_FEATURE_SHADOWPASSWDS=y" ${WORKDIR}/defconfig; then
 	        install -m 0640 ${WORKDIR}/shadow ${D}${sysconfdir}/shadow.${PN}
             fi
@@ -293,9 +295,11 @@ pkg_prerm_${PN}-mountall () {
 
 pkg_postinst_${PN}-passwd () {
 	update-alternatives --install ${sysconfdir}/passwd default_passwd passwd.${PN} 50
+	update-alternatives --install ${sysconfdir}/group default_group group.${PN} 50
 }
 pkg_prerm_${PN}-passwd () {
 	update-alternatives --remove default_passwd passwd.${PN}
+	update-alternatives --remove default_group group.${PN}
 }
 
 pkg_postinst_${PN}-shadow () {
diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
index 763b324..7623944 100644
--- a/recipes/busybox/busybox_1.1x.inc
+++ b/recipes/busybox/busybox_1.1x.inc
@@ -13,6 +13,7 @@ SRC_URI = "\
   file://busybox-httpd \
   file://busybox-udhcpd \
   file://default.script file://simple.script \
+  file://group \
   file://hwclock.sh \
   file://hwclock-default \
   file://inetd \
diff --git a/recipes/busybox/files/group b/recipes/busybox/files/group
new file mode 100644
index 0000000..3dd8cdd
--- /dev/null
+++ b/recipes/busybox/files/group
@@ -0,0 +1,12 @@
+root:x:0:
+daemon:x:1:
+bin:x:2:
+sys:x:3:
+tty:x:5:
+disk:x:6:
+mail:x:8:
+man:x:12:
+www-data:x:33:
+utmp:x:43:
+nogroup:x:65534:
+users:x:100:
diff --git a/recipes/busybox/files/passwd b/recipes/busybox/files/passwd
index 64c9ab6..34921c3 100644
--- a/recipes/busybox/files/passwd
+++ b/recipes/busybox/files/passwd
@@ -2,10 +2,7 @@ root:x:0:0:root:/root:/bin/sh
 daemon:x:1:1:daemon:/usr/sbin:/bin/sh
 bin:x:2:2:bin:/bin:/bin/sh
 sys:x:3:3:sys:/dev:/bin/sh
-sync:x:4:65534:sync:/bin:/bin/sync
 man:x:6:12:man:/var/cache/man:/bin/sh
 mail:x:8:8:mail:/var/mail:/bin/sh
 www-data:x:33:33:www-data:/var/www:/bin/sh
-backup:x:34:34:backup:/var/backups:/bin/sh
-irc:x:39:39:ircd:/var/run/ircd:/bin/sh
 nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
diff --git a/recipes/busybox/files/shadow b/recipes/busybox/files/shadow
index 25df693..e64a964 100644
--- a/recipes/busybox/files/shadow
+++ b/recipes/busybox/files/shadow
@@ -2,10 +2,7 @@ root::14741:0:99999:7:::
 daemon:*:14741:0:99999:7:::
 bin:*:14741:0:99999:7:::
 sys:*:14741:0:99999:7:::
-sync:*:14741:0:99999:7:::
 man:*:14741:0:99999:7:::
 mail:*:14741:0:99999:7:::
 www-data:*:14741:0:99999:7:::
-backup:*:14741:0:99999:7:::
-irc:*:14741:0:99999:7:::
 nobody:*:14741:0:99999:7:::
-- 
1.7.0.4



