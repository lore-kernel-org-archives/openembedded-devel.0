Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FD2C52D77
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.2129.1674324095317219574
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X5oAAF1s;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id z13so7968652plg.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK8cZMmEO3MZJb6gFaEvYKQaXb1WZy8bkp8kVqmMFBw=;
        b=X5oAAF1sPMsav7sHiQnt+xh6LFjHcWWoa6Ms0dooOfm+sR2o/gfV+/i8S6Ut8PqaHJ
         k9jB4ZWTbIPJIB+byEfcaHwq1KPyWyza8zV0g42hRc3iv5ZxPr+qyvpKUEG1Q3DWz7HY
         uLev93d2WWvnop7fJrnlzT+XvqTJtJ6/ilrax2LfWCJnCD/SggeW2fjt2eolZjcBOXtB
         SDiXWD4VnqOgdrRN3yRSjZTl5ZvISOPWSgf9dMkXzgrQIN46gc9FAXa+T+mv+cstM7wM
         Xp6TWwbBTF1jHYr0EO8qHDgP9yesSFCI6kHzArZdOo6uvk2lPdhnvUnJ5ZGk/Fx0xApI
         /snA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK8cZMmEO3MZJb6gFaEvYKQaXb1WZy8bkp8kVqmMFBw=;
        b=sURBr27tcYAWYbi8DNgsR7xTZGzA2y4x+CHcOj/2BKVUlLpzxXIOVZLZVKsGoa1eXH
         F8V5PHR8km/C/3BApqgB+GwgOzWQ1mcAiBfDI/VKz9EMkO8pemwNtCAZfr8t8xfpHqWo
         s1ydQHmelMxFkeUcroKGZ1PaFJ2QmZw/piguG0IT6RTrmlL0m8U/q536YmtKQ6/jQn5v
         sGDc1QxpoGne5Z3rHNmgvAXfAiBdv15T1dvMKmhZwlL7kG3rC6j1bEx81tL/PnAyi8xI
         3yesejyaKjP9RrORPL65vAatUuWH7zyH1MuQNuwr+4tsxz19qHiU4v5B6CIQkZvOcdND
         2T3w==
X-Gm-Message-State: AFqh2kphVQ5yxGl+CXV+9edwtTRdEKiVvKA3uqfVuEV4aOIPwapQptgL
	l2R9vkuZ0JHS5cgCIbjLThSgAOlmFrNMMA==
X-Google-Smtp-Source: AMrXdXsAP5x+Jd/+cn5Kyro59EEUOr7qdSpTMU56H2+KyZM7TTcuHtliDDHMw4LYj4nsvciY7+q2CQ==
X-Received: by 2002:a17:90a:300b:b0:227:db2:25fe with SMTP id g11-20020a17090a300b00b002270db225femr19889753pjb.35.1674324094460;
        Sat, 21 Jan 2023 10:01:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/30] libmimetic: Pin to using -std=c++14
Date: Sat, 21 Jan 2023 10:01:04 -0800
Message-Id: <20230121180121.1229895-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100680

It uses unary_function which is removed in c++17

| ../../../git/mimetic/rfc822/header.h:37:21: error: no template named 'unary_function' in namespace 'std'; did you mean '__unary_function'?
|         public std::unary_function<const Field, bool>
|                ~~~~~^~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
index fc0b1ee495..06536ca70f 100644
--- a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
+++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
@@ -19,6 +19,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
-CXXFLAGS += "-Wno-narrowing"
+CXXFLAGS += "-Wno-narrowing -std=c++14"
 
 inherit autotools
-- 
2.39.1


