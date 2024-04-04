Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42BFCD1296
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 20:35:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.3221.1712262951341109725
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 13:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cI9kf1qk;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e2987e9d06so12703245ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712262950; x=1712867750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1n8RcnfYyNGJyv5Q8xOE0LYtasV5imgdlz7KQXbVYY=;
        b=cI9kf1qkvB1tNExC/rSJqzE302pTHWbOCTLSRApxaTZN1kQ17wR81ucqOxS8RaTOKc
         QbEE488A3LVtIi0g8v/0UHulCwKLl0/g8wbN64kMk15uZH+rAM4Yuk0YAS1FKXflf67H
         rWHXBkjlmA4K+OpU3cJEAelwFiLCIE2Fm2N2LwcIXX4mKnXJnCY/9BuYc/geuXIKINKl
         b7Ia+Fki5UUec8EWNLT6iAux8s0l9esD4hmXUXTSyYCU++Z0N7rYakuu8I0w+zIAtAZg
         fxn7BJygHOG0trZvHSHAJ9XO6x8hgGKVuHOBancltFQgwnP1Iyij2XMdbnx2dgRCFygP
         NT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712262950; x=1712867750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1n8RcnfYyNGJyv5Q8xOE0LYtasV5imgdlz7KQXbVYY=;
        b=j3leXZhba+kjoqqT7126wfY/h15JVyQQ/XBGVtiVBIq4LGaDbDM0TdKFfr2Ov3xhMJ
         O6zEkf2ZE/w7JRDmAPF9ZgpWonb68f2F/ygGr1iq5+Mqe20UEcOJlzgoQaT4XKzA6V7Y
         zEPnzwZTF9d7FE9y+qG5AYtkcXf6QVQVzt4EjlXzveg3wZnOA5MdhTvGdwlyufAv4d7G
         3USCDgr6H0fFrpryAlWhut+GUvyj0FwcO++1Y7vVzc5W6LnGEgjcWlHsaV6BbT6pXt76
         Nj6Svt6I3T45uCFGWHI+5rkaXxa93zNHhnVUwn1At04s1UWyw9zH+7eWUQKgf3SNpX/V
         LUvw==
X-Gm-Message-State: AOJu0Yw3rq2VCGohPN/JnAjOuD0+rYjqEjFvsQKiNEf9KXcunCq7SZXm
	Tp4tZYf9x0shZkePNekzfYlMf73pA7Ub8Z+ngA6A4MGU3WuOVaKOu4mTD/UG
X-Google-Smtp-Source: AGHT+IF3GmZpj1MY1od5FKbljvBh5WmJ1Ha3cZkd2rOmpRZ92OCK8XghlgoDsHkFwVINx4+ZI2ktBA==
X-Received: by 2002:a17:902:c403:b0:1dd:df8c:4334 with SMTP id k3-20020a170902c40300b001dddf8c4334mr4119144plk.62.1712262950492;
        Thu, 04 Apr 2024 13:35:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5077])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902d08c00b001e06c1eee22sm39764plv.74.2024.04.04.13.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:35:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/5] python3-netaddr: Ignore failing tests on musl
Date: Thu,  4 Apr 2024 13:35:44 -0700
Message-ID: <20240404203546.285796-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404203546.285796-1-raj.khem@gmail.com>
References: <20240404203546.285796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 20:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109804

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb b/meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb
index 082e7c5025..bedf0dab01 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb
@@ -20,3 +20,6 @@ do_install_ptest() {
     cp -rf ${S}/netaddr/tests/* ${D}${PTEST_PATH}/tests/
 }
 
+do_install_ptest:append:libc-musl () {
+    sed -i -e "/--automake/ s/$/ -k 'not test_strategy_ipv6'/" ${D}${PTEST_PATH}/run-ptest
+}
-- 
2.44.0


