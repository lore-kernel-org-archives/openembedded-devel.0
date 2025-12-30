Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD09EE0213
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65112.1767104946418245884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0cF1e+Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47796a837c7so64564295e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104945; x=1767709745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvrJOUioeHbyJUpVpE2aS4iSGODrSg0Hjo+coj70/hI=;
        b=O0cF1e+YkzDXvpEhIa9WMVfTjxMd7crEEygd1xWKXwCCqaFZp+ExiYtMXbXH9jo207
         IyjOXD81S0T/0V8g8+0ptDOPRjFF6GJGZsvmEP5h5Xl9BFFQ4VVBoDItwCrbgUjHrljG
         1Gv7U3e1FghiYFbOWroIG1mKbEL9tfk8kKh2MMtuVtl3gx9PfCEAOKCSd8ikOTlbEDP0
         mObfE3Tkgf3dGm9s6lgpA/szLrsFzYiCRsIzdDH2k+dbc0x20YwiIeDgH78qRwa2hpSp
         o+4wFuKq/jqwMk8kdbEEtuAC+7UpreDNlpxXGHZbuIabrARZJO9umu1O0cHXP98hQWfo
         TDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104945; x=1767709745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xvrJOUioeHbyJUpVpE2aS4iSGODrSg0Hjo+coj70/hI=;
        b=tuNEpNjFQWm/H9FJW9zvkAe1ZmDJetI8nCsC0dCpqxp3P7xOLAYgQ5q7/rkTOYT4Pn
         5E6p91MvNdnhGuZSOAAdc4Cm5efXfu325f1jc2BkP/1r2hMscyTdJYjkUV2Z8Djr1FEb
         khJfftM7qgTtIiJYta1eBhTvuHYDlXpMMErqV1CIlp0iFwHQAZQlbWk6/8tTvRL6sfTg
         YxXvlyCrHeJ0+Wja95FQvfiVxBkklOQWwfZ0uOxQQVdlg5V/6th44qGaWDQTFWCqcDvz
         5JJhLsSRI0r5fC8BH8lOTgu6R2B1m+LaJwZ37qD7tcNRC8KhD2V7ddgSMQ7uYfwtNgj0
         eHUw==
X-Gm-Message-State: AOJu0YyPDaXexjnnulH+Bimy+878YHRInCrdq4t5Yh75+3UWyDg21N30
	8slQ41GSOMDKRqnqEd2beVFGNtuK0kH5SUXvfQNfblRUB+qhlCOyHGQZOqrsug==
X-Gm-Gg: AY/fxX5Cyfcxlzc63UYNvGYfv9Ha30WpqGSimIZqKWXTK1kT8nLQmiiMRrvK9gUTqRJ
	gO1Lm4BE9XhHFXLFi2dkUcjvZM1Blw4FxV+fzHUYfdKEiKZUaZOJyy+AiFs+HfwG046YQHvw7m2
	K/b0tgy1eK9TNn5C9I1z1dDUftLEpQ4VCXHA3OmO2LWByG9bnXzNq6BUJCwHxYYJrU05VJyDCOV
	7wRFOdn5PRUbkyplYtygI/t5H0EzZRIbduY0L5xiYoBqARlGjhIY8dgnQ1pPO2ia8fWx64FlfIn
	s7dhXEv+HZrCM3R9YlpFbdMtVhWh7iO4qdDIEQo4BkfUfQxK8hB9N86bZcdJcBpCKr9DjTogBaq
	HIxeBV5u//by9FFI/yaTbKHS1J//t0wcnClCxgdn97aQRvJeKerdBK+rz81GwpDQqCuVJzyX9Xs
	qAvWYWH/A9
X-Google-Smtp-Source: AGHT+IFPCm+Vsp6IVrSd4o1l9nwCRq+y1wdmxO79gzluwJZdd0++L48TyUCQjjNpHfeYEirh90BfeA==
X-Received: by 2002:a05:600c:45c5:b0:47d:4fbe:e6d2 with SMTP id 5b1f17b1804b1-47d4fbee7b1mr140181025e9.12.1767104944692;
        Tue, 30 Dec 2025 06:29:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/10] python3-twisted: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:28:55 +0100
Message-ID: <20251230142902.730667-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230142902.730667-1-skandigraun@gmail.com>
References: <20251230142902.730667-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123019

The related CVEs are tracked with twisted:twisted CPE, so the
default python:twisted CPE doesn't match any entries.

See CVE db query:
sqlite> select * from products where PRODUCT = 'twisted';
CVE-2014-7143|twisted|twisted|14.0.0|=||
CVE-2016-1000111|twisted|twisted|||16.3.1|<
CVE-2019-12387|twisted|twisted|||19.2.1|<
CVE-2019-12855|twisted|twisted|||19.2.1|<=
CVE-2020-10108|twisted|twisted|||19.10.0|<=
CVE-2020-10109|twisted|twisted|||19.10.0|<=
CVE-2022-21712|twisted|twisted|11.1.0|>=|22.1.0|<
CVE-2022-21716|twisted|twisted|21.7.0|>=|22.2.0|<
CVE-2022-24801|twisted|twisted|||22.4.0|<
CVE-2022-39348|twisted|twisted|0.9.4|>=|22.10.0|<
CVE-2023-46137|twisted|twisted|||22.8.0|<=
CVE-2024-41810|twisted|twisted|||24.3.0|<=

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
index 4685829ee3..8ce5740e0b 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5316a448a61a38d722c291f78d915d11"
 
 SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
 
+CVE_PRODUCT = "twisted"
+
 inherit pypi python_hatchling
 
 PACKAGES =+ "\

