Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0627D86E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 07:06:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 7so2251079wmo.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 00:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r26rA52NKkfvQAu/ADyXd8dMVO/E6J/BcF9tW8mbs3M=;
	b=bbiaFHoJTqtgFe0qw/QbQsy88I4vRkSBPQFEXJtf7NSwv0vPkYHdcyNYZ1+Z/amiMv
	EcSDUdZZp+0fBZca0tRYbqRWcBC7zvSp0SwZlYNVMS1GN56x2WxhgdtyObv+m1xcxkdb
	NXzZ6Sn041YJqmN4Lvbysxq4wR4lkJmbeDDa5u0iJRFPB2Cd32jjiEhtnjyNUH2K2Yl7
	F2LN/L/QvSs0Xcbf8zDgCl4ZKJ0mrxAWyhqB2k6c0SkpruKm0O9h8+mczawCh48wWAsL
	k0BBM3L+s562kfjuuftn0nLaRolKEcRLxXDiXgsRPyoerR9cDOthAgw2P1tmuz6WsoJC
	C2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r26rA52NKkfvQAu/ADyXd8dMVO/E6J/BcF9tW8mbs3M=;
	b=Wc+uLsLWDHT6APZnfDnk0a/WvKovHW6bgFCtqo51i0B6Nu6z7IGQFMsxD6Ha9Z9lx3
	1rO4AFShXw9Kr4wGiGAwnLmsG3shHiIgy0GxSl7exf12SF9a2OgYrYdGsTmIrT+a1pyD
	19hs8w0/zSb1PtT5z5q5a508tP8TJrDHu4cXuH46nIDYSGlHUJWhlnEhJzkgApQIRXBq
	CekodTjOJ2aRGk/sxCI9m2qebL0NgC54AMa2HryyjKIfy6QpDPdiLB+xobbAbSWF8pEV
	fgR656HLoHDdB+JYT4M1mNkuzsHjdBgXPU0Q6NN3t/fGUb16OqYsD1hHhsDnstikotql
	fLgg==
X-Gm-Message-State: APjAAAUiSCr6UqZ0PA9WnOgRtSfXFHxOtEbrzIzGguBUJR5EJnkUGtj2
	UPn9Fa0Ey4mg/XiYDjVWsPIReYGH
X-Google-Smtp-Source: APXvYqyEwTgEzDl72wZT+cOVeNpfcW/WgheufbSq0juoDP5KaVP7VwJqpWIpbAwjXAB3Qr0ls3dMQg==
X-Received: by 2002:a1c:414:: with SMTP id 20mr24977006wme.84.1557990388974;
	Thu, 16 May 2019 00:06:28 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 7sm5187185wro.85.2019.05.16.00.06.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 00:06:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2019 07:06:23 +0000
Message-Id: <20190516070624.27975-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516070624.27975-1-Martin.Jansa@gmail.com>
References: <20190516070624.27975-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] ndctl: make MACHINE_ARCH and ignore from libblockdev
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
X-List-Received-Date: Thu, 16 May 2019 07:06:28 -0000

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
index 31f2f17fc8..507ac50eca 100644
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


