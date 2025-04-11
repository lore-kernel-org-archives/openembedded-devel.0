Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4E6C369AF
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:17 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.14150.1744332135061613537
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QGdIUN2q;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736b350a22cso1206000b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332134; x=1744936934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryRhy49rb7uZ5EJ4bYjPtRauYUCPnOjiqtA3pZc4OTM=;
        b=QGdIUN2qrlGf3JofZdSGdDMfxiIOuD6dADZKcm9ERGFlHPZY9v8DbmrKOujAnuEJDL
         ZnUdMQGFGLzPckFezFUQxVoEAyUTYpa9WXqEfClrwGG5X80SCmdnbiHk4ZZ68zTfHRzn
         +YGOuEV7h0O4vDk79knM8fxbGuNtM3Z3Tl55fhG2wuu9ii+T0Fe/LMDeZiSKagfL/Ql8
         nrH7T4raNHv5hnkDH6dLCK4J0WsPdGMs2xSARO9sI6ZMYOWJnlv0FIKA067zibWmF3kH
         X4ag6ylgun8gxwVK6suwS6g0/t0mHfi4McfKtq5Kk+EwLDS9ADiwLCe+HhVKbYoTEP8R
         ac8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332134; x=1744936934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryRhy49rb7uZ5EJ4bYjPtRauYUCPnOjiqtA3pZc4OTM=;
        b=nKKM1sXBUB3ZqyH75Gh6IoAXgjHbcfDNX3vC+/Avp4C1oSxZn4AVsL+Wwix3+TZFg5
         b5/FBWjNl9U5EGCQbj7E5b8oZXT8zHlChcViEmnMZAa1LQIXD5TW6RvoKTGg+hERv8tz
         /23LbkUJo/6eycBvS+WIHYnr5XPudHoHzzkwIKaJQkbWfFjhIQAAV7AICbU79hhByytR
         qkFLRmaejqBAvAyCpHFamGVRBtxMjj4vZTcnLB9ERP9tCDbgI7ZkXrCva+qtw7N4Dc1Y
         w96pizuFxMtNy3Xh5gNKtaHHDTgsWFpPuHCLyo2sNRjxgq16JfOVHBmkYEKDSAHRRbLo
         +4RA==
X-Gm-Message-State: AOJu0YyA/mQhO9mX608s4Y3/bEnngLC+ptRhhu4x1+npaNGcvMRs4mWr
	/cuSHj1QTa447J7daCTRDdKLitcVGjY9UUafIX4yXXGrvh01eYv6RJUuZk11
X-Gm-Gg: ASbGnctpxAc9Kb0hiweDHuTHJTCBkcYK12VNbXqiugZvmghh+L0VYoan24i3GeQ6ZSs
	RWNb9R6kMRtxR10XBy8GA88FhRVgF+A9l77oOGf70Wz+FrdspNg92tNYklQQDcRGr1QR/mBVnwR
	bGYs4pm5ScHalprn7TIhs0mAGMPHo2GY9UdFEhnkw3AXM5UfLU7FFUqxzhISF/lJ53oGUyJ2fVc
	8bkgXxk9WNX5OqbR3sttRFfBYpEvlHzZsnR/DUMfwq3Cx1hINM/aG61Yvx5tdMwjlOHucnAOFfQ
	2R/7vGlbjPO4Mh/ghiksYPH6j663M8Nc
X-Google-Smtp-Source: AGHT+IHm1U2ws9wvLdPk1EIZ/1H9mJ2wst9q5L9+BcyUy0MB4b2es7K25DNWroVLMjMim/gkjZVo8w==
X-Received: by 2002:a05:6a00:14c6:b0:736:33fd:f57d with SMTP id d2e1a72fcca58-73bd126b42emr1058173b3a.17.1744332134048;
        Thu, 10 Apr 2025 17:42:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 09/12] python3-schedule: Switch to using PEP-517 build backend
Date: Thu, 10 Apr 2025 17:41:58 -0700
Message-ID: <20250411004201.3826913-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116783

Add and enable ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc        | 1 +
 .../recipes-devtools/python/python3-schedule_1.2.2.bb      | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 47a6430c96..99e0bfe115 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -76,6 +76,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-rapidjson \
     python3-requests-file \
     python3-requests-toolbelt \
+    python3-schedule \
     python3-semver \
     python3-serpent \
     python3-service-identity \
diff --git a/meta-python/recipes-devtools/python/python3-schedule_1.2.2.bb b/meta-python/recipes-devtools/python/python3-schedule_1.2.2.bb
index ecf6bfd4c1..c1be5f9e22 100644
--- a/meta-python/recipes-devtools/python/python3-schedule_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-schedule_1.2.2.bb
@@ -5,6 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6400f153491d45ea3459761627ca24b2"
 
 SRC_URI[sha256sum] = "15fe9c75fe5fd9b9627f3f19cc0ef1420508f9f9a46f45cd0769ef75ede5f0b7"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+do_install_ptest:append() {
+	install -Dm 0644 ${S}/test_schedule.py ${D}${PTEST_PATH}/test_schedule.py
+}
 
 RDEPENDS:${PN} += "python3-datetime python3-logging python3-math"
+RDEPENDS:${PN}-ptest += "python3-pytz"

