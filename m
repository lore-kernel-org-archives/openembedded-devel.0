Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id EA149771F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:22:50 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so156344729wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HDWAt/0EQ72vH69o54qfcfBEjunH0vH+YkNi+H4WuU0=;
	b=Y0c1M6u3/E/6B9fVV+lhZ5cmhjHsCYYKi4eNS7HCRx2ipRD+JGeUVH0atZ7A4OQvEJ
	WFr1D5CcIoQAbyegJ5Ssmr3igZCMBpCOJW9ISAkt0YtdBrXUJq8WLAWyRUCkT5eshLCw
	vV7AQp5pd3MykodkFGpJNnNNJAzCnM9SBAMh7itYuGzOukltZNLCgeHDe2aFbuPHfoOm
	IIVgEJaNkwdWelzcznJ7AwloGE1fk8Bb7SaYeFVvRh+iIRdSjGp7qiEurL+Bhpq5u0vE
	dfxpY/MKHQ2J3LT5e/d7n5y3u1oMTs+H+tLP64wbfLEa9zperPKPvjvqJWLpjc1u0BBY
	gk9g==
X-Received: by 10.28.214.146 with SMTP id n140mr17323734wmg.47.1447338170581; 
	Thu, 12 Nov 2015 06:22:50 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q141sm15299649wmg.3.2015.11.12.06.22.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:22:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:22:56 +0100
Message-Id: <1447338183-9675-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/9] linux-atm: set MACHINE_ARCH, because it depends on kernel
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
ERROR: linux-atm different signature for task do_configure.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_sysroot', 'flexflex_2.5.39.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linux-atmlinux-atm_2.5.2.bb.do_patch', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pkgconfigpkgconfig_git.bb.do_populate_sysroot:virtual:native']
to
['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_sysroot', 'flexflex_2.5.39.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linux-atmlinux-atm_2.5.2.bb.do_patch', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pkgconfigpkgconfig_git.bb.do_populate_sysroot:virtual:native']
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43dd6bf3b
 changed to
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populate_sysroot with hash 143d2686a37f592891fb2aa6fa9b752e
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b752e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index d0c0cec..edfb045 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -5,6 +5,8 @@ LICENSE = "GPL-2.0 & LGPL-2.0"
 
 DEPENDS = "virtual/kernel flex flex-native"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
            file://link-with-ldflags.patch \
            file://install-from-buildir.patch"
-- 
2.6.3


