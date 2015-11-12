Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8926B771F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:22:53 +0000 (UTC)
Received: by wmww144 with SMTP id w144so202574596wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1bIw/HTpKZ73bj0PGV/NGGpPMAfmCWWeFyKktOdFKiU=;
	b=XULsDl5yAP+poXe/gb+bAjcv4uTRpl4bOp3qCLuvEzPUtDfZPaDyUWt7V2tgOJqy+5
	nJ22A+aEuu9t6S5AKAYGKpDtr2a0qKhEWiqpngMrV+c1F3upCbi7fjikJEJtIilmxGDh
	sRhfbqr5RxHXoQRpE+qN6pK57Jgw82GH6p7EFwAt3GzVV9OQ5efdL3pDWXbNeQ0Siwkp
	eUyfgWP4+CKOz/NBAUp7Av4nBHyaDHxleWN2r88lA9n7oRWWrpnoLpQ5+R/iuIJQKGkY
	UVSjDppyeaVt7MhisZpYglA3MwblDc6tGS0W+nriZAoLscKRU9eN4p68e1hmwOvAH3zo
	4C/g==
X-Received: by 10.28.170.18 with SMTP id t18mr18896782wme.73.1447338173386;
	Thu, 12 Nov 2015 06:22:53 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	vx1sm4543420wjc.28.2015.11.12.06.22.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:22:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:22:58 +0100
Message-Id: <1447338183-9675-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/9] xl2tpd: set MACHINE_ARCH, because it depends on kernel
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
X-List-Received-Date: Thu, 12 Nov 2015 14:22:53 -0000

* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: xl2tpd different signature for task do_configure.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pppppp_2.4.7.bb.do_populate_sysroot', 'update-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot', 'update-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot:virtual:native', 'xl2tpdxl2tpd_1.3.6.bb.do_patch']
to
['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pppppp_2.4.7.bb.do_populate_sysroot', 'update-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot', 'update-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot:virtual:native', 'xl2tpdxl2tpd_1.3.6.bb.do_patch']
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43dd6bf3b
 changed to
openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populate_sysroot with hash 143d2686a37f592891fb2aa6fa9b752e
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b752e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
index 1a72fd1..ffec167 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
@@ -3,6 +3,8 @@ HOMEPAGE = "http://www.xelerance.com/software/xl2tpd/"
 SECTION = "net"
 DEPENDS = "ppp virtual/kernel"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-- 
2.6.3


