Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 17BBB7EF41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 10:46:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x15so1787712wmj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mARFYRW2JjZF6hXzArQf2S3Oll/WhL4hnM/Fhn4b+80=;
	b=fdKDTIzKQAZDrMYEoNSmwgHRB9gu53bc4QC1QKYiUXeA1INpKij2HeaxfVCsOMoWOv
	qfWHw1CfNldkiEFoHriSQy3RXZaD/r3zmV+jVcjPSO7w2fRucuEeY1pbsazgAhRZNaDD
	D/wWKacCEFLjakVjWB9UQ4RJ2is/QaX1WSOuWVNwL6tYCRFXSvb2tbtWP8PkRIesf4N6
	Zgj+wOuZuKk0XxC4Z1ritmI+5udvtmIpJfqY+SJFc8/sR93d2NGu74gsctU8h+UnwlUy
	ywJLeCvG+oH7bbGmoOSzk5dy4Jl2hzykMgjWssoc6siuY2QzAAwtcNHHq6GH/EdvCAdW
	KnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mARFYRW2JjZF6hXzArQf2S3Oll/WhL4hnM/Fhn4b+80=;
	b=NAbE6lQoi6xeeIHfly6fNJdo2ccTb4rYmtEI04w4TO4EMYkhTaIRrabtbVwtAjmAZa
	ixTGLJ98EwyzVNJbmY1YLbta3Ikr2HD1nIF8OqTOjx9vl4jJmdI0Jlfw5pxsMMFz42G1
	RGzsUvPy8I5afCVfEoBuIbCsiiIwxQbGc9yUZxZm0mh1KZeBznOLFMha/ST2Q0zJknBH
	3iCr/y7zHZEL/tUyI11idIE3OWw+oGAqHfx6NOWJFIwvPigxdqY1QrSevl8nU+qsselV
	vJw58si4GOvACs1KDCNL+CFC49FbS3xm28qQi8llzQqE0DVnJpTM+5f8xxWAAedpByJW
	6LDA==
X-Gm-Message-State: APjAAAWutYqvrTWrCkW2yLj23YKY3CX9RFvfNQlwkC3uG5RpXRWE19ka
	CcrefAsTnZXpzUmWmq7xwbv5MdcM
X-Google-Smtp-Source: APXvYqw9PA+WHJadgQgkuCOlM7u9rj009XJiSRBScr7bkmAlgYEJ8EAZr8XBF44ku25Vw//gIMqHdg==
X-Received: by 2002:a1c:f116:: with SMTP id p22mr4821670wmh.70.1562755615609; 
	Wed, 10 Jul 2019 03:46:55 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	v15sm1262545wru.61.2019.07.10.03.46.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Jul 2019 03:46:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 10:46:53 +0000
Message-Id: <20190710104655.2229-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710104655.2229-1-Martin.Jansa@gmail.com>
References: <20190710104655.2229-1-Martin.Jansa@gmail.com>
Subject: [warrior][PATCH 3/5] oprofile: make MACHINE_ARCH
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
X-List-Received-Date: Wed, 10 Jul 2019 10:46:55 -0000

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


