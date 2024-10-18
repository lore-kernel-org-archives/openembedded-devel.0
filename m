Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7EFD3F2B7
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.30087.1729278817403310917
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S1kAu6JF;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e3c3da5bcdso26432817b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278816; x=1729883616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8HMkijd3Nd0YuKFU8cYtxjGR8FoJZLEV9M2tIuVoC0=;
        b=S1kAu6JFQJ0uDEYMJRu3gS5tEThtIlcUiFNeADLP08k5mWFWlN6bkGSjNZckBMcOGO
         GxghN6M/UEeZqudV6ADneMLIwGNCMeE5rt1CdOkcZR7LjL8Nrnrtr6INdqY9Wa7l+0g7
         ZG2VN8/GkiE8u6vjJVCAhORZ79JoSUvfXZyxKCgiM12AAtvOmfy6wlVCWvK69CQRH2S8
         7VfQCvgMnYFUM4uHVi5zXQ7+bf1sIlHvJjhsCX9VuRWezv0gTCV2hWIcRFgfkItEQamu
         GNj3zBFpjo8gSS8xNKfNYZbg87iNcKCxRhDQpI66s9th5FRM+1N6ZHGTT6gsSb5AC9Cj
         v8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278816; x=1729883616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8HMkijd3Nd0YuKFU8cYtxjGR8FoJZLEV9M2tIuVoC0=;
        b=c1PkzKgxMtBcSzq5MDNg/2gMNsJPUawVM0xBlfNgo/JAAcOa8LS15awcjGYlnYX03I
         c2LG15jepJiK7H8NgNRj4OH3FDrsZgumKsl/iZD6tYnoHLiKCkWm5BnSk7SUft2j6Zbh
         QuZ5ez8x+sRUAm4Xcq9yf1up3eIENVhLxEfmZcsKDwevf7PYB70H4orfCK9Lc5aqWSw9
         uTfuQfGP+2mlUZdvkIcR8keS05jjfcvb53lCBUimUuZgBz7Nt3Be8fXyfVVIm3E0kR3p
         TnFg4SIcFOGCfThFVUezn0E7tYlFbfToN/FkDsqGpEcrq0lo+nFa16zYMlxCkQ6Sorru
         y3nA==
X-Gm-Message-State: AOJu0Yywk9/9WyZFHgH4iATJEe/pZH+YDZTW4yuQE091h6Uv94drEa8G
	kTPEYr9YYnYFioQPq85/8cIWwlmchzYZ0MmifaeHNOrO0IUAREUquUtbDA==
X-Google-Smtp-Source: AGHT+IHm7dRHqtU9HWJPvcWdxOAP4jN8u51aTFym2dLgLO3TqK57vTSu22bPJrziP3RlnHdQNGxuyA==
X-Received: by 2002:a05:690c:2a86:b0:6e3:fb4:9333 with SMTP id 00721157ae682-6e5bfcf44famr32776697b3.28.1729278816194;
        Fri, 18 Oct 2024 12:13:36 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:35 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 39/68] python3-meld3: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:26 -0400
Message-ID: <20241018191101.25184-40-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113026

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
index 97eea4682..f212f8d8d 100644
--- a/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
@@ -8,7 +8,6 @@ HOMEPAGE = "https://github.com/supervisor/meld3"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf"
 
-SRC_URI[md5sum] = "1add16caefc9e6b82ef4f40532cb4918"
 SRC_URI[sha256sum] = "3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558cad5e775"
 
 inherit pypi setuptools3
-- 
2.43.0


