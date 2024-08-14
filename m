Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D5CC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 11:54:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.96047.1723636479930102080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 04:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EDI4FIPc;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso50059375e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 04:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723636478; x=1724241278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pxty/6gg9WUJ/uUTqZt3eyQHT7MbMz56TZ3UH6l3oU=;
        b=EDI4FIPca72L1I2X9BrPso5gSy62x06hOD0uf9ymrFSOcJy74hCQjEiDLHvXI565iQ
         2h5mFe1j1JPbVER/+pTs0+BvCH4xk0pKGILIF8pL4SX4/+7MygtDi6DGrxab4PcsPMdo
         EBeuWda4gI9clMbGdai2/qNrkG9reG6MFXiVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636478; x=1724241278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pxty/6gg9WUJ/uUTqZt3eyQHT7MbMz56TZ3UH6l3oU=;
        b=uCUex5geqSX5E4P8iJcaGL23iYfBh9T/UfHjLF6jljq9hYPaUewbywu9YqZexCl67b
         hWQtx+hEbbbcq4DHErFhJ8hmk+EIc4VWJ07dwZKuiDUZwTMVi8xE/HEUsMoGYxYhFfX3
         vRmkrWUicye5P7kfYcIEp5LpKd06JhXc640ojLoiCnfR7ibdcyYdJBCIv1GdmYV9INb5
         Uq48ZOyhzejU0ymMqW/NKiZEdfeMEsHjlQMOsFy5+nY5IE0a09DdUbh+mG/0HumAh74H
         VVzfIix5tusosb8VCu6sgbR3pkmI9F2ejDZ1jrPZ2WXjhzv5OA/kovW01PI7kcRzhK/Q
         j5SA==
X-Gm-Message-State: AOJu0YyjNfOr9IimmsjJ0Wo334sjLs1NIdG4HWhk0D1VUd+SB4ZICTDR
	eRyAXks+0JjnOrl4YQEkgOhnu/InzJAYNmScC7lZun+1KuFoAzY1nIgYc2U0tB7AnZ9hhKLlX+n
	J
X-Google-Smtp-Source: AGHT+IHwO50g5inpIsm77fsZlLg6gHkTd16HWLrtCvOSa5CtE5fPBQewyHEarxDOH0YsWKazw/j3CA==
X-Received: by 2002:a5d:453a:0:b0:371:6fdc:1264 with SMTP id ffacd0b85a97d-37177827b35mr2062383f8f.60.1723636477704;
        Wed, 14 Aug 2024 04:54:37 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4cfeeb09sm12700620f8f.51.2024.08.14.04.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:54:37 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-watchdog: Upgrade 4.0.1 -> 4.0.2
Date: Wed, 14 Aug 2024 14:54:33 +0300
Message-Id: <20240814115435.808089-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 11:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111801

Upgrade to release 4.0.2:

- Add support for Python 3.13
- [core] Run ruff, apply several fixes
- [core] Remove execution rights from events.py
- [documentation] Update PatternMatchingEventHandler docstrings
- [documentation] Simplify the quickstart example
- [fsevents] Add missing event_filter keyword-argument to
  FSEventsObserver.schedule()
- [utils] Fix a possible race condition in AutoRestartTrick
- [watchmedo] Remove execution rights from watchmedo.py

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_4.0.1.bb => python3-watchdog_4.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_4.0.1.bb => python3-watchdog_4.0.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_4.0.1.bb b/meta-python/recipes-devtools/python/python3-watchdog_4.0.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-watchdog_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_4.0.2.bb
index 4d0a626c4..ffe5cfad1 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_4.0.2.bb
@@ -4,7 +4,7 @@ DEPENDS = "python3-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "eebaacf674fa25511e8867028d281e602ee6500045b57f43b08778082f7f8b44"
+SRC_URI[sha256sum] = "b4dfbb6c49221be4535623ea4474a4d6ee0a9cef4a80b20c28db4d858b64e270"
 
 inherit pypi setuptools3
 
-- 
2.39.2


