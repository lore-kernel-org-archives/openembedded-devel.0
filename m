Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id D0AE87E87E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:33 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id 19so3340635pfa.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xuKDgfqBiJuB8lwRLZGCP9+2aIbKtDR0jTp2nPNGYDU=;
	b=cX9IRXPiimT/T4U+PV51YwuxTLzgAuljvR8pzbgaU5g69J1yzbTpc2GubuviZ7LsFD
	jxTA+vILa9wKISvPXF7XDZmr+HLvnLeGv1IqsgSDqNjAuMzaL59DwXQAe+N/nVrrn7l8
	r5UGs27+U3x6w4Wdf8C7KQSMHS2OZU3lptKZ8RHm67s3shyufozyP/w8vvDkUAjpIQIA
	OajL8O6fbxSC9bDfwZEU4B/c6YCzjNNtjkMgfWnl2dGu49eb5XjKnPcqthOA2aE83F3H
	LIBBk6oEF4qlgcUK+O7l3rmJW2PKdwUkPcCrz/5p1eLzA0FMbXDpvp4tn627nxiLMNzP
	MbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xuKDgfqBiJuB8lwRLZGCP9+2aIbKtDR0jTp2nPNGYDU=;
	b=CA3v7ddy8P8d0L4egznjOxnFV6y0pORdRLOHXNvEp91ai3GjP5FgM8rgtnpORABHDS
	0xXmtZ+IHWfTqWsW5F+5qNg1RGYwPPjWYhE3suSOVyeEM6ih4m3pB3klkA3YQLxjNdgj
	b4cHESMqpE9WZNioT52uPT4WImkqMdWtbIyy44H0CnRtWLvMvv+DHq9Gqr1Wlctar1Ox
	rRtXAl5khfue0jobnPgSp44dHa34C2GKTjFpQWgbi7dDxs05EowdrY5rUZFbyGKTrxFk
	W1eJcgvnGI+Knvw0DUsAH58VpnETY++kZyHyN+fPryCmHCYtUK0DDsE1eYyPgPU6M2of
	aavw==
X-Gm-Message-State: APjAAAX5ReSdE+fcjhA03S0cx8FJPu4djdh+rW/cpcVB532ChCD1P6ks
	VP+MZTrslOojlO9TP1zB6xYiSEe7
X-Google-Smtp-Source: APXvYqy4b7FLwtBYHhXPIs554LRj3boACdoRqOJGO2E+/BApCWIS7j92wGfh1FZKvl8OhMgNj0KMuA==
X-Received: by 2002:a63:c60b:: with SMTP id w11mr590720pgg.356.1560621454601; 
	Sat, 15 Jun 2019 10:57:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:06 -0700
Message-Id: <08c5b09a1add97bb5dbe993fdffdd0aebd09bcc3.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 02/23] ndctl: make MACHINE_ARCH and ignore from libblockdev
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:34 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/conf/layer.conf                 | 6 ++++++
 meta-oe/recipes-core/ndctl/ndctl_v63.bb | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bc90390..c7dbbc1 100644
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
index 1f3abf5..61e5302 100644
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
2.7.4


