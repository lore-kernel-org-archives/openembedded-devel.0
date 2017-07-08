Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4AFE7780B8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:17:59 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id q85so29310919pfq.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PXci5+i79cc5hFPTzTU8NUP2u/AKjAxjan+5s3FAk7g=;
	b=oAmdwIpxvwgPyCvVN/A27eRtukmA7cORdubgcHdWZtBKuu6EohRkaHeopBYT3Uq5r8
	FbudWskNc357o0f5Ntlr2Oz9yDvhPF/qeLF+loNLOTx4is9//K68LfOpV8ay8bCNRYQh
	5NIatGezsBjoTGJerYrmnyzpMaDLfoshUnphUpvK8/pigQps/0dZQ09g/2Tqgfhb+RUr
	6nDd6JxYkm7fVs3jh0NqGVtge4NabswSWEDdSW1AtW5EzyW6CL8OK0bHNXhWag3HiJfB
	xd83bG34L84xSvn84lTtK0XdgdU3QvW4eiAEznjtwZ1Txo/1TVU/C+ZXp2qnNsCxr0VM
	9GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PXci5+i79cc5hFPTzTU8NUP2u/AKjAxjan+5s3FAk7g=;
	b=g23AkMgb3XgGc57+bzvDCrtfQcqq6s2FVJ0+Ws3ylzL3gM3t5Wpnen9UNv/KV7gXKY
	zlzD5ZZeCjf9PrLTWa3H/trCkwvxLKpzuAag9NsG9SLavY7wlwm50MydQSoq2rym9USd
	9A+0Yq3JLo9ziQYBpqZAYPpa0/lN3i28zIEYk3hPRAAQzwy2ijsBDol8sfnwcYltPzp5
	djTWYAXjn6UdHDsTN1rByE4rv0tKfBKvImOyK+/bdEpXNgHL3MIHdTBOqVASfjpb3RQv
	4kcU6eZfwJ4jDDmAZU7hEn8+bU1xSgT/WCnZMx6UMcQoiNSeUkHEzI/wmeLGVDY/5wjL
	JiVg==
X-Gm-Message-State: AIVw113Vnv3vpiSC4UMJr902FNv5TDbdCkDVxTsulTmBP2rjDcJFNO2D
	/D7nUUv6Rw6AdGqO
X-Received: by 10.99.9.69 with SMTP id 66mr6283228pgj.178.1499519881034;
	Sat, 08 Jul 2017 06:18:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	o73sm13277185pfi.2.2017.07.08.06.17.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:18:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:17:41 -0700
Message-Id: <20170708131744.33927-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170708131744.33927-1-raj.khem@gmail.com>
References: <20170708131744.33927-1-raj.khem@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 2/5] security_flags.inc: Delete
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
X-List-Received-Date: Sat, 08 Jul 2017 13:18:00 -0000

OE-Core has now reworked the PIE flags, where they
are implicitly passed by compiler when security flags are enabled

None of these pinnings are needed anymore, since these packages
compile fine with security flags enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../include/meta_networking_security_flags.inc     | 10 --------
 meta-networking/conf/layer.conf                    |  3 ---
 .../conf/distro/include/meta_oe_security_flags.inc | 28 ----------------------
 meta-oe/conf/layer.conf                            |  3 ---
 4 files changed, 44 deletions(-)
 delete mode 100644 meta-networking/conf/distro/include/meta_networking_security_flags.inc
 delete mode 100644 meta-oe/conf/distro/include/meta_oe_security_flags.inc

diff --git a/meta-networking/conf/distro/include/meta_networking_security_flags.inc b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
deleted file mode 100644
index 19e13ea87..000000000
--- a/meta-networking/conf/distro/include/meta_networking_security_flags.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-# configure righteously complains:
-# | configure:3479: using CFLAGS:  -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2
-# | configure:3485: CFLAGS error: CFLAGS may only be used to specify C compiler flags, not macro definitions. Use CPPFLAGS for: -D_FORTIFY_SOURCE=2
-# | configure:3516: error: Can not continue. Fix errors mentioned immediately above this line.
-
-# Make sure it's at least empty in builds which don't include
-# conf/distro/include/security_flags.inc
-lcl_maybe_fortify ?= ""
-TARGET_CFLAGS_remove_pn-c-ares = "${lcl_maybe_fortify}"
-TARGET_CPPFLAGS_append_pn-c-ares = "${lcl_maybe_fortify}"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index b5aa1599b..2dfde4bdf 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -19,9 +19,6 @@ LAYERDEPENDS_networking-layer += "meta-python"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-# Override security flags
-require conf/distro/include/meta_networking_security_flags.inc
-
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   wireguard-tools->wireguard-module \
 "
diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
deleted file mode 100644
index 03868bfaf..000000000
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-# Build errors with the pie options enabled
-SECURITY_CFLAGS_pn-libdbus-c++ = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libdevmapper = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-lvm2 = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-rrdtool = "${SECURITY_NO_PIE_CFLAGS}"
-
-# This has text reloc errors with the pie options enabled
-SECURITY_CFLAGS_pn-llvm3.3 = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-mozjs = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-openldap = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-s3c64xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-s3c24xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-cpufrequtils = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libcec = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libmodplug = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libcdio = "${SECURITY_NO_PIE_CFLAGS}"
-
-#| /mnt/b/build/tmp-glibc/sysroots/intel-corei7-64/usr/lib/libc_nonshared.a(elf-init.oS): In function `__libc_csu_init':
-#| /usr/src/debug/glibc/2.24-r0/git/csu/elf-init.c:86: undefined reference to `__init_array_start'
-
-SECURITY_CFLAGS_pn-libvdpau = "${SECURITY_NO_PIE_CFLAGS}"
-
-#| /mnt/a/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/6.2.0/ld: lj_err_dyn.o: relocation R_X86_64_TPOFF32 against `static_uex' can not be used when making a shared object; recompile with -fPIC
-#| /mnt/a/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/6.2.0/ld: final link failed: Nonrepresentable section on output
-#| collect2: error: ld returned 1 exit status
-#| make[1]: *** [Makefile:675: libluajit.so] Error 1
-SECURITY_CFLAGS_pn-luajit = "${SECURITY_NO_PIE_CFLAGS}"
-
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 54425c68e..f0d21ed50 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -77,7 +77,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 
 FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
 
-# Override security flags
-require conf/distro/include/meta_oe_security_flags.inc
-
 HOSTTOOLS += "id"
-- 
2.13.2


