Return-Path: <yisooan@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id C618179DEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 13:08:52 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id f26-v6so9314669pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2018 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oAOSvnoTboi5zQonk5mqkVxRvDQVpuj6WBUdZgrqRk8=;
	b=ug0y8923XUrwIZ6hYywOf0JgJGCTz9V2osLu/l/CS99Xr4TvJt2jkQsOma+c2Pa7oD
	E0V3GNnpAJytfRds94qEpwWQpqNiZVB98GP6lRTkf0zUd39Zlc/fGO/XdZ5lC/lUe+j/
	lCJNFxKMzMAj2KIPac/71b79otxCLqiWlqrvFz+2DcljS91OALo51/dUPq5foCu6DQjK
	4nm+0/ZAsDrXvMBt3RZhKqgPau0qRb/8X1w6qk9RNwRUu2CY5YoO1vVdDEA64Y/SwHsm
	WgFUIjZuxJ7TAugcnScmmegrHcIz541mAYvG142xsWyXpBD7jElkOuC0wlawRHla7J0i
	vojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oAOSvnoTboi5zQonk5mqkVxRvDQVpuj6WBUdZgrqRk8=;
	b=RUwEZ3zpASPuVnku65teV6tf3JcAQfY97ZwTMDIPy2VGHJzGPeA3JvtQbnMGOCWhQ5
	F79oJRAAx3ILOA/DVq4i4bTperMr+ECDIf8S76aOIQypUVK9yDMn/rn5KnjWn1vbtcu+
	qOQUemSNY0r2o7ZFhGmoaTf9KGhfw6OtM26XAYhhtab8l7ahet04lIMxj0Ox9Lwk1hqH
	MmAZf2vB4+M01o5NLjNEZ89Sg2dkOB4Rh47MMmSEtMoYfeLJgszGbmwDPKv/PbQo/iEa
	kOxDcsBE6D6Zu1hTC14ESrtsB9S3wrIo1AHfgW3TiM17Sn55dfuYCWCvXitiHWuoMxds
	nMKA==
X-Gm-Message-State: AGRZ1gK8HIx6dkOk9QaYdmCrprpbNY2HZRycSI9lZbgESE2ibLDj0Pkk
	mEMbEiJus0gjrQ7lHdfg/g/IKTlS
X-Google-Smtp-Source: AJdET5fH4US/l2zHmKkzzWh9jtkid3zs1NVS3h/nHyGjk5lE9jm3HobjC7oCwvaCcOI80c9G0u+2Eg==
X-Received: by 2002:a62:3a8c:: with SMTP id
	v12-v6mr7598082pfj.118.1541077733144; 
	Thu, 01 Nov 2018 06:08:53 -0700 (PDT)
Received: from localhost.localdomain ([221.158.206.146])
	by smtp.gmail.com with ESMTPSA id
	l26-v6sm55832002pfg.161.2018.11.01.06.08.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 06:08:52 -0700 (PDT)
From: Yi-Soo An <yisooan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Nov 2018 22:08:38 +0900
Message-Id: <20181101130838.9427-1-yisooan@gmail.com>
X-Mailer: git-send-email 2.17.2
Subject: [meta-oe][PATCH] uftrace: Support x86
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
X-List-Received-Date: Thu, 01 Nov 2018 13:08:52 -0000

If TARGET_ARCH is not set to i386 for x86, build will be failed
with logs such as "arch/i586: No such file or directory".
In this case, TARGET_ARCH is set to i586.

To succeed the build, add additional function named set_target_arch.

Signed-off-by: Yi-Soo An <yisooan@gmail.com>
---
 meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
index e377a5c9d..ca38e6aa2 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
@@ -18,7 +18,16 @@ SRC_URI = "git://github.com/namhyung/${BPN} \
 S = "${WORKDIR}/git"
 
 LDFLAGS_append_libc-musl = " -largp"
-EXTRA_UFTRACE_OECONF = "ARCH=${TARGET_ARCH} \
+
+def set_target_arch(d):
+    import re
+    arch = d.getVar('TARGET_ARCH', True)
+    if re.match(r'i.86', arch, re.I):
+        return 'i386'
+    else:
+        return arch
+
+EXTRA_UFTRACE_OECONF = "ARCH=${@set_target_arch(d)} \
                         with_elfutils=/use/libelf/from/sysroot"
 
 do_configure() {
@@ -28,7 +37,7 @@ do_configure() {
 FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/*.so"
 
-COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
+COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm)"
 
 # uftrace supports armv6 and above
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.17.2


