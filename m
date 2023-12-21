Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DF2C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:02:30 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.56215.1703178145697120996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 09:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-35fcd6f8accso3561235ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 09:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703178144; x=1703782944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8vcZb0H8t8N0IG/tCZ+mB2QaO3hn3smYoLyVDIQ6WI=;
        b=JWixtwTHT+0m0+WhUhGwOijaMCTG9/nq/ojF6gS2brmEYyVdX+NJnMsp5zzPtATGZL
         SbGgZCx4wGCYWv8NwedenAfpF29Ccw31cHxHM3UDRj/h7z+shFAitfZQMbPlDEqFVp4l
         Cxl2dZkL0JiiOzeBfaRAJL7dy7TG4q3Ndg5LP5zBzlvDgwhOcjo4KK0jGJFp/GWBzB4n
         oYr0p+jhzE5NF5BDHESxAWQjJWTv57yd57kbki9AZsmbWvyhOpFkdO+BOvw28TXfZQX8
         PVm06YtlQzgrC0nmUBG5HhI5U8W/YRjwH2LuMkNNOeQg/Mj/6myn7TVUB9mqPLUWcSU+
         jbKA==
X-Gm-Message-State: AOJu0YwyODayb8z2zJ8CkdfWdPngqiA+ueHTkTDu7XESC0XoU5O/UK3+
	Uu3dsuL/SXWr19Bk+zH6dIXCcB225QzQwQ==
X-Google-Smtp-Source: AGHT+IFtPfYtpW6bibIv+3xlRfHeX1Ow4QFwnkjSHv075U/6sHefAwbfxl6JMPi4dUZHWMcDE3kbRw==
X-Received: by 2002:a05:6e02:1a04:b0:35f:b59c:924f with SMTP id s4-20020a056e021a0400b0035fb59c924fmr8501015ild.17.1703178144575;
        Thu, 21 Dec 2023 09:02:24 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm583062jab.17.2023.12.21.09.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:02:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-flask-sqlalchemy: fix upstream uri check
Date: Thu, 21 Dec 2023 17:02:16 +0000
Message-Id: <20231221170216.3900138-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 17:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107724

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
index ecbcf16dd..56f63bf03 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 SRC_URI[sha256sum] = "e4b68bb881802dda1a7d878b2fc84c06d1ee57fb40b874d3dc97dabfa36b8312"
 
 PYPI_PACKAGE = "flask_sqlalchemy"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask-SQLAlchemy"
+UPSTREAM_CHECK_REGEX = "/Flask-SQLAlchemy/(?P<pver>(\d+[\.\-_]*)+)"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


