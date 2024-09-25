Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3BDCCFA0A
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 23:32:42 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.30761.1727307159043789671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 16:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HdIA4HN9;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71788bfe60eso376398b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 16:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727307158; x=1727911958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Euzu/mwowfdHbwELPeXNXoyUJ6LXAgAKzFt3Qofoo4=;
        b=HdIA4HN98m/tHiuXg6QhFmCw8fBC7dMHqtAksOKZ3fEOQ14aDH902ibQK5YWSz9/g5
         BD+cMj9dVs1DDsC6mzAxVCPKp1qbo3nPM1tqw9UbJde9rDKHac5SM4WwK6VaFAQcaase
         K6dVuyRlFJsfgATCuN44+SUHlj/iu/NkjAazpT7avszypjIYA70GlPRM4T6cUZzHbped
         jdHjrcGwHZn76d5rHvhCOjbWM+rmdi9Ly+PeaTbCSNWH+wWJtlcvh/lzdOC4aGdJqNHA
         Js8t3+Bi7pzHf1P9sRkvvO/FOLQ0ydlH0n3SqYb8zbNIxUPgzSzBLX9cjlolHYbb4Mdf
         9H2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307158; x=1727911958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Euzu/mwowfdHbwELPeXNXoyUJ6LXAgAKzFt3Qofoo4=;
        b=l9IpjEKZj95lz0zHl16++/aM3k1gnr7Bbqe1170t3+W/rS62XsBBPCnW+Z5I7iOZHz
         f+H1iZ3PKJglLbq7VBFpf7fuV7j57AXyEIcDeOXcFgxBFAHCN5+z9NvTG+uY3QHWLxi8
         TLL5ztfllRIyJCb2wYMwKyUU8YycPbNcp8pvN8gXwCpaEe4Q15jUAGp6FsJ7JxBtfEHv
         1IIt0dzG/RU7XkAoPi6yyLAXgo0yuO0ErFxcnq9VLqlB8KB9ggO2sGf5eUZX3Loove8f
         qNJEOgqUj4fNOavrhFaE+mjzhybCG+ry47O8pXsnkUOYoaFOgRvqb0690Jlgpq5mGINM
         egGw==
X-Gm-Message-State: AOJu0Yxdt3rD3wRUMrLKsal9hO6DJ8C44umzu8T9FXkzQzj1U0DYvzRQ
	ka1dCjx9Uv/+8QzFxibkgbLQTVMcdHkoN9GCnqnRFRs7StwAZu7HPrz7FBGr
X-Google-Smtp-Source: AGHT+IFSRaByax4qKno9BxtyI6fndtiYty8SxakbVWYhyesY2siDIedHyIFAAWllgNqsBREa0Ave3w==
X-Received: by 2002:a05:6a00:3cd3:b0:714:3a4b:f78f with SMTP id d2e1a72fcca58-71b0ac531c9mr5350636b3a.20.1727307158231;
        Wed, 25 Sep 2024 16:32:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::eea4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc939046sm3243550b3a.107.2024.09.25.16.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:32:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/5] python3-gunicorn: Add missing rdeps for ptests
Date: Wed, 25 Sep 2024 16:32:32 -0700
Message-ID: <20240925233234.1685606-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925233234.1685606-1-raj.khem@gmail.com>
References: <20240925233234.1685606-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 23:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112504

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
index 8d825c8651..3c819a934d 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
@@ -11,9 +11,11 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+# python-misc for wsgiref
 RDEPENDS:${PN}-ptest += " \
     python3-eventlet \
     python3-gevent \
+    python3-misc \
     python3-pytest \
     python3-unittest-automake-output \
 "

