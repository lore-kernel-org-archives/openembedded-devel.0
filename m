Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941A4FA3722
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:21:08 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.67539.1726208462267442902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MOdcl6rL;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20696938f86so15586025ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208461; x=1726813261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ds2XUqsJOU7HRumV/Pta9sC7NHlYv9sNMh1Emx1/+o=;
        b=MOdcl6rLsaZZeK0Z8EcvwR4zb1wUjzyGeb2MKYRzDZ7YFuHkztlYhXJop0QKWbwuCy
         zY3zmi2ZKmW9lT/hlnioxpJgf9Gw1YPTXdbtzFOz8OsuM0GhUS3StTXtdQ8aCEaDp8HT
         qJVajuV5IhwMCOJHxgI5CD+WwnS9qs5/cXfj8g0Td5xv+yk5vyIFrnBe8SBTe5cTJdFX
         kt8S/comPkCGoNCnb3rkIPZwReeafa8Aph3IKXY9AH01okXGKU3gta4/CBcmNhFkBDXh
         /ERIso5oLA5zhTpowNkjggiVxry6ZvANRWbQuGo15aixIK7frhLyIVEoB4NEo6rfiVQe
         xdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208461; x=1726813261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ds2XUqsJOU7HRumV/Pta9sC7NHlYv9sNMh1Emx1/+o=;
        b=rwPNVKkh57VZSro0sPSWKQRktrGWXPw/JWNEhnN22ZI7NQJpeJFP4ABkjt6k9xUg2H
         HP3R55Ky3V3yt0SoS2M2QpfpLpCz+nF4oQgC3WpYjyShgq2oOj58TiXIortLPp9hMNJn
         +FIUF+Nz4WupxjlW0wYLU/QMzuw0gB/fnI9aFSeAWuLxLnvIlL11oyFHqaa0+h3/5vfO
         0CA0zwvWK89u9EYkzibePzXhZ8wTv8hQ59l99ob4UHMEwHHiKzdp78po9udIwDNnKQCJ
         wmoP2XugX4oXS/Gb5ELLLWZFNX9fPLK41a8P3BUar+CPLFxX4GBS4M8pE4xY4Jw0C0is
         S/yg==
X-Gm-Message-State: AOJu0Yx4/jQZczha/Svoil5Hq30oUF8mgX6YsVm38IpavORqj3S3ctbL
	mhIGBzIkpxpdCfKlcNOUAaNpz0WGteVy934WUfbYEv0DqwTk3Tiu0voYXI+C
X-Google-Smtp-Source: AGHT+IGZxmF6EehmoCal+YlzRHfp9j3jyBB+6u2fanIvJtDDTH8yujf2HyN289EnIGGxAWewPmrf+w==
X-Received: by 2002:a17:902:d2d1:b0:206:c5cf:9727 with SMTP id d9443c01a7336-2076e39a4d1mr80576675ad.31.1726208461460;
        Thu, 12 Sep 2024 23:21:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:21:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 10/10] python3-flask: Add missing ptest deps
Date: Thu, 12 Sep 2024 23:20:50 -0700
Message-ID: <20240913062050.2597921-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913062050.2597921-1-raj.khem@gmail.com>
References: <20240913062050.2597921-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112269

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask_3.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
index 98e773008c..de755dc294 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
@@ -28,6 +28,10 @@ RDEPENDS:${PN} = " \
     python3-werkzeug \
 "
 
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+    python3-unittest-automake-output \
+"
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/tests
         cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/

