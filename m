Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFBBD58D49
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 13:32:14 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.18533.1732541533712364713
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 05:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kUo/tHji;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3824a8a5c56so2977479f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 05:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732541532; x=1733146332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcnPZRq4a9Sn6OXGP5D2/yoJphqgsFSfNjDTWZy2YQg=;
        b=kUo/tHjileEvagsTZOCpiDWTRvrSrsrv5CX1UDCB9/X7vXpH7uW0U06g/N37KLSw8E
         +PuwYFyrv1TKrF/Kvjkd766VaIhGSAqpRtwOrx98W1KS84zo9lIJiOpoqH9nUKjzdueZ
         yv5EgnhfRmR1fEh6zKOomRCsrSKEbC7AfQeLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541532; x=1733146332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcnPZRq4a9Sn6OXGP5D2/yoJphqgsFSfNjDTWZy2YQg=;
        b=QKHvV8U2an4KOWMdnHjmx4r1Qnnolxck3VFxJbNIaJoQxinpGbaQkflAl+mf0Rs7Qr
         VcFjoxoMJ4a4oQningCR54kEdo8QSrSYpYc0NJ7IZfR4J6bQY7NI8diYMYZy8sOGDafx
         0oeKLSh5ngGttnqbt+jTaKrjpNzlrjnWfp5Blstly/54joPaT+n2w7e/scBxJptnaSq3
         tQBxO9XfDeCPf4OVeDGVzES/W7BjhfWWfd1ITlS2KSyl9HPdCVdmrgNM7LBubbvV/PeV
         wO0GUCgxNXelaLo/UGtSxSOkhvz1iVIfIliac8t31JIlbppYXrL22Upst/7ABiwwVFJC
         yLQA==
X-Gm-Message-State: AOJu0Yy5CjnsLo6OFOQjI8ylS1anObRljElag29KIcZ3E2XWWK68jh3A
	9vsggmhv3lFD/8am/XZpssQaP6R5u8Ww8SPU+B+9QKn+M527C0rB6I+sXYW+3XDxzRY+jd0IIqp
	V
X-Gm-Gg: ASbGncvQ2/wzpMNhh2i4i7zp8I5SqW+YE4CO9rpwsotZmzSHhdTehmNO8pECkJnA3tU
	mc2XwHVxtqsvemEw0J5jg6O39Q1xmiey/OlakhQvsEa0EUmRNpDs0Pg0DT2j1oD8K6madoBRZTK
	ct1QSC2g0wXDlDAIHvfXQ0p50/FU0mFcZrvq8s1SHLr6QuYW3GHyokTxgiHpeeugTM818PUpYOX
	3xOWzSiX+9XIxexOasJWkBH1rNjwfK3m4+z/wv97qhOr4jvBAGnfH/xe1dzge5h
X-Google-Smtp-Source: AGHT+IELwvIVtxXaKiqyuYaRxN5wKPpTH1lzXej9To7T3I9ACyJQZSvL9l7Byu1W8/mkAtAqk9oZxg==
X-Received: by 2002:a05:6000:188f:b0:37d:4fe9:b6a4 with SMTP id ffacd0b85a97d-38260be3e1fmr8473832f8f.50.1732541531859;
        Mon, 25 Nov 2024 05:32:11 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad60e5sm10741023f8f.3.2024.11.25.05.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 05:32:11 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-cloudpickle: Upgrade 3.0.0 -> 3.1.0
Date: Mon, 25 Nov 2024 15:32:02 +0200
Message-Id: <20241125133204.31594-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125133204.31594-1-leon.anavi@konsulko.com>
References: <20241125133204.31594-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 13:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114035

Upgrade to release 3.1.0:

- Some improvements to make cloudpickle more deterministic when
  pickling dynamic functions and classes, in particular with
  CPython 3.13
- Fix a problem with the joint usage of cloudpickle's _whichmodule
  and multiprocessing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-cloudpickle_3.0.0.bb => python3-cloudpickle_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cloudpickle_3.0.0.bb => python3-cloudpickle_3.1.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cloudpickle_3.1.0.bb
index fce5a5b408..7e378e7abb 100644
--- a/meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.0.bb
@@ -14,5 +14,5 @@ inherit pypi python_flit_core
 
 SRC_URI += "https://raw.githubusercontent.com/cloudpipe/cloudpickle/v${PV}/LICENSE;downloadfilename=LICENSE.cloudpickle;name=license"
 
-SRC_URI[sha256sum] = "996d9a482c6fb4f33c1a35335cf8afd065d2a56e973270364840712d9131a882"
+SRC_URI[sha256sum] = "81a929b6e3c7335c863c771d673d105f02efdb89dfaba0c90495d1c64796601b"
 SRC_URI[license.sha256sum] = "3029ea34173e9fdc233ad315dc6b100bd1ea71f529b1c1af97664a272fdc55f5"
-- 
2.39.5


