Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF962C79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 17:13:58 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.518.1788887637780188496
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 10:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KkqK3gl+;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-395cf2535acso4867768a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887637; x=1789492437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9xaRInst4sbOTa4Bg5L1JFYBpE+eFWhdVMEgAyUZb0=;
        b=KkqK3gl+AzRlIpuY3S0432jnlQYU0X4pDGbp42r9bkCfK+SbjHO3023uu9mmHNCtgc
         wdVlogxiYyswEi6fPTymznT0zmR4nYjN1mNPSjUe+9CFSTQ/7zqlaSP3zwYM+YopK5/U
         tl1u8Q++cznUMl2fs725FbqCPbLWkwKLuW4LVIiO672SYNR+OtuPWZWbpJa3+hh1aKjL
         CzDOVQb4Prfqcrq3VUnEx/sXklDdUZrCHH/izx5w0GeLEjGN52XwEbeR7+2ADfdT/erl
         t29wjWC7DnmSedmvVtSwV0TPlWDe31FaXBHi6RHN2iQiva2Li5+hSnAkd4tT0u+WjdoA
         wTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887637; x=1789492437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9xaRInst4sbOTa4Bg5L1JFYBpE+eFWhdVMEgAyUZb0=;
        b=TBX6VZpzlPQSZO7sHi+cArO5UYelm45jIwR58X98heB1BJ+Bd4tbqcMw50ZL6Ccgy1
         bS/vI0iKwVLAZl+rMAJSzWRIJyodGzsY8xAGt/DUqmird/PXyBFyMbeS6oO3kO7hlG6Y
         4XXJgGoMCMbJYQTcld93KcHG2ZnRHLQ+b64pwM1Y/vo5KwAzQGeBxXCb/8+1Cs519dbW
         jpGgKpbEIf/WxBgCTLNQuNadORnzE8ilChOW6l7fKltwDysfNBUZYf0ujmjgMgSxAHUR
         mhLZX7CGZLzLunTl3/JB7cP3FiJAjfxq2lKbOtBIqbva5K0pq7avVsL9Osop6I5El6o6
         G/UA==
X-Gm-Message-State: AFuF++kc7XVIt+OG1N31PZsb1qGqJA6o66V59MsVHedUacKfWTEOuxcN
	JZgOEuEJIC4iW5q4EO/mYyXS/sin+HSZzx4JXqmViysS7jsX6dL+p8TFQCgtsg==
X-Gm-Gg: AYBFou1wevcfT7rCIv+kTABlARgvTN5EtavS1FWf7EJcEBg6de4zAL2h4OPGST5H4P7
	JkGi5l7zwuEYYRFImu+gjYuZ6S7HCtRJkUSXUBbeCzt4JQf7S+vhibZgTazd4XUmcvpk+Mx8P5B
	90PqTiZImXsSBvPz0+hxNfSnpvFzYLG4jRNDLQPufMP8gt5vnkukGzT1hBtNGc3Rj6IUHo7UoE/
	eELHxe+vPpl7nec6MAG19/EK2nczmX8AOlJ6jCUygKWF52DoU1f5aN6YSNMVPr84zTwROAlaVBR
	EC/E3inOWnLvhyYWFRpWgBla9WK2wQhu7nn8f7s/T75he/R8A2SN1DayvdEpo55sL77c1ypyQVT
	oSp97J+uwtKx35aKHBflTJWbSD56LHnsry2yga8thHEZhu+6hVh2eJOCQJc0NZULbd4EdztVozk
	TVG9cm62RJ0+DnuuVsq94akXI/F+CKb5nfvwyhok+M7ytY6Et0eX8pVlIf+5FAgOAEdwZoRDwDO
	XXRXkJqE2XRd5UsGy+Yv8GJgwlG+UwSC0VF4a2D1THYx/5O15jXYhFX1zfUINYplYQTqGJFCQz4
	6nnT6HdrW3XIpaQcpxeiH6N9YLo8AMzDEaI3FSMGa+Nf5qHfMwmS6GdPpzaoOdteo3QH5VGQQ/P
	6nV0DcvyhNWQrjB0Ee47f/iSXOA40OxXeTIQa0wBaCxGLBw==
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr38527472a91.20.1788887637003;
        Tue, 08 Sep 2026 10:13:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm39566297c88.12.2026.09.08.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:13:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/6] turbostat: fix build with kernel 7.x
Date: Tue,  8 Sep 2026 10:13:48 -0700
Message-ID: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 17:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129866

From: Khem Raj <raj.khem@gmail.com>

Since kernel 7.x tools/include/linux/compiler_types.h includes
<linux/compiler-context-analysis.h>, a no-op stub for the new
compiler-based context analysis annotations. The recipe copies
compiler_types.h out of the kernel tree and rewrites its includes to
local headers, but did not know about the new one, so the build fails:

  ./compiler_types.h:16:10: fatal error: 'linux/compiler-context-analysis.h' file not found

Copy the new header when the kernel provides it and rewrite the include
like the others.

While here, fix the mangled quoting on the TMPCHECK line, which produced

  run.do_compile: line 138: TMPCHECK=grep: command not found

and left TMPCHECK unset. The unquoted [ -n $TMPCHECK ] test then always
succeeded, so the vdso branch was taken regardless of the grep result.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/turbostat/turbostat.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat.bb b/meta-oe/recipes-kernel/turbostat/turbostat.bb
index fcd1b116b8..2e69f9604a 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat.bb
@@ -59,6 +59,9 @@ do_configure:prepend() {
 	cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler_types.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler-gcc.h ${S}
+	if [ -f "${STAGING_KERNEL_DIR}/tools/include/linux/compiler-context-analysis.h" ]; then
+		cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler-context-analysis.h ${S}
+	fi
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
 }
 
@@ -68,8 +71,9 @@ do_compile() {
 	sed -i 's#<linux/compiler.h>#"compiler.h"#' build_bug.h
 	sed -i 's#<linux/compiler_types.h>#"compiler_types.h"#' compiler.h
 	sed -i 's#<linux/compiler-gcc.h>#"compiler-gcc.h"#' compiler_types.h
-	'TMPCHECK='grep "<vdso/const.h>" bits.h'' || true
-	if [ -n $TMPCHECK ]; then
+	sed -i 's#<linux/compiler-context-analysis.h>#"compiler-context-analysis.h"#' compiler_types.h
+	TMPCHECK=$(grep "<vdso/const.h>" bits.h || true)
+	if [ -n "$TMPCHECK" ]; then
 		sed -i 's#<vdso/const.h>#"const.h"#' bits.h
 		sed -i 's#<uapi/linux/const.h>#<linux/const.h>#' const.h
 	else

