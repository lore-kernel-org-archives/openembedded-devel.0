Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id B0E837721F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:22:55 +0000 (UTC)
Received: by wmec201 with SMTP id c201so93724288wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fknAhcjHgyWgyJA1OeK/bBP+6ejqoQ6OA8EqmMxG+o0=;
	b=FwycY8S0WdX0iI1nR66BRwAlJ11E9YepI/JtU8r39Rkd+Nphl+eeb/NKSL/reqMHUW
	vdwa4TzsEpwmqUANoj1fzjJnhaKBEmG2vriRvvIbjXlpiOwVu5pov2Kk4QjKkJmM/eIK
	7L/+2wgyqC2lqyMw3s1HDskSX87advTWIN6YKwxuI8ZECG+rKjVBClHFq1aFB3o8jqtC
	uml2QS4t1U2tpHxZ2D9o7MWY5krceBDF9G8nN5MLpO0z2jfSi5Yfw1c24Ksf4OwqqzWC
	+okRvGvSw7Vm5agTZ9SRy/wrkshgYQjUjGlU6r0vVX//Z9tLYWvVpMY1qw/7YgbLjGEG
	mrdg==
X-Received: by 10.194.116.167 with SMTP id jx7mr16510201wjb.105.1447338176001; 
	Thu, 12 Nov 2015 06:22:56 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w66sm15292501wme.11.2015.11.12.06.22.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:22:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:23:00 +0100
Message-Id: <1447338183-9675-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 6/9] xserver-common, xserver-nodm-init: drop allarch, depends on couple TUNE_PKGARCH recipes
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
X-List-Received-Date: Thu, 12 Nov 2015 14:22:59 -0000

