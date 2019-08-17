Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4275C7F270
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 19:40:56 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id m3so4029948pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 12:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SjH2ToV6HaS3zshxR9IDvKONyssW3N4cS2XGLsa0bsE=;
	b=JB36zB7Tvl165v7CSB/uhwOabtLUaDXkOUP0tMXw0in1mE+bUM9L7YrBlYQrqR3bIO
	+ZcKj+qrDz8kG4TyKGRsM8dKA1WqBDhIRGXLbO+e5IVK1FCM/qQkspJ56Zq1ilopwKCt
	eOH2gvLkaW19bwbAeCNmEv3iWi/1QQ/fp72wp822bXvvY7gHejNjkjLNp33jBY32LE+I
	LcsWAWhQHn40XD/pRGyBy2SdRk+mcH3gmVmw+v3WjcsBu6JbIeIgJM4KWRTs1oVvzBtx
	Btyb0jKfgqofDnyVB0lQWmnSEyN9UatOHrVEdwAo2M/Vc4ZWCRTMP6gopQf/G0i1WOwH
	9k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SjH2ToV6HaS3zshxR9IDvKONyssW3N4cS2XGLsa0bsE=;
	b=pMnGpP1DW3gfuH3XjnnbFva2iNhWpKOfPrlIejlsb1tbYxgfCfRM0wEyY6Mbi5R+J8
	DQpAPKEzYnOoKx50xhsuFX6rz6Zq2KmY81VrAorvqlNGcqqNqhJ1nq65DxvE2SwXTtdp
	KhCCP+6TUO9h8Twmv8QD7yVZ7QLHsbixje6wG2TgyOWcfvL1NtNQPt7bzWAQDIn/UuFE
	2kYlw7eayAnGR4LE8KUsfMi+9GQtPgGhJrKxRogk8/WqT8PEDVSIEfZOu26nHimGDFnV
	Zv49UIUDOxlDg2qrgn/cK2hDBUMd8Rp+lGrD/IxXx9atbEHikbF5DN7PRC/8alb4rI8x
	LCqA==
X-Gm-Message-State: APjAAAWtWrz0sLD/l8Z7hef0U//Nhl8GhKYvivq77NwukO5Gx9F5qBmq
	F0dutE/t5E+5nqdd0o2zr6xgh79y45U=
X-Google-Smtp-Source: APXvYqwPEL6IDQH/+36RUxsL0xEh03VMSf4iANJSe3TN8Q2QDKEdk09sHNODS+rY67gxJSanAbsJww==
X-Received: by 2002:a17:90a:a789:: with SMTP id
	f9mr13302770pjq.19.1566070856998; 
	Sat, 17 Aug 2019 12:40:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u24sm9679542pgk.31.2019.08.17.12.40.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 12:40:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Aug 2019 12:40:49 -0700
Message-Id: <20190817194049.40413-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190817194049.40413-1-raj.khem@gmail.com>
References: <20190817194049.40413-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH 2/2] grubby: Add bash to rdeps
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
X-List-Received-Date: Sat, 17 Aug 2019 19:40:56 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: QA Issue: /sbin/new-kernel-pkg contained in package grubby requires /bin/bash, but no providers found in RDEPENDS_grubby? [file-rdeps]

I wonder if new-kernel-pkg should be packaged at all, but dracut might
need to be cleaned first to not need it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb | 1 +
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
index dc3a70bb52..7403cf64f7 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
@@ -35,6 +35,7 @@ do_install_ptest() {
     sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
 }
 
+RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN}-ptest = "util-linux-getopt bash"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index 8430b7e102..6d53f48cd1 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -35,6 +35,7 @@ do_install_ptest() {
     sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
 }
 
+RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN}-ptest = "util-linux-getopt bash"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
-- 
2.22.1


