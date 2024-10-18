Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8226D3E1AE
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.29951.1729278798631459782
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i232h1fM;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e33c65d104so22397547b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278797; x=1729883597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ/QPBikDnwg+4jR4J6JQ1T6F1VAZI9Gaq3dogNkyUo=;
        b=i232h1fMwHoHXkr4cC7nYsyKYyvNDJSxGAs82mRrpj3FpfDC+sEQw2FtKVj3Go8Y6u
         j/zu+RjOYSbmNAVbE76Kh7rd9OvfsabuTbGXSoig62ROrs6xEcyV13j6y+9BZfuSPwU9
         9kT6UnETR9+4wYt71M9ZwNCcgXIlMZWVB0xzOq22GgCm+HTrJJvllNb4NYculWf/nlRi
         881ApIiE09Wu07QxuBuvIJsMnOSqXcWX110uC6ZF5ree3Ie96csMLNPYQ3NoKlyYXeEp
         R/ArtrqCqHpZIls2kIg8bd+7MwHX5KTUsBlA9dBfXfopVmhTxIh15pn6av8HSAZuY0Xh
         GZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278797; x=1729883597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ/QPBikDnwg+4jR4J6JQ1T6F1VAZI9Gaq3dogNkyUo=;
        b=h7l0bEzfIlKlIvd+0krjimc76HY/kUSaBwJmrRvkh96NxYHiOcrVp5LNI9dIjp13BA
         OiutVWMo1CkJAPtxVRw0zYYJejQm0AURcei1h6XM6zskXFVEXErUG+UpS9QygfMeH8by
         Rwxm68H0besxJq9JSMCsTiwBNxAgcdVwnI/W01Iy9KCo3jJs2xub+/0gSQndkJ+lZ8JA
         +uZqy3WUFKb+jSj/lLdXX/8n+alhVqA1XQ2BQgkzI4v8VCOfQRn1Nb0XpEjyOxZNA+ee
         +c132UdVNAx1mMpwLWda2pmykcJSWcP90aoe1qy6P5OcqVyuHapwO2oqU0JiXfTj24za
         sBSw==
X-Gm-Message-State: AOJu0YxarI5HkJQ9ZGBaAehBbis83GTKVb4026Q2OjHgfg6gv7B6S4vu
	FGxYONcxZRgyAGpBiLLMUuxp6c3ZeQCSDmBZABe6YgB00k/tVBMeNeMxlg==
X-Google-Smtp-Source: AGHT+IFEZ/ZMSFOlkEViPTZbnz4BYsaUc3cVzSdLiXe+1JtjbemfcEfjXUMGHSGYlffv0OwckasYKA==
X-Received: by 2002:a05:690c:dc3:b0:6e3:8562:fc0 with SMTP id 00721157ae682-6e5bf52739amr38512987b3.0.1729278797267;
        Fri, 18 Oct 2024 12:13:17 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:17 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 10/68] python3-appdirs: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:57 -0400
Message-ID: <20241018191101.25184-11-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112997

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
index ad07b3b08..eab39312a 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -6,7 +6,6 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
-SRC_URI[md5sum] = "d6bca12613174185dd9abc8a29f4f012"
 SRC_URI[sha256sum] = "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41"
 
 inherit pypi setuptools3 ptest
-- 
2.43.0


