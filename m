Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9C98C77B41
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 18:40:58 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id q141so16520975lfe.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Apr 2017 11:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=tjINiS997ueYl5MxoTyycSOs7jE1X50mE/QO1o4/wHc=;
	b=NuJy/DjJKwFRGrQX9Pc9jDiwpQ4xfHP9d1pvQm0KbtLNLJYTdVlSBVh2zXEW9yMUS+
	2S3fpSwYoTwHao99q4Dw3M7APdY8LqM+7cA46BwIVmf+nzZeXSiELgEYr/C/x7u+q/4U
	T3J7YnhHhlId3TW5+4sOu60BCS0otBMGdcYWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tjINiS997ueYl5MxoTyycSOs7jE1X50mE/QO1o4/wHc=;
	b=hxmOfagQdUY4fjNgcc57hFbT5r1YGmwfJhTwnUHXfKH4rV2L3qNzeKXWAK4lhxYkaC
	lCYfByfssNS6ZRLbNfSsPMR9PhlJnlQGTwoeHNlnKy0mtycda9DdDVjC+HXDUAM8tOhM
	K53A1jH/xdrsXTZCjsGq3QYUmfsh3GjSmTgRUBoGWROYeKRXF/mE3W/XxhixeM0olc07
	W8meg/9FavGmNH0IGFiMBg7iP6OHCfSMSnlmKppBx5TI1UdUYpquKvjQ30gnmOh6H2E/
	GT8vk5ubYSI1vmV6/puWv75H8slorI6EWXsnc3mKh9Qoqt0ApMTNzoafqZsNb8iX5Xj8
	waCA==
X-Gm-Message-State: AN3rC/4uH+wcqQAW4/xj1dRpV9ljvzhpNJ4C2HrWQmZgZqCEJMwzIG1asWP5m4pke82LdXNU
X-Received: by 10.25.181.23 with SMTP id e23mr951900lff.98.1491590459621;
	Fri, 07 Apr 2017 11:40:59 -0700 (PDT)
Received: from ynk-TM8481.dev.rtsoft.ru (mail.dev.rtsoft.ru. [213.79.90.226])
	by smtp.googlemail.com with ESMTPSA id
	r12sm1096625lfr.60.2017.04.07.11.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 11:40:58 -0700 (PDT)
From: Andrey Konovalov <andrey.konovalov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Apr 2017 21:40:46 +0300
Message-Id: <1491590447-19476-1-git-send-email-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.1.4
Subject: [meta-browser] [PATCH] chromium: fix null pointer dereference in V8 with gcc-6
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
X-List-Received-Date: Fri, 07 Apr 2017 18:40:59 -0000

This patch prevents "Aw Snap" error when loading a page with JavaScript.

Tested by running:
- chromium-wayland on Beagle X15
- chromium-wayland on HiKey (with a separate patch to enable aarch64 build)
- cromium on dragonboard-410c (with a separate patch to enable aarch64 build)

Based on the fix for Gentoo's bug 588596:
https://bugs.gentoo.org/show_bug.cgi?id=588596#c10

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 recipes-browser/chromium/chromium.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 60edccb..7e057ec 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -15,7 +15,8 @@ CHROMIUM_BUILD_TYPE ??= "Release"
 inherit gettext pythonnative
 
 ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
-GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
+GYP_DEFINES += " ${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot='' \
+	${@bb.utils.contains("AVAILTUNES", "mips", "", "release_extra_cflags='-fno-delete-null-pointer-checks'", d)}"
 GYP_DEFINES_append_x86 = " generate_character_data=0"
 
 do_configure() {
-- 
2.1.4


