Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DFBC9EC87
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32334.1768222820597532964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 05:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HvoKHJp5;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47755de027eso36561635e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 05:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768222819; x=1768827619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o58WEGOr0Z5GPWtZ+KN2PSj4ZXdfYCDpWR+HYjujstI=;
        b=HvoKHJp5eAsHdTNKVEhV+G0INOoFRf5kP2ysh2NUfLIzaGuxozph5t3BtK/Ol1TgXX
         pMJ/5vDKkycaU/OjSZxHWPtcIlBiAhkSnYUvNaeo7e8TOCLtP2QmBYmeihrhjMuLUFaP
         E/CP1l7PZfs8AKYaYBqRvIbHR6Hi5l9JfXA+WktODZQ3ASQQr1R9QrfIdY92+3+M8pyw
         gLwp+aP9QP0eBplg4fpLPX8+WjekouzOWpwTr85Btq0qnRExRIgPgl9sHHyldXy1OMIz
         SirWUiDz5fGOTyE8FY9eHyiBQIg81P8W1Qn/f2gXk3LDPs7+UpCW1sotbUvM+vRLppz/
         f/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222819; x=1768827619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o58WEGOr0Z5GPWtZ+KN2PSj4ZXdfYCDpWR+HYjujstI=;
        b=EmRGWBFe2SWHvd/1pyskGfL8ZF03FNvEx36FnOsnTy/93mQIiDNioJ3m9Inx6zm1Su
         HXlvVM7reblppGbKY7TJrnC+xyQKn/+ZLL4EpAX7kYPBSOQH2DZjDK2JhY4pjBnIrhMq
         LtSjRLFUpXRiF+FegxuQq0cz8nuu6hSPawxGPNcVQXIB/KGBHS+HjGKCMYn3tp9dZxyU
         61EzEoROtwulVDuqw9WPppQWK3eUp14bjDnemQPkyV+Gj/SF+iaQ9MJT2BhMso/vjI60
         UYufi2K1fR3BjU7Q8/h/dtl0KbtTtxzpCXV/1pYs71zyZoNNe2JzQoqtCXA/qa06EBYk
         /uXQ==
X-Gm-Message-State: AOJu0Yzs5j/qAPmr3JgbHPu8bAtmJBfz8Ub1BL3e3EB9wxH77HI35vsR
	U8+3h1Uz0BlV3N3NZbpQeqEZvMZsVfPyhjj8GoHzva8C1c6M0coHAlWUoZd+Ig==
X-Gm-Gg: AY/fxX5/Sh7eOJWkSMsUHctYb9juybWfN8AzS2REhVDeJbwNgTt89TLAOO20tuSv1yZ
	f0w9MjEt/FT64DY6AeUyLnSbdelLYgUrNeFwbNI4UaAlSmbo09rWPzc4A6cukaZBjBQbxCxViOZ
	JRmZyrGaqckbOs3Oknjjg3FrQV+p1xyoGkFhexkuo2GfkqxXGyiAFbYpOs9sV2ef8jhEIHU1hIt
	RxDSJwr1YTc05V2k6hbQQ9bQtX7BRpFQXO1Tm91dOZXgCsAAWnUdsiErsNc98xQG4wzPSMrcO+h
	j5ZPBUaLOlnxqExpJwh/JW2gBslf2Q9g6oiF98OeCfh7L8M6rLmwAF0Pzj0TafdpJQ8bcp6Q2nl
	tHYvFVLGCjM7L2EHQp4s1E4sLRJc4bBZO8A3wJ8PH5vI+LiIXSpre6HFI7sbmtjXg7a3/Xy62xY
	0spo2keNBM
X-Google-Smtp-Source: AGHT+IEysD0sHAHRqtMgVRlQI2sfSsIYSOlQwPK4rDhLsI7fI60AuYSc8eWphHm3ZFbUy8S24xMDUg==
X-Received: by 2002:a05:600c:1392:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-47d84b3863fmr200786305e9.29.1768222818248;
        Mon, 12 Jan 2026 05:00:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f695956sm363477295e9.6.2026.01.12.05.00.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:00:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] xerces-c: set CVE_PRODUCT
Date: Mon, 12 Jan 2026 14:00:01 +0100
Message-ID: <20260112130002.525598-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 13:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123383

The related CVEs are tracked with "xerces-c\+\+" (sic).

See CVE db query:
sqlite> select vendor, product, count(*) from PRODUCTs where product like '%xerces%' group by 1, 2;
apache|xerces-c\+\+|29
apache|xerces-j|2
apache|xerces2_java|3
redhat|xerces|3

Set CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
index 2819366dc9..102e329878 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
@@ -9,6 +9,8 @@ SECTION =  "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
+CVE_PRODUCT = "xerces-c\+\+"
+
 SRC_URI = "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar.bz2 \
     file://0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch \
 "

