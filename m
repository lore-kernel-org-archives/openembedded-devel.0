Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 980977E651
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:09 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id h19so2375537wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mARFYRW2JjZF6hXzArQf2S3Oll/WhL4hnM/Fhn4b+80=;
	b=duyvw67lH6+HJ8OInP+a+0cuc/80Aj51a6RKNXjDnb6rXHAOSy96/jaMwmBvf415rR
	Yu5ehdCBtk8jGR7UifYtIZpsyqgZlPsNWkSxD0O+Esd/rbjBsjUxwna0JZUNSeafz0FA
	WYN0G+DFlkFt2LaXRDtU8kSc/mp5Lc++FYYNgxyTM31hiZKJbVHyuZGoSRYdb5Wx7QVN
	MAdibb6s0iIBeGpWb9FD8kbIbuFGGhwWYiLtgPZMdjTtAF9C46gYR0qycN8jtGUhGeA3
	KwpJB5cXLSqhCyCQDQ2ZLNoLrot/VXpKl0k+lMIIBI2sQpd22odKJZ4ko7EzTcPKYewW
	bDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mARFYRW2JjZF6hXzArQf2S3Oll/WhL4hnM/Fhn4b+80=;
	b=ZClRxuj6wQ1sYtO2iiSEBUmE55mUcT6XgafTgrjEV05bfsx8WinXyoEfv74ruum+WJ
	onx/QkX1Q1+ch11vsgclzQrouHpk1psGLX8GCtpiME3oQCennQH07nnCfzDpbmYYv/mb
	2j8c6KqQzPxWEMiuaJffsJ/VnB9RnG015Wm28oCVp7mfL98y2WRMBIVk3HdmTrevM5hu
	JajEoCPV1gSuKHE3VuihJKJ4I5jjXcMevwA3HfHClG7hkE4+9NCT3xWBmxk7IX25wiRI
	WndEqNVWrzL2+VpzWzW8te+tQbv+Vqf8M7PDV5iksJtP7uqnsaPCzHAa2w4XHnZROpZu
	q9XQ==
X-Gm-Message-State: APjAAAWySJgkH/5XwBX7p5twxOKdUd2vy6blE4wXIeHilxoMkdgNmX19
	qKlE7t9X0GWqLpzj/WAs89rlUbyq
X-Google-Smtp-Source: APXvYqxHd/l2toaZqjBewdcE8F/FnNm0av5oU/GIj6pGGcYt4JpRSS+DzRJns5TDK14Yl3T2WciVOw==
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr19631731wmg.164.1560272110053; 
	Tue, 11 Jun 2019 09:55:10 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	z7sm11020451wrs.22.2019.06.11.09.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:54:56 +0000
Message-Id: <20190611165504.23049-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 03/11] oprofile: make MACHINE_ARCH
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:09 -0000

* fixes:
ERROR: oprofile different signature for task do_configure.sigdata between hammerhead and mako
Hash for dependent task oprofile/oprofile_1.3.0.bb.do_prepare_recipe_sysroot changed from deecd34bc94f47935ce3dc7f83f9a8407269959e446518bd9700a2ebae4324bb to d4d6301a72fcd061c167a6715372a6e35f57bf08152a6223b1571957834428f0
Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb.do_prepare_recipe_sysroot with hashes deecd34bc94f47935ce3dc7f83f9a8407269959e446518bd9700a2ebae4324bb or d4d6301a72fcd061c167a6715372a6e35f57bf08152a6223b1571957834428f0

$ bitbake-diffsigs /OE/build/luneos-master/webos-ports/tmp-glibc/sstate-diff/1557963509/[hm]*/*/oprofile/*do_prepare*.sigdata*
runtaskdeps changed:
['autoconf/autoconf_2.69.bb.do_populate_sysroot:virtual:native automake/automake_1.16.1.bb.do_populate_sysroot:virtual:native binutils/binutils_2.32.bb.do_populate_sysroot gcc/gcc-cross_7.3.bb.do_populate_sysroot gcc/gcc-runtime_7.3.bb.do_populate_sysroot glibc/glibc_2.29.bb.do_populate_sysroot gnu-config/gnu-config_git.bb.do_populate_sysroot:virtual:native libtool/libtool-cross_2.4.6.bb.do_populate_sysroot libtool/libtool-native_2.4.6.bb.do_populate_sysroot', -linux/linux-lg-hammerhead_git.bb.do_populate_sysroot, +linux/linux-lg-mako_git.bb.do_populate_sysroot, 'oprofile/oprofile_1.3.0.bb.do_fetch pkgconfig/pkgconfig_git.bb.do_populate_sysroot:virtual:native popt/popt_1.16.bb.do_populate_sysroot']
linux/linux-lg-hammerhead_git.bb.do_populate_sysroot with hash e58e94601af73831ea51ca6cc18578c26b9b491bcadb82a2c590b22498447438
 changed to
linux/linux-lg-mako_git.bb.do_populate_sysroot with hash 4c7372d0063be9d5c96bfad20a2052ded3a7121a06027c21a75e79a4f6a678e3
Dependency on task linux/linux-lg-mako_git.bb.do_populate_sysroot was added with hash 4c7372d0063be9d5c96bfad20a2052ded3a7121a06027c21a75e79a4f6a678e3
Dependency on task linux/linux-lg-hammerhead_git.bb.do_populate_sysroot was removed with hash e58e94601af73831ea51ca6cc18578c26b9b491bcadb82a2c590b22498447438

* as detected with:
openembedded-core/scripts/sstate-diff-machines.sh --targets=world --tmpdir=tmp-glibc/ --analyze --machines="hammerhead mako qemux86"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
index 1dc535ed8d..8d706e4a50 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
@@ -3,6 +3,9 @@ require oprofile.inc
 DEPENDS += "virtual/kernel"
 DEPENDS_append_powerpc64 = " libpfm4"
 
+# Depends on MACHINE_ARCH kernel
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 SRC_URI[md5sum] = "bd998df5521ebedae31e71cd3fb6200b"
 SRC_URI[sha256sum] = "95ded8bde1ec39922f0af015981a67aec63e025a501e4dc04cd65d38f73647e6"
 
-- 
2.17.1


