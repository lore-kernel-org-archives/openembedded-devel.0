Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D60CC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:12:50 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.1085.1703182366875598947
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35f89f18daeso3770425ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703182365; x=1703787165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+HEuoa6lnnYBtm+dt6IuZbV6TwbYfeAYQnttXs0FBo=;
        b=IsLRyw8hd8Vn/WES6AKnYNUw16/kTKuWAhcBytUQA7n3VJHz4Vtox9JAR7UPOF7aHx
         SWzRJb/hcXUTBqCNna1dozLqWoyI5yPeruLH4WXKDBjUoupfw/6CH9TMyryymE81d4AQ
         C7xpaAlaC/wZRYOofGJyERVqCd1ln4ibj8mqBJkbe4DX1OXyf3JJealzygCloSCRa0MG
         TlTf4gMLOw7CsCzVf4YosrPh21B6bZPhneik1JRqZOoyTmhyj0rtlhVMoHtDz8a74FWh
         +ABGTOtMXPd6wAzLsbnp/ObHSJ4V/jbISsnRYFmfS6AHQUALO6/I0NtNbor6Lz2P4zQB
         onSA==
X-Gm-Message-State: AOJu0YzCt8lakNXK+WDUm5f2fKy8vPguMniLqkEXY4VT5VrB81NNDoKO
	KhKLw9BpbQf63VM6++U2J7O9Swj8/u22VA==
X-Google-Smtp-Source: AGHT+IFcxlmAiZdg9arGazkNrBSA/p86wBE1qBe+Vg1k1+jF+HqmAPdXlmvol00Gl6tAOgDKYxcJCg==
X-Received: by 2002:a05:6602:158f:b0:7b7:c981:1002 with SMTP id e15-20020a056602158f00b007b7c9811002mr232912iow.19.1703182365331;
        Thu, 21 Dec 2023 10:12:45 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id y25-20020a5ec819000000b007b7ad8d8c64sm590232iol.48.2023.12.21.10.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:12:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-flask: fix upstream uri and version check
Date: Thu, 21 Dec 2023 18:12:37 +0000
Message-Id: <20231221181237.3904447-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107728

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-flask_2.3.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.3.3.bb b/meta-python/recipes-devtools/python/python3-flask_2.3.3.bb
index c8c8d870a..99a61f136 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.3.3.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
 SRC_URI[sha256sum] = "09c347a92aa7ff4a8e7f3206795f30d826654baf38b873d0744cd571ca609efc"
 
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask"
+UPSTREAM_CHECK_REGEX = "/Flask/(?P<pver>(\d+[\.\-_]*)+)"
+
 inherit pypi python_setuptools_build_meta
 
 CLEANBROKEN = "1"
-- 
2.34.1


