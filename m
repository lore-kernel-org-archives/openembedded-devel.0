Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9T2-00053y-Ao
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:46:12 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so871094fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Dv2udE3WX2b2gJTc+I7tMiAryDk6aDO32gj8//sHzL4=;
	b=xBJujlZYmMAQ2nu/oKkk8XXwtmRPTL4hSoOQZPx78HREiPxTCB1HvIpVUEpC2G3gLg
	nYWV1ATQFbxYrfFncHUE88tAIgSq44ERZBvxROvYAHRojphg1Y2/vRW55rY+I481ASEg
	9avLN3vz34nPw7A8uZc314+5n9p9f5pSQN9X4=
Received: by 10.223.28.89 with SMTP id l25mr532047fac.34.1314891678870;
	Thu, 01 Sep 2011 08:41:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b14sm126955fab.19.2011.09.01.08.41.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:41:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:39:13 +0200
Message-Id: <d08481ee7933956729e8a2cc2795485e33c256a4.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 06/10] initramfs-kexecboot.inc: import missing file from meta-zaurus
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
X-List-Received-Date: Thu, 01 Sep 2011 15:46:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/machine/include/initramfs-kexecboot.inc |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/include/initramfs-kexecboot.inc

diff --git a/conf/machine/include/initramfs-kexecboot.inc b/conf/machine/include/initramfs-kexecboot.inc
new file mode 100644
index 0000000..bc9cd51
--- /dev/null
+++ b/conf/machine/include/initramfs-kexecboot.inc
@@ -0,0 +1,18 @@
+# Initramfs-kexecboot extra config
+
+
+# If set here, each image will also build linux-kexecboot.
+# Usually the machine-installer recipe already DEPENDS on it
+#
+EXTRA_IMAGEDEPENDS += "linux-kexecboot"
+
+
+# Force inclusion of kernel in target images
+# (done by default)
+#
+RDEPENDS_kernel-base = "kernel-image"
+
+
+# Install /boot/boot.cfg in target images
+#
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS_append = " kexecboot-cfg "
-- 
1.7.6.1



