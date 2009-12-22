Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NMuST-0003uH-5E
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 03:26:48 +0100
Received: by ywh26 with SMTP id 26so5751758ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 18:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=35vaSVmO/2dY287DRvNnGPOjdkaDitMNXmVLfGhYPE4=;
	b=JrdW/8yKZ57+nUx5YADeTvkAwg3myAA0fwV2AlENPj4kx5M7AqQQlXyXvwEp6Obunv
	8XzMef5j1gCR5yWL/6+mJYZSsQH4dh4FY/2AyqXSdwqmKdsU3uSpWLZdd2QUlaiDl8ZO
	43BCvsKQEV+OsovKUsXq4RJTDDgU/M5UxGGxY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MgYZylvETuvdiQMatsIoUOo9vVvk9zPsQtY+mInkA9M+rVWlovde3bm0oL4MTMLrg5
	OCxHQGfGuvn+U9FsveDjulhPzvadD8WXwElGjcn/Qg0T8rJZ0T9F67Sr3cMeu1++R0kj
	12k2KqBi7jEYReP6sjWN3ShGDpWWnsC3rWn9M=
Received: by 10.150.44.27 with SMTP id r27mr12373360ybr.263.1261448692888;
	Mon, 21 Dec 2009 18:24:52 -0800 (PST)
Received: from localhost ([123.162.69.206])
	by mx.google.com with ESMTPS id 4sm2235129ywg.58.2009.12.21.18.24.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 21 Dec 2009 18:24:51 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Dec 2009 10:24:39 +0800
Message-Id: <1261448680-12334-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Modify distro/minimal.conf to use glibc and add an eglibc-based minimal distribution
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
X-List-Received-Date: Tue, 22 Dec 2009 02:26:48 -0000

1. conf/distro/minimal-eglibc.conf: add minimal distribution based on eglibc.
2. conf/distro/minimal.conf: use glibc instead of eglibc
---
 conf/distro/minimal-eglibc.conf |   41 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 conf/distro/minimal-eglibc.conf

diff --git a/conf/distro/minimal-eglibc.conf b/conf/distro/minimal-eglibc.conf
new file mode 100644
index 0000000..5ab275b
--- /dev/null
+++ b/conf/distro/minimal-eglibc.conf
@@ -0,0 +1,41 @@
+#-----------------------------------------------------------------------------
+#@TYPE: Distribution
+#@NAME: Minimal uClibc
+#@DESCRIPTION: uClibc based Embedded Linux Distribution Configuration (minimal)
+#
+#@COMMENT: This distribution configuration serves as a starting point for
+#@COMMENT: the integration of new target platforms, machines, or distributions.
+#@COMMENT: It bases on conservative settings and should always be buildable.
+#-----------------------------------------------------------------------------
+
+#
+# Header
+#
+DISTRO_NAME = "minimal-eglibc"
+
+TARGET_FPU_arm = "soft"
+TARGET_FPU_armeb = "soft"
+
+LIBC = "eglibc"
+
+require conf/distro/minimal.conf
+
+# NOTE:
+#
+# We get the DISTRO_FEATURES defined in minimal.conf here but
+# however there are some features like mips -mplt support which
+# is not supported on uclibc yet so we need to disable that
+# feature for uclibc based distributions, therefore we redefine
+# the DISTRO_FEATURES for minimal-uclibc and notably leave mplt
+# out. Make sure that if there is a new DISTRO_FEATURE thats added
+# to minimal.conf will not get included in minimal-uclibc.conf
+# it has to be added to the below selection if it should also be
+# enabled for minimal-uclibc
+
+# FEATURE SELECTION
+#############################################################################
+# We want images supporting the following features (for task-base)
+DISTRO_FEATURES = "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget usbhost pci"
+# Following features are for ARM and E500 based machines
+DISTRO_FEATURES += "eabi"
+
-- 
1.5.4.3



