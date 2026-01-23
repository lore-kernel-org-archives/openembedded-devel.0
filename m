Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7C7D77886
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117.1769187748218938589
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gRpMZ4Xc;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so17525305e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187747; x=1769792547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZp/Zpm6dCKDdVaSBVayeF2UM/RaX/u3K4+KOL9Toww=;
        b=gRpMZ4Xc9Fz95TgOupiGXPSSSJkMc5qKxTYyvGWy4IlmT92my+deJRITxgUi5M/CGR
         SFFCi6vY7sFZ6zRkCPh1tbkdQIptrFQDYvpKekRUxmYPjvrawLYXYSr8JUfbE+uQHgu/
         k62DVVVtT13bsIlxiF9uaQkKdBgVMCWLJnuw7e6cKQrZHaL3jftG9sFJDAtoKjlWGd6e
         1K9h5nc0xqRXQ5CTxH36oiWRWZx+5uiDcnMcxqj9UTvrSJ5yogR997yn5UK1slKbz8B0
         fB0BTucG430YmTPwsqN5LCWK2XqZmolW6TmgpPt0Q1Err6oZov5Y0+i32kcWObq1tKh/
         klRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187747; x=1769792547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yZp/Zpm6dCKDdVaSBVayeF2UM/RaX/u3K4+KOL9Toww=;
        b=HQG9umD7d11LUaITxkex6rPMb+HAuo6Rc3VExueRwbrsxKuc+8jSEGB0gPTJ9lzWmV
         eQSsnrad/jWpYCqTaPTTjdYLuFux7BQJC2BtNAbwV2RY4DM13ik2cI14Q46Wnrqe7iGc
         MZFJchUhMvVjYi5dYlALPkGw04gU+4crVH3u/o2ToBbwbW/NcgOPFyjCSNK5pc8Cjm3A
         rPxFF4IH8YONjWsO1mobAV7YbBwydr0BnXzrBtTax5kOWtuVh2vZan6/9YYR9BehcW7g
         pDf4BdyK/CG69HbM0DTBOHoPU+rHbPKQyuHQ2srniZJLnN3bIdg6whZeb7Avr9a7kZIS
         ZC6g==
X-Gm-Message-State: AOJu0YxVwhOOBRVny6ke2ArdOdjddzhm6kQ6D0b4UoK/CdsCjNHPBq5s
	k2pXEhjAIE1XZQfZcXTmvF5XvC2qXLyIPm5Bqg5t6YpeEdfjn4Q/bctKIPadeQ==
X-Gm-Gg: AZuq6aK+gnK3GCAYofEmCSGiN9EV9LU6CCjIKjdvrpDPMaVHl7T6HdTVQONhjd2Wbm1
	pi8oyUa58hwU04x1vbdN98tzDFBwWDg5CZz+kSENciSXimbII5KQ4H3E+cYEYfYXyCoGg9c2Mmy
	ynmWWcjWkZWQQBDF0ITT6vEDgojsaudaqe/XtKeIiPeL3r7tPkaPRw0E0snCAHwC38NvmdctRSl
	eFwjyLwpBxcswK/iE5nO/yEr/SlY4Ja/mobL4dMo3a1lroVhvC6KT6wXRjhC2iQBLqy1MHdZAOA
	OBtFCJeCbuGe7sV8QfcJLxuirmX3pGEWSV8m3LcyjfNJVD9rDuRxtpPMsATlIAcD6qcB53b0efN
	Qyvaiqa70To3zlMwBz3HV9p4MYfhIhpdMadyKeJn8VlbCLDb/9ckUHzSw3L3uUL8rLnU6q+0bFq
	U7TcdJLLYi7BAV1odACws=
X-Received: by 2002:a05:600c:8b09:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-4804c960f04mr65361995e9.16.1769187746309;
        Fri, 23 Jan 2026 09:02:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 05/10] python3-waitress: upgrade 3.0.0 -> 3.0.2
Date: Fri, 23 Jan 2026 18:02:16 +0100
Message-ID: <20260123170221.671471-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123170221.671471-1-skandigraun@gmail.com>
References: <20260123170221.671471-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123790

Contains fixes for CVE-2024-49768 and CVE-2024-49769

Changelog:
3.0.1:
- Python 3.8 is no longer supported.
- Added support for Python 3.13.
- Fix a bug that would lead to Waitress busy looping on select() on a half-open
  socket due to a race condition that existed when creating a new HTTPChannel.
- No longer strip the header values before passing them to the WSGI environ.
- Fix a race condition in Waitress when `channel_request_lookahead` is enabled
  that could lead to HTTP request smuggling.

3.0.2:
- When using Waitress to process trusted proxy headers, Waitress will now
  update the headers to drop any untrusted values, thereby making sure that
  WSGI apps only get trusted and validated values that Waitress itself used to
  update the environ.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-waitress_3.0.0.bb => python3-waitress_3.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_3.0.0.bb => python3-waitress_3.0.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_3.0.0.bb b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-waitress_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
index 7470fc02a0..b8e90807cf 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
@@ -10,6 +10,6 @@ RDEPENDS:${PN} += " \
         python3-logging \
 "
 
-SRC_URI[sha256sum] = "005da479b04134cdd9dd602d1ee7c49d79de0537610d653674cc6cbde222b8a1"
+SRC_URI[sha256sum] = "682aaaf2af0c44ada4abfb70ded36393f0e307f4ab9456a215ce0020baefc31f"
 
 inherit python_setuptools_build_meta pypi

