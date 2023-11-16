Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E75C54E76
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:30:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.19900.1700173814855325275
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=IOtSKTS1;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40806e4106dso8319345e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 14:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700173812; x=1700778612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgIW1pfEs9LzwcqZl9SJx9auVOTQvkYJ+BxAAOcrx88=;
        b=IOtSKTS1bnh4/B6gtlVWlLLXFBQSLncDjM79MlUtDvLsOj+e63meUwOlq4+uW0Dpdq
         FgkfeFddTZLtfXqU/eTxMKjVQtJhtu64t1XKk2TliuSsfnsV8S6z15oCqKzcvG0GoUrW
         AickBHxLYq+6B+5kJX41koMzgMoHnNgfoxmdRx8HTBxhqyGzhHi6/pSsazP7luKq1KHA
         KHa16SyF/dimazPKB9/DzuHO+0yEA+Qfjw3fNMquFP0JaRq1S64RlGq+AgpkszLE/MXB
         ZRSNOm8mQBCgAfXjGm4ibyexf/k674nHiSw0+FgvV9xw0AHjqBg8mGPVajB7yBCNmQR9
         KaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700173812; x=1700778612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgIW1pfEs9LzwcqZl9SJx9auVOTQvkYJ+BxAAOcrx88=;
        b=erXtqzly3mNHEuMGxf+uh9USVX0Cy6DNSAI5bW6aYNk3k+iRcjgeTgvdpKgKDc5kV3
         dm5o6mXC+xZMf9dTAw/yAt54y13EdDZo1yyFDt5ehL+54kbVT8bTpa+YeG9hwwfMhE5S
         54lxr3a/KW19qhr2KCfQsakdaCtWqpZVqZiZbTgJhZOK1OFgG6fIdUPpZvvmJmKp1Mmh
         luzbrkK6VCaEue7GkehWL9/44iJAY9nlY3wigKnDHBviwZ3g/gD1vDitotvuAo4zLPEP
         1+XOkHC466VhBNlslByaClhaQiow+2i04Jy2+2+ENb7hxcPQU9xZ6w5v1B8IUf25OjNN
         z8xA==
X-Gm-Message-State: AOJu0Yz0DVlnQorsMuFQs9uV34+pxxeROjCbPi2tACTU8emwE50TJYjH
	tU6fOvC2HRzIc+qAxuhm0ugFtnv3zc3nZ9g8v1M=
X-Google-Smtp-Source: AGHT+IFps3Fts36o1eVAuCpS+u7ocs2fZZyXW+Ft4xwg1U1pMOTD/vJ1p84CbcQsETaHNcq9qXU2/w==
X-Received: by 2002:a05:600c:310f:b0:406:44fc:65c9 with SMTP id g15-20020a05600c310f00b0040644fc65c9mr2899402wmo.8.1700173812563;
        Thu, 16 Nov 2023 14:30:12 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id o20-20020a1c7514000000b0040303a9965asm4895535wmc.40.2023.11.16.14.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:30:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH] python3-soupsieve: Break circular dependency with beautifulsoup4
Date: Thu, 16 Nov 2023 23:30:01 +0100
Message-Id: <20231116223001.425992-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 22:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106842

python3-beautifulsoup4 does depend on python3-soupsieve but
python3-soupsieve does not depend on python3-beautifulsoup4.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
index 585613dd5..42c07fb4c 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
@@ -12,10 +12,6 @@ SRC_URI += " \
         file://run-ptest \
 "
 
-RDEPENDS:${PN} += "\
-        ${PYTHON_PN}-beautifulsoup4 \
-"
-
 RDEPENDS:${PN}-ptest += " \
         ${PYTHON_PN}-pytest \
         ${PYTHON_PN}-beautifulsoup4 \
-- 
2.30.2


