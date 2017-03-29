Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B6AEA77BD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:16:53 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u18so1221726wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xYtUd15nSwEsxhvJ1m3QBh8TwWyg+WPfjXm/xfPx4M8=;
	b=bmdpamd7mSPOsMkn1qzT9eHfJ+ePSg0gcMo0qn2cQvqNCqifklpNrs92gcqE9adsZC
	y/GcgHOfSFc78tNRadsv7YLmeIJcFAObGHm2+T56GH0MWmN4Mnrnt2jF3d3zDaqQPnzh
	ZBAftrh1yYF214LDZxUYxV/kjpV3s96+c5jxjCQGVc5ZCxbSgmxHuprP0ozTyUEpPaxh
	pWvrJ0gORyP9+5kapgVIM3k+5VFsZFzT+GGqMAAxMoIOx+7DLgAFqJCUCiuGkkpaVCDI
	YNL7wlmh+RXSls4X8o/cl3Vm7jMxTDDQfbayjBrFDSR9BsKri21k3Y9VmMjYHa5Lq0uu
	RRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xYtUd15nSwEsxhvJ1m3QBh8TwWyg+WPfjXm/xfPx4M8=;
	b=Jjlvd9LHVfC8EGgBcu+ySm2dv/nzW7Wo2amNuW3gjX3k3PhtAJESv45EbQCJfCjp19
	dLZubHvBtKDQ/VXCN/kLbCMlFlEimHNVzGMAKQ4fJ2xz7y3ooUUsxWxbsLKl7jkuM1TS
	/1v6XsLkDOr5gPWeKXZa2Ul3o3M+qwpe1KD59TGoFSpENGkttGJiVnmIR/3KU/sDUIQk
	lHuNSn67x3p87I4wBAz8vI6NndcOsji5+ilIyIBRTwGcnBa2a6ZMNIBcRr23K/b7cKzO
	UE96XKvtcC2W0Tnrnby4w91DGbxUb3e+/Q3cp2eR+SKddx8xY9SwoP+K6c/uq3FrEju2
	V+Jw==
X-Gm-Message-State: AFeK/H0B3h3p2UGYgQfExXT6zA5VvaC23t5nbDqOKCidHzlPhlGA/JzB2cHi1OXMOd0pbw==
X-Received: by 10.223.166.162 with SMTP id t31mr14896134wrc.15.1490779014716; 
	Wed, 29 Mar 2017 02:16:54 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z40sm8556645wrz.67.2017.03.29.02.16.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:16:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:16:41 +0200
Message-Id: <20170329091643.32180-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170329091643.32180-1-Martin.Jansa@gmail.com>
References: <20170329091643.32180-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 7/9] vboxguestdrivers: upgrade to 5.1.18 to fix compatibility with 4.10 kernel
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
X-List-Received-Date: Wed, 29 Mar 2017 09:16:55 -0000

* 5.1.14 fails with default linux-yocto version:
  CC [M]  qemux86-oe-linux/vboxguestdrivers/5.1.14-r0/vbox_module/vboxsf/lnkops.o
          qemux86-oe-linux/vboxguestdrivers/5.1.14-r0/vbox_module/vboxsf/lnkops.c:93:23: error: 'generic_readlink' undeclared here (not in a function)
     .readlink       = generic_readlink,
                       ^~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{vboxguestdrivers_5.1.14.bb => vboxguestdrivers_5.1.18.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.14.bb => vboxguestdrivers_5.1.18.bb} (93%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
similarity index 93%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
index c27791e95..4085b9fc7 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
            file://Makefile.utils \
 "
-SRC_URI[md5sum] = "21eaec9f21477d555559a63761779880"
-SRC_URI[sha256sum] = "8267bb026717c6e55237eb798210767d9c703cfcdf01224d9bc26f7dac9f228a"
+SRC_URI[md5sum] = "1a7db64cd69ba6d39574fb333e031251"
+SRC_URI[sha256sum] = "7ed0959bbbd02826b86b3d5dc8348931ddfab267c31f8ed36ee53c12f5522cd9"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.12.2


