Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rlmjp-0003IY-4I
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 20:24:33 +0100
Received: by eekd17 with SMTP id d17so948061eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2012 11:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9N73lpDiLQWk23SvtLaUgYgbM/OqnvfkX1eZBAu8vow=;
	b=DBPIA4YIdFG0rUY1ZLKE67+nUysaZRu1ZtEUmzgPhDFyhebXlS7jOFgs//5uKWCUXZ
	Qr9/nJJuc2DYgqlJOmT8dwTstOGcEWsUS3bX7dS/4iksIwxTvEGwEZ5AKW19tEEmhkJJ
	AoHIviMerY0FFEB33NGA+a7pHN2J/DNLEjjBs=
Received: by 10.213.22.145 with SMTP id n17mr126533ebb.146.1326482220815;
	Fri, 13 Jan 2012 11:17:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm33161317eeb.3.2012.01.13.11.16.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jan 2012 11:17:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2012 20:16:43 +0100
Message-Id: <158fb7e8ec0ba46446bbaaafe4db40d61b7ce570.1326481985.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <36d21bdc2795818de1101033a97884849df7477c.1326481985.git.Martin.Jansa@gmail.com>
References: <36d21bdc2795818de1101033a97884849df7477c.1326481985.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326481985.git.Martin.Jansa@gmail.com>
References: <cover.1326481985.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 2/4] linux(-kexecboot)-git: upgrade to 3.2.0-rc7
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
X-List-Received-Date: Fri, 13 Jan 2012 19:24:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-git.inc          |    4 ++--
 recipes-kernel/linux/linux-kexecboot_git.bb |    2 ++
 recipes-kernel/linux/linux/spitz/defconfig  |    7 +++++++
 recipes-kernel/linux/linux_git.bb           |    2 ++
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-git.inc b/recipes-kernel/linux/linux-git.inc
index 66a6b9a..32a6d47 100644
--- a/recipes-kernel/linux/linux-git.inc
+++ b/recipes-kernel/linux/linux-git.inc
@@ -1,8 +1,8 @@
-KERNEL_RELEASE = "3.2.0-rc3"
+KERNEL_RELEASE = "3.2.0-rc7"
 OLD_KERNEL_RELEASE = "3.1.99"
 PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
 
-SRCREV = "caca6a03d365883564885f2c1da3e88dcf65d139"
+SRCREV = "371de6e4e0042adf4f9b54c414154f57414ddd37"
 
 CMDLINE_DEBUG = "debug"
 
diff --git a/recipes-kernel/linux/linux-kexecboot_git.bb b/recipes-kernel/linux/linux-kexecboot_git.bb
index 1e8c56f..5671b4f 100644
--- a/recipes-kernel/linux/linux-kexecboot_git.bb
+++ b/recipes-kernel/linux/linux-kexecboot_git.bb
@@ -1,2 +1,4 @@
 require linux-kexecboot.inc
 require linux-git.inc
+
+PR = "${INC_PR}.0"
diff --git a/recipes-kernel/linux/linux/spitz/defconfig b/recipes-kernel/linux/linux/spitz/defconfig
index 90d49e9..dd1c0f5 100644
--- a/recipes-kernel/linux/linux/spitz/defconfig
+++ b/recipes-kernel/linux/linux/spitz/defconfig
@@ -6,6 +6,13 @@ CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_IKCONFIG=m
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_RESOURCE_COUNTERS=y
+CONFIG_CGROUP_SCHED=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
diff --git a/recipes-kernel/linux/linux_git.bb b/recipes-kernel/linux/linux_git.bb
index 256ee0e..620c4e4 100644
--- a/recipes-kernel/linux/linux_git.bb
+++ b/recipes-kernel/linux/linux_git.bb
@@ -1,6 +1,8 @@
 require linux.inc
 require linux-git.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI_append_akita = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_c7x0 = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_collie = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
-- 
1.7.8.3



