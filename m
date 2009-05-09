Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arl-0000U7-0a
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:37 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1075455ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=VxuGMvaMaW8XUm7AFfvvPKDzlrgGtBjXSL+PAf/lmuo=;
	b=uk006R+ACTKVxaGFOxv/eKdRk+d6CsSzSvhR4t32vCytnt6TFgHurPz3x4BBAtlySY
	Q6DBKYWjOA78V1QZrZS0NhUVy8hUTmlWkx1GpOYS5F/3jTHySXeJQ8SFlonljT6EIuah
	ukysiDh2igIDHVbIc9SQcTlZbdto0ETu7ZXqE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=igrB8M349Xo0zIyZgM6JokUHj0p6bsDMka3qVrkHfB0twMVPq+hBRWfEuu0MxopmjB
	yLImw0Vb1C4ks/l0xxF/MP3/IA0bndzxjxCd4+2WSFjlxv8VCJGmP0NAZ3VLC+bcHQ13
	l2hsRqXwCirb1pERThLfrfOjqc5KP6uwzObms=
Received: by 10.100.92.2 with SMTP id p2mr10208899anb.7.1241830221882;
	Fri, 08 May 2009 17:50:21 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm1648889ywi.38.2009.05.08.17.50.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0499C6101A3; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:35 -0300
Message-Id: <1241830239-5594-20-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-19-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-14-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-15-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-16-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-17-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-18-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-19-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 19/23] initramfs-uniboot: properly setup sysfs and tmp
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
X-List-Received-Date: Sat, 09 May 2009 00:56:37 -0000

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
1.6.3.rc1.51.gea0b7



