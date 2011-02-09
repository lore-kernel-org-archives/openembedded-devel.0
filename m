Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier.martin@vista-silicon.com>) id 1Pn6Vh-0001mS-56
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:38:53 +0100
Received: by wwi18 with SMTP id 18so1562063wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 01:37:50 -0800 (PST)
Received: by 10.227.195.79 with SMTP id eb15mr18565086wbb.192.1297244269912;
	Wed, 09 Feb 2011 01:37:49 -0800 (PST)
Received: from localhost.localdomain (58.50.18.95.dynamic.jazztel.es
	[95.18.50.58])
	by mx.google.com with ESMTPS id u9sm109430wbg.0.2011.02.09.01.37.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Feb 2011 01:37:48 -0800 (PST)
From: Javier Martin <javier.martin@vista-silicon.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Feb 2011 10:37:16 +0100
Message-Id: <1297244237-9508-7-git-send-email-javier.martin@vista-silicon.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
References: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
Subject: [PATCH 6/7] Add new specific package for Visstrim_M10 board.
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
X-List-Received-Date: Wed, 09 Feb 2011 09:38:53 -0000

This visstrim-m10-utils package includes a preinit script for
Visstrim_M10 boards and the commands "save_config" and
"default_config" which write volatile directories to a
non volatile storage.

Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>
---
 recipes/visstrim-m10-utils/files/default_config    |    4 ++
 recipes/visstrim-m10-utils/files/preinit           |   31 ++++++++++++++++++
 recipes/visstrim-m10-utils/files/save_config       |   18 ++++++++++
 .../visstrim-m10-utils/visstrim-m10-utils_0.1.bb   |   34 ++++++++++++++++++++
 4 files changed, 87 insertions(+), 0 deletions(-)
 create mode 100644 recipes/visstrim-m10-utils/files/default_config
 create mode 100644 recipes/visstrim-m10-utils/files/preinit
 create mode 100644 recipes/visstrim-m10-utils/files/save_config
 create mode 100644 recipes/visstrim-m10-utils/visstrim-m10-utils_0.1.bb

diff --git a/recipes/visstrim-m10-utils/files/default_config b/recipes/visstrim-m10-utils/files/default_config
new file mode 100644
index 0000000..bb880e4
--- /dev/null
+++ b/recipes/visstrim-m10-utils/files/default_config
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+rm -rf /etc/*
+cp -a /mnt/defaults/etc/* /etc/
diff --git a/recipes/visstrim-m10-utils/files/preinit b/recipes/visstrim-m10-utils/files/preinit
new file mode 100644
index 0000000..16b7c9b
--- /dev/null
+++ b/recipes/visstrim-m10-utils/files/preinit
@@ -0,0 +1,31 @@
+#!/bin/sh
+/bin/echo "Vista Silicon init."
+
+# Basic fixes
+mkdir /dev/pts
+mount -a
+mkdir -p /media/ram/tmp
+mount -o bind /media/ram/tmp /tmp
+mkdir -p /media/ram/var/volatile
+cp -a /var/volatile/* /media/ram/var/volatile
+mount -o bind /media/ram/var/volatile /var/volatile
+mkdir -p /media/ram/etc
+
+# Mount jffs2
+bootgroup=`/sbin/fw_printenv bootgroup | /bin/sed 's/.*=//'`
+if [ $bootgroup = "0" ];
+then
+	p=3
+else
+	p=6
+fi
+mount -t jffs2 -o ro /dev/mtdblock$p /mnt/jffs2
+
+# Set up etc
+cfg=`/sbin/fw_printenv active_config | /bin/sed 's/.*=//'`
+cp -a /mnt/jffs2/config$cfg/etc/* /media/ram/etc
+mount -o bind /etc /mnt/defaults/etc
+mount -o bind /media/ram/etc /etc
+
+# Call true init
+exec /sbin/init 5
diff --git a/recipes/visstrim-m10-utils/files/save_config b/recipes/visstrim-m10-utils/files/save_config
new file mode 100644
index 0000000..2c4d5b7
--- /dev/null
+++ b/recipes/visstrim-m10-utils/files/save_config
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+mount -o remount,rw,noatime /mnt/jffs2
+cfg=`/sbin/fw_printenv active_config | /bin/sed 's/.*=//'`
+if [ $cfg = "0" ];
+then
+	new_cfg="1"
+else
+	new_cfg="0"
+fi
+
+rm -rf /mnt/jffs2/config$new_cfg
+mkdir -p /mnt/jffs2/tmp
+cp -a /etc /mnt/jffs2/tmp/
+mv /mnt/jffs2/tmp /mnt/jffs2/config$new_cfg
+mount -o remount,ro /mnt/jffs2
+
+/sbin/fw_setenv active_config $new_cfg
diff --git a/recipes/visstrim-m10-utils/visstrim-m10-utils_0.1.bb b/recipes/visstrim-m10-utils/visstrim-m10-utils_0.1.bb
new file mode 100644
index 0000000..824f30f
--- /dev/null
+++ b/recipes/visstrim-m10-utils/visstrim-m10-utils_0.1.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Visstrim_m10 set of scripts to allow squashfs+jffs2 schema"
+SECTION = "base"
+PRIORITY = "required"
+LICENSE = "TODO"
+PR = "r0"
+
+SRC_URI = "file://preinit \
+	   file://save_config \
+	   file://default_config \
+	   "
+
+SCRIPTS_SBIN = "preinit"
+SCRIPTS_USR_SBIN = "save_config default_config"
+
+# This just makes things easier...
+S="${WORKDIR}"
+
+do_install() {
+	# Directories
+	install -d ${D}${sbindir} \
+		   ${D}${base_sbindir}
+
+	# Shell scripts
+	for p in ${SCRIPTS_SBIN}
+	do
+		install -m 0755 $p ${D}${base_sbindir}/$p
+	done
+	for p in ${SCRIPTS_USR_SBIN}
+	do
+		install -m 0755 $p ${D}${sbindir}/$p
+	done
+}
+
+FILES_${PN} = "/"
-- 
1.7.0.4



