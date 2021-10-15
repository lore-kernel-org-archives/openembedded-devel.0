Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A198BC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:56 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.4322.1634338675127834038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=vtfcVoju;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id x27so48026984lfu.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qEs27GfJRoqXPo01AFdcHJnEgbCDAELUud5MYJa1MtE=;
        b=vtfcVojuI17Pwh8tpsbVqP007Il8Ws3j50ZIwGP6sV/3hzfEFfdnR1L6i9LxqfSKxO
         4tPEj7MCBbfd1g6AIHBdiAJ6Aj5T18F7ejfRc4uETFgFp9jHOxK4nzqJOL12Uxk/f9p+
         HvAXaGJ56Q47FIsStxEClyp8rWVfykZ3YsBxr7DDcs+xQEBkwY4LhBZ8n+8GOaCb7Tn4
         xaADBT+aJdgEY1hyP0xVFhzR/+MgmnJBChLgxq5dRWffQdQhAC6mQN6EYLY7LefJ0b58
         WifXuaro8eByPNJdn98VrfXleVMj5gyDXz3Q4w0xGVBACnUG3FWb4/kieoBbUHlt29WU
         +UhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qEs27GfJRoqXPo01AFdcHJnEgbCDAELUud5MYJa1MtE=;
        b=cu+p3Zmh11KQ9VUqeWX5C7mXN29HT/57qNF5mNxHi2PCYI3Wfl+9jWlZFLPd286ouJ
         2FOhsrI4qsRqE/eVWASk/LI/bwSk6epxRfV1wsT5V8eAN+M78O6du9C+Oe6XJn58c7hh
         7ivuycENvVCJ/3FgjOs8z3PglkY/BqAaNrDcPC9A0ucsRFB0iiisv3V+jTCWzbvs7eOu
         WTJuXfgNgCPX4aYWm92m96BHc/m0JGU8K0GNCETxHZM1jey5WgLdjyt9L4j6GuHWHa/Z
         Ru9EK/hoQQuwEL6Lm1CLHXmaG3BsmalNHBhpF0idktYMOphfg3DXG/xmctqSw2yMAVJ1
         S6NA==
X-Gm-Message-State: AOAM5332x2J3eRsG/xqOX7kmrOhHhqQc572Q4N7Kmc7m1mG9BsaVMNCz
	OVw4J10+dFVxScvfYkLTcTW+R2yuGRH49nDx
X-Google-Smtp-Source: 
 ABdhPJxq05crYrQ1qM9HF3sQ4Hq6cBNGpr3szpRHDz8UOSbiHetasO0gtCI0pFrSo1YHogkyYBGz9g==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr14107158lfq.9.1634338673241;
        Fri, 15 Oct 2021 15:57:53 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id e4sm655858lft.77.2021.10.15.15.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:52 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-google-api-python-client: update to
 2.26.1
Date: Sat, 16 Oct 2021 00:57:50 +0200
Message-Id: <20211015225750.4164138-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93373

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ent_2.19.1.bb => python3-google-api-python-client_2.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.19.1.bb => python3-google-api-python-client_2.26.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.19.1.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.26.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.19.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.26.1.bb
index 564058e98..ed3214f2f 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.26.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c89b345615188fbd525f52d59013156ad3bfd1023af27041f2dec3d7877ba112"
+SRC_URI[sha256sum] = "66389e23fdd23dc7fabf3235afc4bd9bf4d1332e960aa7c058f17ea8848dae35"
 
 inherit pypi setuptools3
 
-- 
2.25.1


