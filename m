Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08D6C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:34:23 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.13076.1741181656881274980
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RPJUJ4hn;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390d98ae34dso5389999f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741181655; x=1741786455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9qH2DywpvbBa4zk7v2QJ4WXaGYHlp6Pq6NLSIXfDTQ=;
        b=RPJUJ4hnSDqjkLCpSLKOWfwbSQbkMe3AkntewvqyBMvvCB1yxftBlRksQBl+AjtFgV
         eGxJi2L3HPEYtzr2whFjqyuFgzfKaP2MCEMEZqTz1z7eMzzlpBkgfMjI1w9rz9RKgPmh
         oTG+kmo5n4S7Ts+vU0w7JWJeTjE4AVwC6habk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181655; x=1741786455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9qH2DywpvbBa4zk7v2QJ4WXaGYHlp6Pq6NLSIXfDTQ=;
        b=DylX0z5Y7h1oJ6PTmz6YShVwE0u3ed7dwXKXHeInjw6XDWqB7pbgRULKIGhy20NrUR
         cGDcRxCbq3m80Y5r2rrRwpOXwrVpn52EkD50p+FCWGq6Itn7ZGoHJzZtdw/Ualj457zc
         SpwQIOEMyhwHU87N9RMiKODN7J/Ww0FBPlS87uz7KN6wlvt8sGfhEekdyBg5CqANfz9T
         NhztBpArv+BG/GUGuc30U87bHEV9Qj4O7QX3itLBn7DO5XkqAyi3y3esA22ZtPA3lpO8
         S9pjJaKgcUfFJGlDbcoX38MVJOrqFXaJmgG7Kg8XC84vQ1KkDlsfgGeNfrME1ZqvUVgK
         hUFA==
X-Gm-Message-State: AOJu0YzCnNgAyB1dWmcCtPgFsZdsK0mgxRhC5n9ZZT748upq9qpZRmht
	e0muqMZU/IUwWfgqAt9x0vA/KoOZFtnJ2caFC8rQxnM6Mkpn6FQ7Zq0LB6wT2hiXDYlH6uWP0hu
	K
X-Gm-Gg: ASbGnctn+0PhupmnEvIFyRT0iFBocTf46TBKL4DT99uXCup0iiNE+j62Sf8r+b8Z+sS
	2rtVOFGstWYv3kEvWBNSzwT3AFhi8sK+8OOL8BegAt+o2ZOhbz8nP3JHgra8VOqck2cUkKF3Tzq
	WwUOir0wsbjVJNSauJ88BVSNdRNkgBRFhu43eMnCqeC1fUMUQR/nSnnTvnQucNwxmoYkP6ZJTuP
	mNWAT4ZJUU+8D1GX4ZuTnQPJ9Kfa+vAy5uXSERTJ9HGB/WQaJQdL4N50tD45XFg1hmwTRa95ZVy
	CTkR2ldI/XwQVOPGhONRut6NISiqhQiztPSCk36Sf6AtKyVPmQAwtuwMkI4=
X-Google-Smtp-Source: AGHT+IHAPGdiBAG5sQAdS9shpyRdf0BIF8AO629EnBgqc9sLog+0wwMf+DROj7gP58yP6vC11E6Vpw==
X-Received: by 2002:a5d:5f50:0:b0:390:f4c7:ea20 with SMTP id ffacd0b85a97d-3911f756fa6mr2871750f8f.24.1741181655060;
        Wed, 05 Mar 2025 05:34:15 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485df5asm21266361f8f.96.2025.03.05.05.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:34:14 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-bitstruct: Upgrade 8.19.0 -> 8.20.0
Date: Wed,  5 Mar 2025 15:34:09 +0200
Message-Id: <20250305133412.3463021-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305133412.3463021-1-leon.anavi@konsulko.com>
References: <20250305133412.3463021-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 13:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115751

Upgrade to release 8.20.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-bitstruct_8.19.0.bb => python3-bitstruct_8.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.19.0.bb => python3-bitstruct_8.20.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.20.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.20.0.bb
index bdf77c7d01..f2a291e3bc 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.20.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "d75ba9dded85c17e885a209a00eb8e248ee40762149f2f2a79360ca857467dac"
+SRC_URI[sha256sum] = "f6b16a93097313f2a6c146640c93e5f988a39c33364f8c20a4286ac1c5ed5dae"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


