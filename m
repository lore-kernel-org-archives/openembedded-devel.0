Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15157.1794913089796272532
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=B0lF3x9h;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so18415525e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 02:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794913088; x=1795517888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AU7qz7y8DNbwWLH1WRyvBCwCkWzJerEhar0EKuDtZpU=;
        b=B0lF3x9hOGpCYbmiW02a2WJ0z99O4UGJGYaqN2CChC1ZMwZsi7LTblgQ+USYLT0uim
         21aHc1LvVmAyfdkp9p6F1KuNpcdAJnfHqGF7X3R9Tgaq+pBSs8OPLVprSMb980tKV8k/
         En9BhfZso5CLDRD92z9307W28kR8WfoCFT2yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913088; x=1795517888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AU7qz7y8DNbwWLH1WRyvBCwCkWzJerEhar0EKuDtZpU=;
        b=WMEUAiRy8GsS/qoU8O6tm/dGLrAkxVCmnieIgRfTjd2oMOZFtUJYWUAjT7UqkH2NAs
         wWpWm5O8+1AiJDU3gmqfNvvH4+ubG1fb69dxUgK6IM2zbVTqTsm8unSYS4+fR5z9MHDC
         Jd+Wj1P4LQG+J1hM1C4R0nrS/y0K8ZoqazNTEENkQHBganFUSp3OTc/zDpp4z/kPlInB
         LN5S3r89DtwXUfqSUdJB5nDTzp/tI42k0DowPo9Mf87OtI34Itksaub8abrWmuAhMA5y
         qTMK7oDNRC02QNzYeKmRbIyfQX2lgjbEcg5Ma/rOnP5h5SrufaShhO+O9OSTqbhrNyzd
         Tlkw==
X-Gm-Message-State: APuU4Z+n42vx/P4iEqTodZDqvP47RjFBRpAkXA1AayzGgWrqxYPyUrmz
	2YJgMs+8UUUQckKbQR0n0iUhDyFpBaHLSq93blXD5x1DBX3RYh35V4E+GQB9ET1/ZefWIKVGw+A
	64odn
X-Gm-Gg: AYBFou1gNpxoOEl4XUgKSqKv2fv9klEtTeps9LQvHx/5aZFNX4NOtJGiIrNqfE4JBU8
	S24EQdOVqfZ3Q+NOtTe7PqQXeSpe+5uhzQ3smz1Lgo3vwUfohyQqXK0vnTBAzrMIhaqTSqCkUGa
	hK0clOSmuolh25gRvYTXrSlX0PphVd6ROdP9XlfKNK60qRMNqbWMIoofRvZ+a8cxfdRDhxgoOl4
	yGl21YmCgYjVpOkCvkgYDnE0mS7U5yP3znO+/sy6iBxkx7u2x3dy1nWL8X3QnIPHn1B4h0flsm4
	OQdUqASwQA4V7kJYCwAPQd1BafbdCO2kUYDUXO9vQF6SGiGN94lydqPGxEa80YM0fraGe99L1jU
	qlrryKXEp34GEjD/0x0ybdO3JW9LKjYi8Dd2AKaulWdC4cHC1373XFi3RTwiuX6acIQf587Ro73
	oKwMEmMDtJLFOAW9Jmk+AL5hhQFb+aWUzLVGGwCtGHbHD7I8hTnw7UXfyW7r1GCkGyo9gMFRXK9
	dynjdu0Gw6A/yyZlsPkizjvQjM8VqKMoayyWTvtHMEnTvUhwzOxpIlIT+6xXQn7+bzfgGqfDxEz
	gqqs3JGzLScpj9bZxIvMZ40X9s++GyLtz0wQnTORtmOYKvWy+929x4QIln+6g9zgQ+pXjnuRcM6
	idnmd77qesXK360MQIBtRGf5CsUYMeizOSsy/5DKHO4dZEj+mp0MPBQ==
X-Received: by 2002:a05:600c:1989:b0:4bb:665c:a078 with SMTP id 5b1f17b1804b1-4bb665ca43amr206292365e9.28.1794913087772;
        Tue, 17 Nov 2026 02:58:07 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm20454455e9.4.2026.11.17.02.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:58:07 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-aiohue: Upgrade 4.9.1 -> 4.9.2
Date: Tue, 17 Nov 2026 12:58:01 +0200
Message-ID: <20261117105804.3937460-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 10:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132579
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.9.2:

- Do not retry create_app_key over http after a bridge error

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiohue_4.9.1.bb => python3-aiohue_4.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.9.1.bb => python3-aiohue_4.9.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.9.1.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.9.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.9.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.9.2.bb
index ac4892e120..f326ec8c55 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.9.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "c56c22e046e3055e9e71b45db82692c1b8676ab561d4f8f82b8df0771fa744d5"
+SRC_URI[sha256sum] = "3f1e0e33b5f9b4b75b305d852bea0693234acb669cb9d1625842755a28203462"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

