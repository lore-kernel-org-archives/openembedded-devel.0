Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41A6C52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:47:27 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.59017.1723121239146315130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XnqFSecP;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: twoerner@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db23a60850so646773b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 05:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723121238; x=1723726038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6Qwdcr4zPTkWVvvtzzkJgdgyb2n15ZxFOTDcKjVxNE=;
        b=XnqFSecPPK9ifJzuj4BANIbllw8ZPxLeI9t2evJhuNm+cGUUHKW5lo5msBNK/7LJyC
         KJ4f3/tn7p1Guu9MtA/j7HCDBDlcH8PFx6u1rV6W1JWb2iHf/XMkR8X/ZOdEZ4mJNz8X
         Z3hISfPYKbVqz+lJ8pP1k/v/aPf0hLl2oyXMLy4wDLh0buCa2zEDmHsz05Ha74tt+M44
         xU7/GYX/zrSiH9a9ST+uhxx5AOWs0WZiqFNj1Fhpwr0hmXaRT888fWQiSC0VY9/wKqDI
         1F1R4v5uPDIqdhc9Vxlxl1DI1gtl2ckG/M+qoYMUE07C3WXDATsByvXmyAI0VpKOc86L
         CgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723121238; x=1723726038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6Qwdcr4zPTkWVvvtzzkJgdgyb2n15ZxFOTDcKjVxNE=;
        b=BWX2rQ8P6cerXCe75471NK5EpSbXAWQuPW7BOO7LhB2jIlpe8Y4aWLy0kK2G+wj5l3
         bVwtONdAhiAvHzWcL4vSNg5BqpshMXHZoYJf+PSJncURRg1TAUbwPWf8LWZKcjR7VD3z
         p47x81ANLbbuTFR5EzreYuXbALH5XfqZXGXy4jAv1jCoP/slrlR/V/2Ed0MTAe0ope/S
         USU7qLDp3ecWweaOMTMhllDLen04pwYmhNzIFjutSM1uR2i38PH8K8pNBeCMlRA7TpP7
         1rm4UtVAG6XpQiidwuhddNLYHNySlVf/+10TibZOxyXHEMUUZOMtHsCcXNDmc0Bhtdx9
         afAA==
X-Gm-Message-State: AOJu0Ywc5sp/Ca0yCSx0yPndGRxb9ZXfUEmYRE9XAYofteJGqqVzq9aw
	cKE51S8OKUJtRkAK+Y7o52kDSPfnREVjx7CHEGxEB6KoRTvaPvx+CS9LqA==
X-Google-Smtp-Source: AGHT+IFtuhK5Ig4/vTvobx8aIXdHvxDWtt6B40Hz8ArVgdp+AXGWC2Ur0ZbY0rhkENFTUme6HU69Wg==
X-Received: by 2002:a05:6808:2022:b0:3d9:ddce:ed31 with SMTP id 5614622812f47-3dc3b45e6e4mr1763045b6e.45.1723121237612;
        Thu, 08 Aug 2024 05:47:17 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86fb16asm12856921cf.13.2024.08.08.05.47.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:47:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] =?UTF-8?q?python3-matplotlib-inline:=20updat?= =?UTF-8?q?e=200.1.6=20=E2=86=92=200.1.7=20plus=20fixes?=
Date: Thu,  8 Aug 2024 08:46:56 -0400
Message-ID: <20240808124656.3877-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 12:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111660

Update to the latest upstream released version.

Add a PYPI_PACKAGE entry to the recipe. Otherwise, during final image
assembly, an error similar to the following would occur due to the fact
the yocto package name (which includes dashes) differs from the download
filename (which includes underscores). NOTE: this would happen with all
package types, not just ipk:

	ERROR: core-image-base-1.0-r0 do_rootfs: Unable to install packages. Command '/scratch/trevor/oe/builds/jupyter/jupyter-rockchip/scarthgap/build/tmp-glibc/work/rock_5a-oe-linux/core-image-base/1.0/recipe-sysroot-native/usr/bin/opkg --volatile-cache -f /scratch/trevor/oe/builds/jupyter/jupyter-rockchip/scarthgap/build/tmp-glibc/work/rock_5a-oe-linux/core-image-base/1.0/opkg.conf -t /scratch/trevor/oe/builds/jupyter/jupyter-rockchip/scarthgap/build/tmp-glibc/work/rock_5a-oe-linux/core-image-base/1.0/temp/ipktemp/ -o /scratch/trevor/oe/builds/jupyter/jupyter-rockchip/scarthgap/build/tmp-glibc/work/rock_5a-oe-linux/core-image-base/1.0/rootfs --force_postinstall --prefer-arch-to-version  <package list including python3-matplotlib-inline...> returned 255:
	* opkg_solver_install: No candidates to install python3-matplotlib-inline (null)!

Add additional devtool-discovered information:
- update the build mechanism to include python_setuptools_build_meta
- add the RDEPENDS

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 ...-inline_0.1.6.bb => python3-matplotlib-inline_0.1.7.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib-inline_0.1.6.bb => python3-matplotlib-inline_0.1.7.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.6.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.6.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb
index 13210b906045..335565643aaa 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb
@@ -3,6 +3,9 @@ HOMEPAGE = "https://pypi.org/project/matplotlib-inline/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4692a0eb42ca54892399db2cb35e61e"
 
-SRC_URI[sha256sum] = "f887e5f10ba98e8d2b150ddcf4702c1e5f8b3a20005eb0f74bfdbd360ee6f304"
+SRC_URI[sha256sum] = "8423b23ec666be3d16e16b60bdd8ac4e86e840ebd1dd11a30b9f117f2fa0ab90"
 
-inherit pypi
+PYPI_PACKAGE = "matplotlib_inline"
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} = "python3-traitlets"
-- 
2.44.0.501.g19981daefd7c


