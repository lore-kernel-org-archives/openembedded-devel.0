Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5D7D49214
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11138.1765540692018531183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQ1dXtag;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso1337150b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540691; x=1766145491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDatInHacsdHXy+vOmJrh+tnwvoYvgT3dP3ULJOD/ho=;
        b=hQ1dXtagLaw9gq53bIqFLvPOp+vTfr73wQULl3s2IrKp88ZowM3XVPpgyy45CTRV1Y
         zzAZ/h+yVpSMqU6BZLuv5zD/2jqPNOhGPLDryVGlzNtiBdI0iUuFsibaiOXmuwgk02KO
         J/+q2Q+qGgXNdDDc5YuMF/gnltdo/6PGX+Gni5So7MyDv0OzhZPGLt0S4j+eI5NCav1E
         NWZc5m5Xj1cbLlgYrNV1VN4cV2SgBFtRbv60Ngr5VMG6C4w7u2+8SehqYDeVeefVnfdI
         OsngKWNvIUIAsZbRlxTzaELtwG4gy4Hj2EctLtOTjqXmhb3MGMNGx2ymHK8aN7IwdtD1
         sICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540691; x=1766145491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MDatInHacsdHXy+vOmJrh+tnwvoYvgT3dP3ULJOD/ho=;
        b=LZ5okreAqJZtvGzfcop1/r3weEoBIAUR1Ljk8pjg/E9ip/XnZGKI3gW34DktvdUEkJ
         C4/6ATO/Q2YFjqrFEQFj9sWNlID4o6K1Rq9tODci2AfaG9ivYYPyntlqlxvMMXumWHEb
         PbsKU0AFZD5sLj1LdlHvCO8Q1OWCghyR98AxfjzynDqGeBL+EwKGr4nDKipmkhLZtVZM
         IFEYJTXr6n+dynzuvGn9U5TvxyFP/sN7bnfoClzwTRLRUEVOHBzR/OIbyU5EqxgMlYN4
         O3HLnShR7S5G6OrM9ceUyeGbWdPkzXSmYYS/q22puaDy7uZxN4ml66a79K5JiXTI+mm0
         7PFw==
X-Gm-Message-State: AOJu0Yz+TTddrFFyHY2eDbWrDCYWtf2C6CEk9x7IHt41J0jfkyIwQhle
	rZZCYJAE2G6T/Gnvb4dH4OeWlKsNTq4e7eQdSOD5gaxBdye7IaPka4FrvKYzKQ==
X-Gm-Gg: AY/fxX4TpmNmsyvtCPCSjnrP5k6zOtuyUzDyRP+7Z51nEXyIHoPHl1TttdgsthrsLJH
	YHSd1nakXddcfAclT5r1y/zEnFgrZK0K5YlNE+rHNsdxkZcYm0ZhTy/3rwNZkN8UQ9yY7UAT9ub
	DT4aRzaEHmFGa/5YQLXQve/9B4OwDIdYWafC2iUMZCLz2pyz5Zmw1U0csD+XApIM6qCiqNVpE8F
	wGUw66lgt/DDvX3NMTwe4UFl/TVrSJAApJfZSurCVnZS7OUTq5SPrrg65gtq+oEMc5/vj+tx7p6
	iN95rkZOy8wk7czDMdgAHskZewIiq1QhmhPAKYX4Aj3AgxJWXeL6Drxl9ZmNzn8Zgp8enTUsJTw
	CjUYy4WtatpBPiNvlsYqQDYL28eXxr7d0Imtq9Id3yvzCXd2LTfBNxBexauPm4yqg8DyzeqeWqo
	2SKn7Tv/a3H3ZNQsAcq/ZRuNY=
X-Google-Smtp-Source: AGHT+IEWQBWIrOqK2eTssJU/l75oBh5EmYZlgj3W0mQi+xPqigHA9PGMwD4hzuS4pmnhYHPO3bhXlA==
X-Received: by 2002:a05:6a00:8006:b0:7e8:4471:ae6b with SMTP id d2e1a72fcca58-7f669a93aa1mr1736130b3a.55.1765540691244;
        Fri, 12 Dec 2025 03:58:11 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 10/15] python3-pymodbus: upgrade 3.11.3 -> 3.11.4
Date: Fri, 12 Dec 2025 17:27:39 +0530
Message-ID: <20251212115744.569676-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122610

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 full support for python 3.14 and a number of packages (like mypy) have been updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b745baf4784f01b1eed82607d0d69004df6ed025)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-pymodbus_3.11.3.bb => python3-pymodbus_3.11.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.11.3.bb => python3-pymodbus_3.11.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.3.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.11.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.11.3.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.11.4.bb
index c7dbcb1ce8..6d961fda1a 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.11.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "10c2902838ad5a233baefb64b1c1fb064fa762b22b221bf35191bf39f01449a8"
+SRC_URI[sha256sum] = "6910e385cb6b2f983cd457e9ecee2ff580dbb23cf3d84aefec0845e71edd606a"
 
 inherit pypi python_setuptools_build_meta
 

