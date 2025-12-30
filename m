Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A51EE0205
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65114.1767104950963368049
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZxXfzPv7;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477563e28a3so60951985e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104949; x=1767709749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hH58AbLLiYwm3ieIt+far0IxFBANPqODjodq8RULC/s=;
        b=ZxXfzPv7V4IyZSXPl+TH9g+MwY/EjfzpUJx9xCYq+KEw+Y3f6+BnPqfUpfiysexjpR
         nlTGR82v2c9iBF8tNw5IHT0YpVye8FWrhmSD8Aq+2qpiqwu3M3KnQLiuD41qdZ6xfy5Q
         d/oZu1kqoBSrJXQfxbhFi5vQWCSaxModYEaDeFgeMmLEZqOyjOPro+1S8rbDo3t/kZtZ
         ExRb2pfI1H38zCnHSOWhkOOx8r+Mrbtim8QwyC35rdpHcLmAcy1lw9uLwXVFK0Q1F4QP
         qKT5lHO/Y1u7/QXGLytG9SkN8kEThQLa6Yp+4rd2FPT2BiqcT4PeXOCioGotehHcZy2E
         Ekag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104949; x=1767709749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hH58AbLLiYwm3ieIt+far0IxFBANPqODjodq8RULC/s=;
        b=vFuubTJmuXfjCH3mJ1DRNkaMRAsjtWr+pPYov/Y7V33PhIsaIHhtYBYN7rzFobqyEP
         y69/qrxuqTjZ66bJjyjm2Pvn7fWd8cCW49w6ijdXRkwaA8stGdqE10MQk9oIP44/D22x
         X7EIxlz6KvFkFkjkkn4PIUl8+nHJ4DkZjS8p2XS11bf9ICbj6MnVU9HtNjRmKEnWacV7
         BfckXSnBOrf5JunHI5eSOjg6eQkSuS6hPWG+E72S+IkgPYvpUvW1ZfNBN7xQMm8tUD14
         zkW44Tr6/xYGonPQr+B1qSEZ2m1dVdbgB07oo30nhyknkifi3xA4kM6lQcPHpkr8wqXc
         WTBw==
X-Gm-Message-State: AOJu0Yypyh/bDTEkTnOHNDZMQsLtZnROLbPwhH1iTdG8dTFAWaFnForw
	pJz8LeHGl8Z/Xwj5JMoikdkvfCCxrZ5xUy9AMyDqlfeXpIg6+WIF//IqW4xReA==
X-Gm-Gg: AY/fxX70V4HLpdQ5MlZ0it+qLh4aIUt3/HU78RfmSngtmD1cE63dVJRP8TkLhmJ7QH6
	3VMMCE9l6nLvnUGyuvFglaSPB+mZSy7J40tiN9OzlpL/l1MjxMAfbi0I1BhfR1Xei69zA/Em74G
	yDaAtAXtBOKt74wx5WAZlYRu1wp+7pM3RK329XWKEbo78mYvcZlXIH33TjJyUmVVSI5tyvfElak
	l2R4UGP0/Lag2ukP6bGjTmzfIYw7ffo84Iip9Iq4H3EoOoeDolix/2E6A003kK822NosL9uxYj4
	/jRcLWKMQU2gVzf4j4NWUxDhS0n+xE/qHaSPj/0MoScK3EoLCKRgoEFR43bslM+YYYyuqZPwSSI
	XhzysI4WfuUhktXyv5QF2wS69iu0IOAMMmiaowBIrccqidUqegoaNAta6Di8n55uIXWM1ODGW8l
	ENDffdh+uU
X-Google-Smtp-Source: AGHT+IFNXZIUoMwp9sl4Ory1xhejAOrCS04sPWPPVdM1Rf8Is16CUVSMXHgzt6MPSSpkdah6eSLrpw==
X-Received: by 2002:a05:600c:5489:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47d18bd5651mr404960095e9.11.1767104949308;
        Tue, 30 Dec 2025 06:29:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/10] python3-pyjwt: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:29:01 +0100
Message-ID: <20251230142902.730667-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230142902.730667-1-skandigraun@gmail.com>
References: <20251230142902.730667-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123025

The relevant CVEs are tracked using pyjwt_project:pyjwt CPE, so the
defauly python:pyjwt CPE doesn't match them.

See CVE db query:
sqlite> select * from products where PRODUCT like '%pyjwt%';
CVE-2017-11424|pyjwt_project|pyjwt|||1.5.0|<=
CVE-2022-29217|pyjwt_project|pyjwt|1.5.0|>=|2.4.0|<
CVE-2024-53861|pyjwt_project|pyjwt|2.10.0|=||
CVE-2025-45768|pyjwt_project|pyjwt|2.10.1|=||

Set the CVE_PRODUCT so it matches relevant CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
index d23347878e..37675f1b63 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 SRC_URI[sha256sum] = "3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953"
 
 PYPI_PACKAGE = "pyjwt"
+CVE_PRODUCT = "pyjwt"
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "\

