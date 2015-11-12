Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4957717D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:22:49 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so156343792wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9AHTiZ42dvXI1Rn0TBEVk4DoQ7FadXiZkgYMIeaRKNk=;
	b=ddp96CnQ5sV98o/dYqmmCfDV+jBnEgnf9e5X8F1Hwymz8cUf9LEKiU+kv0DZq3fFSp
	4vhfLOxtw5P2JSwpFCbdVGyqLHjOYxKP5HQUKgdWqo0rduoIKL7i1w+JjEn4HrWYLmyu
	A9Tdu0CXrNq9sD1IMYijPpX0yDoP7T/bGUFDMbuPcuhNoPL2HY6LSz0NcnuxxCDJ2pQn
	WS/I+yEeCssWWP3am7Kbmj+jyTgAK1OlSwKopiLtLUuFImr4ooXKE/H7NT7Vm2CggHig
	xdUxKLSgE17NhYQzoxq+wIyjpRRqm3AIgJ1BLMepd9EAtdU+MaZm6y/YEboXTl87yG8D
	9wsA==
X-Received: by 10.28.52.17 with SMTP id b17mr18650910wma.41.1447338169143;
	Thu, 12 Nov 2015 06:22:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ft4sm14685094wjb.37.2015.11.12.06.22.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:22:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:22:55 +0100
Message-Id: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-oe 1/9] ipsec-tools: set MACHINE_ARCH, because it depends on kernel
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
X-List-Received-Date: Thu, 12 Nov 2015 14:22:52 -0000

* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: ipsec-tools different signature for task do_configure.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'bisonbison_3.0.4.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'opensslopenssl_1.0.2d.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populate_sysroot', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot']
to
['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'bisonbison_3.0.4.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'opensslopenssl_1.0.2d.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populate_sysroot', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot']
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43dd6bf3b
 changed to
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populate_sysroot with hash 143d2686a37f592891fb2aa6fa9b752e
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b752e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 8ee81f8..d9f1212 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7
 
 DEPENDS = "virtual/kernel openssl readline flex-native bison-native"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV}.tar.bz2 \
            file://0002-Don-t-link-against-libfl.patch \
            file://configure.patch \
-- 
2.6.3


