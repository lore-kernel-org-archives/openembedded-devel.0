Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BB8E377343
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 16:38:43 +0000 (UTC)
Received: by wmec201 with SMTP id c201so89923368wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BL9RZjEUNieEMSWYsEfVmJ0QugYQaUEsPfab0ILOvTI=;
	b=UUoeGW+R0qScOEerHdraQ9115lt2pP57EvSnJqiZZCqmX/1yjxBo1ypC2IkfVDzkKp
	/Ejug3lbs1SQ4ukIokWdH2lOPAz5PTt3Z9wKZ42urI5+bAmPiQzHmwqnMA59tNtR7oHJ
	TlhC8gf7kcHKtzMtgvXhR2d4/VOd86xn3POtUMmWEYgdFY1CX//qwJGdt32odXswjrwa
	B/OYh8Ur0uUMOClSDcSvhIeoTl9H0MPr5yJ7qz3amgJmjTf015tKRduHDQYqa2PGfsqU
	C/dMy0qpppEWn1wnvazVh2NV0SSZAImzoVDCXcSirs8SJYuAWjRhegUDsOC8acbkRPI/
	suvg==
X-Received: by 10.194.209.195 with SMTP id mo3mr22743648wjc.16.1447432723062; 
	Fri, 13 Nov 2015 08:38:43 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lx4sm12313275wjb.5.2015.11.13.08.38.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 08:38:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Nov 2015 17:39:01 +0100
Message-Id: <1447432741-8986-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447432741-8986-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447432741-8986-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-initramfs 2/2] dracut: exclude kernel-modules dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Fri, 13 Nov 2015 16:38:46 -0000

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
index 0026e04..d9b7c4c 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -15,3 +15,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  dracut->virtual/kernel \
+"
-- 
2.6.3


