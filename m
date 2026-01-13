Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF519D0C849
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:34:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55986.1768300468633553395
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Bs6gNYy4;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so50925475e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768300467; x=1768905267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxXhlaRa9GBt6fGnL1m7r6p+BALu/flnSQh0Thrmcy4=;
        b=Bs6gNYy4kuF5YXrxzcvNuGoRcS0HW3q+h/ixFYj1h+ZOkmPYO46A/OHetGMCD1y+nG
         hJt8mYPMn7OYVhSLfg/5b9hnPxmmRnzp/M9IAbCWO/oAD2Eujte5x65kHVYDX5pPO0cd
         40jOJ83GI7ym6TxsbPB/1QBZk2bAqDUb8igSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300467; x=1768905267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxXhlaRa9GBt6fGnL1m7r6p+BALu/flnSQh0Thrmcy4=;
        b=N8dbiqdT33sSCSPJgYoJXHIdAKUJsfD1q9X+rfafFHDXBFHJqfdwJIppOmoKVVOOZ/
         qRmwv9nJbQ276WylIS33LkRyif17TTSf7Ot9TErZFLqHwj7+3jJFQi1CLjHcypJTrsCm
         5PCP+fqj3nq2u8YyVJ1CCbOaMKqS+6LkEzZ+pIEJJACTJftb0jWF2hwC/HKONOWn8CYt
         rLiuFRewJoI4MQCq71HVGotnH7xals+dH/W6LeO0iA2AlunfwrxS3ZMoP7Eh4iVXJNri
         VtY8OFAu99Q8XU4/PQqXNXMA4g7Kcb0vyToZHFGAku3wVhQVSYn/Y1+Q8mDUmAL+LzQv
         zZ7g==
X-Gm-Message-State: AOJu0YyAR/+MFb7obq58F7c+d1oQzsQaC9OcLhboPTcTyWZV2myXNrys
	uzV9kZEXysvEgoTLGJqRF60dKJRpzJx4qZ9NKVkHFwPP31+R11ykzAzmC6+Tl+A1+4zkBONxjor
	eXlN4
X-Gm-Gg: AY/fxX4qlSMVBjuCxepKTQnqwTxwPgMF7JBUYlOnDQIq+m+SRnUvHbYC6dWgBea2ely
	df8+E00pxWIUR4Bx5WXPKdW9uBeSwKwdwx7Mz3Q7nFnOR1jYRjis4BURK1lg8nAbLHbBcMJQbfm
	w+Bm96HMAfJy86kxpkxpAmo6S5i4TPzxvDA3N/asokv9pYNeS2M+fuf2Vrlg2AUieDlORFJtFW3
	lE40oFHM8Mc2cRt5WeJ9eiUqvjf9eUL1QvKptPu1p1qLWsMCzVdYpdlwi2aSBg58m5PZw+OaS4v
	4WdjUJO8rMtJSGPawMKrxdXBXgIjkQLdgvq5iItHogX73tUSp8c8AZNtpTcFo3NIMF91V5zgKlJ
	5h225QfqLX1GhpxKjQ41h8OK16jZVwLeQotLQ+AaQHR8XQn+8z2vtfWgIQhsngnC8JWMr8TJZgU
	KDjeg/fIwTBx329F5Ce3CV6h+sCk/mEWQ1z4E=
X-Google-Smtp-Source: AGHT+IH04O7UYZVlTvVYXclhrkk7TdtqrkDC6r9jvZ+ljo4nnqKuKDwRBfe2D1+1U5lCBBvtUr1hCw==
X-Received: by 2002:a05:600c:4ed4:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d84b41b53mr253095665e9.28.1768300466543;
        Tue, 13 Jan 2026 02:34:26 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa84sm43341971f8f.2.2026.01.13.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:34:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-huey: Upgrade 2.5.5 -> 2.6.0
Date: Tue, 13 Jan 2026 12:34:20 +0200
Message-ID: <20260113103421.3568307-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113103421.3568307-1-leon.anavi@konsulko.com>
References: <20260113103421.3568307-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123432

Upgrade to release 2.6.0:

- "Modernize" build system to use pyproject.toml and github actions.

Fixes:
WARNING: python3-huey-2.6.0-r0 do_check_backend: QA Issue: inherits
setuptools3 but has pyproject.toml with setuptools.build_meta, use
the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_2.5.5.bb => python3-huey_2.6.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.5.5.bb => python3-huey_2.6.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.5.5.bb b/meta-python/recipes-devtools/python/python3-huey_2.6.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.6.0.bb
index d80ece1fc7..2821262153 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "a39010628a9a1a9e91462f9bf33dc243b006a9f21193026ea47ae18949a12581"
+SRC_URI[sha256sum] = "8d11f8688999d65266af1425b831f6e3773e99415027177b8734b0ffd5e251f6"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
@@ -14,5 +14,5 @@ RDEPENDS:${PN} += " \
 	python3-json \
 "
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


