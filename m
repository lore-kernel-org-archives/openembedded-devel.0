Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9196EF30947
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:07:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41725.1772708839682940976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WK/2aC8y;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48069a48629so83068515e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772708838; x=1773313638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZltBdkvp4av8GZx0Ur4DBd5mMdQ+QptQoEhmCHwU9e0=;
        b=WK/2aC8yvOLqfhY71tvRCAqxAW/oMEGNe3fj8RfKouqIrxHML1P9KwZ8x9swJBKumZ
         hDKVY5KDunYZkGjkfXfleLNf1fmsXqJwC5MOAPgAIAuNlnRNwuiurETgp8Vab0CWCvB4
         q2PurM9NKZ+odz4z8uV3ZbrtKFSfNiGy4AmPaEkWptzLkb3hJD63XsFPQAtpclh3CFP8
         AdQ3utYEXFkMjVNDtMVafxlqMvLNi8fPxUiqkMEz15yEmvTMDUMP4OhK3abrYXvf/Q83
         7gp9ZjHZi/cypKVN5UvlZ/cbkGONvmzmB+y/QTNB7dwpxhxwSqjnSX3Ic4KMh71N3kCv
         FaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708838; x=1773313638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZltBdkvp4av8GZx0Ur4DBd5mMdQ+QptQoEhmCHwU9e0=;
        b=fm51oNtqXSI2Z6sg3xhF7tjgGE1Lwm2jd1HOiqSJWeHm6rt3cngIfrclavM92SJw2N
         OhZwXIe51IBseNGPRXIPM7vfBtrOeFoWFE/NBNqIRR2nRFTdKwnvYwsM75+ICRoXjnUm
         TSdgYFCiBLbjAtLZGZLriLhwekLlMQ1ZjmntuljIw8aVbswS1ZOIO34BMc/rAD01r5m/
         BdsGeYqlRLKuiDnU5CRKmM1OeLqwNjbiZrLM30oMv7olxRnA7vUN24JgUAElzN5yq5Kb
         c41zcu6fMZlJ8jL/FMcDar/8jHDLYtaKslW6M+fLQNqn4F31iSBsEi32eQR0Xxg14l4t
         ErUg==
X-Gm-Message-State: AOJu0YzdMzY+joZpJ6UnZXrhy28iswJ9m4WBOGbtjqq4JzV6Xq9Lljib
	MYJm4nKeWG38TgpIOCB9tKxALo4mKJsXg6DfV6G9CxnfOuA6dcYs4diS2LOrmw==
X-Gm-Gg: ATEYQzxJRtJlzxJYDtpcXVyt2l++9hXEvJddSraezDxpIoapupbSTRkr3gF+5zd2n1i
	NwB5fI4AfxsFMhmFcjrBdsGZFS3avYVxYxDuKR12CHKWtmB9wTFU0cBg9dNyLZQ1pxfqLAx0zcT
	iC3Ji93LlJhTdQZFx8hvlg3YxcQ+wkJmQJjXwZZz/M8SPUyc0haw4QMDIn7lFfxCrwfNM8bUkrJ
	XPZvES5yf+DEYYC1gv3z0tNEfWdkvzm94mNcnIIgvnMLivGctcrTS4zbTBsRU6UGt3xyYctg4Kl
	59mZtYn6wvM/jj2upncU8ztdQ4vDNIjylCEzAjNUCJ2Ip6ZB15KabSVHcnqMeJVFf75uqsMOYhj
	9nb/7E/LbsGcSMSPZwoAXlQ4H08u3ujt6kqzBGzUBpafZ045suBkoANdfTrJJNI41DrPo7IfRpn
	WsH7Mu/5M41gdexnQn6ULl
X-Received: by 2002:a05:600c:81c8:b0:483:7eea:b185 with SMTP id 5b1f17b1804b1-48519880904mr97537265e9.16.1772708837863;
        Thu, 05 Mar 2026 03:07:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851faeaec0sm32269505e9.11.2026.03.05.03.07.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:07:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 6/7] gimp: ignore CVE-2026-2047
Date: Thu,  5 Mar 2026 12:07:12 +0100
Message-ID: <20260305110713.2893128-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305110713.2893128-1-skandigraun@gmail.com>
References: <20260305110713.2893128-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124871

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-2047

The vulnerability exists in ICNS importer, which was first introduced in
version 3.0 [1], and the code is not present in the recipe version.

Due to this, ignore this CVE.

[1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/00232e17875d4676a2c797a429db23b1a9815db8

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index d38160a864..8b3dd4aa5f 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -86,3 +86,4 @@ CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mand
 CVE_STATUS[CVE-2025-48796] = "cpe-incorrect: The current version (2.10.38) is not affected."
 CVE_STATUS[CVE-2025-14423] = "cpe-incorrect: The vulnerability was introduced in v3.0"
 CVE_STATUS[CVE-2025-14424] = "cpe-incorrect: The vulnerability was introduced in v3.0"
+CVE_STATUS[CVE-2025-2047] = "cpe-incorrect: The vulnerability was introduced in v3.0"

