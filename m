Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFABE106B516
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20826.1774441265482783069
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LfkiVMZR;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fe655187so62333585e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441264; x=1775046064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNC1dv7D+R5IsugKN4rSV+TfxmQcYt1JhuHlBzT1L08=;
        b=LfkiVMZRyOYp/KynOFwnA6eddXZyo3QZsjuflYxip4UrNDX+7mIWz5fYYmMWriDlRm
         6AObd27nxvD4hAAyYSrFzEYT14vV8QAVi03RqjQGFl2OYPveAcgLqspoB016iC4rD+up
         0+a9z4KiQG7FLApXgUNoCj2Oqu1JCp1yz+23TQm4SpKpWRIOJ5MylAV73NupDgFEpqIf
         DfKl1QY3TSScxU84UPqVoNFYYxWLE7Xv7bC/oYeHFXeZi6dJoKpc4SGuIgyKWyz2sbH/
         B3ZUNEh/x8I7yJWaOmGrtSHdpBMTL14MDPst/X0s0XKPyTV1cVYR9RjVbC4Yp7mXqOdQ
         8OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441264; x=1775046064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNC1dv7D+R5IsugKN4rSV+TfxmQcYt1JhuHlBzT1L08=;
        b=GuYjvTSR6Gux64njZER9XTVUqPji4umejf9KSoOPh5s1i+sTwYLyRMQWS9q7VXzCUY
         6P/qcfsa3aexp4jTs2EwW5D3bC7SNZ5C1tE0O65vK7egPGmpvegEJnYhqLeJ5KXXV9Hj
         XXlNvLea6erTPjAeGlZONeP4rjLI6KM82Ti/k5rVjTefzxPXoxoPbk4XAjlxAhegVwbj
         gTgqzuHPG5BSoIaL5Ndzhx/aWXpfe0sol8qKVqJ/DCfZTzdYM+4ax8uPHggRM+R0Gl5a
         kU5HeL5AeIrQOFaGoGax2JFPZ4nTh7AXq9xbKW2sYrhwBQl0rMyoC1ppu5V5FZhCzf0B
         ehBg==
X-Gm-Message-State: AOJu0Yya24VzdRUszfa2awseLmjL2y+i1mMtycCqBDwufkEWRecQS58x
	q1b4sWG8WNQcqdBfi8WKjBykgTRA1AMAvtucHKQs/1NMP9b/rzhQ3vsEJ07zqA==
X-Gm-Gg: ATEYQzz3cc7Zx+Ywv6HGpwHrAtWnKY0n5W0oTdeXPntEcYS0/+sqFCfjAeZH2iFTCw0
	+VYDBUz1tgCR05ubwSS2QQzm8CxgPBbH5WgR+NWgnlpx6/dUtEJlIGZQ4vfTdZBQnbgNVL6tpag
	KdMgN9qAjTwTbVrj3xyZFcuIeSxI3WrII268Nf+SGjND9DYMqLBfrBC4kU5zC4VD2NK9xDEtSo+
	S3l6sz1zsjU12g9BMAFwZGvTZLYNaFJrpoj953spoNq4BKid02Eyb+zZk4JdTqvjf1VehvCRdpa
	qAzliSCU41i8fHc0FY7PaEoXhIPeYUpts0YOQJw/6kjUQ1HPJlmHvzbJ8saZ4B+0D2nK+PJuUeK
	emzSSDIXlhmzu4KYifu2XG5pmdJUXPWRfsujqc5+wldwM5I7HXKRKSd5bEPI2kVt0Teg2oKyhVH
	VqXrKXRaQGyo2IMA==
X-Received: by 2002:a05:600c:4685:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-48715fc3562mr53587455e9.4.1774441263494;
        Wed, 25 Mar 2026 05:21:03 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:02 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-networking][PATCH 04/15] openipmi: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:30 +0100
Message-ID: <20260325122046.1211090-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125611

PYTHON_DIR now contains PYTHON_ABI, use only the former for
consistency.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
index db74b91f7e..25073fbd3b 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
@@ -44,7 +44,7 @@ CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
                 --with-glibver=2.0 \
-                --with-pythoncflags='-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}' \
+                --with-pythoncflags='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
                "
 
 PACKAGECONFIG ??= "gdbm"
-- 
2.53.0


