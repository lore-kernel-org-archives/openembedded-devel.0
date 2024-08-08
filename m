Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF7CC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 10:14:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.56684.1723112048697226466
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 03:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zx6tAd6U;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428f5c0833bso10664315e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 03:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723112047; x=1723716847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ubLCoMBwbNX/N9jpgsV3ZUIcy9bYsked5fEx7/XbS8=;
        b=Zx6tAd6UOsVn9QrTeZExCGSdQL12nmyOm4CNuKnu7ra3no89tfTr+cW7eTIt45751N
         LFf8KQXpV+gfE88GQlfg+PEvBLU05v8Es7Gi3pLlxPueIuxJh8MH4sFLOLhSezEs6Is2
         524eYEgActYsRuJs///H/O749QBkTNWQH4Gzvdlh6QlcWmASL6+U9bCUietvDvINtUYL
         39CM4zoNA6XgX7BwC+dFASPn33XzRa6aN9XL2m1lykJLPW0gv7qoLvYIof/xP/UBmy6t
         Fnbx/mIpYKMP/IsF4g6ciykqYrVZrXTmOaUMzwN8cWVC9d6RVADtN9UAODIplgl1L32K
         AA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112047; x=1723716847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ubLCoMBwbNX/N9jpgsV3ZUIcy9bYsked5fEx7/XbS8=;
        b=HeVcLAoYXn5wA94Y5ZzK4T/M2iTuHMRn/TPN0gD7ZJkgcx6jaaiwt/YZYbE9fkXK+Z
         G5UpZnls1S8xZE2FZmdZ02etXWvVdvGGqW8M4SqlWhHNl/cnvwTHeXMkaRs2OMgee/RX
         FBfeN0b3v3uTTo5kFmdq5l3OATa3DaaftCWJa/8xj8FfiangUmni6P0vXYzx7ggRs0Rw
         njb0Tkz7/jRIUClgYrhjFb5vTU9MMceg43XvYMDxRuRzTFIwEdtKsoO6Bvl9W4yq18zM
         o4kbozxnuHPLHY+uf3ezBExUP/q04SuCGal5c5ZYxjI3lmxs1CRxazC7cZhnG1QWHUQh
         7/Gg==
X-Gm-Message-State: AOJu0YwISXKjMEWhCSywHiOpIJDoJgWlbX5Z8tADBILfdsOh9glbQpI0
	fW+GOmlaTXMmvgZcWrsRQyEA5/enW/zafwYfqU9qSxdw3FZeJHXKNRULao5t
X-Google-Smtp-Source: AGHT+IGw3aRwQiFE9zBtE3imHJGg5D+YwRl6jtDM7jd7H8OmFFm8hC+Gh+kxslv1hqvRK+Y/hinEGg==
X-Received: by 2002:a05:600c:4e8d:b0:424:a7f1:ba2 with SMTP id 5b1f17b1804b1-4290b8dee6dmr11303565e9.17.1723112046305;
        Thu, 08 Aug 2024 03:14:06 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c74ff9fsm15121215e9.28.2024.08.08.03.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:14:05 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-reedsolo: fix versioning
Date: Thu,  8 Aug 2024 13:14:02 +0300
Message-Id: <20240808101402.24626-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 10:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111651

The latest release version 1.7.0.

https://pypi.org/project/reedsolo/#description
https://github.com/tomerfiliba-org/reedsolomon/releases

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{python3-reedsolo_2.0.13.bb => python3-reedsolo_1.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo_2.0.13.bb => python3-reedsolo_1.7.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
index bb5b973d8..b6c40921c 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
 LICENSE = "MIT-0 | Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
-SRC_URI[sha256sum] = "71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717"
+SRC_URI[sha256sum] = "c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732"
 
 inherit pypi setuptools3
 
-- 
2.25.1


