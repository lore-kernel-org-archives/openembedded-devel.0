Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 52E696D230
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:51 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l19so3400628pgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bO2vaccFElOPcx/dGBerDxWNqYx2Cv2YtDKLp/GJ4Qc=;
	b=OtKX8tMgS805L8S784+L8jymj8Y/68y8jtUe+TjrJG1dYPixt9guSB5VhYU3x15BUp
	IODTx6b4So6GqH5yq3BqIRSLICiyp89SW7mXDoz1dvJwbplqo0zjvALNsyGPDQcxA9zF
	WbSrRTy1/4t4M3A7a7EoDQr60K+4tS5oU20v3GtoLSC5VmLBX0JOJonpRSrH5+9kIoD0
	iBfcTHMaOjic3igbImOp0Pv+FVKiA8+OlzHGDukX+bOIb2c0zrRsNDOTeGeYZYUYMNvC
	vB9QA8ojW4tqAlvznlVzbuiqnOo4PD3PnYUj2Rs4o4ukjBZhraAXRoFRXQbW3Kgq37F0
	7Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bO2vaccFElOPcx/dGBerDxWNqYx2Cv2YtDKLp/GJ4Qc=;
	b=HOQGCU1YsoyKJsADpmAzDGlzEfiPElquYVll8kYcuzyYg0sFxoteBHtnxsGsssveq9
	26yaw/mxcOQrugB6iPIURxPmC3ixzgIHBBbiBqzixtxT6X3jc/4RIfLS9NnduRgAJ/ic
	CgFJhbDP8qwQ+r2UxbFEprFd+LyOD9MPJVeuBwgpLSTBBC4/2wsApCDV9DgGf/vQgsqP
	fmphZc3q7WkpyQa5DVIKXrNQTOeUqWv8iVwTjXjpLdkmb8Ku2oapiRLZCDIs2v8lzY5h
	Vfm6bA6dRbRuhYZ0IUAXdFyudGl98vMZPdHxElCIpxg7B5UEfMdFJhxaCJoVEPuc9yKp
	qBtQ==
X-Gm-Message-State: APjAAAX/DljGy1ft+UCRz8S/uPX0jXLz9e6D7aJko/CRWbLN95Z1Rpwz
	Ndq6wJwbdKh9k7iSLuTKz6Hn3ytk
X-Google-Smtp-Source: APXvYqzqewZMAM5MHaaPS9f0M+qz9osHwbQY32ZuLMneo4DwxYWmYB+Y38DlXO8ygKiSjvvT2QvuRA==
X-Received: by 2002:a63:1462:: with SMTP id 34mr7713660pgu.417.1560621472268; 
	Sat, 15 Jun 2019 10:57:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:27 -0700
Message-Id: <7c6e1c674a2ce9cca8129c2dbf1d031be4e22f5e.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 23/23] turbostat: copy bits.h from kernel to turbostat
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:51 -0000

From: Liwei Song <liwei.song@windriver.com>

because bits.h was included in msr-index.h, so we also need
copy bits.h from kernel to tubostat to aviod compile error.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
index dc3e78f..3f25e6f 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -41,11 +41,13 @@ do_configure_prepend() {
 	mkdir -p ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
+	cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
 	cp -r ${WORKDIR}/COPYING ${S}
 }
 
 do_compile() {
+	sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
 	sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
 	sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
 	sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
-- 
2.7.4


