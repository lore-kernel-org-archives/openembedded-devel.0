Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF307F281
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:23 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a2so4491709pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ArQrmhMTUaLiIL6VjFftZwTl2x/46SQLBDIlzVKmD7s=;
	b=SyfdDzvqMWVvBGK65t5xeFuhUanZILEIma9vD85u3TjggVj5yhfgLTYqc/RsKVsq99
	PidjMj2CAxZt5IXmEH1PsD1Lqg+3zApJHqHG40iDf2tQbd3bPiXBfl2K9kwTliTwx5i2
	v8MOrB7uULEYVOCN3t4JuXyS3nNm0K8ZvRKC7N24KI4+fgZq30sXPA2jCmHEHugTOewM
	zfN/BjESztRfcfQes3GLvaIeQDEXkCkMa7nRncAufpmpRvUCz3WYtH1tkZijqcHp6dWb
	hyQ1xhcpFceqMMJUODwdU9D2NRj2+8fWnGKYr9REQtgUPXciudY5v6JFFb70ZkL2p8yA
	FdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ArQrmhMTUaLiIL6VjFftZwTl2x/46SQLBDIlzVKmD7s=;
	b=RAYnUrJK5chCfJGGhxlKUQr+WMNt04onI5tdWzbo+5TVCkkoaSrxDt9mUvjTrf28O8
	ZwQnLmptwbFFxCDGwfe+du5zLuEEcTd2uTAE9HbiC/yxoVlELjO1D/qeGGaoI62I3c5i
	Vu9SECaTAL0IthxdPkhoI32uDxaOjgqByQpsSTOdBAXkvlFUsMgrBT1slgBFXZ8jK84t
	w48U8u5OQyNsfFiDQrYjxdrTKyWKoPZeD+g+hGGsrry3NK0/RHP04L84wTpouT6bwMgM
	2RjryTUpSoNOHdPM2G7EPj0NyggOfixnr1nvBc3rdi94Wy5ZF9ihMm+Bu+9OumoJZIYQ
	zEHA==
X-Gm-Message-State: APjAAAUWq2bypftF9016OpTxSDwsC0R+mBkY2+9/9/QCn/WV+1Tw2z56
	fv7hFjT+9YTD34n2om+2QC7env8kkL4=
X-Google-Smtp-Source: APXvYqxE4D6nE295uOXh6LiTFCBOS1KdKYDiGH90XWvfO87ptud7WKhM0koh8nLwwmlE1aLPK86fww==
X-Received: by 2002:a65:4002:: with SMTP id f2mr21516456pgp.447.1569801324585; 
	Sun, 29 Sep 2019 16:55:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:55:05 -0700
Message-Id: <7121ffac6230e8fe0ff09fcf98906bab03e27a75.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 07/10] bpftool.bb: Disable SECURITY_CFLAGS
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
X-List-Received-Date: Sun, 29 Sep 2019 23:55:23 -0000

From: Khem Raj <raj.khem@gmail.com>

We do not pass CFLAGS to build and fortify sources needs some
optimization to be enabled, its better to reset the additional flags and
let the build system add them as it needs

Fixes build failures like
tools/include/tools/libc_compat.h:11:21: error: static declaration of 'reallocarray' follows non-static declaration
|    11 | static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
|       |                     ^~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d46e1e767f6b91dc25935e0c48d9d362dd50d879)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index f75ac6f..a5df547 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -10,7 +10,9 @@ inherit bash-completion kernelsrc kernel-arch
 
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
-EXTRA_OEMAKE = "-C ${S}/tools/bpf/bpftool O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+EXTRA_OEMAKE = "V=1 -C ${S}/tools/bpf/bpftool O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+
+SECURITY_CFLAGS = ""
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
-- 
2.7.4


