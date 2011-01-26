Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiAAw-0006uW-PC
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:33:02 +0100
Received: by bwz10 with SMTP id 10so1584763bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=LdNBibpX9AyfedGZpNy6PrSFMqx/etVKn+e6jlJMBpo=;
	b=I98klI9dv2NipgdzDKIDIla5o+55RsTQwnSSjbx9SA6+IIb+GYCkhe/YDlq0OmNq0s
	DppI5FcwhzsXi//8pBmG6tDkqbuXlfnXb+mp0zrZqBB6+okXiCYbFvZ9mzCSaZRuKxQe
	GpObuNDlShWRs2bq2i0JMyZ5k3b857AbylJ8Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=XumTeTAS0VBVJ5rMBzbCY1pLl7zZvnQbi/IVzbvCE6Cj+79AgGmbw8aT/fF2gQTt8k
	NywA2c+XTrB2lpMm1wlziwb56sJ0BguiZt863HihNrTzsqP6O03QgmoeA+2Wu0kVCHtd
	vmkfmAMYf7zfqGeEs6GsDgcFsIsUtHBP8v9T4=
Received: by 10.204.75.193 with SMTP id z1mr687373bkj.214.1296066119979;
	Wed, 26 Jan 2011 10:21:59 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id f20sm7652477bkf.4.2011.01.26.10.21.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:21:58 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PiA0C-0002jJ-UE; Wed, 26 Jan 2011 19:21:56 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:21:55 +0100
Message-Id: <1296066116-10466-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 1/2] busybox: add group to -passwd package
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
X-List-Received-Date: Wed, 26 Jan 2011 18:33:02 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox.inc      |    6 +++++-
 recipes/busybox/busybox_1.1x.inc |    1 +
 recipes/busybox/files/group      |   12 ++++++++++++
 recipes/busybox/files/passwd     |    3 ---
 recipes/busybox/files/shadow     |    3 ---
 5 files changed, 18 insertions(+), 7 deletions(-)
 create mode 100644 recipes/busybox/files/group

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 03efc99..9d87d9f 100644
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
@@ -50,7 +51,7 @@ RDEPENDS_${PN} += "${PN}-mountall"
 RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES_${PN}-passwd = "${sysconfdir}/passwd.${PN}"
+FILES_${PN}-passwd = "${sysconfdir}/passwd.${PN} ${sysconfdir}/group.${PN}"
 FILES_${PN}-shadow = "${sysconfdir}/shadow.${PN}"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} \
                       ${sysconfdir}/default/busybox-syslog"
@@ -187,6 +188,7 @@ do_install () {
 
 	if grep -q "CONFIG_PASSWD=y" ${WORKDIR}/defconfig; then
 	    install -m 0644 ${WORKDIR}/passwd ${D}${sysconfdir}/passwd.${PN}
+	    install -m 0644 ${WORKDIR}/group ${D}${sysconfdir}/group.${PN}
 	    if grep -q "CONFIG_FEATURE_SHADOWPASSWDS=y" ${WORKDIR}/defconfig; then
 	        install -m 0640 ${WORKDIR}/shadow ${D}${sysconfdir}/shadow.${PN}
             fi
@@ -280,9 +282,11 @@ pkg_prerm_${PN}-mountall () {
 
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
index 1078aac..9552d4d 100644
--- a/recipes/busybox/busybox_1.1x.inc
+++ b/recipes/busybox/busybox_1.1x.inc
@@ -13,6 +13,7 @@ SRC_URI = "\
   file://busybox-httpd \
   file://busybox-udhcpd \
   file://default.script file://simple.script \
+  file://group \
   file://hwclock.sh \
   file://hwclock-default \
   file://mount.busybox \
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
1.7.2.3



