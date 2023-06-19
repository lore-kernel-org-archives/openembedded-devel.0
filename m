Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFB4C0015E
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.7385.1687180978265849045
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=aa7DYUOj;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-311367a3e12so2182711f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180977; x=1689772977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKx455cwXVXBlS5JJWoHeUYliE00HISKGSK6rVBGNaE=;
        b=aa7DYUOjdMByjvY3y75zt31+pa/2xet4CEy0KDS4pkvx0d6Aw8Lt41VzsqtdC9mbej
         81fWnKlyzWVggXbN+CEm7L53SJBn6SQd9nH/WbWQ2qvQpzPySWBqOinTtWZU6D0u//kU
         20OEvRmAi0luQKImfCGcVchBedUbN/WatTk7xxhIuR94+QeCUoCfoSOZmQdGQQKieqxj
         HJ9YYRJG5LhX685twLhzGoYJ+413O4+oPEysDtMsEQpVLg1o8qrPNTllEX/EoYb6KqDe
         p9U1R7jHIApOSpOvtGsekRbU1jrT9BvybyTQKqNKb71r7HuEmXIKxgnKfadjkfuTojFI
         k4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180977; x=1689772977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKx455cwXVXBlS5JJWoHeUYliE00HISKGSK6rVBGNaE=;
        b=N4edw1wLXzkQgsud3VX+AxzO2lYfvUVW6vo9kaYl08WCGS9mhkFtz5+/xR1MGW+1ri
         Q3oH0QGOXs7V8bUVTr82k+SntXegFhqzSzSWn+baigrNef1UBrSSLwDQuriYr8gJUnRR
         I3RfCzTdyNau+23hZhSgFMN6J0gL5s4mZMKq3OFN9aa8O4hltwgIDGXu/EDBYSeZ6dqc
         7wUNIRws0EC59kNneAMce3paQ/IE6a84gHNWKD299pd4uMaGEmA/2I5nFAsTnB7WcXyi
         R4J5zmSYhlWETCI8xwbnT8B5d5N+LQqzbxhqI8muR1i0jJ6BZBQJwTcAgfcF2a+tKBJ5
         sxPQ==
X-Gm-Message-State: AC+VfDwvskQ53d0gAthdHkekLN2GO/zdpVOGG+Y8lErqeK5BF7wu1gIh
	ctfaH01LDOhI7Dio3oRE3mqsyjGuAU0cnjKjWow=
X-Google-Smtp-Source: ACHHUZ6txvHtb32GNtoBYsbOy2m9yc35tNBMcylM8UHbeXMccaG4qX70gKuu5cqijwkzkG4OrSG49A==
X-Received: by 2002:adf:dcc3:0:b0:309:54b6:33b0 with SMTP id x3-20020adfdcc3000000b0030954b633b0mr8762737wrm.44.1687180976821;
        Mon, 19 Jun 2023 06:22:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 35/54] python3-attrdict3: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:55 +0200
Message-Id: <20230619132214.213417-36-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103419

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python3-attrdict3/python3-attrdict3_2.0.2.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb b/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb
index cb44ea71a..ee099c7ac 100644
--- a/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb
+++ b/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "004c171ca1120cc1755701db99d7fa4944afb1e68950434efdaa542513
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS:${PN} += "python3-six"
-- 
2.39.2


