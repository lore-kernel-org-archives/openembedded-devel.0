Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C65FC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 23:22:56 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.6879.1684797775270045225
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 16:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mJsnnCpW;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64d24136685so2992150b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 16:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684797774; x=1687389774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pcxm+/C5IHCWZ0qemHJhxR2rartyOcQ1N9ZwD7icu+Y=;
        b=mJsnnCpWAidzCtwBxtWKUnAeNsIOLFZDhHchaJtAXmJPRm5eZCEpsBQe9FBKj4hdnQ
         KbcG922ElGbX3B0I26ZBHbmtMysK1EzneDTfgZFi5vb4Zh+EJ94zm6sHVRK91DrbWjLx
         LUNMW0cFdgyDO/W9Z9ey9y2UMNDoff2v4ARmoNqAsagTa/LNTycMTL11z3BvkfexnqND
         g5NePvvzSOP8/jGd6jIMb6OY5f0WlUWdPfYi+7DCdPGsxxRRTUyhGanSFNt8yNbZDvX2
         O8oEmw1PDpkFLtBVRBnYrRGZ7HgJ8PYJY0fkoCiQMT2GRyGHCY2mOoCmDrLqlxl/RAJl
         VWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684797774; x=1687389774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcxm+/C5IHCWZ0qemHJhxR2rartyOcQ1N9ZwD7icu+Y=;
        b=Cezn3Njk2LF2a2asVHlz1tYQTpDCFq0CwGudrgflL324jhoz4M9Dy4mVnPJACFoqen
         SJqJQbZJsOhz5Z8cXqT15gUITMwk8LdMkbBXxkrGPfWmhAk7gf06Uw+EbjmQ5nGhdIc+
         ILfiZlUu23G8Q8VceBYGCDy64BkFg/1RMPpCSnCoXEzxvTHzeqeYZBl3ha6JS9rZ8Sa7
         3Gne/yocoHp3Z1ihE+MpgxcIAmSgrjtdp/YR3fnPVLI+q5Pxwf7SRcc8Loe8qrqtrbsV
         AEeoVGMQRuxR/Vkr4212Q+gtl/PV0jcv0+LAidNNUh+BuDIc0JKHr6eZu4FfKKuqs6CM
         Fdng==
X-Gm-Message-State: AC+VfDxjw6ZtdLKum5QpgKYg6rP7WSYhr15NofuwacRazM4flpcyYR0y
	HMj1wFk8DB9KrVJfpUFMcKNP9yd1cb0=
X-Google-Smtp-Source: ACHHUZ4TbAY/xJn18mpeX2l0aWiaFa53OhtSdzKgCQJ4upFI5FpSPB0OYyW1I8fEb73OXXSjG1NSfg==
X-Received: by 2002:a05:6a00:2d02:b0:63b:6279:1039 with SMTP id fa2-20020a056a002d0200b0063b62791039mr14268929pfb.0.1684797774338;
        Mon, 22 May 2023 16:22:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id x22-20020aa793b6000000b006439df7ed5fsm4621267pff.6.2023.05.22.16.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 16:22:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] meta-oe-ptests: Add mcelog to PTESTS_FAST_META_OE
Date: Mon, 22 May 2023 16:22:48 -0700
Message-Id: <20230522232252.3475281-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 23:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102711

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 23d81296b2..0c5f6beaae 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -26,6 +26,7 @@ PTESTS_FAST_META_OE = "\
     libxmlb \
     libyang \
     lmdb \
+    mcelog \
     minicoredumper \
     neon \
     nodejs \
@@ -56,7 +57,6 @@ PTESTS_PROBLEMS_META_OE ="\
     libjcat \
     libteam \
     libxml++ \
-    mcelog \
     oprofile \
     ostree \
     psqlodbc \
-- 
2.40.1


