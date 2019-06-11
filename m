Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 951977E651
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:08 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d18so13845849wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uT4bKN+kTc3IjdkTKTzSkbOLRZ8xEAtKVHRzPskt86A=;
	b=VeM4nzxXe1c3xB0Z97vPk7VH1398FNhKTWXidSIdw+q7/xz0Gx/ytvlT2yVQVKE6iq
	au6t7wVqmNuBCxC5qLnZJ02ZJcnrjT72A9HMjJZahRa0DIAxo/VJ/fqhmWjSpMq+bdFM
	kwTkkxsNSwzGWGWrSpTfxVu4LbfjHgYbZxrr8LFGa3UZTCKhDC1QpOUtkA51/5RPclIw
	QVAtWzOxXsJY0KY2o82LcDnFA5vrghGA0dCUvEMaiNxDsvfs64bPrIDWGxDIB9Y+ZNfQ
	E5P9fChnDQkXVHFoECojyYZmq8BlPNSmbEw1gFbh/JEO5eNNRtZBxGgsMGFDieDrBwNu
	5zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uT4bKN+kTc3IjdkTKTzSkbOLRZ8xEAtKVHRzPskt86A=;
	b=i3xsT23kAZU0p2LLLi4svB3j6MfrJ72VuBnv1Qoim7Lv3iNVwKdE8HPlEimtPRK//g
	yvrtrM+QT0UH33slS6ngg/vztihb5RENuyAGvXjK8BmwbuI863cXX+WMGbIOY0TJBny3
	jnLWGli/ROPGLT/xGEa3OZ/d+LQTRxPLpOdr6tXYc5sbYRoXkzERYRPdAar6hGssijeO
	0FYIEzi6+IbRHQc+uSL05rF+dCwuJ6e8FIBGkFiAn22BJHFOqCARuEZqLItyBqIE63aH
	a6IvC6ou6nwyGSawGv4u0/p0wNxn933MsbJK4CnBBZ0gb4DnlUR/QWhvK5E0Nqgqm7X/
	WzuQ==
X-Gm-Message-State: APjAAAXjwMWtfPJMhT0cv0eSw+Us+t6MaGeWC3UHd0L+gh44qd7MiNqZ
	vFYak0Kbj3CNaWrPNxV3Vx+g0179
X-Google-Smtp-Source: APXvYqzSCgxHs9/7/U8v6UUK8Uh7vrCgikWZoSlGvOIElPynZKlycg07BaU+72OFnwufp6VTZpUWWw==
X-Received: by 2002:adf:ee4a:: with SMTP id w10mr925094wro.311.1560272109021; 
	Tue, 11 Jun 2019 09:55:09 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	h14sm9416581wrs.66.2019.06.11.09.55.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:54:55 +0000
Message-Id: <20190611165504.23049-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 02/11] ndctl: make MACHINE_ARCH and ignore from libblockdev
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:08 -0000

* fixes:
ERROR: libblockdev different signature for task do_configure.sigdata between hammerhead and mako
Hash for dependent task libblockdev/libblockdev_2.20.bb.do_prepare_recipe_sysroot changed from bee357e6fd2c8479c9dbf9ccef6f30c416df1eb608b53a775383069a4215286b to 23a2ff7864fbd6d38b77918829651cff8d009702894ee670fab145c520d05be8
Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb.do_prepare_recipe_sysroot with hashes bee357e6fd2c8479c9dbf9ccef6f30c416df1eb608b53a775383069a4215286b or 23a2ff7864fbd6d38b77918829651cff8d009702894ee670fab145c520d05be8

ERROR: ndctl different signature for task do_configure.sigdata between hammerhead and mako
Hash for dependent task ndctl/ndctl_v63.bb.do_prepare_recipe_sysroot changed from ea34e9d64a9f30c3ed898bd3850e43e95297dacc560732e1d6bdfa961a6b357b to f886d72844b05c99cd241b8402d760d2c02e0264bfc66503d1e8742815463b3c
Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-oe/recipes-core/ndctl/ndctl_v63.bb.do_prepare_recipe_sysroot with hashes ea34e9d64a9f30c3ed898bd3850e43e95297dacc560732e1d6bdfa961a6b357b or f886d72844b05c99cd241b8402d760d2c02e0264bfc66503d1e8742815463b3c

