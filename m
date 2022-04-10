Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B35C47086
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.21905.1649623256926806616
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=ZMk4GoV5;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.47, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f47.google.com with SMTP id d40so15848552lfv.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6rugxim1T/hos1YTkSp1+6UG8SoL2BS+9ZktIPgkFs=;
        b=ZMk4GoV5bOx+xepsExepADSV2ey1pKR9Q5/04AOsk4tyRhZM/DEPiwxH7OZiqplUp5
         Z+Y45AXULbilimEwnj5FxEmgd9MaTz52yfXa1dN8brsld/JmERBf0G7zXQgv2uXiysnU
         yR5N/opgk4CY42z+3UkbPB1zDguiUWxJHMpGAAWXRHm2ntI0OvpfRQVU6rtjCM0ujih+
         RjodLHJl0LsTRwtFWHLRksZgCuIwl30lAFnt2r1t6sBaSrnm0mCE414X+yEXt/tizYSo
         1MfknuVLxzUQsc9+yLW8nIwfiFABrlfNZBdIKFaSeqTxTXfGiDdCGHRIOVnqq5wD5/Em
         lcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6rugxim1T/hos1YTkSp1+6UG8SoL2BS+9ZktIPgkFs=;
        b=iSXKRvp6oXNWnAcxBrsr5gNh3iDUTJjQb7kXyZDNaz/i5CPVkI0VStYdwUk1J0UzRF
         3tNMi0AdL5TGSs8iztJKBvqeXZNa5mRqxh2LmEMqHeS/RhghJ7oHnRRN0jHnlJOr6EE4
         qnaOodHLfy00AttKxtfAG8GfBOO/7V6yBEuLXph4e0ObkuANT9gB5v6fZ5oBoitSogAk
         DDxXMwVdrHI5aAwKFLOptSB9d5CqWIrQ9bKZDfrk05AZzxvIqoJxRGN2Y4dgq2p8qT1Y
         7wu7h+Hc5FyuKy8eC0YhuwYDvGC2z0q5kY0vIL7yL9x8jcpJib4i6c9OpFDw+zXUR6EK
         P/Og==
X-Gm-Message-State: AOAM533ZKbvE8AvL07Rg6EMckWRtF5KDEoSXW9c2QC7DqXSvA9a0qEpf
	AS+w6z921MVjpyaBcqZRWZcsc+Lfm84B2nHq
X-Google-Smtp-Source: 
 ABdhPJxkN4KY50FiW4MLPJvsMyoWrVCl2igtIL4bqqiz5vhiwFUbpm2OZG+d+/lJB80Wt5Ax8CaI+Q==
X-Received: by 2002:a05:6512:3b25:b0:44a:108d:cc4c with SMTP id
 f37-20020a0565123b2500b0044a108dcc4cmr19978113lfv.36.1649623255009;
        Sun, 10 Apr 2022 13:40:55 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 x4-20020a056512046400b0046b92fe2023sm527285lfd.15.2022.04.10.13.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:40:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-sympy: update to 1.10.1
Date: Sun, 10 Apr 2022 22:40:53 +0200
Message-Id: <20220410204053.4043989-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96513

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-sympy_1.9.bb => python3-sympy_1.10.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.9.bb => python3-sympy_1.10.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.9.bb b/meta-python/recipes-devtools/python/python3-sympy_1.10.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-sympy_1.9.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.10.1.bb
index 92018698e..d8ac23dd5 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.9.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=42976c55ba05d15b32a7b4757dee5e64"
 
-SRC_URI[sha256sum] = "c7a880e229df96759f955d4f3970d4cabce79f60f5b18830c08b90ce77cd5fdc"
+SRC_URI[sha256sum] = "5939eeffdf9e152172601463626c022a2c27e75cf6278de8d401d50c9d58787b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


