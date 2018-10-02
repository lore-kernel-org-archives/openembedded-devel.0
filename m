Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 838A379540
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 17:34:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e4-v6so3190918wrs.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 10:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Lvvsrzse+pRLUeK1WApAHMNROoqQ4viSkvLBOnMzhdY=;
	b=dCXM+o5C0V0vO8oQYu7hGINRDAfjy6Kp6v+9orTDzsli4mEo4mzqwndtk9oPZwYzn6
	PuwQE4s0inkVzqg/I31mmCtsimQPc9BNmosHpPUlyMkQ8PRbg580hiVrcALtlg1ah3wp
	a7y+gfgAhRKznb/9hqA+O81wvmMKUVXA9lQjRFDyYMTVlBa3PlLsBdftj+SzV1jkyHN+
	nKeG1t5JZizph18dlRDSgmwEgk5eXfGUQ1n/dQuEWqROvnB4FW0HHocM9ojgvidBGNdL
	HBOkNIZpMHPnyOqfAiEGZdqkMWrMsqFWg7GON4JTnW+s6Dw4Rf3NpEwItbyxSHCq3dqx
	QkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Lvvsrzse+pRLUeK1WApAHMNROoqQ4viSkvLBOnMzhdY=;
	b=Fk1vklpAG4ocemmKLJklVqejaefASvOX6xo4VDRdqj3Vl4QVJd1QK62NXWQ1HMlUC7
	oNkC/Sm0c9g6VKxCZ2ck4HKaCMZszJEpuzRa7bdKl3gOP1SBfoZgyKjxHXsELSOrSXl7
	HI404VQPkb4418qVhpsKiAUzuRv1MRdPAlX0FTXijtYiKyp2+5ti0hujEMoNzH3YFzgO
	S6QpKPd0XjcPdkp4NKN2L0DV6vbXIfEvX9+uSmbTcKwZVRPDWVBH3iALZFIqxnpx6pYC
	16AIAc+pGhjyeMAGC1+QDsQ/HZNrING2rywD7yU5+rbD6NMmn5wb3JG90TK8aeHNgObM
	rbXg==
X-Gm-Message-State: ABuFfojC0pPIbFzUkTG7kdyuL9DJ20/q+7QU5zYVwScBBS85lzLrNxot
	YlfGz5jzpv6rXUGwmiyCYuQGKYgi
X-Google-Smtp-Source: ACcGV621286unI/B+3Lalw/Jg235jdNcfoErlEWw2X2VTYSPbtPggSkLBhkjLxxfFiS3Q1mew27f9A==
X-Received: by 2002:adf:e681:: with SMTP id
	r1-v6mr11725074wrm.294.1538501640830; 
	Tue, 02 Oct 2018 10:34:00 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z89-v6sm38343029wrb.3.2018.10.02.10.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Oct 2018 10:33:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2018 17:33:56 +0000
Message-Id: <20181002173359.25493-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/4] android-tools: depends on openssl10 only for target builds
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
X-List-Received-Date: Tue, 02 Oct 2018 17:34:00 -0000

* openssl isn't used by TOOLS enabled for native and nativesdk builds:
  TOOLS_class-native = "fastboot ext4_utils mkbootimg"
  TOOLS_class-nativesdk = "fastboot ext4_utils mkbootimg"
  it's used e.g. by adb which is enabled only for target

* with openssl10 it cannot be really used by anything, because
  openssl.cnf from openssl10-native will conflict with openssl.cnf
  installed to RSS by openssl-native, causing:

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['virtual:native:/OE/build/owpb/webos-ports/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb:do_populate_sysroot',
'/OE/build/owpb/webos-ports/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot',
'/OE/build/owpb/webos-ports/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_8.2.bb:do_populate_sysroot',
'/OE/build/owpb/webos-ports/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb:do_populate_sysroot',
'/OE/build/owpb/webos-ports/openembedded-core/meta/recipes-core/glibc/glibc_2.28.bb:do_populate_sysroot',
'virtual:native:/OE/build/owpb/webos-ports/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_populate_sysroot',
'virtual:native:/OE/build/owpb/webos-ports/openembedded-core/meta/recipes-devtools/rpm/rpm_4.14.2.bb:do_populate_sysroot',
'virtual:native:/OE/build/owpb/webos-ports/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot',
'virtual:native:/OE/build/owpb/webos-ports/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
ERROR: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: '/OE/build/owpb/webos-ports/openembedded-core/meta/classes/staging.bbclass', lineno: 553, function: extend_recipe_sysroot
     0549:                    dest = newmanifest[l]
     0550:                    if l.endswith("/"):
     0551:                        staging_copydir(l, targetdir, dest, seendirs)
     0552:                        continue
 *** 0553:                    staging_copyfile(l, targetdir, dest, postinsts, seendirs)
     0554:
     0555:    bb.note("Installed into sysroot: %s" % str(msg_adding))
     0556:    bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists))
     0557:
File: '/OE/build/owpb/webos-ports/openembedded-core/meta/classes/staging.bbclass', lineno: 151, function: staging_copyfile
     0147:        os.symlink(linkto, dest)
     0148:        #bb.warn(c)
     0149:    else:
     0150:        try:
 *** 0151:            os.link(c, dest)
     0152:        except OSError as err:
     0153:            if err.errno == errno.EXDEV:
     0154:                bb.utils.copyfile(c, dest)
     0155:            else:
Exception: FileExistsError: [Errno 17] File exists: '/OE/build/owpb/webos-ports/tmp-glibc/sysroots-components/x86_64/openssl-native/etc/ssl/openssl.cnf' -> '/OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/android-system-image-tissot/20180914-22-r0/recipe-sysroot-native/etc/ssl/openssl.cnf'

DEBUG: Python function extend_recipe_sysroot finished
ERROR: Function failed: extend_recipe_sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 6972ad70a4..adf372d8bb 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378 \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
-DEPENDS = "libbsd libpcre openssl10 zlib libcap"
+DEPENDS = "libbsd libpcre zlib libcap"
+DEPENDS_append_class-target = " openssl10"
 
 ANDROID_MIRROR = "android.googlesource.com"
 CORE_REPO = "${ANDROID_MIRROR}/platform/system/core"
-- 
2.17.1


