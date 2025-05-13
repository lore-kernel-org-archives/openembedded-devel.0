Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9022C3ABD9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 20:04:14 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.86194.1747166650530390505
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 13:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NkRBERsQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e6df1419f94so4967804276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 13:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747166649; x=1747771449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOS0yZhZlGJ/xFkphCSPS3vm8onhdc+FeifDv3akRcc=;
        b=NkRBERsQ+PddmvRJVd0D8V7MxcuXQnQ8hokdRZDC/HkyHx3gSKf77VPDtGUb3oeT4W
         WSl/dlVP7TAlI+/dtcEAMnqO3johAFT5lolk4w273FPfRoElXmF8R73nbzd6dNMyKRsw
         UhCsIVjsLZmk1CtipyE0z7cEcRikg0HbbIH6LReeh7O38CWD1CCnQLg8gr8Onuzy80CN
         ajsl/bmtnWmSwWyB+BxVtUD0vFc95NJ6RtV5xss3s30hl9mPZ5BREFUoCyAGiozKkhVe
         mNsyCeViGACoCQ5/F6ZYkKU/us/MA5VlBYi5MSEA7Rfr3SQOcH/3ly7LRSD49LJFOIjK
         CevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747166649; x=1747771449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOS0yZhZlGJ/xFkphCSPS3vm8onhdc+FeifDv3akRcc=;
        b=NXCXfB0LMjn8uZlQ627i/F8vDkWR6ErQAx7mYfiL1tvzOAFjp/52HzC3snRolSDgHd
         C8CHyHUj3PVJjqfbd6y4rMY08NcM4BVPqxgCCw4mo67Wagkk5IGgKBjM4vQaTHstJ61d
         qJWKmo0Nmmt8jWwfkWYM5l06dRogCXrrWjwnHnTCum9Kwmby60ij6x+GfaMM+/7eNOPK
         h5Ueb4b8rvQGahYFEbH+fH/BYcdbKUf6k7LpcHFgn+HC/oZJxPiGb+njfQjv/gdzHuOX
         PgjdMVkfkBTQkuM6qSSI4ljkX3wtSc1pZCDl4iROjom/zEf7XEYeygI54mjccDQOvDoY
         XBrg==
X-Gm-Message-State: AOJu0YyMM0jwsGZz+xpX6P5eWI14eDZ7HDGYXyD+ogXUhLkdyNqjIriA
	c0ceO2jkrtn972uvRelMuPSwgwKS/GpBgOdyEPrB5D5GOObwCK175NNkny7b
X-Gm-Gg: ASbGncvwh61IUCkFmeE+ttNWSv5QrRMvoewmkiiziA13c8H7ndbTgCmxwOKl9uviHA8
	44HxwamcbiuRi9DdVCzwIvNIcqFJUIlEJZK5BayneL/L4nIG4AIwaaq65xJAheqr91d8eavm7WZ
	DDe+NsA85gRhnod049G/ROIw8q97KbBWxOw8k15Nr0PTEMVty4YgnhBRRua8d+gjnZq5REE+D4k
	no8f32xm6Tv7T1uzK+VMwSHBcKG3Ai9N6T0dyr7BeImv64GAxUo0J6b9OA5yXPEQ21srIDd5mOw
	i1LFepPl2jQkONVdlOt9VseCZzpozWYDFYMUMvIPxIMA+OqeMHB821CT9/ztlWNO9A==
X-Google-Smtp-Source: AGHT+IFXVnexNLKSBsdfuWgp2iQ4WIM2FJw7QbYgp6Mq1HaKSINeGpBxwfB2sHJEmohOcHkrxNYnxw==
X-Received: by 2002:a05:6902:230d:b0:e73:2da2:c300 with SMTP id 3f1490d57ef6-e7b3d5e62d8mr847389276.44.1747166649601;
        Tue, 13 May 2025 13:04:09 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:6ade:98e4:ba03:461d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7ab5fb741asm1513944276.21.2025.05.13.13.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:04:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 5/5] apache2: Scrub -ffile-prefix-map in build.nice file
Date: Tue, 13 May 2025 14:04:06 -0600
Message-ID: <20250513200406.26830-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513200406.26830-1-akuster808@gmail.com>
References: <20250513200406.26830-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 20:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117405

From: Khem Raj <raj.khem@gmail.com>

Fixes
QA Issue: File /usr/libexec/apache2/build/config.nice in package apache2-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f00a3f153a0b2a1bd9e77f24f857df12b41bcbba)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
index d4ae26d9c7..9ef8c13b79 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
@@ -138,7 +138,7 @@ do_install:append:class-target() {
     sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
            -e 's,${DEBUG_PREFIX_MAP},,g' \
            -e 's,${RECIPE_SYSROOT},,g' \
-           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
+           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
            -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
            -e 's,${WORKDIR}/recipe-sysroot/,,g' \
            -e 's,".*/configure","configure",g' ${D}${libexecdir}/${PN}/build/config.nice
-- 
2.43.0


