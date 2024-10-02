Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136E7CF319E
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 19:10:29 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2473.1727896224069219219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Oct 2024 12:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q93jfkJ1;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b84bfbdfcso8815885ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Oct 2024 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727896223; x=1728501023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBfl9T79s9IrtaND90g2u8axEUqcDlfeta1NcHqo0lc=;
        b=Q93jfkJ1NEzpVFdcs3nEgYytly1pDC0hAQUO4W2Zcslfv4oIfOmTXxfKKFQtlN1RfD
         POUkPZr1Pkk0NfI/wuzup0SQniiG61vqWd8S4xYjZ3slp5H01lj+ILMr3BWxKTwXK5TQ
         a6Iy67BMMe/UG9b2ZxK2AT5hq1KgAWXGLWyQY8jZ00p/e/1lZl2+I9VAKu1FxCmSSNcW
         TrkEp2ueQrfjArNYaXdvrQ54NQJjOswYktL8WY4jfpQwk1b6QblLnZHITggbJDMBzvW7
         soO/FLKodTzsvIMYac9M1pjFodBY+YDENiKdK2mwe9iK7NizyITMDmd7PVSfH7UwQXBC
         M3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727896223; x=1728501023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBfl9T79s9IrtaND90g2u8axEUqcDlfeta1NcHqo0lc=;
        b=sg/t3T55/xQEBXw5ZvHOCSoQjn6ipWBp3xQCG9SbCszCjFnmq+Xg/H5TJFYT07Vh+l
         EwSYYWSOZdJAYGIzlc4tRCULAeVVo+m6eEARjSRXzAIFzQJmUeJoTlVUsHUDIXEBtAr/
         OoC+eV0wV0BCiuoDEA/m+1lv1yMYbHeSHFud+kZT3tsUwZjLhMbAMHKR08/BiIgbArBV
         6P2qtGFk9FHnVjqHYRa6TPgCJjwCFeVajnVk7Dim1QC9QWe17cIMk3ijwCry93rZvdtA
         MNtgcjiwzVGa6iVEMV3aqGA8FdQPZ56v+q5EhbHpCrm0HD5a7SJvQPB1Hgz0K0HZ551c
         X2xw==
X-Gm-Message-State: AOJu0YwAivNse8vjkNgsVuqCy8gOjo47an/MylB6Uk+ntZgNP2U78vNu
	u9hUQP0n5SKu8PgLc/5/LvhspUf9vhAZJ5+iq4osJIn3EIVMVrk2+wp+KBHr
X-Google-Smtp-Source: AGHT+IEvOLxccDKZ/POsmQTYhl3Gr5L9hkXhNlgt97rVToq3wzN9h8a/TXXFXipZyy/4xNLpMjkn9Q==
X-Received: by 2002:a17:903:1c9:b0:20b:9df1:549f with SMTP id d9443c01a7336-20be18b2839mr9090175ad.12.1727896223283;
        Wed, 02 Oct 2024 12:10:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::caca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d60de3sm87455675ad.41.2024.10.02.12.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 12:10:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rsyslog: Enable 64bit atomics check
Date: Wed,  2 Oct 2024 12:10:20 -0700
Message-ID: <20241002191020.1021564-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Oct 2024 19:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112642

Build checks for this during configure but the test is a runtime
test, which does not work when cross-compiling, therefore
prescribe this by caching it for architecture/compiler options
where it will work ok.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
index 41e3963580..cf833de22c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
@@ -39,11 +39,12 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
-EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
-EXTRA_OECONF += "--enable-imfile-tests"
-EXTRA_OECONF:remove:mipsarch = "ap_cv_atomic_builtins=yes"
-EXTRA_OECONF:remove:powerpc = "ap_cv_atomic_builtins=yes"
-EXTRA_OECONF:remove:riscv32 = "ap_cv_atomic_builtins=yes"
+EXTRA_OECONF += "--enable-imfile-tests ${ATOMICS}"
+ATOMICS = "ap_cv_atomic_builtins_64=yes ap_cv_atomic_builtins=yes"
+ATOMICS:mipsarch = ""
+ATOMICS:powerpc = ""
+ATOMICS:riscv32 = ""
+ATOMICS:armv5 = ""
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \

