Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4EB77204
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 17:06:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b187so14522227wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=M5wkV7i5kcD3C9RJt9ezaCCK6YtqT2ipQoPTGUhxrLA=;
	b=rPcG2vxmg7CcCiQshioHzGWpntSRyOAFbVk8TaGPb4V7VXoyIoQm+o1kKZQFvn6pcV
	qRT+2RV3WNINmhsbtuLIR/G6TTSAmjiLF9+68j9vEMYJvUYpBG8D+rnX+ZXeQrcFumzw
	q6M/rJhnmjH63W0uthyafg3NTIeMGA1aMXL9BBeuhDZCasSp4yen5O/OFXYaw+cfoChN
	ER5WnHK6eRL86gXlAiFar3ZpF2QM0f4zEbNTNd99vXJS1Z7KrfTxLAbbrhwwJmD0nK20
	eOprLtWp8Mn1hrSQ8mtMkuXfuGKyFjYAfMWs4qDE2BIpDDICBotY24oIyeqaRV6Uyjii
	/5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M5wkV7i5kcD3C9RJt9ezaCCK6YtqT2ipQoPTGUhxrLA=;
	b=UZJ9U0X7tYG/vAtepwrJYKk5qtn5WDKbvdi1jud61MILQk3B7XqfaU4E6R6o6ZAA8Z
	xT+P9GXyuMb7RAg7u/APqRDaweBaGK2XNFX6BiuweKXTwVY4CWolYP8ElzjUyZvccmxe
	ac2h8P55LWCXp/S6YWBtsLxZsB1n93uF46ncc/pd55xOTDoFlK+ceKNtbgmt7Ni8sDBl
	nnvkEFD5IYTWDQQJq+J78sZcQ3JjcLKRVPWTnZ3AxRh8L2FnX3hB0WdwWRXbLTDoGalX
	zFPkM4ZKOmzbTZ9bVrIp5/2H96s2FqWr+HkU9McH4058eyZUTHA8xnGy5nbdEbMwh2Jh
	yY1Q==
X-Gm-Message-State: AE9vXwN2AD557k0VstQITjEw5AOwGhCXQvHlDMv62EGWzA5OOYXAic0pXqAvcykZNicRoQ==
X-Received: by 10.194.107.69 with SMTP id ha5mr15604781wjb.100.1473700008629; 
	Mon, 12 Sep 2016 10:06:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	i195sm1121308wmg.14.2016.09.12.10.06.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Sep 2016 10:06:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Sep 2016 19:06:47 +0200
Message-Id: <20160912170647.14289-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-oe][meta-networking][PATCH] iscsitarget, netmap-moduls, vboxguestdrivers: Blacklist, not compatible with default kernel version 4.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Sep 2016 17:06:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb        | 3 +++
 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb            | 3 +++
 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb     | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index ba51c25..4b5622b 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -56,3 +56,6 @@ FILES_${PN} += "${sbindir} \
 
 RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
 RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
+
+# http://errors.yoctoproject.org/Errors/Details/83334/
+PNBLACKLIST[iscsitarget] ?= "BROKEN: not compatible with default kernel version 4.8"
diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 6544bb5..e9eea56 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -87,3 +87,6 @@ do_install () {
     cd ${S}/LINUX
     oe_runmake install
 }
+
+# http://errors.yoctoproject.org/Errors/Details/83335/
+PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default kernel version 4.8"
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
index 66068d1..1d1b1d8 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
@@ -63,3 +63,6 @@ FILES_${PN} = "${base_sbindir}"
 
 # autoload if installed
 KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
+
+# http://errors.yoctoproject.org/Errors/Details/83333/
+PNBLACKLIST[vboxguestdrivers] ?= "BROKEN: not compatible with default kernel version 4.8"
-- 
2.10.0


