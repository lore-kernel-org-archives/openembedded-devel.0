Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6868CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:12 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6886.1791371286630464828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jEDHqPV8;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so2155118a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371286; x=1791976086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND4HvOPWKuoPpnchfchYnvuwT/O2xZOrVKdxxLSaSX8=;
        b=jEDHqPV8RTV+2bSO2/vf8up6cgJOLiZIN9JAASKxXo4/DTGeaXJUckmmn7FbVMrBCb
         rHQDvywBX7c9bGflRiLrJWI9LPHeNhG5meFT3quOSrIoR0gV6xuwXdNjqzBjTNQXNHhJ
         Ks/CkrNMT/F48thvNZHpR1ksFtk7uJ+p83shO6xmwI/eLpaRg1zGE9bhtRIOzTX73J0i
         FJUA2AujRIlZDi/7QFw6YuchJ61y3usd8IPmVIyVVQVbcK1OtFNl/+D0IyeCoVFn2Fdw
         cP0gxiDiQiv46PVzuBqXmecDk+uXEYWwRMQ36/Q0d60r0mDoSE0mFD4QtwiQ/iuO14jp
         3RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371286; x=1791976086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND4HvOPWKuoPpnchfchYnvuwT/O2xZOrVKdxxLSaSX8=;
        b=qGJHaeRmBEWAwsbkVOS8c7CZBy7Xt25Y9Ukkhn6ydwk4JOfkvZtsUN0y0HoRHxbleU
         0r9BNcG7X6NR9Nyv9oK6vP9/FSRadWvL+98Y7Ubid28GQAFKVvl2EjymziO8p7UcDCOz
         iduSg/vjgK3wyhLTI/zxX70Q+LBJjuzdLwcKnbQmRBDYDDpBmcv4KDMhQMptUg/OPcpe
         PWmRHE9yoHo42PR136e5G4fWBWOe85zsUceyGSABVHKot6o5ulkWw46G1yi9baHR+aa6
         0147hbx1TwgkBOYBTCs9cVaJg7k8wyR5hwljRwUZgQoxcTJo9drNwS6E6MW/E/C5kqG1
         bAQg==
X-Gm-Message-State: AFq9FYKCVlypl4wWipL7Ab7tpcmNCql0KyePvbOBYkhi62n55eBwzNoE
	XHQAXY/YicUG7ETqZSoR2ypRHDxhq8kWJzeZSeTbdIM1w2hQjDWOE8GLqL+VVMQQ
X-Gm-Gg: AYBFou1GT5TDuOc3XBMTcOrcJxdHDLLNwjtXHZyJDYxObvDFHWGzvmcnFJeektBH5bA
	xFun/3WcAE0XCojVXr0QCpK37C8TsrpQ5YSyLuEEIWyBWlz7mLuzeq/BBFBx5PFtX/krJaAFyIl
	YLKc2EXBe1kL6hIdxA6+A4Lya8i0EHTDLEH8DPQbY3DfhwIssYqGWdxlpSLkHBKd/YhyY7O84MT
	Oj7qmL8APyjbijL7iIcx4Yp66K/Nf5R0UeVXX49qcIg4oTulAykFKiK+pn5AJyKId7/6UwAQ1sd
	HYX5kF5nGNLJwOgZAGnRoPM/Ofyn9C3008rM/NCKg+gnn/pbgkVigng0IIQw5eZvIKzs/GFuTdA
	bRuJdDnrk3fqGlsbOKSOZR0d+uwsZ5IdSLqH2aKevHcNIVgSHAOyqLxOIEBffPrYBZMechSRZrA
	NvypqPCV3yJ2qDQrea3WDHKFXLxexN7T9xGwo5LXajjCQjQrbK+WRm8t7ZJNaaT8IKeg/ryWAO7
	STmCcU1pugECgV5wgmj6jE=
X-Received: by 2002:a17:90b:1dd0:b0:39e:2e7c:d43c with SMTP id 98e67ed59e1d1-3a89f648cfemr1743237a91.7.1791371285972;
        Wed, 07 Oct 2026 04:08:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 6/15] python3-django: upgrade 5.2.17 -> 5.2.18
Date: Thu,  8 Oct 2026 00:07:31 +1300
Message-ID: <20261007110740.3179543-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130648

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/5.2.18/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.17.bb => python3-django_5.2.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.17.bb => python3-django_5.2.18.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb b/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.17.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.18.bb
index a9009adaf9..eb84122116 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "9d4d93be539a18ab80d058eb515900e10951e04c537c5a6b394fc49528d3251f"
+SRC_URI[sha256sum] = "461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d"

