Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3216210A88D8
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50972.1774538529481972100
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W8yAw5Un;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so12882565e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538527; x=1775143327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGf3dTV4a9Q6pDfrEozXDdb9992LT/9u4MB1PhrDeFM=;
        b=W8yAw5Un8L58F99hiyjd7jZboTjSn1NK6EaY3/IocrlXYxDA+wR966RWUk7b5RPTMz
         xq/WLO0RfH16NW3xer4FEewJjjm8sx21qMxbAYk6bRz+y2C7Ezpq4nPIpvrQBBwPWS6/
         qn5LWvCJmfcHV24AM1lVaHpTsb384bU1094ieJuIHyKYPFxZwikPONDYUm14BJMtX7Bu
         di9AUQxj8PrSbEiRWWp6a72pIjAq+GQFM4u0V0shwJB204PiD0SKmfCoDq0jptHiZqEL
         LdCLADttoHxObgQ6hFTlxE79yIJNDAe69Is3thmRo/Vat8jMgazE163KsdMhwJB+or2J
         96fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538527; x=1775143327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cGf3dTV4a9Q6pDfrEozXDdb9992LT/9u4MB1PhrDeFM=;
        b=rfl1hwTXe2Pw6AFfEPijKDrcbT+qLqm695/UyJw6GJrudFGaieAZ4TSeCFGkWsHoCV
         0q7Es5xMvDQ40zpI91LA5FJtoErj4hO5HmkAR3phSl5iVkEAHw/BoCJ1Nh/A2FmABTTs
         RiAuKaG8Q8hfYTP+r6hXWmW0daIlQHx8OcvuGLnVOM3/lwoo5sioW5HSA8zeuPSKYet5
         OWGpadSr1pChalIhMafB0N23DMDfh1HDyv7FPVfMiYthQmYDMBLDDzQAq3Q7W830T4uJ
         0RSl6FXyUlsjqvL1q+qg4x/ZhLncp9c6pQVjpTq+xN3FyaTvQPc/q9b9CbGQiKVEQmgI
         IaCA==
X-Gm-Message-State: AOJu0Ywj8mWmMlE3TN6EbKWQrAS1ChsqSzFM0VQQF7OM4ygCbqAiBkJE
	67j06v2fM8b8L4NCO0wPsxLmj1BY7St+IwCUXudoHTegfhffvoSKyow7q4oRRQ==
X-Gm-Gg: ATEYQzwji7kFgBRfEr7A0CTwD2vJ2GHEJiTHArcFkzE9aJdykSTdOmfSG0OmUnkjNuo
	A+KQy/feB+4/lpdWUEKieyq5nhm+igbfMLUn2mJnKSg8QXIYUSccTJZZr13lvCLt2A8aHovrxw6
	A9WjtWJfAxiWAf3EChONSguWDFn5SzCu+X6Xx3WdjXn0yVww9RNLwqyi9TaXQ4vSrjfyP6fp32j
	bbFvCuGPpTtNAC5mb4b62sTuxDj9BZzsB2PHIMIuMRtKK8ozoa8QpJ6II2/OTljaUTZd8ClM6GY
	WRyOvd+dWnQCjBkTSKAM+6UZHl18OAF3effx5EbBzTynElwStrPhtH6WQ4QIMQsZq0UO3CLIyiK
	NRdqzH/sN/vkTkQMbE+KgKcp/lkpq88xSQCvNw7zl2wvzjPQjAJLz7e/kQvTTXj6TF9uZ+HWsnz
	9jGbELcTpJIKXHhA==
X-Received: by 2002:a05:600c:3309:b0:487:219e:416 with SMTP id 5b1f17b1804b1-487219e0550mr24770015e9.8.1774538526744;
        Thu, 26 Mar 2026 08:22:06 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:22:05 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 08/13] rrdtool: Use PYTHON_DIR
Date: Thu, 26 Mar 2026 16:14:33 +0100
Message-ID: <20260326152143.2224099-9-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125747

PYTHON_DIR now contains PYTHON_ABI, use it.

Also fixed runtime dependency for PACKAGECONFIG[python].
Note that there is an issue with the python module when this
PACKAGECONFIG is enabled:

ERROR: rrdtool-1.9.0-r0 do_package_qa: QA Issue:
File /usr/lib/python3.14/site-packages/rrdtool.cpython-314-x86_64-linux-gnu.so
in package rrdtool-python contains reference to TMPDIR [buildpaths]

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
index 752ecc6c48..23b38182be 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
@@ -32,9 +32,9 @@ PACKAGECONFIG ??= " \
 "
 
 PACKAGECONFIG[python] = "--enable-python=yes \
-am_cv_python_pythondir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages \
-am_cv_python_pyexecdir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages,\
---disable-python,python,"
+am_cv_python_pythondir=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages \
+am_cv_python_pyexecdir=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages,\
+--disable-python,python3,"
 
 PACKAGECONFIG[perl] = \
 "--enable-perl=yes --with-perl-options='INSTALLDIRS="vendor" CCFLAGS="${CFLAGS}" NO_PACKLIST=1 NO_PERLLOCAL=1' \
@@ -80,7 +80,7 @@ do_configure() {
 
     #python
     sed -i -e '/PYTHON_INCLUDES="-I${/c \
-    PYTHON_INCLUDES="-I=/usr/include/python${PYTHON_BASEVERSION}"' \
+    PYTHON_INCLUDES="-I=/usr/include/${PYTHON_DIR}"' \
         ${S}/m4/acinclude.m4
     #remove the useless RPATH from the rrdtool.so
     sed -i -e 's|LD_RUN_PATH=$(libdir)||g' ${S}/bindings/Makefile.am
-- 
2.53.0


