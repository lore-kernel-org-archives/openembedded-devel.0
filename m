Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 76AE361EEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:45:52 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so211709eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=la5/wneEhw44FBj4iXPZ5xLiK99cxnxwwm3WjyOT8iY=;
	b=Rk8x0gL2jrgQgtFpNzCoXYs977A0GRna4uESedVBbASbWfmLRQp2FlB0UygKCIgKuy
	gFuoLf0sF7SsxQoataXUp+HSasiMi7PLPy8xLrp+jKLSGlt4nOR+k+fq6uplVf0Uv8l3
	lfwRQQy8eqDmt9XJ+Dv/+p+YuCzalprWQGhoSWtnrctGFvXIJJFC2ppD24hwGwZ0G9P9
	li4vsL4wm5cAe1HZJyNt8yi5up8YRJ6hFfKwjE7nhd0iaCx00XW2CwPmE8NxvGbFL71C
	Nk3JdIF2QE520mQbNVmnX+wl2BHmzlwEQukIjAynBcI6xwId6jExvv/eSqiugKsG73+1
	MMvw==
X-Received: by 10.15.53.4 with SMTP id q4mr37748269eew.134.1374669952896;
	Wed, 24 Jul 2013 05:45:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cg12sm65903046eeb.7.2013.07.24.05.45.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:45:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:46:14 +0200
Message-Id: <1374669974-21014-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][meta-efl][PATCH] e-base: add module.so to PRIVATE_LIBS
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
X-List-Received-Date: Wed, 24 Jul 2013 12:45:52 -0000

* efl and e17 modules are installed in different directories and nothing is going to
  link with them -> no need to register them in shlibs providers

* see https://bugzilla.yoctoproject.org/show_bug.cgi?id=4628 for more
  details about why this WARNING about multiple shlib providers was added

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index f57ff90..e0ae228 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -7,3 +7,8 @@ EFL_SRCREV ?= "82070"
 ARM_INSTRUCTION_SET = "arm"
 
 S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
+
+# each efl or e17 module is installing module.so in different directory, disable shlibs providers for them
+# evas-engine-gl-x11-1.7.7 evas-engine-software-16-1.7.7 evas-engine-software-16-x11-1.7.7 evas-engine-software-x11-1.7.7 evas-engine-wayland-shm-1.7.7 evas-cserve2-bmp-1.7.7 evas-cserve2-eet-1.7.7 evas-cserve2-ico-1.7.7 evas-cserve2-jpeg-1.7.7 evas-cserve2-pmaps-1.7.7 evas-cserve2-png-1.7.7 evas-cserve2-psd-1.7.7 evas-cserve2-tga-1.7.7 evas-cserve2-tiff-1.7.7 evas-cserve2-wbmp-1.7.7 evas-cserve2-xpm-1.7.7 evas-loader-bmp-1.7.7 evas-loader-generic-1.7.7 evas-loader-gif-1.7.7 evas-loader-ico-1.7.7 evas-loader-jpeg-1.7.7 evas-loader-pmaps-1.7.7 evas-loader-png-1.7.7 evas-loader-psd-1.7.7 evas-loader-tga-1.7.7 evas-loader-tiff-1.7.7 evas-loader-wbmp-1.7.7 evas-loader-xpm-1.7.7 evas-saver-jpeg-1.7.7 evas-saver-png-1.7.7 evas-saver-tiff-1.7.7 evas-engine-fb-1.7.7
+# emotion-1.7.7 elementary-1.7.7 elementary-tests-1.7.7 elementary-accessibility-1.7.7 e-wm-0.17.3 elfe-0.0.1+svnr82070 shr-e-gadgets-0.0.0+gitr1+27b6c17d73 cpu-0.0.1+svnr82070 places-0.1.0+svnr82070 forecasts-0.2.0+svnr82070 uptime-0.0.2+svnr82070 screenshot-0.3.0+svnr82070 exalt-client-0.0.1+svnr82070 diskio-0.0.1+svnr82070 rain-0.0.3+svnr82070 news-0.1.0+svnr82070 flame-0.0.3+svnr82070
+PRIVATE_LIBS = "module.so"
-- 
1.8.3.2