* xmodmap xrandr xdpyinfo fbset xinput-calibrator xinit
* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: xserver-common different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fbsetfbset_2.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'xinput-calibratorxinput-calibrator_git.bb.do_packagedata', 'xorg-appxdpyinfo_1.3.2.bb.do_packagedata', 'xorg-appxmodmap_1.0.9.bb.do_packagedata', 'xorg-appxrandr_1.4.3.bb.do_packagedata', 'xserver-commonxserver-common_1.34.bb.do_package', 'xserver-commonxserver-common_1.34.bb.do_packagedata'] to ['fbsetfbset_2.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'xinput-calibratorxinput-calibrator_git.bb.do_packagedata', 'xorg-appxdpyinfo_1.3.2.bb.do_packagedata', 'xorg-appxmodmap_1.0.9.bb.do_packagedata', 'xorg-appxrandr_1.4.3.bb.do_packagedata', 'xserver-commonxserver-common_1.34.bb.do_package', 'xserver-commonxserver-common_1.34.bb.do_packagedata']
meta-openembedded/meta-oe/recipes-support/fbset/fbset_2.1.bb.do_packagedata with hash ce7c4dca0cda8d720fd74d2bd1d66fbb
 changed to
meta-openembedded/meta-oe/recipes-support/fbset/fbset_2.1.bb.do_packagedata with hash a232e1b9ce0275f2a989d74cc7053a84
openembedded-core/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb.do_packagedata with hash d688277915e6c9d7e41a00d941dfc590
 changed to
openembedded-core/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb.do_packagedata with hash 9d440e251880adaaa743aecabc86ae36
openembedded-core/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb.do_packagedata with hash 8122f0ff1b1e47cca2ddb162075e7f44
 changed to
openembedded-core/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb.do_packagedata with hash 4d9acf7ce5cfa462d66b04b2bf14b851
openembedded-core/meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb.do_packagedata with hash 9d3e895ec99bf9e9204aa619238e4cc8
 changed to
openembedded-core/meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb.do_packagedata with hash f4a63b5a780ad1eee027ec5c41d1698b
openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.4.3.bb.do_packagedata with hash ee29483d3bbb3d83e14898c2316c81ab
 changed to
openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.4.3.bb.do_packagedata with hash 0c39e999928942dfd8a7f4b8e67446d7
meta-openembedded/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb.do_package with hash 1657fdd755ae7b98394b34c5e29e0f6c
 changed to
meta-openembedded/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb.do_package with hash df6f3388166d833898c5f24024d71703
meta-openembedded/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb.do_packagedata with hash 2794fb1e9e3f8dd7ce2437d5396f6d49
 changed to
meta-openembedded/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb.do_packagedata with hash 007535177f70ddf4efae8d117226490e
Hash for dependent task xorg-appxrandr_1.4.3.bb.do_packagedata changed from ee29483d3bbb3d83e14898c2316c81ab to 0c39e999928942dfd8a7f4b8e67446d7
Hash for dependent task xinput-calibratorxinput-calibrator_git.bb.do_packagedata changed from d688277915e6c9d7e41a00d941dfc590 to 9d440e251880adaaa743aecabc86ae36
Hash for dependent task fbsetfbset_2.1.bb.do_packagedata changed from ce7c4dca0cda8d720fd74d2bd1d66fbb to a232e1b9ce0275f2a989d74cc7053a84
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_package changed from 1657fdd755ae7b98394b34c5e29e0f6c to df6f3388166d833898c5f24024d71703
Hash for dependent task xorg-appxmodmap_1.0.9.bb.do_packagedata changed from 9d3e895ec99bf9e9204aa619238e4cc8 to f4a63b5a780ad1eee027ec5c41d1698b
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_packagedata changed from 2794fb1e9e3f8dd7ce2437d5396f6d49 to 007535177f70ddf4efae8d117226490e
Hash for dependent task xorg-appxdpyinfo_1.3.2.bb.do_packagedata changed from 8122f0ff1b1e47cca2ddb162075e7f44 to 4d9acf7ce5cfa462d66b04b2bf14b851

ERROR: xserver-nodm-init different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'xorg-appxinit_1.3.4.bb.do_packagedata', 'xserver-commonxserver-common_1.34.bb.do_packagedata', 'xserver-nodm-initxserver-nodm-init_2.0.bb.do_package', 'xserver-nodm-initxserver-nodm-init_2.0.bb.do_packagedata'] to ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'xorg-appxinit_1.3.4.bb.do_packagedata', 'xserver-commonxserver-common_1.34.bb.do_packagedata', 'xserver-nodm-initxserver-nodm-init_2.0.bb.do_package', 'xserver-nodm-initxserver-nodm-init_2.0.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/xorg-app/xinit_1.3.4.bb.do_packagedata with hash 6963e42ac1053b62ce4a6570a74e27bf
 changed to
openembedded-core/meta/recipes-graphics/xorg-app/xinit_1.3.4.bb.do_packagedata with hash eb81dc4aa06e4a2f1fb3e76bac3d4d88
meta-openembedded/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb.do_packagedata with hash 2794fb1e9e3f8dd7ce2437d5396f6d49
 changed to
meta-openembedded/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb.do_packagedata with hash 007535177f70ddf4efae8d117226490e
Hash for dependent task xorg-appxinit_1.3.4.bb.do_packagedata changed from 6963e42ac1053b62ce4a6570a74e27bf to eb81dc4aa06e4a2f1fb3e76bac3d4d88
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_packagedata changed from 2794fb1e9e3f8dd7ce2437d5396f6d49 to 007535177f70ddf4efae8d117226490e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb      | 2 --
 meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index f5b1984..0315ed7 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -38,8 +38,6 @@ do_install_append() {
     done
 }
 
-inherit allarch
-
 RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo fbset xinput-calibrator"
 
 RCONFLICTS_${PN} = "xserver-kdrive-common x11-common"
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index f9bf007..b29d075 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "file://xserver-nodm \
 "
 S = "${WORKDIR}"
 
-inherit allarch update-rc.d systemd
+inherit update-rc.d systemd
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 01 5 . stop 01 0 1 2 3 6 ."
-- 
2.6.3


