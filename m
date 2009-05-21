Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJc-0005ca-LR
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:28 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805174fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Ig2+DmkX8fa9XH/s+fpvC5TWi0TvgbJqaTccNJn61AQ=;
	b=ZznW0SI0Jg7YKVOSfE47dcce+1/5spgaGIp/NP8r537GV8apuKlKiqwMN+Hkvj7oJu
	+tZjQFA1YqvWRCX//YnRVErehSXcc7tOMsKj8voNq8Cqyx3wGzD1jyuEd3oN3qT0WxkJ
	FmuZY38AcScvc3Yb+l0TVaD7JvBw4Ihova7oM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=doWiLUx14yensGwSvwhVDv1DySVMZ193G+0hP3bmOnFSbvlqGeNdtwRuz0EHEKRnMY
	7QH2Dqbf9v7+HK2set6QxuKJ9xALogI9sE9X3X/fdXABQCXtTt4oWgdeEl7wOuwurlrb
	FDhGakgxxz7FZjMyp80SW+68GpO6o6N9t/nJE=
Received: by 10.103.229.12 with SMTP id g12mr1080181mur.16.1242873597374;
	Wed, 20 May 2009 19:39:57 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id e10sm5481545muf.44.2009.05.20.19.39.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:53 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0CB6A6103C1; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:32 -0300
Message-Id: <1242873578-17444-18-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-17-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-15-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-16-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-17-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 17/23] initramfs-uniboot: properly setup sysfs and tmp
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
X-List-Received-Date: Thu, 21 May 2009 02:47:28 -0000

To make life easier for everybody it is nice to have early_setup to
avoid problems with mdev/udev usage. As a bonus, it also adds a /tmp
dir since some tools require it to exist and it won't hurt anyway.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/initrdscripts/files/init.sh            |    6 ++++--
 recipes/initrdscripts/initramfs-uniboot_1.0.bb |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/initrdscripts/files/init.sh b/recipes/initrdscripts/files/init.sh
index 221b8f5..26fd57f 100644
--- a/recipes/initrdscripts/files/init.sh
+++ b/recipes/initrdscripts/files/init.sh
@@ -5,9 +5,11 @@ BOOT_ROOT=
 ROOT_DEVICE=
 
 early_setup() {
-    mkdir /proc
+    mkdir -p /proc /sys /mnt /tmp
+
     mount -t proc proc /proc
-    mkdir /mnt
+    mount -t sysfs sysfs /sys
+
     modprobe -q mtdblock
 }
 
diff --git a/recipes/initrdscripts/initramfs-uniboot_1.0.bb b/recipes/initrdscripts/initramfs-uniboot_1.0.bb
index 07e94f1..fcbbdbd 100644
--- a/recipes/initrdscripts/initramfs-uniboot_1.0.bb
+++ b/recipes/initrdscripts/initramfs-uniboot_1.0.bb
@@ -1,5 +1,5 @@
 SRC_URI = "file://init.sh"
-PR = "r10"
+PR = "r11"
 DESCRIPTON = "A modular initramfs init script system."
 RRECOMMENDS = "kernel-module-mtdblock"
 
-- 
1.6.3.1.54.g99dd



