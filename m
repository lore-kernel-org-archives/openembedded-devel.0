Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqc5-0004XN-GL
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:41 +0100
Received: by fxm17 with SMTP id 17so12728012fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=opI7bTnAykyKXUHiryJWuroWmdFzc53ANV8rSvBy/Mo=;
	b=ovpHEe/vhoPDYfrlgsVioZ1Qr1BaPthEmLmHjHeBtREDQEhr10MYhQMBpTNuAnA2cV
	J3yDTjOmHjDu7bxQ7EjkWkryfvSd/qukzzvAZW7uAwOKWfoXivSuCWTsMnObG0o+Ao0N
	Tb9f9eln45qOW4EOcdsD6IQWVWSxNINuRGZi8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=niLELU8Mnvw5ewAhb6aB4Wsiwb1ZD+gx9EMnd/4wNehMBEkdZb2fSnkqqf7VokUnB6
	YEYtxnXkp42nw2ySZD7dn8eBWpgzJQY1EWuktsbMscSdUQt5tqRQEaBhH/K6MsoiFswH
	dZRLqYW7YDnc1b6PB1KXcGEC1ns8bSWd3aEW8=
Received: by 10.223.114.65 with SMTP id d1mr551459faq.36.1294084939842;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id k6sm4880882faa.30.2011.01.03.12.02.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000p3-PH; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:02:02 +0100
Message-Id: <1294084926-3115-8-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 08/12] busybox: provide -passwd and -shadow packages
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
X-List-Received-Date: Mon, 03 Jan 2011 20:02:41 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox.inc      |   28 ++++++++++++++++++++++++++++
 recipes/busybox/busybox_1.1x.inc |    2 ++
 recipes/busybox/files/passwd     |   11 +++++++++++
 recipes/busybox/files/shadow     |   11 +++++++++++
 4 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 recipes/busybox/files/passwd
 create mode 100644 recipes/busybox/files/shadow

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index eda5f95..97d6f78 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -23,6 +23,8 @@ SRC_URI = "\
   file://hwclock-default \
   file://ifupdown-spurious-environ.patch \
   file://mount.busybox \
+  file://passwd \
+  file://shadow \
   file://syslog \
   file://syslog.conf \
   file://udhcpscript.patch \
@@ -34,6 +36,7 @@ SRC_URI_append_nylon = " file://xargs-double-size.patch"
 export EXTRA_CFLAGS = "${CFLAGS}"
 EXTRA_OEMAKE_append = " CROSS=${HOST_PREFIX}"
 PACKAGES =+ "${PN}-mountall ${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
+PACKAGES =+ "${PN}-passwd ${PN}-shadow"
 
 # We need this RRECOMMENDS_${PN} because libc dlopens libgcc
 # and shlib mechanism can not detect it because its not
@@ -47,6 +50,8 @@ RDEPENDS_${PN} += "${PN}-mountall"
 RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
+FILES_${PN}-passwd = "${sysconfdir}/passwd.${PN}"
+FILES_${PN}-shadow = "${sysconfdir}/shadow.${PN}"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} ${sysconfdir}/syslog.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 
@@ -64,6 +69,8 @@ CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf"
 INITSCRIPT_PARAMS_${PN}-syslog_slugos = "start 20 ."
 
 RDEPENDS_${PN}-httpd += "${PN}"
+RDEPENDS_${PN}-passwd += "${PN}"
+RDEPENDS_${PN}-shadow += "${PN}-passwd"
 RDEPENDS_${PN}-syslog += "${PN}"
 RDEPENDS_${PN}-udhcpd += "${PN}"
 
@@ -177,6 +184,12 @@ do_install () {
 		fi
 	fi
 
+	if grep -q "CONFIG_PASSWD=y" ${WORKDIR}/defconfig; then
+	    install -m 0644 ${WORKDIR}/passwd ${D}${sysconfdir}/passwd.${PN}
+	    if grep -q "CONFIG_FEATURE_SHADOWPASSWDS=y" ${WORKDIR}/defconfig; then
+	        install -m 0640 ${WORKDIR}/shadow ${D}${sysconfdir}/shadow.${PN}
+            fi
+	fi
 	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${PN}
 		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/
@@ -260,6 +273,21 @@ pkg_prerm_${PN}-mountall () {
 	update-alternatives --remove default_mountall mountall.${PN}
 }
 
+pkg_postinst_${PN}-passwd () {
+	update-alternatives --install ${sysconfdir}/passwd default_passwd passwd.${PN} 50
+}
+pkg_prerm_${PN}-passwd () {
+	update-alternatives --remove default_passwd passwd.${PN}
+}
+
+pkg_postinst_${PN}-shadow () {
+	update-alternatives --install ${sysconfdir}/shadow default_shadow shadow.${PN} 50
+}
+pkg_prerm_${PN}-shadow () {
+	update-alternatives --remove default_shadow shadow.${PN}
+}
+
+
 pkg_postinst_${PN}-syslog () {
 	update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 50
 
diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
index 079c784..4dbc3d9 100644
--- a/recipes/busybox/busybox_1.1x.inc
+++ b/recipes/busybox/busybox_1.1x.inc
@@ -17,6 +17,8 @@ SRC_URI = "\
   file://hwclock-default \
   file://mount.busybox \
   file://mountall \
+  file://passwd \
+  file://shadow \
   file://syslog \
   file://syslog.conf \
   file://umount.busybox \
diff --git a/recipes/busybox/files/passwd b/recipes/busybox/files/passwd
new file mode 100644
index 0000000..64c9ab6
--- /dev/null
+++ b/recipes/busybox/files/passwd
@@ -0,0 +1,11 @@
+root:x:0:0:root:/root:/bin/sh
+daemon:x:1:1:daemon:/usr/sbin:/bin/sh
+bin:x:2:2:bin:/bin:/bin/sh
+sys:x:3:3:sys:/dev:/bin/sh
+sync:x:4:65534:sync:/bin:/bin/sync
+man:x:6:12:man:/var/cache/man:/bin/sh
+mail:x:8:8:mail:/var/mail:/bin/sh
+www-data:x:33:33:www-data:/var/www:/bin/sh
+backup:x:34:34:backup:/var/backups:/bin/sh
+irc:x:39:39:ircd:/var/run/ircd:/bin/sh
+nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
diff --git a/recipes/busybox/files/shadow b/recipes/busybox/files/shadow
new file mode 100644
index 0000000..25df693
--- /dev/null
+++ b/recipes/busybox/files/shadow
@@ -0,0 +1,11 @@
+root::14741:0:99999:7:::
+daemon:*:14741:0:99999:7:::
+bin:*:14741:0:99999:7:::
+sys:*:14741:0:99999:7:::
+sync:*:14741:0:99999:7:::
+man:*:14741:0:99999:7:::
+mail:*:14741:0:99999:7:::
+www-data:*:14741:0:99999:7:::
+backup:*:14741:0:99999:7:::
+irc:*:14741:0:99999:7:::
+nobody:*:14741:0:99999:7:::
-- 
1.7.2.3



