Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 65D07771FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:22:51 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so156345537wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ny8IrY6z8tc0Muw0F+jSwBsB7/6L6lu3bctJcL2jhtw=;
	b=ynXH8g6aQHZQ/PnHmpEp6B86WUFRvK4ljX00NLv6n5p6S7rnW7MOit63UrVbaV/sd3
	Z9JKgzezhRzFlVhvyXSKsnz8Inuya5p9qk9fzkPHZnr3B1EL4nBJqo4AKRXgWl7c8xbe
	Aqkdk7oUb4vkjCFdquLd0544sclEIFHiQUN4weq3pdBJzzMqq8pQG05CocaYAKrXkzDB
	82qa3egVcJbTIOBe4nOP5EOHz1ip3MoD8RJcuL6eD7E7kMK0kPb/Uj1kbBJKe0/a98Gw
	ROu22o0g0K8uJRq+w6n286CM38pz6/goOY91x4tkqpYGR6dCiyhBmgGOd3J0rjMhVR3D
	Eqnw==
X-Received: by 10.28.55.212 with SMTP id e203mr47826035wma.7.1447338171820;
	Thu, 12 Nov 2015 06:22:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id c4sm3011971wjs.36.2015.11.12.06.22.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:22:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:22:57 +0100
Message-Id: <1447338183-9675-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 3/9] tipcutils: set MACHINE_ARCH, because it depends on kernel
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
ERROR: tipcutils different signature for task do_configure.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'tipcutilstipcutils_2.0.6.bb.do_patch']
to
['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'tipcutilstipcutils_2.0.6.bb.do_patch']
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43dd6bf3b
 changed to
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populate_sysroot with hash 143d2686a37f592891fb2aa6fa9b752e
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b752e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
index fe0e484..d171d75 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
@@ -7,6 +7,8 @@ SRCREV = "292a03e17f889013fca2c7bd0aaeebd600c88f40"
 
 DEPENDS="virtual/kernel"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit autotools
 
 S = "${WORKDIR}/git"
-- 
2.6.3


