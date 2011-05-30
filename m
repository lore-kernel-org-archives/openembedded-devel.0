Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3v9-0008Lf-G5
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:19 +0200
Received: by mail-gx0-f175.google.com with SMTP id 3so353578gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=p3+5makkPHOLYwE8MtgvDdFiUy7TxnMHXvSZLKhevQQ=;
	b=YqRkB3mp0mDw9oyWJXY1sIEURd01kSLARi+ms1blgruqUIZjGVBd5dj2yVvsxslzjD
	3epeLlHWYpXj0dnEffhs1R+VO76h/kDxZDdZR25On6WsBrapJt02GteIxuTPb9rjZiMc
	YkApweBAo8QgVvzoPnhbx5N9fgBGILCruMjOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=AF9M5ISyXbHDXd7VYcBKkYxTztjuzcgA2Lw75IDORzbdk8uEbkmI1Jgsg0wM798TDw
	f+ekqR1/6iSYyOYzQxkZvN+jLFUOx6pTr1fZds6kTIT3sz73tUNDAFdozQuqFJOj2crE
	1fcF7Fe6QpsqEu/JVlTVuUShbebl6P7VStMok=
Received: by 10.236.192.193 with SMTP id i41mr5890148yhn.258.1306767312396;
	Mon, 30 May 2011 07:55:12 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.55.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:55:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:20 +0000
Message-Id: <1306767263-29895-15-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 14/17] initramfs-module-mdev: add
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
X-List-Received-Date: Mon, 30 May 2011 14:58:19 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/initrdscripts/files/00-mdev.sh             |   19 +++++++++++++++++++
 recipes/initrdscripts/files/99-mdev.sh             |    6 ++++++
 recipes/initrdscripts/initramfs-module-mdev_1.0.bb |   13 +++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 recipes/initrdscripts/files/00-mdev.sh
 create mode 100644 recipes/initrdscripts/files/99-mdev.sh
 create mode 100644 recipes/initrdscripts/initramfs-module-mdev_1.0.bb

diff --git a/recipes/initrdscripts/files/00-mdev.sh b/recipes/initrdscripts/files/00-mdev.sh
new file mode 100644
index 0000000..a8e9622
--- /dev/null
+++ b/recipes/initrdscripts/files/00-mdev.sh
@@ -0,0 +1,19 @@
+load() {
+	modprobe $1 >/dev/null 2>&1 && info "Loaded module $1"
+}
+
+# setup the environment
+mkdir -p /dev
+mount -t tmpfs tmpfs /dev
+mkdir -m 0755 /dev/pts
+mkdir -m 1777 /dev/shm
+mount -t devpts devpts /dev/pts
+
+echo /sbin/mdev > /proc/sys/kernel/hotplug
+mdev -s
+
+# modules for disk nodes
+load sd-mod
+
+# load modules for devices
+find /sys -name modalias | while read m; do load $(cat $m) >/dev/null 2>&1; done
diff --git a/recipes/initrdscripts/files/99-mdev.sh b/recipes/initrdscripts/files/99-mdev.sh
new file mode 100644
index 0000000..4a78cfb
--- /dev/null
+++ b/recipes/initrdscripts/files/99-mdev.sh
@@ -0,0 +1,6 @@
+if [ -n "$BOOT_ROOT" ]; then
+	# move filesystems over to the mounted root
+	mount --move /dev $BOOT_ROOT/dev
+	mount --move /proc $BOOT_ROOT/proc
+	mount --move /sys $BOOT_ROOT/sys
+fi
diff --git a/recipes/initrdscripts/initramfs-module-mdev_1.0.bb b/recipes/initrdscripts/initramfs-module-mdev_1.0.bb
new file mode 100644
index 0000000..266262d
--- /dev/null
+++ b/recipes/initrdscripts/initramfs-module-mdev_1.0.bb
@@ -0,0 +1,13 @@
+SRC_URI = "file://00-mdev.sh file://99-mdev.sh"
+PR = "r1"
+RDEPENDS_${PN} = "initramfs-uniboot"
+DESCRIPTION = "An initramfs module to setup mdev and load modules"
+
+do_install() {
+    install -d ${D}/initrd.d
+    install -m 0755 ${WORKDIR}/00-mdev.sh ${D}/initrd.d/
+    install -m 0755 ${WORKDIR}/99-mdev.sh ${D}/initrd.d/
+}
+
+PACKAGE_ARCH = "all"
+FILES_${PN} += " /initrd.d/* "
-- 
1.7.1



