Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF81C2BA1A
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:20:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.19294.1718799625885772241
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 05:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=g7Let4wm;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4217a96de38so47134185e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718799624; x=1719404424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbUNld7GV/e2ymhcjdnJEvtguJJHmtiHqWqeXgjqyPo=;
        b=g7Let4wmOoL7p6Q2At8yC5UGymSLpYNMnxOofiTIa91ges1brmy6JZFB4SEbYz+8IW
         Q+MlkKO5lTxaOc8vuTaWH/WKgLuvBe5wW321nAhrj5ibw7i2UKRi/Ym6kzOFwPJ2NhW6
         VI5dFajVx7lay8HcIDivXuQ5KhN+T/f9fH8hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718799624; x=1719404424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbUNld7GV/e2ymhcjdnJEvtguJJHmtiHqWqeXgjqyPo=;
        b=JXd+MljbJ5PjcJiCMZpj4hMlb0YfH98SenaD1LUIiWJIrUv/+9CRL63jhpj5KMYgsJ
         6acwC46IHiOVgmsEgweVgfIcWW04frwtuty2fyg/m1Z+2ouT4IlxqCFUV8rosSDEhJeV
         oceGPgVa+s4vlBhcBTcvmjnVDHOJuEug0Lq2bGCN8cBLKVYyu3mjNb5PFepf31MDU+Vy
         VpCPHVQZ0G1a+mTbszr8OBuP4ejNak/nw4JaTM8v34p/MD+JngEZkUGJMHuNphvIz6Fg
         Q8IwpNF18Qaed15YqTwuunI8LIC3wVPDvl61B46cqlseUKDNabD9Ea/62phc31t//0PL
         +QIQ==
X-Gm-Message-State: AOJu0YxBMuEdYQv7raIZQnDCbZi/yLZpnp+Dchtd1vQUGrF09rJ+TgO5
	ny2WVtvte/hLWHz7wdzM69ysrn1JJ2UJ9TdBpKAnKGJXx/NwdNioe+s1QviVQ4196kX6NMPygH4
	u
X-Google-Smtp-Source: AGHT+IHInKAvyRjTUCCHeRhOa5C+WI8laitrcuOb8axYD8rngr3ESUkqepTt+Piy9DoByJGFmrn0+Q==
X-Received: by 2002:a05:600c:484f:b0:422:50d7:100c with SMTP id 5b1f17b1804b1-424751761demr15226915e9.14.1718799623950;
        Wed, 19 Jun 2024 05:20:23 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de62fsm266329885e9.38.2024.06.19.05.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:20:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-tornado: Upgrade 6.4 -> 6.4.1
Date: Wed, 19 Jun 2024 15:20:18 +0300
Message-Id: <20240619122019.529213-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619122019.529213-1-leon.anavi@konsulko.com>
References: <20240619122019.529213-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 12:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110965

Upgrade to version 6.4.1:

- Parsing of the Transfer-Encoding header is now stricter.
- Handling of whitespace in headers now matches the RFC more
  closely. Only space and tab characters are treated as whitespace
  and stripped from the beginning and end of header values.
- tornado.curl_httpclient now prohibits carriage return and
  linefeed headers in HTTP headers.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tornado_6.4.bb => python3-tornado_6.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.4.bb => python3-tornado_6.4.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.4.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
index b01c1cec2..30b50f24f 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "72291fa6e6bc84e626589f1c29d90a5a6d593ef5ae68052ee2ef000dfd273dee"
+SRC_URI[sha256sum] = "92d3ab53183d8c50f8204a51e6f91d18a15d5ef261e84d452800d4ff6fc504e9"
 
 inherit pypi setuptools3
 
-- 
2.39.2


