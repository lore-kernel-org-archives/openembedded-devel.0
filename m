Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DBEEEEC39
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:20:58 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.67532.1726208456918800479
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ehuvXr8B;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2053f6b8201so16824375ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208456; x=1726813256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ExyL6Fyp7Kb7EsPLhk7YOZ0gYTf8zijItIVThDMi9g=;
        b=ehuvXr8BZW6KqidhvYByuzpxZCESBMJfVnaDWYEJOr4TD+Ykwgwz1C7JMQ6i6y+lQH
         qjQC//QXjkfzfbOln2b7XYVUIf30F1Ugf/pouRFpKTumDVXUjmM8ZXf+3Gk0O+PeNklf
         /HTTu3v4LKMpkSpjcSwUzdUEMv21SrCrzGs1Vl1i/gvsAaoFp+PDl9LulHYGBveX5mvp
         1NTuXU0y6EUgxNs3vWBA2lNz7Cs24smPmP0Dt/gZnty/8hYC3DWgC44baDtBxw5eYuxj
         /fk5lepIYijlELG+WykLr9ZKt7sk8WFFSCv0e0UV6PXcStTQ85fxf04UWFC4QQDprzL/
         FDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208456; x=1726813256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ExyL6Fyp7Kb7EsPLhk7YOZ0gYTf8zijItIVThDMi9g=;
        b=WX9VxaOf+sBCPtohzfsm5I2XUukSRyyEPeBdOuWQDpy/HxQp70Cmk59QqiG4F7zqFX
         MRo+6ZEOsQh9q7x+ltCOzEsQgtFuBQ9Iq1+NNDwxEYi8Z2yypp5uPfb6usTPLAr5YKR9
         /mcRPk9tIfHWGGtszh909Z0waSGAXq3YUYhCCtRkYUUrJ0vt+PY9zcO1Y+AemOIewol4
         ctIjyA4VyIgfseFJ+w6M0lpqop7ClvEUhHvU9zaNz9mkRL/Q7jFuA25n7CI2ZELlB1OY
         FAdYAb204Fj8GkDJDWiycM0Z/g9EKeHxYBnorb+SNrGVCkcDcYrLr6wogzcyzJW523Jt
         9Sdw==
X-Gm-Message-State: AOJu0YyJOz4EeMUQDVXG1A5FIne1eaj3JJ+50xCpMqVQBm/ssru01WP4
	6uhEokQ1N5qNAHfa2gP+cF/pVrh31hYdPv2fu89UwTLQO0WPpYKFEV/Yv0zb
X-Google-Smtp-Source: AGHT+IEFwnGMlmbzjdf2uWh3r1iYlB3rK9U5r4nA8wvaQIUUnS1JHqK832DKcgjzDTBG1qLmHPZE8g==
X-Received: by 2002:a17:902:ea03:b0:202:4b65:65af with SMTP id d9443c01a7336-2076e4236afmr86939785ad.52.1726208456061;
        Thu, 12 Sep 2024 23:20:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:20:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 04/10] python3-trustme: Add missing ptest rdeps on attrs and six modules
Date: Thu, 12 Sep 2024 23:20:44 -0700
Message-ID: <20240913062050.2597921-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913062050.2597921-1-raj.khem@gmail.com>
References: <20240913062050.2597921-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112263

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
index 21161a0e0f..dab18f28b6 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
@@ -20,10 +20,12 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+    python3-attrs \
     python3-pyopenssl \
     python3-pyasn1-modules \
     python3-pytest \
     python3-service-identity \
+    python3-six \
     python3-unittest-automake-output \
 "
 

