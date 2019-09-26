Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC3F7D076
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 16:26:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 3so3254955wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WukLySciGkOY+wiO4p7gapUlcWttzxghrkMXJ5i0WiQ=;
	b=EY/5LJfn4WM8RVcc/HTuz3BprEk0Rg8qsa3ksb4xskTnRcGa1IL5nyow7e/XFQw3DV
	fbakClrW8tsgAIoN26xAjpO8d2yIl1CtgZuWLLxXlEyahP6NP6Oq1T23wjnpFcfC1WUP
	q03TLb7+rqYYtDSfR2Ex4s3ycivwAvx3Z0u8e1OEM/0I6vX+uGgoi0ykms4FF5H/THqJ
	FSGWRGryaR6sPWMyVg3h40ZLjdTtZpNd757EicSI01xG+/o9HJ09g43dTyc5e4Fmv69O
	7441f5Z+smRpzK1PQRU3Gmcya2LZoblkDrhTCH1W8dkudczZYe7t80XPpGbVW6GgyQNc
	EfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WukLySciGkOY+wiO4p7gapUlcWttzxghrkMXJ5i0WiQ=;
	b=APLtJhKuckBEvjpi0fO+IolRYnWMoF8k5VYefzrbDDsGuORBx8IUQn28Ngfub87ZQ1
	UmRhsik6QlEN0GNdZgpqqLw0ey5303Vep/qTYZjsb0FWxxi7+hRNDdE/JYk3wYDhoyZ0
	I5MzdCoEVfMRNLWBb0Fa+HuLQNtZdUiaQCy23I9zZXPR7BebKTP5xkaCF86WKMkCh5vz
	3JNwFHies2TjS7HKfAdLoWzM/sjSGgHWO5DPP4gpd4249UrJRuwF8DWvG+6A0US6WBKE
	S8vt7AfLyX1eitSOzhsWjLT8uuKyacIKHLgzc8XQiKPqk69sViIN/0t+/urY3SawrhEa
	txXQ==
X-Gm-Message-State: APjAAAWDYoCSNcVV3bbEYQh7Og57JXDr0pETFpA39RTZg1gRa+SJDdPe
	Capclnyv7a5JodFG0M1AlQxq2qkB4x8=
X-Google-Smtp-Source: APXvYqwkP8XcAps8s+vOr/oPDaprVFaXH0wjwVrG7DrBWmHPk198PuPitVCYCF60vqy1M8g/NmuCDw==
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr3607957wmc.83.1569515211670; 
	Thu, 26 Sep 2019 09:26:51 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	s19sm8414932wrb.14.2019.09.26.09.26.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Sep 2019 09:26:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Sep 2019 16:26:55 +0000
Message-Id: <20190926162655.375600-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926162655.375600-1-Martin.Jansa@gmail.com>
References: <20190926162655.375600-1-Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH 2/2] Revert "spice: Drop broken native"
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
X-List-Received-Date: Thu, 26 Sep 2019 16:26:51 -0000

This reverts commit 5f32fd6b08d79b9a4d1bffb9b2bcbc535a5b27d2.

* fixed by restricting -Wno-error=address-of-packed-member only for
  target, spice-native is still useful for qemu-native when spice
  PACKAGECONFIG is enabled

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 2829a59d15..39bee99a4a 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -39,6 +39,7 @@ export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
 
 CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"
 
+PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG ?= "sasl"
 
@@ -53,6 +54,6 @@ PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 EXTRA_OECONF_append_toolchain-clang = " --disable-werror"
-- 
2.17.1


