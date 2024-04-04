Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C315ACD1288
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 20:35:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.3322.1712262949316404103
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 13:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPRbDmMk;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e0878b76f3so12705535ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 13:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712262948; x=1712867748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wz5v+HoZSEKWEJ4v2J0i18Lu78LTo719a17Vb5kmLb4=;
        b=MPRbDmMkozXO5WejWVMaFp/e18BPj8kHSQ5RXRvLtaLR5RLkqRzX6N+Yh3PQrWtpcg
         BtPzT3ug/1SjRPqWAA5utWwMb1YPsH6VnBPNLzkS4RNmM9oYhzcAXPJBTsxUWwEpqrtM
         RSoXIUQkxSBrBnvATbvjrsW7PkUQE18RAkBjC3xG/vOWifVp1shiEUtlo4R60RM3mWj6
         hBbP6GcJjCvNLG1wk/W8p7uTwEl1xthFYRRzrCcqZRvlDWyEffYPK6mGtZcVauo9u/sE
         mY7bhdFPYV5js5Vxu02fFNwZ1YLArwsS/xZmKs8qufu/6Lxd3qsIeASlZQqEK4QXKshi
         9tYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712262948; x=1712867748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz5v+HoZSEKWEJ4v2J0i18Lu78LTo719a17Vb5kmLb4=;
        b=IBgqZYwsotzahJRtJnpj1eLUMqGQ9A5kFDCKdGA5poNkpLxfdE23nxwGFdCyZArVrS
         vIqHeYUc+d32PyU0MHpa6zRhtW5E5phzZWz+BSlhskDCUnw+JH89kKW0U9iU71fCmJET
         W9W/XKu1vbBL+pZKB1ocTv01EJ8ZR7Xx+q+EOeDdotDPvSP1vQAD9udljpaI9hXu36Wc
         p0Lei1Bza2RNRfiWK0C6G+jcElET26IIo3QNR2BeoksyZ1KLbfjT96qa52vkAkV9vZuQ
         kirmwgr/8RA17NqhdwYt4RUSBy6ftcWVWrVe6/8t7Y9oCBc4G82SOx2kq31sUQHXBPJm
         lz8w==
X-Gm-Message-State: AOJu0YwTVGyDjzRShNS3UgynXwVtv8Tq81qUGh/SFiNiPMcgl5G9HHvK
	yeJX+APoN1It0I4UZgntlVvU6L9EahOOgVDEEv/4SGkPyOZRfjBRMh38bTvU
X-Google-Smtp-Source: AGHT+IHXkagkalT3N5OSX9H/vBc0cgzEXRfOJNEt3NV7Bd/pMlAJ2EAiD4FwqseAcSMK3EOSh8tJMA==
X-Received: by 2002:a17:902:c405:b0:1e2:a077:1c8e with SMTP id k5-20020a170902c40500b001e2a0771c8emr632902plk.26.1712262948318;
        Thu, 04 Apr 2024 13:35:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5077])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902d08c00b001e06c1eee22sm39764plv.74.2024.04.04.13.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:35:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-pydantic-core: Enable benchmark tests
Date: Thu,  4 Apr 2024 13:35:42 -0700
Message-ID: <20240404203546.285796-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 20:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109802

Add missing dependencies for additional ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pydantic-core_2.16.3.bb    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
index 2086091d63..40478cdbb6 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
@@ -30,6 +30,8 @@ RDEPENDS:${PN}-ptest += "\
     python3-hypothesis \
     python3-pytest \
     python3-pytest-mock \
+    python3-pytest-timeout \
+    python3-pytest-benchmark \
     python3-unittest-automake-output \
 "
 
@@ -46,5 +48,4 @@ do_install:append() {
 
 do_install_ptest() {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
-    rm -rf ${D}${PTEST_PATH}/tests/benchmarks
 }
-- 
2.44.0


