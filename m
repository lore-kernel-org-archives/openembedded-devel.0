Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 41FF07EEA2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:41:44 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id i18so16428093pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=P3Zo4bIlD06wkIrSSbXODhx0q0uR1Ks2WnhULIof0Kk=;
	b=pYJ9b0VWsWmbev9wIsug74U5osKlJQgOwjqFd3ZbgmSggk3A7HXgyCnt8p+kuw3gog
	hfwUt7CdTaE+HxqpXuApSLsDiJs8perlDZFvS15DGC4mM+NK+l2bMOsVq/BqDRPsh18Q
	6AeRGJL/9FkOIiGZUvTrbXLq+TlPW64aScXBHUsnpLEpF8V88n/kE6o5AWNVNWEbzGyo
	2/f02AAWKf4LMks2fJVJ1/zuyWiWN7D8NU2wHUfdkMxTnBZzxbbdXzhA0UNNJLpOvTrZ
	UBx5fzJsdYNSAE8Nak/RmX9P0qoH9tLHTJQfhwaVibH2OpOo2lbyE1Q/Qgl90WXN6jrD
	VB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=P3Zo4bIlD06wkIrSSbXODhx0q0uR1Ks2WnhULIof0Kk=;
	b=mZcPt/aW485mX8PyE50aNvIJIJm2j8Af+QbhBS4PjXFY/a/wHpm2zNKJVEO2Xuf9+M
	+djVgTzlDE/SdtQ65G7oVj9lXdN00jZy1dLbc8n/5UvN4+FWED2b5GIqxX3H80a+xmve
	gZNgk2gXfHAnrGwfFAtWxAV5nX5Tgvr/X85Phj359wrxU5xqvyFpwJxUqR4/PvdrGVJe
	Ctc36MEi/V5agNC/L40kukeNeB12QKwynnFduS84Fx1LqGyYReYW8zCqgec/VqTK1mMp
	7NFYPNy2vzKqfQp2wQABQm4w28LPR2f6CfBZNNKOdSy0wO+v+m2i7+UxWtWoe9amk/Qp
	ewPg==
X-Gm-Message-State: APjAAAW5jBMOyQllM6yIhF9RaZokLh4jcbhDoXgces3Dfjh2bkxHojVy
	1vZCs9In6/VXMt5jYtG+ZLasOFFv
X-Google-Smtp-Source: APXvYqwGrPuOM9KmJn7vP7eOceYuq6CSIZ2vg5/hHovOPnbfZTS55MQs454x1KNLXCcD21CoRVGLOQ==
X-Received: by 2002:a17:90a:bf08:: with SMTP id
	c8mr71599751pjs.75.1563720105181; 
	Sun, 21 Jul 2019 07:41:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	t9sm37392604pji.18.2019.07.21.07.41.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:41:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:41:32 -0700
Message-Id: <3e51a60a47132cb24e45a1c87babd65c993c60e5.1563719997.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719996.git.akuster808@gmail.com>
References: <cover.1563719996.git.akuster808@gmail.com>
Subject: [warrior] 4/8] oprofile: make MACHINE_ARCH
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
X-List-Received-Date: Sun, 21 Jul 2019 14:41:44 -0000

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


