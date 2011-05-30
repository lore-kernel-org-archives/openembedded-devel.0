Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3v6-0007v1-RB
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:17 +0200
Received: by mail-yw0-f47.google.com with SMTP id 8so1597173ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=gCqo4wUtuLNKKofXfZa3BrWYLrXdrzx+nNhTLPekiFE=;
	b=Zl75SzJq4+ttkZGmQZMJMLUPR+Cw9/GscE8tIQpV+FvfTDdWXH0AQC7Gj8Bd25xyHn
	OMgxlovO6wgc1wPN6koNhyh5vzVDq8CTt8wzBqlLXd0Vci8L6SlHDHEahydD/PF1MV7u
	q0S0VGJzVShAKowQcegsLZD0qa+JCTVd1xjjg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=xP3n5RSbM+ppR1cBCSzQfPj4ogJe7SiTKQVXYQWiDLw3HyLyDX7v471CqQJJkqOz4c
	12JZ4VJxEr2YvZq4NtXMhgUxkNn0kDOuzNS1aAlVkvo9GAkSUd8wlbX9xvjyuXwivCIk
	fwdgTH9VD0dGNGjg6VznXYs2WcKPElNaw0obU=
Received: by 10.236.175.2 with SMTP id y2mr5758769yhl.490.1306767310095;
	Mon, 30 May 2011 07:55:10 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.55.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:55:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:19 +0000
Message-Id: <1306767263-29895-14-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 13/17] initramfs-module-block: use ROOT_DEVICE mountpoint if available
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
X-List-Received-Date: Mon, 30 May 2011 14:58:17 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/initrdscripts/files/85-blockboot.sh        |    9 +++++++--
 .../initrdscripts/initramfs-module-block_1.0.bb    |    2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/recipes/initrdscripts/files/85-blockboot.sh b/recipes/initrdscripts/files/85-blockboot.sh
index 7841ac6..07c1c35 100644
--- a/recipes/initrdscripts/files/85-blockboot.sh
+++ b/recipes/initrdscripts/files/85-blockboot.sh
@@ -7,6 +7,11 @@ if [ -e "$ROOT_DEVICE" ]; then
     if [ -n "$ROOT_FSTYPE" ]; then
 	type="-t $ROOT_FSTYPE"
     fi
-    mount $type "$ROOT_DEVICE" /mnt || fatal "Unable to mount rootfs device"
-    BOOT_ROOT=/mnt
+
+    if ! mount | grep -q "$ROOT_DEVICE"; then
+        mount $type "$ROOT_DEVICE" /mnt || fatal "Unable to mount rootfs device"
+        BOOT_ROOT=/mnt
+    else
+        BOOT_ROOT=`expr "$(mount | grep $ROOT_DEVICE)" : '.* on \([^ ]*\)'`
+    fi
 fi
diff --git a/recipes/initrdscripts/initramfs-module-block_1.0.bb b/recipes/initrdscripts/initramfs-module-block_1.0.bb
index f7834f0..a21a681 100644
--- a/recipes/initrdscripts/initramfs-module-block_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-block_1.0.bb
@@ -1,5 +1,5 @@
 SRC_URI = "file://85-blockboot.sh"
-PR = "r5"
+PR = "r6"
 RDEPENDS_${PN} = "initramfs-uniboot"
 DESCRIPTION = "An initramfs module for booting off normal block devices."
 
-- 
1.7.1



