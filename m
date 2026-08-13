Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B23C5DF6E
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28088.1786651745153193146
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TUGvU4TL;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cfff5f88dbso4892435ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651744; x=1787256544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Z1kvV0gCMtyDUDRckt6Fgt+yw6qx2WL1GikSvHK6Pg=;
        b=TUGvU4TLnWQWWKMkkR6nod0YbczsR4900iFKlnhzCo4yFi+fAiPgi8+q7SRShDojOy
         yOv0MT4JmxLBlNiLrANHZe3nOrrFpPPp8X80MOi3YChWPOkGwoyFTHRiZ3MrV2HtzxXS
         Yk/gUEJx7++wUHutLvIiUqisgKrFjWcCrGq4g6w+g7PLsmq+YRpgIMELMB8ZwOmP8REZ
         zsRdWKJtRihSs+YwmblUJDAptx7ZQzL028Azap54CUk9p2k6uzgWFkCbbiGOqFnsMhJM
         nHHB8IhPwe/QZSL8P8BlCOtKZQaZQK6puu0QxyQFVFi2BUMR0khkJU8DDx6kXI4T4KtQ
         GESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651744; x=1787256544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Z1kvV0gCMtyDUDRckt6Fgt+yw6qx2WL1GikSvHK6Pg=;
        b=frwgJcHhmOKAm6fS3OeFvsKRdIRalPCQW1/LSS/L13QFbLGzvnpOzC3EObdgz+PxXU
         HILwqBFbqMwFMb45KnrM2Za452w+001pQQwp9D0dUxIYU53IMFuNnRq+3iLvzR9P+ESC
         hBszWa969jJNaByahUhwNVm+7Nf/hLodGex4vt2s9eAeJ8Lg9VFAuP2R7iAQ4ExiBz37
         wwNXYLd2wpBs0FA3Ekrb3ZkeJTj0EfRvLfAAsHJmm7s4zitqsxAYbzDuCnhdc1FTsJKz
         qPpt/5NIz0rxJYlKaWBTOT1W91+CzYMxIfAwcaj38RhLrHk5kk7+kwIUNaIlGyjWxcMJ
         IFgA==
X-Gm-Message-State: AOJu0YxuW1NxT07GWe3YE8Ako+FotZ3T7xV0rKLpsjytGlBQh5JzaGfv
	jlU9zrklW/wDiLbpLTAkrxmjDz3zABLauaSkFOl7kmgBVhoWnNMjmE9lfSaPqPwO
X-Gm-Gg: AR+sD10kdipZPZddRYMQuAQEFBhEKVW09kglMGGeP4eJatCnP1U3Zspu+SWp1OcBumd
	tHsRqAEg1aWHkfHb3NByB9cdEEAXuvAmjDGvWiPyzWC1RPOjVo+7OHjuLTRp2oS0YLoXeUE0rt4
	bQ0vwLoE5T96OLDPv+RRjkZ9bjjZkVzxJktLH7sGpUM2gnP7Iva3QwpFle2uuFB13ZQ7kdEFwQB
	nK23ySpUKTKtJ9SrU77lHZ/JMxX614XaQY01lHSex/Nsm0H54GDxwEN2+QOEXN10hfWku2KOICE
	CFicma+9dJZD0c8UR7BGeoxAYuFgGFhnE9F9Ze4cSZTX+BvT4geVXkt+RYkPE6hPa2i2yEwJTEm
	yu3CnRLBx5N5KrxWjFXTg58y376sbzN+TWr+SdiMjydzLfKJ99M3zKCEJSsB0yLbNpE1DnTehRi
	IaGYJd9i7aFxYiUYOixqp+Ck+0KfR1sEzsu8S2+oavmStlx9w0RSnwFJuuvcwyqnH/uTjQpjx9I
	9xS1Tu616g9fpdMReo5IAdlJ3psGv2c7UtR1D7tMdEkc+nevd747MCF5AEAeylFnKPnW6xfcph+
	446YDu0GGZJJ5FeU1bd+bXHbcjF2Ef2Mog7sn4XeoWhIfustK742V6MeZ8agq6WVgNg8QTat0/m
	WQdAJ2lO/x4h+pUvP7uCZqez7fRsAnUkZkrDZ9JMMxsg6Fw==
X-Received: by 2002:a05:6a20:b786:b0:3cb:b741:2924 with SMTP id adf61e73a8af0-3cc71e15661mr286371637.29.1786651744482;
        Thu, 13 Aug 2026 13:09:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 14/80] python3-cppy: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:28 -0700
Message-ID: <20260813200834.1302829-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128958

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
 meta-python/recipes-devtools/python/python3-cppy_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.3.1.bb b/meta-python/recipes-devtools/python/python3-cppy_1.3.1.bb
index ff463f6833..7acee20594 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.3.1.bb
@@ -9,6 +9,8 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI += " file://0001-Fix-build-error-as-following.patch \
            "
 

