Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTWV4-0003Ic-T9
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 11:25:50 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2756831faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 02:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=14Uj/1JEuqy+75AvL+STIQ2olKDM2aA7LFi0eASRsWw=;
	b=qKEqyz/MwuVgCPaweOkunEzaO6hU36jmPUJXa4ZyjsYfhDbvNvAxdf4m1HT1cXVrjJ
	Q2q3ib7vplHP6M9CN+KphpI2j10gHrBKOcB93KHIeBw+LwRDzwgaqG9M61x25YSKhGs5
	DLLIjJgXuSbccWsFLsq/2e1sIbBGDk15tiERQ=
Received: by 10.180.4.167 with SMTP id l7mr28036100wil.51.1322129960134;
	Thu, 24 Nov 2011 02:19:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff1sm896877wbb.5.2011.11.24.02.19.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 02:19:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 11:18:43 +0100
Message-Id: <19b573f112f191ea9dd166e3be7edc8310725198.1322129758.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
References: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322129758.git.Martin.Jansa@gmail.com>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld 4/6] linux-kexecboot: don't disable DEBUG, PRINTK, BUG with CMDLINE_DEBUG not just loglevel=3
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
X-List-Received-Date: Thu, 24 Nov 2011 10:25:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot.inc |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/linux/linux-kexecboot.inc
index 83b7018..220bf36 100644
--- a/recipes-kernel/linux/linux-kexecboot.inc
+++ b/recipes-kernel/linux/linux-kexecboot.inc
@@ -108,9 +108,17 @@ do_configure_prepend() {
         kernel_conf_variable KEXEC y
         CONF_SED_SCRIPT="$CONF_SED_SCRIPT /=m/d;"
         kernel_conf_variable MODULES n
-        kernel_conf_variable DEBUG_ERRORS n
-        kernel_conf_variable DEBUG_BUGVERBOSE n
-        kernel_conf_variable DEBUG_KERNEL n
+        if [ "${CMDLINE_DEBUG}" = "loglevel=3" ] ; then
+                kernel_conf_variable DEBUG_ERRORS n
+                kernel_conf_variable DEBUG_BUGVERBOSE n
+                kernel_conf_variable DEBUG_KERNEL n
+	else
+                kernel_conf_variable PRINTK y
+                kernel_conf_variable BUG y
+                kernel_conf_variable DEBUG_ERRORS y
+                kernel_conf_variable DEBUG_BUGVERBOSE y
+                kernel_conf_variable DEBUG_KERNEL y
+	fi
 
         # Force lzma for arm kernels only
         if [ "${ARCH}" = "arm" ] ; then
-- 
1.7.8.rc3



