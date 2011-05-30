Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3v0-00083s-Te
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:11 +0200
Received: by mail-yi0-f47.google.com with SMTP id 13so1568954yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=ApDn12CesTYGKWgEg401q6l9RDDkDN9l/eNPSRKBKXA=;
	b=fBiffbgVU2Bx1ZWZWscn/MfWHwTniP1dYMJ4PWIP3Ya+7rQhgkDUS6vNc/g+/oJ+/U
	Ep+YcAvCV1RY9lEk6OqfHML4AL1ffQnh81hPfefPGcXHb0cFBDCicX1e5hsQ7j2ExA4e
	jLrVgdGoLKh9R0W2r7fwaxbtsWiBw5u0bKVWU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=GZU2rZUR3D8ltyR+Yr/WUex05i3dL4lZ5JUFq7Q1UAKgmQrdi6zBSMImJL80jkIuK1
	yMcQTn6UVqjO3CfZ7m5heXY27KM4pxlrX33jA0amr/ZuCetbgDTVurOf9ZOIUhAPq0tE
	3XRoNuURqs5F+5TquGkkjw2f//zKI08ESkXHM=
Received: by 10.236.180.38 with SMTP id i26mr5842395yhm.205.1306767303366;
	Mon, 30 May 2011 07:55:03 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.55.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:55:02 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:16 +0000
Message-Id: <1306767263-29895-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 10/17] initramfs-module-squashfs: port to new getarg API
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
X-List-Received-Date: Mon, 30 May 2011 14:58:11 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/initrdscripts/files/80-squashfs.sh         |   18 +++++++-----------
 .../initrdscripts/initramfs-module-squashfs_1.0.bb |    2 +-
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/recipes/initrdscripts/files/80-squashfs.sh b/recipes/initrdscripts/files/80-squashfs.sh
index 22c0954..6150bf9 100644
--- a/recipes/initrdscripts/files/80-squashfs.sh
+++ b/recipes/initrdscripts/files/80-squashfs.sh
@@ -1,17 +1,13 @@
 squashfs_mount () {
 	modprobe -q squashfs
 
-	mkdir $2
+	mkdir -p $2
 	mount -t squashfs $1 $2
 }
 
-for arg in $CMDLINE; do
-    optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
-    echo $arg xxx $optarg 
-    case $arg in
-        squashfs=*)
-        dev=`expr "$optarg" : '\([^:]*\).*'`
-        path=`expr "$optarg" : '[^:]*:\([^:]*\).*'`
-        squashfs_mount $dev $path ;;
-    esac
-done
+squashfs=$(getarg squashfs=)
+if [ -n "$squashfs" ]; then
+        dev=`expr "$squashfs" : '\([^:]*\).*'`
+        path=`expr "$squashfs" : '[^:]*:\([^:]*\).*'`
+        squashfs_mount $dev $path
+fi
diff --git a/recipes/initrdscripts/initramfs-module-squashfs_1.0.bb b/recipes/initrdscripts/initramfs-module-squashfs_1.0.bb
index fcf3f97..0309ba5 100644
--- a/recipes/initrdscripts/initramfs-module-squashfs_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-squashfs_1.0.bb
@@ -1,5 +1,5 @@
 SRC_URI = "file://80-squashfs.sh"
-PR = "r2"
+PR = "r3"
 DESCRIPTION = "An initramfs module for mount squashfs."
 RDEPENDS_${PN} = "initramfs-uniboot"
 
-- 
1.7.1



