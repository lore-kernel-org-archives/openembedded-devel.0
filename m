Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2F5C4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:45:56 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.3313.1706906751924431125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7beda2e6794so42514039f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706906750; x=1707511550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9JNctw5nzQp8WGuSLwKVyWOzOGE6kva98aj71Dh5as=;
        b=nNcLYvA+9CvHJDNEszcTq15TFMgn6Mzl1SsVTH7KS+aSHzBPUY0x55Ijd1rUL2IiIh
         kzYLs2MUHGga8u31hoi1iB5LErw3o8ieY9cL/pihzgGli/iFxDswk9wuoWCC3V17Mb14
         720oCcaH86WIj7E8SpeF5iuJAAPXtj4ppufGPwd3b0wwuQRXFv04FvE2n82IFbiTuscN
         8aBggM59nyJ4WKcOrITeuJhYvgEFomvuD4RlFiNol53WxCJSFYD/HdhCkj5wIJJiCjT3
         vr3cblgeWZydyayvOmSe/dF0qFWXcBA44WbHSx73u4WRXrCgtoYu0K4EsTDR5iS+9tV5
         DSrw==
X-Gm-Message-State: AOJu0YxrWWdcMzLOqMu5sx+JHwKiLA6gaZgj0/RG8aizSoQIIbKekQxY
	eyfg2PiM0bSEpnZdmXTst7Q1JgiUFHBvcO2zHxjksgMBXZiMQUuzjoakANFplG7VVA==
X-Google-Smtp-Source: AGHT+IGTCTfTPEelCw6o2v0kVih9G8etpu3zxdFQ2VyXWkmgH90NKxYnM1/kWwlKDMD4TiciHunCog==
X-Received: by 2002:a05:6602:168f:b0:7bf:f2b6:7538 with SMTP id s15-20020a056602168f00b007bff2b67538mr208723iow.10.1706906750692;
        Fri, 02 Feb 2024 12:45:50 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id g20-20020a05663816d400b0046f3b865e63sm645153jat.178.2024.02.02.12.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:45:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2] python3-platformdirs: update to version 4.2.0
Date: Fri,  2 Feb 2024 20:45:42 +0000
Message-Id: <20240202204542.1585309-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108547

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...hon3-platformdirs_4.1.0.bb => python3-platformdirs_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.1.0.bb => python3-platformdirs_4.2.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.1.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
index b4fb9356c..ea25f878c 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "906d548203468492d432bcb294d4bc2fff751bf84971fbb2c10918cc206ee420"
+SRC_URI[sha256sum] = "ef0cc731df711022c174543cb70a9b5bd22e5a9337c8624ef2c2ceb8ddad8768"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


