Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D549C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 19:33:48 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.27574.1712864022052921710
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 12:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mpoPpaMR;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: geoffhp@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5e8470c1cb7so125085a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 12:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712864021; x=1713468821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=te/EUsf1lL7kfKzybJMCbvITLpiCNGWk2syzyu08zJc=;
        b=mpoPpaMRAdk6vWjTNAEij/42Mm8pzfIzXE6C5Qzx2ZENWRfVZkeqZT73U1ZdlURH8G
         Lu7Rdch5+7KR08YSalTx5A6rGXv31ymfxVreN54i4QzgXOfMyDkQ1+LF3lXrG28n2LUX
         o8CFT4PNKNuZLMOHppSR+6+ot8XsnHdPwbON5LdUO1RTufMAVJ5e05YqyX9staTF5pI8
         8s5mC+0GrKOPVwaTkhXehFAjSPzZsIW5QY4jk5+gj3bfkS13tBVx8qYicI07bBxZJJAA
         QOicOwteZ64biNAMCpJ1vGOLm2TRKCqZUnXZraBtdF5+Xm6eVfmawInbyiGTSq4JKUkq
         cRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712864021; x=1713468821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=te/EUsf1lL7kfKzybJMCbvITLpiCNGWk2syzyu08zJc=;
        b=QRmMFQvM+nfid9TX+0wlzN8gJ/GYQ2kVYBBHNUzQSmJWodSRtbgrg8Hw/UkFfaij9Y
         kkrYmg1K6iCs9zvg/+0gIbmiKtY6rMHCKWOR/1OE9W0VctV71/SY/2ENdraKGHw5pQN9
         roatUr7rW38gGQU9JHwjUYXIfVkXbOl7gI/62jwvtg914zvx+ytw2LtK9MuQbNvGqftq
         tE87guf6o19o9P7Z/5nti0duT2u0SVj265lhdRGg1YJsT96JakxPyIMW246qx+UUXWmi
         5tgR/slczfoAVrrgXuiGs9rBvrnAcwNVpB0tuqMVFR9jrMwCrRRZr8rB5Y818YBg63C1
         A5Zg==
X-Gm-Message-State: AOJu0YxLBC1tIWWHeN6lSODPSLFi5RiQ2gqw1k7kS1IISbqivNcYv79s
	QfduTuoIwElOLX33TAWIUOaNKFEFhB7SmTHLiui3Nz1QdsBqRiZcM5iiMA==
X-Google-Smtp-Source: AGHT+IE4LepXeN9P6+Ku/Qe0N2n2UQjQ+nEqkEIqpdQ5X7KfJowPsCnVmPvum42l8ty41LEdn4Y65Q==
X-Received: by 2002:a17:902:6f08:b0:1e3:e022:1dd9 with SMTP id w8-20020a1709026f0800b001e3e0221dd9mr350361plk.40.1712864021182;
        Thu, 11 Apr 2024 12:33:41 -0700 (PDT)
Received: from localhost.localdomain ([23.241.67.81])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ea8400b001e26b7d3e8dsm1526562plb.266.2024.04.11.12.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 12:33:40 -0700 (PDT)
From: geoffhp@gmail.com
X-Google-Original-From: geoffrey.parker@arthrex.com
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-python][PATCH 2/2] python3-pycurl: extend for native and nativesdk
Date: Thu, 11 Apr 2024 12:24:56 -0700
Message-Id: <20240411192456.2974073-2-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411192456.2974073-1-geoffrey.parker@arthrex.com>
References: <20240411192456.2974073-1-geoffrey.parker@arthrex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 19:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109925

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
index fb2a41d26..a6863e21f 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
@@ -17,3 +17,5 @@ SRC_URI[sha256sum] = "5730590be0271364a5bddd9e245c9cc0fb710c4cbacbdd95264a3122d2
 DEPENDS = "curl"
 
 inherit pypi setuptools3
+
+BBCLASSEXTEND  += "native nativesdk"
-- 
2.30.2


