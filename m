Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F92C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 15:38:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.15796.1708616287695704302
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 07:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dTPn65jo;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dc49afb495so7766245ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708616287; x=1709221087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXMQ7PbS46wf/hQYME7fqj4t7fjBwZklk5oDaZP3C40=;
        b=dTPn65joa37znQiwdoFHESUqSWj6i+JV2ThdPaIZleknlsDwVWuIoELHLSuchlSEUC
         B/t320FwP9uAX0L1WNiP4fGqxazSdvIK4HeN823jUnd1ptfPoG6U+7NHalY2UZXa1XRw
         Msmjw5iEmDsW4iQvTqHiCvjs3K+g8aW5+slf3UNWB+d7rgTjE3Uf0stMkhbna6Uguj2L
         ZtJFTKuT2Gya5kBr/jgVbRFmu4QM3w3GX0URlWuaqOqKYKX7AgFafctVfxSNvIwuVeKG
         rslSv6BsiXklRRRMLKzxfktg63bT+HMn4rUuvr7JFWD8ozucDsSvB09GyOtLM9G9rHok
         enHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708616287; x=1709221087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXMQ7PbS46wf/hQYME7fqj4t7fjBwZklk5oDaZP3C40=;
        b=xALrI7xFqQ+SY/Yq9IhD9ZAd3hyrojy3yk3EsOH6M78iXhPNkq1n3QXQRVClMDl49f
         VZ/24VvYw22gVrHSJDICvyr88uG+PN9Q8zFKN3aCQvdu1vCW9A8cLJIKk4ZdglxyCvNz
         nws4lpOevxB5KJCsYaQ/cvOZ2X7IALnzzw977ETdw3TWHHIHsmD4wR5rxDAAtQxEbWUc
         EFR/TnYNfDnPDQC1s0YUDLvRNmTJtfggQYk12zgVuZ+sFQwxQgQDpti4SxJNhQx8J714
         lGvil/dT4t91F3pvawM9Zhy8Mto1NxICNsI3VaEWMKnxqcz94ulta8oBhXqs4cYWjiM/
         0LrQ==
X-Gm-Message-State: AOJu0YygXxhQm5mKWSTWcvUMNznCRpvMtzo2YvdqxIx856bzXjKAkqkB
	0/2N5rtZmE7C4GnXvKlCI8x96Mc2/E4YjE30+jZV2JoalKB3qsEnZNMnCaXXWT0=
X-Google-Smtp-Source: AGHT+IH/jX96HWV+oZacj3c/a7h1pJcQh7frbR3IMRewl89jWow7l4PyxsKi5Aw08uk2/Q0lFoP0DA==
X-Received: by 2002:a17:90a:c305:b0:29a:691c:8404 with SMTP id g5-20020a17090ac30500b0029a691c8404mr585253pjt.0.1708616286503;
        Thu, 22 Feb 2024 07:38:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e522])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090adb5100b0029a04d96d02sm3889433pjx.11.2024.02.22.07.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 07:38:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ptest-packagelists-meta-oe: Remove oprofile for rv32/rv64
Date: Thu, 22 Feb 2024 07:38:03 -0800
Message-ID: <20240222153803.433202-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 15:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108990

oprofile is not ported to riscv yet.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 06c7de3f8b..0645cfc753 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -71,3 +71,6 @@ PTESTS_PROBLEMS_META_OE ="\
     psqlodbc \
     pv \
 "
+
+PTESTS_FAST_META_OE:remove:riscv64 = "oprofile"
+PTESTS_FAST_META_OE:remove:riscv32 = "oprofile"
-- 
2.43.2


