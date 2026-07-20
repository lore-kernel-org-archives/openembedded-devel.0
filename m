Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BC5C44512
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 02:12:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.795.1784513566947637724
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 19:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j43PL7ca;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: lianux.mm@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381b831d535so7285964a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 19:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784513566; x=1785118366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIqOAuRriZaEw36wNUqYLdt7HOGjtpfhZnd0TQPZmwU=;
        b=j43PL7cafFHOlx8N1q4FJK6JoFWK8oOhzkkCsFPWPVsof8x5MD7g0CJwhRfPAC0RHQ
         YK90wP48lw88qovsK8dF/W8Giz7eIQqqVyxEKra/5yR43zn94bsWiYGmdKMmo/u143f6
         oUyFgbJszM5ptsrYXKOXGdbVyIZmN9/UPekRytv9bSunF07nNOMKfDgIcjy6W2UJcnE5
         tHSYrctfDXl8E/WMb/G/R3VNeVq1ugIW67KqG8ngbEdzrOAx70aM7FGgdY61EXl9j2nf
         a/5rgIaytyDhzjNXPivb5fKy4EZPPb+rj3H1qs47J9gyTTQCAxXGlxEvAKbRsY7NR5WV
         Iciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784513566; x=1785118366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIqOAuRriZaEw36wNUqYLdt7HOGjtpfhZnd0TQPZmwU=;
        b=odIrRmoztSPcHW4vk7debakCujDCKj/RlKpm29AqjebMfxvy5G2nKgrWVvzGPqrYaP
         ZtsAf8lR3sSL13eAanVLAPF4jSX7qiddonB0ETLUabnsogqQGq/vLog/aRI7GNzF40Xa
         BWzwwWaudWf/w2ePl9lRwFiOBC3aMJCFdTHaFdlSe0VKUNH0sY5eSos1OIhLK/xhjpRl
         yxBVUn0vLgoSYmFijs2QSnUfYx/tNIdIEcHH9hPeqPMP23pn0gCiGDlo86tf9d+o5c+x
         3qkFzKkeEDXwGnXfdVukqEKrn4xNAugvAcT546g8oqJw1OJs5YyXbp10xzOkjWtuN1bO
         C37g==
X-Gm-Message-State: AOJu0YwundBEoKkyG/Mj6nrnCfUbqGGzMPbs0CrXMOy4Bs6o6bTY6fdB
	tBdIS2Fv/yxKk3M7ArqqOa6gHxb/40hMNYlqxym4B5iSLnpk2ftZOxc7zciz1w==
X-Gm-Gg: AfdE7cmguc6nPzqvCMWxQdBhlR1L8IueaaVaf8XbTnrWhzIByPe+sJM9CuBtbS3t/eD
	Xg7XC5oZeBVHwvTRXiI1bn32hmAt+OddVBqv4yEFHHWGoicZELI6ootYeoTY6MxQPPs7PYEq1wV
	VjG2XRpcoM/ePHH9LsVUNym0mqnAGT4GZOb7QJwRhZusNUbu3rw95U9V0AptiU7ukE5s+kQPT0y
	kfpeJ4f3ZeIC3xIwedpoig5epL8PC1Ng/OsJfxUSAFjXhzzFOodGoZe96aNYZ1jcpnZGmcAzyR3
	wjSrCAt9z31RusyGgRfk3n4ijp9QX6nkkhr1i7sSxpILc7vAzLkwZnDXRHrAqhNaY9DxGb+yjtJ
	A3qhkxCOo5aaZuCiZOwL7dPGertCg0cZjf6Iwc/OJpeKBgwxSOi1b7CrBD7SfvX57RToYE+iakR
	UCYRsvW9XPGr4tFpOeeQl69Nxei/jrmsFwsRmnAQmGLg==
X-Received: by 2002:a17:90a:d2cd:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-38e4f418b12mr8378098a91.15.1784513565983;
        Sun, 19 Jul 2026 19:12:45 -0700 (PDT)
Received: from localhost.localdomain ([112.65.87.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b0e828asm5032204a91.12.2026.07.19.19.12.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 19:12:45 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Lian Wang <lianux.wang@processmission.com>
Subject: [oe-devel][master][PATCH v3] wolfssl: upgrade 5.9.1 -> 5.9.2
Date: Mon, 20 Jul 2026 10:12:41 +0800
Message-ID: <20260720021241.76204-1-lianux.wang@processmission.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 02:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128269

- Update SRCREV to v5.9.2-stable tag
- All security fixes from 5.9.2 release included
- Fix ptest symlink-to-sysroot QA error by removing build dir symlinks

Fixes build error:
https://errors.yoctoproject.org/Errors/Details/950825/

Signed-off-by: Lian Wang <lianux.wang@processmission.com>
---
 .../wolfssl/{wolfssl_5.9.1.bb => wolfssl_5.9.2.bb}           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.9.1.bb => wolfssl_5.9.2.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
index 2978ff1..5867cf8 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"
+SRCREV = "a82476d144290bf6a786607a16c224acff63d882"
 
 
 inherit autotools ptest
@@ -45,6 +45,9 @@ do_install_ptest() {
     cp -rf ${B}/tests/. ${D}${PTEST_PATH}/test
     cp -rf ${S}/certs  ${D}${PTEST_PATH}
     cp -rf ${S}/tests  ${D}${PTEST_PATH}
+
+    # Remove symlinks pointing to build directory (symlink-to-sysroot QA)
+    find ${D}${PTEST_PATH} -type l -delete
 }
 
 CVE_STATUS[CVE-2026-0819] = "fixed-version: fixed in 5.9.0"
-- 
2.55.0


