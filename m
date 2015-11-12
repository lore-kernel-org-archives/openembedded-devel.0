Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id DEDFE77226
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:22:58 +0000 (UTC)
Received: by wmec201 with SMTP id c201so93726089wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e6xXAZYCWhq4BpXuqD+TDxqlS2pmuyGff0FDNo2J84U=;
	b=xv+ZYLwI3TKyTVO1sTauvsIeFUNBrnFWuy1Rw+0KvM6AzGNfrAbUM/7qOgW5AUg3vP
	W0KpJuH/gby8faatSZbW+uwUf9Yoj1FiADDjS0knbPbk0+S72NudUYiM4av0SogGY/49
	zW6nQkVZwH8rqIRV/kyayq1RfG5SXa5HH77aU+q0/2fexUGeKAWjRRMZhGW0d+ko+BCd
	I0DCcqvOQCd5f56GQ4KGqPIJDZylc7e32VnxqlTuiqmLQNqrkWG1mbDbCcwkTJIKiHWU
	1KrN6eR9QeRa4Fh4yip8kUZOl1ZRsP6Jm1ujo0UvIyBGUU7Ntk8GVNCLiWwzbKVlN5V8
	GTFA==
X-Received: by 10.194.205.9 with SMTP id lc9mr18954672wjc.120.1447338178488;
	Thu, 12 Nov 2015 06:22:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	h189sm22616722wme.1.2015.11.12.06.22.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:22:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:23:02 +0100
Message-Id: <1447338183-9675-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 8/9] terminus-font, ttf*: exclude fontconfig dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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

* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: terminus-font different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'terminus-fontterminus-font_4.38.bb.do_package', 'terminus-fontterminus-font_4.38.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'terminus-fontterminus-font_4.38.bb.do_package', 'terminus-fontterminus-font_4.38.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-arphic-uming different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-arphic-uming_20080216.bb.do_package', 'ttf-fontsttf-arphic-uming_20080216.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-arphic-uming_20080216.bb.do_package', 'ttf-fontsttf-arphic-uming_20080216.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-dejavu different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-dejavu_2.35.bb.do_package', 'ttf-fontsttf-dejavu_2.35.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-dejavu_2.35.bb.do_package', 'ttf-fontsttf-dejavu_2.35.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-droid different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-droid_git.bb.do_package', 'ttf-fontsttf-droid_git.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-droid_git.bb.do_package', 'ttf-fontsttf-droid_git.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-gentium different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-gentium_1.02.bb.do_package', 'ttf-fontsttf-gentium_1.02.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-gentium_1.02.bb.do_package', 'ttf-fontsttf-gentium_1.02.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-hunkyfonts different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-hunkyfonts_0.3.0.bb.do_package', 'ttf-fontsttf-hunkyfonts_0.3.0.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-hunkyfonts_0.3.0.bb.do_package', 'ttf-fontsttf-hunkyfonts_0.3.0.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-inconsolata different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-inconsolata_20100526.bb.do_package', 'ttf-fontsttf-inconsolata_20100526.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-inconsolata_20100526.bb.do_package', 'ttf-fontsttf-inconsolata_20100526.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-liberation different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-liberation_0.2.bb.do_package', 'ttf-fontsttf-liberation_0.2.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-liberation_0.2.bb.do_package', 'ttf-fontsttf-liberation_0.2.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-mplus different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-mplus_027.bb.do_package', 'ttf-fontsttf-mplus_027.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-mplus_027.bb.do_package', 'ttf-fontsttf-mplus_027.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-sazanami different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-sazanami_20040629.bb.do_package', 'ttf-fontsttf-sazanami_20040629.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-sazanami_20040629.bb.do_package', 'ttf-fontsttf-sazanami_20040629.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-tlwg different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-tlwg_0.6.1.bb.do_package', 'ttf-fontsttf-tlwg_0.6.1.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-tlwg_0.6.1.bb.do_package', 'ttf-fontsttf-tlwg_0.6.1.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-ubuntu-font-family different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-ubuntu-font-family_0.80.bb.do_package', 'ttf-fontsttf-ubuntu-font-family_0.80.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-ubuntu-font-family_0.80.bb.do_package', 'ttf-fontsttf-ubuntu-font-family_0.80.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

ERROR: ttf-wqy-zenhei different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-wqy-zenhei_0.9.45.bb.do_package', 'ttf-fontsttf-wqy-zenhei_0.9.45.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-wqy-zenhei_0.9.45.bb.do_package', 'ttf-fontsttf-wqy-zenhei_0.9.45.bb.do_packagedata']
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de20bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20e2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 7af9b3d..31142ef 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -43,6 +43,23 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   usb-modeswitch-data->usb-modeswitch \
 "
 
+# ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  terminus-font->fontconfig \
+  ttf-arphic-uming->fontconfig \
+  ttf-dejavu->fontconfig \
+  ttf-droid->fontconfig \
+  ttf-gentium->fontconfig \
+  ttf-hunkyfonts->fontconfig \
+  ttf-inconsolata->fontconfig \
+  ttf-liberation->fontconfig \
+  ttf-mplus->fontconfig \
+  ttf-sazanami->fontconfig \
+  ttf-tlwg->fontconfig \
+  ttf-ubuntu-font-family->fontconfig \
+  ttf-wqy-zenhei->fontconfig \
+"
+
 FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
 
 # Override security flags
-- 
2.6.3


