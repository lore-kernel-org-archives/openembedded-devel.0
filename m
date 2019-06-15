Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 855997E579
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:34 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id v11so3414141pgl.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=P3Zo4bIlD06wkIrSSbXODhx0q0uR1Ks2WnhULIof0Kk=;
	b=KcO7W9FPMJmwBPezBi771m6o+xSk5WedtRXRG/oI17+TD2iDd43DG8NGKToUi2zs9m
	q/CIQfgrxPO4tF12pkmZsr+FT0zsmkdT53s97szBOTk73nwSatU7JYmfGu927WeLTckc
	ahKFMp6q1nLm4j/a8ctEwqM4UrU2r90WilZW4W88QbjVkkmwi5ktGLJGSEtNmyZQZlcK
	HZazzd0EO2pJjJX8sJPA9BVpTV2nSGR2kcoFwkGNa3V1q45K+k3CZyEkxN0DNxBlNwv9
	4MNH8WYc2sR2cv7CJPERj3t2TYz8qvJ6fqg34UW9PJ3yw0gF89kr3elOcwxoyWb3zU+l
	cMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=P3Zo4bIlD06wkIrSSbXODhx0q0uR1Ks2WnhULIof0Kk=;
	b=LYdtW0RrYghE2qO8bjW1AownqgwPAYtv78LT8HicYCsvciL/ajcSEUAIoKqAw3IHXR
	vhx342M+BQO1GUIFw5weQ8+q7vZq+in7yiT43b7pHHL1YIO2KrxbZq9AHZqB1uhJRO0/
	9vFrXaZE2yMXLUF3IywfOGfSpsf8d1xkR0eVXG1xvy6u0LGWjWGLM1pVPWrd/epeg64N
	SgjXpCNexyLprry/9QIDkZRdSe9xdMz9PrjC1NKivqq94opNsuU/hnSaNiatytBRDKw4
	qXZhjV0gRPj5g7a0g8z2SUdVnI+89uFuZNVK0koZysUxkKynQpyzOQPT/puuZfyINTn5
	sdMg==
X-Gm-Message-State: APjAAAVFLFkTLveL9NFvJGsPEUAJdQP8VBKvS8tdYOErgf04PCrQxnqh
	iLn95A6mHevDStESA2TfRpjSOkeE
X-Google-Smtp-Source: APXvYqwY8K2BSPAYtb6/Rr0+5tlIzfRj8GejPHERIbGEjK6dKXorTLOsi6Qm+oh0bsV1ippP2gnmqg==
X-Received: by 2002:a65:40cb:: with SMTP id u11mr19137594pgp.333.1560621455368;
	Sat, 15 Jun 2019 10:57:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:07 -0700
Message-Id: <0fddf21a5d66f4c2103c7e9a6b1f40382ada9d68.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 03/23] oprofile: make MACHINE_ARCH
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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
index 1dc535e..8d706e4 100644
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
2.7.4


