Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier.martin@vista-silicon.com>) id 1Pn6VU-0001ll-FM
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:38:40 +0100
Received: by mail-wy0-f175.google.com with SMTP id 40so6534501wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 01:37:39 -0800 (PST)
Received: by 10.227.151.65 with SMTP id b1mr4919162wbw.163.1297244258912;
	Wed, 09 Feb 2011 01:37:38 -0800 (PST)
Received: from localhost.localdomain (58.50.18.95.dynamic.jazztel.es
	[95.18.50.58])
	by mx.google.com with ESMTPS id u9sm109430wbg.0.2011.02.09.01.37.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Feb 2011 01:37:38 -0800 (PST)
From: Javier Martin <javier.martin@vista-silicon.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Feb 2011 10:37:12 +0100
Message-Id: <1297244237-9508-3-git-send-email-javier.martin@vista-silicon.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
References: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
Subject: [PATCH 2/7] Add custom fstab and profile for Visstrim_M10 board.
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
X-List-Received-Date: Wed, 09 Feb 2011 09:38:40 -0000


Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>
---
 recipes/base-files/base-files/visstrim_m10/fstab   |    9 +++++
 recipes/base-files/base-files/visstrim_m10/profile |   34 ++++++++++++++++++++
 recipes/base-files/base-files_3.0.14.bb            |    5 +++
 3 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 recipes/base-files/base-files/visstrim_m10/fstab
 create mode 100644 recipes/base-files/base-files/visstrim_m10/profile

diff --git a/recipes/base-files/base-files/visstrim_m10/fstab b/recipes/base-files/base-files/visstrim_m10/fstab
new file mode 100644
index 0000000..c50280c
--- /dev/null
+++ b/recipes/base-files/base-files/visstrim_m10/fstab
@@ -0,0 +1,9 @@
+# Visstrim_M10 fstab
+
+proc                 /proc                proc       defaults              0  0
+sys                  /sys                 sysfs      defaults              0  0
+usbfs                /proc/bus/usb        usbfs      defaults              0  0
+tmpfs                /media/ram           tmpfs      defaults              0  0
+devpts               /dev/pts             devpts     defaults              0  0
+
+/dev/mmcblk0p1       /opt                 auto       defaults,sync,noauto  0  0
diff --git a/recipes/base-files/base-files/visstrim_m10/profile b/recipes/base-files/base-files/visstrim_m10/profile
new file mode 100644
index 0000000..7ae3dfb
--- /dev/null
+++ b/recipes/base-files/base-files/visstrim_m10/profile
@@ -0,0 +1,34 @@
+# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
+# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
+
+PATH="/opt/usr/bin:/opt/bin:/opt/sbin:/usr/local/bin:/usr/bin:/bin"
+EDITOR="/bin/vi"			# needed for packages like cron
+test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
+
+if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
+	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html
+				# for an explanation of how to set this to your local timezone.
+	export TZ
+fi
+
+if [ "`id -u`" -eq 0 ]; then
+   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
+fi
+if [ "$PS1" ]; then
+# works for bash and ash (no other shells known to be in use here)
+   PS1='\u@\h:\w\$ '
+fi
+
+if [ -d /etc/profile.d ]; then
+  for i in /etc/profile.d/*.sh; do
+    if [ -r $i ]; then
+      . $i
+    fi
+  done
+  unset i
+fi
+
+export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
+
+umask 022
+
diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index 2d6d926..302f68d 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -165,6 +165,11 @@ do_install_append_tb5200l() {
 	ln -s var/tmp ${D}/tmp
 }
 
+do_install_append_visstrim_m10() {
+	mkdir -p ${D}/opt
+	mkdir -p ${D}/mnt/jffs2
+	mkdir -p ${D}/mnt/defaults/etc
+}
 
 PACKAGES = "${PN}-dbg ${PN}-doc ${PN}"
 FILES_${PN} = "/*"
-- 
1.7.0.4



