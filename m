Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3v4-00083s-24
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:14 +0200
Received: by mail-yi0-f47.google.com with SMTP id 13so1568954yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=nc7/vTq2ScJ4AkIc+l+fFDM1zspmpLJOgDrRgdeAaZc=;
	b=uyFTv5Sbb1pydOrCQioYk1SktqitFpVvckYOUH+gHR8Xbs8DlDISv0jixR6EXqS+9j
	Rjy8/7H07RCWe8RYhxDMc8mDFpBTG0a7N5LpTO1spH1/fISalWCUz95aldeHCxTi4Oei
	unR+eBWZ4fbHrerDb6nkGSLr0h1fL08+qqFf0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=uh5K2V1VuLNbFNpQXpFCKCXCryqIe3xupN+PTvfsqD/mgil/Swed3cCw3DSqqP9oHg
	VYfgCouM0/oIq6Hy33AhP7CdFTrQ0a/57iJdbNhGXit9OdlzeQ5DOdYWAvKpU5xeN79c
	0SSZJuuYZZ0w25gQNb4GYHA/ER6NrPTuKs2io=
Received: by 10.236.108.170 with SMTP id q30mr6018149yhg.12.1306767307786;
	Mon, 30 May 2011 07:55:07 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.55.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:55:06 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:18 +0000
Message-Id: <1306767263-29895-13-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 12/17] initramfs-module-block: use info method from uniboot
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
X-List-Received-Date: Mon, 30 May 2011 14:58:15 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/initrdscripts/files/85-blockboot.sh        |    2 +-
 .../initrdscripts/initramfs-module-block_1.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/initrdscripts/files/85-blockboot.sh b/recipes/initrdscripts/files/85-blockboot.sh
index e1c3ed8..7841ac6 100644
--- a/recipes/initrdscripts/files/85-blockboot.sh
+++ b/recipes/initrdscripts/files/85-blockboot.sh
@@ -2,7 +2,7 @@
 # Allow booting from a normal block device.
 
 if [ -e "$ROOT_DEVICE" ]; then
-    echo "booting from: $ROOT_DEVICE"
+    info "booting from: $ROOT_DEVICE"
     type=""
     if [ -n "$ROOT_FSTYPE" ]; then
 	type="-t $ROOT_FSTYPE"
diff --git a/recipes/initrdscripts/initramfs-module-block_1.0.bb b/recipes/initrdscripts/initramfs-module-block_1.0.bb
index 5d4c846..f7834f0 100644
--- a/recipes/initrdscripts/initramfs-module-block_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-block_1.0.bb
@@ -1,5 +1,5 @@
 SRC_URI = "file://85-blockboot.sh"
-PR = "r4"
+PR = "r5"
 RDEPENDS_${PN} = "initramfs-uniboot"
 DESCRIPTION = "An initramfs module for booting off normal block devices."
 
-- 
1.7.1



