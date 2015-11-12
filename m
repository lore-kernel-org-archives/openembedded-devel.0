Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A0FCF77234
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:38:27 +0000 (UTC)
Received: by wmww144 with SMTP id w144so93839374wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 07:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FeeIwRVfZWugHOWQVW5nNCZpxx/2yA83VVObV9C0tAY=;
	b=Ko/2TzZHemn77wcsd2P/k4rnhHvywtxJizXKt0lvb75WEEJY1pi5rReceXmgCPdwD0
	o7GKZ2OpPSb+kHd6Pfh6kEKaIwClnj0kq/in/h0bCFGhyGUFjhvolOl69PRqfVPxVYIP
	4LPY7gxAdsxpRrpIKGhR6Gvvgv2iqpbxqjRnX7Gimnp3//O+jGlhZk+3t9VB2PK6NDZM
	gaGB98FQS6YraAq1ttxX0aB+DHcVzo/3OBH+JEUGwJTx+Xv9ZKyzmOg9afpiAf/G03Un
	kF5Pv+hM+ZX590vhE0DR6iK8A3Mqw5qiu0neIKBzVqjsFbSEN8nSjCh6D9CRTfjI3Vom
	dZeQ==
X-Received: by 10.28.139.143 with SMTP id n137mr17211979wmd.8.1447342706480;
	Thu, 12 Nov 2015 07:38:26 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l81sm15628422wmb.2.2015.11.12.07.38.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 07:38:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:38:41 +0100
Message-Id: <1447342721-8825-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-initramfs] dracut: exclude kernel-modules dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 15:38:30 -0000

* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: dracut different signature for task do_package_write_ipk.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['bash-completionbash-completion_2.1.bb.do_packagedata', 'bashbash_4.3.30.bb.do_packagedata', 'busyboxbusybox_1.23.2.bb.do_packagedata', 'coreutilscoreutils_8.24.bb.do_packagedata', 'cpiocpio_2.11.bb.do_packagedata', 'dracutdracut_git.bb.do_package', 'dracutdracut_git.bb.do_packagedata', 'findutilsfindutils_4.5.14.bb.do_packagedata', 'glibcglibc_2.22.bb.do_packagedata', 'linuxlinux-yocto_4.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'systemdsystemd_225.bb.do_packagedata', 'util-linuxutil-linux_2.26.2.bb.do_packagedata']
to
['bash-completionbash-completion_2.1.bb.do_packagedata', 'bashbash_4.3.30.bb.do_packagedata', 'busyboxbusybox_1.23.2.bb.do_packagedata', 'coreutilscoreutils_8.24.bb.do_packagedata', 'cpiocpio_2.11.bb.do_packagedata', 'dracutdracut_git.bb.do_package', 'dracutdracut_git.bb.do_packagedata', 'findutilsfindutils_4.5.14.bb.do_packagedata', 'glibcglibc_2.22.bb.do_packagedata', 'linuxlinux-yocto_4.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'systemdsystemd_225.bb.do_packagedata', 'util-linuxutil-linux_2.26.2.bb.do_packagedata']
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_packagedata with hash a98b79faed8b6633269560af1add43a5
 changed to
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_packagedata with hash 15962f296d6961232d7350368c604464
Hash for dependent task linuxlinux-yocto_4.1.bb.do_packagedata changed from a98b79faed8b6633269560af1add43a5 to 15962f296d6961232d7350368c604464

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-initramfs/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 0026e04..dbee702 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -15,3 +15,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  dracut->kernel-modules \
+"
-- 
2.6.3


