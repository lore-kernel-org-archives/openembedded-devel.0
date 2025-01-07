Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F38E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 14:00:48 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.20733.1736258447646338164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 06:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DH8L5yAn;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf8f0ea963so50933866b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 06:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736258446; x=1736863246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6c3gU/ENuk/a17jAJ9yxLr3OXzXYTI80cCPUtMdo4o=;
        b=DH8L5yAnMX2OkQTZoP0vmsRf9d9qypxpJcVQlXcRaCXfKwxoGB8axOh5CFroJhGXfP
         wzEgQV01ZiZ+1+57aeTXidpz5svq1KpOJLvFHcp5SpT4IFoZuups+Gg/H5z8W4HouA03
         +pfZeeM1AGMQNpSAixrUC02VM6mgdd9XX98HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258446; x=1736863246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6c3gU/ENuk/a17jAJ9yxLr3OXzXYTI80cCPUtMdo4o=;
        b=Hs+pvhaPOElxd82IQMQL99Glc+dVittGG+N1ZrXM9Er9PDxGPjqVsQeIydAUQl2/2u
         HGDuT7IMMDmNco0raEREB+654oS4aJLl/I0dbIZ85ArHfGj40x+4L5H0jAobtN3fnaLD
         zVMriiqNLNSlwL7o+3Nxqt411gEHTCqIeYDVU+oUZ01R5OiiA5SWVs6GiV6StVA8T0eP
         MtsJV7BU5Qxz4CroHX7nh+bphRBULlirGYPm/HckPdzCZN8aFIY0Paq/8rw66fJfA9t9
         kSdBPZMZiESURI0fj64DpRBcwDj8EbEidCQIYkb1rKV92Dnfr+b0XNdnZ5ZLuCDSo3en
         HzDQ==
X-Gm-Message-State: AOJu0YzwYhw1zC3XEyl2ixUQBwDUCkFXEstgtvaU2KixfBIQRNkeMGMW
	b+k7CsC0PsCyBRocamHpBqMYLCCckR4+hTntRqdf15RwaitfhNu3wgFCAT2NAJ3G6hdGXVgl1oR
	D
X-Gm-Gg: ASbGncsjY6Y+qYq9hCiK4ZraN41ZK4AlAX+n/y4PvFg+9OgXrkudu22d935rj0NHh91
	FApljVRbY+ejUzHkPG1zZ3cXwcY6z55BTwIY7rV0QW16uE83RfiqGmMwa7WywuW2YzeOLRZmHRw
	xGPjRwRBkfA6kkR/t9xqbVJ/k9EBju5AXMX1XESjTPeaFE1QziAyN1HwzVtAdC+fIq3KUNlKvmx
	p+34PuQzWC0tZa0S77Kf5xHE4ixu3+8+n9XwpQBmmevTNyPMT9ndFilOLNBnveII4VqSc8=
X-Google-Smtp-Source: AGHT+IGsaJpW8DAnfv1KSaH5Y4s72TBBV89WtlI2Y3g+YU//ZZJKytMvKUGWr+v7BZeaZaBRH5B6aw==
X-Received: by 2002:a17:906:6a24:b0:aab:7467:3f6a with SMTP id a640c23a62f3a-aac2ad8446emr5030701766b.21.1736258443269;
        Tue, 07 Jan 2025 06:00:43 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm2403422166b.93.2025.01.07.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:00:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pydantic: Upgrade 2.10.2 -> 2.10.4
Date: Tue,  7 Jan 2025 16:00:36 +0200
Message-Id: <20250107140040.3330151-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 14:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114701

Upgrade to release 2.10.4:

- Fix for comparison of AnyUrl objects
- Properly fetch PEP 695 type params for functions, do not fetch
  annotations from signature
- Include JSON Schema input core schema in function schemas
- Add len to _BaseUrl to avoid TypeError
- Make sure the type reference is removed from the seen references

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydantic_2.10.2.bb => python3-pydantic_2.10.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.10.2.bb => python3-pydantic_2.10.4.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.10.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.10.4.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.10.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.10.4.bb
index bfc658e38a..adfce81b66 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.10.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "2bc2d7f17232e0841cbba4641e65ba1eb6fafb3a08de3a091ff3ce14a197c4fa" 
+SRC_URI[sha256sum] = "82f12e9723da6de4fe2ba888b5971157b3be7ad914267dea8f05f82b28254f06" 
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.39.5