$ bitbake-diffsigs /OE/build/luneos-master/webos-ports/tmp-glibc/sstate-diff/1557963509/[hm]*/*/ndctl/*do_prepare*.sigdata*
runtaskdeps changed:
['autoconf/autoconf_2.69.bb.do_populate_sysroot:virtual:native automake/automake_1.16.1.bb.do_populate_sysroot:virtual:native bash-completion/bash-completion_2.8.bb.do_populate_sysroot gcc/gcc-cross_7.3.bb.do_populate_sysroot gcc/gcc-runtime_7.3.bb.do_populate_sysroot glibc/glibc_2.29.bb.do_populate_sysroot gnu-config/gnu-config_git.bb.do_populate_sysroot:virtual:native json-c/json-c_0.13.1.bb.do_populate_sysroot kmod/kmod_git.bb.do_populate_sysroot libtool/libtool-cross_2.4.6.bb.do_populate_sysroot libtool/libtool-native_2.4.6.bb.do_populate_sysroot', -linux/linux-lg-hammerhead_git.bb.do_populate_sysroot, +linux/linux-lg-mako_git.bb.do_populate_sysroot, 'ndctl/ndctl_v63.bb.do_fetch pkgconfig/pkgconfig_git.bb.do_populate_sysroot:virtual:native systemd/systemd-systemctl-native.bb.do_populate_sysroot systemd/systemd_242.bb.do_populate_sysroot']
linux/linux-lg-hammerhead_git.bb.do_populate_sysroot with hash e58e94601af73831ea51ca6cc18578c26b9b491bcadb82a2c590b22498447438
 changed to
linux/linux-lg-mako_git.bb.do_populate_sysroot with hash 4c7372d0063be9d5c96bfad20a2052ded3a7121a06027c21a75e79a4f6a678e3
Dependency on task linux/linux-lg-mako_git.bb.do_populate_sysroot was added with hash 4c7372d0063be9d5c96bfad20a2052ded3a7121a06027c21a75e79a4f6a678e3
Dependency on task linux/linux-lg-hammerhead_git.bb.do_populate_sysroot was removed with hash e58e94601af73831ea51ca6cc18578c26b9b491bcadb82a2c590b22498447438

$ bitbake-diffsigs /OE/build/luneos-master/webos-ports/tmp-glibc/sstate-diff/1557963509/[hm]*/*/libblockdev/*do_prepare*.sigdata*
Hash for dependent task ndctl/ndctl_v63.bb.do_populate_sysroot changed from 0d123eb0e330a9e34d199eb012da9ae2eb614063f9412725ef39a06b152341f1 to 40077996bc35ac047210928559ad692f4eb20e37b07ef675bf49c9c39c46fe1e
Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-oe/recipes-core/ndctl/ndctl_v63.bb.do_populate_sysroot with hashes 0d123eb0e330a9e34d199eb012da9ae2eb614063f9412725ef39a06b152341f1 or 40077996bc35ac047210928559ad692f4eb20e37b07ef675bf49c9c39c46fe1e

as detected with:
openembedded-core/scripts/sstate-diff-machines.sh --targets=world --tmpdir=tmp-glibc/ --analyze --machines="hammerhead mako qemux86"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf                 | 6 ++++++
 meta-oe/recipes-core/ndctl/ndctl_v63.bb | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bc9039041d..c7dbbc1073 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -51,6 +51,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phoronix-test-suite->php \
 "
 
+# Depends on ndctl (through nvdimm PACKAGECONFIG) which depends on MACHINE_ARCH kernel
+# and making libblockdev MACHINE_ARCH is not an option as python3-blivet, udisks2, gvfs
+# would be MACHINE_ARCH as well
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  libblockdev->ndctl \
+"
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   terminus-font->fontconfig \
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
index 1f3abf5143..61e53029b3 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
@@ -19,6 +19,9 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
 
+# Depends on MACHINE_ARCH kernel
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd, systemd"
 
-- 
2.17.1


