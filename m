Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034C4CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 09:41:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17355.1782207695246095990
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 02:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HlkLaxR9;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so4025464f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 02:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1782207693; x=1782812493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hrp4xDwd+E1C6Mk85osPMcW7JaozQcQ4zTJFC82Syzs=;
        b=HlkLaxR96PAipLQT8tfK+z3EVw9SU8sw0wwJ8rFeXY/vYtZiaEE0GSdl5AnKw6TTW2
         YOjvY97Xvxb8zBmSroFUsk14ycqZ8PHmeKdRveXhRvBdEpUy1a+xtCqrNjTCkbB4sy9k
         6vAdJvnPcfH72gSMz1nufWol7GEbFhYlMCzOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207693; x=1782812493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hrp4xDwd+E1C6Mk85osPMcW7JaozQcQ4zTJFC82Syzs=;
        b=oqOHEl38lzRpn0wqu9/Vljq+e+2yAdM7vcDt/VH290kwzRH2qieoTTLNjamKT+4kg7
         +3hgX36X2XtFG+1refHfKKLryjSKR/TZ5ysYbAwOCx86eM34OHX1GYvtaIJUoK/JbX5k
         tdQEOK2GzPnSZx8YUy/bUz3OUbs1OLEB3LBlLdmHPgGipC7XzWejeSd4FQ2+cPcQG8A1
         6P209Z7Hgl9ZwhV4AmBVdry55tJ/b0N7plWWliqJRuumdLrKVgUASnZ+sLmnwzgL1Sho
         zeE8cSsRoZPbn/UgXVaKHlc/0dspEjXVB/lViGNF4kZiOibB/zcArj9hFFHdNdq2QeqE
         LGhQ==
X-Gm-Message-State: AOJu0YydjBOJ3JypX3RPeX0DLJibC1cRS8F4qZtHSpGji1fbuxPHREeA
	8sG1VQ+pBfThGi0Lw5J45CWAUYflIrJPnw65x9E8wWspqYg5s7b2OqS90b/jDw3HZOXHS4gujNo
	AUrm9
X-Gm-Gg: AfdE7cmuBQWw0QggSyOWbT42BQMiGD4FgHrTYHGCBN+fGTphLqr8sOF+xWHKoE7CDUr
	KtFRm2Ek5bRRMwfolG3GQAI676ItwI0XeF4JkcicEW0Ln2P3DJHuUWSOwhfqTPmuqPRCsHIU94x
	8azOos9PPpp8MRNBKaMfnYnCW6pyqS5NyQeEEwbDKJ8/8jhE9WMkPfSuu2TZaX0S1chyuPFVUi0
	m8E95edraiCwA6bXSd2RPs1YSDzPSagSZNeR4usQfIrfNs6gGy20D4NEfG7j0x2W0fZX1TRLBXi
	7T0GlQ/xqxoZ0B+6VCzF/bxYBNuCOMeCO+xgBfnvmmWVGDS45PXnj9hO/avAg+p9J0cIF2RBj5N
	5nf4Cai75dO4KmTaCVnub/XIysDSxCvnoRdJOqZqOcvZmk5zFP0gzcV0lvxvi2ZjYsthimGXUEV
	G7k/Ug/jPsrrfMydd7R2MjxR4zkTQnDMcpF0ry
X-Received: by 2002:a05:6000:4b15:b0:45e:de0a:1773 with SMTP id ffacd0b85a97d-46adb0b61f1mr2756145f8f.33.1782207693211;
        Tue, 23 Jun 2026 02:41:33 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm33581597f8f.14.2026.06.23.02.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:41:32 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-jdatetime: Upgrade 5.2.0 -> 5.3.0
Date: Tue, 23 Jun 2026 12:41:26 +0300
Message-ID: <20260623094127.1592848-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623094127.1592848-1-leon.anavi@konsulko.com>
References: <20260623094127.1592848-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 09:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127699

Upgrade to release 5.3.0:

- Migrate CI to Ruff for Code Formatting and Linting
- Fix: Setuptools License Deprecation Warning
- Add Windows test CI support
- feat: add type hints to functions and methods in jdatetime module

Fixes:

WARNING: python3-jdatetime-5.3.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with setuptools.build_meta,
use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-jdatetime_5.2.0.bb => python3-jdatetime_5.3.0.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_5.2.0.bb => python3-jdatetime_5.3.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_5.2.0.bb b/meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-jdatetime_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb
index 257ac93fbf..9275736eb3 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb
@@ -3,15 +3,14 @@ HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "c81d5898717b82b609a3ce2a73f8b8d3230b0c757e5c0de9d6b1acfdc224f551"
+SRC_URI[sha256sum] = "d20eb9fc2a00e86493a6156b2a0e4e579f23379e8fea186a0e603fd36a130227"
 
-PYPI_PACKAGE = "jdatetime"
-
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
-        python3-modules \
+    python3-modules \
+    python3-jalali-core \
 "
 
-- 
2.47.3


