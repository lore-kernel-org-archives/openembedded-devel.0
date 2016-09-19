Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DF60473189
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 15:02:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 133so15471387wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=heG1encZzs7150tZcuBpK1fDdkKdO0MVppYMHoYivQs=;
	b=m4jfe4Tl+BbjuGzlh+88ILm1kkkHgjJObI42p6DIKtY72sYlU8aAcpN1Vq6AM7oKhS
	Zw2T7Uty8jmF+DgckI2MpzcFx9zpJzRAmQpoU1nYO3p+ikLbeXxPFM4pJeP/1O88rGdT
	oIRE4CNJECgy/6w21iLlidgT6zADxBUCER6KYan2kDG8B4j+bUyR0cBCBk/6ZoNGztXv
	jce9ow7wgJVBrmpjjTzxmXaiCAAwL3AEpbpoyTYFir/sU0XeeCwbb1Sd2Iw8tgHkI2P+
	Ch826j6MyXuVmhr0hxzLZaM2p/fo8P0YlHw+WN5Ql4zXSt6eA2/seIXdPIXBLHaXkQfA
	xZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=heG1encZzs7150tZcuBpK1fDdkKdO0MVppYMHoYivQs=;
	b=f9cppOgJWcE2UZ+rml5/NG0+3s+8z3Uj5fm0RI58Xfgi62GaPumZ1YGluyRHchet+V
	tRsWtQPxg5Z08hy9vVndPkYEYeFv8dYNVr8gjcNgYXk38OkdngbPMPvlIMwTfojw4qQ0
	nnQEeOrMkbqJ+DSruVFFDQ05Vo00fmDQmaqrAa2h0iLzejITtyUE9RqE67RwJj4SVvsN
	2j1HWw7VgvZ4l7r03wMGywtkF8XjBL6+wu7xKjXQEm9zJED1MY/otkwaV6d6Z6PLLgkN
	A19ulH6AgBe+Ee7OjbVKMz9PFl1LuGmg15K+bOWYmIw/trs85BjMMfzYxiXXHKS9rIkC
	ZITg==
X-Gm-Message-State: AE9vXwOWoo+zcOoN7276GzYMbEZZidksyBYYhd8uA69zNuutY68UkiYWDc282MzKlLCZDg==
X-Received: by 10.194.59.84 with SMTP id x20mr23599545wjq.89.1474297345578;
	Mon, 19 Sep 2016 08:02:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bw9sm23552350wjc.33.2016.09.19.08.02.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 08:02:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2016 17:02:23 +0200
Message-Id: <20160919150223.25827-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade to 5.1.6 to fix build with default kernel from oe-core 4.8
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
X-List-Received-Date: Mon, 19 Sep 2016 15:02:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{vboxguestdrivers_5.1.4.bb => vboxguestdrivers_5.1.6.bb}       | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.4.bb => vboxguestdrivers_5.1.6.bb} (87%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.6.bb
similarity index 87%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.6.bb
index 1d1b1d8..8665267 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.6.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
            file://Makefile.utils \
 "
-SRC_URI[md5sum] = "e25a6a1f3c113c373dc0433f9c2526f3"
-SRC_URI[sha256sum] = "b9a14a7771059c55c44b97f8d4eef9bea84544f3e215e0caa563bc35e2f16aaf"
+SRC_URI[md5sum] = "8c2331a718cfc038963c1214c2ba9811"
+SRC_URI[sha256sum] = "2e0112b0d85841587b8f212e6ba8f6c35b31e1cce6b6999497dc917cd37e6911"
 
 S = "${WORKDIR}/vbox_module"
 
@@ -63,6 +63,3 @@ FILES_${PN} = "${base_sbindir}"
 
 # autoload if installed
 KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
-
-# http://errors.yoctoproject.org/Errors/Details/83333/
-PNBLACKLIST[vboxguestdrivers] ?= "BROKEN: not compatible with default kernel version 4.8"
-- 
2.10.0


