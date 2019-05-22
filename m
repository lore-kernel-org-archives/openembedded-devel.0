Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 90FC87E3BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:28:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 7so3874402wmo.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OdQ+kJMqJGvpwDhc7RSRo7e/7BCGI1kUHytuV5YkTIU=;
	b=LY5y23c3UfXS2s8gNZ/yvA6hmV9Ut+0nnhkAbRvz6cMvOWKydgW7W5oETGzs1GiQ0U
	2JOoC9cA1toACIorlVXkitzpmDqoezLhMSwQmlV5tW5QZzz8VSyA/9KuRZuE5dq8o/R6
	b/ghJkSAqk73zwozXlwwFM6fyIf7d6wEQNBYVkouGKGKgvCbwcIkjiRqeOqiwmGnHoAZ
	nXa0KcYpwnNrgEteDWpyU/opYSpbDBXIAFgicIXn0ouRNR6cYAvqi5o/FvCvyibz8C0r
	ovtH49QxnecWtD3t+UecTt80m5PXl6U2xZHmXokE9xd/dNkNQtK/nVnLEBtNgwCYb5LN
	5cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OdQ+kJMqJGvpwDhc7RSRo7e/7BCGI1kUHytuV5YkTIU=;
	b=VBE4o6NiXrDoStVWay0SGPbEq/4/56cGekaG911cZUlhVpmfqpmzyDSclgYLx1vsWj
	AvFVjPcmA8uBw5tG1f38hPFnctnZRtS7IymalqnS47elPp5sSTQNVH8qoYE7PD06wdEf
	S+XsGKTjvvZJvvFI/2IWa+Zp9EoJGamO4KwjVJBHu7BiU2oEkORVA3GUA9OB25KZV408
	mV5cqkNK+psSn5c9jhaZhxWWIE1mAxbJkHkwSi/mM6y0aR7ubarHDZH+CNYcdi2m6yOW
	x+ywaUDwbmmkdvtdYnVepI3aHQC6gFQzD5wDHfZ6y1FpNrFFL68Xy45I29SKqpP0ZxGk
	tFCw==
X-Gm-Message-State: APjAAAUimJmFBaCzAFtXR/qCyDfn1ZDToO8P4kH+eOir0s/R1ZWvNuIL
	vH5Az9tACuaMCCVMH4fQTTQXYE23
X-Google-Smtp-Source: APXvYqzLV1B78wVbDXD1CY/rjcfRdnENXv8VJLdgOVJvqXgUllKK7X1CFBQemT1+nlyt4ugaIyE2HA==
X-Received: by 2002:a1c:9eca:: with SMTP id h193mr9071670wme.125.1558567707103;
	Wed, 22 May 2019 16:28:27 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	i185sm14232193wmg.32.2019.05.22.16.28.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 16:28:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2019 23:28:35 +0000
Message-Id: <20190522232835.17963-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAJ86T=V8DsNKUgyBrhuwa_w4bgbqpnRK3jX5HGtX+vGUtJL_YA@mail.gmail.com>
References: <CAJ86T=V8DsNKUgyBrhuwa_w4bgbqpnRK3jX5HGtX+vGUtJL_YA@mail.gmail.com>
Subject: [meta-oe][PATCH] ne10, libopus: add armv7ve override as well
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
X-List-Received-Date: Wed, 22 May 2019 23:28:26 -0000

* fix the override in packagegroup-meta-oe.bb
* alllow building ne10 for armv7ve (e.g. Cortex-A15)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb        | 3 ++-
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb                 | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5fcf9899b6..af3e848124 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -220,7 +220,8 @@ RDEPENDS_packagegroup-meta-oe-shells ="\
 
 NE10 = ""
 NE10_aarch64 = "ne10"
-NE10_arm7 = "ne10"
+NE10_armv7a = "ne10"
+NE10_armv7ve = "ne10"
 
 RDEPENDS_packagegroup-meta-oe-support ="\
     anthy asio atop augeas avro-c bdwgc frame grail \
diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
index 50d49370ba..fb9bdc70fa 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
@@ -28,9 +28,10 @@ EXTRA_OECONF = " \
     --enable-custom-modes \
 "
 
-# ne10 is available only for armv7a and aarch64
+# ne10 is available only for armv7a, armv7ve and aarch64
 DEPENDS_append_aarch64 = " ne10"
 DEPENDS_append_armv7a = " ne10"
+DEPENDS_append_armv7ve = " ne10"
 
 python () {
     if d.getVar('TARGET_FPU') in [ 'soft' ]:
diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 4e8986de18..f37ccde1cb 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -15,13 +15,15 @@ PV .= "gitr+${SRCPV}"
 
 inherit cmake
 
-# Incompatible with archs other than armv7 and aarch64
+# Incompatible with archs other than armv7, armv7ve and aarch64
 COMPATIBLE_MACHINE = "(^$)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
+COMPATIBLE_MACHINE_armv7ve = "(.*)"
 NE10_TARGET_ARCH = ""
 NE10_TARGET_ARCH_aarch64 = "aarch64"
 NE10_TARGET_ARCH_armv7a = "armv7"
+NE10_TARGET_ARCH_armv7ve = "armv7"
 
 EXTRA_OECMAKE = '-DGNULINUX_PLATFORM=ON -DNE10_BUILD_SHARED=ON -DNE10_LINUX_TARGET_ARCH="${NE10_TARGET_ARCH}"'
 
-- 
2.17.1


