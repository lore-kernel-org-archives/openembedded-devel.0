Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E49DC282EC
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:59:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.10396.1741258773500404234
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cBqnVGG3;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bc31227ecso2852465e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 02:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741258772; x=1741863572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnZIBj/NhN9jj62albEJbKYIIb9KdMW4ZIAM8QUUTw0=;
        b=cBqnVGG3wGH5yPJgxUdRtaqXF92HO8PAUd42APUKZoHSz9r/T55OkwjXE2tpUcvO1f
         UdakxR5hBSszag/8PlnNdAUV7NFjuY409fzGzKyaYxtJzxsilq8gEyLhWgLbnw5c5RGN
         cOciVKB5u5xFCXCY7SdHjCDzE+lZ/hbYuJPdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258772; x=1741863572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnZIBj/NhN9jj62albEJbKYIIb9KdMW4ZIAM8QUUTw0=;
        b=ZdM1VKtAmQXgcy2NhcUEKYXpT5N/ICnnOMiCdvIsV+2SB63KF5TlI3bo6ZBNK2uRhm
         y/LVVPGYkDXTvZ2AF+XHYVK/2qdOY22hrkN45bBNRzTD8eDfJoYDhMD5ewhbw9jGWcM4
         tyCnlGWppKtB7PUIVue8f+hq5yOtrDoJzq3LERjRlWaFF75byADJx0aNt5AjcUrdtH2Z
         I9WQ26YCWRLKe0LQiQbm0mdid5lpRBNt5pfbtzODcZEpDu5t6cIOQawJ3RhKU2hpymtx
         5k0iq37lSaXEBTp93irkC4Wv0jtT7vGiTCfqx4hT8hlpFq4bIa4ygBYNdP01rxpRMAX2
         yJTg==
X-Gm-Message-State: AOJu0YwfvkWQjNhhMsmHvLUypa04KfxTz/H7wtpDbEupHALrjzWlfqOT
	rNeh45U30jnWwNvzeWM0Vov2VsBxX4tK49IsherkV3z75aV5g+saLmqxUBRwY57Tog7vGPRkWD1
	y
X-Gm-Gg: ASbGncud79uPO4riLLZVeRxX9zKEzjP0QVGOQloKsaJQo0KuH7bs7yXp4GKbywAm7oN
	DnQjQ9O2eWT/4Ajx9j7NlCKTflKCVmoOg4M/Eacio4cHgCn3TxysfAtFhPbw6pXFAejNUhwlIzE
	tptVtmDl5sKmg/y76GqnCEJe/KbrNVw7VfxM72k75siBm1tS5YqpMi0B3AoDRAHTgl6e6d9Sm4g
	ibOk4vMBqeORiapmIs+Vm9dn7aLahAkj71bRqKDOQoo8Rm2Usgc1hyVJsD7titD8CebTX2hAMue
	UZ2xQCt+t2Vu0vAFyvnNrVdJ+As++mF0tKE719qcASfxCg/Nx1zx+NP5WD4=
X-Google-Smtp-Source: AGHT+IEtDatQZZNY9Z1iXQmZNmZgD3nUGwnJup3rNlbCpSqgN/jR9XvsIG0u4n5j89e0S7THGUApCg==
X-Received: by 2002:a05:600c:468e:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43bd293f76cmr61030505e9.7.1741258771742;
        Thu, 06 Mar 2025 02:59:31 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352ed7sm46244835e9.26.2025.03.06.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:59:31 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-h2: Upgrade 4.1.0 -> 4.2.0
Date: Thu,  6 Mar 2025 12:59:28 +0200
Message-Id: <20250306105928.3735026-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306105928.3735026-1-leon.anavi@konsulko.com>
References: <20250306105928.3735026-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 10:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115770

Upgrade to release 4.2.0:

- Support for Python 3.11 has been added.
- Support for Python 3.12 has been added.
- Support for Python 3.13 has been added.
- Add an ability to send outbound cookies separately to improve
  headers compression.
- Updated packaging and testing infrastructure.
- Fix repr() checks for Python 3.11
- Fix asyncio / wsgi examples.
- Clarify docs on using curl with http2.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python-h2/{python3-h2_4.1.0.bb => python3-h2_4.2.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-h2/{python3-h2_4.1.0.bb => python3-h2_4.2.0.bb} (67%)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.2.0.bb
similarity index 67%
rename from meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb
rename to meta-python/recipes-connectivity/python-h2/python3-h2_4.2.0.bb
index 6b3ce25371..55b534ebbf 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.2.0.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1"
 
-SRC_URI[sha256sum] = "a83aca08fbe7aacb79fec788c9c0bac936343560ed9ec18b82a13a12c28d2abb"
+SRC_URI[sha256sum] = "c8a52129695e88b1a0578d8d2cc6842bbd79128ac685463b887ee278126ad01f"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-hpack python3-hyperframe"
-- 
2.39.5


