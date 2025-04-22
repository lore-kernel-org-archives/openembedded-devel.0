Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE74C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:18:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.41089.1745331518287943121
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZhgGSxam;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso45286585e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745331516; x=1745936316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9WaGRQtbEv8f7m2d2ThyCuIEx987DrDQvQnP3DrSe4=;
        b=ZhgGSxamNE50fBgNxtUP0NeNVbcEzGUfifgxDdp45CcUglLircSyW+YEKTiTunkZpL
         25ObaOeXwRLmNUp9DVPNNO9hqftuaW9DG6COo2NPhksnZa+Gon0NLAxUoiSCVH3dcXFq
         PihwuyEPii1mti0JZByU4NmdnelRCBOTJYE5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331516; x=1745936316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9WaGRQtbEv8f7m2d2ThyCuIEx987DrDQvQnP3DrSe4=;
        b=HfUYzoWhcpoe2v0BZT4/7GLvzvSBEBmfxa6eWL2D2Vt1z0y8e0InXNZyjPVwNm6Sup
         YhuzAs2HmGY+tsRL4lSodAyz7q5kj8nRV83bohKHuPCTRY7SPfWkUkyuWR0fkHNXGAUQ
         IN07+okunGC0GjLdhmlop8s0Qx8KgzQjYGu07uSKPGHv2M32oL+3Wg/QHxSmZMbQrHVc
         I5dBfnYqukDwN9ZT66PrPsZgqE0XsfRkZGFXrcQWyHm9iMr7Sq4lhVsk1NeUgSXQrvct
         /3bUnLClVqe/iRXggEfoZZdqSuaEqPmnwOsvahBeqaoUcxZpCAM+KMo11erg0mQIr9nV
         HGAA==
X-Gm-Message-State: AOJu0YweAQr9yJvfOORhatRh2D1o4hRu0uazsfMv5z6IyEV+WyM9qVz4
	tatONtphg+mBOV+lYnZOn+Qwqb0SxdjaRz0qwj08IKPD/N9+oy943a2JT/B65C7+BPjDzTUfkOI
	v
X-Gm-Gg: ASbGncuYBOaOzXm2Swnk/BfIF0rs3SKLQRqOwkCLtyz1jYVRCjW3N5+vFe1erw1WNHk
	aLWvnDZqKuzIFvD5PwUvk7HRKt7ofhM9iLgCXDNrqScoC37MwhDBuuaUFosPd2Xz2kw60AjzVE3
	Yc6K0MR8lRYIoY73V2tbI6EAOfb6MdqotIgaqNR7I+solhcA/ajtmxwU7mtKAeN6/76DZ2NnHsf
	z802iKKb7FJXlaqQTSD2ZXype86nOTj7lPhEm8yvAEA2SXzQvyMCF2UFUKeI4z6xJNnKwbJ5Uj0
	Xz0r22kkA1xOD61TWSvI2HGOpb6UjSmRGF499unPZ04ZzfN3c4yCEHI=
X-Google-Smtp-Source: AGHT+IGmDb6p8VZnHwrgcTbZOQXRGrluE+si7AWMqSazmE0c5urFjKz5HWJPMqHizLgkCsepLhbFkA==
X-Received: by 2002:a05:600c:4e52:b0:43d:2313:7b54 with SMTP id 5b1f17b1804b1-4408a7dd29amr39238205e9.3.1745331516028;
        Tue, 22 Apr 2025 07:18:36 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d04802fsm12388875e9.1.2025.04.22.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:18:35 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-dill: Upgrade 0.3.9 -> 0.4.0
Date: Tue, 22 Apr 2025 17:18:30 +0300
Message-Id: <20250422141833.862036-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 14:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117056

Upgrade to release 0.4.0:

- update travis badge link
- fix buiding documentation with sphinx 8.x
- add initial support for python 3.14
- Bump starlette from 0.37.2 to 0.40.0 in /docs
- fix typo in requirements.txt
- updated copyright for 2025
- Bump jinja2 from 3.1.4 to 3.1.5 in /docs
- support pypy-3.11
- update docs requirements; CI for pypy3.11
- fix CodeType support for PyPy3.11 7.3.19+
- move travis build of 3.9 to focal
- Bump jinja2 from 3.1.5 to 3.1.6 in /docs

License-Update: Updated copyright years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-dill_0.3.9.bb => python3-dill_0.4.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dill_0.3.9.bb => python3-dill_0.4.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.9.bb b/meta-python/recipes-devtools/python/python3-dill_0.4.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-dill_0.3.9.bb
rename to meta-python/recipes-devtools/python/python3-dill_0.4.0.bb
index bc5a7e5003..d421b1a887 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.9.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.4.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Serialize all of python"
 HOMEPAGE = "https://pypi.org/project/dill/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a41509b57cc475ed93f8cb1dbbfaeec1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed5ea77287d7d542949d6dd0bc288ac0"
 
-SRC_URI[sha256sum] = "81aa267dddf68cbfe8029c42ca9ec6a4ab3b22371d1c450abc54422577b4512c"
+SRC_URI[sha256sum] = "0633f1d2df477324f53a895b02c901fb961bdbf65a17122586ea7019292cbcf0"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


