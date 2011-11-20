Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RS4R5-00079t-5b
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Nov 2011 11:15:43 +0100
Received: by faat2 with SMTP id t2so5435608faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2011 02:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Cc4nb5yvFiwDAHRoQWPAOZPSuSjcysoT5T5ow79TLSc=;
	b=SHpRwGu64UMltex21b6/Zi0/SaS7JquzUwkwXFC8wvVa7OYt/Em0LnZtv7S39wVDAp
	VWbTueJIiWN3ZNgzz7gKCrfcNoD92yXEUMuAsh/v6VtdNeMUcWPE9IntiRVRNG9lI70R
	OVGqmB6SmFvFtNaoMnlvmdrj0Rgc/Y7fch5lc=
Received: by 10.152.105.67 with SMTP id gk3mr6252371lab.48.1321783624859;
	Sun, 20 Nov 2011 02:07:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id po16sm6100547lab.2.2011.11.20.02.07.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Nov 2011 02:07:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Nov 2011 11:06:40 +0100
Message-Id: <1321783600-23772-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <1321783600-23772-1-git-send-email-Martin.Jansa@gmail.com>
References: <1321783600-23772-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-handheld 2/2] linux-git: move CMDLINE_DEBUG to linux-git.inc to be used also for linux-kexecboot
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
X-List-Received-Date: Sun, 20 Nov 2011 10:15:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-git.inc |    2 ++
 recipes-kernel/linux/linux_git.bb  |    1 -
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-git.inc b/recipes-kernel/linux/linux-git.inc
index 84f09f5..4367ae8 100644
--- a/recipes-kernel/linux/linux-git.inc
+++ b/recipes-kernel/linux/linux-git.inc
@@ -4,6 +4,8 @@ PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
 
 SRCREV = "65112dccf8a113737684366349d7f9ec373ddc47"
 
+CMDLINE_DEBUG = "debug"
+
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;branch=master \
            file://defconfig"
 S = "${WORKDIR}/git"
diff --git a/recipes-kernel/linux/linux_git.bb b/recipes-kernel/linux/linux_git.bb
index fbe3049..256ee0e 100644
--- a/recipes-kernel/linux/linux_git.bb
+++ b/recipes-kernel/linux/linux_git.bb
@@ -1,4 +1,3 @@
-CMDLINE_DEBUG = "debug"
 require linux.inc
 require linux-git.inc
 
-- 
1.7.8.rc3



