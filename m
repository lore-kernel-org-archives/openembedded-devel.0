Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C57D358C0
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 06:31:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9716.1769668292733484204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 22:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=awtFZhiL;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso3179565e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 22:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769668291; x=1770273091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPb75yUWEo+TeuUUqlDh0LMpj+i7g5kp28UxzODGm/A=;
        b=awtFZhiLA6zTmvj2bdTX8dlb4h2J8lwpyDZGil6zBMYV06er/O0KSD54kH4QTef42G
         2cR7720C5mOJlgQDNWZeVpHMJ3L6MTOKMyEWqyHQwNNzgFoZDVzVGnpBKVx58DVgiSz/
         0rsSZ8HbJWurnwA7XYnpSWXDYjklt6+1gxyB4cgn9vGqR0fAqD5uUcfuBCfP/fwti4Cd
         WqoulhwBqwph5CJfuqgFRzaBmUX4nLdm1YfeSJTN5tqnRJ38mvfbEgaD63fYB4hw9/ij
         NuzG3QK7H7uTCe9HikNkJNHyTh3D+FZhXfn0f6Ij/SK97tCHN8/FeLIi28RDDi1Z4I5J
         iL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668291; x=1770273091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPb75yUWEo+TeuUUqlDh0LMpj+i7g5kp28UxzODGm/A=;
        b=EneoEdDjg1T4nZizIBGRkzROZflZojC2uOJ4Ut/BiByAmZ1ISkksu6CoKorXUJ45i3
         gcSu3IiqnOD6s7DGMZuUv4KnGFzP20gDMakcwdqrAxskkT+BzdGjjsXIo4V8kPKkCXPO
         C6W5N909liZ6W+VS/0fsEnPbyr6cw82oMaxETKiE9FnYUi8h35g8ItEKOi/KGG8WQ9jI
         EdXzrEDm+wjxq2QYuMuJ+J79h0FtLhEqWsDFWal5GlwS3FLH5gvYgf9tCihxW4t2tfpE
         EJGmwyTiXzSbXkHY5YFXF4ztDJi55KDzpXepEXlhfizokUyuBPo9eGMrcHdipWwmpaOz
         gNyg==
X-Gm-Message-State: AOJu0YzB9zMtEwskDHyuCkEgSzH2QrbJ7+TjhJx/helUzIA64dq71Vol
	n8JcqxEw7DixGAWED7N4Ft5nvsNEgOyD7ByKUhwIGXcrOKUyO9dhkDa5BsQjAw==
X-Gm-Gg: AZuq6aKtQ82qb/Sv4gm/Thq30vDGmkPObz3SbN6DH14E3igMoxPY8g6Azatqw223JZO
	m/NGVb90N8UbOHOSROycd5uajeYABRjWbmnjNh6pqaUfgOa1WyjnHKjR1uEcZuqP70bCx0Ff0P6
	9O6N9Z5pl2X13q5Q4l+EV/XsjeMuXTQyljQITdUfQcMAnrHsZZ80N2GvvGbx1FHhXzaCFLiaDuc
	omxlUT9mh7TxBmE86oWvWbxLPjw9VUx2u8FwJ3hdSzzKTCAQUZ+8xWYHGFuI0qI8tGba50Xv6X1
	0SXhUFjzv/juI3T7Ke+Mkv16RWiq7wXMkyMW96RtclquesqnyDuYQHG2tjvOZZL5q6+ccEO5Zon
	CT8/rbF12Yge0xHNFiPchWQtf4IuTFpR3nXx82fbVALHA1ju/S1tekVVFbWSh8gQSIS0Sekk+c/
	O8BBD7nNAqEK/tecIoJSI=
X-Received: by 2002:a05:600c:1381:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-48069c35120mr110598945e9.16.1769668290823;
        Wed, 28 Jan 2026 22:31:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3d1sm110750835e9.9.2026.01.28.22.31.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:31:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/5] python3-twitter: mark CVE-2012-5825 patched
Date: Thu, 29 Jan 2026 07:31:25 +0100
Message-ID: <20260129063129.223926-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123978

Details: https://nvd.nist.gov/vuln/detail/CVE-2012-5825

The Debian bugtracker[1] indicated that the issue is tracked by
upstream in github[2] (with a difference CVE ID, but same issue),
where the vulnerability was confirmed. Later in the same github issue
the solution is confirmed: the project switched to use the requests
library, which doesn't suffer from this vulnerability.

Due to this mark the CVE as patched.

[1]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=692444
[2]: https://github.com/tweepy/tweepy/issues/279

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3ee544e7591b36a49550a263a0ec4d64b5e490e8)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
index 247b4e5840..0b174684a9 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
@@ -16,3 +16,6 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-requests \
     ${PYTHON_PN}-six \
 "
+
+# fixed-version: The vulnerability has been fixed since v3.1.0
+CVE_CHECK_IGNORE += "CVE-2012-5825"

