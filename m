Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 663EF79664
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 23:12:48 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b19-v6so380597wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XFhjK/+MqCBl8jRJZj0f2jdFNFbB3axiOPWoyqIwqak=;
	b=LCVorhwqQk3IMYcPw1ylssvfyVDVfhI2+uO+A8db8fSnA7a0phIwd9aUDgiBamUiDM
	yG+hJyYpiNb4B+WzlduragI0i6kfoSuKlLAB6lIcxLChpi0aZxCBt3WANJsSuctzfef2
	tqF2rZr/l+Wunem3gZkUtQEIlRB00IrE8v2cjIYFszZxnRl6KcT4FfyG21T4XIOkBli9
	ERQP0BJfEwOOvf59BMMtTZyRh0q9gpt6TmGEVQHI5a2/S/7lQKNSaAa73Pr/raju03cA
	uMy3ID/mvX9KqwgARxdO2yx5mAPK2eNbDw0KZozWjqZh6MrqnnIoLNlvJprmhZZG2ByS
	jI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XFhjK/+MqCBl8jRJZj0f2jdFNFbB3axiOPWoyqIwqak=;
	b=cbsfmGEupH98b7sfUDhWVZkZYPL4e83M8Rh5+uxKOPRWC9WeLtaC0WHfcxec44DZ4G
	2YkLMYytijQL5NO1BmLg72p7M3ARX3fk5V4Fz5j0KZDJNzm7tYvtkDfzB7KfXy+9Tj1W
	Lw7iMeAsru1+igZoYsQgzmOF8tvmvKbu5l6XhyJJKuyBzh/k+HdWMlSGLQNds5+DebE7
	t/eXGF2p2e84zy2m/04KL4Kfl/zdaVd3xDSMxhkglDzbSWk3Mq/0+3zl1q2N5rMyITAe
	cBEECJAYiHZ+SfGzUJ38IU67Qnx1tvsAYckPrN/mlPfjCBsSEXOVS6sDSCnjoEGk1XpL
	mfDQ==
X-Gm-Message-State: APzg51Dx0iHkUyRD3wKbDwUD+F5p8XfKxOubJiLFsyyjCzivBLuKVyka
	CDJrjlMdUfL3tAF4wSoXXnt3KtWE
X-Google-Smtp-Source: ANB0VdaldT8sWytxQrQ9Tgu2tdVVWpQxhPAM7x+PpURf8MbNhTMeOKr5zmdhdZ91N0W7GceibsxRtA==
X-Received: by 2002:a1c:4857:: with SMTP id
	v84-v6mr12500744wma.8.1537225968643; 
	Mon, 17 Sep 2018 16:12:48 -0700 (PDT)
Received: from localhost.localdomain
	(host215-117-dynamic.54-82-r.retail.telecomitalia.it.
	[82.54.117.215]) by smtp.gmail.com with ESMTPSA id
	d10-v6sm16876357wrv.70.2018.09.17.16.12.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Sep 2018 16:12:47 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 01:12:44 +0200
Message-Id: <1537225964-3273-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc-utils: remove the two static binaries (kinit and gzip)
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
X-List-Received-Date: Mon, 17 Sep 2018 23:12:48 -0000

The shared utils can be built with security flags enabled.
This breaks however build of kinit and gzipm both static.

Remove them from this recipe.

Fix QA Issue:
 'klibc-utils-gzip/bin/gzip' has relocations in .text [textrel]
 'klibc-utils-kinit/bin/kinit' has relocations in .text [textrel]

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc-utils.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index 7df33d6..2aac9e6 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -1,16 +1,16 @@
 do_install() {
     install -d ${D}${base_bindir}
     install -d ${D}${base_sbindir}
-    # debian packages kinit + kinit.shared but only sh.shared
     if [ "${KLIBC_UTILS_VARIANT}" = "shared" ]; then
-        install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
         install -m 755 usr/kinit/kinit.shared ${D}${base_bindir}/kinit.shared
         install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh.shared
     else
         install -m 755 usr/dash/sh ${D}${base_bindir}/sh
         install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
+        install -m 755 usr/gzip/gzip ${D}${base_bindir}
+        ln -s gzip ${D}${base_bindir}/gunzip
+        ln -s gzip ${D}${base_bindir}/zcat
     fi
-    install -m 755 usr/gzip/gzip ${D}${base_bindir}
     install -m 755 usr/kinit/fstype/${KLIBC_UTILS_VARIANT}/fstype ${D}${base_bindir}
     install -m 755 usr/kinit/ipconfig/${KLIBC_UTILS_VARIANT}/ipconfig ${D}${base_bindir}
     install -m 755 usr/kinit/nfsmount/${KLIBC_UTILS_VARIANT}/nfsmount ${D}${base_bindir}
@@ -44,8 +44,6 @@ do_install() {
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/true ${D}${base_bindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/umount ${D}${base_bindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/uname ${D}${base_bindir}
-    ln -s gzip ${D}${base_bindir}/gunzip
-    ln -s gzip ${D}${base_bindir}/zcat
 }
 
 EXTRA_KLIBC_DEPS = "${@oe.utils.conditional('KLIBC_UTILS_VARIANT', 'shared', '${THIS_LIBKLIBC}', '', d)}"
-- 
2.7.4


