Return-Path: <cengic@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id EC21660FCB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 18:44:05 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 19so3689719ljj.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 11:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Vi4P1aJlotMoAWIq2o9Z2uV6i5lr0kRsRY6NLTrHyWU=;
	b=D63IsYV+wmARagQWo3ZtyYB4t1Oon4eF3WeluW69yjC6/kXSn1wGZ8xc8luCTs1rDq
	fAwk8QIXXAE97pR8MirHEZxYWRe5YdVD/db190hSOX+rGqDh0j9HvCKqExSEixlonOW1
	wkdcBu1RDa/clebiRIfZ1zOOZFjnH94qljpC4jmRJJ5zYNRmS8eXWI6KfIVyjmU+snRn
	KLIjEid+DhGty4l8ZtptU10WdIJy3lPJgsmoIWCO6U/1jrVvjCsDHU0GEpXpCWXfoLFp
	dNlkudoiuiOQmSM18dEtsecEfyrQO6Zttv12fKc1A5oydGk1fQeBNyOR0FG/1iFRAkVG
	g8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vi4P1aJlotMoAWIq2o9Z2uV6i5lr0kRsRY6NLTrHyWU=;
	b=IXmFajOgX5xzLjCfdPU1TJqD8wZnu4+z69MvhxvVq378fjjFUhtzZrOa2pf0Uf3D7d
	7tvQIEK5OvzEGZrsnfhenMq84vS4i3+Jw7wMQWTf74EIyf5aE1yKB7zcTb2PoJs99ofR
	HUxuEC3M5bik6Uqyeik82BGpZWfMArajO8JoAaHQ1oMJ15hTLgMoBX/a0N5NPLnB2mt/
	HeYKZEtj+qMowWqL/CgIG9UeiGTKIr1swxs+TBhMuyRZ7DO2KkFUPtIrQxBc4ydm92mB
	OyHwAThNpX5Cg1QG+XO1MzcyUP1JwNl0CN1cfvTGDxuiYyPDWsIE+N9UcTjlS5+7aQmb
	WPvQ==
X-Gm-Message-State: ANhLgQ0euREeI+RGYDvwnS32M8Quvbft9Uud9FHCNXLI7cD4i463LJ4F
	EVim5x53dehSIzkYsh3R81im8l/iAJI=
X-Google-Smtp-Source: ADFU+vvJKtfvjtHXql2IWPCurJ9YlGP5xJemmTXWghesosYLINvq5VuE1ad7DjMsU1+k48fkBKqyoA==
X-Received: by 2002:a2e:b00c:: with SMTP id y12mr2941767ljk.167.1584643445892; 
	Thu, 19 Mar 2020 11:44:05 -0700 (PDT)
Received: from localhost.localdomain (c83-248-75-173.bredband.comhem.se.
	[83.248.75.173]) by smtp.gmail.com with ESMTPSA id
	q14sm2008389lji.100.2020.03.19.11.44.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Mar 2020 11:44:05 -0700 (PDT)
From: Goran Cengic <cengic@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Mar 2020 19:43:55 +0100
Message-Id: <1584643435-1936-1-git-send-email-cengic@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Goran Cengic <cengic@gmail.com>
Subject: [meta-oe][PATCH v3] crash: fix crash-cross build on x86_64
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
X-List-Received-Date: Thu, 19 Mar 2020 18:44:06 -0000

Remove -m32 from CFLAGS even for -cross recipe. Also remove
${GDB_CONF_FLAGS} from GDB_TARGET variable (that is passed to the gdb
configuration) since the use of GDB_CONF_FLAGS is removed by
0001-cross_add_configure_option.patch.

Signed-off-by: Goran Cengic <cengic@gmail.com>
---
 meta-oe/recipes-kernel/crash/crash_7.2.8.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
index 61cc71f..5fc25f4 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
@@ -10,7 +10,7 @@ SECTION = "devel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "zlib readline coreutils-native"
+DEPENDS = "zlib readline coreutils-native ncurses-native"
 
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/crash-utility/${BPN}.git \
@@ -49,9 +49,7 @@ EXTRA_OEMAKE = 'RPMPKG="${PV}" \
                 '
 
 EXTRA_OEMAKE_class-cross = 'RPMPKG="${PV}" \
-                            GDB_TARGET="${BUILD_SYS} \
-                                        \${GDB_CONF_FLAGS} \
-                                        --target=${TARGET_SYS}" \
+                            GDB_TARGET="${BUILD_SYS} --target=${TARGET_SYS}" \
                             GDB_HOST="${BUILD_SYS}" \
                             GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
                             '
@@ -59,10 +57,6 @@ EXTRA_OEMAKE_class-cross = 'RPMPKG="${PV}" \
 EXTRA_OEMAKE_append_class-native = " LDFLAGS='${BUILD_LDFLAGS}'"
 EXTRA_OEMAKE_append_class-cross = " LDFLAGS='${BUILD_LDFLAGS}'"
 
-REMOVE_M32 = "sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c"
-
-REMOVE_M32_class-cross = ""
-
 do_configure() {
     :
 }
@@ -79,7 +73,7 @@ do_compile_prepend() {
     esac
 
     sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
-    ${REMOVE_M32}
+    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
     sed -i 's/&gt;/>/g' ${S}/Makefile
 }
 
-- 
2.7.4


