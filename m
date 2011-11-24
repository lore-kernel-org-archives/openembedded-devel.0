Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTWVD-0003Ic-NS
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 11:25:59 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2756831faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TO59OeXsTcBDzCIgyGya4MGAMOxLlCY2Ke4GWL4y0nU=;
	b=ftkBFUBtOdQfh6a61u3Hv8/lbVjZRM55+oDHyJTagCvr5OkUzXRSlfgi04a3ETiv7p
	vOmCrl9fC0N5RHOWgCAXDhDa8wFa6A0lsmKRaL+QipgaCbXKi0NRxAh1hzlJePBibbha
	DarBq6jxZd20UyH7HbfzDjuxBxeieE/PZI45s=
Received: by 10.180.84.33 with SMTP id v1mr28132429wiy.4.1322129967533;
	Thu, 24 Nov 2011 02:19:27 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id em4sm23681456wbb.20.2011.11.24.02.19.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 02:19:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 11:18:44 +0100
Message-Id: <b74db718019c89794ce5665632b0c08e464bc98d.1322129758.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
References: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322129758.git.Martin.Jansa@gmail.com>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld 5/6] linux-git: move CMDLINE_DEBUG to linux-git.inc to be used also for linux-kexecboot
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
X-List-Received-Date: Thu, 24 Nov 2011 10:25:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-git.inc |    2 ++
 recipes-kernel/linux/linux_git.bb  |    1 -
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-git.inc b/recipes-kernel/linux/linux-git.inc
index 1e92e8d..4e7565e 100644
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



