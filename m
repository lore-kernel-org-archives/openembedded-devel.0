Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB28C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:01:52 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.4328.1634338907635319573
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=MEF/EK3A;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id x27so48058031lfu.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7XL9rF5GdA/dpOV3fqHe4F8SY638NUjMleU19msxLI=;
        b=MEF/EK3AycYCcQ0Ou1BsPG085rHF8y7xZV/u2GiE5e6CKSn3kFDWFqAiAeuRUduLBq
         Wf+yULlyoa3rQ5sHQAh7AlooddPjYIoDhxNqavBsKcR59ICrLWURDh3Ac/Xplg/BMqBy
         whkX9vWbT0OnfMHkhPV+kp9im2EZJGBHBJQS0Hjcg9Y6s57zyCKfEMBW/b0XV+vLG9Fh
         KE4BuxHioRi+R7bua1RVIwZ0+QqO5tG8wN3KARJNlma+dB5A5nvcnPvHCPE7LxwZT6qs
         yU6fs7G+p880O4bRwImycGOa5renRD0WkTuAiEXVC7Cook69Vvtdufjv4sim7SpHoFRG
         YDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7XL9rF5GdA/dpOV3fqHe4F8SY638NUjMleU19msxLI=;
        b=16ClwEGvHSnHHm5vecdjmPFov9pelaePcP4DStSVKcBghzUF/t4ygNorIw6SmCTy3V
         ZSBFejOtaIpHOp2ezee4BTejSmp5PBZWEhK68977O/S30OLWO28gontmIRgp77MU17M+
         2Gz5kmtzUwYoP12Kfr+pAQbMjpfGULd6z3eekpn9padB2eWWe/4ZlL5tBTKGUBsab/VI
         +CGsyGnojAtJ3yyZCbwI0wxKYWHZXMrnIHdvlvu0aff68ALLH2JDMDYqSBo3lJyMwZy3
         o+8V9e512c6XD+JB3jozrw8E6k4gXiSg0KxknY3yJZOCF77DC4jQ2YIQ0XOk/tsdD+6l
         dOig==
X-Gm-Message-State: AOAM530dc1XkOalQc+52kTb/Y0/X5zWSVhHPidsGKl1ezTmeKrUPO4CR
	/h1wBlNIA9Xj5uMzLZBL3ycHar0iT1t+XuzU
X-Google-Smtp-Source: 
 ABdhPJwnKloBa/RhRlUoedzcIvbaVp0WjTBMCsION0gz/ib0ld9wq1tOtxErLjPGjWIrTzYFof0l/g==
X-Received: by 2002:a05:6512:952:: with SMTP id
 u18mr13975666lft.516.1634338905177;
        Fri, 15 Oct 2021 16:01:45 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 r3sm658931lfc.114.2021.10.15.16.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:01:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-flask-user: update to 1.31.1
Date: Sat, 16 Oct 2021 01:01:42 +0200
Message-Id: <20211015230142.4165370-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:01:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93375

License-Update: license file cleanup.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n3-flask-user_0.6.19.bb => python3-flask-user_1.0.2.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-user_0.6.19.bb => python3-flask-user_1.0.2.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
rename to meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
index fbacf2e99..d050d66dc 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
@@ -4,10 +4,9 @@ Confirm email, Login, Change username, Change password, Forgot Password \
 and more."
 HOMEPAGE = " https://github.com/lingthio/Flask-User"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5aabce758ead32427c145173bc555403"
 
-SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
-SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
+SRC_URI[sha256sum] = "c9785febc2fc7ca15c69cfff1c8dabc2788f25043b54a33f73a6c2a9daf7fbe4"
 
 PYPI_PACKAGE = "Flask-User"
 
-- 
2.25.1


