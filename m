Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3587D86E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 07:06:29 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g12so1751961wro.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 00:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mARFYRW2JjZF6hXzArQf2S3Oll/WhL4hnM/Fhn4b+80=;
	b=BSZ1Di1Iw+EuH9ZSyDG84cFsnrxYPyKgvQuJQ9f0lj5xyz6E2O2kriX973AYGiqsDr
	Yl95//syygpf/d3wGS2rAJxr1i0afnrtuJA4gyMf0LzXegy5Uj42zgMf8fj5ghN5SHiI
	ifyjFNPrT876rlbnbL8TWqOehgpJAX/7lJqZBzlvSwLg+zuqY/aIS5j9JdfeptxIBzgL
	4AMDP/sBSJo7qgqdqyje5ufFrOgFvUvAauuZ/MENjqrvT8xvZEXkUVrbOKaE2lZVj3vV
	4/spNsyYcOG1Upf6Po1wwMvoswAx8ov3maNZK+c2Iimkx/eFOrgs2nNpKe8SWIwdxf3c
	sY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mARFYRW2JjZF6hXzArQf2S3Oll/WhL4hnM/Fhn4b+80=;
	b=jXUQ73RsrTOpcVIzBYeNkW3pt6mVXxyWl3TuUyeFDp5VsjmhgPv9IgnaDMoAaMs0ZX
	uLCVt3HvaCW+KyONbKlqb0rUtnJQ+soPPub4cuE5zSHe7d2z0uPn5v4caISpimH/wbSN
	Q2DMULKqFSvRSKcZeFvEYNiFmoiw9fFnI6LcyUjAqFVpK1SD8HG+hmMsI8je4a/hwa85
	eb3RqlbTYmGJEX5Buid+iW5nUW3ODM+7uG7Tu8d/0IXnvdKi+eGpO1r9bSiaJZr3LXnx
	gSUsHYk0HIom5Nj9Cb768Z818Q/NUJ8LkUBp9MpsiSlxTPU3jQyzfz67R49koKi9M2/5
	cALQ==
X-Gm-Message-State: APjAAAVQg3hOSjylfEFwS3NVksG4t9S1Aw/veGpnrVFgIDlZ2DLsVN8J
	doBWzQ53J/rQc+7NbsO7j6+9y6Ee
X-Google-Smtp-Source: APXvYqzXVxuQmu7gYOKPzHpWBRzQwyiKe/69P3PzEKGXh/IDXpCCl1Lz0cfP9+mwfxec/i3R++G54A==
X-Received: by 2002:adf:f208:: with SMTP id p8mr9802450wro.160.1557990390137; 
	Thu, 16 May 2019 00:06:30 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id e8sm9671564wrc.34.2019.05.16.00.06.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 00:06:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2019 07:06:24 +0000
Message-Id: <20190516070624.27975-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516070624.27975-1-Martin.Jansa@gmail.com>
References: <20190516070624.27975-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] oprofile: make MACHINE_ARCH
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
X-List-Received-Date: Thu, 16 May 2019 07:06:30 -0000

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


