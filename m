Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FF7C79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:19 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31697.1788776649787149827
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m6ML2/p7;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso4072245a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776649; x=1789381449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt4eY8fQshVw62pK30BeLKIsvVrzho+5OK3tKZl7jhY=;
        b=m6ML2/p7w2qvmuxtkkVGhWvtBpuX7J9Wl5op1+O2tGDH7yZqqGPy6H7QLfTKbAmKoe
         uF1VDXzUc7U+ZjeUytEC5bCIZF7rvzn2frOHd0xFkZd0GG4+XU6/v/vMkQdqI4ICX5ob
         bWqCNuovo7ED0C8ln/tTpi6q/+Y4wafxjz5u6kI+/L1gMgpEiz9sVGgH0I6p0BDndzvF
         DoY2HJj9Igcal1UBIkgIv6hE3L7vwYlniSYgJPumuVq4TVZsBFk1Nq3fortg5EGf7Y0e
         HKDsqYq3Dh3GK9mjWVZ0XsyuDPuF/iKupjSk7ePMITlawWumvXL55PjmtF4nBzamaMu+
         xgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776649; x=1789381449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bt4eY8fQshVw62pK30BeLKIsvVrzho+5OK3tKZl7jhY=;
        b=KFB/4K5xhOBX8APNMPd3MAJ5KScjsVieb9PA/ju7yNVFLxsilb7Pcr9pfv14puoAZ4
         BIEfA11YKq6dHGJo4VQJAIO62Imzw3CiEDVcws+0BIiFXKu41vmcS38QqamGF2kOp8s6
         jV9ghr575Ck4Jlv6oEmpzAW3d329jFRi1LZvhReR0TMpOrGEzhcyKIkwQoeOaVfFvX/U
         Ar9VUdy6M6Zn215ocYMbvBqcEPvdx57kbWTp4ghXWKFxcz+Hju9bMLhJ177Yy9xqGjI6
         UkGKccREhMvqlFbGF9LAkPlB+4XnBIMfPcEoqOBRnh7VGmkuaBfaCggenLDzKo+Fu6/m
         EfVw==
X-Gm-Message-State: AFuF++m6uGz6r4+H8cifkNVueLGPdqY954KA0xhZfVZ8G5jxloIGa8Gc
	hEI1wTJEkzmqKBnUXCoVIf5WVmWbW+xrhgXaMRusDM7s9KTCtg/zI/XwLL43w0fu
X-Gm-Gg: AYBFou3cGrV1/3jTOJEV7PZTySTTd0j9i3Wrklc2EMjRXe8T9TINIjkNXMiQy3cpSe6
	yLxlFr08KuObRALSq2QNsf71kwrmHzGncP4q1gF6VcUdBVQ5YUyvnUo3mDMNpqqG67Ip5Tc9nlD
	dCokKc+V+T9l6/IuJfY7c/UYA+MZXkxNG7MFf3eqK1J/V6oUq21WKXXXXtWfobBROE+DL4N7P5g
	PyFBUqIAPDfqsh/NOGJ+fR5+DZGMXWj35S67DQR8VOoEGoFHyTXiwPAIFuPbzmBBMsZQNV+YEE4
	5OP4JuEuYi2p4zhIm8gXwwoCKoM48GY/37D/AoXd9eD2e3uPWK3QatdNpFt1CrfoTrNxF7WZyrP
	tNb8q/Tq9ON4koO9TiChri1FrBR+danlw3Sh1FBIuAsTsAWbFhCJBtzMhDGEzyaYnMRfri3/xSY
	zdETrH6ZGaiwg1rfIpYgzO4BiBXW4UOZTe0cppVFMF1oGqJwDr043E2mRq2Ls7TNfGXTadse7S
X-Received: by 2002:a17:90b:4a49:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39b26100cd2mr32219360a91.2.1788776649113;
        Mon, 07 Sep 2026 03:24:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 15/33] nginx: mark CVE-2026-1642 patched
Date: Mon,  7 Sep 2026 22:22:59 +1200
Message-ID: <20260907102318.2459883-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129827

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also identified the commit[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-1642

[1]https://security-tracker.debian.org/tracker/CVE-2026-1642
[2]https://github.com/nginx/nginx/commit/784fa05025cb8cd0c770f99bc79d2794b9f85b6e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 9872a6de3b..f797f4a289 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -5,3 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 SRC_URI[sha256sum] = "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918"
 
 CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"
+CVE_STATUS[CVE-2026-1642] = "fixed-version: fixed since v1.28.2"

