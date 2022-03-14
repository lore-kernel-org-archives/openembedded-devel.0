Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267BDC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 08:57:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.24335.1647248228468582205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=YK6YNaef;
 spf=pass (domain: qtec.com, ip: 209.85.208.176, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f176.google.com with SMTP id c15so4181484ljr.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4zQ6j1qgL8xTn8pjmVfPFtjjTTw5khpzdWLNEZfAR6w=;
        b=YK6YNaefkh6+qLkWmRCL7vg5aF0uIikd9GJxAZ1+NTjTu2WZq+r+cHPIvvrIrFCu8p
         T1nPmzMZJrALEYiMxjTyC5JdZs+fRN3xqLK9xwoJN26V0qGVn3zlMfbyhQZBRXiIBoqG
         H4Fsc+k9fl6DSqjLHMiEYyL/43LTIDVoGI0nqMmbrP8I1LVZAY2CR0kzmQ7RT5SkQNvO
         sDkBJW/GWwz0lus91bhczzCG7VDYIuDVQjPwCESUNLA8KKlfOvmMCRqrPqKYZZpqYesB
         dxpWPLvmF9s9CG52/vSXeZgahchx9Ves2upxlfIamGt+xZtKv1cUEUQNeqfyD0lW9Ln+
         sCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4zQ6j1qgL8xTn8pjmVfPFtjjTTw5khpzdWLNEZfAR6w=;
        b=DB8c1j/bVcDr52tLK0koWtWajqUC3FxMrhQGbXf+NF9e/2kVzPfto8e2OSwsgPNqhu
         /HtwXy39g93FP+dK8CVALujkPNPDo8UH+EuKnRNlyxry6XYoPplHb6h7Xq0ghneawzBM
         MJOCcMNX+Y/6sUlxiDtyxxWG9AmUbtQzYGiflN9vk61HBAkA0aXgXXEf4pJLHRKOYOyI
         Z5bGlBCPSbIyD2Z5SigO+HbSNw50Fwl4x4Xg0+XvcPJfBK99ugr8h4xzcfzM5obrTYwF
         9pQPXPfOHwomJCfZdAoCKc0vq9VBD0obCnV0gvJsUCOqx+ZnclZ+2bRJ7g4dOP7fS81C
         3IRg==
X-Gm-Message-State: AOAM530CNUVMZ77qONb5F/9fMjt33ESYgaWd3QZFqgs1ZHXmDENYVCwC
	PTeBxcm8HSnGen/EY0UZTjVPznIhtTp2fu5dOVRHBzU3d3pt/WPOEuUKZmaOzbGDp0Sfm0KcUWX
	M9vok9EW2WzBn/lmDP2JluPKuz22151CUtST7/w0BrgvMDlWnjEiP45poPayyGdzlvhYUpRfOWf
	L3BpVQvjYJJSx8/g==
X-Google-Smtp-Source: 
 ABdhPJxXsRAKj99oeli4qsGriLd6Jy6Ppx8Jtet0TEhYnc3dw0CXI9XSvPRjGf9I82ATg7dnG64DMA==
X-Received: by 2002:a05:651c:b25:b0:247:eb54:a9f3 with SMTP id
 b37-20020a05651c0b2500b00247eb54a9f3mr13519483ljr.399.1647248226696;
        Mon, 14 Mar 2022 01:57:06 -0700 (PDT)
Received: from localhost.localdomain
 (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 h3-20020a2e9003000000b00249278d3bd7sm1751237ljg.77.2022.03.14.01.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 01:57:06 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [meta-oe][PATCH 6/6] opencl-clhpp: Update 2.0.15 -> 2.0.16
Date: Mon, 14 Mar 2022 09:56:46 +0100
Message-Id: <20220314085646.38283-6-daniel@qtec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314085646.38283-1-daniel@qtec.com>
References: <20220314085646.38283-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 08:57:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95977

- Change branch name master -> main according to upstream repository.
- Update 2.0.15 -> 2.0.16. Changelog:

    1df82b9 Add param traits for CL_DEVICE_SUPPORTED_REGISTER_ALLOCATIONS_ARM (#165)
    814e7b2 update the C++ bindings code example (#151)
    6d833a5 Update opencl.hpp: Add CL_DEVICE_BOARD_NAME_AMD (#160)
    25ad589 Added missing definitions for deprecated prefixes and suffixes for version 2.2 (#159)
    21a34b0 Test two additional defines and update descriptions in header (#147)
    ff7318c Fix cl::enqueueMapSVM for cl::vector and cl::pointer (#145)
    30d4219 Test most of the possible defines (#140)
    63d9e41 Fix unreasonable error handling in opencl.hpp (#139)
    0198c41 Add support for cl_khr_integer_dot_product v2 (#141)
    8df6c8f Transition CI to Github Actions (#142)

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta-oe/recipes-core/opencl/opencl-clhpp_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
index 5a0776c26..8a712602c 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
@@ -1,13 +1,13 @@
 SUMMARY  = "OpenCL API C++ bindings"
 DESCRIPTION = "OpenCL API C++ bindings from Khronos"
 
-SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
 
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PV = "2.0.15+git${SRCPV}"
-SRCREV = "f7237f3799009d856935e1eecfd7c9301fe522b4"
+PV = "2.0.16+git${SRCPV}"
+SRCREV = "1df82b9749739f2681081092ae163bb0f0d40f66"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


