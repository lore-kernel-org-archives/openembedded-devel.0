Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A950610A62E8
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:31 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49230.1774534350432998132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X4gqbax5;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b41b545d9so1036373f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534348; x=1775139148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fy7bOJBzaaTfUTEmgSvjzdr/zfZur/Mb98ZPMPNFcA=;
        b=X4gqbax5OCWit/WG4zYa5pT1saeLD/Ef/wVXxXmA2Ijbo5eJYpe4cyrsFA6JyHrIRx
         iNYcd6b5REu+VVFlUVlaJzTJLwdaopS+kOfhXxAxOEx6gpZzcEtWTyWaLy4dWOb1c3X1
         CBub6etPbL/v/2WjbH7nNSQxwbqlJhNgjZxLoeiRHQa0sqwA9cHgCMDziM5T6DdIX4lM
         lkheQHuQQS8Z8DK0A+EdwFaY5/yPOCUU9EZ882pLr5Lu0jnXRwMv4tzNNeoO2z5vSwvF
         KXiQA7FLPcdDrO99bLZc/FAtKvFnczQPYMCx8cKxQh1ND6IpdTlw+eGR4gr3KGuHP/Pd
         kgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534348; x=1775139148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fy7bOJBzaaTfUTEmgSvjzdr/zfZur/Mb98ZPMPNFcA=;
        b=L3vmupHgKqCrCnPXHLw2LR64bqJuZw2GlolV0SZThiw/EQJQVn/ronvwTb5AV7CGzA
         x2f/IUJH58Usk+y0FdrALmIYdmza2CCH3xEUbiwaxT0QbVr1DRu9okkqQ13ojUqrpqfm
         LBygmXCS96EStqwDVNX3OmsezLB2CjUBPysjUTKMiqfyql6alImzvIETSHXebBbzjbKN
         Igx57hjPEa/2nQFKcgcVpfwun0fc3uqr2h+6PlK/pRxwTtD2UZB13oA6Dd670JHTA/7w
         itD9JAucpJGsD0APLsz0x8YBOxHz0F3VCGmGE7/fJXP7NuWH9S1UPA+QDeRPPAXunwzk
         6rIg==
X-Gm-Message-State: AOJu0Yy6cUL9Wh2rTdv4eEqt4MaksDBIU9/Q6Sc/kCZ0yiQNS07EnZcg
	naKTA1vLba0o3GdF5Z6iRGI7kYS78PSt73JbL7330LBjRg/thSw3XjP4/L4FXA==
X-Gm-Gg: ATEYQzyv5AancFKj2DUqsPZrlSsHM+jsm24tSiDOPPjNI7hP+O+WCMsRQg5Ts8lEsp6
	iFFpcqpO0p+bgSKwOrD0jnKj8RUG+vWHrEz+ceUMRQQcoShLQhWptTcWXq6xf10qbh+foqO/vEC
	0XeDJgHwMmfufOdLPbncoLIXZ9FCYmKA6cl2dvDdKK4+PEQCggANrAbV6ip5z6rgCsj/JqYGe/y
	2lWIiCJzFCQotGOSz2hzc4OmJT1ldttXRv8GfJY28oizSQBDFpYXWQKcrrja4buEkb1cj24M2hu
	eBSaoc7SQNtcrUkCzipEfZr9kl985kqjfLkrskQnRJU2geQsZnj7CEQNrqyUvfUdWBQnLIa5h8+
	xeI+hQ7pTr9peHIx1Z8DFvWMnWO9lkyZ+E834pIuDNw418ey6uBNSS1YLhvOoL02zfDWF/USsS2
	nGan2i+nJpvqBgMw==
X-Received: by 2002:a5d:5f47:0:b0:43b:851c:4479 with SMTP id ffacd0b85a97d-43b88991cbbmr12142918f8f.2.1774534348309;
        Thu, 26 Mar 2026 07:12:28 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:28 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 12/12] hwlatdetect: Use PYTHON_DIR
Date: Thu, 26 Mar 2026 15:12:12 +0100
Message-ID: <20260326141213.2081121-13-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326141213.2081121-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125733

Instead of custom constructing the python directory,
use PYTHON_DIR for consistency.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 2dcc80965a..d37909cd87 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 require rt-tests.inc
 inherit python3-dir
 
-EXTRA_OEMAKE += "PYLIB=${libdir}/python${PYTHON_BASEVERSION}/dist-packages"
+EXTRA_OEMAKE += "PYLIB=${libdir}/${PYTHON_DIR}/dist-packages"
 
 do_compile() {
 	oe_runmake hwlatdetect
@@ -18,9 +18,9 @@ do_install() {
         oe_runmake install_hwlatdetect DESTDIR=${D} SBINDIR=${sbindir} \
 	           MANDIR=${mandir} INCLUDEDIR=${includedir}
 
-        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py
+        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/${PYTHON_DIR}/dist-packages/hwlatdetect.py
 }
 
-FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
+FILES:${PN} += "${libdir}/${PYTHON_DIR}/dist-packages/hwlatdetect.py"
 RDEPENDS:${PN} = "python3-core "
 RRECOMMENDS:${PN} = "kernel-module-hwlat-detector"
-- 
2.53.0


