Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB924C5AD7B
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:37:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48910.1786430225854296937
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CTihxyF0;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84a2dcede83so3539167b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 23:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786430225; x=1787035025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jc4p3QNQP9xakmIk7bjB/C2Ol1l7fpBt5nq25lQcS+U=;
        b=CTihxyF04FxUrYvI/So82cxMwLa6sz6RhzGt/Y+e2UMwya2HbbDd5D2EVgetAR2xYq
         6VJqU78GuicL7sJRIjALRUl0ZJUEYiVQvd62uQJxrQVW+N7cDjv67hImiISW+6f2Zjeo
         JP0CEHMctZIPG7+c5dliw0i1TH46xUGsInkUob4Ct7NDlNbCJxCMKDjql/SUn3HtRc0P
         oM9BbPGm9lBhbguxvfwKa1UrX1JqKU8lX82bI2kB4qVQ6yPJLHP2QPxZU4OvrlLBdJrM
         yUl/Vgt7FoOU4VBkF6m/3yH1py1GbbFBl6NzoP07BZOSS+mNw/H6dT6bvN0y3yg2rhFs
         4i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430225; x=1787035025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jc4p3QNQP9xakmIk7bjB/C2Ol1l7fpBt5nq25lQcS+U=;
        b=T5FSAA96Lgs/CVJ0Ri2Ln09ykCV4klAWigjyh4EBE1iNzf3HoBtbLHwBxSB0kyoyja
         /+Xh4V75HW+THdcFwcZpWcuFGNi3XmQMK3NS6W7NS8cldUIpUdOCv7lEVdT2tYlN3G45
         +cP7sgrU2fHIt1TsGoW3WiyV6IxzJna2JHLMH1US07myzCg79MZy1j2THR3LmTlUS3Ix
         ijj0LKkHpB7oBtpxPslNTXxKSjhyigNxpKbrQh6HoSHEThBe92IpeBLRv1vY5E1Md3ND
         AdtXL/Tk6nu2cwGjsAlDbpUSIzCrrotv1L0NwGhWqIYxvKoO2tMRQJwzCmDKCyWGB1Gm
         mOQA==
X-Gm-Message-State: AOJu0YwofoB+lODYN8V1gzw3FprYp78Cl7I9TP1ag1Foru39BM74ax2Q
	yzENyBocZomOpMXkSQUndk8xK5fxW3iwstin3ycfZ8eYT4nEK1azdQIhczwsBgA7
X-Gm-Gg: AR+sD11lQ3NFmQ3gIn9/GU/aduV4AdgU7VtusSPFidgRPU2JjmyLWIpNIqcR+mLaN92
	wAe9yJw4RDXoR55P3YpjYBsEBTKmZ8DyOXGdxAg7Ra4qn7KTUQhHSllueFteTtIwrj8f3vWY6Wn
	N0iJQPGg/bbuWY8nimACr/KRZzhUr1wFmgoyRVUtOwosvu/49iSrD+2YHUjEIoqR/4cho08S3d9
	ncpso52TCr51XltHxZ/Jl5P5X5L7DY4pwrwu6iELdl6aru7Crqo/bA1qgeY8u86GPnNNPwM/2dY
	tY3uP6FsltmE4z/AiyZf7IK9v/omx8Fsp8ni6oTvsA61KIlrajfKBy/bn/LmtroZ9J3SIl2J1LL
	dCL0Bw9zOCnRJV9CnojXyuDRrk5psb6gbpwuQU0oMjoYpSbXBXcMbpqH8B4kD8Luyz92iNNct3v
	41dd2uMsL5nVSeTiVkTIJZNH/2QjexCVyXqqmREJvKWL0rzhGGrffKpK1huXNm61a0E5v8J7vaK
	g==
X-Received: by 2002:a05:6a00:a211:b0:848:8715:c2d9 with SMTP id d2e1a72fcca58-84fa866d54amr978804b3a.2.1786430225180;
        Mon, 10 Aug 2026 23:37:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm154852b3a.30.2026.08.10.23.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:37:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 6/6] python3-mlcommons-loadgen: upgrade 6.0.16 -> 6.0.17
Date: Tue, 11 Aug 2026 18:36:43 +1200
Message-ID: <20260811063643.152169-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
References: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 06:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128921

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ns-loadgen_6.0.16.bb => python3-mlcommons-loadgen_6.0.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_6.0.16.bb => python3-mlcommons-loadgen_6.0.17.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.16.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.17.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.16.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.17.bb
index 926f3c4aea..0fbbd106b7 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.16.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.17.bb
@@ -21,7 +21,7 @@ SRC_URI += " \
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "f9122f0f09168aad38e3c8b130f728a5a28a269990e9ff724b350495a11054fe"
+SRC_URI[sha256sum] = "a2e85d09e3cc0c606f89bfe1fbf97537c8b5b238ae0afbd923ad9c710fcf2ca8"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"

