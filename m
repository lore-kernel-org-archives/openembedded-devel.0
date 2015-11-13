Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 710F17733E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 16:38:42 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so89987653wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=m9dRBPv5NHGDv66RtWyXQWKXjuZreR6M4OQF6UrCOV8=;
	b=addRCBU0XHsQagGz7qn3CscaBf8bHT79Wl2C/EdLacTtocqrl/Q4Hxizz4Xgnv/wcn
	V184gt11q73hhymawQ6Vp6k0AVn2bMxdcsiKlRG0Ns8QreKjxZ27XewtlFP//XdAme46
	mf7kjHi3+o939oIl7iomyLSaxKOuTFWwu2ufe3GqcCqOl9FV4xj/NP3bx4s5rQTUZ8im
	vqe7EaYGi5kxIh/3PZa0HgLIvgc2Ork1MFXEZn3HVNLli4yUZ5eblF0HblwZz9OZMY0K
	/f2XUJEu2RKb/xp18oRQO22HMOfql1SbCm0WLIdrzrBhvapxk3hNfhq/n2rJe8Qv/yg7
	wfpw==
X-Received: by 10.28.63.204 with SMTP id m195mr4553464wma.11.1447432721722;
	Fri, 13 Nov 2015 08:38:41 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z4sm20614843wjz.29.2015.11.13.08.38.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 08:38:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Nov 2015 17:39:00 +0100
Message-Id: <1447432741-8986-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-oe][meta-initramfs 1/2] lmsensors: exclude lmsensors-config dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Fri, 13 Nov 2015 16:38:45 -0000

* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: lmsensors different signature for task do_package_write_ipk.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['bashbash_4.3.30.bb.do_packagedata', 'lm_sensorslmsensors-config_1.0.bb.do_packagedata', 'lm_sensorslmsensors_3.4.0.bb.do_package', 'lm_sensorslmsensors_3.4.0.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22.0.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'rrdtoolrrdtool_1.5.4.bb.do_packagedata'] to ['bashbash_4.3.30.bb.do_packagedata', 'lm_sensorslmsensors-config_1.0.bb.do_packagedata', 'lm_sensorslmsensors_3.4.0.bb.do_package', 'lm_sensorslmsensors_3.4.0.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22.0.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'rrdtoolrrdtool_1.5.4.bb.do_packagedata']
meta-openembedded/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb.do_packagedata with hash 26762e381db19859b96a0c8ce13ee808
 changed to
meta-openembedded/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb.do_packagedata with hash a94903117ba4beac7f22a4edd3084d9b
Hash for dependent task lm_sensorslmsensors-config_1.0.bb.do_packagedata changed from 26762e381db19859b96a0c8ce13ee808 to a94903117ba4beac7f22a4edd3084d9b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 31142ef..46f7b34 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -41,6 +41,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   usb-modeswitch-data->usb-modeswitch \
+  lmsensors->lmsensors-config \
 "
 
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
-- 
2.6.3


