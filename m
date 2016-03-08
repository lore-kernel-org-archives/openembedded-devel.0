Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 16E666E682
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2016 12:30:24 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n186so129163791wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2016 04:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tz0aZWCP2xNA1iCuOTTiCRd+WIZmv+5QUa4mWOnXBtQ=;
	b=NJMiiDQLvwYNQU2z6dS764GwuIyXa7PAhSxH2Z0qrNadf7m7xRdpieDxw+RfVEPfR2
	daIoxtY11DnI/ACIb0Ou7dZ2MWzMaWPO6zOQWkuY6XM7QNZ+yxpA2Ycc/mdJeW4aNNMt
	S9TzOXTY4gcctPzLdBycyPmww/8EG/ysYiMGWZP+XclXnE7FLBs3N+LYa+qtjpdKry/M
	qIFnItJtPhDcqXIe/pY80m8ObNxCdP7MysmkmN0G7mEtJyu8/7WRgQt+u0/hlbozwwqb
	D6sBg3aWl3vhXPkHYF9sxaawEZiW4nGA3sU+KZGKqjyAr9VTjVeN9A9u1/LRYlUkU64D
	DNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tz0aZWCP2xNA1iCuOTTiCRd+WIZmv+5QUa4mWOnXBtQ=;
	b=mV8Hh+7Hfv6rdWyjh3D3f9v6VIxeXn0jTECpwSXGdWGx6vW3uIJOnBZyxHZnNTGI+z
	/6q9gsF0ZtHWXeFQ3QoTztto/ltcTO69VwygZdABfj1MMMe//WDJRRscvaMii1Gg2qwf
	xvg9zKTn2qeRBvvkz1epRynfCege6AEM3DUeXbzHzspITWYOyyN2a+6yaAdbHJE9CSGV
	XRVHOH6aDWCqp/lfmoTS6kKOl1NwpKgOg4Y57nHJzApUsozmd6Aot8ra0/ly3aGJOG9p
	BDDC5gkR+G1CG338m6T1T4c/YOc+xJquUMZ/+qkTQzdyiiILMJpyEDcFMVxPmpsmi/so
	ccsQ==
X-Gm-Message-State: AD7BkJJIQBQQ4K11eUkynzHmAo1iViUrZ2GQiWrBNBQy3K80qtnroeV8dloLo2t73Xf2lw==
X-Received: by 10.194.122.138 with SMTP id ls10mr28413391wjb.51.1457440224423; 
	Tue, 08 Mar 2016 04:30:24 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t8sm2720398wjy.41.2016.03.08.04.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Mar 2016 04:30:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Mar 2016 13:33:02 +0100
Message-Id: <1457440382-23529-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH][meta-efl] efl-native: add dependency on openssl
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
X-List-Received-Date: Tue, 08 Mar 2016 12:30:25 -0000

* without this many recipes which use e.g. edje_cc fail after last openssl
  upgrade in oe-core with:
  | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/edje_cc: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/../../lib/libcrypto.so.1.0.0: version `OPENSSL_1.0.0' not found (required by /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/libeet.so.1)
  | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/edje_cc: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/../../lib/libcrypto.so.1.0.0: version `OPENSSL_1.0.0' not found (required by /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/./libecore_con.so.1)
  | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/edje_cc: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/././libssl.so.1.0.0: version `OPENSSL_1.0.0' not found (required by /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/./libecore_con.so.1)
  | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/edje_cc: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/../../lib/libcrypto.so.1.0.0: version `OPENSSL_1.0.0' not found (required by /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/./libemile.so.1)
  | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/edje_cc: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/././libssl.so.1.0.0: version `OPENSSL_1.0.0' not found (required by /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/../lib/./libemile.so.1)
  | make[4]: *** [modules/ethumb/emotion/template.edj] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 1120460..31aff87 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -2,7 +2,7 @@ SUMMARY = "EFL"
 LICENSE = "MIT & BSD & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca7873210523dcfd32694b94286dca60"
 
-DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
+DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native openssl-native"
 DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native util-linux libunwind"
 
 inherit efl gettext pkgconfig
-- 
2.7.2


