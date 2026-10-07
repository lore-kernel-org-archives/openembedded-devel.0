Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925E3CA6007
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:02 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6879.1791371276185610874
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ncRORGeQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1600686a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371275; x=1791976075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zO6fVCmdJGAuYUYzQttECH9er2gcqkmjxZUFtmyO1h0=;
        b=ncRORGeQJPcYH8G8eibBgifwk8xO/vqKFjLsnbWPXnlgniUYi2sFwZTCI34k9LsHkj
         8DkU42wlb6927863x/ogoNxDUizr5u/CHB2A9Ea8DJ/HbdviKjuxbjpaAp+3DiwQz55m
         UJT48pmBSxga9rt/oF4HPnbvYUDClkEA6kPqYcAl9ygl56y9jiNWQ1s+f7lvT7eOOcb+
         KF89FHkBoKPHDuuSUp9+1jCSTwhrHaFNzKyyJ1knV4jtPK9cOrmQ9ft658OSG3eT/pMY
         /QGwi6bTGnDV7N+klHwYjLLdwMjrCALchYff5eGxVJTRsrjpe6zG+9utl3W+xKaSAQzt
         5P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371275; x=1791976075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zO6fVCmdJGAuYUYzQttECH9er2gcqkmjxZUFtmyO1h0=;
        b=bqNxPxaNud5AVURh9MCIgROGKYkBP2Nw4QCLeilxet6UkacWwahYr1sTTOB19uHV4c
         Ecm2vUxezjgs8O6+WPm6t5Fvsk9ee/74dQXH01Xekf5vR+ADrYxKxgQjS9xubvRl+k2b
         RSX9Oa5boU7DzYlRtPrka2t8eBoVo74GmhQhxZGJ224KdydKw4Ny5A82ui8hSg9byx78
         T1KfwRFmj44CLv3uSjewt5Elrcxr516bdoqGOwM0kNBnloq+N1/JwpvjG6qtCCA+cqMT
         kCtVCLw9+BHGMUA+FKtym6irZcK8Y45HwueUZCRoILiCIcY78bFcKrcTyitERkoD7YVm
         SMDQ==
X-Gm-Message-State: AFq9FYLktla4hIR0bSt4I0GIhTQCBw136B4UJ1JNA/XxYPJBnUVKO5+q
	wOzYrYTHWUAi66wDHDzcSr859FAIxaPFm+OkGmifOJs53qLhgqZDlYKwlfbwVQqx
X-Gm-Gg: AYBFou21c03ff9o/sAw3Lqf/Srj6LFywTD2If7Fh3x5I0HCrzrzE2g80yAGEVP6JtOE
	zfW1UQCKgD/YJNKm7FqMiDMzL9sd8sTsjXZECqkj5t+7oPcXjw3GuhyaLPvfsYRNM3dcbbvMuI0
	QX4xgQEfub7TJ8clSbapwCkOKU7nmdPUbOD/b0OhxIRDnlZENYIl8jQthZpOUUz5IfrsKJaRq4p
	+uLHiMJxVZMZL9yrcqfazgGHLUEUxKjQ/73QkRlrbjKrUYCYsZ83OahjzB2dmwDx9WqOAV2FFCz
	Bfw8O+tcD5aQyFcRhoohQRJQ/DIFB1zIujx8JI1wKKa6vNSK5dIb8j90I9tKBpRYiGtc+AekjI6
	cQ2T4Nl4LvpZ3aG0i7HOCLRE4acUZbe+PEcxyBmNTP/sOy1Sk69PZ8teX2MwJuz1ywKYq62bogo
	dBvHXdPxhzRiS5lWz/kRzsIhFY9UkWj5OwSk9uJ3EjJsyYdfT5h8sri7EF3DrRH/nhIr07NuZi3
	2GuiwlyncKQmR0VfBO0FuY=
X-Received: by 2002:a17:90b:48c7:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a8a0ba1c96mr1001141a91.13.1791371275070;
        Wed, 07 Oct 2026 04:07:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:07:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/15] python3-werkzeug: upgrade 3.1.8 -> 3.1.9
Date: Thu,  8 Oct 2026 00:07:27 +1300
Message-ID: <20261007110740.3179543-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130644

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pallets/werkzeug/releases/tag/3.1.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
index fae4de2a3f..d3b1598f78 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44"
+SRC_URI[sha256sum] = "55ca7c70a75689be937aa27f8ff4b018f06ff4838fc73045560bf0f5a1291060"
 
 CVE_PRODUCT = "pallets:werkzeug palletsprojects:werkzeug"
 

