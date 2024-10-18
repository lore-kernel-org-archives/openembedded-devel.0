Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D580AD3E1BC
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.29963.1729278808299821609
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=njIp/rVz;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e35bf59cf6so34605167b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278807; x=1729883607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60T6c/T4g1GLLbx4x6aAScJxGPnV7MB60m9F07cWaRE=;
        b=njIp/rVzGF8JQSxH6xouJoAGKpvJBm6IHqnaYa7jLMo7CkmvlTJLPlQ/WL3efJl5LZ
         mx2mIkvCpuJP9WyfP8j/9AZDu0sz3pPXj2XZKWKrDEDImT69r3LBFeRV5HjwDa/PW3tF
         1ZJE1buI2AVQBwlUxMOrlEOw/qyRx9Ofo3rZ+JT9Y61rDVeXdDO8pQIi/nhYMIuJa9eh
         ELpIozZh4vNdDGEf3J3MZ+C2HpUAjkIFy9QINt0ZqYcpK4g1RWnQpNNE2JbRyASf7MSU
         MVCmTXlTcUFgu088FFg20u3tI88gJIvI2rI92RTz4KwajriklI/F/Cty+NNrsptClG3X
         cQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278807; x=1729883607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60T6c/T4g1GLLbx4x6aAScJxGPnV7MB60m9F07cWaRE=;
        b=Q+1HbAfSGiqVKpJ5iziVVYX8TDXo8D+DzbgcSKp92LxKLGq7QszhIIKr58zw1Ue9E2
         XoNF0h9vsukQWIUeQyMG4vMS44k7grGNxKCpAGCyLCApwPF6iEV3Rv9Uaz4wdVWnVzI3
         yxaZLg9rQoaxZqsL6GaiXTh1ctjdoqj3QrRhg9CacKGWdQMxt8ImfjXv9TQnkDMx9edA
         S2y8MEuSz2IVftYgs0piNUyUyupu3vwzLb6HJOWOUW+y3Z3xjvJqxmkFOtGEH9all3mw
         A6HNkjGqdkUY/2xPG6Jx8wH0sJ2XOLh4SXmTkiggxXErlvVuQoglStwViVdnWiuy5Lg9
         OLlA==
X-Gm-Message-State: AOJu0YxDkuRWQFD5RGZPYiP3VSTnjj+3S3bydGS+dB8HOzXEiv3nA5Xb
	lvSGpcCyIVhaNj2a0SUoEQQV39q7cR216/fFHteP1tG4G2Sfxarmh5j4mA==
X-Google-Smtp-Source: AGHT+IEwqkmf6z5YxRW7yfHnDCxk7QSlT80IzdvEfpzwiG2iuS4JqBgDyoZxox7Pvisp89nxc/38jQ==
X-Received: by 2002:a05:690c:6711:b0:6dd:c619:4cb1 with SMTP id 00721157ae682-6e5a3ae9939mr73904257b3.0.1729278806872;
        Fri, 18 Oct 2024 12:13:26 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:26 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 25/68] python3-flask-user: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:12 -0400
Message-ID: <20241018191101.25184-26-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113012

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index ac449361a..65be459b7 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -6,7 +6,6 @@ HOMEPAGE = " https://github.com/lingthio/Flask-User"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
 
-SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
 SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
 
 PYPI_PACKAGE = "Flask-User"
-- 
2.43.0


