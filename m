Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE577C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28091.1786651747941826155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=anB8qeHe;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad8076b01so3526835ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651747; x=1787256547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjCh/bo2iygakGRI7N9ATTWnjPdNYD1UHuLciQ32uNo=;
        b=anB8qeHetEMEGNLXaU3NpOBe9S5BNZ/8zVu8QzWhdk4mut0BW7xOjo5aPB070vH7Gu
         WPWwI2C3TZmcayThWj7IZxOESTGm+lA3Flu9Mak7wB1tZzqmjYu/rAGBXtOgbjykwI8r
         t0ZWIV87UWKb6L3S8xI+gpQQVYzre3yuxdlae+HD1ILnuLzf5fvhq2IfFHrAeV8D2Ypd
         9HOuCQUtmhcDQFLi86CbnoziWmhx0lqsrCZIGk0d/egOKc8aDfvoWJnKywDEmunq9H7S
         HxlpGfJfItFFp45UeQWhjVdg2GjpeNmQovyiRfFBFKSks4dj3m+9zwExZflqDnT15wCZ
         qhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651747; x=1787256547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cjCh/bo2iygakGRI7N9ATTWnjPdNYD1UHuLciQ32uNo=;
        b=rG5+87Tdl3DfzKGbx77omkI836cRXEuDI18qJhjwOR4awclrWcB5/jJ0ikI993qHKz
         8o6+fMCCgOu1WS0lijx8vVKcFOGH7Hj/Ll2VS7S1ygxgZumdq4wXdqlEj45gGr3OorTm
         hoXejKb4yhoPr/DPPvPuK13cf8OJEYKc60HLLaDcatEsrK56uyn3e0mwSkKlTzSCKAdZ
         RZ5O6KpinQUluytxZt6tNaM8fwk04AJ6+4g++Tcj8DuB0aMWlA4w+jfU3Y7dZjwRNoj5
         haDVpiCXhgQrm5ZNOdWLYHpxbkUs9fup4F6nOMsTh+CNL7xrg7eY+jinmq7CNQAnEynO
         CmeQ==
X-Gm-Message-State: AOJu0Yy8XUdNoxCITxn88ElwEQ9kns63YuqO8mKRb45p62QfuiCszVXf
	huN0qeiReBK9DynpnUsQik2obj7sn2N2m2Hry36ZkNCaPjL2Y+uXESz8fL/P411t
X-Gm-Gg: AR+sD12pRe5B/uHPVPoQLnTBtR3hRlsVXL9OOsmRq9VHSRsOAVjH5Hva2tpuJe7jsYu
	lh3h4uHCUdk4RR/m0MfIxVpD6l0SCdmGh2k32sNO0B3K+Nr3X0YWBNk9z3HbZMzudEgLM5+Ef8U
	O8zT+JnyL/0hMlmHhdn7JXiTuvhaUeqlNrTv5OaCqzHGddGjytCn1k9AMtCUpl3ei8r9yYozW6E
	O6PszqeAM8cL9P6GdQ81QK9VEl2Q23uX7iEJHFnQrUHITuRNSXX2/xMEZURyJm6YaCnP6re/N3G
	PIv7XgaugkFfnNGUNCt3ckqgM1KtAktzXwhKAmOGrbicK4Ywb+5GBnQ2eDrcfHzVu6iVFtpzt4i
	39XtUxs8oYDl+Va0fB1XmyfSRVsM5jDU/ZQJXKdU2HzCzgZmMj+2PuK0IlIoYmZRHamZvgW67ak
	n3O4MoCT9wMc9IFtYccre9+BABemkCxO7wyriZu5YxOtlcNybtR9LpgwLnvFyUJp0pndq1GW+pM
	A7qIotvCtDF7aVPBJgWY+jn9EANXBcxjTSZWK+7hj7LpNqG+O9/e8wKz47MFGDb5w+Sf1Nh6lOv
	OF+ZqTeCsjTgz+gi4DKohuN3EjhJ3BcVRbMioKTdeNimIiOKmqBepW3Pk99zpGQECnK3knqu+Qd
	CpLQSXXfi/9l/du/k7/M77taqktRYjPB/6u08dqAwYhiIyA==
X-Received: by 2002:a17:903:2305:b0:2cf:4c0f:5129 with SMTP id d9443c01a7336-2d3b0cd91a1mr5088425ad.17.1786651747275;
        Thu, 13 Aug 2026 13:09:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 16/80] python3-dateutil: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:30 -0700
Message-ID: <20260813200834.1302829-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128960

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
index 074f5fbeca..2999606e06 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 PACKAGES =+ "${PN}-zoneinfo"
 FILES:${PN}-zoneinfo = "${PYTHON_SITEPACKAGES_DIR}/dateutil/zoneinfo"
 

